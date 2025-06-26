Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA6528C85D
	for <linux-staging@lists.linux.dev>; Thu, 26 Jun 2025 18:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750962147; cv=none; b=b9DrJR6yUDrtlurJ/OZcNtx3WdpvyZg6S+bAtG9g775EdLnrHDm3VCzZuJ6CgQ27J8Kd0FNZokHDiP34taMTOTtAQ/X5aIK1zHbLY5cyCpmrCOfaUiJZs4qQLC+xQ+2Wyetu9qLst/tXFtd4DenKWWZanH86n2oE6mlDyGQO0Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750962147; c=relaxed/simple;
	bh=5cHac69oKYxodXtxB3SPe0LwKvLm0p6w1/6RJ/XyoZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kyTHRJxEK2G8xi5Fiied76K139tZDpz1rY/xp9pOgj8egXr0IvDr5rqPIYg8IF+z/Swh2qbj+qIjX/V3P4A6T9k6shuCGNhkm7p52iwGPqiODlzw4xeL7BOesX2iGFAjpVKPsEK0ReA9FZ6JjDrT8s6Bv2bEqV09CAaZjrvGJl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=sY1Cy8Sx; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="sY1Cy8Sx"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-235f9ea8d08so14573975ad.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Jun 2025 11:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1750962143; x=1751566943; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mWPkFFmTIdZEAaU2As3DwN6xujYoIXmrnl7uwmSiIkg=;
        b=sY1Cy8Sxen9fBUQ39VELP3qISU8r0/Vkl18GCbBlX7o3A23BaqJhcvNwj6D7YJsNE1
         wObN9suYD5c8NdZJaCXaC5jB/71CrBnv6JcJE/dJnHlHOvBNAElDn1G8vIw0A1X2fp2P
         95rBsTSWRY9EYorGHuX4jst4YS997Q5n8RGa33l2EuoqRGslbOIGCWli/fCMu1SATzTS
         x0Ho5v4LSe1LripkcbH2HQYzRf9rdjW2wpYH0ybZNQ3tzU1fCWYC6B3wHO4c4PO/EMtk
         TI9FY5YEg7eYtpbjAwVZASSl/h//aqJdliVpd4RrMuvQM8NfozszlPn+Xnzb2cg+VsVz
         TYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750962143; x=1751566943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mWPkFFmTIdZEAaU2As3DwN6xujYoIXmrnl7uwmSiIkg=;
        b=v1BFFb+9kVrcjO+aBPPFMXLJloKpfbXP/nGWTi2ACnfIR0whI1SVPnKN00p/yV1hu/
         kndzmp0tHz3VpxS4CtgkEWpltbMPMNsOJCg5OKemjtrPGCrqFP7GmJhOJL92n5i1QGg/
         0KSGlD+Emsg4CSoH66OWwFbgN3A0DI4iLfo1GxvHShPm33QBYH7gxxxu+0A8pLgjzkSG
         kZmPR87GDQ/cS0cC2kiptY0qhFHtW8T9up+ik32VGSChEI1fryxdO/xmN0tcPazc5EeW
         L/dAfJCa5BN1wOju9mOrndc+L1GNX49hzLUpLWdGd4sh+rOou43PkW6QioMT82ZSVB8f
         doAw==
X-Forwarded-Encrypted: i=1; AJvYcCXVgmNZD29m9JaGMx5RK0YIlS0hfZ5SCQCJKmH53zEUqX4f+fxoOlTgadwEFHyXzz6pIq2XJgqbFUgsqh9h@lists.linux.dev
X-Gm-Message-State: AOJu0Yz++1cWfZxADHoBN2U3XL2UnUbd91JKC9UK44jUIMDzWcGOBJ6/
	1CbrMxNL4yNIWvZoBK+g49Vh1iCSSg3aukl1hjCbdKNl9854NNVbAbD1Cs2fNnQ6DFY=
X-Gm-Gg: ASbGnctaD8xq/l/XPrFQAv8qSUPX7Xire+I2wbv50tfyKNMrdoGxuGKKjK4VDBF9Nb9
	v3O0hUNOvHzFWt0LIeD3gdv5sjM1clnOhkbH5iWo+ELVZqeGTKeReF2OIby//8Wm8dWR2KOwzj9
	7p2H3jvAyY1InwSd1TN0fll88ap7b6q0ZzkM4qcP9ulw+AJ4WiPe4jn0HZ9KU8ZiMyWX++ulLBl
	4bEJXu7+MA/Xh2FsCCXS79yup+hOn6wiBRG3inkDTd2LUcKVO5lTm0rdz71VpRBwvjQ8RVDYuy+
	cqBSkrEuagEclHqmy1/hCXEzyqbKFyO3/hSTLBXL8UOB/KxQyM62qe1fSwJRDo5FpYF5QFMSE7S
	NPiZAo5sEqQS4gmaUatrEpZq7KrTU+2ds4Yi6xswQzRfA
X-Google-Smtp-Source: AGHT+IFs4LXLMUtFT0x8igFmtJwtvhLFafnH7Rh09VBF8jTCmNg60iWTU5jnzKU2s9hGJmkA1FJNHQ==
X-Received: by 2002:a17:903:3c4e:b0:236:93cb:48b with SMTP id d9443c01a7336-23ac4680b53mr5089785ad.44.1750962142748;
        Thu, 26 Jun 2025 11:22:22 -0700 (PDT)
Received: from ?IPV6:2804:14d:8084:946d:411e:e43:f1b:c7d3? ([2804:14d:8084:946d:411e:e43:f1b:c7d3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23abe3f859dsm3626425ad.172.2025.06.26.11.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 11:22:22 -0700 (PDT)
Message-ID: <ba35b960-a981-4671-9f7f-060da10feaa1@usp.br>
Date: Thu, 26 Jun 2025 15:22:17 -0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] staging: vchiq_arm: Create keep-alive thread during
 probe
To: Stefan Wahren <wahrenst@gmx.net>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
 Ojaswin Mujoo <ojaswin98@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 kernel-list@raspberrypi.com, linux-staging@lists.linux.dev
References: <20250309125014.37166-1-wahrenst@gmx.net>
 <20250309125014.37166-5-wahrenst@gmx.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <maira.canal@usp.br>
In-Reply-To: <20250309125014.37166-5-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefan,

On 09/03/25 09:50, Stefan Wahren wrote:
> Creating the keep-alive thread in vchiq_platform_init_state have
> the following advantages:
> - abort driver probe if kthread_create fails (more consistent behavior)
> - make resource release process easier
> 
> Since vchiq_keepalive_thread_func is defined below
> vchiq_platform_init_state, the latter must be moved.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>   .../interface/vchiq_arm/vchiq_arm.c           | 69 +++++++++----------
>   1 file changed, 34 insertions(+), 35 deletions(-)
> 

After this patch landed on 6.12 stable, I started to observe the
following warning in Mesa CI [1]:

20:07:07.830: [  242.653532] INFO: task vchiq-keep/0:85 blocked for more 
than 120 seconds.
20:07:07.835: [  242.660404]       Not tainted 6.12.34-v8-+ #13
20:07:07.843: [  242.666173] "echo 0 > 
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
20:07:07.852: [  242.677126] task:vchiq-keep/0    state:D stack:0 
pid:85    tgid:85    ppid:2      flags:0x00000008
20:07:07.854: [  242.690734] Call trace:
20:07:07.857: [  242.693191]  __switch_to+0x188/0x230
20:07:07.858: [  242.697010]  __schedule+0xa54/0xb28
20:07:07.859: [  242.704889]  schedule+0x80/0x120
20:07:07.859: [  242.712581]  schedule_preempt_disabled+0x30/0x50
20:07:07.860: [  242.721437]  kthread+0xd4/0x1a0
20:07:07.861: [  242.724606]  ret_from_fork+0x10/0x20

If I revert this patch, I no longer get those warnings. From that, I was
wondering: is it possible that in some scenarios, we might never
actually get to the connected state and therefore, we wouldn't wake up
the kthread that we created when we initialized the state?

[1] https://gitlab.freedesktop.org/mairacanal/mesa/-/jobs/78940369

Best Regards,
- Maíra

> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 0c7ea2d0ee85..64f9536f1232 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -280,29 +280,6 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
>   	return 0;
>   }
> 
> -int
> -vchiq_platform_init_state(struct vchiq_state *state)
> -{
> -	struct vchiq_arm_state *platform_state;
> -
> -	platform_state = devm_kzalloc(state->dev, sizeof(*platform_state), GFP_KERNEL);
> -	if (!platform_state)
> -		return -ENOMEM;
> -
> -	rwlock_init(&platform_state->susp_res_lock);
> -
> -	init_completion(&platform_state->ka_evt);
> -	atomic_set(&platform_state->ka_use_count, 0);
> -	atomic_set(&platform_state->ka_use_ack_count, 0);
> -	atomic_set(&platform_state->ka_release_count, 0);
> -
> -	platform_state->state = state;
> -
> -	state->platform_state = (struct opaque_platform_state *)platform_state;
> -
> -	return 0;
> -}
> -
>   static struct vchiq_arm_state *vchiq_platform_get_arm_state(struct vchiq_state *state)
>   {
>   	return (struct vchiq_arm_state *)state->platform_state;
> @@ -1011,6 +988,39 @@ vchiq_keepalive_thread_func(void *v)
>   	return 0;
>   }
> 
> +int
> +vchiq_platform_init_state(struct vchiq_state *state)
> +{
> +	struct vchiq_arm_state *platform_state;
> +	char threadname[16];
> +
> +	platform_state = devm_kzalloc(state->dev, sizeof(*platform_state), GFP_KERNEL);
> +	if (!platform_state)
> +		return -ENOMEM;
> +
> +	snprintf(threadname, sizeof(threadname), "vchiq-keep/%d",
> +		 state->id);
> +	platform_state->ka_thread = kthread_create(&vchiq_keepalive_thread_func,
> +						   (void *)state, threadname);
> +	if (IS_ERR(platform_state->ka_thread)) {
> +		dev_err(state->dev, "couldn't create thread %s\n", threadname);
> +		return PTR_ERR(platform_state->ka_thread);
> +	}
> +
> +	rwlock_init(&platform_state->susp_res_lock);
> +
> +	init_completion(&platform_state->ka_evt);
> +	atomic_set(&platform_state->ka_use_count, 0);
> +	atomic_set(&platform_state->ka_use_ack_count, 0);
> +	atomic_set(&platform_state->ka_release_count, 0);
> +
> +	platform_state->state = state;
> +
> +	state->platform_state = (struct opaque_platform_state *)platform_state;
> +
> +	return 0;
> +}
> +
>   int
>   vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
>   		   enum USE_TYPE_E use_type)
> @@ -1331,7 +1341,6 @@ void vchiq_platform_conn_state_changed(struct vchiq_state *state,
>   				       enum vchiq_connstate newstate)
>   {
>   	struct vchiq_arm_state *arm_state = vchiq_platform_get_arm_state(state);
> -	char threadname[16];
> 
>   	dev_dbg(state->dev, "suspend: %d: %s->%s\n",
>   		state->id, get_conn_state_name(oldstate), get_conn_state_name(newstate));
> @@ -1346,17 +1355,7 @@ void vchiq_platform_conn_state_changed(struct vchiq_state *state,
> 
>   	arm_state->first_connect = 1;
>   	write_unlock_bh(&arm_state->susp_res_lock);
> -	snprintf(threadname, sizeof(threadname), "vchiq-keep/%d",
> -		 state->id);
> -	arm_state->ka_thread = kthread_create(&vchiq_keepalive_thread_func,
> -					      (void *)state,
> -					      threadname);
> -	if (IS_ERR(arm_state->ka_thread)) {
> -		dev_err(state->dev, "suspend: Couldn't create thread %s\n",
> -			threadname);
> -	} else {
> -		wake_up_process(arm_state->ka_thread);
> -	}
> +	wake_up_process(arm_state->ka_thread);
>   }
> 
>   static const struct of_device_id vchiq_of_match[] = {
> --
> 2.34.1
> 
> 

