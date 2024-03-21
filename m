Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC625CB5
	for <linux-staging@lists.linux.dev>; Thu, 21 Mar 2024 19:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711048235; cv=none; b=QWvVbqkqxezUsDz61x2mve6iQo0kI93E9JShnaDE0MjgYWAxkGT7MwN5+pCI9wX3FfmUeNY5UbmCqzz+wXjOqGK3FY/J59Y/bqy9lCPxVhHNs8BA/j48oV2q5ToH6pSR7lW6QvqNxnVCdxM9plETDo4lOCBfi3eOXLjH3DO8+Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711048235; c=relaxed/simple;
	bh=OaIcwqND0RV6eU6srcYe+zV05J1MZZuHTeLZ+5n59vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZMVHE6fgQYYAGvmFn0EpyueR5C8W8VRC1tdahX0hWGpgM5CZGXW7llMwjnkSBJmJDUCop9z/4ZnlIBoxpVK0cuc6Odt6IqzVAiR6IK+j1KLS3b+dCHgI1BAt8fBFj2WbeyfrpMPOW7baVyk097bp5WzvP/eeeiEq4nwrnZteyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h/B2AX3M; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h/B2AX3M"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6CD07E4;
	Thu, 21 Mar 2024 20:10:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711048202;
	bh=OaIcwqND0RV6eU6srcYe+zV05J1MZZuHTeLZ+5n59vs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h/B2AX3Mm++eq+/1iNSxHeTuiS0v1JwqbtRE/6/diemNUcvt4i9VHJbgIddnNH8KL
	 QQKgCPYzF2N79Z1QIzxVx22TUi+45DvnwS9jHnjfBge9tqPpnzDfytgevnA9BEHhnh
	 pu5ePtW0eRFo0ouis3E6GYXxNISNDwyNM8M6LEW8=
Date: Thu, 21 Mar 2024 21:10:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Greg KH <greg@kroah.com>
Subject: Re: [PATCH v3 3/6] staging: vc04_services: vchiq_arm: Drop
 g_cache_line_size
Message-ID: <20240321191027.GA15907@pendragon.ideasonboard.com>
References: <20240321103740.808561-1-umang.jain@ideasonboard.com>
 <20240321103740.808561-4-umang.jain@ideasonboard.com>
 <20240321190430.GW9582@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240321190430.GW9582@pendragon.ideasonboard.com>

On Thu, Mar 21, 2024 at 09:04:32PM +0200, Laurent Pinchart wrote:
> Hi Umang,
> 
> Thank you for the patch.
> 
> On Thu, Mar 21, 2024 at 04:07:37PM +0530, Umang Jain wrote:
> > The cache-line-size is cached in struct vchiq_platform_info.
> > There is no need to cache this again via g_cache_line_size.
> > Instead use the value from vchiq_platform_info directly.
> > 
> > Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> > ---
> >  .../interface/vchiq_arm/vchiq_arm.c           | 49 +++++++++++--------
> >  1 file changed, 29 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > index 73405a1f50ee..01b4e4b010c6 100644
> > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > @@ -71,6 +71,17 @@ static struct vchiq_device *bcm2835_audio;
> >  static struct vchiq_device *bcm2835_camera;
> >  
> >  static struct vchiq_platform_info bcm2835_info = {
> > +	/*
> > +	 * This value is the size of the L2 cache lines as understood by the
> > +	 * VPU firmware, which determines the required alignment of the
> > +	 * offsets/sizes in pagelists.
> 
> This belongs to a kerneldoc block for the vchiq_drvdata structure.
> 
> > +	 *
> > +	 * Modern VPU firmware looks for a DT "cache-line-size" property in
> > +	 * the VCHIQ node and will overwrite it with the actual L2 cache size,
> > +	 * which the kernel must then respect.  That property was rejected
> > +	 * upstream, so we have to use the VPU firmware's compatibility value
> > +	 * of 32.
> 
> This should be moved to the same location too, but the comment is a bit
> outdated, as the driver uses 64 for bcm2836 and compatible. You could
> write
> 
> 	 * Modern VPU firmware looks for a DT "cache-line-size" property in the
> 	 * VCHIQ node and will overwrite it with the actual L2 cache size, which
> 	 * the kernel must then respect. That property was rejected upstream, so
> 	 * we use a value derived from the compatible string.
> 
> > +	 */
> >  	.cache_line_size = 32,
> >  };
> >  
> > @@ -130,17 +141,6 @@ struct vchiq_pagelist_info {
> >  };
> >  
> >  static void __iomem *g_regs;
> > -/* This value is the size of the L2 cache lines as understood by the
> > - * VPU firmware, which determines the required alignment of the
> > - * offsets/sizes in pagelists.
> > - *
> > - * Modern VPU firmware looks for a DT "cache-line-size" property in
> > - * the VCHIQ node and will overwrite it with the actual L2 cache size,
> > - * which the kernel must then respect.  That property was rejected
> > - * upstream, so we have to use the VPU firmware's compatibility value
> > - * of 32.
> > - */
> > -static unsigned int g_cache_line_size = 32;
> >  static unsigned int g_fragments_size;
> >  static char *g_fragments_base;
> >  static char *g_free_fragments;
> > @@ -211,6 +211,8 @@ static struct vchiq_pagelist_info *
> >  create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
> >  		size_t count, unsigned short type)
> >  {
> > +	struct platform_device *pdev;
> > +	struct vchiq_drv_mgmt *drv_mgmt;
> >  	struct pagelist *pagelist;
> >  	struct vchiq_pagelist_info *pagelistinfo;
> >  	struct page **pages;
> > @@ -225,6 +227,9 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
> >  	if (count >= INT_MAX - PAGE_SIZE)
> >  		return NULL;
> >  
> > +	pdev = to_platform_device(instance->state->dev->parent);
> > +	drv_mgmt = platform_get_drvdata(pdev);
> 
> 	drv_mgmt = dev_get_drvdata(instance->state->dev->parent);
> 
> Same below.
> 
> On a related note, I think you should move the contents of
> vchiq_connected.c to vchiq_arm.c. It's a small file, containing two
> functions only, with one of them being called only from vchiq_arm.c. It
> would allow you to make the vchiq_drv_mgmt structure private to
> vchiq_arm.c. This can be done on top of this series.

In which case vchiq_call_connected_callbacks() would become a static
function, the vchiq_add_connected_callback() function declaration could
go to vchiq.h or vchiq_bus.h, and vchiq_connected.h should be dropped.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > +
> >  	if (buf)
> >  		offset = (uintptr_t)buf & (PAGE_SIZE - 1);
> >  	else
> > @@ -367,9 +372,9 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
> >  
> >  	/* Partial cache lines (fragments) require special measures */
> >  	if ((type == PAGELIST_READ) &&
> > -	    ((pagelist->offset & (g_cache_line_size - 1)) ||
> > +	    ((pagelist->offset & (drv_mgmt->pinfo->cache_line_size - 1)) ||
> >  	    ((pagelist->offset + pagelist->length) &
> > -	    (g_cache_line_size - 1)))) {
> > +	    (drv_mgmt->pinfo->cache_line_size - 1)))) {
> >  		char *fragments;
> >  
> >  		if (down_interruptible(&g_free_fragments_sema)) {
> > @@ -395,12 +400,17 @@ static void
> >  free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagelistinfo,
> >  	      int actual)
> >  {
> > +	struct platform_device *pdev;
> > +	struct vchiq_drv_mgmt *drv_mgmt;
> >  	struct pagelist *pagelist = pagelistinfo->pagelist;
> >  	struct page **pages = pagelistinfo->pages;
> >  	unsigned int num_pages = pagelistinfo->num_pages;
> >  
> >  	dev_dbg(instance->state->dev, "arm: %pK, %d\n", pagelistinfo->pagelist, actual);
> >  
> > +	pdev = to_platform_device(instance->state->dev->parent);
> > +	drv_mgmt = platform_get_drvdata(pdev);
> > +
> >  	/*
> >  	 * NOTE: dma_unmap_sg must be called before the
> >  	 * cpu can touch any of the data/pages.
> > @@ -416,10 +426,10 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
> >  			g_fragments_size;
> >  		int head_bytes, tail_bytes;
> >  
> > -		head_bytes = (g_cache_line_size - pagelist->offset) &
> > -			(g_cache_line_size - 1);
> > +		head_bytes = (drv_mgmt->pinfo->cache_line_size - pagelist->offset) &
> > +			(drv_mgmt->pinfo->cache_line_size - 1);
> >  		tail_bytes = (pagelist->offset + actual) &
> > -			(g_cache_line_size - 1);
> > +			(drv_mgmt->pinfo->cache_line_size - 1);
> >  
> >  		if ((actual >= 0) && (head_bytes != 0)) {
> >  			if (head_bytes > actual)
> > @@ -434,8 +444,8 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
> >  		    (tail_bytes != 0))
> >  			memcpy_to_page(pages[num_pages - 1],
> >  				(pagelist->offset + actual) &
> > -				(PAGE_SIZE - 1) & ~(g_cache_line_size - 1),
> > -				fragments + g_cache_line_size,
> > +				(PAGE_SIZE - 1) & ~(drv_mgmt->pinfo->cache_line_size - 1),
> > +				fragments + drv_mgmt->pinfo->cache_line_size,
> >  				tail_bytes);
> >  
> >  		down(&g_free_fragments_mutex);
> > @@ -478,8 +488,7 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
> >  	if (err < 0)
> >  		return err;
> >  
> > -	g_cache_line_size = drv_mgmt->pinfo->cache_line_size;
> > -	g_fragments_size = 2 * g_cache_line_size;
> > +	g_fragments_size = 2 * drv_mgmt->pinfo->cache_line_size;
> >  
> >  	/* Allocate space for the channels in coherent memory */
> >  	slot_mem_size = PAGE_ALIGN(TOTAL_SLOTS * VCHIQ_SLOT_SIZE);

-- 
Regards,

Laurent Pinchart
