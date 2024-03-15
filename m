Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CA314280
	for <linux-staging@lists.linux.dev>; Fri, 15 Mar 2024 11:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710503416; cv=none; b=XKWM5Igzmgjq2g8/1IWY/P7ZJfAyP8jZrkA18LBqka76NdTt2kBmHHB+q4ZN5Ki9GVXJovwk4TMvtsfGYyXo/UJXbbSi7RFfWlp5yqjkZCnHrCcJdbqqpdjzzvXB1d7G9afGVwJg0Cib9ivsJnriCD650HfiWqn/9DiBwJdhHDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710503416; c=relaxed/simple;
	bh=dfkEZ8+wIJSbOcfgrt+qxAKHgEnV4CD3R7Louad01lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SYFp6O82vH51fAL3pMeDFDTXbDfvN2cSGV/ZVKkZ8sjDOjYF25NM0mQSNA3Qk+0DEqQlfmzJCUe+xGd1HhBpMxrTxRSNVyIH5o8yJ5C3cJnawfkDnu8VdlpX3RyODFmu3FryQ06xFtetd3m48JTY/ehkoMSspUQ7mBKBtvUuC0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qFG7Uadb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qFG7Uadb"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0DDE667;
	Fri, 15 Mar 2024 12:49:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710503388;
	bh=dfkEZ8+wIJSbOcfgrt+qxAKHgEnV4CD3R7Louad01lo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qFG7UadblqRlu6Yu2vPcVQxqUYq+j0fO3WKIIwaxV0qJ2fP+WOTpkyv+/Ycxxf+ut
	 ltjoJx1WrXgJZ7XzVnNfi5Dge5+Ev50ZqeNZpo1tgIN+yfbac8YxU2XHQV9wTwJBwl
	 yOJF6v9hLv7aEtbXAP8WY1wuaUA98+n68j4iWiaM=
Date: Fri, 15 Mar 2024 13:50:09 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 3/6] staging: vc04_services: Drop global members for
 tracking connections
Message-ID: <20240315115009.GB3498@pendragon.ideasonboard.com>
References: <20240314100607.336009-1-umang.jain@ideasonboard.com>
 <20240314100607.336009-4-umang.jain@ideasonboard.com>
 <171042216625.252503.4862753149878092236@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171042216625.252503.4862753149878092236@ping.linuxembedded.co.uk>

On Thu, Mar 14, 2024 at 01:16:06PM +0000, Kieran Bingham wrote:
> Quoting Umang Jain (2024-03-14 10:06:04)
> > Introduce a new struct vchiq_connected, responsible to track
> > the connections to the vchiq platform driver. The struct is added
> > as part of vchiq platform driver data (struct vchiq_drvdata).
> > 
> > Drop global members for tracking vchiq driver connections in
> > vchiq_connected.[ch] and use the struct vchiq_connected present
> > in struct vchiq_drvdata.
> > 
> > Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> > ---
> >  .../interface/vchiq_arm/vchiq_arm.c           |  2 +-
> >  .../interface/vchiq_arm/vchiq_arm.h           |  3 ++
> >  .../interface/vchiq_arm/vchiq_connected.c     | 33 +++++++++----------
> >  .../interface/vchiq_arm/vchiq_connected.h     | 15 +++++++--
> >  4 files changed, 33 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > index 52569517ba4e..8c7520dee5f4 100644
> > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > @@ -550,7 +550,7 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
> >         dev_dbg(&pdev->dev, "arm: vchiq_init - done (slots %pK, phys %pad)\n",
> >                 vchiq_slot_zero, &slot_phys);
> >  
> > -       vchiq_call_connected_callbacks();
> > +       vchiq_call_connected_callbacks(&drvdata->drv_connected);
> >  
> >         return 0;
> >  }
> > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> > index 7fef05e7389c..f2fd572df2b3 100644
> > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> > @@ -16,6 +16,7 @@
> >  
> >  #include "vchiq_core.h"
> >  #include "vchiq_debugfs.h"
> > +#include "vchiq_connected.h"
> >  
> >  /* Some per-instance constants */
> >  #define MAX_COMPLETIONS 128
> > @@ -31,6 +32,8 @@ enum USE_TYPE_E {
> >  struct vchiq_drvdata {
> >         const unsigned int cache_line_size;
> >         struct rpi_firmware *fw;
> > +
> > +       struct vchiq_connected drv_connected;
> >  };
> >  
> >  struct user_service {
> > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> > index 4604a2f4d2de..bc21910fe823 100644
> > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> > @@ -6,11 +6,6 @@
> >  #include <linux/module.h>
> >  #include <linux/mutex.h>
> >  
> > -#define  MAX_CALLBACKS  10
> > -
> > -static   int                        g_connected;
> > -static   int                        g_num_deferred_callbacks;
> > -static   void (*g_deferred_callback[MAX_CALLBACKS])(void);
> >  static   DEFINE_MUTEX(g_connected_mutex);
> >  
> >  /*
> > @@ -19,23 +14,27 @@ static   DEFINE_MUTEX(g_connected_mutex);
> >   * be made immediately, otherwise it will be deferred until
> >   * vchiq_call_connected_callbacks is called.
> >   */
> > -void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void))
> > +void vchiq_add_connected_callback(struct vchiq_device *device,
> > +                                 void (*callback)(void),
> > +                                 struct vchiq_connected *drv_connected)
> 
> I think I would have called this 'struct vchiq_connection *connection'
> but it doesn't really matter, so don't rework unless there's a 'need'
> for another iteration.

Yes, "connected" sounds weird.

This being said, I don't think we should add a new structure, and I also
don't think we should move this to vchiq_drvdata as-is.

vchiq_drvdata combines two things (in just two fields, quite an
achievement :-)):

- The cache_line_size field is static information about the platform. It
  should be moved to a vchiq_platform_info or similar structure, as
  that's what the .data field of the of_device_it entries should point
  to.

- The fw field is runtime data belonging to the vchiq "controller" or
  "bus" device (not sure how to name it). It's the equivalent, in a
  camera sensor driver for instance, of the private structure allocated
  per sensor instance at probe time. The vchiq_drvdata structure should
  be renamed accordingly (e.g. vchiq_controller, ...), and allocated
  dynamically in vchiq_probe().

The global variables related to connections can then move to that
controller structure, there's no need to create a sub-structure. It
should also not be passed explicitly to vchiq_add_connected_callback(),
but should be retrieved from vchiq_device. The vchiq_device structure
should store a pointer to vchiq_controller, which should be initialized
in vchiq_device_register(), using platform_get_drvdata(parent).

Does this make sense ?

> Aha though I see vchiq_connected matches the name of this c module, so
> maybe that's just as/more suitable.
> 
> 
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> >  {
> > +       unsigned int index;
> > +
> >         if (mutex_lock_killable(&g_connected_mutex))
> >                 return;
> >  
> > -       if (g_connected) {
> > +       if (drv_connected->connected) {
> >                 /* We're already connected. Call the callback immediately. */
> >                 callback();
> >         } else {
> > -               if (g_num_deferred_callbacks >= MAX_CALLBACKS) {
> > +               if (drv_connected->num_deferred_callbacks >= VCHIQ_DRV_MAX_CALLBACKS) {
> >                         dev_err(&device->dev,
> >                                 "core: There already %d callback registered - please increase MAX_CALLBACKS\n",
> > -                               g_num_deferred_callbacks);
> > +                               drv_connected->num_deferred_callbacks);
> >                 } else {
> > -                       g_deferred_callback[g_num_deferred_callbacks] =
> > -                               callback;
> > -                       g_num_deferred_callbacks++;
> > +                       index = drv_connected->num_deferred_callbacks;
> > +                       drv_connected->deferred_callback[index] = callback;
> > +                       drv_connected->num_deferred_callbacks++;
> >                 }
> >         }
> >         mutex_unlock(&g_connected_mutex);
> > @@ -46,17 +45,17 @@ EXPORT_SYMBOL(vchiq_add_connected_callback);
> >   * This function is called by the vchiq stack once it has been connected to
> >   * the videocore and clients can start to use the stack.
> >   */
> > -void vchiq_call_connected_callbacks(void)
> > +void vchiq_call_connected_callbacks(struct vchiq_connected *drv_connected)
> >  {
> >         int i;
> >  
> >         if (mutex_lock_killable(&g_connected_mutex))
> >                 return;
> >  
> > -       for (i = 0; i <  g_num_deferred_callbacks; i++)
> > -               g_deferred_callback[i]();
> > +       for (i = 0; i < drv_connected->num_deferred_callbacks; i++)
> > +               drv_connected->deferred_callback[i]();
> >  
> > -       g_num_deferred_callbacks = 0;
> > -       g_connected = 1;
> > +       drv_connected->num_deferred_callbacks = 0;
> > +       drv_connected->connected = true;
> >         mutex_unlock(&g_connected_mutex);
> >  }
> > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
> > index e4ed56446f8a..66e56b5af46e 100644
> > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
> > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
> > @@ -6,7 +6,18 @@
> >  #ifndef VCHIQ_CONNECTED_H
> >  #define VCHIQ_CONNECTED_H
> >  
> > -void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void));
> > -void vchiq_call_connected_callbacks(void);
> > +#define  VCHIQ_DRV_MAX_CALLBACKS  10
> > +
> > +struct vchiq_connected {
> > +       bool connected;
> > +       int num_deferred_callbacks;
> > +
> > +       void (*deferred_callback[VCHIQ_DRV_MAX_CALLBACKS])(void);
> > +};
> > +
> > +void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void),
> > +                                 struct vchiq_connected *drv_connected);
> > +void vchiq_call_connected_callbacks(struct vchiq_connected *drv_connected);
> > +
> >  
> >  #endif /* VCHIQ_CONNECTED_H */

-- 
Regards,

Laurent Pinchart
