Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA6170
	for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 07:31:17 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id c20so4513418ejm.3
        for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 00:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2s5ywBHsrU7eY4+pdhOY5TSUeux5Mdd0Ce+3z5URkoI=;
        b=cfDMyulHQTGB3wWi2mFtPN1eYPppu5us/RupyTGKIRhcvVbHyI0IEVWqAE/iT1jB4T
         C0btNW0qA/Hn8Osuc+Rt0mqTWEx68FKPe1Kyt4kCxmHL3AAzjc8hmW4FtditidRghD6F
         KxhGuh6a9WztGmjqdxqQGJKthkU+6qMTCH5Vr+4ZDfojMBOpkAyI0bxRtpDcFqBxzoIF
         7/z8A+dTyYNJDGpLQ/W+WOl1x3xx/T+BoNx453/EdRO9At/tngogCU0jEHkX9LCBX2Zz
         RcM+GtqEqBWCj5q9wk/rl82D+4mHz3hg2Pgx6X5gaEYdruXYdH4FWf/qISH0OLXuDcgD
         GHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2s5ywBHsrU7eY4+pdhOY5TSUeux5Mdd0Ce+3z5URkoI=;
        b=T3aKFlGi6NJNBRKDvgdSH3zdb3wROMt6tIsKCpAkzNl3I6nmmNWr76CPD30jmAAC9Z
         +wyBCOHwuULCekE9w7GwAHWz2rKjpyXJ+yH6zoxnlsAX5U9SXDMzj3XpOxb2ImCGECBv
         ACF5k2ybivdyILl4i494o1HtD04No6lwDhYW9ODOIyxxogko4AS4ceELfznJcy7nXFO1
         dwExyk5xYSDWcQIUnO4Dt7e7RNbT0UXCmyJ54MyeVxFhC+LiE5dQHnq75K6vzQ+6tDTE
         g7paDQT29UjWw4/S3cXfci4mENoEwGn22ltPjmPfwK6Go7AsgSdQ0HzhKAXrqQgbRrSR
         bvLA==
X-Gm-Message-State: AOAM533S1bQZpUvtnYdurX+sa2XN0TF6k6PfthFD007v/2NwUtGly1FC
	XFKpzj2PEzY+CAYGStn7bFw=
X-Google-Smtp-Source: ABdhPJz6D7A7zHyO3LjlLd2kUiQmAAuO9w2973ad4LNVGEg5SWx4JwOo9576gn5PiZR6eW6YXMvnIg==
X-Received: by 2002:a17:906:e10b:: with SMTP id gj11mr19208002ejb.202.1621150276346;
        Sun, 16 May 2021 00:31:16 -0700 (PDT)
Received: from agape.jhs ([5.171.80.208])
        by smtp.gmail.com with ESMTPSA id bh2sm5486101ejb.80.2021.05.16.00.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 00:31:16 -0700 (PDT)
Date: Sun, 16 May 2021 09:31:13 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 03/20] staging: vchiq_core: separate postfix increment
Message-ID: <20210516073112.GB1410@agape.jhs>
References: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
 <1621105859-30215-4-git-send-email-stefan.wahren@i2se.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621105859-30215-4-git-send-email-stefan.wahren@i2se.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Stefan,

On Sat, May 15, 2021 at 09:10:42PM +0200, Stefan Wahren wrote:
> Postfix increment within a complexer statement doesn't improve readability.
> So separate them.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  .../vc04_services/interface/vchiq_arm/vchiq_core.c       | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index 85fd0a6..a22d8b7 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -243,7 +243,8 @@ __next_service_by_instance(struct vchiq_state *state,
>  	while (idx < state->unused_service) {
>  		struct vchiq_service *srv;
>  
> -		srv = rcu_dereference(state->services[idx++]);
> +		srv = rcu_dereference(state->services[idx]);
> +		idx++;
>  		if (srv && srv->srvstate != VCHIQ_SRVSTATE_FREE &&
>  		    srv->instance == instance) {
>  			service = srv;
> @@ -649,11 +650,12 @@ process_free_queue(struct vchiq_state *state, BITSET_T *service_found,
>  
>  	while (slot_queue_available != local->slot_queue_recycle) {
>  		unsigned int pos;
> -		int slot_index = local->slot_queue[slot_queue_available++ &
> +		int slot_index = local->slot_queue[slot_queue_available &
>  			VCHIQ_SLOT_QUEUE_MASK];
>  		char *data = (char *)SLOT_DATA_FROM_INDEX(state, slot_index);
>  		int data_found = 0;
>  
> +		slot_queue_available++;
>  		/*
>  		 * Beware of the address dependency - data is calculated
>  		 * using an index written by the other side.
> @@ -1175,7 +1177,6 @@ static void
>  release_slot(struct vchiq_state *state, struct vchiq_slot_info *slot_info,
>  	     struct vchiq_header *header, struct vchiq_service *service)
>  {
> -
>  	mutex_lock(&state->recycle_mutex);

this change is a separate logical change so should go in a separate patch...

>  
>  	if (header) {
> @@ -2215,7 +2216,8 @@ vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero)
>  	}
>  
>  	for (i = local->slot_first; i <= local->slot_last; i++) {
> -		local->slot_queue[state->slot_queue_available++] = i;
> +		local->slot_queue[state->slot_queue_available] = i;
> +		state->slot_queue_available++;
>  		complete(&state->slot_available_event);
>  	}
>  
> @@ -2319,7 +2321,8 @@ void vchiq_msg_queue_push(unsigned int handle, struct vchiq_header *header)
>  			flush_signals(current);
>  	}
>  
> -	pos = service->msg_queue_write++ & (VCHIQ_MAX_SLOTS - 1);
> +	pos = service->msg_queue_write & (VCHIQ_MAX_SLOTS - 1);
> +	service->msg_queue_write++;
>  	service->msg_queue[pos] = header;
>  
>  	complete(&service->msg_queue_push);
> @@ -2340,7 +2343,8 @@ struct vchiq_header *vchiq_msg_hold(unsigned int handle)
>  			flush_signals(current);
>  	}
>  
> -	pos = service->msg_queue_read++ & (VCHIQ_MAX_SLOTS - 1);
> +	pos = service->msg_queue_read & (VCHIQ_MAX_SLOTS - 1);
> +	service->msg_queue_read++;
>  	header = service->msg_queue[pos];
>  
>  	complete(&service->msg_queue_pop);
> -- 
> 2.7.4
> 
> 

thank you,

fabio
