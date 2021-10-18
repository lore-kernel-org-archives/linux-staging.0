Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E733C2C81
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 10:20:45 +0000 (UTC)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1mcPl3-0000Du-8U; Mon, 18 Oct 2021 12:20:41 +0200
Received: from pza by lupine with local (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1mcPl2-0005I1-UB; Mon, 18 Oct 2021 12:20:40 +0200
Message-ID: <7eed841351748709ec9a173532cd3db99139d69e.camel@pengutronix.de>
Subject: Re: [PATCHv2 3/4] media: imx: Forward type of hardware
 implementation
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>, Steve Longerbeam
 <slongerbeam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@puri.sm, phone-devel@vger.kernel.org
Date: Mon, 18 Oct 2021 12:20:40 +0200
In-Reply-To: <20211017102904.756408-3-dorota.czaplejewicz@puri.sm>
References: <20211017102904.756408-1-dorota.czaplejewicz@puri.sm>
	 <20211017102904.756408-3-dorota.czaplejewicz@puri.sm>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-staging@lists.linux.dev

On Sun, 2021-10-17 at 13:08 +0200, Dorota Czaplejewicz wrote:
> Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
> ---
>  drivers/staging/media/imx/imx-media-capture.c | 14 ++++++++------
>  drivers/staging/media/imx/imx-media-utils.c   |  3 ++-
>  drivers/staging/media/imx/imx-media.h         |  3 ++-
>  3 files changed, 12 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/stag=
ing/media/imx/imx-media-capture.c
> index fdf0f3a8f253..22208b7ce825 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
[...]
> @@ -184,7 +185,8 @@ __capture_try_fmt(struct v4l2_pix_format *pixfmt, str=
uct v4l2_rect *compose)
>  static int capture_try_fmt_vid_cap(struct file *file, void *fh,
>  				   struct v4l2_format *f)
>  {
> -	__capture_try_fmt(&f->fmt.pix, NULL);
> +	struct capture_priv *priv =3D video_drvdata(file);

Missing blank line.

> +	__capture_try_fmt(&f->fmt.pix, NULL, priv->type);
>  	return 0;
>  }
> =20

With that fixed,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
