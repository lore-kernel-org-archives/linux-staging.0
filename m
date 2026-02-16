Received: from mail-oa1-f68.google.com (mail-oa1-f68.google.com [209.85.160.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6191862
	for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 19:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771268531; cv=none; b=Ghs8oN3CxiGqQTBFv/Z/xz3kfYl5rKk0udl9+79wIqkvuP+9t9Ikwzs2pdG/ChQThGMeP9ywv2t5uhRaMtq9LiZU7okJ45u8/Zy2/2/J65OaZU84OeLFs3REUUJsRU3NKzNkPNZB0bpd2RxoG6pScH0eE9rm9Q6VjoCpu+y/1/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771268531; c=relaxed/simple;
	bh=dPSKZWl7sBfP2MfxJjzmPQmCiILPmFkv6c8hC7edRmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hGRe2SlJxyTbqtvl0bMeT/3UQrqGSK9oUYTgrY923nrhBoW0BQIkiQJADtuKqE6S5RkYtUqhf5xDFW9sFQNPd4OLhuML2bqIPpiA9+nNpwN1ZAMRzu62if+PAOo8uVihuickWXmegZb1itYqThddxYQiDV67Obh9/TAp1aoQ/5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ov+iEwCM; arc=none smtp.client-ip=209.85.160.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ov+iEwCM"
Received: by mail-oa1-f68.google.com with SMTP id 586e51a60fabf-40f1ffba6a0so1091788fac.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 11:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771268528; x=1771873328; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nc6fdFi3PpOoNTYHhslWaUJsykC31/8ZFpVvbIhED1E=;
        b=ov+iEwCM055ZSLNtfva7qFztVXfz1kTMgorteCi5GhIQbe2Qny+zWnmIPvHYj0bU3c
         XIUH7JGuXXq7PbRtkPZx/KDoBsesY4vlol5Aef+/XOc/9zZ2DJcbCiQULUg+UVYdgdxr
         k669uiyRTgZ3M0N5YgqYqOeYAaL+r1EvL5AAY1gWyDF0yfUrSnvpuWTe7/cjC8bflRk2
         5blOnXsBFW96+StVfaLggDgM1D+zJmSbJepl+FijtKtomgOwezIw51s2GkLH27EfUktR
         r3jXSLhtyS2A209qq0srba5yQnd7PoBdOIZVQo4ufo6O8+3n4Wbl5/ESfHmdhExCtxan
         CThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771268528; x=1771873328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nc6fdFi3PpOoNTYHhslWaUJsykC31/8ZFpVvbIhED1E=;
        b=Ep+qkjvzyDtpjgaIylxmtw02cI0dxzEjkrUAUM5/mMvYniAdzQ3fPhr24swd6NUnba
         oDyCas1kZuiR70EKmG7JD8CojdEUxR6wdTS2mjtlbe4JA6DFJlwIaWNPDYRf2m47kwaQ
         1aDse/FpFHLrOQ+DG0a4Jvn1TJg2FmI2sn4tZb/dq1+h3Ybmcr4BKV9m+o7ffJrHJqUw
         KXJvxHW6wAAdtqX3Qfo/brROwY15CvzasgLnA6u8jt+YkuGnKh4sGSpsmx9GfEJO5Ztw
         lBTlAWGcEAwAZMTmvtwzp4aEZ1Iq5ADiMlJW5kPn8B1lV+Y7zNyhScO5WF0hfh7d/gYr
         b/GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgzUP67pTPvWOwpeTnfE4YtmdzfDrDVjdYtdicA1YBL58y3wkEgzFQbdx13dJN5rxhAGcd+RXAQ7l6nF9J@lists.linux.dev
X-Gm-Message-State: AOJu0YyFoxOrVYElKyzsk7LdDf7pe3H3EtU8jOCu18dZEnyrIzrT0UFA
	stPsu/bFgT0pAC5Nyy2EgOXU8B2hrqKPw00xzg+hraPMOULNT2TS1awC4bU5ihkkcTY=
X-Gm-Gg: AZuq6aJJFl4UnBVXf1CXcocWmHZ/DOqcVWszcPSqogZcgazZrXG8zgtAzUDLQTYiOea
	Q+YqGGuI9Y33ZVObJrIksqR8RPcAkwNWBm7YmzH/665UGHByrLu3bWsFiXHfYik7Pkffe2hJ8pN
	l3gjy4ad9gGcLoxDZzuaxFtxRvtyWjUIMHtoigQA3EMasRmLDUVtly4OgoQ8jtVqAEhBDcowidx
	PJ/wEC/fZDMCelBTynl+zCmwN04YBzKgdxJz6ScokUrEw0RtOWjvrNkuG3xprje7GIKcq4MGUPH
	xBftxwV5eZVChVrH9aelywbbO1HKbS/qVukj83p66SE62YL9Qdb3QS03m/Nyk5P4+FWAtPMIY/u
	acSZdhdni5tjRq+ItK5FMf+T5YNsi+k9ZrNmXVmtP41/Ky3lh+aulz59O9os4Q/IhAznNg/piEn
	aWAzd0q3cp+inBS7fNi4z7dO7QwDpIucYMyiEYtU6C/E1sFzEY4IJsJCq/jk6OjsyJ7aS4cGFc
X-Received: by 2002:a05:6820:610:b0:679:9353:1211 with SMTP id 006d021491bc7-6799353141bmr1339818eaf.78.1771268528343;
        Mon, 16 Feb 2026 11:02:08 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:2d75:8cf2:6289:6a96? ([2600:8803:e7e4:500:2d75:8cf2:6289:6a96])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-678b13aec01sm4984097eaf.8.2026.02.16.11.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 11:02:07 -0800 (PST)
Message-ID: <b27c638e-f0fb-42af-978f-89e38dea2b23@baylibre.com>
Date: Mon, 16 Feb 2026 13:02:07 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: iio: impedance-analyzer: ad5933: use div64_ul()
 instead of do_div()
To: Archit Anant <architanant5@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
 gregkh@linuxfoundation.org, nuno.sa@analog.com, andy@kernel.org,
 linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260122145633.14938-1-architanant5@gmail.com>
 <aXI-ZV4uAd5GyFLz@smile.fi.intel.com> <aXI_HnvDNbX68-lq@smile.fi.intel.com>
 <CADJHxWB3b+bH2+HBP+SG0jxhGNcozstBeWeDH_3dgS-4c2G-6g@mail.gmail.com>
 <aXJmYAZ-8KkXCFI9@smile.fi.intel.com>
 <CADJHxWDCer97pMNHV-69B9AEVY0NfimTcxo8k8yFBbstg0wMQw@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CADJHxWDCer97pMNHV-69B9AEVY0NfimTcxo8k8yFBbstg0wMQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/16/26 9:52 AM, Archit Anant wrote:
> 
> On Thu, Jan 22, 2026 at 11:33 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
>>
>> On Thu, Jan 22, 2026 at 10:27:52PM +0530, Archit Anant wrote:
>>> (Resending to the list, apologies for the private reply earlier.)
>>
>> First of all, do no top post!
>>
>>> Thanks for the review and the detailed math breakdown.
>>>
>>> I agree that `(freq * BIT_ULL(29)) / mclk` is algebraically superior and
>>> improves precision.
>>>
>>> However, regarding your concern about the original code:
>>>> "why the original code drops precision, was it deliberate?"
>>>
>>> Since I do not have the AD5933 hardware to test if the register expects the
>>> truncated value from `(mclk / 4)`, I am hesitant to change the logic in
>>> this patch.
>>>
>>> Would you prefer I:
>>> 1. Stick to a purely mechanical change (keep the logic equivalent, just use
>>> `div64_ul` and `BIT_ULL(27)` for readability)?
>>> 2. Or proceed with the `BIT_ULL(29)` simplification assuming the precision
>>> loss was unintentional?
>>
>> I definitely prefer #2. That's why I plead to AD people to confirm.
>>
>>> I'm leaning towards #1 for safety, but happy to do #2 if the maintainers
>>> (Lars/Michael) think it's safe.

> Gentle ping on this.


As Andy said, please don't top-post. Put the reply in context to make it easy
to see what "this" is referring to.

I moved your reply to show what we mean.

> 
> Has anyone from AD had a chance to confirm whether the original
> truncation via (mclk / 4) was intentional?
> 
> If there are no objections, I can prepare a v2 using the BIT_ULL(29)
> form as suggested.
> 
> Thanks,
> Archit


Given how old this driver is, I would not expect an reply as the
author has likely long forgotten what they were thinking at the
time.

I would keep the (mclk / 4) as it is to be safe as you suggest. There
could be userspace depending on exact values currently being returned.

>>
>>> On Thu, Jan 22, 2026 at 8:45 PM Andy Shevchenko <andriy.shevchenko@intel.com>
>>> wrote:
>>>
>>>> On Thu, Jan 22, 2026 at 05:12:42PM +0200, Andy Shevchenko wrote:
>>>>> On Thu, Jan 22, 2026 at 08:26:33PM +0530, Archit Anant wrote:
>>>>
>>>> ...
>>>>
>>>>>> -   freqreg = (u64)freq * (u64)(1 << 27);
>>>>>> -   do_div(freqreg, st->mclk_hz / 4);
>>>>>> +   freqreg = div64_ul((u64)freq * (u64)(1 << 27),
>>>>>> +                      st->mclk_hz / 4);
>>>>>
>>>>> It can be one line to begin with.
>>>>> Then drop that ugly castings and explicit big shifts.
>>>>>
>>>>>       freqreg = div64_ul(BIT_ULL(27) * freq, st->mclk_hz / 4);
>>>>>
>>>>> Now you can see That 4 is only 2 bits, so this can be written in
>>>>> simpler way:
>>>>>
>>>>>       freqreg = div64_ul(BIT_ULL(29) * freq, st->mclk_hz);
>>>>>
>>>>> which may give a better precision at the end of the day.
>>>>
>>>> It also might be worth to add a comment on top to explain (with given
>>>> context
>>>> I don't know if there is already one on top of the function, though).
>>>>
>>>> And I think we want AD people to comment on this and maybe explain better
>>>> the calculations done (and why the original code drops precision, was it
>>>> deliberate?).
>>
>> --
>> With Best Regards,
>> Andy Shevchenko
>>
>>
> 
> 

