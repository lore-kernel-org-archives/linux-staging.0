Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E34A7C
	for <linux-staging@lists.linux.dev>; Fri, 10 Jun 2022 16:24:01 +0000 (UTC)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net [192.222.136.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C97136601721;
	Fri, 10 Jun 2022 17:23:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654878239;
	bh=PeNEbNWV7aaaxpnftZb7IJf8mfoEQ3cPkieNnhAQIW4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=hnH4stMAEriCwFmQZtGarrd55Yj+jXr4HpYuP/lvuHrC+WxKRtQgBz6qV+XoZgZOn
	 W0+ly466O4b8d8WEG//Retrz6r4kJdwDZEHX9D0DxZXQuajfKd42GythaKD30XvLso
	 FzGuTFrYW/02f5h94a9ID9cGh130lzlEDyFjGNVL+cpPoDW/DtRn20+DL7tUDz0kd/
	 w3ZSZ39kJ7BehSEvURr0BxQZQ34UaOMfpoNNljQpFHLB1kKlG4D1S3y1LLH8s9cW1I
	 VwKjYX/zX18HsyZLs7cTquvigMVH77WXNTPKOeOEIU6Pjji9Z7KQRHEUb9erqkZq59
	 wEEwzlgY0CIdg==
Message-ID: <0e2c5d37398eeb04576af3ca5012161255464b21.camel@collabora.com>
Subject: Re: [PATCH v1 4/5] media: rkvdec: Re-enable H.264 error detection
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-media@vger.kernel.org, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Mauro Carvalho Chehab
 <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 kernel@collabora.com, linux-rockchip@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Fri, 10 Jun 2022 12:23:49 -0400
In-Reply-To: <20220610132017.GD2146@kadam>
References: <20220610125215.240539-1-nicolas.dufresne@collabora.com>
	 <20220610125215.240539-5-nicolas.dufresne@collabora.com>
	 <20220610132017.GD2146@kadam>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1 (3.44.1-1.fc36) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Le vendredi 10 juin 2022 =C3=A0 16:20 +0300, Dan Carpenter a =C3=A9crit=C2=
=A0:
> On Fri, Jun 10, 2022 at 08:52:14AM -0400, Nicolas Dufresne wrote:
> > This re-enables H.264 error detection, but using the other error mode.
> > In that mode, the decoder will skip over the error macro-block or
> > slices and complete the decoding. As a side effect, the error status
> > is not set in the interrupt status register, and instead errors are
> > detected per format. Using this mode workaround the issue that the
> > HW get stuck in error stated and allow reporting that some corruption
> > may be present in the buffer returned to userland.
> >=20
> > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > ---
> >  drivers/staging/media/rkvdec/rkvdec-h264.c | 23 +++++++++++++++++++---
> >  1 file changed, 20 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/stagi=
ng/media/rkvdec/rkvdec-h264.c
> > index 55596ce6bb6e..60a89918e2c1 100644
> > --- a/drivers/staging/media/rkvdec/rkvdec-h264.c
> > +++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
> > @@ -1175,14 +1175,15 @@ static int rkvdec_h264_run(struct rkvdec_ctx *c=
tx)
> > =20
> >  	schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(2000))=
;
> > =20
> > -	writel(0, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
> > -	writel(0, rkvdec->regs + RKVDEC_REG_H264_ERR_E);
> > +	writel(0xffffffff, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
> > +	writel(0xffffffff, rkvdec->regs + RKVDEC_REG_H264_ERR_E);
>=20
> This reverts the changes in patch 1/5.  Could we just skip patch 1/5
> instead?

As documented, this is for back-porting purpose. The first patch is what ha=
s
been running for 7 years in Chromebook, so I'm fully confident it is safe t=
o
backport it into our stable kernel. The second is like a new feature, which=
 I'm
confident works, but didn't get as much testing as I just wrote it. So what=
 I'm
doing here is giving a same thing to backport, and a better fix for the nex=
t
kernel. You are otherwise right that this will revert it.

Nicolas

