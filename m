Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFE88F6B
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 23:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711666906; cv=none; b=nHkT7KU4uhR/CaXpNTFZf7GXzt5P+g5ikTHOaYOKPXrxcX8tJm804xbeCrwzZjwUZD+2DdpSx1oo4F9drH1/qN+btRweK43S6q82poRouIeOyLollHLNSqDm7N9GqMzsnlUM1XN0UUH+AYCBxJph00cZr2Doa1snATtJhSNncbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711666906; c=relaxed/simple;
	bh=jIHKEaz/kIP7GmQqwrdppw0M0FsPPnt0q+fVc8vd7J8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WUtCbeV5hmwnBMyppCHuvOHBDfCgJGl09YO6hAV1Xo1PfAVHe8v+EDy92N/9U0b5o7RrK47ko59pDuD7DSsFLOlcOAjyy3h3R1DRtz/hZEUOsLMrgIETdPcyzejxKmgNmPqxOjdwrv7qgP2ty99g4JziBWgNZjI9f3QJLhZZ+7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HN2gA6JU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HN2gA6JU"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC6DB669;
	Fri, 29 Mar 2024 00:01:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711666870;
	bh=jIHKEaz/kIP7GmQqwrdppw0M0FsPPnt0q+fVc8vd7J8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HN2gA6JUATGgFfjJnWLdaMZQuoX43TtkGpFxzg8uPuX0mVj9iI7ESIEMfEyLZY9/m
	 UNSDKNpp0LZc2sTRjTOGPO8XLBaWwkBjauyNOLbTXKD8TA0GR2tQBp7VA4SjJnGJrN
	 qI+OUAQ86VcXdYoOW3+d3FJJL1T63doRgmskigxI=
Date: Fri, 29 Mar 2024 01:01:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v4 07/11] staging: vc04_services: Move global memory
 mapped pointer
Message-ID: <20240328230132.GL11463@pendragon.ideasonboard.com>
References: <20240328181134.1548799-1-umang.jain@ideasonboard.com>
 <20240328181134.1548799-8-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240328181134.1548799-8-umang.jain@ideasonboard.com>

Hi Umang,

Thank you for the patch.

On Thu, Mar 28, 2024 at 11:41:29PM +0530, Umang Jain wrote:
> g_regs stores the remapped memory pointer for the vchiq platform.
> It can be moved to struct vchiq_drv_mgmt instead of being global.
> 
> Adjust the affected functions accordingly. Pass vchiq_state pointer
> wherever necessary to access struct vchiq_drv_mgmt.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../interface/vchiq_arm/vchiq_arm.c           | 19 +++++++++++--------
>  .../interface/vchiq_arm/vchiq_arm.h           |  2 ++
>  .../interface/vchiq_arm/vchiq_core.c          | 10 +++++-----
>  .../interface/vchiq_arm/vchiq_core.h          |  2 +-
>  4 files changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index b335948f4b0c..0c7dd45969ae 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -129,8 +129,6 @@ struct vchiq_pagelist_info {
>  	unsigned int scatterlist_mapped;
>  };
>  
> -static void __iomem *g_regs;
> -
>  static int
>  vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned int handle, void *data,
>  			     unsigned int size, enum vchiq_bulk_dir dir);
> @@ -139,11 +137,14 @@ static irqreturn_t
>  vchiq_doorbell_irq(int irq, void *dev_id)
>  {
>  	struct vchiq_state *state = dev_id;
> +	struct vchiq_drv_mgmt *mgmt;
>  	irqreturn_t ret = IRQ_NONE;
>  	unsigned int status;
>  
> +	mgmt = dev_get_drvdata(state->dev);
> +
>  	/* Read (and clear) the doorbell */
> -	status = readl(g_regs + BELL0);
> +	status = readl(mgmt->regs + BELL0);
>  
>  	if (status & ARM_DS_ACTIVE) {  /* Was the doorbell rung? */
>  		remote_event_pollall(state);
> @@ -556,9 +557,9 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
>  	if (err)
>  		return err;
>  
> -	g_regs = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(g_regs))
> -		return PTR_ERR(g_regs);
> +	drv_mgmt->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(drv_mgmt->regs))
> +		return PTR_ERR(drv_mgmt->regs);
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq <= 0)
> @@ -641,8 +642,10 @@ static struct vchiq_arm_state *vchiq_platform_get_arm_state(struct vchiq_state *
>  }
>  
>  void
> -remote_event_signal(struct remote_event *event)
> +remote_event_signal(struct vchiq_state *state, struct remote_event *event)
>  {
> +	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(state->dev);
> +
>  	/*
>  	 * Ensure that all writes to shared data structures have completed
>  	 * before signalling the peer.
> @@ -654,7 +657,7 @@ remote_event_signal(struct remote_event *event)
>  	dsb(sy);         /* data barrier operation */
>  
>  	if (event->armed)
> -		writel(0, g_regs + BELL2); /* trigger vc interrupt */
> +		writel(0, mgmt->regs + BELL2); /* trigger vc interrupt */
>  }
>  
>  int
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> index a3bba245bfe2..f17c22635ce5 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> @@ -65,6 +65,8 @@ struct vchiq_drv_mgmt {
>  	char *fragments_base;
>  	char *free_fragments;
>  	unsigned int fragments_size;
> +
> +	void __iomem *regs;
>  };
>  
>  struct user_service {
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index 658d19f1e7e8..af633ff984f6 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -691,7 +691,7 @@ reserve_space(struct vchiq_state *state, size_t space, int is_blocking)
>  			/* But first, flush through the last slot. */
>  			state->local_tx_pos = tx_pos;
>  			local->tx_pos = tx_pos;
> -			remote_event_signal(&state->remote->trigger);
> +			remote_event_signal(state, &state->remote->trigger);
>  
>  			if (!is_blocking ||
>  			    (wait_for_completion_interruptible(&state->slot_available_event)))
> @@ -1124,7 +1124,7 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
>  	if (!(flags & QMFLAGS_NO_MUTEX_UNLOCK))
>  		mutex_unlock(&state->slot_mutex);
>  
> -	remote_event_signal(&state->remote->trigger);
> +	remote_event_signal(state, &state->remote->trigger);
>  
>  	return 0;
>  }
> @@ -1202,7 +1202,7 @@ queue_message_sync(struct vchiq_state *state, struct vchiq_service *service,
>  		&svc_fourcc, VCHIQ_MSG_SRCPORT(msgid),
>  		VCHIQ_MSG_DSTPORT(msgid), size);
>  
> -	remote_event_signal(&state->remote->sync_trigger);
> +	remote_event_signal(state, &state->remote->sync_trigger);
>  
>  	if (VCHIQ_MSG_TYPE(msgid) != VCHIQ_MSG_PAUSE)
>  		mutex_unlock(&state->sync_mutex);
> @@ -1260,7 +1260,7 @@ release_slot(struct vchiq_state *state, struct vchiq_slot_info *slot_info,
>  		 * A write barrier is necessary, but remote_event_signal
>  		 * contains one.
>  		 */
> -		remote_event_signal(&state->remote->recycle);
> +		remote_event_signal(state, &state->remote->recycle);
>  	}
>  
>  	mutex_unlock(&state->recycle_mutex);
> @@ -3240,7 +3240,7 @@ static void
>  release_message_sync(struct vchiq_state *state, struct vchiq_header *header)
>  {
>  	header->msgid = VCHIQ_MSGID_PADDING;
> -	remote_event_signal(&state->remote->sync_release);
> +	remote_event_signal(state, &state->remote->sync_release);
>  }
>  
>  int
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> index 5fbf173d9c56..8ca74b12427b 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> @@ -516,7 +516,7 @@ int vchiq_prepare_bulk_data(struct vchiq_instance *instance, struct vchiq_bulk *
>  
>  void vchiq_complete_bulk(struct vchiq_instance *instance, struct vchiq_bulk *bulk);
>  
> -void remote_event_signal(struct remote_event *event);
> +void remote_event_signal(struct vchiq_state *state, struct remote_event *event);
>  
>  void vchiq_dump_platform_state(struct seq_file *f);
>  

-- 
Regards,

Laurent Pinchart
