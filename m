Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170EF2F23
	for <linux-staging@lists.linux.dev>; Sat,  5 Feb 2022 04:08:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 36155472;
	Sat,  5 Feb 2022 05:08:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1644034082;
	bh=e1aTQvNM4hVzRyloYjTRlsEtW0afmvAm7HLX4Fs1Ma8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QSjTUQiwzZKyZA/WJv94gjiAUtdSJaR8wH1rNWJe++R4+j84rpLaxUO6GhyMGpkJ+
	 GWRFdDogOBRUmv9EnjdNJJrK7sVomBLuwFNTbKiI7tJj5hyVfdYF0hFY3BaXzgqZFv
	 pIu5I18goC5kTRPPrqP4/n2ZKgwZI2QpOtYQLk/Q=
Date: Sat, 5 Feb 2022 06:07:37 +0200
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
Subject: Re: [PATCH 4/8] media: imx: Fail conversion if pixel format not
 supported
Message-ID: <Yf34CXvZQPQPAxma@pendragon.ideasonboard.com>
References: <20220204121514.2762676-1-alexander.stein@ew.tq-group.com>
 <20220204121514.2762676-5-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220204121514.2762676-5-alexander.stein@ew.tq-group.com>

Hi Alexander and Dorota,

Thank you for the patch.

On Fri, Feb 04, 2022 at 01:15:10PM +0100, Alexander Stein wrote:
> From: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
> 
> imx_media_find_mbus_format has NULL as a valid return value,
> therefore the caller should take it into account.
> 
> Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/staging/media/imx/imx-media-utils.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index 32aaa2e81bea..e0a256a08c3b 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -544,6 +544,9 @@ static int imx56_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
>  		cc = imx_media_find_mbus_format(code, PIXFMT_SEL_YUV);

The code passed to the function comes from the previous line:

	imx_media_enum_mbus_formats(&code, 0, PIXFMT_SEL_YUV);

As far as I can tell, this is guaranteed to return a code that will
result in imx_media_find_mbus_format() returning a non-NULL pointer.

>  	}
>  
> +	if (!cc)
> +		return -EINVAL;
> +
>  	/* Round up width for minimum burst size */
>  	width = round_up(mbus->width, 8);
>  

-- 
Regards,

Laurent Pinchart
