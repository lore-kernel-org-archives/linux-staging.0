Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAB827715
	for <linux-staging@lists.linux.dev>; Tue, 16 Apr 2024 06:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713249781; cv=none; b=iiJlxRlvE7DQmxysmYF6/cwUOVkQcNKS+sPsbQW7t2F9g776KJurlsjNdjGYe6O/rKIJt6M7qADOXYtzsdmMFEiTV6OMwK0V43PdsynIPOcQYAFcXydYWcmMT6UMcfAg4sT5arWW2lh8XwCM5QkKl0Nptq4J6JPkolbXXnozBKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713249781; c=relaxed/simple;
	bh=n6bO6kRdq9Znoqi0Wiy40EuYKaZ16iDx0eO8kyDhEAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f1cR3Fh72Fsq8W+SIrJzjPpcXPm5e2iKiDEiSnUiBnZmkq/1nnpjhH2BM4itz8mHz2LvK+Hmx2MrGICKcPdf+sM+o3aQvPZLfEgad83ATJmoCJB7PqsvXxbltfeCEcrR4YoFk2YQR7DBzNGBvPh8EHMjeuXeKBIfkHaI/O0OGic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JWUBmK5k; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JWUBmK5k"
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BFC97480;
	Tue, 16 Apr 2024 08:42:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713249725;
	bh=n6bO6kRdq9Znoqi0Wiy40EuYKaZ16iDx0eO8kyDhEAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JWUBmK5kj9Xa/2ObpEy+8A+nR1TqpNUKk4fHNM0W0Ez5YKtTjF81nPdQgXirFKOdb
	 oMRl2190DGv0EVNwwX4bYryLJEI2n8g1RO1XvOpQ3JgDyFkdRyJAQwhQClZBQNOukC
	 INwoy6/AWLwzUL9A38pcRZGwfesmeu4gvc1b4Yfo=
Date: Tue, 16 Apr 2024 09:42:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>
Subject: Re: [PATCH v5 07/11] staging: vc04_services: Move global memory
 mapped pointer
Message-ID: <20240416064243.GA32080@pendragon.ideasonboard.com>
References: <20240412075743.60712-1-umang.jain@ideasonboard.com>
 <20240412075743.60712-8-umang.jain@ideasonboard.com>
 <589da063-ede9-4696-acf6-d0006762b8a1@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <589da063-ede9-4696-acf6-d0006762b8a1@gmx.net>

Hello,

On Sun, Apr 14, 2024 at 01:58:04PM +0200, Stefan Wahren wrote:
> Am 12.04.24 um 09:57 schrieb Umang Jain:
> > g_regs stores the remapped memory pointer for the vchiq platform.
> > It can be moved to struct vchiq_drv_mgmt instead of being global.
> >
> > Adjust the affected functions accordingly. Pass vchiq_state pointer
> > wherever necessary to access struct vchiq_drv_mgmt.
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> > ---
> >   .../interface/vchiq_arm/vchiq_arm.c           | 19 +++++++++++--------
> >   .../interface/vchiq_arm/vchiq_arm.h           |  2 ++
> >   .../interface/vchiq_arm/vchiq_core.c          | 10 +++++-----
> >   .../interface/vchiq_arm/vchiq_core.h          |  2 +-
> >   4 files changed, 19 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > index 29f9affe5304..9fc98411a2b8 100644
> > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > @@ -129,8 +129,6 @@ struct vchiq_pagelist_info {
> >   	unsigned int scatterlist_mapped;
> >   };
> >
> > -static void __iomem *g_regs;
> > -
> >   static int
> >   vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned int handle, void *data,
> >   			     unsigned int size, enum vchiq_bulk_dir dir);
> > @@ -139,11 +137,14 @@ static irqreturn_t
> >   vchiq_doorbell_irq(int irq, void *dev_id)
> >   {
> >   	struct vchiq_state *state = dev_id;
> > +	struct vchiq_drv_mgmt *mgmt;
> >   	irqreturn_t ret = IRQ_NONE;
> >   	unsigned int status;
> >
> > +	mgmt = dev_get_drvdata(state->dev);
> Was there a reason against moving it in the declaration?
> > +
> >   	/* Read (and clear) the doorbell */
> > -	status = readl(g_regs + BELL0);
> > +	status = readl(mgmt->regs + BELL0);
> >
> >   	if (status & ARM_DS_ACTIVE) {  /* Was the doorbell rung? */
> >   		remote_event_pollall(state);
> > @@ -556,9 +557,9 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
> >   	if (err)
> >   		return err;
> >
> > -	g_regs = devm_platform_ioremap_resource(pdev, 0);
> > -	if (IS_ERR(g_regs))
> > -		return PTR_ERR(g_regs);
> > +	drv_mgmt->regs = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(drv_mgmt->regs))
> > +		return PTR_ERR(drv_mgmt->regs);
> >
> >   	irq = platform_get_irq(pdev, 0);
> >   	if (irq <= 0)
> > @@ -641,8 +642,10 @@ static struct vchiq_arm_state *vchiq_platform_get_arm_state(struct vchiq_state *
> >   }
> >
> >   void
> > -remote_event_signal(struct remote_event *event)
> > +remote_event_signal(struct vchiq_state *state, struct remote_event *event)
> >   {
> > +	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(state->dev);
> > +
> >   	/*
> >   	 * Ensure that all writes to shared data structures have completed
> >   	 * before signalling the peer.
> > @@ -654,7 +657,7 @@ remote_event_signal(struct remote_event *event)
> >   	dsb(sy);         /* data barrier operation */
> >
> >   	if (event->armed)
> > -		writel(0, g_regs + BELL2); /* trigger vc interrupt */
> > +		writel(0, mgmt->regs + BELL2); /* trigger vc interrupt */
> >   }
> >
> >   int
> > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> > index 52013bbc5171..10c1bdc50faf 100644
> > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> > @@ -50,6 +50,8 @@ struct vchiq_drv_mgmt {
> >   	char *fragments_base;
> >   	char *free_fragments;
> >   	unsigned int fragments_size;
> > +
> > +	void __iomem *regs;
>
> I'm not a expert about cache line alignment, but maybe this should be
> moved at the beginning of struct vchiq_drv_mgmt?
> 
> Not sure this would have a performance impact.

I don't think it will help much, but it shouldn't hurt.

-- 
Regards,

Laurent Pinchart
