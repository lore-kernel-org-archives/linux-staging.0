Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED15225CF
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 22:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711665519; cv=none; b=azHcfCg11z0wnUQ7d6Ofo5MdhZURp9R0WDYk+L4ajilSwXdC8nh8+2EdIkYJhu7BeL7cxwXK9hZW2sBIUakkJ9s/9IBmujpsqdBxKUM+SprNwh6IsLg1XFiBHw1jg5wddJbggSAhv9zUWYZV26XdcO60+LKNSBz+HOOL3BEXbEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711665519; c=relaxed/simple;
	bh=J52vDdZM8anHVVUnHuUNVOZqysAY0Nhnx0KJdGfhU2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lo0JHcZNh5zZ7UO2TwZ7ZfOBWiF4jGb/Fa0CWZ5otvg67/ZApG9MjYEbfjzBGXGH2vj2wXIhdRF170gFXNdzpvvh+aroM2zGlL1404go/gLhQkBCTZFvQRIEMXBnmwwz5CD/7uxArX0RQ6g0x9LH95GbxZJnxzfhSUQmHGgJu/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oxGChJwA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oxGChJwA"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E8A6E0C;
	Thu, 28 Mar 2024 23:38:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711665482;
	bh=J52vDdZM8anHVVUnHuUNVOZqysAY0Nhnx0KJdGfhU2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oxGChJwALlIkYJiO7NIyXu3MRu/lVp7hK4RIqr5aP07a+qBNMceWmDSH/Dr6j6EjR
	 OT6stln+5PxcV7E2F8SurBb9Vbp5ZnSAXewjQiehXUmgsSpwaNzfRyjVIlcLkHuY/Z
	 vU8buXjaC8qcXw/Z0kPzMGpkUeoiOPibWZnQvWoI=
Date: Fri, 29 Mar 2024 00:38:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v4 04/11] staging: vc04_services: Move variables for
 tracking connections
Message-ID: <20240328223825.GI11463@pendragon.ideasonboard.com>
References: <20240328181134.1548799-1-umang.jain@ideasonboard.com>
 <20240328181134.1548799-5-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240328181134.1548799-5-umang.jain@ideasonboard.com>

Hi Umang,

Thank you for the patch.

On Thu, Mar 28, 2024 at 11:41:26PM +0530, Umang Jain wrote:
> Connections to the vchiq driver are tracked using global variables.
> Drop those and introduce them as members of struct vchiq_drv_mgmt.
> Hence, struct vchiq_drv_mgmt will be used to track the connections.
> 
> Also, store a vchiq_drv_mgmt pointer to struct vchiq_device to
> have easy access to struct vchiq_drv_mgmt across vchiq devices.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../interface/vchiq_arm/vchiq_arm.c           |  3 +-
>  .../interface/vchiq_arm/vchiq_arm.h           |  9 +++++
>  .../interface/vchiq_arm/vchiq_bus.c           |  3 ++
>  .../interface/vchiq_arm/vchiq_bus.h           |  3 ++
>  .../interface/vchiq_arm/vchiq_connected.c     | 36 +++++++++----------
>  .../interface/vchiq_arm/vchiq_connected.h     |  4 ++-
>  6 files changed, 37 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 0dffc36dccd7..4d14ea1becaa 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -545,7 +545,8 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
>  	dev_dbg(&pdev->dev, "arm: vchiq_init - done (slots %pK, phys %pad)\n",
>  		vchiq_slot_zero, &slot_phys);
>  
> -	vchiq_call_connected_callbacks();
> +	mutex_init(&drv_mgmt->connected_mutex);
> +	vchiq_call_connected_callbacks(drv_mgmt);
>  
>  	return 0;
>  }
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> index 378415b205ef..a774485935a2 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> @@ -20,6 +20,8 @@
>  #define MAX_ELEMENTS 8
>  #define MSG_QUEUE_SIZE 128
>  
> +#define VCHIQ_DRV_MAX_CALLBACKS 10
> +
>  struct rpi_firmware;
>  
>  enum USE_TYPE_E {
> @@ -49,6 +51,13 @@ struct vchiq_platform_info {
>  struct vchiq_drv_mgmt {
>  	struct rpi_firmware *fw;
>  	const struct vchiq_platform_info *info;
> +
> +	bool connected;
> +	int num_deferred_callbacks;
> +	/* Protects connected and num_deferred_callbacks */
> +	struct mutex connected_mutex;
> +
> +	void (*deferred_callback[VCHIQ_DRV_MAX_CALLBACKS])(void);
>  };
>  
>  struct user_service {
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
> index 93609716df84..3f87b93c6537 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
> @@ -11,6 +11,7 @@
>  #include <linux/slab.h>
>  #include <linux/string.h>
>  
> +#include "vchiq_arm.h"
>  #include "vchiq_bus.h"
>  
>  static int vchiq_bus_type_match(struct device *dev, struct device_driver *drv)
> @@ -77,6 +78,8 @@ vchiq_device_register(struct device *parent, const char *name)
>  	device->dev.dma_mask = &device->dev.coherent_dma_mask;
>  	device->dev.release = vchiq_device_release;
>  
> +	device->drv_mgmt = dev_get_drvdata(parent);
> +
>  	of_dma_configure(&device->dev, parent->of_node, true);
>  
>  	ret = device_register(&device->dev);
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.h
> index 4db86e76edbd..9de179b39f85 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.h
> @@ -9,8 +9,11 @@
>  #include <linux/device.h>
>  #include <linux/mod_devicetable.h>
>  
> +struct vchiq_drv_mgmt;
> +
>  struct vchiq_device {
>  	struct device dev;
> +	struct vchiq_drv_mgmt *drv_mgmt;
>  };
>  
>  struct vchiq_driver {
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> index 4604a2f4d2de..049b3f2d1bd4 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
>  /* Copyright (c) 2010-2012 Broadcom. All rights reserved. */
>  
> +#include "vchiq_arm.h"
>  #include "vchiq_connected.h"
>  #include "vchiq_core.h"
>  #include <linux/module.h>
> @@ -8,11 +9,6 @@
>  
>  #define  MAX_CALLBACKS  10
>  
> -static   int                        g_connected;
> -static   int                        g_num_deferred_callbacks;
> -static   void (*g_deferred_callback[MAX_CALLBACKS])(void);
> -static   DEFINE_MUTEX(g_connected_mutex);
> -
>  /*
>   * This function is used to defer initialization until the vchiq stack is
>   * initialized. If the stack is already initialized, then the callback will
> @@ -21,24 +17,26 @@ static   DEFINE_MUTEX(g_connected_mutex);
>   */
>  void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void))
>  {
> -	if (mutex_lock_killable(&g_connected_mutex))
> +	struct vchiq_drv_mgmt *drv_mgmt = device->drv_mgmt;
> +
> +	if (mutex_lock_killable(&drv_mgmt->connected_mutex))
>  		return;
>  
> -	if (g_connected) {
> +	if (drv_mgmt->connected) {
>  		/* We're already connected. Call the callback immediately. */
>  		callback();
>  	} else {
> -		if (g_num_deferred_callbacks >= MAX_CALLBACKS) {
> +		if (drv_mgmt->num_deferred_callbacks >= MAX_CALLBACKS) {
>  			dev_err(&device->dev,
>  				"core: There already %d callback registered - please increase MAX_CALLBACKS\n",
> -				g_num_deferred_callbacks);
> +				drv_mgmt->num_deferred_callbacks);
>  		} else {
> -			g_deferred_callback[g_num_deferred_callbacks] =
> +			drv_mgmt->deferred_callback[drv_mgmt->num_deferred_callbacks] =
>  				callback;
> -			g_num_deferred_callbacks++;
> +			drv_mgmt->num_deferred_callbacks++;
>  		}
>  	}
> -	mutex_unlock(&g_connected_mutex);
> +	mutex_unlock(&drv_mgmt->connected_mutex);
>  }
>  EXPORT_SYMBOL(vchiq_add_connected_callback);
>  
> @@ -46,17 +44,17 @@ EXPORT_SYMBOL(vchiq_add_connected_callback);
>   * This function is called by the vchiq stack once it has been connected to
>   * the videocore and clients can start to use the stack.
>   */
> -void vchiq_call_connected_callbacks(void)
> +void vchiq_call_connected_callbacks(struct vchiq_drv_mgmt *drv_mgmt)
>  {
>  	int i;
>  
> -	if (mutex_lock_killable(&g_connected_mutex))
> +	if (mutex_lock_killable(&drv_mgmt->connected_mutex))
>  		return;
>  
> -	for (i = 0; i <  g_num_deferred_callbacks; i++)
> -		g_deferred_callback[i]();
> +	for (i = 0; i <  drv_mgmt->num_deferred_callbacks; i++)
> +		drv_mgmt->deferred_callback[i]();
>  
> -	g_num_deferred_callbacks = 0;
> -	g_connected = 1;
> -	mutex_unlock(&g_connected_mutex);
> +	drv_mgmt->num_deferred_callbacks = 0;
> +	drv_mgmt->connected = true;
> +	mutex_unlock(&drv_mgmt->connected_mutex);
>  }
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
> index e4ed56446f8a..f57a878652b1 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
> @@ -6,7 +6,9 @@
>  #ifndef VCHIQ_CONNECTED_H
>  #define VCHIQ_CONNECTED_H
>  
> +struct vchiq_drv_mgmt;
> +
>  void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void));
> -void vchiq_call_connected_callbacks(void);
> +void vchiq_call_connected_callbacks(struct vchiq_drv_mgmt *mgmt);
>  
>  #endif /* VCHIQ_CONNECTED_H */

-- 
Regards,

Laurent Pinchart
