Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC202F23
	for <linux-staging@lists.linux.dev>; Sat,  5 Feb 2022 04:05:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D293C472;
	Sat,  5 Feb 2022 05:05:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1644033915;
	bh=tp0ooT8eHqu9E2DtNBcIlUfXtbZ3KceXo0xZSMsl9AQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IYoE8dELkqa/Gtxz9uFwJGgxHBEp+AxTQ1z0PlcHunb8XFc8YTfq4aYzS9YzeaPoi
	 GewPRH8eOM/QufB1M5RP+BsN1iP5pOTotD8WZ8B1ff5CiHcG/y2+FKAMfrnc8maDJE
	 6EAcZabvaPmjb53da+YdklLHTynjxS7cs33w7ZwM=
Date: Sat, 5 Feb 2022 06:04:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] media: imx: Use dedicated format handler for i.MX7/8
Message-ID: <Yf33YviITGDnolHw@pendragon.ideasonboard.com>
References: <20220204121514.2762676-1-alexander.stein@ew.tq-group.com>
 <20220204121514.2762676-4-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220204121514.2762676-4-alexander.stein@ew.tq-group.com>

Hi Alexander and Dorota,

Thank you for the patch.

On Fri, Feb 04, 2022 at 01:15:09PM +0100, Alexander Stein wrote:
> From: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
> 
> This splits out a format handler which takes into account
> the capabilities of the i.MX7/8 video device,
> as opposed to the default handler compatible with both i.MX5/6 and i.MX7/8.
> 
> Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in comparison to original commit from Dorota:
> * is_imx56 is used instead of enum
> 
>  drivers/staging/media/imx/imx-media-utils.c | 56 +++++++++++++++++++--
>  1 file changed, 52 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index 0daa6aad45f4..32aaa2e81bea 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -516,10 +516,9 @@ void imx_media_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt,
>  }
>  EXPORT_SYMBOL_GPL(imx_media_try_colorimetry);
>  
> -int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
> -				  const struct v4l2_mbus_framefmt *mbus,
> -				  const struct imx_media_pixfmt *cc,
> -				  bool is_imx56)
> +static int imx56_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
> +					   const struct v4l2_mbus_framefmt *mbus,
> +					   const struct imx_media_pixfmt *cc)
>  {
>  	u32 width;
>  	u32 stride;
> @@ -568,6 +567,55 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
>  
>  	return 0;
>  }
> +
> +static int imx78_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
> +					   const struct v4l2_mbus_framefmt *mbus,
> +					   const struct imx_media_pixfmt *cc)
> +{
> +	int ret;
> +
> +	if (!cc)
> +		cc = imx_media_find_mbus_format(mbus->code, PIXFMT_SEL_ANY);
> +
> +	if (!cc)
> +		return -EINVAL;
> +	/*
> +	 * The hardware can handle line lengths divisible by 4 pixels
> +	 * as long as the whole buffer size ends up divisible by 8 bytes.
> +	 * If not, use the value of 8 pixels recommended in the datasheet.
> +	 */
> +	ret = v4l2_fill_pixfmt(pix, cc->fourcc,
> +			       round_up(mbus->width, 4), mbus->height);
> +	if (ret)
> +		return ret;
> +
> +	/* Only 8bits-per-pixel formats may need to get aligned to 8 pixels,
> +	 * because both 10-bit and 16-bit pixels occupy 2 bytes.
> +	 * In those, 4-pixel aligmnent is equal to 8-byte alignment.
> +	 */
> +	if (pix->sizeimage % 8 != 0)
> +		ret = v4l2_fill_pixfmt(pix, cc->fourcc,
> +				       round_up(mbus->width, 8), mbus->height);

I think you could simplify this by using cc->bpp to figure out the
alignment instead of calling v4l2_fill_pixfmt() twice.

> +
> +	pix->colorspace = mbus->colorspace;
> +	pix->xfer_func = mbus->xfer_func;
> +	pix->ycbcr_enc = mbus->ycbcr_enc;
> +	pix->quantization = mbus->quantization;
> +	pix->field = mbus->field;

Should v4l2_fill_pixfmt() be updated to handle colorspace and field too
instead of doing it manually here ?

> +
> +	return ret;
> +}
> +
> +int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
> +				  const struct v4l2_mbus_framefmt *mbus,
> +				  const struct imx_media_pixfmt *cc,
> +				  bool is_imx56)
> +{
> +	if (is_imx56)
> +		return imx56_media_mbus_fmt_to_pix_fmt(pix, mbus, cc);
> +	else
> +		return imx78_media_mbus_fmt_to_pix_fmt(pix, mbus, cc);
> +}
>  EXPORT_SYMBOL_GPL(imx_media_mbus_fmt_to_pix_fmt);
>  
>  void imx_media_free_dma_buf(struct device *dev,

-- 
Regards,

Laurent Pinchart
