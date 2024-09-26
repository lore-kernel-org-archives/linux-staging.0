Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC84487A7
	for <linux-staging@lists.linux.dev>; Thu, 26 Sep 2024 04:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727323847; cv=none; b=KXk8loE9I1jP22LavUAhQsjgvnRYRh+mPb9ZxSqdseEujOUtvrPASQguBkj64Nxq0vsdtgdNBkNIpBnXz+5x89KWkza328T2Veoiloq/L1CGQn7XcDrpCkicy6eFfO3JAmvb3Cyx1s0O2g4wQ6t6JtV11EFULSkSObgG0SfEDjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727323847; c=relaxed/simple;
	bh=xNzjTIY+/UjJ4mk16Bpwfknhgz/q+8dCxH323xBgEkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L0DP0ywQzahJN8NLzM0PxA7gGm0kyCWFS2hgtPjmq6rCxh4pcfXsB5O0v052CKaKSZ8UEuYzAc7cwTCxwoud6YdSyqq6x9KzcKNLHh0va+9GoDWv0yJCe4LYn1K1gby2cARahQXYqMvp4hlqAcjFUygxup5AkgTJeOa9f+ji4RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OjUF9Wf8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OjUF9Wf8"
Received: from [IPV6:2405:201:2015:f873:c173:4b:4a04:3a21] (unknown [IPv6:2405:201:2015:f873:c173:4b:4a04:3a21])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07E36169;
	Thu, 26 Sep 2024 06:09:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727323755;
	bh=xNzjTIY+/UjJ4mk16Bpwfknhgz/q+8dCxH323xBgEkI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OjUF9Wf8XkL6aG8x0u+7FleE010kRackRa2fE1sDKdw35zUD0fK+PlaErEzdabGyH
	 MBwIAWpV2a5IklwPfsHkItrEPlq9T1EToXy6Gy9TFbJOeshnrMjmT+18djRcZjMI2n
	 neECsu78kzTCfiUJvGYcZFwflFFMGNt4GFVq+zYY=
Message-ID: <b7e0d579-a3c5-42ee-a65c-945f5c368124@ideasonboard.com>
Date: Thu, 26 Sep 2024 09:40:37 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] staging: vchiq_core: Consolidate bulk xfer helper
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Stefan Wahren <wahrenst@gmx.net>
References: <20240919142130.1331495-1-umang.jain@ideasonboard.com>
 <6661b2d5-b439-46e1-b240-9fe436db4e67@stanley.mountain>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <6661b2d5-b439-46e1-b240-9fe436db4e67@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dan,

On 25/09/24 2:53 pm, Dan Carpenter wrote:
> On Thu, Sep 19, 2024 at 07:51:27PM +0530, Umang Jain wrote:
>> Few functions were identified were their declaration, definition
>> and usage were spread (incorrectly) across vchiq_core and vchiq_arm.
>>
>> These are being consolidated into vchiq_core in this series.
>> Please look at individual patches for details.
>>
>> 2/3 is in particular a big one. The code is just a move, but
>> seems big - as it was diffcult to split it into smaller, compilable
>> hunks of individual patches.
>>
>> Umang Jain (3):
>>    staging: vchiq_core: Move remote_event_signal() vchiq_core
>>    staging: vchiq_core: Move bulk data functions in vchiq_core
>>    staging: vchiq_core: Drop vchiq_pagelist.h
>>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks for reviewing.

>
> But next time, if you're just moving code around, just ignore checkpatch.  Do
> the white space changes as a separate patch.

Thanks for the tip, will surely keep this mind.
>
> regards,
> dan carpenter
>
> +-                      memcpy_to_page(pages[0],
> +-                              pagelist->offset,
> +-                              fragments,
> +-                              head_bytes);
> ++                      memcpy_to_page(pages[0], pagelist->offset,
> ++                                     fragments, head_bytes);
>   }
> +               if ((actual >= 0) && (head_bytes < actual) &&
> +                   (tail_bytes != 0))
> +                       memcpy_to_page(pages[num_pages - 1],
> +-                              (pagelist->offset + actual) &
> +-                              (PAGE_SIZE - 1) & ~(drv_mgmt->info->cache_line_size - 1),
> +-                              fragments + drv_mgmt->info->cache_line_size,
> +-                              tail_bytes);
> ++                                     (pagelist->offset + actual) &
> ++                                     (PAGE_SIZE - 1) & ~(drv_mgmt->info->cache_line_size - 1),
> ++                                     fragments + drv_mgmt->info->cache_line_size,
> ++                                     tail_bytes);
>

