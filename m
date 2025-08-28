Received: from mail-yb1-f227.google.com (mail-yb1-f227.google.com [209.85.219.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1074F248883
	for <linux-staging@lists.linux.dev>; Thu, 28 Aug 2025 02:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756347451; cv=none; b=c0gGlZUFC9tRbY2pU3nwkg0R/obndgCgoucIXM4ZSyY5Hq//oqhiKzbN38OlpIeF6pvgUvUHn73GJnDRToO6qx6iL3y3E/9njNBGAD/OeUCve0q2K3tvR0vAzhXG7Z8QmOYDEEjZEvPyD0NVqU+ZfToeBFxm/oWWcmwsw5k4uvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756347451; c=relaxed/simple;
	bh=N9vnL96LHzTSI8yQopxfDh1YR87Qvfz2R3K9FkZdD+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TXkrGwqFiuQFLoo/7dXTdwtWgJ204NsCBMtOFl+1EVYc9HYTqRkUpLQqN6tuNr0Rl9sBZgwFBQEZ6spTHDi/pQV8Y76D0QxV/A4hMy+3lgrQ0e4NVQlq8uvDkph63gL/sFSa/q2PG/mQz1ynNVZct1MHgHcXlUeaPP7EfOd9LzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PUkjGNrb; arc=none smtp.client-ip=209.85.219.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PUkjGNrb"
Received: by mail-yb1-f227.google.com with SMTP id 3f1490d57ef6-e97021a3695so169332276.3
        for <linux-staging@lists.linux.dev>; Wed, 27 Aug 2025 19:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756347448; x=1756952248;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=prg3sotdOQOd9SAT1I4QjPjY9bIuPacP6Im3454z7xg=;
        b=L4wHMelNGwnPoQRTGakgMWoLfkpNLJlmEZTej0l8sZZsgMSaQgy8GXN34UMPtG560Q
         eYK2TrwWGQp9TCNIhHr/2f949H6+DOy+eW15u1wH1XHzh9u+vjxMLkiY8jY4HbN+MM0L
         VjmxQKJ++xE1ks6/nLyeYdKv/aZXpFtpHAB4L4BWJu/uzYpmswNhQPtFRiqqLpnXu6zh
         Wt2RSFtJ7HP5NHich1Z2ASHRWhx5d4bJ3VXpvs24DBdLD2RfWL4H29BBAO3IQPu93oF3
         eKv/dnpUWuqunqTQlHxW2+4DIgh1nvZa6BbzT3x6+QksTODdrwBCvZikFPlSqNqwvrJn
         K+Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWj8THYnXoikzDZVN2/Fbi7njrDrtJpWNEXTNyVekX5kTgueEjpiYeCgj88Rzv59pH1EEG0hrm/UqjdQYjs@lists.linux.dev
X-Gm-Message-State: AOJu0YxKKXnvdh4qdG7R9QR3gbeqkMsh15pberXMVilVuBJ+u0ZCkgT1
	+x3a7RObf/uU1cPazZRy42E7rguWl1Oks3+5W+ahrCfkirpVRm/yHt0h4Ydxh+wWPZOmv9Ry63t
	BbSwJiJDiAs5HKD0AT5oKy6V/psttooX1TRmDKlXgKyY+Z7FkYAir8gkFxK1MfsWeMY12Xi8I+Q
	LDaaKuXHBFJYwgYTqPBKPF+MU7IJ802d45BGMlDfL1eL2yZSxHsit0w7Sy61TJc8+medPvZG5gM
	eaFo0GB96ahazWsRMb8I7GHGQ==
X-Gm-Gg: ASbGnctMcBmqjhPQ4uthZo05aK6hw0ZvWXTWe0/bfkkDrEQf2pGg8z5BeDiV0hVgohY
	F/hfgstk4Kj5VLpppySnHdqI4gT30dRfIgxQhisNHS41TMfpGHtVRbJ6h9qYePLcdv9C6gXPEDI
	1UbnoVM2/Qmjy+EvpKcnexVF15l5P6VxciR1VOG1KuOQgiN9Smtw6XXmzDVvP1QfJoTv5JNLKql
	FsfwNsRQbcGAoAinfFn5LryL44fwX8eIObKFnhmwtxEYCpVnPQDFp4aLj2sJq+L2vqfey38T9m3
	owzC1ng1BmbOvDHRtGVI6NpNjOaMX2YypcFShTzHFfeOQqkUcykDshW1sULVCjC24Az4qKTa9om
	xNcNor7m4fClP4xclr+E5DpdJ68L9Zgkc0UnWf900e/+vw3CgWCiwKEcVHUNMR9pBX1mTgUcLVz
	QLnNWK
X-Google-Smtp-Source: AGHT+IEJs6bIkUH4CO2J0ciu/KHdgirZyrZT66qiRaYXc+oDg9B8lasz2eKYnX80jc1EULz7266+oWxjTMmb
X-Received: by 2002:a05:6902:6b13:b0:e90:62f9:b1be with SMTP id 3f1490d57ef6-e951c33337cmr23586580276.22.1756347447606;
        Wed, 27 Aug 2025 19:17:27 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-11.dlp.protect.broadcom.com. [144.49.247.11])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-7212e900d20sm3672997b3.20.2025.08.27.19.17.27
        for <linux-staging@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Aug 2025 19:17:27 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77053dd5eecso656916b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 27 Aug 2025 19:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1756347446; x=1756952246; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=prg3sotdOQOd9SAT1I4QjPjY9bIuPacP6Im3454z7xg=;
        b=PUkjGNrbeM2DwWtW2dibE7onTBmAX8RFn/Yw7n3mrw4aEJEwsFVHh3QYrAoTiphL2v
         8pvxDR4VpYsJuNNixgewNjSfByYsb9L/IdPX9p9nTr7BMC9p+N78kMrj1+tTmzsJO4sH
         FR8l+Jv0EEbgGaz8UFHuUCIlNvxiebermsIas=
X-Forwarded-Encrypted: i=1; AJvYcCXWJ9pJJE+Oqu81TfsbIi9QBm3l7Dd8m/S5p6Gc+vHQW4MVVD8lOnaduISEZ7Ojhshm1YxqX34eN4fADH8U@lists.linux.dev
X-Received: by 2002:a05:6a00:190e:b0:758:66a2:981f with SMTP id d2e1a72fcca58-7702fa0590emr29938716b3a.12.1756347446337;
        Wed, 27 Aug 2025 19:17:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:190e:b0:758:66a2:981f with SMTP id d2e1a72fcca58-7702fa0590emr29938690b3a.12.1756347445858;
        Wed, 27 Aug 2025 19:17:25 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-771ebabeeffsm8361867b3a.30.2025.08.27.19.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 19:17:25 -0700 (PDT)
Message-ID: <910dae68-0545-46fa-b41f-8e4fb32ed649@broadcom.com>
Date: Wed, 27 Aug 2025 19:17:23 -0700
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
In-Reply-To: <8ed6519a-6e45-4793-b11b-7b63c1703d6e@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 8/27/2025 12:05 PM, Stefan Wahren wrote:
> Hi,
> 
> Am 27.08.25 um 16:33 schrieb Umang Jain:
>> On Wed, Aug 27, 2025 at 02:40:16PM +0200, Laurent Pinchart wrote:
>>> Hi Jai,
>>>
>>> Thank you for the patch.
>>>
>>> On Wed, Aug 27, 2025 at 11:54:08AM +0530, Jai Luthra wrote:
>>>> From: Umang Jain <umang.jain@ideasonboard.com>
>>>>
>>>> Move the VCHIQ headers from drivers/staging/vc04_services/include to
>>>> include/linux/vchiq
>>>>
>>>> This is done so that they can be shared between the VCHIQ interface
>>>> (which is going to be de-staged in a subsequent commit from staging)
>>>> and the VCHIQ drivers left in the staging/vc04_services (namely
>>>> bcm2835-audio, bcm2835-camera).
>>>>
>>>> The include/linux/vchiq/ provides a central location to serve both
>>>> of these areas.
>>> Lots of SoC-specific headers are stored in include/linux/soc/$vendor/.
>>> This would be include/linux/soc/bcm/vchiq/ in this case. I'm also fine
>>> with include/linux/vchiq/ but other people may have a preference.
>> I agree with this point and I might have missed to notice the
>> include/linux/soc earlier. That's seems a better location to me since
>> it's actually broadcom-specific.
> I would expect that headers and source would be more related.
> 
> For example:
> 
> include/linux/soc/bcm
> 
> drivers/soc/bcm/

This is not Broadcom code, it is Raspberry Pi AFAICT, therefore, just 
like drivers/firmware/raspberrypi.c, we would need some namespacing here 
that reflects that, ideally.
-- 
Florian

