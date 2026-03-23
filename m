Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429B93B27F3
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 14:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276790; cv=none; b=iiSN18VeSxKy04sgjoBoPUpgA45Luv0G456RBiLYCo7XCbjCEmir78iINukoeAU9V3RYirlAxVXwXS9WcRR/Lv8HNBHhp2KrK/Ky441trXXjNo9D1VhpHkN7JOW9mF8gVizKzlcsEkZPivpB7Po+B3NJQVXRIgDvH02MzbwZ5gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276790; c=relaxed/simple;
	bh=/Vc04mp+YvGzxnIgYBmQ5LjwPSfRG5KdQa8ysQAw3eE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hx/P3xTPVYAV/UApYywWoEOjSfe3jpEeM+lycl/S0qsk3BjGX0UQ1LmJL4zYpol01tD7GCOsELLEwxDGLxsVTyMb0w6Cqfs27szLht4BQGUeol1bMq8WSDG5pCdc8pPztGofRBcDtoc7svO82Ziuem9Eb/xEdkHKbRAZ02X4T5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bBpT3Gzu; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bBpT3Gzu"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7d7f09aa39fso3053860a34.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 07:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774276786; x=1774881586; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9JeALHOS5PAPURwj6AYWeAG7dI7olikWsM+DOIkL5mk=;
        b=bBpT3GzuJBfqMEW5mSBEawdRQGKEDSycVY710pmI2OErogdBkiO79VuFt7WiI4++xq
         pJrTCArl9oWTo/KJowoEx2Xdf6fNRwTXOdb08TUV9ENxM1WVf0YY6J2sOu3gpIlhy9PH
         6g5tlQI92lBpgQkUfzkqPGLLlIHow4u3sCrc4rwMVozTzYL6pBULlt0hVuH+NBqwc5EM
         DiJtCVjVz04yBFo1QtyP6a0nBNCLyyTZa5JUNTLiPtfNVjADCGIwA5sh+H8pPCOBNWJf
         uQ1OoFwWAUnbsPIPtK+Q8U6mrjYHswVYFMK7AEwWQqn6I39F6SCqhHm/eECbq670M/UU
         ch6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774276786; x=1774881586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9JeALHOS5PAPURwj6AYWeAG7dI7olikWsM+DOIkL5mk=;
        b=KojOLMcXl5uyWnw3STKXwTnc+GV2rb5GqreNZLWU4jV1LDqMNQgBnVVzfZxwUOI6hz
         CJsJl9cYDHNklAVJMygxpsdb22PJbktmMTs2TxO9XBvkD1kBJ2Z+AArNKBfpCC1zzoB2
         XJAUBEZbUkiMbss8ulgQ8MmRpk4Ddy5IijHVq4Qh+ZSqmrFUOQ/qqc/eEsafy/09vabn
         b1gKzZ6JKjjqsqP2R6UYBjEzZCNN4uJ+b5Ra90EBxKe0rv8DJaZP0zRAGe+p/SieT4ez
         8tZRm8SCLrIp/hKPebEOeFUT9jPmf0RcYjX0jGGRrBdj9FM3EXXfVXSMeb3V+7uVhmAC
         yqag==
X-Forwarded-Encrypted: i=1; AJvYcCVuDxAeA61sIZWiT2Lv+tqQgLmPSiAAWt8hzwzXVlvjnRk66+Nvn0v0u+EGvvybi5xGFgHV+5i9zkYOKdUE@lists.linux.dev
X-Gm-Message-State: AOJu0YzsHNB+8BPSM1VKZhVunaO8Ud3H3THym4WRwtQ1uKOBShNl24oX
	NDnO2nHWdVIF1aq+ZRqN0HcJXsFR09iE/6kMeXYxbaX4HlspsNFNuoPr9uGAtke4DN4=
X-Gm-Gg: ATEYQzxTL3mTcDVxa6VH9CYraDs9lbR0ktBVeICoiWRYBs1nv/oHiLJtkOIK3Bi5nXE
	V9eXvAjkVgZjJoC6ppsq5dcbCI6r12ChC1/dIa5yGcslZ+riJkZgI9Irtv9+jG/adbC9Q+aacb0
	ZecmDm4FDu23aJqRUF2phsNb8T44lg0/5alCOX+ej3cdgxT1JkAtVWFfunApPzIOYhjuXav1Yj3
	E+cnwaAxfbPTAbXSVD3p+tD2eVd5HOaDvANKJX91pbDOebeiWGInYKrTERpT701uP2Qrzj/6Qh0
	PwWD7DFXFrUkrxqYNrrJq2qa/VqrPKIKRJVHyiFJsVDx9p1B9uZXRFW6O3DJxniD+7wwISdgTRR
	3S2LcXg4RqpVz5eofHdFs+IJzQXtbRfX7keg0FLHPHmyqbaJ8ZL5HO8ONuRa7/MdhK6Kfu5iZIy
	64Pl2SbDd40Hk3C32/QHr2go2xFY62+oxDDM+Nz91CpLPCZMSTwzEd6+encSeGN5wobSBrieY=
X-Received: by 2002:a05:6820:8ca:b0:67b:aca0:3d96 with SMTP id 006d021491bc7-67c22fc295bmr8670885eaf.65.1774276785962;
        Mon, 23 Mar 2026 07:39:45 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:964:f712:dbc7:4119? ([2600:8803:e7e4:500:964:f712:dbc7:4119])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67c252c892dsm6680581eaf.4.2026.03.23.07.39.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:39:45 -0700 (PDT)
Message-ID: <eaaee132-d5ff-42ff-9f68-5d6736127caf@baylibre.com>
Date: Mon, 23 Mar 2026 09:39:44 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] iio: adc: ad799x: cache regulator voltages during
 probe
To: Archit Anant <architanant5@gmail.com>, Jonathan Cameron <jic23@kernel.org>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, nuno.sa@analog.com,
 andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260318092715.42538-1-architanant5@gmail.com>
 <20260318092715.42538-4-architanant5@gmail.com>
 <20260321182710.1621d1aa@jic23-huawei>
 <CADJHxWADo9rA8vt6EEVLXSBb9EqXvyBg=L_YmusaMdtRnOr0rQ@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CADJHxWADo9rA8vt6EEVLXSBb9EqXvyBg=L_YmusaMdtRnOr0rQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/23/26 7:22 AM, Archit Anant wrote:
> On Sat, Mar 21, 2026 at 11:57 PM Jonathan Cameron <jic23@kernel.org> wrote:
>>
>> On Wed, 18 Mar 2026 14:57:14 +0530
>> Archit Anant <architanant5@gmail.com> wrote:
>>
>>> Reading the regulator voltage via regulator_get_voltage() can be a slow
>>> operation.
>>
>> Whilst that might be true, it isn't a reason for this change.
>> Sysfs reads that would cause it to be read are never a particularly
>> fast path anyway. So drop this first sentence.
>>
>>> Since the reference voltages for this ADC are not expected to
>>> change at runtime, it is inefficient to query the regulator API every
>>> time userspace reads the IIO_CHAN_INFO_SCALE attribute.
>>>
>>> Determine the active reference voltage (either VREF or VCC) during
>>> probe() and cache it in the state structure. This improves the
>>> performance of ad799x_read_raw() and removes the dependency on the
>>> regulator pointers during fast-path reads.
>>>
>>> Suggested-by: Jonathan Cameron <jic23@kernel.org>
>>> Suggested-by: David Lechner <dlechner@baylibre.com>
>>> Signed-off-by: Archit Anant <architanant5@gmail.com>
>>
>> A suggested alternative approach inline.
>>
>> Thanks,
>>
>> Jonathan
>>
>>> ---
>>>  drivers/iio/adc/ad799x.c | 24 ++++++++++++++++--------
>>>  1 file changed, 16 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/iio/adc/ad799x.c b/drivers/iio/adc/ad799x.c
>>> index 7504bcf627da..ae2ad4bd37cc 100644
>>> --- a/drivers/iio/adc/ad799x.c
>>> +++ b/drivers/iio/adc/ad799x.c
>>> @@ -30,6 +30,7 @@
>>>  #include <linux/module.h>
>>>  #include <linux/mutex.h>
>>>  #include <linux/bitops.h>
>>> +#include <linux/units.h>
>>>
>>>  #include <linux/iio/iio.h>
>>>  #include <linux/iio/sysfs.h>
>>> @@ -135,6 +136,9 @@ struct ad799x_state {
>>>       u16                             config;
>>>
>>>       unsigned int                    transfer_size;
>>> +
>>> +     int                             vref_uV;
>>> +
>>>       IIO_DECLARE_BUFFER_WITH_TS(__be16, rx_buf, AD799X_MAX_CHANNELS);
>>>  };
>>>
>>> @@ -302,14 +306,7 @@ static int ad799x_read_raw(struct iio_dev *indio_dev,
>>>                       GENMASK(chan->scan_type.realbits - 1, 0);
>>>               return IIO_VAL_INT;
>>>       case IIO_CHAN_INFO_SCALE:
>>> -             if (st->vref)
>>> -                     ret = regulator_get_voltage(st->vref);
>>> -             else
>>> -                     ret = regulator_get_voltage(st->reg);
>>> -
>>> -             if (ret < 0)
>>> -                     return ret;
>>> -             *val = ret / 1000;
>>> +             *val = st->vref_uV / MILLI;
>>>               *val2 = chan->scan_type.realbits;
>>>               return IIO_VAL_FRACTIONAL_LOG2;
>>>       }
>>> @@ -828,9 +825,20 @@ static int ad799x_probe(struct i2c_client *client)
>>>                       ret = regulator_enable(st->vref);
>>>                       if (ret)
>>>                               goto error_disable_reg;
>>> +                     ret = regulator_get_voltage(st->vref);
>>
>> For vref I don't think we need to keep the regulator around, so you should
>> be able to use devm_regulator_get_enable_read_voltage() with checking
>> for -ENODEV to identify it simply isn't there.
>>
>> It would need a tiny bit of reordering though or a custom
>> devm_add_action_or_reset() registered callback to ensure that regulator
>> disable for vcc happens in reverse sequence of what happens on setup.
>>
>> Anyone think there are actually ordering constraints on these regulators?
>> Would be fairly unusual for this sort of device, but not impossible.
>> If not, cleanest option might be;
> ...
>> Then no need to undo anything by hand in remove() and no need to keep
>> a pointer to any regulators around for later.
> 
> I completely agree that devm_regulator_get_enable_read_voltage() is
> the cleanest approach.
> 
> However, as I noted briefly in the v5 changelog (which I should have
> highlighted better), the driver currently relies on those regulator
> pointers (st->reg and st->vref) in the ad799x_suspend() and
> ad799x_resume() callbacks.
> 
> If we drop the pointers from the state structure, we lose the ability
> to disable the regulators during system sleep.
> 
> If keeping power management active during suspend is still desired for
> this driver, I believe we are forced to keep the pointers and use the
> devm_add_action_or_reset() pattern.

Yes, this is the best we can do with current regulator APIs.

> 
> If you prefer, I can drop the manual regulator control from the PM
> callbacks entirely (or drop the PM callbacks altogether), which would
> allow us to use the cleaner devm_regulator_get_enable_read_voltage()
> helper.

We can't do this unless we can be 100% sure we don't break existing
users who might be depending on power management working as-is.

> 
> Let me know which path you prefer for v6!
> 

