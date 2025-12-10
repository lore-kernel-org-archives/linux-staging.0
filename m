Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6D02D5C83
	for <linux-staging@lists.linux.dev>; Wed, 10 Dec 2025 04:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765340692; cv=none; b=fR5SDyAF65Kt6G/XP5dWMHjwlAVGBkzg6gSbAS4YKnNKjtfgNZwJ3bSTXhlQBTORWlQVImJ6FsbnXfewNl4Joj9jQYTZNgnBrvkSscL/nCUGrBBzXnYs07bSmzUh+++l4y+sA2uImpCTDYjMM2QkOeUJUcQY7ycf8bFJgdLt/q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765340692; c=relaxed/simple;
	bh=cbubf1NYJfCvFoWNQLYMFA2LJeNlUgm2HmggK2vgpLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vBsQGM0df9fSsRDHQzdbBxE+P8lqp0UVk5aOtl/DQRL5smaLBXhMWcJGFN1KOItpKpbl162d7kmow7yM/5xpddYsDZex1RE2YmZZpjpKXQbbxr81h2HcYqs10ToKqFim5Qv+JzhKVX1J+uxI7hiJkOuLN8RcZbz7N6aVATXJ21E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7WU4jXS; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7WU4jXS"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-29558061c68so77222945ad.0
        for <linux-staging@lists.linux.dev>; Tue, 09 Dec 2025 20:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765340689; x=1765945489; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZHURbWUQgIv6rDE4plYGzDdoLRCquvnAG2DekAVeb8k=;
        b=m7WU4jXSCQgvQoqmICmTBhpikgaPNsvFnujD/6PEZ1tRbHTdl6SZBhMjrKw8PVPsN3
         tqnPCaIEEOdb1cxxkJYswvPBKbuSbOsVYY7aAmJsPBM9soD2hj3LOUjgHLU8vVEhjGB7
         3nJywFwG4vFq2XnOZf+OWKpFQEyJJ29fE6+c1SzR1Rv03unpR2dLiV21+0VpWHwUYV87
         eSZps9MkrT1b0fyufFLTtyXI5e+g5CYacWLzx4ndE/YqIPPGYULO0HdTMfpphlBsp6AO
         uHftjVCCgXLXojBoz8E5aCGU2+GuOKD5fXdhj8WQBywFblBzvOqTE7jJ3p/Jnl8cYkXZ
         Yi1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765340689; x=1765945489;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZHURbWUQgIv6rDE4plYGzDdoLRCquvnAG2DekAVeb8k=;
        b=jD0A3myXyH/QmZRZKpXF7AgglGC58LcreZ+JZowUggB1SOfPPodyrd3gVgdOpOqXkq
         ZRVu+1BIuvFP9CA/Ke+lmidKJJcy+2dYAnW58ywyHD+jpgoun+oeyUhj1Sjc9ckxKshu
         WodElWarzWs7Dp/ZSCDM4/U2SbbHsiDbZou/thnz9Wdf/pAIPC8NfuK0KAFbE/H2adCW
         WSiDM9HJYkhgX6FvtmjzpLy2j01SjxYE2Wh40WDyVE+h0YrCcOydBo4HELnQFVooX8xS
         zKobppYXhdLvssSessK+vo72tFhIHkoC/f078ceGeTWF7SNr7s22Qd5mpbWJv2NZGYh8
         F5Hw==
X-Forwarded-Encrypted: i=1; AJvYcCVnekKnqda/2NoiltOoUYAPHW0gb6TOl+UkEBPX7SOKMuimSZzU9R6eJgtV075Pm/Xpl4dm+1E49uO5AgiU@lists.linux.dev
X-Gm-Message-State: AOJu0YyeubV/OLkH6g+1sU5Es/hOd0oX+aYs3oYTfa8etOy08jKS37bR
	JCo1UWe8QBe6Ci8OpVyKRjR8qEv7U9ImnLK+e6UlTtHI5D31OqPUIf7c
X-Gm-Gg: AY/fxX73iMVvytQTKQMflS/wVKQVA3rQ7fK4hE++iu7hvObLZt2P8Nu2J2cdncIMvPb
	NkrqsGOyMnJcm4dR5i4M6mVleseTv10dnqmbdg/zMfiBaDleP2jLuzPxoZweKwp5ZZb6bPFLrLe
	fRR2hJctM4A3WVRL8WqDFX3EQrg1xxUbm1ED89F1+R8I0rzx26MjQ61GdmnCT0g7NMtdDxtejRN
	3Z/Azasqf7K6bFdg4StDTPJdFJiD1haMes6idQcYgSCgdSk2KXG55O4ZsX4gTpBQKv0CpmyhqJG
	dJxs7STvS2X9MLeqBiSu9QeNIXSNVT7bf6DfFfZMaeGKPPxnqAH3KaA+CzdvsFqVjZkEHIRVaA+
	S2qTPcNJsVjEBiJmOV99gY00yc/OTHS26TcLN+O3EtlJfDl4RWctkM51Hl1q7wgDoAEf8ahBUUZ
	L9o4AQ7XncsFjYG2xZnFuFKpq2/AHpYlY8g1yp1M0kpliGCGrJLfnORSjfucYb
X-Google-Smtp-Source: AGHT+IFLjbHqKm1TeTHwPWHgM/dVq6lAyHbS/510gkTwuZ9bXQQa6783zsMnS6eOgTYVIMZq9D1MPA==
X-Received: by 2002:a17:903:198d:b0:298:1422:510d with SMTP id d9443c01a7336-29ec2d8b9f2mr11445495ad.48.1765340689155;
        Tue, 09 Dec 2025 20:24:49 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:b90d:2938:bd7a:289f? ([2601:1c0:5780:9200:b90d:2938:bd7a:289f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cf97fsm167022355ad.25.2025.12.09.20.24.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 20:24:48 -0800 (PST)
Message-ID: <89b08d9a-9f96-40f0-9ae6-e54b16b65879@gmail.com>
Date: Tue, 9 Dec 2025 20:24:47 -0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] fbtft: Make sysfs and dev_*() logging conditional on
 FB_DEVICE
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andy@kernel.org, deller@gmx.de, gregkh@linuxfoundation.org
References: <20251209042744.7875-1-chintanlike@gmail.com>
 <20251209042744.7875-2-chintanlike@gmail.com>
 <329423e8-d778-4f30-904a-825b1be72ce2@suse.de>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <329423e8-d778-4f30-904a-825b1be72ce2@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Thomas,

On 12/8/25 23:25, Thomas Zimmermann wrote:
> Hi
> 
> Am 09.12.25 um 05:27 schrieb Chintan Patel:
>> The fbtft core and sysfs implementation unconditionally dereference
>> fb_info->dev and register sysfs attributes. When FB_DEVICE=n, these
>> fields are unavailable, leading to build failures.
>>
>> This patch wraps all sysfs attribute creation/removal and dev_dbg/ 
>> dev_info
>> logging in #ifdef CONFIG_FB_DEVICE, with pr_*() fallbacks for the
>> non-FB_DEVICE case. This makes fbtft fully buildable when FB_DEVICE is
>> disabled.
>>
>> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
>> ---
>>   drivers/staging/fbtft/fbtft-core.c  | 20 ++++++++++++++++++--
>>   drivers/staging/fbtft/fbtft-sysfs.c |  8 ++++++++
>>   2 files changed, 26 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/ 
>> fbtft/fbtft-core.c
>> index 9e7b84071174..dc967bdeabe8 100644
>> --- a/drivers/staging/fbtft/fbtft-core.c
>> +++ b/drivers/staging/fbtft/fbtft-core.c
>> @@ -365,9 +365,14 @@ static int fbtft_fb_setcolreg(unsigned int regno, 
>> unsigned int red,
>>       unsigned int val;
>>       int ret = 1;
>> +#ifdef CONFIG_FB_DEVICE
>>       dev_dbg(info->dev,
> 
> Rather use fb_dbg() [1] and similar helpers for logging. They only need 
> the info pointer and do the correct output by themselves.
> 
> [1] https://elixir.bootlin.com/linux/v6.18/source/include/linux/fb.h#L895

Thank you for this pointer - I actually didnt now this existed. Will do v2.
