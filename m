Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B42374C2
	for <linux-staging@lists.linux.dev>; Thu, 21 Mar 2024 18:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711046825; cv=none; b=Np6u4Oeka6233xuUBMecUSuzij0emHQllOrNAweruSXVhpeF3zzgYYexiJ1Wb97uuxSabTMeyAEOQpuOHzi7NHdk5jnmkSXn0qfbHaAhawgQ/TWq4g9qaiV4eA/Y4X3HJ3q6B3yypJKhRQpHz/nRw2r1rR4BScLBgka/RVi/MEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711046825; c=relaxed/simple;
	bh=K7z9URcsKHsFuY3iGF91T7ohgSbjx3XXozKvrOR2bVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTRSdAD/h6WTeqqFCs0K0GMA+fG42OodNH9h5tEVSKDPp+CyEPQPkVXJtJtymHgFPyBiHXbBQ0xsQaBpAOqbpSvdbf4EbABJTqSIoysBTo3sF3x8pxWA98NAYPZkW7Ooz2tMfbK2byVgr707h/NGWfcPJ+GunMYmZNlr1j6CQKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uAHxagE9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uAHxagE9"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05B4A672;
	Thu, 21 Mar 2024 19:46:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711046793;
	bh=K7z9URcsKHsFuY3iGF91T7ohgSbjx3XXozKvrOR2bVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uAHxagE9+AbX6z/RaVNm7stSAycJ6K44hWUdceP+IH3AsHJL19ZkXiAUc04q91dko
	 8mC3e8k2/gMGXnyTl2K7VBl98IzXVJkAygH7gmw3kce15CIlsFGBHfpkM9Ll3PAT46
	 3jTWrcZ6xElFiRieGYxdkBkjOyxy4SIPbneMOXL0=
Date: Thu, 21 Mar 2024 20:46:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Greg KH <greg@kroah.com>
Subject: Re: [PATCH v3 2/6] staging: vc04_services: vchiq_arm: Split driver
 static and runtime data
Message-ID: <20240321184658.GV9582@pendragon.ideasonboard.com>
References: <20240321103740.808561-1-umang.jain@ideasonboard.com>
 <20240321103740.808561-3-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240321103740.808561-3-umang.jain@ideasonboard.com>

Hi Umang,

Thank you for the patch.

On Thu, Mar 21, 2024 at 04:07:36PM +0530, Umang Jain wrote:
> vchiq_drvdata combines two types of book-keeping data. There is
> platform-specific static data (for e.g. cache lines size) and then
> data needed for book-keeping at runtime.
> 
> Split the data into two structures: struct vchiq_platform_info and
> struct vchiq_drv_mgmt. The vchiq_drv_mgmt is allocated at runtime
> during probe and will be extended in subsequent patches to remove
> all global variables responsible for book-keeping.
> 
> No functional changes intended in this patch.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  .../interface/vchiq_arm/vchiq_arm.c           | 38 +++++++++----------
>  .../interface/vchiq_arm/vchiq_arm.h           | 12 ++++++
>  2 files changed, 31 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 1579bd4e5263..73405a1f50ee 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -29,7 +29,6 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/uaccess.h>
> -#include <soc/bcm2835/raspberrypi-firmware.h>
>  
>  #include "vchiq_core.h"
>  #include "vchiq_ioctl.h"
> @@ -71,16 +70,11 @@ struct vchiq_state g_state;
>  static struct vchiq_device *bcm2835_audio;
>  static struct vchiq_device *bcm2835_camera;
>  
> -struct vchiq_drvdata {
> -	const unsigned int cache_line_size;
> -	struct rpi_firmware *fw;
> -};
> -
> -static struct vchiq_drvdata bcm2835_drvdata = {
> +static struct vchiq_platform_info bcm2835_info = {

static const

>  	.cache_line_size = 32,
>  };
>  
> -static struct vchiq_drvdata bcm2836_drvdata = {
> +static struct vchiq_platform_info bcm2836_info = {

Ditto.

>  	.cache_line_size = 64,
>  };
>  
> @@ -466,8 +460,8 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
>  static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct vchiq_drvdata *drvdata = platform_get_drvdata(pdev);
> -	struct rpi_firmware *fw = drvdata->fw;
> +	struct vchiq_drv_mgmt *drv_mgmt = platform_get_drvdata(pdev);
> +	struct rpi_firmware *fw = drv_mgmt->fw;
>  	struct vchiq_slot_zero *vchiq_slot_zero;
>  	void *slot_mem;
>  	dma_addr_t slot_phys;
> @@ -484,7 +478,7 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
>  	if (err < 0)
>  		return err;
>  
> -	g_cache_line_size = drvdata->cache_line_size;
> +	g_cache_line_size = drv_mgmt->pinfo->cache_line_size;
>  	g_fragments_size = 2 * g_cache_line_size;
>  
>  	/* Allocate space for the channels in coherent memory */
> @@ -1706,8 +1700,8 @@ void vchiq_platform_conn_state_changed(struct vchiq_state *state,
>  }
>  
>  static const struct of_device_id vchiq_of_match[] = {
> -	{ .compatible = "brcm,bcm2835-vchiq", .data = &bcm2835_drvdata },
> -	{ .compatible = "brcm,bcm2836-vchiq", .data = &bcm2836_drvdata },
> +	{ .compatible = "brcm,bcm2835-vchiq", .data = &bcm2835_info },
> +	{ .compatible = "brcm,bcm2836-vchiq", .data = &bcm2836_info },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, vchiq_of_match);
> @@ -1716,12 +1710,13 @@ static int vchiq_probe(struct platform_device *pdev)
>  {
>  	struct device_node *fw_node;
>  	const struct of_device_id *of_id;
> -	struct vchiq_drvdata *drvdata;
> +	const struct vchiq_platform_info *platform_info;

Or just info.

> +	struct vchiq_drv_mgmt *mgmt;
>  	int err;
>  
>  	of_id = of_match_node(vchiq_of_match, pdev->dev.of_node);
> -	drvdata = (struct vchiq_drvdata *)of_id->data;
> -	if (!drvdata)
> +	platform_info = (struct vchiq_platform_info *)of_id->data;

	platform_info = of_device_get_match_data(&pdev->dev);

and drop the of_id variable.

> +	if (!platform_info)
>  		return -EINVAL;
>  
>  	fw_node = of_find_compatible_node(NULL, NULL,
> @@ -1731,12 +1726,17 @@ static int vchiq_probe(struct platform_device *pdev)
>  		return -ENOENT;
>  	}
>  
> -	drvdata->fw = devm_rpi_firmware_get(&pdev->dev, fw_node);
> +	mgmt = kzalloc(sizeof(struct vchiq_drv_mgmt), GFP_KERNEL);

	mgmt = kzalloc(sizeof(*mgmt), GFP_KERNEL);

Where is this freed ?

> +	if (!mgmt)
> +		return -ENOMEM;
> +
> +	mgmt->fw = devm_rpi_firmware_get(&pdev->dev, fw_node);
>  	of_node_put(fw_node);
> -	if (!drvdata->fw)
> +	if (!mgmt->fw)
>  		return -EPROBE_DEFER;
>  
> -	platform_set_drvdata(pdev, drvdata);
> +	mgmt->pinfo = platform_info;
> +	platform_set_drvdata(pdev, mgmt);
>  
>  	err = vchiq_platform_init(pdev, &g_state);
>  	if (err)
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> index 7844ef765a00..fc4122c27e94 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> @@ -11,6 +11,9 @@
>  #include <linux/platform_device.h>
>  #include <linux/semaphore.h>
>  #include <linux/atomic.h>
> +
> +#include <soc/bcm2835/raspberrypi-firmware.h>

You can also simply add a forward-declaration:

struct rpi_firmware;

This reduces compilation time by lowering the number of headers that are
included.

> +
>  #include "vchiq_core.h"
>  #include "vchiq_debugfs.h"
>  
> @@ -25,6 +28,15 @@ enum USE_TYPE_E {
>  	USE_TYPE_VCHIQ
>  };
>  
> +struct vchiq_platform_info {
> +	const unsigned int cache_line_size;

const doesn't help muc here.

> +};
> +
> +struct vchiq_drv_mgmt {

The name sounds a bit weird but I can live with it :-)

> +	struct rpi_firmware *fw;
> +	const struct vchiq_platform_info *pinfo;

Unless you expect another kind of info later in this structure, I'd name
the field just 'info'.

> +};
> +
>  struct user_service {
>  	struct vchiq_service *service;
>  	void __user *userdata;

-- 
Regards,

Laurent Pinchart
