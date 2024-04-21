Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275C9625
	for <linux-staging@lists.linux.dev>; Sun, 21 Apr 2024 08:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713689753; cv=none; b=pVtrxRzXMQo/HBHWI5Aiy5ZeiOgB1WQls1rG+JYNk93CcHfg1GwhGeAd/N04b+hLKSNdz17HqAbw4E8DmTyApitbWPwwZXi6to5+EW/9v+7dIgQ9YTFQj48nBJ2e+srmyz82USOd49gxMhrQhQEIFPi6W6jEk6b2jaDGQN8sTZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713689753; c=relaxed/simple;
	bh=dBtBKmL3W+2WEqK50UJw5HuqdgYVh9y0b3RzLsRJ2F4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uYp+hPgXxpbyg8qhiLVCfU7dOwC8djCsykZ+atNCLTCt0f9RmoXG7/U482B8JBnsFDhs8LPqFMJGdBt4hyJRjZUyZ+6ItmNU50ZPvVBz7lWPi5WzQAOSmL2phH4COj+U97T1XxgGgtp/ljKMM/7wLHg1OqUcqqL+j7UyFa++wpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QKsTTE9/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QKsTTE9/"
Received: from [192.168.1.105] (unknown [103.251.226.10])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 75889674;
	Sun, 21 Apr 2024 10:54:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713689701;
	bh=dBtBKmL3W+2WEqK50UJw5HuqdgYVh9y0b3RzLsRJ2F4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QKsTTE9/x1Xjin6gdw1fuaDhcFtbkH1oVcoqsGVZ9UnjByq21q0IBUSZaEIMIzON4
	 W40zWpY4U+QFuuisSbY222ezUZxyrPvv9mz07fD8enZ5PLftHrUsnE28FwobRLq0t2
	 IQLZEbObqd1y0GAx1wpX9I/YEZJb/GUog7UQPgFE=
Message-ID: <5420a612-15a3-4d37-9281-b59a92364ec8@ideasonboard.com>
Date: Sun, 21 Apr 2024 14:25:47 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] staging: vchiq_core: Add missing blank lines
Content-Language: en-US
To: Stefan Wahren <wahrenst@gmx.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20240420115351.27713-1-wahrenst@gmx.net>
 <20240420115351.27713-5-wahrenst@gmx.net>
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20240420115351.27713-5-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefan,

Thank you for the patch

On 20/04/24 5:23 pm, Stefan Wahren wrote:
> checkpatch.pl noticed about missing blank line after 2 declarations.
> So add them for better readability.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Umang Jain <umang.jain@ideasonboard.com>

> ---
>   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index ca32902afe06..df3af821f218 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -227,6 +227,7 @@ struct vchiq_service *handle_to_service(struct vchiq_instance *instance, unsigne
>
>   	return rcu_dereference(instance->state->services[idx]);
>   }
> +
>   struct vchiq_service *
>   find_service_by_handle(struct vchiq_instance *instance, unsigned int handle)
>   {
> @@ -2176,6 +2177,7 @@ vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero, s
>
>   	for (i = 0; i < VCHIQ_MAX_SERVICES; i++) {
>   		struct vchiq_service_quota *quota = &state->service_quotas[i];
> +
>   		init_completion(&quota->quota_event);
>   	}
>
> --
> 2.34.1
>

