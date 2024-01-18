Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B5B2942F
	for <linux-staging@lists.linux.dev>; Thu, 18 Jan 2024 15:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705593570; cv=none; b=Q8zrGyubFzXRvFP5HyVSUpsZEpK7omDBhtI4qz84FuzgzHcR4oDHVWEthIy4ZD7rL/xmKv6r7oGCxHtH1ugRN3RACno8TGmYq/O2+VaAUdNFUbyIxwQLMUxAZA2lZoQHSfqrzv0Kk6esAcHr/+7cmotnfukuOQkOVzj8/usmaRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705593570; c=relaxed/simple;
	bh=KyuQF6HdUNUcfYsWpBtnOXi2wQG6pAAJWoFz724W3SM=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=OKZFpilZ3OjNz8vacsdD4Yr68wN6PzC4VDqLxtnKQ91fqnnlF79d7YXQTrmJJp9EQDIKMo9rjF69LObK4UH9lUEP/W3AwF3iWNNdDgSTkC+sbfz9qT1PlmY+fu8YWlD6MxgzJt9Z6v6Vh55RznWiiIHLrxylup+D0olUFbJLVtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/5c4Kbs; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/5c4Kbs"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6dbc2bf4e8dso1830775a34.1
        for <linux-staging@lists.linux.dev>; Thu, 18 Jan 2024 07:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705593568; x=1706198368; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gBRn6TCLCV12Crycew/k4sE3gprwmuYrW7t7WDXXa2A=;
        b=V/5c4KbsIopFu+/yMm0h7jgLYJjbUUBc9qNh6tocFdPN76/RwSIAwVzHuQ1RSsoWPn
         GR3MDxXOx7J/aWebGGN6evpi2TBJ8a1aa1OCDF6td+TrXL/dYnJ2jbEwkCOSWGH+MV57
         tOxJsifulMeGtQ/RVXcB7g/TJD1oCVLZC9GNwrdfjKKfwDMpUDLbnx8dqjgMSLs0EjgM
         1zzJUGPbSt/IQcu3JLsx+mU9WOExhj1ytZu19fN6MzAjG/4QSSurJKhVyP4SlMDMTek/
         FnuEylpXLTNcG+CaNnBlHnismmKIsAa2FGxifgPD15lvm2mEEzgOYl+vfPRJ46jfIFxd
         0Y8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705593568; x=1706198368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gBRn6TCLCV12Crycew/k4sE3gprwmuYrW7t7WDXXa2A=;
        b=E8/JobPuWl4gNc6CXvRpi+T26BIYJmPbVGA0SjLcFU12RO3RwuJB2zGZ2VdKRWJXrB
         +Ya4q72a+//54dnVpW/kTj5s7F0QxjDTLWBdepaTRrWEcXseJZlyaEzQFJBy3Cn0e9OZ
         sjcrH1+1kA2jfA3OUHdXXj6ZCTyRk0w2wQ9lhsVkN6TdXi8/7KZ7iKpoIDUQ7Bb62AAx
         g9hvRXvFx17DazfJWW8s5A9BPuLIlx7PEDalp6waZZ9bCAMyLvIrZAuxu9n3qfdYD0L1
         eGCWLYWyOaMji4vgaZXmEnY2cuf8noU8On/4CQTtm0pg4IVJenQiWyZ2FlRoqZul0pLT
         64sA==
X-Gm-Message-State: AOJu0YzJc7otOTkklnJE0q/yv9dIzEOcpDs9cNGd/2NdSunwa098/lD8
	s4saNXdAYyKT7LQOsFnNoK9oQKE3Ryrq9GY3/50HODk6JqS3DR0g
X-Google-Smtp-Source: AGHT+IEheujLvkVmH8aVuFEJih3HAUl1gO7B9MZ1dkdkxkYZGadT/JN13iN+GMeQ2XpIDPeIbQFFqw==
X-Received: by 2002:a05:6820:2b0a:b0:599:3475:64bb with SMTP id dt10-20020a0568202b0a00b00599347564bbmr2121822oob.1.1705593568049;
        Thu, 18 Jan 2024 07:59:28 -0800 (PST)
Received: from [192.168.1.157] (pool-74-98-201-227.pitbpa.fios.verizon.net. [74.98.201.227])
        by smtp.gmail.com with ESMTPSA id 6-20020a05620a04c600b0078324eaba06sm5362399qks.27.2024.01.18.07.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 07:59:27 -0800 (PST)
Message-ID: <e77d766b-1fd0-4135-b343-0c2bea068a6e@gmail.com>
Date: Thu, 18 Jan 2024 10:59:27 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rts5208: Add more details to Kconfig help
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240118154044.68425-1-jklott.git@gmail.com>
 <2024011854-hardship-undivided-b714@gregkh>
Content-Language: en-US
From: Jacob Lott <jklott.git@gmail.com>
In-Reply-To: <2024011854-hardship-undivided-b714@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/18/24 10:48 AM, Greg KH wrote:
> On Thu, Jan 18, 2024 at 10:40:44AM -0500, Jacob Lott wrote:
>> The current help text is short and triggers a
>> warning from checkpatch.pl.  This patch adds more
>> details to the help text which should provide better information
>> for whether or not to enable the driver.
> Please wrap your lines at 72 columns.
>
>> Signed-off-by: Jacob Lott <jklott.git@gmail.com>
>> ---
>>   drivers/staging/rts5208/Kconfig | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/staging/rts5208/Kconfig b/drivers/staging/rts5208/Kconfig
>> index b864023d3ccb..76a083fbe401 100644
>> --- a/drivers/staging/rts5208/Kconfig
>> +++ b/drivers/staging/rts5208/Kconfig
>> @@ -3,7 +3,11 @@ config RTS5208
>>   	tristate "Realtek PCI-E Card Reader RTS5208/5288 support"
>>   	depends on PCI && SCSI
>>   	help
>> -	  Say Y here to include driver code to support the Realtek
>> -	  PCI-E card reader rts5208/rts5288.
>> +      Choose Y here to enable support for the Realtek PCI-E card reader RTS5208/5288.
> No tab?  Didn't checkpatch complain about this when you ran it on this
> patch?
>
>> +	  This driver facilitates communication between the Linux kernel and the Realtek
>> +	  PCI-E card reader.
>>   
>> -	  If this driver is compiled as a module, it will be named rts5208.
>> +	  If you opt to compile this driver as a module, it will be named rts5208. Selecting
>> +	  N will exclude this driver from the kernel build. Choose option Y if your system includes
>> +	  the Realtek PCI-E card reader rts5208/rts5288. When in doubt, it is generally safe
>> +	  to select N.
> Wrap your lines properly here at 80 columns.
>
> thanks,
>
> greg k-h
Checkpatch is not pointing out any issues when I run it:

./scripts/checkpatch.pl 
/tmp/0001-staging-rts5208-Add-more-details-to-Kconfig-help.pat
ch
total: 0 errors, 0 warnings, 0 checks, 14 lines checked

/tmp/0001-staging-rts5208-Add-more-details-to-Kconfig-help.patch has no 
obvious style problems and is ready for submission.

Does this indicate I need to set a configuration specifically for the 
checkpatch?
