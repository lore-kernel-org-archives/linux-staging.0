Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A54D70
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:23:29 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id r9so72461892ejj.3
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 00:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WIX5TU+Qdtin5MeNZ6xb7hSaRJuEkL/NWgbQmjBPH80=;
        b=tXZVYJDqtFhFMMsrJeSiUMilYcr2JiJJOEfvkB5fjWZBDtqu9SMlxTRguNEVHhaszT
         r/qBSFPqQoq8fqDUWnghIJ33bZa52xtcLlPRM1BZLkBepPp+V8MR+9e+O5KeAGlaWQvR
         ScCQSp2yUWgwx56qgDiPefBxYXLXgvUEUD6ZuZuM/cteseDHHFV9FTzlbEy0OgsUbp/r
         F6dbtFylwjIllwVNgUhRpUXs6iPIulfvLqTD+l1JB5IbrVw6j891jZhBS5NWa60mUluA
         Keg5OCL0Bel3go34KWJBgkK0QzRWSmP+6CwFlMP3INvx+dARf+8rAKDoqbOBA67iEd1I
         vVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WIX5TU+Qdtin5MeNZ6xb7hSaRJuEkL/NWgbQmjBPH80=;
        b=WLVzDi74Rym6BxcS1lpkQedaTBQS+xRFzIFQJ8YKokmdVUZdnavewr6YRlXBhOsEqY
         B39SX4Sg0A8t290KnSnLcoMevyWXZ3mO1/OP9T+bov6P1Vi11YvjVPSkjfWyfLDiTMGk
         g7Xjv1SrGIeIYjp6qVrYhDwIqhI6kX+vzfJ/UCdnUwGUYfIJZuc3h7ll7LwhI+j02iIm
         aXAu0Sowykz2Og1gM1AwAJJZwJBULEr9FL26xgu7mc0ajP5vKrFSkgd5W7+isjCC0FeY
         WVNLFv++b/3jHjMrOWAXT2Z+owzJ3OlzgSMD4/pu3N02fUcp3nsxigNGZ17QBxRa0NWu
         PV0Q==
X-Gm-Message-State: AOAM5321oC10mAiRF7SfMq6MRCueiVGH51KIeuzoYBitpgLlQJRIac7A
	Qa5CP0+AbbMVpdUSX4C2QAxlwUOQvrU=
X-Google-Smtp-Source: ABdhPJytz2mVM37WIClWsaXNQSaugbRkF8ICDEjiRUEEuCjCBfIh/iq5Ctu825godIeAe+kzmkH5sQ==
X-Received: by 2002:a17:906:840a:: with SMTP id n10mr2724654ejx.59.1619162608232;
        Fri, 23 Apr 2021 00:23:28 -0700 (PDT)
Received: from agape.jhs ([5.171.80.34])
        by smtp.gmail.com with ESMTPSA id lj21sm3292038ejb.74.2021.04.23.00.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 00:23:27 -0700 (PDT)
Date: Fri, 23 Apr 2021 09:23:25 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 03/10] staging: vchiq_core: introduce get_bulk_reason
Message-ID: <20210423072324.GA1442@agape.jhs>
References: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
 <1619122076-31785-4-git-send-email-stefan.wahren@i2se.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1619122076-31785-4-git-send-email-stefan.wahren@i2se.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Apr 22, 2021 at 10:07:49PM +0200, Stefan Wahren wrote:
> Nesting multiple ternary operators over multiple lines isn't easy to
> read. Move this logic into a separate inline function.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  .../vc04_services/interface/vchiq_arm/vchiq_core.c | 35 ++++++++++++++--------
>  1 file changed, 22 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index 8a1e6f5..3a72c36 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -1226,6 +1226,22 @@ release_slot(struct vchiq_state *state, struct vchiq_slot_info *slot_info,
>  	mutex_unlock(&state->recycle_mutex);
>  }
>  
> +static inline enum vchiq_reason
> +get_bulk_reason(struct vchiq_bulk *bulk)
> +{
> +	if (bulk->dir == VCHIQ_BULK_TRANSMIT) {
> +		if (bulk->actual == VCHIQ_BULK_ACTUAL_ABORTED)
> +			return VCHIQ_BULK_TRANSMIT_ABORTED;
> +
> +		return VCHIQ_BULK_TRANSMIT_DONE;
> +	}
> +
> +	if (bulk->actual == VCHIQ_BULK_ACTUAL_ABORTED)
> +		return VCHIQ_BULK_RECEIVE_ABORTED;
> +
> +	return VCHIQ_BULK_RECEIVE_DONE;
> +}
> +
>  /* Called by the slot handler - don't hold the bulk mutex */
>  static enum vchiq_status
>  notify_bulks(struct vchiq_service *service, struct vchiq_bulk_queue *queue,
> @@ -1281,16 +1297,8 @@ notify_bulks(struct vchiq_service *service, struct vchiq_bulk_queue *queue,
>  					spin_unlock(&bulk_waiter_spinlock);
>  				} else if (bulk->mode ==
>  					VCHIQ_BULK_MODE_CALLBACK) {
> -					enum vchiq_reason reason = (bulk->dir ==
> -						VCHIQ_BULK_TRANSMIT) ?
> -						((bulk->actual ==
> -						VCHIQ_BULK_ACTUAL_ABORTED) ?
> -						VCHIQ_BULK_TRANSMIT_ABORTED :
> -						VCHIQ_BULK_TRANSMIT_DONE) :
> -						((bulk->actual ==
> -						VCHIQ_BULK_ACTUAL_ABORTED) ?
> -						VCHIQ_BULK_RECEIVE_ABORTED :
> -						VCHIQ_BULK_RECEIVE_DONE);
> +					enum vchiq_reason reason =
> +							get_bulk_reason(bulk);
>  					status = make_service_callback(service,
>  						reason,	NULL, bulk->userdata);
>  					if (status == VCHIQ_RETRY)
> @@ -2622,9 +2630,10 @@ do_abort_bulks(struct vchiq_service *service)
>  	mutex_unlock(&service->bulk_mutex);
>  
>  	status = notify_bulks(service, &service->bulk_tx, 0/*!retry_poll*/);
> -	if (status == VCHIQ_SUCCESS)
> -		status = notify_bulks(service, &service->bulk_rx,
> -			0/*!retry_poll*/);
> +	if (status != VCHIQ_SUCCESS)
> +		return 0;
> +
> +	status = notify_bulks(service, &service->bulk_rx, 0/*!retry_poll*/);
>  	return (status == VCHIQ_SUCCESS);
>  }

Hi Stefan,

this change seem to be unrelated ti what's pointed out in changelog.
Should it be put in a separate patch?

>  
> -- 
> 2.7.4
> 
> 

thank you,

fabio
