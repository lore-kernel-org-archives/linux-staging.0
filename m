Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EAF18C32E
	for <linux-staging@lists.linux.dev>; Wed,  5 Jun 2024 07:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717571444; cv=none; b=Nym2bmnp0HitvIJloGhzB5qK7ms8z1pX6kgQYgvxjjRInhdwNExgh71RWifGsAuwpNZ6pFhNIqtgXzt1pHevWSj5i7nuwOGtExdmuHjRYXn1kG7ukU7MjoQ6YVZorsXtihuXFoSUxrw5wLJYirLR8dVEQ6BkWkR78gden0r586M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717571444; c=relaxed/simple;
	bh=FlyDA7hSBcLk27B60r6BgU4NIm4yp715BkqHmqInYBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TSXfY91vi5kpu9pvkYKdyVcr0gExo2japLQk82eNc6hKJBA/SBFyrB+/yxhtfwzULhlUTYQXUdcHshndwpYbwYnmXxNRK2LO1si+JnCJsG4m+KqzbRzQgWs+DLQq1gZKlbte4nqi86Zzoc0pZF19sQw7i3o4Wn6r8Jt2MrbsQMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OahbQad+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OahbQad+"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 75F08BEB;
	Wed,  5 Jun 2024 09:10:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717571432;
	bh=FlyDA7hSBcLk27B60r6BgU4NIm4yp715BkqHmqInYBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OahbQad+E98NwcB6EaopIO3pfmjW4BkGjjBFa0vlswGyIZKGeVaPGR5LEAHKMiTRK
	 26GO0LCoGq0YTYwv+yUM/FtppvcYScO/1TPR5/JojfDp3pzNWMHqFjO8pr0vz/Ss6J
	 0ychSLZjMBww2wuCY/0VjT56KJeyFptq5W3AvGqQ=
Date: Wed, 5 Jun 2024 10:10:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH 08/11] staging: vchiq_core: Add comments to
 mutex/spinlocks
Message-ID: <20240605071024.GC3488@pendragon.ideasonboard.com>
References: <20240604172904.61613-1-wahrenst@gmx.net>
 <20240604172904.61613-9-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240604172904.61613-9-wahrenst@gmx.net>

Hi Stefan and Phil,

Thank you for the patch.

On Tue, Jun 04, 2024 at 07:29:01PM +0200, Stefan Wahren wrote:
> From: Phil Elwell <phil@raspberrypi.com>
> 
> checkpatch.pl complains about missing comments at
> mutex/spinlock definitions. So add them accordingly.

Less warnings is good, but we should address the problem they outline,
not just silence them for the sake of it. It would be better, for each
lock, to explicitly list the data fields the lock protects.

> Link: https://github.com/raspberrypi/linux/pull/6139/
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  .../vc04_services/interface/vchiq_arm/vchiq_core.h     | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> index 3c7a6838ddba..3abcd6910f25 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> @@ -196,6 +196,8 @@ struct vchiq_service {
> 
>  	struct completion remove_event;
>  	struct completion bulk_remove_event;
> +
> +	/* Serialise access to the bulk transfer queues */
>  	struct mutex bulk_mutex;
> 
>  	struct service_stats_struct {
> @@ -312,7 +314,7 @@ struct vchiq_state {
>  	/* Event indicating connect message received */
>  	struct completion connect;
> 
> -	/* Mutex protecting services */
> +	/* Mutex protecting service creation */
>  	struct mutex mutex;
>  	struct vchiq_instance **instance;
> 
> @@ -341,16 +343,22 @@ struct vchiq_state {
>  	char *rx_data;
>  	struct vchiq_slot_info *rx_info;
> 
> +	/* Serialise access to the main message slots */
>  	struct mutex slot_mutex;
> 
> +	/* Serialise slot refcount updates */
>  	struct mutex recycle_mutex;
> 
> +	/* Serialise access to the single synchronous message slot */
>  	struct mutex sync_mutex;
> 
> +	/* Serialise access to the message queues to userspace */
>  	spinlock_t msg_queue_spinlock;
> 
> +	/* Serialise completion of blocking transfers */
>  	spinlock_t bulk_waiter_spinlock;
> 
> +	/* Serialise updates to slot quota data */
>  	spinlock_t quota_spinlock;
> 
>  	/*

-- 
Regards,

Laurent Pinchart
