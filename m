Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A201320C462
	for <linux-staging@lists.linux.dev>; Fri, 11 Oct 2024 10:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728640967; cv=none; b=myteOBZ0d0MDKnqddqkoe45leA679X8xFa4iS89OxCcYCl2u+MIz23rx5suYqUNdAHNORRzc2UU0hM+v6HQUNUhnTl0+CjxuwemyRJ71sqqwaTaBa9CnHAJGdQHhOTHk/FMqr2vR9C5b97V2IwLupmhbr4JjeQwqUH1+XA+sVI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728640967; c=relaxed/simple;
	bh=PhSzPI71z5xBw6VKt088FYkStG5cJS044JgrjKk5v+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cNvQdjJxlWb12hKM7kN8jqt2ATttUutKm7no6QVqLoTFE19p0NgMd1LmfF7JrmWqikljvJgygAACLa8q3DDP5mUgrVcRctpTFdN0/TfNvufSM28kiVTf+uFexNuoIKujbji8eLXRzIsrMLZXC5l5uIJWR1tgBo0UVmYkhnVUbKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qBk4FnDm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qBk4FnDm"
Received: from [IPV6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f] (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E74DD8B;
	Fri, 11 Oct 2024 12:01:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728640864;
	bh=PhSzPI71z5xBw6VKt088FYkStG5cJS044JgrjKk5v+k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qBk4FnDmgugDjwzjbJpCcCVpjp2/g1NjsdXQ2g1ZBVrdNRpN7ikMCfibG6iMq4PMa
	 GYs61lK7jqHVgjKwblPp8tAoYM7rKzI0WqjXEivQOPkEdwNVOociS3WQv9sDWm+dbR
	 P8oJVKI+oUFKLa+vP+qbsTSyk7pt4duxnPTF/rWM=
Message-ID: <628861ca-6cda-4f2a-983d-98150e547674@ideasonboard.com>
Date: Fri, 11 Oct 2024 15:32:37 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: vc04_services: TESTING: Adjust ping test
To: Stefan Wahren <wahrenst@gmx.net>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev
References: <20241011100119.111399-1-wahrenst@gmx.net>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20241011100119.111399-1-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefan,

Thank you for the patch

On 11/10/24 3:31 pm, Stefan Wahren wrote:
> Recent tests on Raspberry Pi 3 B Plus have shown that one
> iteration is not enough to discover issues reliable. So
> switch back to the defaults (1000 iterations).
>
> Link: https://lore.kernel.org/linux-staging/c7e302b6-fc62-4754-ab1d-7c2771cccf60@gmx.net/
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

I've been using this for all my testing for recent patches.

Reviewed-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>   drivers/staging/vc04_services/interface/TESTING | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/interface/TESTING b/drivers/staging/vc04_services/interface/TESTING
> index 273952dc9d85..c98f688b07e0 100644
> --- a/drivers/staging/vc04_services/interface/TESTING
> +++ b/drivers/staging/vc04_services/interface/TESTING
> @@ -52,10 +52,10 @@ Here are the most common kernel configurations:
>
>    * Ping test
>
> -   Command: vchiq_test -p 1
> +   Command: vchiq_test -p
>
>      Expected output:
> -   Ping test - service:echo, iters:1, version 3
> +   Ping test - service:echo, iters:1000, version 3
>      vchi ping (size 0) -> 57.000000us
>      vchi ping (size 0, 0 async, 0 oneway) -> 122.000000us
>      vchi bulk (size 0, 0 async, 0 oneway) -> 546.000000us
> --
> 2.34.1
>

