Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D64101DE
	for <linux-staging@lists.linux.dev>; Thu,  3 Jul 2025 14:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751554016; cv=none; b=Dnkkuo1D+hYon12AEJX2wjgI1ln5igN41DkAvt+3gCdEpxz1yvc0cslYJ93hMcFaWcF6vAuTcSCAmRfATZd+GRc9pSTlPtKtOTPoRCr0X069j2Qq8mHNHkolPs0Ptp50p8RzIXmGJjUFs3R0DyRQG1xzmKpJRtvI3/UB3vD1pJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751554016; c=relaxed/simple;
	bh=lN5s32Jbcs7WNkSmhy7bYvtYTmkxdABMhyRkzs0DgUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZYq3qGD0ih9FFrlILqKbtp7zyxxYu9iO3lcB54uRQci5pU5mCTiUpuEYCssmeHrrA7IvgoIrQ5TlGaSPSKuEZQtsHLuz1tYv7utWqtlPL3R2UDQ2CevoeIh387Y/yERK7SnwCLx1Bbyg1dM5ZtpstrCwRjYpG+dkPA0StInWtEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VCIHSEW1; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCIHSEW1"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso9733147a12.0
        for <linux-staging@lists.linux.dev>; Thu, 03 Jul 2025 07:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751554013; x=1752158813; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1vG5loofJoHI/2oT8MQ0obd1zMTsI6DHFF+BLI2gKVY=;
        b=VCIHSEW12nrlgNq1AGqKxZjKCQ4F4IQoWovlDmpE6++PA2oN25FKwOj1xJIpXbRmOP
         zPoOhaakyzC1u9zxY9uDWEXVhQiH7pzCi7payHxOo9pcXsd80AURklHuUr1HNVErFzqi
         A7uqb5/CxeguPrMkPY2vhP3ljPBmIxZ6F40kxeIDhPo/WdiY+Df+FmoJ7xN+74cq+c4g
         QcjzUVXNdokw+EsdLZSEjsY2oCACxzjRDQSR6yVVnFsB2PUpW6YAPHO/996FjZ5Fb8Vf
         wt4miiXb3V8ukV3MNUj5Y0G9nVJvedBsiQ9AXJQcI7OJGY59wyT0KxZXFIbKQF/s0hTv
         +lBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751554013; x=1752158813;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1vG5loofJoHI/2oT8MQ0obd1zMTsI6DHFF+BLI2gKVY=;
        b=VOGf3r+iZjfghTUE18J24wuu2qUMh10Kaah1/m3DjgqQgBzpUoElv1KpZuEGZ6J//f
         fpXxai6gXjmuK7mibotcIvzzatIxUzsywCXFQyWEIwZDi9nfn91WbK5gCBDmz4tMFVrf
         AP4wU/mfbWQKdv0DCaqCl51AEuiqe6+vdcOakBNl60aLBNTyYOqT/mlx6D0q8UwP6hdO
         KMJ7TPFM1UnPAzfxO34jyVbhvO11J+RUAqigrHRY+4Z7zRRwqULtNDgfpoT+U6N2n6mY
         v63u4+nn759MCjPR78x+dm35PEtBfEJIcpJ2jdp85ryFpq1UXz3dqIMuoXLN39PL5ZaW
         FAFw==
X-Forwarded-Encrypted: i=1; AJvYcCXNccFzduGoNN2k2mvYETOshkgtGsxS4zwehvwYfvp2VehwD5ORNRe/p5eUE96WvgMEJ650pEbq4w0UXiZU@lists.linux.dev
X-Gm-Message-State: AOJu0YyZxyIbWAO9LiqszMCOlEVBVoclmQqIbiWSiCVDa9iEfwYtzUmX
	fQK//5evkE8Z4yWoBQJAkjFrANpkrKliRRqYxo5avpE+Tbeu2+oBCe2V2yWUlg==
X-Gm-Gg: ASbGncuCvbp3IcXZ2P5AhSYuDGr1L71RemLZzzscvC3889qlRphQtrCOzu9o5UgMIT+
	4KWm9zDjLkkIZ0uJ+Hu36drnFVaVRwOd7eBLA+eHl0xSQ7eFBBtBEdpnH0GFRXQdnqzafpXPNfc
	ntzuVsXNVhY8toDf7fjqqG0LxPzDDxQl/Js6vvXKZNnfIeeXsRquDy2PWqJOdGqlEpmgctj9np8
	i5088WrtX86JiY5a1fzMm4mvBthn427zT8ESR/UL3Rec2eUU4boHTCzgHp0dmkIJXwIUU0a6jHq
	ZQ2TrV0eLTJ99C0bt+8XCaMMDjwxAO6C6p1Ijsh5qrohMEeXr6Ifnvh7OuPZzykH8k32Nna22zV
	a4kY=
X-Google-Smtp-Source: AGHT+IG3d3NfRg9+cPD1+4PBfyGx8gRVD7/AozdqjiToYMztJLCFly4TfxgJoNGqYews3daJwQLNLg==
X-Received: by 2002:a05:6402:35d3:b0:608:155c:bf81 with SMTP id 4fb4d7f45d1cf-60e6ce24caemr3706836a12.31.1751554012933;
        Thu, 03 Jul 2025 07:46:52 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828bb5b2sm10745485a12.4.2025.07.03.07.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 07:46:52 -0700 (PDT)
Message-ID: <cbf8d7bd-24a4-4dc1-8d9f-bbc4bee45d8d@gmail.com>
Date: Thu, 3 Jul 2025 17:46:47 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/24] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Julien Massot <julien.massot@collabora.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
References: <20250702132104.1537926-1-demonsingur@gmail.com>
 <5e1b26637706f6eac92acbbb3d5a7dafa0c2c232.camel@collabora.com>
 <d4052ab3-9cd1-45e8-81b0-b6512822e646@gmail.com>
 <c661e7f3faec269f73d6240fbe7b84e3bc97157a.camel@collabora.com>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <c661e7f3faec269f73d6240fbe7b84e3bc97157a.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 7/3/25 4:54 PM, Julien Massot wrote:
> On Thu, 2025-07-03 at 15:17 +0300, Cosmin Tanislav wrote:
>>
>>
>> On 7/3/25 3:07 PM, Julien Massot wrote:
>>> Hi Cosmin,
>>>
>>> On Wed, 2025-07-02 at 16:20 +0300, Cosmin Tanislav wrote:
>>>> This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
>>>> replacing the few GMSL2 drivers already in upstream, and introducing a
>>>> common framework that can be used to implement such GMSL chips, which
>>>> avoids code duplication while also adding support for previously
>>>> unsupported features.
>>>>
>>>> While the normally acceptable and polite way would be to extend the
>>>> current mainline drivers, the choice was made here to add a totally new
>>>> set of drivers. The current drivers support only a small subset of the
>>>> possible features, and only a few devices, so the end result after
>>>> extending them would in any case be essentially fully rewritten, new
>>>> drivers.
>>>>
>>> Thanks for your work,
>>> The common framework will help a lot to drive new GMSL chips, and most of the
>>> features are covered.
>>>
>>>> This series depends on support for internal pads, for which a patch has
>>>> been added.
>>>>
>>>> The previous version is at:
>>>> https://lore.kernel.org/lkml/20250618095858.2145209-1-demonsingur@gmail.com
>>>>
>>>> The following deserializers are supported:
>>>>    * MAX96712 (already exists in staging)
>>>>    * MAX96714 (already exists)
>>>>    * MAX96714F (already exists)
>>>>    * MAX96714R (GMSL2)
>>>>    * MAX96716 (GMSL2)
>>>>    * MAX96724 (already exists as part of existing MAX96712 driver)
>>>>    * MAX96724F (GMSL2)
>>>>    * MAX96724R (GMSL2)
>>>>    * MAX9296A (GMSL2)
>>>>    * MAX96792A (GMSL3)
>>>>
>>>> The following serializers are supported:
>>>>    * MAX96717 (already exists)
>>>>    * MAX9295A (GMSL2)
>>>>    * MAX96793 (GMSL3)
>>>>
>>>> Known backward compatibility breakages:
>>>>    * No default routing. Default routing has been intentionally ommitted
>>>>      as the devices support quite complex routing and it would be
>>>>      unfeasible to provide sane defaults for multi-link deserialziers.
>>>>      It is expected that userspace programs would set appropritate
>>>>      routing.
>>>>
>>> This part is the most annoying one: at the moment, there is no way to set the routing except by
>>> manually enabling a boolean within the kernel source.
>>> You can't guess what routing the user really wants, but please at least provide a default
>>> routing
>>> table that allows using your drivers — for example, the device's default routing.
>>>
>>
>> It's a very delicate issue... I'll try to see if I can do that.
>> It would be great if we could enable the streams API globally since it's
>> been merged since Jan 15 2023. It's been over two years.
>>
>>
>> Thanks,
>>
>>>
>>>
>>>> The following list enumerates new features that are supported by the
>>>> common framework and their respective chip-specific drivers:
>>>>    * Full Streams API support. Most deserializers have support for more
>>>>      than one link, and more than one PHY. Streams support allows
>>>>      configuration of routing between these links and PHYs.
>>>>
>>>>    * .get_frame_desc() support. Both the serializers and deserializers
>>>>      implement this to query and provide frame descriptor data. This is
>>>>      used in features explained in-depth below.
>>>
>>> So are almost all the sensor drivers incompatible?
>>>
>>
>> Yes, sensor drivers need to have .get_frame_desc() implemented... It's
>> not a huge feat and it's the only way this type of bridge could work
>> properly.
>>
>> Alternatively, we could add a fallback that bases its decision on the
>> stream format, but I'd prefer if we didn't and we would just implement
>> .get_frame_desc(). After this series is merged I can submit my patches
>> for imx219.
> There is already one pending on the mailing list
> "media: i2c: imx219: Report streams using frame descriptors"
> I guess it's fine if we require the sensor to implement this function.
> 
> But I had to do it for vgxy61.
> 
> Btw I tested:
> TI AM62x + max96716 + 1 x max96717f + stvg5661 (tunnel mode)
> With special lanes mapping and polarities.
> 
> And I had to:
> 
> - Apply pending patches for j721e to support the enable_stream API instead of s_stream
> - Enable the experimental v4l2_subdev_enable_streams_api
> - Add get_frame_desc to the sensor driver

Did it work without issues with those changes?

If that's the case then I think all I can do to make it is easier is to
add default routing. I'm not a fan of each driver having its own
get_frame_desc() fallback, especially when it's a very small change to
do to the sensor drivers.

