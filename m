Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B313A239E7F
	for <linux-staging@lists.linux.dev>; Thu,  4 Jun 2026 21:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780609685; cv=none; b=Rq/dK6BV11W7/FssqvSPTuyOd1WEGGGTT4T7DV8BTphChgnHTMdp1VZaap5Lo+Sl0yzsZ2lGZHhlnibx8UZPs5IfEC3WSxK/vlK3IF6iQ9Kv2UPTYKJMBC0o3Gxg6adSGq7NbopsrTtxV9g2aJuKtubFbS+GmCCe5UjFuUxwx7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780609685; c=relaxed/simple;
	bh=RQw/MMIy0Y7JQXfYWayiWbJj3Y63IJWetlLoqy7cEiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mlUw/uy06Dqnw0gcCMYGSHXKi+Sm3n8Ny3wyHKqPoBEAmeRk/3NLHCYfhYv/S5TL1McsC0wk4EPzAj1QOPEwJ4gFVT2/1CwpCQqaUGL/vsghCYFBsvJkt45zDRX4DMqLSYUQ1rwIC9PgaGGqZ/EFbC5gLR9AzrI2JMCOBEmxhZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crVvvtCF; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crVvvtCF"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso13000275e9.2
        for <linux-staging@lists.linux.dev>; Thu, 04 Jun 2026 14:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780609682; x=1781214482; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nnLMdS9dXm1Xt3xZ1tL3GqGxgdcxj0AkHPljnYKRHGw=;
        b=crVvvtCFb5/y934OYKIZaNFm0cCd87PAtI7e2FofBnk8llLSpWIARgajUXlyyg+uRB
         LpM68ED3w7IfHG8pkMJAuQA7jfJAkaZglrbySWlED6NrlhI9RZ7GjpKh7/vMqzOGNxIM
         /RWoLbS2wxUN7/IQzedAQP+P2rezLvVx5PwWqoKL+pmEqduBRELJhZuJTd8+60aGyomt
         sblosR0fZ7/s/qhpB3Ig5NH3hbJvNp7nmDOTjq9KgBOVBAjss8nsB7/jZM9G/wCQrwfe
         vbhkbfNX50CmWWWRDoYaY38sntaRmYEdM1Ek5uh/nXPt7Nr7pEBU1zyEk7OHuU1DzQ+w
         lZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780609682; x=1781214482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnLMdS9dXm1Xt3xZ1tL3GqGxgdcxj0AkHPljnYKRHGw=;
        b=fZlEwokOJ/AiI9XtLPGD0+WRmk7JgnAqwMcxKFIv2sA0tAKsIpeYCTzkV29EPPIwEe
         suIm2UO4MxUki6IhsDugTSMqXmYFmZLbmYqmvCrVeA5YKT72bzIYbfH8FhNp9D8rtmU7
         Fk5GKAI/pMgyYsrlaCb1r+eY7SlV2+fRrxA2NM/OHYCpcsEOYX2TRavr7a1ojSd6+4uQ
         x4XtQvYPGX4jCnFQXzujDHIxyAHqx8+vscw5IVjvhjwp1wXnNOrXjt2kgatHeZ+OTDzT
         qiBFk89lV+DtbsCa79sCcMDez6ZDqwXBYjroWBZ2W2DHtnovclGoBwR15XY9KIQMzs/W
         4H3Q==
X-Forwarded-Encrypted: i=1; AFNElJ9zuCb4uU5lO6IsqNEOpck7NMjOUBdssJKsaC9OjEBfiouy7KuhVXc4ntMXeg1MAnIEp9NArI3ccdJQHMgL@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9mFz5YRM/r6PpR+B8m2la2Nx+X6toRUqZv/DCvQE/wvYqh5W4
	PYDEUMoet3iCsFFAulhxy4m23Q1qUpvvZQyS3TKqVojI7tRlZ6q/t1RC
X-Gm-Gg: Acq92OHWRsxwa916low/yQilW0IsOopvOWlVYz7Aupynh5G8Iz8fIKS0c4HhV7K+Hq2
	KCQR9unWs3rS0cZNnq3yrbAZOScJwSvoG/Ssoga4TQcFU4E5YJnT7XRPpVbB80bPTpz+dBQg5kT
	qHdu7TnQAtBU80AHWouvD/lYaGk83PGYJeEKWB8ZuIbH7aRgdzJt46uManlfev+mTHCH7nyNMw9
	zO40o5DpNIt/prSEDhrB76jg5dWs8csOj8OhpI7IycdF9sK/HPlHrrh1RLw0NJgCdbbiwGFtgX7
	/EYFvWcB4UpCKXlaDVJx3HtdL7KkPuDduz/s4qfvm4zSt+IR1muofYQGNX+NGID60TnV0jazqJI
	tGxzYKAtF+BqJqQbP42gNu5lLWyKHxXy/qK6Oht2FYUrJG3S/pzc/0o3h5+Mk/6Im9ShnX8FV7k
	EeXJEJu59GaaNdRzRw+7axAugpZj7vyrE5nHEgfCbEJw==
X-Received: by 2002:a05:600c:45c4:b0:490:4ee0:82ff with SMTP id 5b1f17b1804b1-490c25fcfafmr5160015e9.27.1780609682054;
        Thu, 04 Jun 2026 14:48:02 -0700 (PDT)
Received: from [192.168.1.50] ([81.196.40.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39eb04sm103707765e9.6.2026.06.04.14.47.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 14:48:01 -0700 (PDT)
Message-ID: <853404cd-cd0d-4562-82bf-2272240df785@gmail.com>
Date: Fri, 5 Jun 2026 00:47:59 +0300
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
 <fa16641f-d6b2-47e8-b1a9-08d63387c733@gmail.com>
 <aiA0zDHc494rnc55@ashevche-desk.local>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <aiA0zDHc494rnc55@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/06/2026 17:06, Andy Shevchenko wrote:
> On Wed, Jun 03, 2026 at 04:40:45PM +0300, Bitterblue Smith wrote:
>> On 03/06/2026 03:48, Andy Shevchenko wrote:
>>> On Sun, May 24, 2026 at 09:30:01PM +0300, Bitterblue Smith wrote:
>>>> On 27/01/2026 17:38, Minu Jin wrote:
>>>>> This series improves error handling in _rtw_pktfile_read() and cleans up
>>>>> the code style to comply with kernel standards.
>>>>>
>>>>> 1. The first patch combines the logic change and caller updates.
>>>>>    The function change and the caller updates must be in the same
>>>>>    patch. If they are separated, the code will not work correctly 
>>>>>    or will cause errors at that specific point in the history.
>>>>>
>>>>> 2. The second patch focuses purely on code style cleanup (changing uint
>>>>>    to unsigned int) as requested by Andy Shevchenko.
>>>>>
>>>>> Regarding the logic change in _rtw_pktfile_read():
>>>>>
>>>>>     The original code used a ternary operator to read whatever data was 
>>>>>     available, even if it was less than requested. This could lead to 
>>>>>     callers processing incomplete data without knowing it.
>>>>>
>>>>>     I have changed this to return -EINVAL when the remaining data is insufficient. 
>>>>>     This is safer because most callers expect the exact amount of data and 
>>>>>     should not proceed with a partial read.
>>>>>
>>>>> Testing and Verification:
>>>>>
>>>>>     I do not have access to the physical RTL8723BS hardware. However, I have
>>>>>     performed a rigorous manual audit of the data path and verified the
>>>>>     changes using Smatch static analysis. The analysis confirmed that no
>>>>>     new warnings or logical regressions were introduced in the modified files.
>>>>
>>>> I have some bad news:
>>>>
>>>> https://bbs.archlinux.org/viewtopic.php?id=313401
>>>
>>> It's unclear that this patch made it happen. See below.
>>
>> It looks pretty clear to me, but okay. I forwarded your request for bisection.
> 
> I don't know how it does. There is no information about from which kernel one
> upgrades to which. I assumed someone bumps from v7.0 to v7.0.3, but there no
> such patch. If we take v6.19..v7.0.3 range, there are dozens of patches.
> 
> I.o.w. it is semi-poorly written bug report: some of useful information and
> some crucial that is missing...
> 

The new message "coalesce failed with error -22" is printed when
rtw_xmitframe_coalesce() returns -EINVAL. This is the only recent patch
which touched rtw_xmitframe_coalesce().

>>>> [quote]
>>>>
>>>> Hey everyone,
>>>>
>>>> I recently upgraded my system, and now I’m having a strange issue with my
>>>> WiFi (Realtek RTL8723BS).
>>>>
>>>> now I can no longer connect to any WiFi networks as a client. however,
>>>> creating an Access Point (AP) still works fine, but whenever I try to connect
>>>> to an existing network, the connection fails.
>>>>
>>>> dmesg logs:
>>>> Every time I attempt a connection, dmesg gets spammed with this error:
>>>>
>>>>     [ 1083.925640] rtl8723bs mmc0:0001:1 wlan0: xmit_xmitframes: coalesce failed with error -22
>>>>     [ 1084.921217] rtl8723bs mmc0:0001:1 wlan0: xmit_xmitframes: coalesce failed with error -22
>>>>     [ 1085.921434] rtl8723bs mmc0:0001:1 wlan0: xmit_xmitframes: coalesce failed with error -22
>>>>     [ 1086.922320] rtl8723bs mmc0:0001:1 wlan0: xmit_xmitframes: coalesce failed with error -22
>>>>     ....
>>>>
>>>> Has anyone encountered this specific "coalesce" error with the rtl8723bs
>>>> driver? I'm looking for advice on whether this is a known bug in recent
>>>> kernels or if there's a specific module parameter I should try to bypass
>>>> this.
>>>>
>>>> System Info:
>>>>
>>>>     Chipset: RTL8723BS (SDIO)
>>>>
>>>>     Kernel version: 7.0.3-zen1-2-zen
>>>>
>>>> update: I fixed the issue after kernel downgrade
>>>>
>>>> [/quote]
>>>
>>> That guy should bisect and find the culprit. It will help a lot to understand
>>> what's going on.
> 

