Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B6221C195
	for <linux-staging@lists.linux.dev>; Thu,  9 Jan 2025 14:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736434478; cv=none; b=nCuqe6uls6La9XDupiZlV/pkQEaUtrUpYCablSCf62K97bbwbhNYOAETGU/K7hgF1h+sI+ACmwvix3hlx/CyDo7EY5Utu2fLvrNFj1ziDiROoP+8pBdZ1ikMB0hrkJGwbwX4KwspdlYzUJik3ZuWtGCuk3Xg0LmBdfae6fwAOB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736434478; c=relaxed/simple;
	bh=wOsesOoGMFQwvrii1vVjREg0VcRWtZbQQYagw76DDMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vu+63WOFtkBg99QM1moNl8LioRt0Tt7CpikQF8/vjOZ5z53vZTJ62asSaK0TmB/vLp1A0YrnYAUWlMTwQM+7nWcBsntLosZZcf/1cPHWHE89SRn8vFrhX/DH+6crj+uAWdWa24CoacTCZMf+oPaMyBAKCI1Ux1kfW1MBQwk7/i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=UPvwU8NZ; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="UPvwU8NZ"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-29fb5257e05so366781fac.0
        for <linux-staging@lists.linux.dev>; Thu, 09 Jan 2025 06:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1736434476; x=1737039276; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5VULE0UjHIqRlagW/OYJxPj5F0JvqA3RxB6BIakMShg=;
        b=UPvwU8NZu+H1me/9nIfBc3kiaL3GNwO31E/m5vwExgndLTYYvzPQKI/RZtgfNiJDB2
         VMJlwJNgkx2UVgPfTlfq7iXyHvFvdRgI8J5662p9rTgsBKVD/z6wt1BR3d13fx8cOdB2
         kXZJFMqduKt2CdwP3k+gb2N2FaYhVswIIQNx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736434476; x=1737039276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5VULE0UjHIqRlagW/OYJxPj5F0JvqA3RxB6BIakMShg=;
        b=SMPEsio6pp8D1RV1kN23ERSTW+TQhI/d0rzvx8/tzMSD9cfu0EZnVicqL0TCmWb0PV
         IwpcckQ+S1EQmy+vSywSz+QBezJEdqqm/GJS13Vb+Wzd2McMn6azUzJq0JE8jGbNbuJ9
         QZ+t6L9Ya/fNfT36eitm1Oxrn2Vq2/rtDRLpwLYvVEnW+ZhK0nFMVNshE1NTvdKDRc49
         1xxKCjsaHwJr8bJk1jDPSyiqTx5GI8yt7WgmDoibErxdbYtGiDoSOs+vYcgXuesq7xEa
         ryo3KEVZtp0zr/zU04dHYnJcCscEehBpl8Iqz3u4DaI4qjOxBX5ZB3LJeDFSyEd68xNj
         Z9Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUdGmYDKmEEsGsZAu5eYFSPET4GBrqGSefYk3msIj2eWGu+n0+YYn+3GHTDY43IwTRyN2VIxpvQpz5sMOIH@lists.linux.dev
X-Gm-Message-State: AOJu0Yy99mDLV5qZQxlFAh5YK02SZ5E3UL8wcPoJ9hztB9zAGjaD7Vlp
	2NNExbrUxSYNhTWly/J4YLGScf2Q6KboJJNjeEXuPzjqvhHOGO/e6cHIacI3IQ==
X-Gm-Gg: ASbGnctx8PNmFNMmufe4i+Mb1OSELiMiR7B0eB/JA72YYneKYFq1sTAZKxf1kcbcdPe
	LllhS+S0t/Eapu20yTcWiOTlt+Ge7R62IEVuOQQxxG9WDpU+Axbjci+83EYF8wp1ZZDewVoTV2i
	33AggutNvA436SRCXeMO7oFMprkHkh9WEwJU6OGtCe+oNbCHjOlHaki720TmIAvUPWgaLZ5Ys4D
	2sxAzpy5lHBp6azir5eeiZBMAcY2z3SSFmnLs/xcdb/5tePkLKqyXNUvVhKzPak2GhT8Ok3i4xe
	EGpoRiJ++fgZjo4=
X-Google-Smtp-Source: AGHT+IGX2grguxXy8gLo4Q2N5Rw0zTtUivQW6kIzq7+qZBHhu/OTKNSPcrnL7pgVNEyxcTF+JDsc/Q==
X-Received: by 2002:a05:6870:b9c7:b0:29e:69d9:8834 with SMTP id 586e51a60fabf-2aa0609b208mr3769848fac.0.1736434474369;
        Thu, 09 Jan 2025 06:54:34 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-2ad8059e39esm350832fac.31.2025.01.09.06.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 06:54:33 -0800 (PST)
Message-ID: <46653b18-42b1-4511-afad-4f5a15e2fceb@ieee.org>
Date: Thu, 9 Jan 2025 08:54:30 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: remove unnecessary parentheses
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Will Walsh <iron.will.walsh@gmail.com>,
 Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
References: <20250109003624.37323-1-iron.will.walsh@gmail.com>
 <ed70a5d5-8e85-495b-9e56-eae472ba3046@ieee.org>
 <dcf6ec9f-39f2-4729-9250-14eb4d8d2adb@stanley.mountain>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <dcf6ec9f-39f2-4729-9250-14eb4d8d2adb@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/9/25 1:45 AM, Dan Carpenter wrote:
> On Wed, Jan 08, 2025 at 08:56:50PM -0600, Alex Elder wrote:
>> On 1/8/25 6:36 PM, Will Walsh wrote:
>>> Unnecessary parentheses in boolean comparisons make it harder to read.
>>>
>>> Removed the extra parentheses on line 305 for code readability.
>>>
>>> Signed-off-by: Will Walsh <iron.will.walsh@gmail.com>
>>
>> I'm not sure this makes a big difference in readability but I
>> personally avoid extra parentheses unless adding them makes a
>> compiler warning go away.
> 
> It's not a compiler warning, it checkpatch.

I meant compiler "-Wparentheses" warnings, like "suggest
parentheses around ‘+’ inside ‘<<’".

But anyway, I have no problem with this being rejected,
it doesn't really add value, and to some, it subtracts.

					-Alex

> 
> regards,
> dan carpenter
> 

