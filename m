Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94BD2222AA;
	Sat, 17 Jan 2026 05:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768628457; cv=none; b=TpQsKTcmhG1WJ4i1CKgo0KHLJA0WwFbcGm91k1XUO1XpAh0qvoBd6jmxY3ZVirCqrF/uLd8QFDO2DN43J702kGEkssz3M0AYgqfOAY1T0t6bK9ulWorVoL98ZKMJelS5u4Cat3I+FH6qK6XlXY8DX1g1RL9fYIgDLUvAIOzXMjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768628457; c=relaxed/simple;
	bh=hDbLhUMBPAsq/E4ZrGcch+C+m1eiLqyWTPiJm0EQ4ZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mm/Ak/hNSXYTMn7hIfStxmW809hVjBSypO0FAHc/5ti8Vr3kYkrwuL1w2Pk0BKtOLYXch3BmTZ/2AMtuPy25uJ5NEz9LN/Atg6POaheCUGv2N8X7oeLq/re9dl/ZhpFO8r2jpuFgW8c5x0NVd93/3Ffz0FdY8mEVrY65J6TYUJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Dif9rO3/; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Dif9rO3/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=HgW9C7zIs1FTgkiK/aV9D8CBW+qT2NeQ39NuD35ARV8=; b=Dif9rO3/6r28DnpwpRS7hezSNQ
	fW/hojBbRu7QL4+75qtsYcTaVAGXOnZ/Kq3cpZt3p8PIHGnADQsN2gnjjhrz/Ivm0tF6e4hnESRHn
	icZ+qsdf7/66MspyTeR9GOKcJZCH1Xvskp+MmCmCGtvmGhD+Cu318ZvbMKrbvB0++F5cdjnMiOwWI
	kF1KxXnvYO13hk6QTk98S4JoSwMke1vTwndMh3izZ/4QMJpDUmJ8Z81id4QngW3U8ho009h/rTq3w
	+CRP6l4m+pTZD/afCo2TrgmN4HAYd+u3dBfnjvw2DBsa9NqzOYAlicKM4bi5gEd4zkeOW/dQmfNP3
	emJo1FOw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgz3L-0000000FIqA-49UB;
	Sat, 17 Jan 2026 05:40:52 +0000
Message-ID: <26b4abdb-ab04-4637-a5df-262eed1d9629@infradead.org>
Date: Fri, 16 Jan 2026 21:40:51 -0800
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
 <f51a80c9-bc87-442e-b2e5-0e688a4cedd1@infradead.org>
 <aWoXbQYqVeahIxc8@hovoldconsulting.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aWoXbQYqVeahIxc8@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/16/26 2:48 AM, Johan Hovold wrote:
> On Wed, Jan 14, 2026 at 04:28:33PM -0800, Randy Dunlap wrote:
>> On 1/14/26 1:21 AM, Johan Hovold wrote:
>>> On Mon, Dec 29, 2025 at 10:27:04PM -0800, Randy Dunlap wrote:
>>>> The Kconfig symbol USB_HSIC_USB3613 is not defined in the kernel source
>>>> tree. Drop it since it unused.
>>>>
>>>> Fixes: 2eccd4aa19fc ("staging: greybus: enable compile testing of arche driver")
>>>
>>> As the commit message of that commit says this was done on purpose to
>>> allow the driver to be compile tested without the out-of-tree driver
>>> that never went upstream.
>>>
>>> These days we have a USB hub driver that should probably be used
>>> instead, but yeah, someone would need to do the rework.
>>
>> We?
>> Do you mean drivers/usb/core/hub.c?
> 
> I meant the on-board hub driver (now renamed to "on-board dev") which
> did not exist when this greybus driver was written and merged to
> staging:
> 
> 	drivers/usb/misc/onboard_usb_dev_pdevs.c
> 
>>>> -#if IS_ENABLED(CONFIG_USB_HSIC_USB3613)
>>>> -#include <linux/usb/usb3613.h>
>>>> -#else
>>>>  static inline int usb3613_hub_mode_ctrl(bool unused)
>>>>  {
>>>>  	return 0;
>>>>  }
>>>> -#endif
>>>>  
>>>>  #define WD_COLDBOOT_PULSE_WIDTH_MS	30
>>>>  
>>>> --- linux-next-20251219.orig/drivers/staging/greybus/Kconfig
>>>> +++ linux-next-20251219/drivers/staging/greybus/Kconfig
>>>> @@ -206,7 +206,6 @@ endif	# GREYBUS_BRIDGED_PHY
>>>>  
>>>>  config GREYBUS_ARCHE
>>>>  	tristate "Greybus Arche Platform driver"
>>>> -	depends on USB_HSIC_USB3613 || COMPILE_TEST
>>>>  	help
>>>>  	  Select this option if you have an Arche device.
>>>
>>> The above just seems to hide the fact that the driver currently cannot
>>> be used.
>>>
>>> Can you please at least add some kind of TODO comment to indicate that
>>> the driver should be reworked to drop the dependency on the OOT driver?
>>
>> Sure, I can add that, but I think it needs more info. Reworked how?
>> What should the usb3613_hub_mode_ctrl() function do?
> 
> IIRC, this driver exists since we needed to power on the on-board USB
> hub so that the controller could be enumerated. Since there was no
> support for doing such things at the time in mainline, we have this
> custom interface for calling into the out-of-tree hub driver.
> 
> I'd need to spend more time looking at this to say exactly how this
> should be reworked.
> 
>>> And it's probably best to keep the depends on COMPILE_TEST until that
>>
>> ack
>>
>>> has been resolved. Perhaps also wrap usb3613_hub_mode_ctrl() in
>>>
>>> 	#ifdef CONFIG_COMPILE_TEST
>>> 	...
>>> 	#endif
>>
>> Don't think so. The driver calls usb3613_hub_mod_ctrl() in 4 places,
>> so it needs to be there.
> 
> Not if the driver can only be enabled for compile testing.
> 
> Perhaps replacing USB_HSIC_USB3613 with
> 
> 	depends on BROKEN || COMPILE_TEST
> 
> and adding a comment above the ifdeffed usb3613_hub_mode_ctrl() helper
> would make the state of things more clear.
> 
> Or just keep the dependency on the non-existing hub driver symbol. 

Yeah, it's such a mess that I'll just leave it as is.

Perhaps you or someone who cares about it can do something about it.

-- 
~Randy

