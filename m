Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBDD21CC51;
	Mon,  5 Jan 2026 23:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767657265; cv=none; b=THhqqsy/RWIg21UNtzEW+8mRkJx4P+qk1kJfY+zipRlg5mToFnAK5VO2a55+XcPFxWzkgBF2NVUJUS+CLPjP0CfdDnsiROm/cpStBcTC7gbBVS1M+y+kA1fmp5N4vH7g+wZ2qXobkPJiQv224bufIaIBT7hxtJOK+31R96wWUng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767657265; c=relaxed/simple;
	bh=7wj03X6nV42b0NIzv3Q7f30W49mcOv+Xqo2uYWrVfjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jb6I8jzAsk0mYuMLvbiTj3C8SEGJ7L74tw9D6gyDcBxpkQXaj/fKELRnoZ+faaSo2DJE/qOAPuu0f6ozQWRz69qbfLdtZ55WJ9xYWtF8lLyf/2joe0b9HSpVek8N9f00C8fa3TyGgkpE/5HTmFY/3m9kX18ZQ4uEMiWHEfJlAWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=qaxmBLUN; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qaxmBLUN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=y+RF3jt39iakpkTx/MszKZgnx5LSGitWRk86zl2as3g=; b=qaxmBLUNGCGDsv5yeFlbFxS7nZ
	7IxsW9xE1x4rpLwrT3WeauSkKa/R6mRy5wpIxAIN90zy1sM6QhcrgBCdkn+gNgPh5sg5avGaT6jP7
	EOq3tlsfNjCHpzRS3iGiLKJfnm4P7AwaJRIeGT5p/lURZPeRmW7Whi9V9V6i38+M86TBwmqUWJe5+
	hY88NodLvqDAsbgvNniwPEFIxKgmTC3JdqXyoCmLQ0H87tqoMw/Fb4XvAhL5Od8WpP8uJwaPXkSQD
	9IPSDsCY7pTPC+eINTo5skztfSdAQGHYuh21kLFv1y7ln4OvJ6ASz7UVopn+ebH6HAw0es9OdaSuq
	pdX+fDHg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcuP0-0000000CFMg-0zzo;
	Mon, 05 Jan 2026 23:54:22 +0000
Message-ID: <745af80f-58df-46a2-8316-f52b0ea6d7ec@infradead.org>
Date: Mon, 5 Jan 2026 15:54:21 -0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: arche: drop dangling Kconfig symbol
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-kernel@vger.kernel.org, Vaibhav Hiremath
 <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
References: <20251230062704.3339404-1-rdunlap@infradead.org>
 <d81069b8-04fa-437c-8bbc-51360784952a@infradead.org>
 <aVuNzWb3TEj74t2M@stanley.mountain> <aVuPidYUPZxCOdRp@stanley.mountain>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aVuPidYUPZxCOdRp@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dan,

On 1/5/26 2:16 AM, Dan Carpenter wrote:
> On Mon, Jan 05, 2026 at 01:09:17PM +0300, Dan Carpenter wrote:
>> On Tue, Dec 30, 2025 at 10:23:40AM -0800, Randy Dunlap wrote:
>>>
>>>
>>> On 12/29/25 10:27 PM, Randy Dunlap wrote:
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
>>> Perhaps I should have left COMPILE_TEST here, like:
>>>
>>> 	depends on COMPILE_TEST
>>>
>>> ?
>>
>> If we're going to do that, we should just delete it.  It's been
>> impossible to build for eight years.
>>

I saw that. I just wanted some feedback on it first.
I'll send v2.

> 
> I did a `git grep 'depends on COMPILE_TEST'` for other drivers which
> are never used and only found this one which was disabled in 2018.

Looks like it should go away also. Thanks.

> regards,
> dan carpenter
> 
> commit da2827a298f8a2159f31466759cbba2dd4f1b65f
> Author: Arnd Bergmann <arnd@arndb.de>
> Date:   Fri Mar 9 22:45:26 2018 +0100
> 
>     usb: isp1362: remove blackfin arch glue
> 
>     The blackfin architecture is getting removed, and this is the last
>     remaining architecture specific setting, so the various hacks
>     can be removed now.
> 
>     From all I can tell, there are no remaining in-tree users of the
>     driver, but it could be used by out-of-tree platform ports.
>     I've marked the driver as 'depends on COMPILE_TEST', short of
>     removing it outright.
> 
>     It was originally written for some ARM PXA machines using the same
>     chip, but that platform never really worked and the code has been
>     removed a long time ago.
> 
>     Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>     Acked-by: Aaron Wu <aaron.wu@analog.com>
>     Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index 4fcfb3084b36..b85822f0c874 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -360,6 +360,7 @@ config USB_ISP116X_HCD
>  config USB_ISP1362_HCD
>         tristate "ISP1362 HCD support"
>         depends on HAS_IOMEM
> +       depends on COMPILE_TEST # nothing uses this
>         ---help---
>           Supports the Philips ISP1362 chip as a host controller
> 

-- 
~Randy

