Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1D53D6B;
	Mon, 24 Oct 2022 15:21:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2DEB88BF;
	Mon, 24 Oct 2022 17:12:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1666624359;
	bh=XynA4ysgfEg2/idRBdKxuEVP9aT5qllM1ojw2hUTpSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ufYo+6pP3UUZQMwQ+T7GXvYnXwNgM4htrPA+NCqg9RpoPEh2Gyb3uY/2Fz5E2ETbm
	 p46TiJyLWoQ/bGEi5Oxo65pn9do2Vcv6UAgP6/O3gZVNJs2MTjdVy0zmBbZLJpx0QT
	 m+aOT43JUTD7lxQOSSLj5bToXb/938sp+LQ4L92o=
Date: Mon, 24 Oct 2022 18:12:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Gabriel Lima Luz <lima.gabriel.luz@gmail.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: media: imx: imx7-media-csi: Fix parenthesis
 alignment
Message-ID: <Y1arTntXnJmyrMyy@pendragon.ideasonboard.com>
References: <20221024150744.72641-1-lima.gabriel.luz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221024150744.72641-1-lima.gabriel.luz@gmail.com>

Hi Gabriel,

Thank you for the patch.

On Mon, Oct 24, 2022 at 12:07:44PM -0300, Gabriel Lima Luz wrote:
> Adhere to Linux kernel coding style.
> 
> Reported by checkpatch:
> 
> CHECK: Alignment should match open parenthesis
> 
> Signed-off-by: Gabriel Lima Luz <lima.gabriel.luz@gmail.com>
> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index cbc66ef0eda8..9ad7205a3f2f 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -1704,7 +1704,7 @@ static int imx7_csi_init_cfg(struct v4l2_subdev *sd,
>  		mf->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(mf->colorspace);
>  		mf->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(mf->colorspace);
>  		mf->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(!cc->yuv,
> -					mf->colorspace, mf->ycbcr_enc);
> +								 mf->colorspace, mf->ycbcr_enc);

I think this is a valid exception to the coding style, to increase
readability by avoiding long lines. Otherwise, I'd wrap it as

		mf->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(!cc->yuv,
								 mf->colorspace,
								 mf->ycbcr_enc);

>  
>  		csi->cc[i] = cc;
>  	}

-- 
Regards,

Laurent Pinchart
