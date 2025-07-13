Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E856F53E
	for <linux-staging@lists.linux.dev>; Sun, 13 Jul 2025 18:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752432049; cv=none; b=UMobnHhIWmgV1WLXgQgwKCIQikrEWmUSJx3e9SV9unrLnGmE1rT8uU5I1F9LOvfdWBjt/JGtjnl37v4Ia1BMYqtDfoQYR1G9s/w4YVzjxSlEKbrGop1i51G0wBW2bY/WvvvPseqFXbwTpKdbrCC/rWGkFrWjmrocPlbEXNAvEK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752432049; c=relaxed/simple;
	bh=7ztDYmMk+D8Z/c68MDT5TZdR/B6JzKqEUIG58gTZ+fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rwkk4fbU0sP7HvtdslDRp//7W3qzQUVlCOR/Zw0/NOMprzm/Ahn1MDkL95EOZ+7Z02I0yvwQk0XYRjHBtxzdI9xXFvSE3prb0gWVNbGoMKYLOh7lp0vkbqMpH+qmUQHqJ7RVe5E6Wkud2stBrYqm1UjZq5E0Zf6esuY5iLUN0d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Y8VoNlYF; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Y8VoNlYF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UKBc7sZsCIx42g/7g0HdhWx1L0ByaiwWjBhOF3A3Wq0=; b=Y8VoNlYFeqEyR95sN5FsuzR8cg
	O9h5Bzwb59K4DoX2uWiCQ5pRGxUb//DZRP2DQfh8H1wQf7SHyUltl2IbCX76dXACU1n4X/XHuEO5D
	N6Fz7kt7cR9w8stPURRlYB2BCzfvIyz0qezlnZ7ZgS5xCMQa02eMQZDsuWA3Q5VUkNdwbrRa9kP5D
	W6ZxQxxsb3bsIvFlFA4I3GSYFJz+HnUDaQuewWMnkXizIQk+DguknFRGmQH06Onoh2ms1XK2wdNo/
	bamS4nsbYpRNiLNze6X6ufLbZ2P7At49YqApNNy5k9fwlecjwachSOsWi7crW6Fu+ZhaT3nVteMGa
	kfVR9FSQ==;
Received: from [187.36.210.68] (helo=[192.168.1.103])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1ub1cu-00G96P-CB; Sun, 13 Jul 2025 20:40:40 +0200
Message-ID: <4f5b18b8-ff3c-40a2-8e3b-19757f57d79c@igalia.com>
Date: Sun, 13 Jul 2025 15:40:34 -0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] Revert "staging: vchiq_arm: Create keep-alive thread
 during probe"
To: Stefan Wahren <wahrenst@gmx.net>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 kernel-list@raspberrypi.com, linux-staging@lists.linux.dev,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <maira.canal@usp.br>, stable@kernel.org
References: <20250711154031.24178-1-wahrenst@gmx.net>
 <20250711154031.24178-3-wahrenst@gmx.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250711154031.24178-3-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefan,

On 11/07/25 12:40, Stefan Wahren wrote:
> The commit 86bc88217006 ("staging: vchiq_arm: Create keep-alive thread
> during probe") introduced a regression for certain configurations,
> which doesn't have a VCHIQ user. This results in a unused and hanging
> keep-alive thread:
> 
>    INFO: task vchiq-keep/0:85 blocked for more than 120 seconds.
>          Not tainted 6.12.34-v8-+ #13
>    "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>    task:vchiq-keep/0    state:D stack:0 pid:85    tgid:85    ppid:2
>    Call trace:
>     __switch_to+0x188/0x230
>     __schedule+0xa54/0xb28
>     schedule+0x80/0x120
>     schedule_preempt_disabled+0x30/0x50
>     kthread+0xd4/0x1a0
>     ret_from_fork+0x10/0x20
> 
> Fixes: 86bc88217006 ("staging: vchiq_arm: Create keep-alive thread during probe")
> Reported-by: Maíra Canal <maira.canal@usp.br>

If possible, could you use my Igalia e-mail instead (mcanal@igalia.com)?
I mistakenly sent the e-mail reporting using my university e-mail.

> Closes: https://lore.kernel.org/linux-staging/ba35b960-a981-4671-9f7f-060da10feaa1@usp.br/
> Cc: <stable@kernel.org>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
>   .../interface/vchiq_arm/vchiq_arm.c           | 69 ++++++++++---------
>   1 file changed, 35 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index cdf5687ad4f0..6434cbdc1a6e 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -280,6 +280,29 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
>   	return 0;
>   }
>   
> +int
> +vchiq_platform_init_state(struct vchiq_state *state)
> +{
> +	struct vchiq_arm_state *platform_state;
> +
> +	platform_state = devm_kzalloc(state->dev, sizeof(*platform_state), GFP_KERNEL);
> +	if (!platform_state)
> +		return -ENOMEM;
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
>   static struct vchiq_arm_state *vchiq_platform_get_arm_state(struct vchiq_state *state)
>   {
>   	return (struct vchiq_arm_state *)state->platform_state;
> @@ -988,39 +1011,6 @@ vchiq_keepalive_thread_func(void *v)
>   	return 0;
>   }
>   
> -int
> -vchiq_platform_init_state(struct vchiq_state *state)
> -{
> -	struct vchiq_arm_state *platform_state;
> -	char threadname[16];
> -
> -	platform_state = devm_kzalloc(state->dev, sizeof(*platform_state), GFP_KERNEL);
> -	if (!platform_state)
> -		return -ENOMEM;
> -
> -	snprintf(threadname, sizeof(threadname), "vchiq-keep/%d",
> -		 state->id);
> -	platform_state->ka_thread = kthread_create(&vchiq_keepalive_thread_func,
> -						   (void *)state, threadname);
> -	if (IS_ERR(platform_state->ka_thread)) {
> -		dev_err(state->dev, "couldn't create thread %s\n", threadname);
> -		return PTR_ERR(platform_state->ka_thread);
> -	}
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
>   int
>   vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
>   		   enum USE_TYPE_E use_type)
> @@ -1341,6 +1331,7 @@ void vchiq_platform_conn_state_changed(struct vchiq_state *state,
>   				       enum vchiq_connstate newstate)
>   {
>   	struct vchiq_arm_state *arm_state = vchiq_platform_get_arm_state(state);
> +	char threadname[16];
>   
>   	dev_dbg(state->dev, "suspend: %d: %s->%s\n",
>   		state->id, get_conn_state_name(oldstate), get_conn_state_name(newstate));
> @@ -1355,7 +1346,17 @@ void vchiq_platform_conn_state_changed(struct vchiq_state *state,
>   
>   	arm_state->first_connect = 1;
>   	write_unlock_bh(&arm_state->susp_res_lock);
> -	wake_up_process(arm_state->ka_thread);
> +	snprintf(threadname, sizeof(threadname), "vchiq-keep/%d",
> +		 state->id);
> +	arm_state->ka_thread = kthread_create(&vchiq_keepalive_thread_func,
> +					      (void *)state,
> +					      threadname);
> +	if (IS_ERR(arm_state->ka_thread)) {
> +		dev_err(state->dev, "suspend: Couldn't create thread %s\n",
> +			threadname);
> +	} else {
> +		wake_up_process(arm_state->ka_thread);
> +	}
>   }
>   
>   static const struct of_device_id vchiq_of_match[] = {

