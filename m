Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9577B190466
	for <linux-staging@lists.linux.dev>; Wed,  5 Jun 2024 07:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717570848; cv=none; b=HWJkKkTdmnIggabvacG9sgNmOwRYaTtJ8z9AGsooYB3zYoBQ35G4fU4JgYzMkEF/Uxp56OaRSLotV/QlXRwO8aNr/nOzgaHYicSiQ5ZUoVzGwQT1/ydax6zoChBnxnjqXDN37iA+m1YT7yjeM2DA1auiyIWrLoj1GwZ7qtsV6LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717570848; c=relaxed/simple;
	bh=fQG32YgTpUKl2pXjw9M/F4G7pERZLI7HHpvtNjYxbWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nDVAS1IJCGPfU/KAl1n4M5n6u56M+rbR7U+4Mu3Y9Bm0zuogswkm1IOFgiA/zJweariARfheCadGyraLaDymhnoZTBQ8WFZ5yYdhLQymYsmyMwpTP8IYlRg/NtxlW5D1CbyBezyjzgXILHMh+ibU75lWkTAfarnjdxD/4nge3HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BoUouOTT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BoUouOTT"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 759B015C5;
	Wed,  5 Jun 2024 09:00:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717570835;
	bh=fQG32YgTpUKl2pXjw9M/F4G7pERZLI7HHpvtNjYxbWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BoUouOTTikHlMtgr5xQK0VkHuY7/01F0ux81hysIj60S64CnIKxS2Ols9idRTdVSr
	 kC36qq9WzRoC5gx7KRGXhOMLyGy4aik5EbJO1gYj6YlXMDMILEBO2gbU0Tg0x8ZbtF
	 7bUGPEenToNQt5uUrRhaYKH7pJ877TcHxDJnqTAk=
Date: Wed, 5 Jun 2024 10:00:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 03/11] staging: vchiq_core: Drop non-functional struct
 members
Message-ID: <20240605070025.GE879@pendragon.ideasonboard.com>
References: <20240604172904.61613-1-wahrenst@gmx.net>
 <20240604172904.61613-4-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240604172904.61613-4-wahrenst@gmx.net>

Hi Stefan,

Thank you for the patch.

On Tue, Jun 04, 2024 at 07:28:56PM +0200, Stefan Wahren wrote:
> There are some struct members, which don't have a real
> function. So it's safe to drop them.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Both fields are unused in the RPi kernel as well, so this looks fine to
me.

The last user of bulk_transfer_mutex was removed in commit
14f4d72fb799a9b3170a45ab80d4a3ddad541960 which you could reference if
desired. slot_remove_event has never been used.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c    | 2 --
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_core.h    | 4 ----
>  2 files changed, 6 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index df3af821f218..51cfc366519b 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -2163,14 +2163,12 @@ vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero, s
>  	mutex_init(&state->slot_mutex);
>  	mutex_init(&state->recycle_mutex);
>  	mutex_init(&state->sync_mutex);
> -	mutex_init(&state->bulk_transfer_mutex);
> 
>  	spin_lock_init(&state->msg_queue_spinlock);
>  	spin_lock_init(&state->bulk_waiter_spinlock);
>  	spin_lock_init(&state->quota_spinlock);
> 
>  	init_completion(&state->slot_available_event);
> -	init_completion(&state->slot_remove_event);
>  	init_completion(&state->data_quota_event);
> 
>  	state->slot_queue_available = 0;
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> index 8af209e34fb2..be20abcfad75 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> @@ -347,8 +347,6 @@ struct vchiq_state {
> 
>  	struct mutex sync_mutex;
> 
> -	struct mutex bulk_transfer_mutex;
> -
>  	spinlock_t msg_queue_spinlock;
> 
>  	spinlock_t bulk_waiter_spinlock;
> @@ -393,8 +391,6 @@ struct vchiq_state {
>  	/* Signalled when a free slot becomes available. */
>  	struct completion slot_available_event;
> 
> -	struct completion slot_remove_event;
> -
>  	/* Signalled when a free data slot becomes available. */
>  	struct completion data_quota_event;
> 

-- 
Regards,

Laurent Pinchart
