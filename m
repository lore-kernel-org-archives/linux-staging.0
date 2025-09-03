Received: from mail-io1-f100.google.com (mail-io1-f100.google.com [209.85.166.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A7936B
	for <linux-staging@lists.linux.dev>; Wed,  3 Sep 2025 16:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756916228; cv=none; b=Bo3Vq1xKr3kiqmxXSQxd/WxltoCgjS8fYeP34jpAYwc6kIJFxKYMOd/wGJ8gwq8Sf182FJEkII8HE4utZjKJUlcn985p3ab4+T0lZRauovl3CrwxdAtfhvcGyWuPpR3GNVY2HPTYdkWPl4aoVufQpG399oIcZ8FjVxcwNGl0fEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756916228; c=relaxed/simple;
	bh=1llv7wH1VQiIuNBw9e8TTndgICnN6X6SRI4+KSovQUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d3GnaaXUEwmffEPRmOXZoyIi3cX2Fdh9cPwQfQSFLp4wQ771vhqyO9X5c30BCjPcsKa14VPuRizDHthJMyA38L+L5IPJ27fgXzKKfr0+33PRnIo+t0QTbZe02Lr8YWB+hTdFppV/szSASL9YoY0TJI3hiPMYjX6LYm3Ag3yNjyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Kiy4SB0T; arc=none smtp.client-ip=209.85.166.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Kiy4SB0T"
Received: by mail-io1-f100.google.com with SMTP id ca18e2360f4ac-88432ccadeaso5726239f.0
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 09:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916225; x=1757521025;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEyeMhR/QXTIN+yafgST63K3oGIIG+IXiOqEdcRlOfE=;
        b=Sl0bkbQ8bBVW+CIlQVlkIXsNn+R/VMJJaGQJdl4YHOnnZFXHbyRW41Oo2jLl6yakaK
         S7yuy2QCYMZ2q3lz5hqrFy4mqXAFQlTHMDP7do6yxSB8xAJA7+2HsEoNf+Bvk+vKRh+2
         CwvaV4f8FTZCoDs5sMOAEde6foGQkUQd0b3KgvKgNrWGcDmLnZXpbB2mB4AMXp5Hx/gy
         Qdx391P8GG6RasDBTUdncBwO7+1sascU8OGfSNHkNMyNdR43IUa4m+ZuYzWiDUkfcyWV
         6ay4u3W+vDCzVyOBdSdemoT9oY5uR1Nuyov4sjOCWrHH0SLe8SgkS6JPmehKhljvLmTM
         Ehlw==
X-Forwarded-Encrypted: i=1; AJvYcCXWb3+g+bmTKULvR0NOMAzxMiSwi3imLhg1MVy7cbx/HgiexkXcroq6yAWY2dczUZcK6sYfAJE0owU9Smzn@lists.linux.dev
X-Gm-Message-State: AOJu0YzaVrv0sm7nlwbCj9dVxm77JS+mxC+fTkDLcQKQdFZjirhkTmfD
	pIrY+OplY2ZGEALARoYj8uI5z6eTxKqow9bKjD62HMccsV9gZxrnfaNJ0+q52DvCElN/Ofhxl00
	WZSEBvLjGacD2GZoQKSnLrEiAKQblOR/g7osXMEHk6ZI7I0C23QJGX1UL3QPTfQLs4qsl2bWMJE
	kYsiJQK8oQsCLv9D+Gbe5kyIcb0qWvaMcE9TUl/KvYOmOolvdmyEtQhdytHGwkeY50XJsnIjbO4
	S3/zIwoFYMMRlbIW45n11wMXQ==
X-Gm-Gg: ASbGnctzWpjw0f30DMEpHV5SnWuqaFhzImhBMpf7YfqZ9/yK9CC6H/KcCopvh/S8ykh
	Fs0lVSdFtFG9SZUtyyVQyraJv4YyzX3daN27L0JEehe6P8QqpM0VgGmgMUHU1LBF9oKKaQeuIjP
	tphTcBoGODqJxLb8vmeEEyDWhhfWQds/hhFFUa+IPMZ97rcw9QL7YHHjpTWPshEBNehEzsWbxwA
	4FQqej1b7vBemafJoQVATuSIrjx4oEPxxlSWPWHDTd1V4TfgJQGR+5HdeJfpOo2/3MsIinff/Nf
	NoMJc6HspLq2qjDXpjEXsWfNHsgoEvxfiD0V72OWAlI8FVJBq5GDIlOCPXdQTTVyk9AXTC5pzfS
	WBBCuFa92ojP5oR7Lu3CBrXfSeoQyJd9nCXKLfE0NuwOOpupWQIcDc5YnbkvSgPwm8zygRDxMzP
	QmbvmtOyo=
X-Google-Smtp-Source: AGHT+IGShdUYwGruHHMSDF8lbsLhFCgswUemmp6ROkeugaHSVZjGxzf5Rrs6Z8J8t0k8eCRrQYwS84suHEQ1
X-Received: by 2002:a05:6602:6b06:b0:886:b080:ef2a with SMTP id ca18e2360f4ac-8871efedca4mr2164434139f.0.1756916225244;
        Wed, 03 Sep 2025 09:17:05 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-122.dlp.protect.broadcom.com. [144.49.247.122])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-5103964c173sm86185173.31.2025.09.03.09.17.05
        for <linux-staging@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Sep 2025 09:17:05 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70dfcc589d8so70928936d6.3
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 09:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1756916224; x=1757521024; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NEyeMhR/QXTIN+yafgST63K3oGIIG+IXiOqEdcRlOfE=;
        b=Kiy4SB0TPwhciaAS38qEm8pHHjgJBSox0TaaMzWuFi3QoV6euvnYEvV7I6S+sQPdcf
         B1xmJSAFQVA2RIQEK0OlfG2oRXBP89oojKXVaon57/B0SMxKTH9mOBxS/DD66XY/WMZQ
         KyIrjalv0bD65qFWPD2rq8le42AxrvbOSEQwA=
X-Forwarded-Encrypted: i=1; AJvYcCV1jKtwjc2CIc1KMHta23FMAUO+0Y/BpDHyQnLwDtdfNzclGOPiNy1IgrpqFvLt36cPIybXXwkFgkt+ZvyK@lists.linux.dev
X-Received: by 2002:ac8:57cc:0:b0:4b3:b34:9395 with SMTP id d75a77b69052e-4b31dd27962mr180189261cf.65.1756916224090;
        Wed, 03 Sep 2025 09:17:04 -0700 (PDT)
X-Received: by 2002:ac8:57cc:0:b0:4b3:b34:9395 with SMTP id d75a77b69052e-4b31dd27962mr180188711cf.65.1756916223483;
        Wed, 03 Sep 2025 09:17:03 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b48f756d93sm13694341cf.33.2025.09.03.09.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 09:17:02 -0700 (PDT)
Message-ID: <b229ea9b-96c9-4910-a827-f4d9cc14fa96@broadcom.com>
Date: Wed, 3 Sep 2025 09:16:57 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] include: linux: Destage VCHIQ interface headers
To: Stefan Wahren <wahrenst@gmx.net>, Jai Luthra
 <jai.luthra@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Umang Jain <uajain@igalia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 kernel-list@raspberrypi.com
References: <20250827-vchiq-destage-v1-0-5052a0d81c42@ideasonboard.com>
 <20250827-vchiq-destage-v1-1-5052a0d81c42@ideasonboard.com>
 <20250827124016.GF5650@pendragon.ideasonboard.com>
 <we7tl65ijs44ae2zxfejmvnml3ls2pkfhcp2fqsmvec2eqevwm@yb45fs7nnf5s>
 <8ed6519a-6e45-4793-b11b-7b63c1703d6e@gmx.net>
 <910dae68-0545-46fa-b41f-8e4fb32ed649@broadcom.com>
 <c35ab51a-e9df-48f5-bc18-889980098d08@gmx.net>
 <175690728665.8095.6551736878574350999@freya>
 <02213561-7a72-474a-be83-98d5ba575f0c@gmx.net>
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
In-Reply-To: <02213561-7a72-474a-be83-98d5ba575f0c@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/3/25 08:03, Stefan Wahren wrote:
> Am 03.09.25 um 15:48 schrieb Jai Luthra:
>> Hi Florian, Stefan,
>>
>> Quoting Stefan Wahren (2025-08-28 11:49:47)
>>> Hi Florian,
>>>
>>> Am 28.08.25 um 04:17 schrieb Florian Fainelli:
>>>>
>>>> On 8/27/2025 12:05 PM, Stefan Wahren wrote:
>>>>> Hi,
>>>>>
>>>>> Am 27.08.25 um 16:33 schrieb Umang Jain:
>>>>>> On Wed, Aug 27, 2025 at 02:40:16PM +0200, Laurent Pinchart wrote:
>>>>>>> Hi Jai,
>>>>>>>
>>>>>>> Thank you for the patch.
>>>>>>>
>>>>>>> On Wed, Aug 27, 2025 at 11:54:08AM +0530, Jai Luthra wrote:
>>>>>>>> From: Umang Jain <umang.jain@ideasonboard.com>
>>>>>>>>
>>>>>>>> Move the VCHIQ headers from drivers/staging/vc04_services/ 
>>>>>>>> include to
>>>>>>>> include/linux/vchiq
>>>>>>>>
>>>>>>>> This is done so that they can be shared between the VCHIQ interface
>>>>>>>> (which is going to be de-staged in a subsequent commit from 
>>>>>>>> staging)
>>>>>>>> and the VCHIQ drivers left in the staging/vc04_services (namely
>>>>>>>> bcm2835-audio, bcm2835-camera).
>>>>>>>>
>>>>>>>> The include/linux/vchiq/ provides a central location to serve both
>>>>>>>> of these areas.
>>>>>>> Lots of SoC-specific headers are stored in include/linux/soc/ 
>>>>>>> $vendor/.
>>>>>>> This would be include/linux/soc/bcm/vchiq/ in this case. I'm also 
>>>>>>> fine
>>>>>>> with include/linux/vchiq/ but other people may have a preference.
>>>>>> I agree with this point and I might have missed to notice the
>>>>>> include/linux/soc earlier. That's seems a better location to me since
>>>>>> it's actually broadcom-specific.
>>>>> I would expect that headers and source would be more related.
>>>>>
>>>>> For example:
>>>>>
>>>>> include/linux/soc/bcm
>>>>>
>>>>> drivers/soc/bcm/
>>>> This is not Broadcom code, it is Raspberry Pi AFAICT, therefore, just
>>>> like drivers/firmware/raspberrypi.c, we would need some namespacing
>>>> here that reflects that, ideally.
>>> The VCHIQ code originally comes from Broadcom, but the current
>>> implementation has been adapted and tested for Raspberry Pi. I'm not
>>> against a Raspberry Pi specific namespace.
>> Thanks for the suggestions. For v2 I'll use:
>>
>> include/linux/soc/raspberrypi
>> drivers/soc/raspberrypi
> I'm fine with this.

Still is not properly name spaced IMHO. There is clearly a lot of cross 
pollination between Raspberry Pi and Broadcom on the BCM283x and BCM27xx 
SoCs, but ultimately, Broadcom makes the SoC and delivers it to 
Raspberry Pi.

I would really rather that you used drivers/platform/raspberrypi and 
include/linux/raspberrypi than the previously suggested paths.
-- 
Florian
