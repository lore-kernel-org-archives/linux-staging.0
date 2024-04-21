Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57485625
	for <linux-staging@lists.linux.dev>; Sun, 21 Apr 2024 08:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713689689; cv=none; b=c3iMaut0cH4JB9qq+jYaqQfEoXOdD/Pp0qAXDsfD3ylTe6yqVoqVpXnZQuBPzsHEE4Ch8l7/TJ2T1YxDfOu/v5i6pK9liZ0yfikqM5H5liFQxnxABkCNrXGBaSE/zVPzAhQhxNuIQOrGAm+XeNZ3O3SX5APimZvJkMVTE2SWry4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713689689; c=relaxed/simple;
	bh=0kKipbTT805Eqy51jThMG4cHsk3EG9VfYg/RRry9fSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ro9kMS4XuaLhwBQ7xIwKg1+P+E9wrsOdsmq6vGz7Qp5sd2W0jpFrvStTIlI3WOKYFzn/IQRYomrCvY1a4kQ9Pp8lbISkexXwob+I0WIIM14ud1GYS3ExHDi/83tgt7QxfJT1mVlYS6oCYyymyh72AwZmHN6jodl/xR964JeK2XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BTh6An8f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BTh6An8f"
Received: from [192.168.1.105] (unknown [103.251.226.10])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7F92674;
	Sun, 21 Apr 2024 10:53:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713689637;
	bh=0kKipbTT805Eqy51jThMG4cHsk3EG9VfYg/RRry9fSY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BTh6An8faAH9THIdjOzm/C17mUxNjOkStuCLIuMnyBm7JQinJnCSy3MFy7kJdl4PB
	 OgWFcjCbEFZj57ngRGfjy7ILec64KjyWq8cyvcNb6ahEEMovg791jFPBpG0iGyc0YT
	 ZaugZQuowGQMBNYLXnlmCXqw44nWC/3hJ4vn8Q24=
Message-ID: <406a4fb3-0b6c-4578-a4c1-fb5949a1e93e@ideasonboard.com>
Date: Sun, 21 Apr 2024 14:24:43 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] staging: vchiq_core: Add parentheses to
 VCHIQ_MSG_SRCPORT
Content-Language: en-US
To: Stefan Wahren <wahrenst@gmx.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20240420115351.27713-1-wahrenst@gmx.net>
 <20240420115351.27713-3-wahrenst@gmx.net>
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20240420115351.27713-3-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefan

On 20/04/24 5:23 pm, Stefan Wahren wrote:
> checkpatch.pl complains
>
> ERROR: Macros with complex values should be enclosed in parentheses
> +#define VCHIQ_MSG_SRCPORT(msgid) \
> +	(unsigned short)(((unsigned int)(msgid) >> 12) & 0xfff)
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Umang Jain <umang.jain@ideasonboard.com>

> ---
>   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index 129d73fec2bf..58451ee08abc 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -43,7 +43,7 @@
>   	(((type) << TYPE_SHIFT) | ((srcport) << 12) | ((dstport) << 0))
>   #define VCHIQ_MSG_TYPE(msgid)          ((unsigned int)(msgid) >> TYPE_SHIFT)
>   #define VCHIQ_MSG_SRCPORT(msgid) \
> -	(unsigned short)(((unsigned int)(msgid) >> 12) & 0xfff)
> +	((unsigned short)(((unsigned int)(msgid) >> 12) & 0xfff))
>   #define VCHIQ_MSG_DSTPORT(msgid) \
>   	((unsigned short)(msgid) & 0xfff)
>
> --
> 2.34.1
>

