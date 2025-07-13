Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5977EA41
	for <linux-staging@lists.linux.dev>; Sun, 13 Jul 2025 18:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752432401; cv=none; b=twDfW48yO3vwn+ud/9OsI1hI4jIewAAVLxpKJLhziwdAaasRQCrwicJ/9MgxxltaNFB6VRXyxRFGnPz5jeafMlDh9UIIGUjRs7MJIgoCgm07lXo3SgB7ti7hwk9Id2p9RKBrqts5iwu0OIjTcTieZkd9YLtTgk6TeDRvTE+8tec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752432401; c=relaxed/simple;
	bh=q4326ckDP59Oe4jg6pi689umpyvvsi7LyKRmMfN+gJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XmG+Y6OP4g2JZEu1mgPZWumqR5HAAhHO787pmD1b1eHAlaoHYHrHqD0IUROgYg1IHoD6JgBbYrzUJt+zRIuzOg8ceng/DD5kVhHATA2aICM/gwppzbMhzrHvjD28qCs3G5hMfwCuBt+PjmSHstlgQCItIkM5pi+A1H/sAuczMfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=UYTqm66m; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="UYTqm66m"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=akmPUGJ+ZPVpH2vLXmA9mtmigA3DY32/PLo63cH7VLg=; b=UYTqm66mHtW2Zr2BqdfhnWkU/l
	xnaVzZTiVyT5AqXimPG5qYWDiEkiexTj0ZumHQSl3q8Bpek4n7+VuWgrg2wxP5JGu9AC8h0TKawa6
	lj+wVoIkGgDrfIWRHklL4Rrw+0BCWZE3WhF9SJijdGJMYyKzvw3sQIRIe3jok3euXP9EilMJsRB40
	T99rgODOVIRAtsufQYUvPECa6koyvtCnhgBcP8/hZkBjs0d8bzv2246PiJVjSR5IrHUKr32TRm+89
	pSXcf4/oqu3J122OZV14cxdosMXgAp6fJsXRhaIZR6IMVxx1DYJT8+AiObdRW1adfm+eL5KRX4CK6
	zDAGZmAg==;
Received: from [187.36.210.68] (helo=[192.168.1.103])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1ub1iZ-00G9At-TP; Sun, 13 Jul 2025 20:46:32 +0200
Message-ID: <b60b89b9-40e2-476c-ad67-1a5df548a167@igalia.com>
Date: Sun, 13 Jul 2025 15:46:26 -0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] staging: vchiq_arm: Make vchiq_shutdown never fail
To: Stefan Wahren <wahrenst@gmx.net>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 kernel-list@raspberrypi.com, linux-staging@lists.linux.dev
References: <20250711154031.24178-1-wahrenst@gmx.net>
 <20250711154031.24178-4-wahrenst@gmx.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250711154031.24178-4-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefan,

On 11/07/25 12:40, Stefan Wahren wrote:
> Most of the users of vchiq_shutdown ignore the return value,
> which is bad because this could lead to resource leaks.
> So instead of changing all calls to vchiq_shutdown, it's easier
> to make vchiq_shutdown never fail.
> 
> Fixes: 71bad7f08641 ("staging: add bcm2708 vchiq driver")
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 6434cbdc1a6e..721b15b7e13b 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -393,8 +393,7 @@ int vchiq_shutdown(struct vchiq_instance *instance)

If vchiq_shutdown() will always return 0 and most users ignore the
return value, how about turning it into a void function?

Best Regards,
- Maíra

>   	struct vchiq_state *state = instance->state;
>   	int ret = 0;
>   
> -	if (mutex_lock_killable(&state->mutex))
> -		return -EAGAIN;
> +	mutex_lock(&state->mutex);
>   
>   	/* Remove all services */
>   	vchiq_shutdown_internal(state, instance);

