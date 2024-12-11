Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B4E1DDC11
	for <linux-staging@lists.linux.dev>; Wed, 11 Dec 2024 19:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733946161; cv=none; b=VHqCWPirWT94ISysw7A+VTDqGz+g7dglpeCjqUIy9X6eIbuDrkQVk9dvVZL2qBZLVYJjiR5fHhXaq6+2/oLeZoq5SWhtBBZeHrCqHZXpupz486gD4JAEW0bKXh87LEyFxKIIm3ksymfJ0iuPCDWl9aNEKZeoNJOc5W85LSPeWwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733946161; c=relaxed/simple;
	bh=XyOkt5ib8aWsKpIvF89r5dE0RH8x90F9mgNYhpJ0UIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VXoDQLBxZaBjiZVew/sG6s9pGR5f/OrCR5oxBD/BVTpK9zkhrfdi2aIOxi/fj/hO5/uydLsjzGgdu2nd4Yfsaa0JAlKII3oWBPHkIG6A/TG2xkxnwSgYgs5wBqThVl0Gg0JG1Vpg6VE5ARXxyJbdDLnuU62bEBbOJPcWsmdyoNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPHUBkMC; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPHUBkMC"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21669fd5c7cso29592055ad.3
        for <linux-staging@lists.linux.dev>; Wed, 11 Dec 2024 11:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733946159; x=1734550959; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lj1zpDLbQ67q+xn4Tg+T12p4jMesEEeen1UDILleHrY=;
        b=bPHUBkMCCRExKdiP2NDQOBPU23V+uXz7Bnu7f40Jv4DKDElkGCeXAYFaRJBxMSG64W
         qhzDJFhfneEDMNmI4kM2pmAdGPFo9s/lV3FQrBuyhpukgxABUHnRCWp+0zLrkN/wq3i9
         /wBMzlTt1Ah3WooaRCU6np9Hhz94eTkuMfUvl0FogGEZ2QVzgOXNjvFwypA8jVfZW+TN
         FvHMcDgC7fnq99RemrMnt0B/+Jqejiwu9U1T5VZe18EmLGr0GHxNfa5+6cTVdbyF9Aft
         g7gW3HiuiuzNgJijKn04vNj5ZFuGIi3jWLEVM8J6gGs9SII0xAx2BIzkuO95VaZNWZma
         +tOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733946159; x=1734550959;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lj1zpDLbQ67q+xn4Tg+T12p4jMesEEeen1UDILleHrY=;
        b=fMrRxuZsQ92L46knMBwmQAvidOptYnc49c8PEhcaz25ECTcUs4JWBDdhs9bS3MVlrn
         nYeGmmPLa1Rd0JAYj4U/vjTLX4wJU9foiFDsukeWNkKi7TwQp+PpJldiKFZxq5063rMD
         cl1Q8ZEmUGRYYNdIAiD2DLcOlRMtXIx9G/BSxBgcR6e5U12ocN3TeqfflHT5gu7zyFgd
         xpE7OEczTWKNaH87wdz7AMUhkM2j0Urwa8127tpCulV23MEU6A7WJgJvqh3Nv6Drodqw
         l3iimWxtayYrVKbrjdIpY27oEqZge/vCDIijRZDpnMXkCJf1GgMBSVJwDF+bdsIo9IX1
         Xe6g==
X-Forwarded-Encrypted: i=1; AJvYcCWtwTpwH920Jz5Mg+jU8BH3BMeTNwlCxfXs3Xj4QOBXEuysFmB8nXXj7IUOUKRBkexJ4X327CkWjgDNW95j@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1teLbR/kcoLz/IWUygIxM7k5FyUiMEf3uBWfPBLRMk4cVlDhp
	616dYDt104aT7HJh6aNdd5G3XtAyhsTYH1W7W6LEaQmRq1R97asz
X-Gm-Gg: ASbGncs3yCepHrAcH+ywW3g9kgTOf52JqBvhpNtta+AxezyFzXT9j28iInwKf5ImogV
	SSD1lYoIwepKyFAsDheDfD1kt1a/M6Au3juJqr7ZSmcY0Sy9YoOjt7+EuZsqA8wp3ivOKr8RDua
	5qyaKHHzruzqa+B3DDhwmTqpW21Tyty5A5dwWvS5UzT1pohtuBdRX8ZftGpfqKaLEIfSt0EcvTu
	/EqtgBuzzEk26Ns3Ob66ir2s0VGLc2sulRJS0u1/WqcaCoFbhXc6H8HAh58mVpCy4DOBn+4cpQO
	tabfyRGvUO6g2XEsWo/QjxqKffw=
X-Google-Smtp-Source: AGHT+IHVkA8DVUJYDwX+EPn3giKM/n6cInzivkc5RJH3XpPbPzFpgQyyW3v2CSEkeuHacnnFqFOkjA==
X-Received: by 2002:a17:902:d48c:b0:215:b9a6:5cb9 with SMTP id d9443c01a7336-2178ae4c25dmr14877385ad.5.1733946159160;
        Wed, 11 Dec 2024 11:42:39 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2161eb94f17sm89412675ad.220.2024.12.11.11.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 11:42:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <670d63a3-6b20-41a3-a4db-96b407b80202@roeck-us.net>
Date: Wed, 11 Dec 2024 11:42:36 -0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] staging: gpib: Fix i386 build issue
To: Dave Penkler <dpenkler@gmail.com>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, geert@linux-m68k.org
References: <20241211164452.27464-1-dpenkler@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241211164452.27464-1-dpenkler@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/24 08:44, Dave Penkler wrote:
> These drivers cast resource_type_t to void * causing the build to fail.
> 
> With a 32 bit build and PHYS_ADDR_T_64BIT enabled the resource_size_t
> type is a 64bit unsigned int which cannot be cast to a 32 bit pointer.
> 
> Disable these drivers if not 64BIT and PHYS_ADDR_T_64BIT are configured.
> 
> Link: https://lore.kernel.org/linux-staging/2c6c7e9d-ca10-47a9-82a7-a2e26b1f51ef@roeck-us.net/
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/all/f10e976e-7a04-4454-b38d-39cd18f142da@roeck-us.net/
> Fixes: e9dc69956d4d ("staging: gpib: Add Computer Boards GPIB driver")
> Fixes: e1339245eba3 ("staging: gpib: Add Computer Equipment Corporation GPIB driver")
> Fixes: bb1bd92fa0f2 ("staging: gpib: Add ines GPIB driver")
> Fixes: 0cd5b05551e0 ("staging: gpib: Add TNT4882 chip based GPIB driver")
> Signed-off-by: Dave Penkler <dpenkler@gmail.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter

