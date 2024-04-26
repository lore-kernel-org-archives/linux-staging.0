Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2938473
	for <linux-staging@lists.linux.dev>; Fri, 26 Apr 2024 04:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714105330; cv=none; b=S8pvx4e+g5baRzFCLUJJbhIN94m+Y6/dphOm2K1creYMFFVD6TvpgC46gWXuIDWYRtZntMSb0FwKweKHuult+T9MVwWEFic8ToC5QH68AzPcJCPrx5A8h2OV0uVpzFAEPWXqv306EvErjX4MCFQa4GPWNx2cj8qr2WBTLJWAR00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714105330; c=relaxed/simple;
	bh=YvxLeIF545RDhFDFg7eYwWSB4pJ7Fpc+cpsR6vzhTpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LfMeUVd9J6QXxnGEN31XvKFg6MVsY4612dDw9U41Gdgq/5+yVGIy4dnTRMGv4lAssYaX0EGd51jHYx2WgxOtK02kpXBMoUafzHaE0hnFe45i7FSCL4JfHHLzR9VECe/7r97hQiZfCLWdQf1LhJsyjLIunZB3OrLuSgAv3iCNq2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kgBO4EJg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kgBO4EJg"
Received: from [192.168.1.106] (unknown [103.86.18.162])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B19D5CC8;
	Fri, 26 Apr 2024 06:21:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714105273;
	bh=YvxLeIF545RDhFDFg7eYwWSB4pJ7Fpc+cpsR6vzhTpA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kgBO4EJgMEXR0DExoPoAK84UIPiRR9jfmaJ402x0DFpxkM4S4LL0zkGs73RDyc22b
	 WDjgrjK1BbKs3f9Rj5ITh1IC+TPSdkB0RNxoTIphx2VqnXp2C8nGLw/08rFXHa+5zj
	 k1vxBMa5sDDp1JfTEZruB7BL88C7JymNZ9N3EZ/4=
Message-ID: <d78c79c7-a2a9-4a67-8bb9-7635bb738778@ideasonboard.com>
Date: Fri, 26 Apr 2024 09:52:00 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/5] staging: vchiq_arm: Drop unnecessary NULL check
To: Stefan Wahren <wahrenst@gmx.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 kernel test robot <lkp@intel.com>
References: <20240425165852.6681-1-wahrenst@gmx.net>
 <20240425165852.6681-2-wahrenst@gmx.net>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20240425165852.6681-2-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefan,

Thank you for the patch

On 25/04/24 10:28 pm, Stefan Wahren wrote:
> Looking at the handling of service instance within the VCHIQ
> driver shows that it's not possible that service_callback is
> called with instance is a NULL pointer. So drop the unnecessary
> NULL check and fix:
>
> vchiq_arm.c:1109 service_callback() warn:
>    variable dereferenced before check 'instance' (see line 1091)
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/linux-arm-kernel/202404230315.vx7ESZ3r-lkp@intel.com/
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index c06232fcb0fb..297af1d80b12 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -1106,7 +1106,7 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
>
>   	user_service = (struct user_service *)service->base.userdata;
>
> -	if (!instance || instance->closing) {
> +	if (instance->closing) {
>   		rcu_read_unlock();
>   		return 0;
>   	}
> --
> 2.34.1
>

