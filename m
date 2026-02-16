Received: from mail-oa1-f67.google.com (mail-oa1-f67.google.com [209.85.160.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C82A1862
	for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 19:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771268654; cv=none; b=Am5ivgTXm+RWLQGMDKHmX4lTP3cbtNQFegKwWDKRAmFm9ECC5n47ZuBYPej1o2d/ZyvnL0vvKPUPd2mSd29c31tKyFnhk6tdzyTOuoeIspqnZx53x23yakAKMQ1/SrSThYq2FYIkxeHmtjX3cVGnKjGXl9swCuekVFDvwwfWZ84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771268654; c=relaxed/simple;
	bh=LzmX/3+nGu9xc3zoqgQDGNKCIh8sNceViG3VUwST+xw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fsRys3/4Y0COtDXoVha0N3Wm2h+3F2f77tKQxqWwgg5cnEHVcH00OS5SZct6Inc91k3k7dYfNYWQ+HnKG+g0U6ZfitCQy5JX6SjPq03jDgtK4Y0l8mbWjSeBmFBWEiNNxJokhGzcyBXWG1tdovNoeDszWKnPcfMHvFLNdz8w9O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IY8i6kwe; arc=none smtp.client-ip=209.85.160.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IY8i6kwe"
Received: by mail-oa1-f67.google.com with SMTP id 586e51a60fabf-40f1a1f77a6so1235789fac.2
        for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 11:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771268651; x=1771873451; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zbIO202uRgqiRF7AzMdFyCfssoIgOmc9Gyf/bjgGReo=;
        b=IY8i6kweiFzTYCLhWKBZSVx0qLywJUkpDp+raVbc334F8MncQX1CdnrMYnsZj3QVZQ
         egFUPvrGCTwfyE+JaTCQ9TW9T72EttM536bWbUdYUoshn3u2Ffw5gYwLUoOwWWtoVmPW
         G2B+hN7GPbfnUq9aj8F63usWE95w+FYVIibofvpKuaEjCjRjgke9Z3RrC0CQxqq3VS1K
         NqEA93HB4OamRPrKSlbvsqFKwb+WXf4DIwiCEVrS0N01Sd9CZvxBjT/SDAN7ruuG/fxh
         ABIxZKVZc/SCDMUQRa/Svt3BPfXgdfBdvvLNdUO/Kqnthf4+AcYxrxXjpgeKzy/WJVFf
         Z21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771268651; x=1771873451;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zbIO202uRgqiRF7AzMdFyCfssoIgOmc9Gyf/bjgGReo=;
        b=lUNndUkS8h1+QR9/F03P2la3odQ1vjMMO4jTL/opAoR+vfx6yiDdqloWt0J8YJrfhK
         RFRdtLg2nd91xVKEalFPA/GKLNWaQLQJZrwRYYD009xfUWnaEF7lNTKFhXjEwShJyV+M
         oCTOSVeczwbkNvg1f8xC8bMakr8sp2SfqSLJgdHtdbRU4JP3IjS9NGA2K05B08uqwnts
         eMro+1EjPTPfAMO6ZEjY/lNwzbyo76hUyvaJZQ5cI/9gF+brWPX2RX/hQ71EdXmmR9HD
         bqdge3dpXR2DoyE4nJC5AIWivco1/VCz8w27NmdgqdDY8Z6EQsuPTTSWYJaMUT1ezfKd
         mQQg==
X-Forwarded-Encrypted: i=1; AJvYcCXZFyMHAf0VAprhGqxYwszdLu5XxVqK3btEWWYpvWjjsRaGA05MZlQLsMPzmIpXTB/Kt+ZywgCFEoR7akGq@lists.linux.dev
X-Gm-Message-State: AOJu0YzTr31FNOvkUeWaPY8D8Te/AqEqIcCzluHqfulCQDdb17ZfVHHw
	wcSyk2jQ8/iTGTViI+U9IQQY43C0rAnQpV+6+DmMjRHxhJbRB83E3ChIZ8vg1sVQ50E=
X-Gm-Gg: AZuq6aJgPtDD3bDZ9XjT8WqhVXzOXuOaE5ix2kshUfyiiY0BW6TMulb9XFViqd8mVl1
	14xhHtdVa8QzsegUwEvMffimTo+VkkWNjV6JwXmtQ8I8rZ582QFcxWMEkrmblgzxiVnam3L96cU
	ig9v/jQiP1150n6K+v8szYcEJ9JcuNb1VY3cG1mHnPakzE73S8GVQmKZMj0RNYRUhEbCdoS6Mxf
	HYo12WqI7DL+XPjzDrz/uqa0K4MySMsVKV3Yq90yNtNiVUIPyOoRrrw1oJNS2Tr9IrE9iY5A4Ht
	RL/PkOudD91hZzl32ET38HaaleTWwxU/uIlhkIGAqV9JKPFSkzX2p5Pe4QWVftVaMFYfuZ3aztH
	XLBuF1ZwHX6053JIkgTpffy3vm6XjGA65b7ezc369ShruIafK2KzaSyNL/LG7PaHDvbtYndlBfm
	4Klhg1/OKkpzXoyMb23Rdp7IXTSgy+h2vMsrdvR9TxNiZwt4rUrKRrpaLyST3Q3lG6kRSuEv6R
X-Received: by 2002:a05:6870:a0a5:b0:404:3941:4d60 with SMTP id 586e51a60fabf-40ef3bf9e64mr5930720fac.2.1771268651483;
        Mon, 16 Feb 2026 11:04:11 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:2d75:8cf2:6289:6a96? ([2600:8803:e7e4:500:2d75:8cf2:6289:6a96])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40f2ae0a899sm6408660fac.6.2026.02.16.11.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 11:04:11 -0800 (PST)
Message-ID: <ca488ef9-f4f1-4f7e-9656-8c5d132d0d1c@baylibre.com>
Date: Mon, 16 Feb 2026 13:04:10 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: iio: impedance-analyzer: ad5933: use div64_ul()
 instead of do_div()
From: David Lechner <dlechner@baylibre.com>
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
 <b27c638e-f0fb-42af-978f-89e38dea2b23@baylibre.com>
Content-Language: en-US
In-Reply-To: <b27c638e-f0fb-42af-978f-89e38dea2b23@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/16/26 1:02 PM, David Lechner wrote:
> On 2/16/26 9:52 AM, Archit Anant wrote:
>>
>> On Thu, Jan 22, 2026 at 11:33 PM Andy Shevchenko
>> <andriy.shevchenko@intel.com> wrote:
>>>
>>> On Thu, Jan 22, 2026 at 10:27:52PM +0530, Archit Anant wrote:
>>>> (Resending to the list, apologies for the private reply earlier.)
>>>
>>> First of all, do no top post!
>>>
>>>> Thanks for the review and the detailed math breakdown.
>>>>
>>>> I agree that `(freq * BIT_ULL(29)) / mclk` is algebraically superior and
>>>> improves precision.
>>>>
>>>> However, regarding your concern about the original code:
>>>>> "why the original code drops precision, was it deliberate?"
>>>>
>>>> Since I do not have the AD5933 hardware to test if the register expects the
>>>> truncated value from `(mclk / 4)`, I am hesitant to change the logic in
>>>> this patch.
>>>>
>>>> Would you prefer I:
>>>> 1. Stick to a purely mechanical change (keep the logic equivalent, just use
>>>> `div64_ul` and `BIT_ULL(27)` for readability)?
>>>> 2. Or proceed with the `BIT_ULL(29)` simplification assuming the precision
>>>> loss was unintentional?
>>>
>>> I definitely prefer #2. That's why I plead to AD people to confirm.
>>>
>>>> I'm leaning towards #1 for safety, but happy to do #2 if the maintainers
>>>> (Lars/Michael) think it's safe.
> 
>> Gentle ping on this.
> 
> 
> As Andy said, please don't top-post. Put the reply in context to make it easy
> to see what "this" is referring to.
> 
> I moved your reply to show what we mean.
> 
>>
>> Has anyone from AD had a chance to confirm whether the original
>> truncation via (mclk / 4) was intentional?
>>
>> If there are no objections, I can prepare a v2 using the BIT_ULL(29)
>> form as suggested.
>>
>> Thanks,
>> Archit
> 
> 
> Given how old this driver is, I would not expect an reply as the
> author has likely long forgotten what they were thinking at the
> time.
> 
> I would keep the (mclk / 4) as it is to be safe as you suggest. There
> could be userspace depending on exact values currently being returned.
> 

Actually, I just saw this was in staging, so I guess not breaking userspace
isn't the top priority if there the other way is objectively better. I would
assume that testing/measurement could show which is actually correct.

>>>
>>>> On Thu, Jan 22, 2026 at 8:45 PM Andy Shevchenko <andriy.shevchenko@intel.com>
>>>> wrote:
>>>>
>>>>> On Thu, Jan 22, 2026 at 05:12:42PM +0200, Andy Shevchenko wrote:
>>>>>> On Thu, Jan 22, 2026 at 08:26:33PM +0530, Archit Anant wrote:
>>>>>
>>>>> ...
>>>>>
>>>>>>> -   freqreg = (u64)freq * (u64)(1 << 27);
>>>>>>> -   do_div(freqreg, st->mclk_hz / 4);
>>>>>>> +   freqreg = div64_ul((u64)freq * (u64)(1 << 27),
>>>>>>> +                      st->mclk_hz / 4);
>>>>>>
>>>>>> It can be one line to begin with.
>>>>>> Then drop that ugly castings and explicit big shifts.
>>>>>>
>>>>>>       freqreg = div64_ul(BIT_ULL(27) * freq, st->mclk_hz / 4);
>>>>>>
>>>>>> Now you can see That 4 is only 2 bits, so this can be written in
>>>>>> simpler way:
>>>>>>
>>>>>>       freqreg = div64_ul(BIT_ULL(29) * freq, st->mclk_hz);
>>>>>>
>>>>>> which may give a better precision at the end of the day.
>>>>>
>>>>> It also might be worth to add a comment on top to explain (with given
>>>>> context
>>>>> I don't know if there is already one on top of the function, though).
>>>>>
>>>>> And I think we want AD people to comment on this and maybe explain better
>>>>> the calculations done (and why the original code drops precision, was it
>>>>> deliberate?).
>>>
>>> --
>>> With Best Regards,
>>> Andy Shevchenko
>>>
>>>
>>
>>
> 

