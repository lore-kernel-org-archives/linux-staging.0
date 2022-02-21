Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27EB2581
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 11:26:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7074E482;
	Mon, 21 Feb 2022 12:26:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1645442814;
	bh=OhWw4gptuzuFJb38v+lDJdjiW6S624WaxLSzUncmQYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FkJ+qv9cIxwQQJlAbXtDyAtDkLU8CvradaG+YR96UzSl6ukPM+lx+QojtW+sb8e/8
	 j/C++x4qlaT6AUxCcbVAoRi4hV10FRSFBdmPvIs9L7uZrw0ttTIujwXJHHFc1aaLh4
	 4PI39bg0jxKGhzGx2pqEoFJyEzEtEJahXcsjJumM=
Date: Mon, 21 Feb 2022 13:26:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: aford173@gmail.com, slongerbeam@gmail.com, p.zabel@pengutronix.de,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	martin.kepplinger@puri.sm, rmfrfs@gmail.com,
	xavier.roumegue@oss.nxp.com, alexander.stein@ew.tq-group.com,
	dorota.czaplejewicz@puri.sm, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: imx: imx8mp-mipi-csi2: Remove YUV422 2X8
Message-ID: <YhN29Tat/GMl+2eS@pendragon.ideasonboard.com>
References: <20220221111611.52905-1-jacopo@jmondi.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220221111611.52905-1-jacopo@jmondi.org>

Hi Jacopo,

Thank you for the patch.

On Mon, Feb 21, 2022 at 12:16:11PM +0100, Jacopo Mondi wrote:
> The 2X8 variants of MEDIA_BUS_FMT_YUYV8_2X8 does not apply to serial

Maybe s/serial/CSI-2/

> busses.
> 
> Drop it and while at it beautify the formats declaration list a little
> by putting the opening curly brace after the comment.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/staging/media/imx/imx8mq-mipi-csi2.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx8mq-mipi-csi2.c b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> index 56ef3b3b2906..a3e33ce83c1f 100644
> --- a/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> @@ -200,11 +200,9 @@ static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
>  	}, {
>  		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
>  		.width = 14,
> -	}, {
> +	},
>  	/* YUV formats */
> -		.code = MEDIA_BUS_FMT_YUYV8_2X8,
> -		.width = 16,
> -	}, {
> +	{
>  		.code = MEDIA_BUS_FMT_YUYV8_1X16,

While at it, should we also switch this to MEDIA_BUS_FMT_UYVY8_1X16,
which is the canonical format for YUV422 8-bit on CSI-2 ?

>  		.width = 16,
>  	}

-- 
Regards,

Laurent Pinchart
