Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3241F92E
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 07:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773990326; cv=none; b=Yt06i1mbPXA3XTMq/4tefM7Yc5ZTZm2h7I7EzgREX0Kskfx7TL/r17AVLd3BtVjjlDslH7m03JVUtVWjz2Rh2dEM/zOlrefzDntUlmgh80W+O/eQVjU284AU80Dn8lcUB5YqP+Q/s75Z7QBd1L0NnRRh/zFcaGWFHsm+H06T0Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773990326; c=relaxed/simple;
	bh=WwTEwruhq56A7hlGdhEU10GBkPWrUZecDYJsmzBgKyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L9652X5mB2FdiPLMq7OJjNZhtSjtbeK+JSHux+yZucoQhkrQYtZTSSTkwbGMDw2hBucvhXZeK0xK+RC2qEnNNAL4dJFUwZehFMlGd/voW2DuMKKho/r7hK/LUIFYUTxpbZSwqGoHQBaM1z62XjhhIYYHiOT7KX9PsxsB3XVbhaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nH9IAlhp; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nH9IAlhp"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439b6d9c981so1086411f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 00:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773990324; x=1774595124; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WwUD01rh6gsO0pLJuSK6HPCn2diryGXNJr7gzwicfLQ=;
        b=nH9IAlhp59bUjbK4zo+IsfSx5pVCUbc2WUoF2uKKoDuYxENZzf2MFMWrlsipRTghby
         mGV0OUllcdEjXCPSC+vIPDSRr/H/YDsn2+CtiZfcEyakeQdQHjWUfvLbGieTgPBNuU7u
         Do3Ku7au+zqeCPiKCunnBEYyZdmsKUUeSlskfeJMJ9VohSM5kFeCmzhkUsV0K5PqNvba
         klm8zYclEniIOMCbfeVxPIkwJ0zpHTTDQP9dZp0oXKR896N/adb3HRGSqpTdRr3+9RF3
         42MrtKaPthiiAhbI5fd0E45XIaCE1ZpVvi8TJQLITppby+/Yhsalc//NQV8wnKw2Jh29
         uMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773990324; x=1774595124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwUD01rh6gsO0pLJuSK6HPCn2diryGXNJr7gzwicfLQ=;
        b=LvFG3EV5fH//AZxtT1L8n/Pl2KB1N0ERLVvuP2h2G8lMO3lzzbet+WXAWy2J26UBIB
         4itVC3JoSftPRAjXtHHz9WT0qi2x9E1jriN9Nk+1IWBjh2R8zie0U1DXr8WLQiBkk4z+
         WFn2uWsiKxVXnuebtIQVsOwTNlYKxMkhIDb5sXGBTVEJbidJEPVZV0/XTEEFX9/OuoDp
         LvTjYW61sqhqzHvJqBfDD2QaUyiZDK+h5CmREO2umawez2OMRyQkwObop2IDNL1X16J3
         Elp5jK8CFQ0N5CcFdtrf0Zy7X6STrEhjKEpeI4PYgd1m1lhtVRLIs/nxTxzMt6s1iOtB
         pcbw==
X-Forwarded-Encrypted: i=1; AJvYcCWTCC9AC0i0JbWd61kXPYCRnIl8x+al/h6Ye0WdzikMJyhERr1UPuTol4bnDzQagLfrpgBmULm3qm8rjQMe@lists.linux.dev
X-Gm-Message-State: AOJu0Ywno+vi/N0Ubua6W8mze8G4gsNOE0JZ4RVK7XjwYyJsXueG95ve
	YhWyFsL1z5yeR9/cyKihdnox+X2D36544Wn0gq5C+b63SIAFJAacb+/W
X-Gm-Gg: ATEYQzyCaWeayRM4KrlI7PFkvcmrDSCOxI2343nqOyPBKlE5DJFlV3KIESlKXtd8cyU
	UWvcETTeKQKo/Rx00n4u7Nnj5azw2y24BbxHnh74xGOMHSUfNE3cXgEab9CbAA5ssJJJtIJhvje
	u6/UMMCg1HcJYiQcZe3218rINg+Xm1KFzgJv3MRX0b0Kk69houda24c3D/alVFHRzqftu9O+UFO
	dHNcfbuYyLADJc+sJ3hunKbQQPohimG5cRJ/fcywdm2/78xFb9mCYkMuZA4bAp/UFKYFvNW/OmD
	/r8vzXp3m+N99ds51RF0SaXdL/EYJav/wsUPeJZC26FJu5/SqHMcUYcafIEGWRWI+E/2OvKoujU
	7Onf6c7MjM27uZ7CUtxjHmGDTuCrH2H/bPNqHJ/7vKLRIGOEMExU46tD/7fi8E8PCe9gVtO96Zv
	eIx6dV/TLS0KuJuiQLJNv/k2ScKo8Bs8jHcw==
X-Received: by 2002:adf:9c8a:0:b0:43b:48a4:a4d7 with SMTP id ffacd0b85a97d-43b576fc5c4mr8872057f8f.10.1773990323579;
        Fri, 20 Mar 2026 00:05:23 -0700 (PDT)
Received: from [192.168.1.25] ([31.176.170.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470c239sm3781778f8f.27.2026.03.20.00.05.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 00:05:23 -0700 (PDT)
Message-ID: <5d711392-9c60-4c2c-bd67-9ab7777dfdb3@gmail.com>
Date: Fri, 20 Mar 2026 08:05:20 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtl8723bs: replace _SUCCESS/_FAIL with standard errno
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260318214104.16971-1-omer.e.idrissi@gmail.com>
 <abu9MkTs2ETRzDk0@stanley.mountain>
Content-Language: en-US
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
In-Reply-To: <abu9MkTs2ETRzDk0@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Apologies. I forgot to switch the branch. I'll resubmit the patch 
against staging-next

On 3/19/26 10:09 AM, Dan Carpenter wrote:
> On Wed, Mar 18, 2026 at 10:41:03PM +0100, Omer El Idrissi wrote:
>> Replace non-standard return values with descriptive
>> linux kernel error codes in probe path.
>> Also replace the variable name 'status' with 'ret'
>> to be more consistent with other kernel code
>>
>> Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
> This doesn't apply.  I don't think you're working against staging-next.
>
> regards,
> dan carpenter
>
