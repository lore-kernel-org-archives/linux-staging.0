Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F350015EA2
	for <linux-staging@lists.linux.dev>; Fri, 22 Mar 2024 08:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711095483; cv=none; b=DxbQ0VI4tXaPTPh1HlkYQ2LZlHdTIajL5ShdqqI8L4SW+w6tLMw0zzvNFEfDB4yZJrAlc7Zk46Ov0URgwY9a9tfsSvNQIXAfulu8NzRDQOkiO4gX7lTE69bksRwAKl+spqYMaji/oiBKmTAEBm8CM5iztsmeonfEPzfFzr+vBbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711095483; c=relaxed/simple;
	bh=9gL6yinzSd+0HpcoF5jiiNAPMjyoRUVRxBQYaln/k6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JfJbD7WzROQtyBOegbsFz0WU5OxdkV0JSitW2MiY9pQtdDFn8iXI20PkwCYSbYwq8AKO8BIOvoB8DOtc/SrbGSvoGWWQsPbSRKuHzO4wkyoz5CDUKwmFcKVqQLQhZ5q8fbo3Ee+pYQxELxUtaftGY7BlPymLLSF+OULW5dILaW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gZoLdAba; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gZoLdAba"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA2F8BEB;
	Fri, 22 Mar 2024 09:17:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711095450;
	bh=9gL6yinzSd+0HpcoF5jiiNAPMjyoRUVRxBQYaln/k6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gZoLdAbaxLIJgxN6KkjMZnpF/cC9mwQPiY8M72Fh6wpu+cR7IDxfvl89iS2/YIr5C
	 HsIbO9+4E8+2cWAxC0A6GnQJb2jiB5cW8Yg/AOCJuM7F2fWkdeHE7rtHMyE+lNPGzM
	 tBVsuvtRuMgOYa7XkH33K5Ya4dsf5XOtQWFj1jGc=
Date: Fri, 22 Mar 2024 10:17:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Greg KH <greg@kroah.com>
Subject: Re: [PATCH v3 4/6] staging: vc04_services: Drop global members for
 tracking connections
Message-ID: <20240322081754.GJ18799@pendragon.ideasonboard.com>
References: <20240321103740.808561-1-umang.jain@ideasonboard.com>
 <20240321103740.808561-5-umang.jain@ideasonboard.com>
 <20240321191259.GX9582@pendragon.ideasonboard.com>
 <a6911446-cee4-4c17-9963-034e53275217@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a6911446-cee4-4c17-9963-034e53275217@ideasonboard.com>

Hi Umang,

On Fri, Mar 22, 2024 at 10:25:49AM +0530, Umang Jain wrote:
> On 22/03/24 12:42 am, Laurent Pinchart wrote:
> > On Thu, Mar 21, 2024 at 04:07:38PM +0530, Umang Jain wrote:
> >> Drop global members for tracking vchiq driver connections in
> >> vchiq_connected.[ch] and use the struct vchiq_drv_mgmt to
> >> track the connections.
> >
> > I'd write "Move global connection tracking to vchiq_drv_mgmt" in the
> > subject line, as you're not just dropping them completely. Same in the
> > commit message.
> >
> >> Also, store a vchiq_drv_mgmt pointer to struct vchiq_device to
> >> have easy access to struct vchiq_drv_mgmt across vchiq devices.
> >>
> >> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> >> ---
> >>   .../interface/vchiq_arm/vchiq_arm.c           |  2 +-
> >>   .../interface/vchiq_arm/vchiq_arm.h           |  6 +++++
> >>   .../interface/vchiq_arm/vchiq_bus.c           |  4 +++
> >>   .../interface/vchiq_arm/vchiq_bus.h           |  3 +++
> >>   .../interface/vchiq_arm/vchiq_connected.c     | 25 +++++++++----------
> >>   .../interface/vchiq_arm/vchiq_connected.h     |  3 ++-
> >>   6 files changed, 28 insertions(+), 15 deletions(-)
> >>
> >> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> >> index 01b4e4b010c6..ba096bcb32c8 100644
> >> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> >> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> >> @@ -559,7 +559,7 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
> >>   	dev_dbg(&pdev->dev, "arm: vchiq_init - done (slots %pK, phys %pad)\n",
> >>   		vchiq_slot_zero, &slot_phys);
> >>   
> >> -	vchiq_call_connected_callbacks();
> >> +	vchiq_call_connected_callbacks(drv_mgmt);
> >>   
> >>   	return 0;
> >>   }
> >> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> >> index fc4122c27e94..1190fab2efc4 100644
> >> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> >> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> >> @@ -23,6 +23,8 @@
> >>   #define MAX_ELEMENTS 8
> >>   #define MSG_QUEUE_SIZE 128
> >>   
> >> +#define VCHIQ_DRV_MAX_CALLBACKS 10
> >
> > It would be nice to remove this, but I think we can live with it for
> > now.
> >
> >> +
> >>   enum USE_TYPE_E {
> >>   	USE_TYPE_SERVICE,
> >>   	USE_TYPE_VCHIQ
> >> @@ -35,6 +37,10 @@ struct vchiq_platform_info {
> >>   struct vchiq_drv_mgmt {
> >>   	struct rpi_firmware *fw;
> >>   	const struct vchiq_platform_info *pinfo;
> >> +
> >> +	bool connected;
> >> +	int num_deferred_callbacks;
> >> +	void (*deferred_callback[VCHIQ_DRV_MAX_CALLBACKS])(void);
> >>   };
> >>   
> >>   struct user_service {
> >> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
> >> index 68f830d75531..fb837e64838b 100644
> >> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
> >> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
> >> @@ -54,6 +54,7 @@ static void vchiq_device_release(struct device *dev)
> >>   struct vchiq_device *
> >>   vchiq_device_register(struct device *parent, const char *name)
> >>   {
> >> +	struct platform_device *pdev;
> >>   	struct vchiq_device *device;
> >>   	int ret;
> >>   
> >> @@ -67,6 +68,9 @@ vchiq_device_register(struct device *parent, const char *name)
> >>   	device->dev.dma_mask = &device->dev.coherent_dma_mask;
> >>   	device->dev.release = vchiq_device_release;
> >>   
> >> +	pdev = to_platform_device(parent);
> >> +	device->drv_mgmt = platform_get_drvdata(pdev);
> >
> > 	device->drv_mgmt = dev_get_drvdata(parent);
> >
> >> +
> >>   	of_dma_configure(&device->dev, parent->of_node, true);
> >>   
> >>   	ret = device_register(&device->dev);
> >> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.h
> >> index 4db86e76edbd..b0e85ca2365e 100644
> >> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.h
> >> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.h
> >> @@ -9,8 +9,11 @@
> >>   #include <linux/device.h>
> >>   #include <linux/mod_devicetable.h>
> >>   
> >> +#include "vchiq_arm.h"
> >> +
> >
> > Use a declaration instead.
> >
> > struct vchiq_drv_mgmt;
> >
> >>   struct vchiq_device {
> >>   	struct device dev;
> >> +	struct vchiq_drv_mgmt *drv_mgmt;
> >>   };
> >>   
> >>   struct vchiq_driver {
> >> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> >> index 4604a2f4d2de..ec5e9107868e 100644
> >> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> >> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> >> @@ -8,9 +8,6 @@
> >>   
> >>   #define  MAX_CALLBACKS  10
> >>   
> >> -static   int                        g_connected;
> >> -static   int                        g_num_deferred_callbacks;
> >> -static   void (*g_deferred_callback[MAX_CALLBACKS])(void);
> >>   static   DEFINE_MUTEX(g_connected_mutex);
> >
> > Any reason not to move this to vchiq_drv_mgmt ?
> 
> yes, I looked into this - and it turned out the DEFINE_MUTEX 
> implementation differs based on whether CONFIG_PREEMPT_RT is enabled or 
> not, and I am not very sure if replacing it with struct mutex would have 
> repercussions. I don't understand these bits very well yet and it seems 
> (from a cursory look that DEFINE_MUTEX seems to be statically declared...)

I don't think there's any issue moving the mutex to the vchiq_drv_mgmt
structure.

> >>   
> >>   /*
> >> @@ -21,21 +18,23 @@ static   DEFINE_MUTEX(g_connected_mutex);
> >>    */
> >>   void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void))
> >>   {
> >> +	struct vchiq_drv_mgmt *drv_mgmt = device->drv_mgmt;
> >> +
> >>   	if (mutex_lock_killable(&g_connected_mutex))
> >>   		return;
> >>   
> >> -	if (g_connected) {
> >> +	if (drv_mgmt->connected) {
> >>   		/* We're already connected. Call the callback immediately. */
> >>   		callback();
> >>   	} else {
> >> -		if (g_num_deferred_callbacks >= MAX_CALLBACKS) {
> >> +		if (drv_mgmt->num_deferred_callbacks >= MAX_CALLBACKS) {
> >>   			dev_err(&device->dev,
> >>   				"core: There already %d callback registered - please increase MAX_CALLBACKS\n",
> >> -				g_num_deferred_callbacks);
> >> +				drv_mgmt->num_deferred_callbacks);
> >>   		} else {
> >> -			g_deferred_callback[g_num_deferred_callbacks] =
> >> +			drv_mgmt->deferred_callback[drv_mgmt->num_deferred_callbacks] =
> >>   				callback;
> >> -			g_num_deferred_callbacks++;
> >> +			drv_mgmt->num_deferred_callbacks++;
> >>   		}
> >>   	}
> >>   	mutex_unlock(&g_connected_mutex);
> >> @@ -46,17 +45,17 @@ EXPORT_SYMBOL(vchiq_add_connected_callback);
> >>    * This function is called by the vchiq stack once it has been connected to
> >>    * the videocore and clients can start to use the stack.
> >>    */
> >> -void vchiq_call_connected_callbacks(void)
> >> +void vchiq_call_connected_callbacks(struct vchiq_drv_mgmt *drv_mgmt)
> >>   {
> >>   	int i;
> >>   
> >>   	if (mutex_lock_killable(&g_connected_mutex))
> >>   		return;
> >>   
> >> -	for (i = 0; i <  g_num_deferred_callbacks; i++)
> >> -		g_deferred_callback[i]();
> >> +	for (i = 0; i <  drv_mgmt->num_deferred_callbacks; i++)
> >> +		drv_mgmt->deferred_callback[i]();
> >>   
> >> -	g_num_deferred_callbacks = 0;
> >> -	g_connected = 1;
> >> +	drv_mgmt->num_deferred_callbacks = 0;
> >> +	drv_mgmt->connected = true;
> >>   	mutex_unlock(&g_connected_mutex);
> >>   }
> >> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
> >> index e4ed56446f8a..0a3adefc69e0 100644
> >> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
> >> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
> >> @@ -1,12 +1,13 @@
> >>   /* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
> >>   /* Copyright (c) 2010-2012 Broadcom. All rights reserved. */
> >>   
> >> +#include "vchiq_arm.h"
> >
> > Structure declaration too.
> >
> >>   #include "vchiq_bus.h"
> >>   
> >>   #ifndef VCHIQ_CONNECTED_H
> >>   #define VCHIQ_CONNECTED_H
> >>   
> >>   void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void));
> >> -void vchiq_call_connected_callbacks(void);
> >> +void vchiq_call_connected_callbacks(struct vchiq_drv_mgmt *mgmt);
> >>   
> >>   #endif /* VCHIQ_CONNECTED_H */

-- 
Regards,

Laurent Pinchart
