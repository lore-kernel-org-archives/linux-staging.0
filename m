Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE5A1D524
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 22:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711665195; cv=none; b=TSyv9IJDq/8fk+cksuxaJaCUdqUlnPIx/VMsGnb/DaZ5RUyOvhHVeKBFwk2Bw3qBDGkhTaFTdcgXClb03QpmKYBDD/69PHfZX+oz2umIY5PuaKyg6lTTFfgo/gSWJkLjvYPDYnxgTeOGKddjRzGbs9SodHgA5zm828M5tZXAddM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711665195; c=relaxed/simple;
	bh=T+C5PuncLGa+ynENI+iMnEYthhWM8CD+hfcmipHfNUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVH4iRVZrrHcid9Zf0kZKoM8Jjgp4t5rp8PuVUxIYZKlzFMwDdtonB6APJZ2Tn8wnU9t9nVXLjxodAa1igKQJbEQu1Ecop4sIiQ9bujYsUXKHq2IgF9EAg/YqqFLumrECMoQ9RiIJNUWA1EfC/ts7tt5n0LkHhp/ID38Y82m3Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tBCf0uxN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tBCf0uxN"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF854505;
	Thu, 28 Mar 2024 23:32:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711665158;
	bh=T+C5PuncLGa+ynENI+iMnEYthhWM8CD+hfcmipHfNUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tBCf0uxNKet7OmfEPievZMKZg1WglaHM6Z/xOET/wqlZcEY3OPILNcaNlAdrU3wTc
	 8LSzlFQjhqU7L1vt4oYJo5UYYzqLIaSU1hbZ+01q2qzONovQGRD301JzUHnYd0Dmz/
	 yHuq7BpkVtHTxOVRiLtanCFmI4WIJfqsvGBweYR0=
Date: Fri, 29 Mar 2024 00:33:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v4 02/11] staging: vc04_services: vchiq_arm: Split driver
 static and runtime data
Message-ID: <20240328223300.GH11463@pendragon.ideasonboard.com>
References: <20240328181134.1548799-1-umang.jain@ideasonboard.com>
 <20240328181134.1548799-3-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240328181134.1548799-3-umang.jain@ideasonboard.com>

Hi Umang,

Thank you for the patch.

On Thu, Mar 28, 2024 at 11:41:24PM +0530, Umang Jain wrote:
> vchiq_drvdata combines two types of book-keeping data. There is
> platform-specific static data (for e.g. cache lines size) and then
> data needed for book-keeping at runtime.
> 
> Split the data into two structures: struct vchiq_platform_info and
> struct vchiq_drv_mgmt. The vchiq_drv_mgmt is allocated at runtime
> during probe and will be extended in subsequent patches to remove
> all global variables allocated.
> 
> No functional changes intended in this patch.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../interface/vchiq_arm/vchiq_arm.c           | 42 ++++++++++---------
>  .../interface/vchiq_arm/vchiq_arm.h           | 11 +++++
>  2 files changed, 33 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 9af77d17a1e8..9273767f25df 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -71,16 +71,11 @@ struct vchiq_state g_state;
>  static struct vchiq_device *bcm2835_audio;
>  static struct vchiq_device *bcm2835_camera;
>  
> -struct vchiq_drvdata {
> -	const unsigned int cache_line_size;
> -	struct rpi_firmware *fw;
> -};
> -
> -static struct vchiq_drvdata bcm2835_drvdata = {
> +static const struct vchiq_platform_info bcm2835_info = {
>  	.cache_line_size = 32,
>  };
>  
> -static struct vchiq_drvdata bcm2836_drvdata = {
> +static const struct vchiq_platform_info bcm2836_info = {
>  	.cache_line_size = 64,
>  };
>  
> @@ -466,8 +461,8 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
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
> @@ -484,7 +479,7 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
>  	if (err < 0)
>  		return err;
>  
> -	g_cache_line_size = drvdata->cache_line_size;
> +	g_cache_line_size = drv_mgmt->info->cache_line_size;
>  	g_fragments_size = 2 * g_cache_line_size;
>  
>  	/* Allocate space for the channels in coherent memory */
> @@ -1707,8 +1702,8 @@ void vchiq_platform_conn_state_changed(struct vchiq_state *state,
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
> @@ -1716,13 +1711,12 @@ MODULE_DEVICE_TABLE(of, vchiq_of_match);
>  static int vchiq_probe(struct platform_device *pdev)
>  {
>  	struct device_node *fw_node;
> -	const struct of_device_id *of_id;
> -	struct vchiq_drvdata *drvdata;
> +	const struct vchiq_platform_info *info;
> +	struct vchiq_drv_mgmt *mgmt;
>  	int err;
>  
> -	of_id = of_match_node(vchiq_of_match, pdev->dev.of_node);
> -	drvdata = (struct vchiq_drvdata *)of_id->data;
> -	if (!drvdata)
> +	info = of_device_get_match_data(&pdev->dev);
> +	if (!info)
>  		return -EINVAL;
>  
>  	fw_node = of_find_compatible_node(NULL, NULL,
> @@ -1732,12 +1726,17 @@ static int vchiq_probe(struct platform_device *pdev)
>  		return -ENOENT;
>  	}
>  
> -	drvdata->fw = devm_rpi_firmware_get(&pdev->dev, fw_node);
> +	mgmt = kzalloc(sizeof(*mgmt), GFP_KERNEL);
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
> +	mgmt->info = info;
> +	platform_set_drvdata(pdev, mgmt);
>  
>  	err = vchiq_platform_init(pdev, &g_state);
>  	if (err)
> @@ -1772,6 +1771,7 @@ static int vchiq_probe(struct platform_device *pdev)
>  static void vchiq_remove(struct platform_device *pdev)
>  {
>  	struct vchiq_state *state = vchiq_get_state();
> +	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(&pdev->dev);
>  
>  	vchiq_device_unregister(bcm2835_audio);
>  	vchiq_device_unregister(bcm2835_camera);
> @@ -1781,6 +1781,8 @@ static void vchiq_remove(struct platform_device *pdev)
>  	kthread_stop(state->sync_thread);
>  	kthread_stop(state->recycle_thread);
>  	kthread_stop(state->slot_handler_thread);
> +
> +	kfree(mgmt);
>  }
>  
>  static struct platform_driver vchiq_driver = {
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> index 7844ef765a00..04683d98cd00 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> @@ -20,11 +20,22 @@
>  #define MAX_ELEMENTS 8
>  #define MSG_QUEUE_SIZE 128
>  
> +struct rpi_firmware;
> +
>  enum USE_TYPE_E {
>  	USE_TYPE_SERVICE,
>  	USE_TYPE_VCHIQ
>  };
>  
> +struct vchiq_platform_info {
> +	unsigned int cache_line_size;
> +};
> +
> +struct vchiq_drv_mgmt {
> +	struct rpi_firmware *fw;
> +	const struct vchiq_platform_info *info;
> +};
> +
>  struct user_service {
>  	struct vchiq_service *service;
>  	void __user *userdata;

-- 
Regards,

Laurent Pinchart
