Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977A51482E7
	for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 07:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728890534; cv=none; b=nyHSbdtR/VB5L282xrUl1EqxobB5Qdh2VGPUCaMxl68eh9tzEciXHVQOjp8KSMQOE1olARnz+Z7m4rxP+858Nf8uZnfFC0VVRkR2MTPUJnYCW+ri0fCUfDq59dlEIzC+UJhMKcTq9R2Zhz/VtW2rgnhzt8IOpGMmPuD1+Vj3ixA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728890534; c=relaxed/simple;
	bh=mGHMGEUBr/F0CJwt3EUkiNJ4VsfSu5n2mHMo5boIc14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lWV17OsKW7xcjRq2QXPRfYQYxywEQmKV7Q9/vlFZiFASYCjEX45Z6/0cz+IgaBeE+Ne5EEJhooNlRcfD7f5oDQXlqsfk8qvFUdg49+ahlXInHpYu+7FCSounoIwyH6ud+73EMYSUDlw0FmB7zMq0xgfwHlpwuQUIRcVGh6Pp+Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I4bBAsS2; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I4bBAsS2"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539f58c68c5so907841e87.3
        for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 00:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728890530; x=1729495330; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b4ocUAvfrOuY999lWMHtbPSHRKb+QYQGzjdGe4dWQvY=;
        b=I4bBAsS2ng3lUPj3mfcBrZ0TaPjInh1tcG7vRdN4/BadgXHcneQXzm3fLewf9MUvz9
         oQULGZXY1JlkGgCye+lbu1IADEqj9hL5sim94GUOyEi0tSKwwcMjJ+VBU8KDQnNJ9WC2
         LpQVoZEGxwg5UHXHbnVQKHYTnY+36hviekzD9ytxPUXaNLmi+6b59luZHtIwpM7nkbHJ
         KqC4yy8hbEMR/MCUbiMXvZmVcPoIItGn/dTN/TRXUpMsnaeFANKV6YRCmX9hdj6tcql7
         Ncec0SPDvMUwicFLqjd4vaFSE9aO7XoEsFfT/oSyeOUurHpRMPUx/ksxvZVaIWzb4fz1
         bURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728890530; x=1729495330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4ocUAvfrOuY999lWMHtbPSHRKb+QYQGzjdGe4dWQvY=;
        b=QX8NT0swfg45u85/dj7rlqJmayfkQq/AvGt8dwV188WP3F6BmdVcF38mUsYPn3L/iL
         rfhBZllbqSA0uBYnxfFkRz5u281Q/bRV7K6MkUKXDfSxJL7ZVoHaMbyK43LKHVczhtJh
         1MjTlyLTWapU4iSF2WKaqkUmWK8tG5IvLF9PjbpdHwe6xKU9OG9PJ2yaEIIAzHiHZkI5
         1yWjSnTx4YyHtHgXIwhLKgIkXQcr2Vy2Fi/5HJShpz8Doh9OQtfrzlbq/eyBm+5unWI5
         iimgz6tcUIX0htNTOaOFORCe4ktGQFNfP2lud1DuKMpPBiFm4qHB6ah0unxZ+bgmOQhU
         aCZg==
X-Forwarded-Encrypted: i=1; AJvYcCXdNhtSvanA2yTRqvjJa0NdAmAa8TnsImZF/AwJJ/RQwqKOHUOinQEp2iizjbzBxd1f3Dq7XQwB5hcFcmvU@lists.linux.dev
X-Gm-Message-State: AOJu0YwopKvGpzzTKgkmh7gPMQ9/v4IzJeq1IzV5VTHRuEQ9VjoQ4K1A
	rgQQ/MSeaf3fWwRDRHtDkowNv0jFiI38Iwd+QBPYEM1SR8fYnRZrb7umHJRpqYM=
X-Google-Smtp-Source: AGHT+IFHniEhvrxGEdUHxeYZmE+6k4vfJcTSoYQutpj/Ig9jc4ttnzu0ncfXZilDcnjNIiQCd0auLw==
X-Received: by 2002:a05:6512:1247:b0:536:55cc:963e with SMTP id 2adb3069b0e04-539e571cf75mr3510023e87.44.1728890529531;
        Mon, 14 Oct 2024 00:22:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99f86fa986sm240148566b.92.2024.10.14.00.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 00:22:09 -0700 (PDT)
Date: Mon, 14 Oct 2024 10:22:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] staging: vchiq_arm: Fix missing refcount decrement in
 error path for fw_node
Message-ID: <a4283afc-f869-4048-90b4-1775acb9adda@stanley.mountain>
References: <20241013-vchiq_arm-of_node_put-v1-1-f72b2a6e47d0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241013-vchiq_arm-of_node_put-v1-1-f72b2a6e47d0@gmail.com>

On Sun, Oct 13, 2024 at 12:42:32PM +0200, Javier Carrasco wrote:
> An error path was introduced without including the required call to
> of_node_put() to decrement the node's refcount and avoid leaking memory.
> If the call to kzalloc() for 'mgmt' fails, the probe returns without
> decrementing the refcount.
> 
> Use the automatic cleanup facility to fix the bug and protect the code
> against new error paths where the call to of_node_put() might be missing
> again.
> 
> Cc: stable@vger.kernel.org
> Fixes: 1c9e16b73166 ("staging: vc04_services: vchiq_arm: Split driver static and runtime data")
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 27ceaac8f6cc..792cf3a807e1 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -1332,7 +1332,8 @@ MODULE_DEVICE_TABLE(of, vchiq_of_match);
>  
>  static int vchiq_probe(struct platform_device *pdev)
>  {
> -	struct device_node *fw_node;
> +	struct device_node *fw_node __free(device_node) =
> +		of_find_compatible_node(NULL, NULL, "raspberrypi,bcm2835-firmware");
>  	const struct vchiq_platform_info *info;
>  	struct vchiq_drv_mgmt *mgmt;
>  	int ret;
> @@ -1341,8 +1342,6 @@ static int vchiq_probe(struct platform_device *pdev)
>  	if (!info)
>  		return -EINVAL;
>  
> -	fw_node = of_find_compatible_node(NULL, NULL,
> -					  "raspberrypi,bcm2835-firmware");

Perhaps it's better to declare the variable here so that the function and the
error handling are next to each other.

	if (!info)
		return -EINVAL;

	struct device_node *fw_node __free(device_node) =
		of_find_compatible_node(NULL, NULL, "raspberrypi,bcm2835-firmware");
	if (!fw_node) {

	...

This is why we lifted the rule that variables had to be declared at the start
of a function.

regards,
dan carpenter

