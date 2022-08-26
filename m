Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BF93D6D;
	Fri, 26 Aug 2022 22:39:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D925230B;
	Sat, 27 Aug 2022 00:39:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1661553592;
	bh=R8qukP2RffLfxf6EBUyFnNoBjpObxeBRg1U0SiCvU9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eYUKTzF6QSKxmelG0IGUX5fRApy+oFTa6yaxqckT7jFur3bMN2VPKUHjCfiA1D7Dl
	 s7m6NBji3WfpvsbirYWASI+L4MTJBY7CcsEX7FwALMxXpad6hEN4t2JjLH+Zy5h+Hr
	 W1y03MKpyhsE4sK5Wn/oU4StLWJ8WPIGG+scy2vo=
Date: Sat, 27 Aug 2022 01:39:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v6 5/6] media: sun6i-csi: Detect the availability of the
 ISP
Message-ID: <YwlLsKaEOoXdqRK0@pendragon.ideasonboard.com>
References: <20220826184144.605605-1-paul.kocialkowski@bootlin.com>
 <20220826184144.605605-6-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220826184144.605605-6-paul.kocialkowski@bootlin.com>

Hi Paul,

Thank you for the patch.

On Fri, Aug 26, 2022 at 08:41:43PM +0200, Paul Kocialkowski wrote:
> Add a helper to detect whether the ISP is available and connected
> and store the indication in a driver-wide variable.

This sounds like it would be a global variable, while it's stored in the
driver-specific device structure.

> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../platform/sunxi/sun6i-csi/sun6i_csi.c      | 33 +++++++++++++++++++
>  .../platform/sunxi/sun6i-csi/sun6i_csi.h      |  3 ++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> index 00521f966cee..b16166cba2ef 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> @@ -24,6 +24,35 @@
>  #include "sun6i_csi_capture.h"
>  #include "sun6i_csi_reg.h"
>  
> +/* ISP */
> +
> +static bool sun6i_csi_isp_detect(struct sun6i_csi_device *csi_dev)
> +{
> +	struct device *dev = csi_dev->dev;
> +	struct fwnode_handle *handle = NULL;

No need to initialize this to NULL.

> +
> +	/* ISP is not available if disabled in kernel config. */
> +	if (!IS_ENABLED(CONFIG_VIDEO_SUN6I_ISP))
> +		return 0;

Hmmm... The ISP driver may be disabled when compiling the sun6i-csi
driver, but later enabled and deployed. Disabling ISP support silently
like this could be confusing. Could it be better to move this check
after the graph check, and print a warning message in this case ?

> +
> +	/*
> +	 * ISP is not available if not connected via fwnode graph.
> +	 * This weill also check that the remote parent node is available.

s/weill/will/

	 * ISP is not available if not connected via fwnode graph. This will
	 * also check that the remote parent node is available.

> +	 */
> +	handle = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
> +						 SUN6I_CSI_PORT_ISP, 0,
> +						 FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (!handle)
> +		return 0;
> +
> +	fwnode_handle_put(handle);
> +
> +	dev_info(dev, "ISP link is available\n");

You could make that a debug message, it's not crucial information that
needs to be printed when the driver is loaded. If you prefer keeping an
info message, then I'd move it to the probe function and print that the
CSI has been probed, and indicate in that message if the ISP is
available.

> +	csi_dev->isp_available = true;
> +
> +	return 0;
> +}
> +
>  /* Media */
>  
>  static const struct media_device_ops sun6i_csi_media_ops = {
> @@ -290,6 +319,10 @@ static int sun6i_csi_probe(struct platform_device *platform_dev)
>  	if (ret)
>  		return ret;
>  
> +	ret = sun6i_csi_isp_detect(csi_dev);
> +	if (ret)
> +		goto error_resources;
> +
>  	ret = sun6i_csi_v4l2_setup(csi_dev);
>  	if (ret)
>  		goto error_resources;
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> index e611bdd6e9b2..8e232cd91ebe 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> @@ -21,6 +21,7 @@
>  enum sun6i_csi_port {
>  	SUN6I_CSI_PORT_PARALLEL		= 0,
>  	SUN6I_CSI_PORT_MIPI_CSI2	= 1,
> +	SUN6I_CSI_PORT_ISP		= 2,
>  };
>  
>  struct sun6i_csi_buffer {
> @@ -44,6 +45,8 @@ struct sun6i_csi_device {
>  	struct clk			*clock_mod;
>  	struct clk			*clock_ram;
>  	struct reset_control		*reset;
> +
> +	bool				isp_available;
>  };
>  
>  struct sun6i_csi_variant {

-- 
Regards,

Laurent Pinchart
