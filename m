Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A752F225A8
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 22:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711666359; cv=none; b=TscoolFTsFNqN+dEwxP7601bRl35fYlWobwwPv42zM6KB4fAAOcnH/8JuDmn352ktIEEO93NoS/vGpbPJmuRcBz2oi8+B8Kj1ON5UuU2Qo4j7mBH9Kh/NsbQ2jgIm1N5El5Q2ctqv7d1FJ0mrrVxgt+mwgxPhaOmELUbSahyQEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711666359; c=relaxed/simple;
	bh=/3AVIz3x9ZbmND/QsmEQ0SUL8kQPhpSRJGO/A6FJT1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oaeI/LcfvE45Y4dKcvNrgZUKrGvW9Q70/iV6zXyFXPhCKUoxRhlpvABFdao9AeDsUwKL+sN1curcyaTK1FSJeu8zZ+wIGuLgg66iy/JvcrWcHuDUUgm77aDU8uNW8OlpQv+20yeeS0+WiWUIDUqjJF0Yv4ruh9uaRYp5T5RINOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JfLvo7Kr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JfLvo7Kr"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7DD3505;
	Thu, 28 Mar 2024 23:52:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711666320;
	bh=/3AVIz3x9ZbmND/QsmEQ0SUL8kQPhpSRJGO/A6FJT1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JfLvo7KrK7+0V941EFO/yvhBfxOwGhyj/4EkKHU9fPtmqm1xcWcR10sskFs25EOjJ
	 6lfdqZQl4B6SH8Ee0FGnTKbAQhfXAa72YPbaigPC7QxRckVNNGWY1WsaBSEQIQ4vHC
	 PeGo9Qefi14KdRjm2LwYWoi0IGx0lH99+kSAhFOs=
Date: Fri, 29 Mar 2024 00:52:23 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v4 05/11] staging: vc04_services: Drop
 vchiq_connected.[ch] files
Message-ID: <20240328225223.GJ11463@pendragon.ideasonboard.com>
References: <20240328181134.1548799-1-umang.jain@ideasonboard.com>
 <20240328181134.1548799-6-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240328181134.1548799-6-umang.jain@ideasonboard.com>

Hi Umang,

Thank you for the patch.

On Thu, Mar 28, 2024 at 11:41:27PM +0530, Umang Jain wrote:
> The vchiq_connected.[ch] just implements two function:
> 
> - vchiq_add_connected_callback()
> - vchiq_call_connected_callbacks()
> 
> for the deferred vchiq callbacks. Those can easily live in
> vchiq_arm.[ch], hence move them.

I would add

This allows making the vchiq_call_connected_callbacks() function static.

> The move doesn't copy over MAX_CALLBACKS because it is the
> same as VCHIQ_DRV_MAX_CALLBACKS. Hence, it now being used in
> vchiq_add_connected_callback().

You can reflow to 72 columns.

> 
> No functional changes intended in this patch.
> 

In case you didn't know, there's a Suggested-by tag you can use to
indicate who the idea for a patch came from.

> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/vc04_services/Makefile        |  1 -
>  .../interface/vchiq_arm/vchiq_arm.c           | 51 +++++++++++++++-
>  .../interface/vchiq_arm/vchiq_arm.h           |  5 ++
>  .../interface/vchiq_arm/vchiq_connected.c     | 60 -------------------
>  .../interface/vchiq_arm/vchiq_connected.h     | 14 -----
>  5 files changed, 55 insertions(+), 76 deletions(-)
>  delete mode 100644 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
>  delete mode 100644 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
> 
> diff --git a/drivers/staging/vc04_services/Makefile b/drivers/staging/vc04_services/Makefile
> index e8b897a7b9a6..dad3789522b8 100644
> --- a/drivers/staging/vc04_services/Makefile
> +++ b/drivers/staging/vc04_services/Makefile
> @@ -6,7 +6,6 @@ vchiq-objs := \
>     interface/vchiq_arm/vchiq_arm.o \
>     interface/vchiq_arm/vchiq_bus.o \
>     interface/vchiq_arm/vchiq_debugfs.o \
> -   interface/vchiq_arm/vchiq_connected.o \
>  
>  ifdef CONFIG_VCHIQ_CDEV
>  vchiq-objs += interface/vchiq_arm/vchiq_dev.o
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 4d14ea1becaa..2005d392d0b7 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -36,7 +36,6 @@
>  #include "vchiq_arm.h"
>  #include "vchiq_bus.h"
>  #include "vchiq_debugfs.h"
> -#include "vchiq_connected.h"
>  #include "vchiq_pagelist.h"
>  
>  #define DEVICE_NAME "vchiq"
> @@ -189,6 +188,56 @@ is_adjacent_block(u32 *addrs, u32 addr, unsigned int k)
>  	return tmp == (addr & PAGE_MASK);
>  }
>  
> +/*
> + * This function is called by the vchiq stack once it has been connected to
> + * the videocore and clients can start to use the stack.
> + */
> +static void vchiq_call_connected_callbacks(struct vchiq_drv_mgmt *drv_mgmt)
> +{
> +	int i;
> +
> +	if (mutex_lock_killable(&drv_mgmt->connected_mutex))
> +		return;
> +
> +	for (i = 0; i < drv_mgmt->num_deferred_callbacks; i++)
> +		drv_mgmt->deferred_callback[i]();
> +
> +	drv_mgmt->num_deferred_callbacks = 0;
> +	drv_mgmt->connected = true;
> +	mutex_unlock(&drv_mgmt->connected_mutex);
> +}
> +
> +/*
> + * This function is used to defer initialization until the vchiq stack is
> + * initialized. If the stack is already initialized, then the callback will
> + * be made immediately, otherwise it will be deferred until
> + * vchiq_call_connected_callbacks is called.
> + */
> +void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void))
> +{
> +	struct vchiq_drv_mgmt *drv_mgmt = device->drv_mgmt;
> +
> +	if (mutex_lock_killable(&drv_mgmt->connected_mutex))
> +		return;
> +
> +	if (drv_mgmt->connected) {
> +		/* We're already connected. Call the callback immediately. */
> +		callback();
> +	} else {
> +		if (drv_mgmt->num_deferred_callbacks >= VCHIQ_DRV_MAX_CALLBACKS) {
> +			dev_err(&device->dev,
> +				"core: deferred callbacks(%d) exceeded the maximum limit(%d)\n",
> +				drv_mgmt->num_deferred_callbacks, VCHIQ_DRV_MAX_CALLBACKS);
> +		} else {
> +			drv_mgmt->deferred_callback[drv_mgmt->num_deferred_callbacks] =
> +				callback;
> +			drv_mgmt->num_deferred_callbacks++;
> +		}
> +	}
> +	mutex_unlock(&drv_mgmt->connected_mutex);
> +}
> +EXPORT_SYMBOL(vchiq_add_connected_callback);
> +
>  /* There is a potential problem with partial cache lines (pages?)
>   * at the ends of the block when reading. If the CPU accessed anything in
>   * the same line (page?) then it may have pulled old data into the cache,
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> index a774485935a2..4a5b5ae9625a 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> @@ -23,6 +23,7 @@
>  #define VCHIQ_DRV_MAX_CALLBACKS 10
>  
>  struct rpi_firmware;
> +struct vchiq_device;
>  
>  enum USE_TYPE_E {
>  	USE_TYPE_SERVICE,
> @@ -147,6 +148,10 @@ vchiq_instance_get_trace(struct vchiq_instance *instance);
>  extern void
>  vchiq_instance_set_trace(struct vchiq_instance *instance, int trace);
>  
> +extern void
> +vchiq_add_connected_callback(struct vchiq_device *device,
> +			     void (*callback)(void));
> +
>  #if IS_ENABLED(CONFIG_VCHIQ_CDEV)
>  
>  extern void
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> deleted file mode 100644
> index 049b3f2d1bd4..000000000000
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> -/* Copyright (c) 2010-2012 Broadcom. All rights reserved. */
> -
> -#include "vchiq_arm.h"
> -#include "vchiq_connected.h"
> -#include "vchiq_core.h"
> -#include <linux/module.h>
> -#include <linux/mutex.h>
> -
> -#define  MAX_CALLBACKS  10
> -
> -/*
> - * This function is used to defer initialization until the vchiq stack is
> - * initialized. If the stack is already initialized, then the callback will
> - * be made immediately, otherwise it will be deferred until
> - * vchiq_call_connected_callbacks is called.
> - */
> -void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void))
> -{
> -	struct vchiq_drv_mgmt *drv_mgmt = device->drv_mgmt;
> -
> -	if (mutex_lock_killable(&drv_mgmt->connected_mutex))
> -		return;
> -
> -	if (drv_mgmt->connected) {
> -		/* We're already connected. Call the callback immediately. */
> -		callback();
> -	} else {
> -		if (drv_mgmt->num_deferred_callbacks >= MAX_CALLBACKS) {
> -			dev_err(&device->dev,
> -				"core: There already %d callback registered - please increase MAX_CALLBACKS\n",
> -				drv_mgmt->num_deferred_callbacks);
> -		} else {
> -			drv_mgmt->deferred_callback[drv_mgmt->num_deferred_callbacks] =
> -				callback;
> -			drv_mgmt->num_deferred_callbacks++;
> -		}
> -	}
> -	mutex_unlock(&drv_mgmt->connected_mutex);
> -}
> -EXPORT_SYMBOL(vchiq_add_connected_callback);
> -
> -/*
> - * This function is called by the vchiq stack once it has been connected to
> - * the videocore and clients can start to use the stack.
> - */
> -void vchiq_call_connected_callbacks(struct vchiq_drv_mgmt *drv_mgmt)
> -{
> -	int i;
> -
> -	if (mutex_lock_killable(&drv_mgmt->connected_mutex))
> -		return;
> -
> -	for (i = 0; i <  drv_mgmt->num_deferred_callbacks; i++)
> -		drv_mgmt->deferred_callback[i]();
> -
> -	drv_mgmt->num_deferred_callbacks = 0;
> -	drv_mgmt->connected = true;
> -	mutex_unlock(&drv_mgmt->connected_mutex);
> -}
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
> deleted file mode 100644
> index f57a878652b1..000000000000
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
> -/* Copyright (c) 2010-2012 Broadcom. All rights reserved. */
> -
> -#include "vchiq_bus.h"
> -
> -#ifndef VCHIQ_CONNECTED_H
> -#define VCHIQ_CONNECTED_H
> -
> -struct vchiq_drv_mgmt;
> -
> -void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void));
> -void vchiq_call_connected_callbacks(struct vchiq_drv_mgmt *mgmt);
> -
> -#endif /* VCHIQ_CONNECTED_H */

-- 
Regards,

Laurent Pinchart
