Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5E17D
	for <linux-staging@lists.linux.dev>; Fri, 11 Feb 2022 20:42:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74FA593;
	Fri, 11 Feb 2022 21:42:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1644612144;
	bh=15qXl6luBZH9o1ELt2sF2BngQlFnqmXYSjFgV8b31xA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UmqEqAEVLNR+KTF5eVUQJlI4BXDDvJLMUxMHX2xvKLhrAnJ37nhmtHAks1mjO4HQi
	 3lt+D+9UxwsZOJFM9N9hfISV8GaViV530ZkdFYvrSfOT2Ku4dDLMfky9XkmkjvJd2v
	 1DSdU+a4J+FOwemW1E0MaRpEW73oOgNrDrNhCQxs=
Date: Fri, 11 Feb 2022 22:42:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, martin.kepplinger@puri.sm,
	rmfrfs@gmail.com, xavier.roumegue@oss.nxp.com,
	kernel@pengutronix.de, linux-imx@nxp.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] media: imx: Rename imx7-mipi-csis.c to
 imx-mipi-csis.c
Message-ID: <YgbKLDwyV6pYj8Fu@pendragon.ideasonboard.com>
References: <20220211180216.290133-1-jacopo@jmondi.org>
 <20220211180216.290133-3-jacopo@jmondi.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220211180216.290133-3-jacopo@jmondi.org>

Hi Jacopo,

Thank you for the patch.

On Fri, Feb 11, 2022 at 07:02:15PM +0100, Jacopo Mondi wrote:
> Rename the imx7-mipi-csis.c driver to remove the reference to i.MX7.
> 
> The driver is for an IP core found on i.MX7 and i.MX8 SoC so do not
> specify a SoC version number in the driver name.

I'm not against this, but I think we should then rename the symbols in
the source code too. I don't mind keeping the current name if the rename
causes too much churn.

> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  MAINTAINERS                                                     | 2 +-
>  .../media/platform/imx/{imx7-mipi-csis.c => imx-mipi-csis.c}    | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename drivers/media/platform/imx/{imx7-mipi-csis.c => imx-mipi-csis.c} (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5bdb8c881b0b..7def3b7d56bc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11891,7 +11891,7 @@ T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/admin-guide/media/imx7.rst
>  F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
>  F:	Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> -F:	drivers/media/platform/imx/imx7-mipi-csis.c
> +F:	drivers/media/platform/imx/imx-mipi-csis.c
>  F:	drivers/staging/media/imx/imx7-media-csi.c
>  
>  MEDIA DRIVERS FOR HELENE
> diff --git a/drivers/media/platform/imx/imx7-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> similarity index 100%
> rename from drivers/media/platform/imx/imx7-mipi-csis.c
> rename to drivers/media/platform/imx/imx-mipi-csis.c

-- 
Regards,

Laurent Pinchart
