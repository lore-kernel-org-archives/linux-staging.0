Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979268C09
	for <linux-staging@lists.linux.dev>; Mon,  9 Jan 2023 19:59:59 +0000 (UTC)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net [192.222.136.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8F74A6602D6A;
	Mon,  9 Jan 2023 19:59:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673294395;
	bh=H174vEDV+J2zA47hFKfyVx3mBxvDGBXXMB4xDaIl3jc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=NMyv/Y0pm2WyOn7Fmeh4Zj4ilq/MCz8Fspuaq2lXBA2KeUFn/Jh9rVb0nMT7EPdLv
	 0NmQVDpZlRv1aaCFV+IL3+JmsIf9S+38xEMBD2Jz9t1fkMZsCnu5JVQscghsmGHG4W
	 cx4yr6WkIQ//0nIAFF5JLuLrlGyS2tZ27YlCQqDepMdUjND3FV5J9q1lw3Te2AXvrb
	 HA3SNTaa1v9TLE8cLjQ+oT2HuB/dpqCxFksXtqaZMLPPmvyzhbjnbS34DDCS6TT4IX
	 z8sV67orCNfBhj13An7SoSv/g/n+oNNrfRkA8K66ASXeNecMvQgK923WO10VNGHCMd
	 Qyq4IXJPg9rrw==
Message-ID: <8124d8751180393f8490fa3f754b1b674d7c06db.camel@collabora.com>
Subject: Re: [PATCH v2 3/4] media: rkvdec: Re-enable H.264 error detection
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	kernel@collabora.com, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Mon, 09 Jan 2023 14:59:46 -0500
In-Reply-To: <CAGXv+5GBhZ4U4y_KGrBdvgmy7odcVvH=ZJEMtsfjPvw4tQUV1A@mail.gmail.com>
References: <20221223193807.914935-1-nicolas.dufresne@collabora.com>
	 <20221223193807.914935-4-nicolas.dufresne@collabora.com>
	 <CAGXv+5GBhZ4U4y_KGrBdvgmy7odcVvH=ZJEMtsfjPvw4tQUV1A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Le lundi 26 d=C3=A9cembre 2022 =C3=A0 12:17 +0800, Chen-Yu Tsai a =C3=A9cri=
t=C2=A0:
> On Sat, Dec 24, 2022 at 3:39 AM Nicolas Dufresne
> <nicolas.dufresne@collabora.com> wrote:
> >=20
> > This re-enable H.264 error detection, but using the other error mode.
> > In that mode, the decoder will skip over the error macro-block or
> > slices and complete the decoding. As a side effect, the error status
> > is not set in the interrupt status register, and instead errors are
> > detected per format. Using this mode workaround the issue that the
> > HW get stuck in error state, and allow reporting that some corruption
> > may be present in the buffer to userland.
> >=20
> > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > ---
> >  drivers/staging/media/rkvdec/rkvdec-h264.c | 23 +++++++++++++++++++---
> >  1 file changed, 20 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/stagi=
ng/media/rkvdec/rkvdec-h264.c
> > index 4fc167b42cf0c..dfe3e235f099a 100644
> > --- a/drivers/staging/media/rkvdec/rkvdec-h264.c
> > +++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
> > @@ -1162,14 +1162,15 @@ static int rkvdec_h264_run(struct rkvdec_ctx *c=
tx)
> >=20
> >         schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(=
2000));
> >=20
> > -       writel(0, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
> > -       writel(0, rkvdec->regs + RKVDEC_REG_H264_ERR_E);
> > +       writel(0xffffffff, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
> > +       writel(0xffffffff, rkvdec->regs + RKVDEC_REG_H264_ERR_E);
>=20
> Use RKVDEC_H264_ERR_EN_HIGHBITS() here? Only lower 30 bits are valid.

I was simply reverting back to the value it was before, I can try that too,=
 you
are likely right.

>=20
> >         writel(1, rkvdec->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
> >         writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
> >=20
> >         /* Start decoding! */
> >         writel(RKVDEC_INTERRUPT_DEC_E | RKVDEC_CONFIG_DEC_CLK_GATE_E |
> > -              RKVDEC_TIMEOUT_E | RKVDEC_BUF_EMPTY_E,
> > +              RKVDEC_TIMEOUT_E | RKVDEC_BUF_EMPTY_E |
> > +              RKVDEC_H264ORVP9_ERR_MODE,
> >                rkvdec->regs + RKVDEC_REG_INTERRUPT);
> >=20
> >         return 0;
> > @@ -1183,10 +1184,26 @@ static int rkvdec_h264_try_ctrl(struct rkvdec_c=
tx *ctx, struct v4l2_ctrl *ctrl)
> >         return 0;
> >  }
> >=20
> > +static int rkvdec_h264_check_error_info(struct rkvdec_ctx *ctx)
> > +{
> > +       struct rkvdec_dev *rkvdec =3D ctx->dev;
> > +       int err;
>=20
> u32?

Will do.

>=20
> Otherwise,
>=20
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>=20
> > +
> > +       err =3D readl(rkvdec->regs + RKVDEC_REG_H264_ERRINFO_NUM);
> > +       if (err & RKVDEC_STRMD_DECT_ERR_FLAG) {
> > +               pr_debug("Decoded picture have %i/%i slices with errors=
.\n",
> > +                        RKVDEC_ERR_PKT_NUM(err), RKVDEC_SLICEDEC_NUM(e=
rr));
> > +               return VB2_BUF_STATE_ERROR;
> > +       }
> > +
> > +       return VB2_BUF_STATE_DONE;
> > +}
> > +
> >  const struct rkvdec_coded_fmt_ops rkvdec_h264_fmt_ops =3D {
> >         .adjust_fmt =3D rkvdec_h264_adjust_fmt,
> >         .start =3D rkvdec_h264_start,
> >         .stop =3D rkvdec_h264_stop,
> >         .run =3D rkvdec_h264_run,
> >         .try_ctrl =3D rkvdec_h264_try_ctrl,
> > +       .check_error_info =3D rkvdec_h264_check_error_info,
> >  };
> > --
> > 2.38.1
> >=20

