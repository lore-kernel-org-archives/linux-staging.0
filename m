Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1F92C81
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 10:20:35 +0000 (UTC)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1mcPkm-00005Y-2v; Mon, 18 Oct 2021 12:20:24 +0200
Received: from pza by lupine with local (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1mcPkk-0005Gz-QR; Mon, 18 Oct 2021 12:20:22 +0200
Message-ID: <d1a0d97056afca0da8449757c6d10fd14f27dbc3.camel@pengutronix.de>
Subject: Re: [PATCHv2 4/4] media: imx: Use dedicated format handler for
 i.MX7/8
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>, Steve Longerbeam
 <slongerbeam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@puri.sm, phone-devel@vger.kernel.org
Date: Mon, 18 Oct 2021 12:20:22 +0200
In-Reply-To: <20211017102904.756408-4-dorota.czaplejewicz@puri.sm>
References: <20211017102904.756408-1-dorota.czaplejewicz@puri.sm>
	 <20211017102904.756408-4-dorota.czaplejewicz@puri.sm>
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

Hi Dorota,

On Sun, 2021-10-17 at 13:08 +0200, Dorota Czaplejewicz wrote:
> This splits out a format handler which takes into account
> the capabilities of the i.MX7/8 video device,
> as opposed to the default handler compatible with both i.MX5/6 and i.MX7/=
8.
>=20
> Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>

Thank you, I agree this looks better than moving
imx_media_mbus_fmt_to_pix_fmt around. Comments below.

> ---
>  drivers/staging/media/imx/imx-media-utils.c | 78 +++++++++++++++++++--
>  1 file changed, 74 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/stagin=
g/media/imx/imx-media-utils.c
> index e124dd722107..938db2e2ddb1 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -516,10 +516,9 @@ void imx_media_try_colorimetry(struct v4l2_mbus_fram=
efmt *tryfmt,
>  }
>  EXPORT_SYMBOL_GPL(imx_media_try_colorimetry);
> =20
> -int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
> -				  const struct v4l2_mbus_framefmt *mbus,
> -				  const struct imx_media_pixfmt *cc,
> -				  enum imx_device_type type)
> +static int imx56_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
> +					   const struct v4l2_mbus_framefmt *mbus,
> +					   const struct imx_media_pixfmt *cc)
>  {
>  	u32 width;
>  	u32 stride;
> @@ -568,6 +567,77 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_fo=
rmat *pix,
> =20
>  	return 0;
>  }
> +
> +static int imx78_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
> +					   const struct v4l2_mbus_framefmt *mbus,
> +					   const struct imx_media_pixfmt *cc)
> +{
> +	u32 width;
> +	u32 stride;
> +	u8 divisor;
> +
> +	if (!cc) {
> +		cc =3D imx_media_find_ipu_format(mbus->code,
> +					       PIXFMT_SEL_YUV_RGB);
> +		if (!cc)
> +			cc =3D imx_media_find_mbus_format(mbus->code,
> +							PIXFMT_SEL_ANY);
> +		if (!cc)
> +			return -EINVAL;
> +	}
> +
> +	/*
> +	 * TODO: the IPU currently does not support the AYUV32 format,
> +	 * so until it does convert to a supported YUV format.
> +	 */
> +	if (cc->ipufmt && cc->cs =3D=3D IPUV3_COLORSPACE_YUV) {
> +		u32 code;
> +
> +		imx_media_enum_mbus_formats(&code, 0, PIXFMT_SEL_YUV);
> +		cc =3D imx_media_find_mbus_format(code, PIXFMT_SEL_YUV);
> +	}

This whole part seems too convoluted for the non-IPU CSI on i.MX7/8.
Certainly the TODO comment does not apply. There is no IPU on i.MX7/8,
and the CSI does not support AYUV32 if I read the datasheet correctly.

imx_media_find_ipu_format() just returns the two IPU internal 32-bit
formats, MEDIA_BUS_FMT_AYUV8_1X32/V4L2_PIX_FMT_YUV32 and
MEDIA_BUS_FMT_ARGB8888_1X32/V4L2_PIX_FMT_XRGB32, both of which can never
be set according to imx7_csi_pad_link_validate(). So I think this could
be reduced to just:

	if (!cc)
		cc =3D imx_media_find_mbus_format(mbus->code, PIXFMT_SEL_ANY);           =
                                                                           =
                 =20

After the removal of imx_media_mbus_fmt_to_ipu_image(), the only place
where imx_media_find_mbus_format() is called with cc =3D=3D NULL is
in capture_init_format(), with mbus format code MEDIA_BUS_FMT_UYVY8_2X8.

> +
> +	/*
> +	 * The hardware can handle line lengths divisible by 4 bytes,
> +	 * as long as the number of lines is even.
> +	 * Otherwise, use the value of 8 bytes recommended in the datasheet.
> +	 */

The comment talks about byte alignment but then the code goes on to
align the width in pixels, which may be confusing to the reader.

> +	divisor =3D 4 << (mbus->height % 2);

Since this is not used to actually divide anything, I'd avoid calling
this divisor. I'd suggest "align(ment)" or something similar.

Also I'd expect that for 16-bit formats like YUYV, 4 pixel alignment
should be ok for any height.

> +
> +	width =3D round_up(mbus->width, divisor);
> +
> +	if (cc->planar)
> +		stride =3D round_up(width, 16);
> +	else
> +		stride =3D round_up((width * cc->bpp) >> 3, divisor);

This is probably incorrect, and the driver doesn't use bytesperline
anyway. I think  the following should probably just use
v4l2_fill_pixfmt() to set width, height, pixelformat, bytesperline, and
sizeimage:

> +
> +	pix->width =3D width;
> +	pix->height =3D mbus->height;
> +	pix->pixelformat =3D cc->fourcc;
> +	pix->colorspace =3D mbus->colorspace;
> +	pix->xfer_func =3D mbus->xfer_func;
> +	pix->ycbcr_enc =3D mbus->ycbcr_enc;
> +	pix->quantization =3D mbus->quantization;
> +	pix->field =3D mbus->field;
> +	pix->bytesperline =3D stride;
> +	pix->sizeimage =3D cc->planar ? ((stride * pix->height * cc->bpp) >> 3)=
 :
> +			 stride * pix->height;

regards
Philipp
