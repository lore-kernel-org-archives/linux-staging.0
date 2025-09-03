Received: from mail-qt1-f226.google.com (mail-qt1-f226.google.com [209.85.160.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14CC2C026C
	for <linux-staging@lists.linux.dev>; Wed,  3 Sep 2025 16:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756915992; cv=none; b=JbXDRFcYAlzCVUz0EAjhz2g5UUKX3daElbmxjUQeu0bhMhNxEArpIEnzdLOe1FfipF7LrSqOKhdO1dh1xNnZP/VSYO89WrYrh1fzEYxPjIdjuMCZg6CPaXq0bcnkQ3WB4Yfb7YHs0FFrc9E330TFiS4N4toOQYs05RMN8iusLQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756915992; c=relaxed/simple;
	bh=kGmTG3xESfJxkZa9QWeAUJDAz2j2d5fIPK20Qgq5vFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hy2r86AucMQX+u3+nBmB7OFQcGm5KsQ9Ff82xX3/xQDzZw7o9cS4FLf7zg4uAG+Z71s1NnjMpjVj8BXJ5wpetMtGZeJHkmaPwSs5aXN9HaZuyJMq+h7SZHeMVX+For0EMZzkZ20QH8xq/aOL1W0s27So6hfdcPsB5m0bRXQnhWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Oaq+luov; arc=none smtp.client-ip=209.85.160.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Oaq+luov"
Received: by mail-qt1-f226.google.com with SMTP id d75a77b69052e-4b3384f552dso907021cf.2
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 09:13:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756915989; x=1757520789;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QksT58lJYyQue7qfj5sBxd5t1SOILKVGpmQ75/i+2ow=;
        b=i340NWz+fSqv8soPLYcSwoaJVDvOZUpap2LYqdkMB1uwTN7Pe45SIjC/uBT3AarSQB
         zSuvegSU+B+kIR3YHb3lRvb4UbWHrNP+oUJ5t23sirWINuea5xPXlNEqnQBABz5cxuoc
         RV+5qDtlkqT+lK5I1qzwImcruc8HGlwOEn89+s1LowNwj4KaDZaxcCVXEbYPeHJqRmQX
         cLThQi4KMNEXXTRtgkokP7JFjkeHjW0NUkjkWcq5ZvKwCSuGm54veWZRlazfNdjaZMlw
         P6EIen3PFwyoMmBz9vpIq1EW2I21qQYJUgFtrCjhhfQ61hzzKXfG9iDXbZvXSMpeAOXo
         hDyw==
X-Forwarded-Encrypted: i=1; AJvYcCVJhvxJHLOEggvobon5HSVWnc6JKM/X8N8/AneJncw5POStFxnRXjfX076sxoV+L5132sD3nUzY1aZ9MKGJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3QXcVoyssxyZ8EPoNffz/likJTH6Nizp+/U0K+noLblaDjDgS
	Bh8VjycTDYH78Zps/hqDlwbw3pzu6eT6sRT97nxmgiHSRxNeekXqpTuSv3KbHC1KK5DEmIoKAVz
	SAyDFLkIaBwgQl+vdZl2RedCsUUsiYJRCg8OsKGI/7x1Azrz+nVLxrZFXHQoeVK4AQKbYotvN6T
	v06tsdxqt6RqQxhvS04nKSXwVTRZ1hNmg6yR0zLw6gbnCMneqpOKKUSf3IX0v3InKVLqfvIGLnA
	8JLtKIkA8fUj0AwZ7IbGLJvzQ==
X-Gm-Gg: ASbGnct+ejUvUFdyGdI8qU57m8pPJpKQPV/p8Vfqvzfnrwo0YA0BvyWdjAzIsBwRfvV
	ZGLKHp85D3ZPUuTNMkBMq+tDKiwBCIYMDaQ1GrRzvUtEeOhnP9dJXDVggBG5nV/0Aw5+K5AmG+p
	mW2DphK5ZtivCKnfDdroD6+Oupa+8jDgd3RjculPxHiO663ZmG486fnTpq7Fe3DxVixNXVQowP8
	/4iU6uGKIhIEk5nAPI3Axdj1T9TBc73LvXUEDhESW76hkXEfGAvy0gsHZdBZl7+LqS2OjCvSdEs
	PZJGVHa5KOgT6AukYtgNvGYBhaGUWkYPEZCIlNuL3O7GFMIrAoolgGCMvOv6ZbSyel1bwaM2qF/
	VsQlx/3SZusZYfSk9VQYUXG85uyHNO38XEmA3PLh80kvq+OuEJbdlor4vUH9m8xCcSOcsgJ1dY1
	EV2Ee0Dl4=
X-Google-Smtp-Source: AGHT+IG2i43SPYxsGOQokGYRLaYkR/Yet+twY4QsNyF49EO7Snr40ZvJL59inaWfxN3mOwFAx9gGQMthNWTs
X-Received: by 2002:a05:622a:4d97:b0:4b0:f059:74a0 with SMTP id d75a77b69052e-4b31da22583mr236763401cf.38.1756915989378;
        Wed, 03 Sep 2025 09:13:09 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-80aa9bb2204sm7861585a.4.2025.09.03.09.13.09
        for <linux-staging@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Sep 2025 09:13:09 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-722396b54a1so23731166d6.1
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 09:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1756915989; x=1757520789; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QksT58lJYyQue7qfj5sBxd5t1SOILKVGpmQ75/i+2ow=;
        b=Oaq+luovKpDGY2H7o1fFanAjRzZsNN2u4yFpq5zz0cee3bvwUaors3Ae3fAjHbE91I
         ZuJs3QhXWUJPco8IWz8Y6RAcPvAy6gSevmpc9kAiWGLGnVgECxAUNTz2i5DMsCFofNPt
         UkcogFhU8iGEQ1pBy7OnSkeFzLmou93iVU+Yo=
X-Forwarded-Encrypted: i=1; AJvYcCVIB1kEVGVOUbYaZO1tJ160zbXxkQFLOTIWoJ2S86bcefouDyManc/AoqKgVGGwVJqiIeFqaswWz8tscKJO@lists.linux.dev
X-Received: by 2002:a05:6214:3018:b0:70d:ae3c:b712 with SMTP id 6a1803df08f44-70fac78f732mr169448346d6.26.1756915988544;
        Wed, 03 Sep 2025 09:13:08 -0700 (PDT)
X-Received: by 2002:a05:6214:3018:b0:70d:ae3c:b712 with SMTP id 6a1803df08f44-70fac78f732mr169447226d6.26.1756915987413;
        Wed, 03 Sep 2025 09:13:07 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b644f2c9sm31043936d6.63.2025.09.03.09.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 09:13:05 -0700 (PDT)
Message-ID: <b266c39c-ae53-48dd-8fb9-0e05efca33d4@broadcom.com>
Date: Wed, 3 Sep 2025 09:13:00 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] include: linux: Destage VCHIQ interface headers
To: Stefan Wahren <wahrenst@gmx.net>, Umang Jain <uajain@igalia.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 kernel-list@raspberrypi.com, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250827-vchiq-destage-v1-0-5052a0d81c42@ideasonboard.com>
 <20250827-vchiq-destage-v1-1-5052a0d81c42@ideasonboard.com>
 <20250827124016.GF5650@pendragon.ideasonboard.com>
 <we7tl65ijs44ae2zxfejmvnml3ls2pkfhcp2fqsmvec2eqevwm@yb45fs7nnf5s>
 <8ed6519a-6e45-4793-b11b-7b63c1703d6e@gmx.net>
 <910dae68-0545-46fa-b41f-8e4fb32ed649@broadcom.com>
 <c35ab51a-e9df-48f5-bc18-889980098d08@gmx.net>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <c35ab51a-e9df-48f5-bc18-889980098d08@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 8/27/25 23:19, Stefan Wahren wrote:
> Hi Florian,
> 
> Am 28.08.25 um 04:17 schrieb Florian Fainelli:
>>
>>
>> On 8/27/2025 12:05 PM, Stefan Wahren wrote:
>>> Hi,
>>>
>>> Am 27.08.25 um 16:33 schrieb Umang Jain:
>>>> On Wed, Aug 27, 2025 at 02:40:16PM +0200, Laurent Pinchart wrote:
>>>>> Hi Jai,
>>>>>
>>>>> Thank you for the patch.
>>>>>
>>>>> On Wed, Aug 27, 2025 at 11:54:08AM +0530, Jai Luthra wrote:
>>>>>> From: Umang Jain <umang.jain@ideasonboard.com>
>>>>>>
>>>>>> Move the VCHIQ headers from drivers/staging/vc04_services/include to
>>>>>> include/linux/vchiq
>>>>>>
>>>>>> This is done so that they can be shared between the VCHIQ interface
>>>>>> (which is going to be de-staged in a subsequent commit from staging)
>>>>>> and the VCHIQ drivers left in the staging/vc04_services (namely
>>>>>> bcm2835-audio, bcm2835-camera).
>>>>>>
>>>>>> The include/linux/vchiq/ provides a central location to serve both
>>>>>> of these areas.
>>>>> Lots of SoC-specific headers are stored in include/linux/soc/$vendor/.
>>>>> This would be include/linux/soc/bcm/vchiq/ in this case. I'm also fine
>>>>> with include/linux/vchiq/ but other people may have a preference.
>>>> I agree with this point and I might have missed to notice the
>>>> include/linux/soc earlier. That's seems a better location to me since
>>>> it's actually broadcom-specific.
>>> I would expect that headers and source would be more related.
>>>
>>> For example:
>>>
>>> include/linux/soc/bcm
>>>
>>> drivers/soc/bcm/
>>
>> This is not Broadcom code, it is Raspberry Pi AFAICT, therefore, just 
>> like drivers/firmware/raspberrypi.c, we would need some namespacing 
>> here that reflects that, ideally.
> The VCHIQ code originally comes from Broadcom, but the current 
> implementation has been adapted and tested for Raspberry Pi. I'm not 
> against a Raspberry Pi specific namespace.

OK, that's a fair point, but it's not applicable to any other Broadcom 
SoC, more on that below.

> 
> Should this also apply to the DT bindings?

Ideally yes.
-- 
Florian
