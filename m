Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972457D
	for <linux-staging@lists.linux.dev>; Fri, 11 Feb 2022 20:46:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A623C93;
	Fri, 11 Feb 2022 21:46:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1644612407;
	bh=xIUsQw6MXy95ROftnxfKt8Ha0ODHFnvG5MXoQqx6b3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HPPfo5dadZFuqWRdmwEVN8sUMyHu+lFP8nvASt9FKsYNrfKovPpDDJjXaSQJqnWle
	 UAAl2bxy5c1B5FJp18lQIjLoTu2TmSvrofx3ktMGomOq6cuGR2dqWhVNT/aQBAdoL2
	 tCc+fSh7qLLW2mwsYHveAcOf3kgbfSRQWc/W6eJk=
Date: Fri, 11 Feb 2022 22:46:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, martin.kepplinger@puri.sm,
	rmfrfs@gmail.com, xavier.roumegue@oss.nxp.com,
	kernel@pengutronix.de, linux-imx@nxp.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] media: imx: Remove reference to i.MX7 from driver
Message-ID: <YgbLMydRXzm+ZVG8@pendragon.ideasonboard.com>
References: <20220211180216.290133-1-jacopo@jmondi.org>
 <20220211180216.290133-4-jacopo@jmondi.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220211180216.290133-4-jacopo@jmondi.org>

Hi Jacopo,

Thank you for the patch.

On Fri, Feb 11, 2022 at 07:02:16PM +0100, Jacopo Mondi wrote:
> Remove the references to the i.MX7 in the driver description and expand
> it with more information about the IP core the driver controls.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/platform/imx/imx-mipi-csis.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> index a22d0e6b3d44..59f4485bbe70 100644
> --- a/drivers/media/platform/imx/imx-mipi-csis.c
> +++ b/drivers/media/platform/imx/imx-mipi-csis.c
> @@ -1,6 +1,10 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Freescale i.MX7 SoC series MIPI-CSI V3.3 receiver driver
> + * CSIS MIPI CSI-2 receiver driver.

"CSIS" states for "CSI Slave", there's also a CSIM core available from
Samsung. As you acknowledge the Samsung origin in the next paragraph,
I'd write

 * Samsung CSIS CSI-2 receiver driver

> + *
> + * CSIS is an IP core originating from Samsung found in NXP i.MX7 and i.MX8
> + * SoC series. i.MX7 features version 3.3 of the IP, while i.MX8 features
> + * version 3.6.3

And maybe this could then become

 * The Samsung CSIS IP is a MIPI CSI-2 receiver found in various NXP i.MX7 and
 * i.MX8 SoCs. The i.MX7 features version 3.3 of the IP, while i.MX8 features
 * version 3.6.3

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>   *
>   * Copyright (C) 2019 Linaro Ltd
>   * Copyright (C) 2015-2016 Freescale Semiconductor, Inc. All Rights Reserved.
> @@ -31,7 +35,7 @@
>  #include <media/v4l2-mc.h>
>  #include <media/v4l2-subdev.h>
>  
> -#define CSIS_DRIVER_NAME			"imx7-mipi-csis"
> +#define CSIS_DRIVER_NAME			"imx-mipi-csis"
>  
>  #define CSIS_PAD_SINK				0
>  #define CSIS_PAD_SOURCE				1
> @@ -1515,4 +1519,4 @@ module_platform_driver(mipi_csis_driver);
>  
>  MODULE_DESCRIPTION("i.MX7 & i.MX8 MIPI CSI-2 receiver driver");
>  MODULE_LICENSE("GPL v2");
> -MODULE_ALIAS("platform:imx7-mipi-csi2");
> +MODULE_ALIAS("platform:imx-mipi-csi2");

-- 
Regards,

Laurent Pinchart
