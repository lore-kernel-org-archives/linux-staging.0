Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD2E2FE33
	for <linux-staging@lists.linux.dev>; Tue,  7 Nov 2023 12:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NGO/fU6A"
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 03A23552;
	Tue,  7 Nov 2023 13:35:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699360559;
	bh=SyjPvo2nE0shK6MtumdB6CSufLxzNO9WpIPz3Ebrr2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NGO/fU6AjYdWA14jyW57KA5oyE+xEWdddzWQHoXQfLABsAhRpo60LkOht0zcgovAH
	 n/UV4euksNG28H33i1cfOeQ3vkfi6vYz/+AIdjkeqmI4nwbjuxFdsz/u/nIJ4SeZXy
	 nKjWiKqHSgzASgoTnsfNGuHVI7xzw+jvNZqk4zVU=
Date: Tue, 7 Nov 2023 14:36:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 5/9] staging: vc04_services: Do not pass NULL to
 vchiq_log_error()
Message-ID: <20231107123627.GB3051@pendragon.ideasonboard.com>
References: <20231107095156.365492-1-umang.jain@ideasonboard.com>
 <20231107095156.365492-6-umang.jain@ideasonboard.com>
 <20231107122551.GA3051@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231107122551.GA3051@pendragon.ideasonboard.com>

On Tue, Nov 07, 2023 at 02:25:52PM +0200, Laurent Pinchart wrote:
> On Tue, Nov 07, 2023 at 04:51:52AM -0500, Umang Jain wrote:
> > vchiq_add_connected_callback() logs using vchiq_log_error() macro,
> > but passes NULL instead of a struct device pointer. Fix it.
> > 
> > vchiq_add_connected_callback() is not used anywhere in the vc04_services
> > as of now. It will be used when we add new drivers(VC shared memory and
> > bcm2835-isp), hence it kept as it is for now.
> > 
> > Fixes: 1d8915cf8899 ("staging: vc04: Convert vchiq_log_error() to use dynamic debug")
> > Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> > ---
> >  .../vc04_services/interface/vchiq_arm/vchiq_connected.c       | 4 ++--
> >  .../vc04_services/interface/vchiq_arm/vchiq_connected.h       | 4 +++-
> >  2 files changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> > index b3928bd8c9c6..21f9fa1a1713 100644
> > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> > @@ -27,7 +27,7 @@ static void connected_init(void)
> >   * be made immediately, otherwise it will be deferred until
> >   * vchiq_call_connected_callbacks is called.
> >   */
> > -void vchiq_add_connected_callback(void (*callback)(void))
> > +void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void))
> 
> You're changing the prototype of the function, but the patch doesn't
> update any user. If the function is unused, it looks like you can drop
> it instead. Looking at the rest of the vchiq_connected.c file, I think
> you can actually drop the whole file.

Except that the vc-sm-cma driver will use it. I'm curious though, that
driver will have no way to acquire a pointer to a vchiq_device, so I
don't see how this will be usable. pr_err() may be a better pick here.

> >  {
> >  	connected_init();
> >  
> > @@ -39,7 +39,7 @@ void vchiq_add_connected_callback(void (*callback)(void))
> >  		callback();
> >  	} else {
> >  		if (g_num_deferred_callbacks >= MAX_CALLBACKS) {
> > -			vchiq_log_error(NULL, VCHIQ_CORE,
> > +			vchiq_log_error(&device->dev, VCHIQ_CORE,
> >  					"There already %d callback registered - please increase MAX_CALLBACKS",
> >  					g_num_deferred_callbacks);
> >  		} else {
> > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
> > index 4caf5e30099d..e4ed56446f8a 100644
> > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
> > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
> > @@ -1,10 +1,12 @@
> >  /* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
> >  /* Copyright (c) 2010-2012 Broadcom. All rights reserved. */
> >  
> > +#include "vchiq_bus.h"
> > +
> >  #ifndef VCHIQ_CONNECTED_H
> >  #define VCHIQ_CONNECTED_H
> >  
> > -void vchiq_add_connected_callback(void (*callback)(void));
> > +void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void));
> >  void vchiq_call_connected_callbacks(void);
> >  
> >  #endif /* VCHIQ_CONNECTED_H */

-- 
Regards,

Laurent Pinchart
