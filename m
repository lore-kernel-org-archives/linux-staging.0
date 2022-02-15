Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990731365
	for <linux-staging@lists.linux.dev>; Tue, 15 Feb 2022 07:57:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8255315;
	Tue, 15 Feb 2022 08:57:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1644911860;
	bh=M9ucpBbW77iBzO+bROGqdVFmWgUTEjE6u+Yad8gmBFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VBvH9nWqyZS82mjoadB1pYAFLHHio7BFcHg296IMKuPWU4UQJCZk7GBX4iDtXZ+o2
	 Jqx96trKq5H96YSg8zPMW5kBHJKB1w2sScWr9BtypQ2jRJ9aDpu3pCUh3z5dttjurk
	 5rLGmp7hArP+pisKXKyrUBxi+tTkWTpM2I3ML6xQ=
Date: Tue, 15 Feb 2022 09:57:33 +0200
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
Subject: Re: [PATCH v2 5/9] media: imx: imx7_mipi_csis: store colorspace in
 set_fmt as well
Message-ID: <Ygtc7cpzrOTssV4U@pendragon.ideasonboard.com>
References: <20220211142752.779952-1-alexander.stein@ew.tq-group.com>
 <20220211142752.779952-6-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220211142752.779952-6-alexander.stein@ew.tq-group.com>

Hi Alexander,

Thank you for the patch.

On Fri, Feb 11, 2022 at 03:27:48PM +0100, Alexander Stein wrote:
> Without this the default (SMPTE 170M) from init_cfg stays unchanged.
> Even after configuring 'srgb' colorspace (or 'raw')
> $ media-ctl -V "'csis-32e30000.mipi-csi':0 [colorspace:srgb]"
> the colorspace does not change at all:
> $ media-ctl --get-v4l2 "'csis-32e30000.mipi-csi':0"
>   [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:smpte170m xfer:709
>    ycbcr:601 quantization:lim-range]
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

As this change is independent from the previous patches in the series,
I'll take it in my tree and will send a pull request for v5.18.

> ---
> Changes in v2:
> * Store other colorspace-related fields as well
> 
>  drivers/staging/media/imx/imx7-mipi-csis.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index a22d0e6b3d44..388cfd012212 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -1062,6 +1062,10 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
>  	fmt->code = csis_fmt->code;
>  	fmt->width = sdformat->format.width;
>  	fmt->height = sdformat->format.height;
> +	fmt->colorspace = sdformat->format.colorspace;
> +	fmt->quantization = sdformat->format.quantization;
> +	fmt->xfer_func = sdformat->format.xfer_func;
> +	fmt->ycbcr_enc = sdformat->format.ycbcr_enc;
>  
>  	sdformat->format = *fmt;
>  

-- 
Regards,

Laurent Pinchart
