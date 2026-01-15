Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA503D76;
	Thu, 15 Jan 2026 00:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768436922; cv=none; b=fA4h0qdmj7EzUV+xCEMYNblt3f+/Che3Qm8dkjYFXg6ZVidxOuCnxFblYLosYhlDzuSTZedcWmhZVb4WqzV9cWN7s0mu1V0T9YKZlUGH1rROXsTWQuXyjdAPRL60tEGL1BHauNGT9vJD12cl48yUtbTR+CRX2Tuip3ptfVJ60kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768436922; c=relaxed/simple;
	bh=q5RzU9SZ+gqrx4Taf4ZqtoBgJdHTC92sAiCtXjegr7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QJZissK7F860qgOZkCMGKGEKB30qSVZNZk52epkbLNrg+HuZUxnfRR8kUZofnOo8r2X45a/p9Whv/d4jdcPTxorViKOBbXkRDo9XJGO3kpTo2fJI4DL/V9astPfNvEM2PZRMoR/idLprdUOHcQFHHNaVxJOntcH3M2oz1hfBKU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=V7BQZqck; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="V7BQZqck"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=rvLeh12gjYrcWInk9fCzIdWX8OO78EURgr9B7iEH+HA=; b=V7BQZqcklp+KzcB/juLl6UQiNG
	amzJWkQHATjvD98bFZ//z4UPD+lyy0eCqN4A63kz5xYezhQFRvptXjHqViwSnATOG42BRdi+xytH0
	84RkVF37LM/nubUv2SFXNkS3FZCZdCPYKjwNjZlxka8i3zMBcLckUpBhGk9nKMBKLoCiJSGzrpF2+
	E77mMv2iJDnIRYiFMr6NkneGsouGQBU0n+pSoDL4W8j8EgdinauYbn+tEBOoJc5fB0QokC1R/d36/
	TmCieM8fq6QqMC4G+5zpdEpIhAOubMYTuxtiYe93gy+mBCJcwSw9Zp/S87G3zKQFRkm1wq1Bk1n56
	9/QFF+ng==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBE3-0000000BE6d-0rVd;
	Thu, 15 Jan 2026 00:28:37 +0000
Message-ID: <f51a80c9-bc87-442e-b2e5-0e688a4cedd1@infradead.org>
Date: Wed, 14 Jan 2026 16:28:33 -0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: arche: drop dangling Kconfig symbol
To: Johan Hovold <johan@kernel.org>
Cc: linux-kernel@vger.kernel.org, Vaibhav Hiremath
 <hvaibhav.linux@gmail.com>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
References: <20251230062704.3339404-1-rdunlap@infradead.org>
 <aWdgCblk91iJE4T2@hovoldconsulting.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aWdgCblk91iJE4T2@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/14/26 1:21 AM, Johan Hovold wrote:
> On Mon, Dec 29, 2025 at 10:27:04PM -0800, Randy Dunlap wrote:
>> The Kconfig symbol USB_HSIC_USB3613 is not defined in the kernel source
>> tree. Drop it since it unused.
>>
>> Fixes: 2eccd4aa19fc ("staging: greybus: enable compile testing of arche driver")
> 
> As the commit message of that commit says this was done on purpose to
> allow the driver to be compile tested without the out-of-tree driver
> that never went upstream.
> 
> These days we have a USB hub driver that should probably be used
> instead, but yeah, someone would need to do the rework.

We?
Do you mean drivers/usb/core/hub.c?

> And while referencing the commit is good, I'm not sure a Fixes tag is
> warranted.
> 
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>  
>> --- linux-next-20251219.orig/drivers/staging/greybus/arche-platform.c
>> +++ linux-next-20251219/drivers/staging/greybus/arche-platform.c
>> @@ -23,14 +23,10 @@
>>  #include <linux/of.h>
>>  #include "arche_platform.h"
>>  
>> -#if IS_ENABLED(CONFIG_USB_HSIC_USB3613)
>> -#include <linux/usb/usb3613.h>
>> -#else
>>  static inline int usb3613_hub_mode_ctrl(bool unused)
>>  {
>>  	return 0;
>>  }
>> -#endif
>>  
>>  #define WD_COLDBOOT_PULSE_WIDTH_MS	30
>>  
>> --- linux-next-20251219.orig/drivers/staging/greybus/Kconfig
>> +++ linux-next-20251219/drivers/staging/greybus/Kconfig
>> @@ -206,7 +206,6 @@ endif	# GREYBUS_BRIDGED_PHY
>>  
>>  config GREYBUS_ARCHE
>>  	tristate "Greybus Arche Platform driver"
>> -	depends on USB_HSIC_USB3613 || COMPILE_TEST
>>  	help
>>  	  Select this option if you have an Arche device.
> 
> The above just seems to hide the fact that the driver currently cannot
> be used.
> 
> Can you please at least add some kind of TODO comment to indicate that
> the driver should be reworked to drop the dependency on the OOT driver?

Sure, I can add that, but I think it needs more info. Reworked how?
What should the usb3613_hub_mode_ctrl() function do?

> And it's probably best to keep the depends on COMPILE_TEST until that

ack

> has been resolved. Perhaps also wrap usb3613_hub_mode_ctrl() in
> 
> 	#ifdef CONFIG_COMPILE_TEST
> 	...
> 	#endif

Don't think so. The driver calls usb3613_hub_mod_ctrl() in 4 places,
so it needs to be there.

-- 
~Randy

