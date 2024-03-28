Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBF827446
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 23:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711667062; cv=none; b=uIdZmP7YJfYVw3lp0imwUJGrLB9SPOUCyvEJYRp1qoow4QIVpQ7jhyfCam6gZfN7880More7BeTbYl4OqnWlk0arL/73YnBhs/tJvJFFGvzu4ojRVFj94vvrnrKnasW1e0hVYiBuF506s8eNUyEgoB8FjsRO+JvT3yaPl/FKMA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711667062; c=relaxed/simple;
	bh=2j1hVEVC1VHdz65pmmDzEhN8LAr5DRyK9CCC5/iuAYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtzM8gebzJxIs0Ax6qUk+A7rgYA/ieTHYAv88ISOfSPUIm+j0cUtSPy6r55b4b0oJIx300hZQumEFK0YcNy6CUk45Ee4J1qeMTIgRdx1eScJcvW13DsROpRHUUoeK8PVBZPodCk9qeb91eoOobpV8nu6liHtXSqYxYNN/lDxY00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oFkzU0+T; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oFkzU0+T"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 277E3669;
	Fri, 29 Mar 2024 00:03:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711667026;
	bh=2j1hVEVC1VHdz65pmmDzEhN8LAr5DRyK9CCC5/iuAYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oFkzU0+T2IK0JzC03O0Hyttav/FudTll5RFHSDY2QjypUu36R+Yp+i0HFtcIFiF6y
	 UhLACoapDFFKZWOFxLariQRiRMdcCUU73v1m8wbYK83ANRQmjfTLtcV7WKaIvO3ayk
	 Bdztggh5OUTmuPAwr5qCVoD42J23HFkxDxGcu+oc=
Date: Fri, 29 Mar 2024 01:04:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v4 06/11] staging: vc04_services: Move global variables
 tracking allocated pages
Message-ID: <20240328230408.GN11463@pendragon.ideasonboard.com>
References: <20240328181134.1548799-1-umang.jain@ideasonboard.com>
 <20240328181134.1548799-7-umang.jain@ideasonboard.com>
 <20240328225958.GK11463@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240328225958.GK11463@pendragon.ideasonboard.com>

On Fri, Mar 29, 2024 at 12:59:59AM +0200, Laurent Pinchart wrote:
> Hi Umang,
> 
> Thank you for the patch.
> 
> On Thu, Mar 28, 2024 at 11:41:28PM +0530, Umang Jain wrote:
> > The variables tracking allocated pages fragments in vchiq_arm.c
> > can be easily moved to struct vchiq_drv_mgmt instead of being global.
> > This helps us to drop the non-essential global variables in the vchiq
> > interface.
> > 
> > No functional changes intended in this patch.
> > 
> > Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > ---
> >  .../interface/vchiq_arm/vchiq_arm.c           | 53 +++++++++----------
> >  .../interface/vchiq_arm/vchiq_arm.h           |  6 +++
> >  2 files changed, 30 insertions(+), 29 deletions(-)
> > 
> > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > index 2005d392d0b7..b335948f4b0c 100644
> > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > @@ -130,12 +130,6 @@ struct vchiq_pagelist_info {
> >  };
> >  
> >  static void __iomem *g_regs;
> > -static unsigned int g_fragments_size;
> > -static char *g_fragments_base;
> > -static char *g_free_fragments;
> > -static struct semaphore g_free_fragments_sema;
> > -
> > -static DEFINE_SEMAPHORE(g_free_fragments_mutex, 1);
> >  
> >  static int
> >  vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned int handle, void *data,
> > @@ -414,20 +408,20 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
> >  	    (drv_mgmt->info->cache_line_size - 1)))) {
> >  		char *fragments;
> >  
> > -		if (down_interruptible(&g_free_fragments_sema)) {
> > +		if (down_interruptible(&drv_mgmt->free_fragments_sema)) {
> >  			cleanup_pagelistinfo(instance, pagelistinfo);
> >  			return NULL;
> >  		}
> >  
> > -		WARN_ON(!g_free_fragments);
> > +		WARN_ON(!drv_mgmt->free_fragments);
> >  
> > -		down(&g_free_fragments_mutex);
> > -		fragments = g_free_fragments;
> > +		down(&drv_mgmt->free_fragments_mutex);
> > +		fragments = drv_mgmt->free_fragments;
> >  		WARN_ON(!fragments);
> > -		g_free_fragments = *(char **)g_free_fragments;
> > -		up(&g_free_fragments_mutex);
> > +		drv_mgmt->free_fragments = *(char **)drv_mgmt->free_fragments;
> > +		up(&drv_mgmt->free_fragments_mutex);
> >  		pagelist->type = PAGELIST_READ_WITH_FRAGMENTS +
> > -			(fragments - g_fragments_base) / g_fragments_size;
> > +			(fragments - drv_mgmt->fragments_base) / drv_mgmt->fragments_size;
> >  	}
> >  
> >  	return pagelistinfo;
> > @@ -455,10 +449,10 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
> >  	pagelistinfo->scatterlist_mapped = 0;
> >  
> >  	/* Deal with any partial cache lines (fragments) */
> > -	if (pagelist->type >= PAGELIST_READ_WITH_FRAGMENTS && g_fragments_base) {
> > -		char *fragments = g_fragments_base +
> > +	if (pagelist->type >= PAGELIST_READ_WITH_FRAGMENTS && drv_mgmt->fragments_base) {
> > +		char *fragments = drv_mgmt->fragments_base +
> >  			(pagelist->type - PAGELIST_READ_WITH_FRAGMENTS) *
> > -			g_fragments_size;
> > +			drv_mgmt->fragments_size;
> >  		int head_bytes, tail_bytes;
> >  
> >  		head_bytes = (drv_mgmt->info->cache_line_size - pagelist->offset) &
> > @@ -483,11 +477,11 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
> >  				fragments + drv_mgmt->info->cache_line_size,
> >  				tail_bytes);
> >  
> > -		down(&g_free_fragments_mutex);
> > -		*(char **)fragments = g_free_fragments;
> > -		g_free_fragments = fragments;
> > -		up(&g_free_fragments_mutex);
> > -		up(&g_free_fragments_sema);
> > +		down(&drv_mgmt->free_fragments_mutex);
> > +		*(char **)fragments = drv_mgmt->free_fragments;
> > +		drv_mgmt->free_fragments = fragments;
> > +		up(&drv_mgmt->free_fragments_mutex);
> > +		up(&drv_mgmt->free_fragments_sema);
> >  	}
> >  
> >  	/* Need to mark all the pages dirty. */
> > @@ -523,11 +517,11 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
> >  	if (err < 0)
> >  		return err;
> >  
> > -	g_fragments_size = 2 * drv_mgmt->info->cache_line_size;
> > +	drv_mgmt->fragments_size = 2 * drv_mgmt->info->cache_line_size;
> >  
> >  	/* Allocate space for the channels in coherent memory */
> >  	slot_mem_size = PAGE_ALIGN(TOTAL_SLOTS * VCHIQ_SLOT_SIZE);
> > -	frag_mem_size = PAGE_ALIGN(g_fragments_size * MAX_FRAGMENTS);
> > +	frag_mem_size = PAGE_ALIGN(drv_mgmt->fragments_size * MAX_FRAGMENTS);
> >  
> >  	slot_mem = dmam_alloc_coherent(dev, slot_mem_size + frag_mem_size,
> >  				       &slot_phys, GFP_KERNEL);
> > @@ -547,15 +541,16 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
> >  	vchiq_slot_zero->platform_data[VCHIQ_PLATFORM_FRAGMENTS_COUNT_IDX] =
> >  		MAX_FRAGMENTS;
> >  
> > -	g_fragments_base = (char *)slot_mem + slot_mem_size;
> > +	drv_mgmt->fragments_base = (char *)slot_mem + slot_mem_size;
> >  
> > -	g_free_fragments = g_fragments_base;
> > +	drv_mgmt->free_fragments = drv_mgmt->fragments_base;
> >  	for (i = 0; i < (MAX_FRAGMENTS - 1); i++) {
> > -		*(char **)&g_fragments_base[i * g_fragments_size] =
> > -			&g_fragments_base[(i + 1) * g_fragments_size];
> > +		*(char **)&drv_mgmt->fragments_base[i * drv_mgmt->fragments_size] =
> > +			&drv_mgmt->fragments_base[(i + 1) * drv_mgmt->fragments_size];
> >  	}
> > -	*(char **)&g_fragments_base[i * g_fragments_size] = NULL;
> > -	sema_init(&g_free_fragments_sema, MAX_FRAGMENTS);
> > +	*(char **)&drv_mgmt->fragments_base[i * drv_mgmt->fragments_size] = NULL;
> > +	sema_init(&drv_mgmt->free_fragments_sema, MAX_FRAGMENTS);
> > +	sema_init(&drv_mgmt->free_fragments_mutex, 1);
> >  
> >  	err = vchiq_init_state(state, vchiq_slot_zero, dev);
> >  	if (err)
> > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> > index 4a5b5ae9625a..a3bba245bfe2 100644
> > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> > @@ -59,6 +59,12 @@ struct vchiq_drv_mgmt {
> >  	struct mutex connected_mutex;
> >  
> >  	void (*deferred_callback[VCHIQ_DRV_MAX_CALLBACKS])(void);
> > +
> > +	struct semaphore free_fragments_sema;
> > +	struct semaphore free_fragments_mutex;

Could we turn the latter into a mutex (in a separate patch) ?

> > +	char *fragments_base;
> > +	char *free_fragments;
> > +	unsigned int fragments_size;
> >  };
> >  
> >  struct user_service {

-- 
Regards,

Laurent Pinchart
