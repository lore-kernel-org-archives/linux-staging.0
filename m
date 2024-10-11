Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA95E405FB
	for <linux-staging@lists.linux.dev>; Fri, 11 Oct 2024 14:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728658425; cv=none; b=qpZNp1wu7ay3tnyKPGOp9evQqSy2vIgJwaieuSSme1bjrTADgDhujTPMtEvOZGDBiFuJGZtlXhPuz0uOjvf+jD3ZGzTNNLLegvfFNg5R2676lOmGGRqo/kHAbRoj9c/VqZ2jBv5Us+wabjHXsHFStsQbE0PjdMX5x2qjfYvA44Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728658425; c=relaxed/simple;
	bh=7QRZYjUBQ+96Ygj5xRkUM1nxecEvwSbvArMzWPoyTes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z38tM9FwOFEwZcYwXyUp6h6DkLLIFzfMAs8YJQ1JOcgLeilFyFObEkrM5yMn3Kp8iHMpIIY1Wet0gS40FoA+DztEuHAbaLtod6JRxVbgFbuPl94HPiV7GDHn2IAWjPqbfaEzbjHFIoTq4Ok9t+wiSEtdCYabgqo95YETWdfrWRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S0Q2kZb1; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S0Q2kZb1"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fadc95ccfcso23482111fa.1
        for <linux-staging@lists.linux.dev>; Fri, 11 Oct 2024 07:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728658422; x=1729263222; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WilxIEbfSQXrWwCv2V/AYzlWOc3cI7NOnhWdHqs7NlU=;
        b=S0Q2kZb1PJgHFGLzFoxtnskHrf8u41JypTRsQFbPhMdtBpoPrt7RlLwLcPoOuhhNui
         BWMf/YnajxvOQYHKejCqIiXtojvmluCjIzpXDhkXvgl24oSztsX01P1EjSOvlLseUDol
         QA3SU+H3IobfgAOFrtWOI8jdF48TCIaH1Vl4wjj6svK43KvLXw357BI/UgcpPdvzEHl5
         IuDtnN7TILtHcyZx9B7On2IoD4Li6Wj40FjEfLiWQP8rANNKW+0En5l+J058l4Iufd6f
         +teuJAiUW7psuRThs3BZtlJ+rcN4AI97A8UaY9xTT1hifaKl7iH50LoWr2OczWtPCTPl
         M2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728658422; x=1729263222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WilxIEbfSQXrWwCv2V/AYzlWOc3cI7NOnhWdHqs7NlU=;
        b=qprYuYGOh1fXcoZCVsAgWaEiQb64ObDf+2VsaaVta8w6Rz1mGaGrAJ3Nnx7mn4v7x5
         OY3BiB3VjtMhKkkVEhbLJv0G5iEhpggwGKtYmTzcxh8YZwoSwsEDUaqNz8suanS1wYhx
         y6HgTOhHusHhCcaiHa3MpLgYxTpFUhRgItkgQ09l6My3SaLZZS2vm3JU2Sw8KCma2cwp
         W+MRPoWS49XwLG2kNXZW4JPkTg0Yx9m3eqGjGOvWwF4f+hwe7VTA/9HItRh6wP0LOvte
         9kKG9b+KWiVoZpNVHLTqa8xWFYD+Bo276sEoidafJ+hQbgpG/fkywFDjgHUHCz8t+ZPm
         Dk0A==
X-Forwarded-Encrypted: i=1; AJvYcCUetJqbx/Xyj2fkXRwdxYqpVFj9vAyrcJV7dz6dcXK7nphfmn3vvBNZRUch3bo3IoikIionoIJUVhBGfe2f@lists.linux.dev
X-Gm-Message-State: AOJu0Ywfc50y5XiegzoqjoqOZ63knZtFrTPwZyw3tR/NnuU87OUZpHbJ
	fsNJG7FLEY7PtmBZB2oxlfG98aqXOeli3bCM8RqocImGu6KfDEaQDZQgA7oFPSI=
X-Google-Smtp-Source: AGHT+IHpf8cGOi0GcvL3UceMJRHebz12f6bF9cgghtjSOyLiDpwIfu/xKtaMCZelIh0/N5fHBXfWGQ==
X-Received: by 2002:a2e:b794:0:b0:2f3:f8d7:d556 with SMTP id 38308e7fff4ca-2fb3274097fmr13491161fa.18.1728658421847;
        Fri, 11 Oct 2024 07:53:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430d748d445sm76950695e9.44.2024.10.11.07.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 07:53:41 -0700 (PDT)
Date: Fri, 11 Oct 2024 17:53:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	kernel-list@raspberrypi.com, Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v2 4/6] staging: vchiq_core: Refactor notify_bulks()
Message-ID: <e366d563-3560-45f5-aff1-5291a5407c15@stanley.mountain>
References: <20241011120910.74045-1-umang.jain@ideasonboard.com>
 <20241011120910.74045-5-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011120910.74045-5-umang.jain@ideasonboard.com>

On Fri, Oct 11, 2024 at 05:39:08PM +0530, Umang Jain wrote:
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index e9cd012e2b5f..5509f8b1061a 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -1309,6 +1309,48 @@ get_bulk_reason(struct vchiq_bulk *bulk)
>  	return VCHIQ_BULK_RECEIVE_DONE;
>  }
>  
> +static int service_notify_bulk(struct vchiq_service *service,
> +			       struct vchiq_bulk *bulk)
> +{
> +	int status = -EINVAL;
> +
> +	if (!service || !bulk)
> +		return status;

Just return a literal here.  s/return status/return -EINVAL/.
This condition is impossible and the caller doesn't handle the error correctly.

> +
> +	if (bulk->actual != VCHIQ_BULK_ACTUAL_ABORTED) {
> +		if (bulk->dir == VCHIQ_BULK_TRANSMIT) {
> +			VCHIQ_SERVICE_STATS_INC(service, bulk_tx_count);
> +			VCHIQ_SERVICE_STATS_ADD(service, bulk_tx_bytes,
> +						bulk->actual);
> +		} else {
> +			VCHIQ_SERVICE_STATS_INC(service, bulk_rx_count);
> +			VCHIQ_SERVICE_STATS_ADD(service, bulk_rx_bytes,
> +						bulk->actual);
> +				}
> +	} else {
> +		VCHIQ_SERVICE_STATS_INC(service, bulk_aborted_count);
> +	}
> +
> +	if (bulk->mode == VCHIQ_BULK_MODE_BLOCKING) {
> +		struct bulk_waiter *waiter;
> +
> +		spin_lock(&service->state->bulk_waiter_spinlock);
> +		waiter = bulk->userdata;
> +		if (waiter) {
> +			waiter->actual = bulk->actual;
> +			complete(&waiter->event);
> +		}
> +
> +		spin_unlock(&service->state->bulk_waiter_spinlock);

We always return -EINVAL for VCHIQ_BULK_MODE_BLOCKING.

regards,
dan carpenter

> +	} else if (bulk->mode == VCHIQ_BULK_MODE_CALLBACK) {
> +		enum vchiq_reason reason = get_bulk_reason(bulk);
> +		status = make_service_callback(service, reason,	NULL,
> +					       bulk->userdata);
> +	}
> +
> +	return status;
> +}

