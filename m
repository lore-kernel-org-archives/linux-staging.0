Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDD952F71
	for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 06:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718085699; cv=none; b=K0Q8ELsabMLNslDl2y4sKSqQ4WyALjgZRzgbIHw0rJmRrtzCk76BaUyAwytSiviHLIM+16XtKDdTASzpif00crDCPMshY7yazm1obRXLjDXG8Mj2L76TOWyHl2M+1iVKAXhkgd0xkJ0j85fNS/s3e3jic4A4Iop3NV1NdZohFCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718085699; c=relaxed/simple;
	bh=Cx0q3gP0BnWqzY3fvL/YhYkEMYEkCPnJ+86JE92iKkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aIbBk6puc7FRGDSyM8q+SkhZoa0DyRK5jO+IBrFEyL4oUpYuroYLHpW/WZduJHlEFF9MGDySVluEReA6U20qj5oN7zOigg1m5/F7yEOc3fhnmpTEgSclv2cCbz/bfljxA4RNidENfYDddQt3xtF6lLfZ/0CHbEwYLSUPRkAspFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KjuJbgKz; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KjuJbgKz"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2eaea28868dso46118341fa.3
        for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 23:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718085696; x=1718690496; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BuOO4FEld62nqLG8IYMGOnAJeVsi2pihKon3LpkekiM=;
        b=KjuJbgKzALlO5xUBgv9Rsy0Xc4qHpUrMM7BK+fSJ3AYjYo8fC8jqFE4pBeFzYpzT9g
         FILMLYCrgW5+9ha2U9zbUnDu0MlZKdbQmyEGbCcDS8yLWmwH+32iaDp5oDcwMglM5hYq
         SmrV2+D51LqpsQ6VIAjo3ZyLLKABYo5W2YMsmpq6jpZO1Omh7KDG+k3Cv7kOAJ9Fz0E/
         lPGwCbL+3FZMWf3rtFLuyPtcs48ZaB9HgaSkhz6fl09y66+nh2U6i2hx9jiCYi7MinXf
         g3QxUvVEmEYBGit07sjHwT/E5N1I7kJcldO8ZLrWAgUYahUTgxoeF6hP7fkRG6ql6Oci
         w2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718085696; x=1718690496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuOO4FEld62nqLG8IYMGOnAJeVsi2pihKon3LpkekiM=;
        b=d0IFd1BZluGJS9mSncn8Yq7KYRkuQYFM5kXd/s8TsF9auRdu40O4fF5eG4lymaDuJl
         JrAjEMFw8bRtfMSFnaULXKeSt1l/RAgyqWJ1PJ7eK7PJnQbjIKbqjSLjlS4sPmi2qWSt
         aw0xMPb+0p+hx3E3VwgMqiJQYe7BEbrA75Ye9+FWB68IBSia0a6WDlHLZDPh0Vcy1UBs
         rqR9WhW417ZFSQI9nQBKIBo04xbYy8hT+CrYNb5kI9ShOZZ58rtzm58hcUDAU9QBv424
         AQEi9+oWo/EI6reL1jaLE82LtmHDAul63rVbkcQir52Guc3bHyYgWvmkcXZPBlHUeGkM
         XMGg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ1iMg7xYGeU+7D9rHRmqQuRT0w16SXSjtj6ONdW3kI6okNJZmu8REEc+VSjb0iPmRL2tbMxvP3EXhkem4AydYpd7k5N62zexyDQSKag==
X-Gm-Message-State: AOJu0YysYzjVCbt4bRiSSN2ONsv7ImZ+m4C3GD83dkd2WsjrJQJaa0GW
	szL6p+eyI6c4J9t25AF+8/BsSUFlIbed2opB/mTfA/4NzHW0zW6qWpSIjf7Glws=
X-Google-Smtp-Source: AGHT+IH7nFqBPvBNIY3q2uJsKi3mjUDea6KTtUJubrbQtrPgk2APStf5+mhXIwQ7DQL7polTrCbMTg==
X-Received: by 2002:a2e:9b0c:0:b0:2ea:ebb0:b5ef with SMTP id 38308e7fff4ca-2eaebb0b884mr68334421fa.19.1718085695483;
        Mon, 10 Jun 2024 23:01:35 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f2616666esm3737568f8f.1.2024.06.10.23.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 23:01:34 -0700 (PDT)
Date: Tue, 11 Jun 2024 09:01:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2 07/10] staging: vchiq_arm: Reduce indentation of
 service_callback
Message-ID: <88eb1d33-9423-4a5a-b5b1-f858dd9169aa@moroto.mountain>
References: <20240610210220.95524-1-wahrenst@gmx.net>
 <20240610210220.95524-8-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610210220.95524-8-wahrenst@gmx.net>

On Mon, Jun 10, 2024 at 11:02:17PM +0200, Stefan Wahren wrote:
> The service_callback has 5 levels of indentation, which makes it
> hard to read. Reduce this by splitting the code in a new function
> service_single_message() as suggested by Laurent Pinchart.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  .../interface/vchiq_arm/vchiq_arm.c           | 68 +++++++++++--------
>  1 file changed, 39 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 0ba52c9d8bc3..706bfc7a0b90 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -1055,6 +1055,39 @@ add_completion(struct vchiq_instance *instance, enum vchiq_reason reason,
>  	return 0;
>  }
> 
> +static int
> +service_single_message(struct vchiq_instance *instance,
> +		       enum vchiq_reason reason,
> +		       struct vchiq_service *service, void *bulk_userdata)
> +{
> +	struct user_service *user_service;
> +
> +	user_service = (struct user_service *)service->base.userdata;
> +
> +	dev_dbg(service->state->dev, "arm: msg queue full\n");
> +	/*
> +	 * If there is no MESSAGE_AVAILABLE in the completion
> +	 * queue, add one
> +	 */
> +	if ((user_service->message_available_pos -
> +	     instance->completion_remove) < 0) {
> +		dev_dbg(instance->state->dev,
> +			"arm: Inserting extra MESSAGE_AVAILABLE\n");
> +		return add_completion(instance, reason, NULL, user_service,
> +				      bulk_userdata);

In the original code we added a completion and

> +	}
> +
> +	if (wait_for_completion_interruptible(&user_service->remove_event)) {

then waited for it here...  Why did this change?

regards,
dan carpenter

> +		dev_dbg(instance->state->dev, "arm: interrupted\n");
> +		return -EAGAIN;
> +	} else if (instance->closing) {
> +		dev_dbg(instance->state->dev, "arm: closing\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  int
>  service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
>  		 struct vchiq_header *header, unsigned int handle, void *bulk_userdata)
> @@ -1104,41 +1137,18 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
>  		spin_lock(&service->state->msg_queue_spinlock);
>  		while (user_service->msg_insert ==
>  			(user_service->msg_remove + MSG_QUEUE_SIZE)) {
> +			int ret;
> +
>  			spin_unlock(&service->state->msg_queue_spinlock);
>  			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
>  			DEBUG_COUNT(MSG_QUEUE_FULL_COUNT);
> -			dev_dbg(service->state->dev, "arm: msg queue full\n");
> -			/*
> -			 * If there is no MESSAGE_AVAILABLE in the completion
> -			 * queue, add one
> -			 */
> -			if ((user_service->message_available_pos -
> -				instance->completion_remove) < 0) {
> -				int ret;
> -
> -				dev_dbg(instance->state->dev,
> -					"arm: Inserting extra MESSAGE_AVAILABLE\n");
> -				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
> -				ret = add_completion(instance, reason, NULL, user_service,
> -						     bulk_userdata);
> -				if (ret) {
> -					DEBUG_TRACE(SERVICE_CALLBACK_LINE);
> -					vchiq_service_put(service);
> -					return ret;
> -				}
> -			}
> 
> -			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
> -			if (wait_for_completion_interruptible(&user_service->remove_event)) {
> -				dev_dbg(instance->state->dev, "arm: interrupted\n");
> -				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
> -				vchiq_service_put(service);
> -				return -EAGAIN;
> -			} else if (instance->closing) {
> -				dev_dbg(instance->state->dev, "arm: closing\n");
> +			ret = service_single_message(instance, reason,
> +						     service, bulk_userdata);
> +			if (ret) {
>  				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
>  				vchiq_service_put(service);
> -				return -EINVAL;
> +				return ret;
>  			}
>  			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
>  			spin_lock(&service->state->msg_queue_spinlock);
> --
> 2.34.1
> 
