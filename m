Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757BD13D891;
	Tue,  6 Jan 2026 03:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767669388; cv=none; b=ofnF/xmHFeaVWTfIur+zjFqat97ev00e6yO7RKB7hPq9GJQZ38Xmy5ZxtGc4vMpCRf3VzzNRLmkIU1eDfT//NiiDDaA67q2tWO5UM2yD43CyV3/UjQInJuRTFQ4SFse5v/0YFmd1pz00YLOlgAoK0OBQPsLzKRSCAwIKk73KMPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767669388; c=relaxed/simple;
	bh=eSTsi5Y576jhTZyyqnn3hgFbcTThlxalzAi0qFEvXuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q02xvUbnGKWsHBTFDB9WAlLRtNDoLMJY4GKBGHI268R55fCLkcjT1u6W2DaDg3Sgu8FZ0/CvE1by5ki4RwVkCStHUXJo5cxKIU7GMKq632zM0uA4nakthduphNSvscE6PpRqqtS6oUB0WAX35J5uA7oh5Q/7u2f9f1PHGyz+j04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rWTUQrL/; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rWTUQrL/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=nQHim4HCX7xICwy0zYdVOLC7CzxkuSBuzcDgPNB/cFg=; b=rWTUQrL/udoKz69oqQy+Ro5Cxh
	Wg/pHTsC62EBBWl/r9sBNUu7VGE7YdN/LwL41HehfKk6PwhtQwg2Inmq72+qcogDb8x+EQw5vVNoA
	wMnSroUKU/WK9MwT6UFnYMzEnzGmLhwCw+jjSL9E7o25SCh2MqMjdFLtNOpsxhQPK05V61D46noMN
	rrCShZCYWqY0PteDiloT1bc4AHzS58Ww50fWQqRfX/zo+QW4hlyVgcxgc2puEnb/2MfqG8YDAQCUc
	/TgbkoFH+XGh+eypzZPOsrw/MscHr3bXVyjsxHctNpSmqcny7X2St7bl7kTiEMnTS3q6ZXKUOPxku
	Tgd6tSIw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcxYW-0000000CN7Y-06xp;
	Tue, 06 Jan 2026 03:16:24 +0000
Message-ID: <d78259ce-8bca-418f-a4f8-87139e8d2177@infradead.org>
Date: Mon, 5 Jan 2026 19:16:22 -0800
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
 <aVuNzWb3TEj74t2M@stanley.mountain>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aVuNzWb3TEj74t2M@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/5/26 2:09 AM, Dan Carpenter wrote:
> On Tue, Dec 30, 2025 at 10:23:40AM -0800, Randy Dunlap wrote:
>>
>>
>> On 12/29/25 10:27 PM, Randy Dunlap wrote:
>>> --- linux-next-20251219.orig/drivers/staging/greybus/Kconfig
>>> +++ linux-next-20251219/drivers/staging/greybus/Kconfig
>>> @@ -206,7 +206,6 @@ endif	# GREYBUS_BRIDGED_PHY
>>>  
>>>  config GREYBUS_ARCHE
>>>  	tristate "Greybus Arche Platform driver"
>>> -	depends on USB_HSIC_USB3613 || COMPILE_TEST
>>>  	help
>>>  	  Select this option if you have an Arche device.

OK, with just the v1 patch here, it does build without errors.
Seems like I should leave this patch as is.


  CC [M]  drivers/staging/greybus/arche-platform.o
  CC [M]  drivers/staging/greybus/arche-apb-ctrl.o
  LD [M]  drivers/staging/greybus/gb-arche.o

>> Perhaps I should have left COMPILE_TEST here, like:
>>
>> 	depends on COMPILE_TEST
>>
>> ?
> 
> If we're going to do that, we should just delete it.  It's been
> impossible to build for eight years.


-- 
~Randy

