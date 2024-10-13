Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49F613B58E
	for <linux-staging@lists.linux.dev>; Sun, 13 Oct 2024 09:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728810550; cv=none; b=G4p2edymSYnOcgWN/LJEvV2oO0Y/UwYsA6msB6yeh5htRIAcbZmQKhe4PPT9sgFQ4kic2bvSWn3JVVY9zGCbV01DymWZBDlFBn6Kzs1VBmDvZSNA1kikusjZJDlaJFSucpYCsb18SH0n3i2udT0uGT+WicsH4/6XkvjD8JSJg0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728810550; c=relaxed/simple;
	bh=2QFwAmINshp3nFb9f4R52q/8DsxqhGyQw+G+fI/kXEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=baPjqP4Re63XW+58tvb9hY3B5kcKjFfbwNd68ZhXKe/XwItsN+MGTuA1GiVBCjxOx1rkLINhmidgB6HaQXaaD9a3bI3Yq4gG1fNrz0Q+o1vcZCpF5L2X2eb5QeVROtx25NCCdkmJ6GNQtUlWTNLhV18+qtG8L3VsFc4f4HSqKBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S2tY/eoh; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S2tY/eoh"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a99d1b7b5f5so201825566b.0
        for <linux-staging@lists.linux.dev>; Sun, 13 Oct 2024 02:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728810547; x=1729415347; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7BfrRcVJ20ZnXl/B+pe9Sl7RD9b+bmhTOEzMh+q3RBY=;
        b=S2tY/eohnQVYySrmUCR49F+iqLu4a45fhDuCVhEoIyC58eAEKivN3yBkQYWTXvjZHy
         1mfCX1Kd8T9A4nW4aGs9e/HLFz2p/8GJgATWl5pH93j/LIy5A9dDEmDnhxIog77liPOj
         9Kimb26VK5QiZfL61RWF1d+l8MIwyj3OmPUF8d53HsP/7bRBIzvbhO1i0+wd4JZm+2rr
         mwfIMyEr9OZbDUQKGhngM5vsnbc0Lv5z54WAYLbr6+DHbdOocP44cD3xeDknJOfZQ7X1
         09OYVbHdw3vrDI9BL4bcSQRG6/jv3fT2UhiFVj3VkSuSB+f3Uhx4Ur9DbDXhsvfb9ier
         hN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728810547; x=1729415347;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7BfrRcVJ20ZnXl/B+pe9Sl7RD9b+bmhTOEzMh+q3RBY=;
        b=IP9VHvD56e/oiM+R4YsQYKEZRXLP5iK+KrEXNASLTutyYbVsrzzV45tW+nFld8ugvh
         Rz7XnHeEVqBBJ3Osl0ek3TVR0+KSPD3pFhDmKLYFPleoGE7Wc0uzCrUTBZOGG+OR1STf
         1gMBHZLdrG2KQqLrXio/vG2Qf79bqMKuVpc1qilDdLuPH8xjn8mdKwLIrp+GtMnxZhIH
         WfbYgcCLL415A1xJNDCLrz2GagqDFcQ3TqbgS3m1J3QqjghiopDKOseigbM24qSXfMvW
         TLyWRFGHUgHlanaYzp6mXawD6FCS+nNhpfWfgen9dJRyp48tw6dap7f7Y1xalsb2dHvE
         oLeQ==
X-Gm-Message-State: AOJu0YytgOHF+osxXTZ5y5h1YeNPYxgJ6//09hlFLDaNgpuUkJZaC7t4
	hPL/qc4BX8kiAjVNzcYyJuecs9PWRCHYqW7uSgPHJHCGIRHVjHed
X-Google-Smtp-Source: AGHT+IE6t+rDwJ/A3tHo7fWNZk2kIEa7LKUPQ86QgstwCWEnG9Zsqz3YDiE7FPIjIUYpxT6q8MCUrg==
X-Received: by 2002:a17:907:2da4:b0:a99:ffb5:1db6 with SMTP id a640c23a62f3a-a99ffb55507mr161462666b.24.1728810546894;
        Sun, 13 Oct 2024 02:09:06 -0700 (PDT)
Received: from [192.168.0.103] (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99f86fa986sm117128466b.92.2024.10.13.02.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Oct 2024 02:09:06 -0700 (PDT)
Message-ID: <0afd7977-ccee-4d03-9d26-f55822adcbf8@gmail.com>
Date: Sun, 13 Oct 2024 11:09:04 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] staging: rtl8712: Tidy-up *Algrthm variables
To: =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@protonmail.com>,
 florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org,
 ayushtiw0110@gmail.com, dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20241012161638.67030-1-dominik.karol.piatkowski@protonmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20241012161638.67030-1-dominik.karol.piatkowski@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12.10.24 18:17, Dominik Karol Piątkowski wrote:
> This series renames *Algrthm variables in order to avoid using camel case.
> 
> While at it, introduce auth_algorithm macros to increase readability by
> replacing hardcoded numbers in assignments and comparisons.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@protonmail.com>
> 
> Dominik Karol Piątkowski (3):
>    staging: rtl8712: Rename AuthAlgrthm variable
>    staging: rtl8712: Rename PrivacyAlgrthm variable
>    staging: rtl8712: Introduce auth_algorithm macros
> 
>   drivers/staging/rtl8712/mlme_linux.c          |  7 ++-
>   drivers/staging/rtl8712/rtl871x_cmd.c         |  6 +-
>   drivers/staging/rtl8712/rtl871x_ioctl_linux.c | 61 ++++++++++---------
>   drivers/staging/rtl8712/rtl871x_ioctl_set.c   |  9 +--
>   drivers/staging/rtl8712/rtl871x_mlme.c        | 23 +++----
>   drivers/staging/rtl8712/rtl871x_recv.c        |  2 +-
>   drivers/staging/rtl8712/rtl871x_security.h    | 13 ++--
>   7 files changed, 65 insertions(+), 56 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> AW-NU120
