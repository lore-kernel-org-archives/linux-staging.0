Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765FA47D935
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 13:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780494050; cv=none; b=nfm34CZtke2k8etDo0pERHFI7ccsLQVVt8loILPjx3xkKaEjMt3CkB3DoarKyA5GKCx78OtUGnGvdloTZBHAJwJPl1xxaBl2B34ttHGqMG9U8LaZihIHhyBsCDBy+lUJ9YdrNVHe9e2nX292skxJmzas68MJkWBb2b38jsw/cuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780494050; c=relaxed/simple;
	bh=krjUmtyITYIPUcrxOM06VJgMAKrc3z7+A0NJ7PHRags=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hSPZprQWbuvTSsOHwOBW924odu6wQkZtgTgj87hl9vsi7n41a+DyFSE0HfsHWyS8TCe/+yO9q7ZpyM5AmWAAW6EGHbgDpR8a3Ru+oxAiSyiKEKfl3JbEE4AHKym6X8rn2J8Gq0YV+qcLonepsBZw0QwflGbveYWIck934jj6T2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ionlTYu4; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ionlTYu4"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso27922985e9.1
        for <linux-staging@lists.linux.dev>; Wed, 03 Jun 2026 06:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780494048; x=1781098848; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=drDl7Um75iT8WkjafTauQmyYiz65cUc3KqncS4NQ1aY=;
        b=ionlTYu4Ng2qOD1l0NHHX54IzhApXArPxqWuQACZTHEDY4MJIIRnOAIy71IINX/7oH
         PN6Xru14napY0ddw4Iv6bDSLhoHMudSkSToEgtApTnhEr4WyfJXenY3BC8uyyt6LfYo0
         qJQsGuKYc8yhFx/B7yEPW63T7GWCWKwA/ZChGxPYobbu063LXlzjmRFOEY5vTx8IGt8+
         LfMfRW4Cbs6Odd1GgFNdPyC/Y7g+SXtgGGDcsEazBVHXta1UHcm9cRqy2lsGEOPKVRsz
         zo2rccoIamL2rRvIUcmH0zqekexShPv2EZGj/Srki6XCgwfYL7QIgKa5mPqjyVtfGkC6
         XS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780494048; x=1781098848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=drDl7Um75iT8WkjafTauQmyYiz65cUc3KqncS4NQ1aY=;
        b=YXDAMhNge7SWH602aEHQKFIqzsqqBFvfzmcZFUpU/aqcJZXoLHbSiN+GtQaXALWKsY
         JM7ZKnnYXYoyAqSu6qM1D7Vwfn71RmPUX26H+zIN/UQEvEoK5X3DLZyd8omcmDVaPSdZ
         qUWMEQQUZ3Q28MCEj9aht0+O1EPByhdAJLEVM5BXSMgGXsqIS8geq722Df1tgAe42FjQ
         qVZiNsU+0ML/y+ovA5i+uZFa59QhWbReINyoUALs5lODmT0v5sg5mkE8bXJo374HIkfY
         LNzYuyDj3UrawlHYOvQ4mwD709YR3T8jK2yHV/tV9P55gpXLK0GjzbNWIAaaxVDZ1NAD
         gj7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+5z5Lx+3I67YOb/hHum8LaOKdYtmao/gphL+n3ms1zN28603t8OASHPSuPruYPu6/S0Hh+8s8cFGqehiPf@lists.linux.dev
X-Gm-Message-State: AOJu0Yzub2zsauudpeCSAdAV2CxxBtxFHe7Lo32CUfwS3x0sKuXDfj53
	9rcovV4GBl2cruwV3sdqZzV30W+BQ1eXr4faoXJxfnYy3QWBUR3pg+Nm
X-Gm-Gg: Acq92OExdYFgxd+PJioilgSACmYQkU9Yy5VwDOZcDDUzSXEJrhSuDu090bSIv7xHuLr
	jv6K8qxLJWmgt9JDn09DvouMvOAJjkViaa1CssMvqZVSXcmKiOmbgtFp1e9VyiHqw/OV442310i
	adS6ziUtpG7b4Idb4HNUQTBlR8KlX0lbo4viuvd8Q8VZKyQ+BzPFqAT8kqpx1Rwr3VaR+dFU8UN
	XtHCFnizQrodvvFzndyx9knNV3gfoEz5z3FA9/lVIQXmahYJt3FUQj/fjwuZCKERd29VS743T2i
	sVf31mju9UPOwXUM1PQuaghS7DnDV9DnrWP7wuYunybl80CtQa9KvjXtRxCZabbZMlm9nLH0VOZ
	CEGRow4oBTaMj16DmsAUZ8P00mUZVGQHpNWebKmZIqq2sY5/aU+cqAHhJrW5LD0YfUJlnoUPuii
	KBUf1mYkzGtKHSOJ3G9QpFos/kmCUSqgxGJIMv2T3SVQ==
X-Received: by 2002:a05:600c:458b:b0:48f:e249:4094 with SMTP id 5b1f17b1804b1-490b5fe0adamr60241125e9.18.1780494047760;
        Wed, 03 Jun 2026 06:40:47 -0700 (PDT)
Received: from [192.168.1.50] ([81.196.40.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e7639csm143868165e9.10.2026.06.03.06.40.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 06:40:47 -0700 (PDT)
Message-ID: <fa16641f-d6b2-47e8-b1a9-08d63387c733@gmail.com>
Date: Wed, 3 Jun 2026 16:40:45 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/2] staging: rtl8723bs: Fix error handling in
 _rtw_pktfile_read()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Minu Jin <s9430939@naver.com>, gregkh@linuxfoundation.org,
 dan.carpenter@linaro.org, abrahamadekunle50@gmail.com,
 zxcv2569763104@gmail.com, milospuric856@gmail.com, karanja99erick@gmail.com,
 weibu@redadmin.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260127153811.1592900-1-s9430939@naver.com>
 <c6828c20-8f77-423e-a744-344d09c54488@gmail.com>
 <ah955alcKpjMXYXy@ashevche-desk.local>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <ah955alcKpjMXYXy@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/06/2026 03:48, Andy Shevchenko wrote:
> On Sun, May 24, 2026 at 09:30:01PM +0300, Bitterblue Smith wrote:
>> On 27/01/2026 17:38, Minu Jin wrote:
>>> This series improves error handling in _rtw_pktfile_read() and cleans up
>>> the code style to comply with kernel standards.
>>>
>>> 1. The first patch combines the logic change and caller updates.
>>>    The function change and the caller updates must be in the same
>>>    patch. If they are separated, the code will not work correctly 
>>>    or will cause errors at that specific point in the history.
>>>
>>> 2. The second patch focuses purely on code style cleanup (changing uint
>>>    to unsigned int) as requested by Andy Shevchenko.
>>>
>>> Regarding the logic change in _rtw_pktfile_read():
>>>
>>>     The original code used a ternary operator to read whatever data was 
>>>     available, even if it was less than requested. This could lead to 
>>>     callers processing incomplete data without knowing it.
>>>
>>>     I have changed this to return -EINVAL when the remaining data is insufficient. 
>>>     This is safer because most callers expect the exact amount of data and 
>>>     should not proceed with a partial read.
>>>
>>> Testing and Verification:
>>>
>>>     I do not have access to the physical RTL8723BS hardware. However, I have
>>>     performed a rigorous manual audit of the data path and verified the
>>>     changes using Smatch static analysis. The analysis confirmed that no
>>>     new warnings or logical regressions were introduced in the modified files.
>>
>> I have some bad news:
>>
>> https://bbs.archlinux.org/viewtopic.php?id=313401
> 
> It's unclear that this patch made it happen. See below.
> 

It looks pretty clear to me, but okay. I forwarded your request for bisection.

>> [quote]
>>
>> Hey everyone,
>>
>> I recently upgraded my system, and now I’m having a strange issue with my
>> WiFi (Realtek RTL8723BS).
>>
>> now I can no longer connect to any WiFi networks as a client. however,
>> creating an Access Point (AP) still works fine, but whenever I try to connect
>> to an existing network, the connection fails.
>>
>> dmesg logs:
>> Every time I attempt a connection, dmesg gets spammed with this error:
>>
>>     [ 1083.925640] rtl8723bs mmc0:0001:1 wlan0: xmit_xmitframes: coalesce failed with error -22
>>     [ 1084.921217] rtl8723bs mmc0:0001:1 wlan0: xmit_xmitframes: coalesce failed with error -22
>>     [ 1085.921434] rtl8723bs mmc0:0001:1 wlan0: xmit_xmitframes: coalesce failed with error -22
>>     [ 1086.922320] rtl8723bs mmc0:0001:1 wlan0: xmit_xmitframes: coalesce failed with error -22
>>     ....
>>
>> Has anyone encountered this specific "coalesce" error with the rtl8723bs
>> driver? I'm looking for advice on whether this is a known bug in recent
>> kernels or if there's a specific module parameter I should try to bypass
>> this.
>>
>> System Info:
>>
>>     Chipset: RTL8723BS (SDIO)
>>
>>     Kernel version: 7.0.3-zen1-2-zen
>>
>> update: I fixed the issue after kernel downgrade
>>
>> [/quote]
> 
> That guy should bisect and find the culprit. It will help a lot to understand
> what's going on.
> 

