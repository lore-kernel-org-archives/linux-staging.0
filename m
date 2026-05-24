Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4821F3081A2
	for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 18:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779647409; cv=none; b=E8Xc6qN0w1N8WpxO24usH6rLOJwGPAkbVWVp+DCmqVumj2N+atElP6GSWM3UeyU93TzNihiVXPlsLLbV0CcRTOeeUmxb1hMzEzFxfByqeKdfxKqJmO5WMlR0415FUvF39/+XHyVfi5TTwY8pgebX4okVn6cdAP/UHNyKz5FpSK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779647409; c=relaxed/simple;
	bh=p/8AOHBhq/TICjwqQxKfP5erT+mxulFxJXRiyVWlMl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JqxPEbozcWe6TqUy+caKQK9CAV99y+7f6UL3dPjm3E7iv/43JaUjdqeeXLlDIV/EC38nOSsLDOg35VeaEKpxngb3LIFPkOm2bGf0MY1zRzsOsQWNEBUg/Ej2VAjeeCT5Lzku3tbXisFwicKM0jSiT0nSnm/Obet1V4Uc8kE7908=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kVR68MrV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kVR68MrV"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso76883955e9.2
        for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 11:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779647405; x=1780252205; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bPIXJAikdFwElV0lTaJirkt4kwhQPmCoEKgc7GdTY7s=;
        b=kVR68MrVXMiloC7Dh3r5RMLrOkZQSacCRSv3I7HGUiZD31GHaHpPT188MYdnqRpwlP
         whr3/xDA7lecSIT0LTQoqCe1A34nHSbRUNe2BmPjFlKL9TpXjawPzZBGX9ba+ojzKMfP
         AHk+yOlpzLxrjD8Hja+HA9ePxfy1chYlxe1ZtT5iBv69OcrtKwlni2ZKXzx3yABlbdsZ
         +ymtJjN3XZI8ug3iFVeJkybxjPSxTaE3o05bAcTAs7YalEG381XmnMJN8ntG0FevR1rQ
         /Jt/s3VrquhgO15VEC34XHT5j5d+McIb8t0Hrbrjj7BHa3mymHBz6+EzieAVsjT94Umf
         ZSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779647405; x=1780252205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPIXJAikdFwElV0lTaJirkt4kwhQPmCoEKgc7GdTY7s=;
        b=BvLF9pk28by0T2KYAZ9y8FTlGwykvgqH3wjnpHts4xCSrYiTa30kz65FYGWJp09fOw
         XogzPvSDq7o++NWad6xU8/yGQH0vNWEGl0TwUITbTispcg7Hs+s5KVGmF0bFsszcLNGG
         mrvb6vsGwVMy0TSp9DwMNrlsEXpmJgfkfsrhRJVMrUB7abJaRjXoFWKStxRQ7J95FZH/
         oGsSlXH3XOC8BYS9wHkDnt+7Zbm+gyDDmYSAlW4dfWMCAZvFbl6lr/kJFvsXe8F49gkR
         0NXPaSw1qT1g8CG8aaioGo9UMP9hz9hdRBxfM9ID/Xc+hO0MUgSk77v2amQkRfHlCkaN
         HXIg==
X-Forwarded-Encrypted: i=1; AFNElJ+4v0vXNKLBKAu5pg/IMRkSUPzmQflLW3CZVWUQCIRsIQfiq1Tom/+KrxfPvD36iAz5vUMw4MB6/nAcAklo@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4nqHrjNHUbreDKcPmRJF1EmNf2fRn8DV7IMxmTv51W28HBH04
	qQDWCBFrD53csW3uiRHD/krlOLYFyWfT15IMz/xka7f0Q4dcQmoQ7eLi
X-Gm-Gg: Acq92OF+pFZ27XF8DB03ncj5200tgp3JL3Nv3oCHF9jU7FDXLyQsHV4u0qut1oW4PE+
	QMoR8P3Wr4Xdri99Yz3PChy9YdP7Dt8n3a54a4fVEYhjLAa4GUAH6CbCJ5ezHXUkfxgQhigNnzd
	myKJRFT2eL6B8be6nfXeV5kdQ5QaIcTWWM0XA6wm0MzwqOTqjy1XDVKS+5meIPYYuz8y/AQawBI
	ihySZWUYurB+d/qFU1Uyisl+9s1fUVAYYjeUXPUjGdu75GhB8I14Qfqwe1oa+Lhw2Wln0Jok10B
	YtlMCBkY13kkki+rWyjsxFfKH9Vo/zIf2wuoA0X3dNejAM6UIJl6aMtHoKxal9bHWFBr6yJcaDk
	K7sjF7AH+PYzY/WRsGPYFaRX5cOYfLFJ8XpM3aWQAy9AJyF/PGFkJZTYB0amx9njbyowyxqfbF0
	PYv9Kx6mHeZF/OMUBb/ntDe1Kdt5WfB7I0bKDMpHpVsw==
X-Received: by 2002:a05:600c:8b84:b0:490:5466:8576 with SMTP id 5b1f17b1804b1-490546689a7mr115352745e9.1.1779647405405;
        Sun, 24 May 2026 11:30:05 -0700 (PDT)
Received: from [192.168.1.50] ([79.119.240.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904561a160sm222864685e9.9.2026.05.24.11.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 11:30:05 -0700 (PDT)
Message-ID: <c6828c20-8f77-423e-a744-344d09c54488@gmail.com>
Date: Sun, 24 May 2026 21:30:01 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/2] staging: rtl8723bs: Fix error handling in
 _rtw_pktfile_read()
To: Minu Jin <s9430939@naver.com>, gregkh@linuxfoundation.org
Cc: andriy.shevchenko@linux.intel.com, dan.carpenter@linaro.org,
 abrahamadekunle50@gmail.com, zxcv2569763104@gmail.com,
 milospuric856@gmail.com, karanja99erick@gmail.com, weibu@redadmin.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260127153811.1592900-1-s9430939@naver.com>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <20260127153811.1592900-1-s9430939@naver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/01/2026 17:38, Minu Jin wrote:
> This series improves error handling in _rtw_pktfile_read() and cleans up
> the code style to comply with kernel standards.
> 
> 1. The first patch combines the logic change and caller updates.
>    The function change and the caller updates must be in the same
>    patch. If they are separated, the code will not work correctly 
>    or will cause errors at that specific point in the history.
> 
> 2. The second patch focuses purely on code style cleanup (changing uint
>    to unsigned int) as requested by Andy Shevchenko.
> 
> Regarding the logic change in _rtw_pktfile_read():
> 
>     The original code used a ternary operator to read whatever data was 
>     available, even if it was less than requested. This could lead to 
>     callers processing incomplete data without knowing it.
> 
>     I have changed this to return -EINVAL when the remaining data is insufficient. 
>     This is safer because most callers expect the exact amount of data and 
>     should not proceed with a partial read.
> 
> Testing and Verification:
> 
>     I do not have access to the physical RTL8723BS hardware. However, I have
>     performed a rigorous manual audit of the data path and verified the
>     changes using Smatch static analysis. The analysis confirmed that no
>     new warnings or logical regressions were introduced in the modified files.
> 

Hi!

I have some bad news:

https://bbs.archlinux.org/viewtopic.php?id=313401

[quote]

Hey everyone,

I recently upgraded my system, and now I’m having a strange issue with my WiFi (Realtek RTL8723BS).

now I can no longer connect to any WiFi networks as a client. however, creating an Access Point (AP) still works fine, but whenever I try to connect to an existing network, the connection fails.

dmesg logs:
Every time I attempt a connection, dmesg gets spammed with this error:

    [ 1083.925640] rtl8723bs mmc0:0001:1 wlan0: xmit_xmitframes: coalesce failed with error -22
    [ 1084.921217] rtl8723bs mmc0:0001:1 wlan0: xmit_xmitframes: coalesce failed with error -22
    [ 1085.921434] rtl8723bs mmc0:0001:1 wlan0: xmit_xmitframes: coalesce failed with error -22
    [ 1086.922320] rtl8723bs mmc0:0001:1 wlan0: xmit_xmitframes: coalesce failed with error -22
    ....

Has anyone encountered this specific "coalesce" error with the rtl8723bs driver? I'm looking for advice on whether this is a known bug in recent kernels or if there's a specific module parameter I should try to bypass this.

System Info:

    Chipset: RTL8723BS (SDIO)

    Kernel version: 7.0.3-zen1-2-zen

update: I fixed the issue after kernel downgrade

[/quote]
