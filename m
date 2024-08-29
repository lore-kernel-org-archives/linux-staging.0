Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0455A1922FB
	for <linux-staging@lists.linux.dev>; Thu, 29 Aug 2024 11:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724931227; cv=none; b=DQgM2WArQUeMwpgk1/cp3hbAa6R6FWvRpJ7j741tIZdkGLuLnN73RszCd5T8Im00Ytn48B933M7TdtiYRpzyyj2BmPJjqGfEGRekiBZk93uOjH0C84WKHxBXvvJ7U/RZ+/fCrPVobkuTqhHA1hdhNp9qt/d7TDsbXULhDfX1Zt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724931227; c=relaxed/simple;
	bh=hV5buY2hB1xlUtDfHGx86HK7OMn1QR37YqmoagJMy/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FmwT1h2nEtv7Hlb/6ifjEOUq4X9kgk6y5gCTc6HdAkPRCX3gmNG6YAbYeOFrpB/Bi78HbLh/P9xgvsu1OmnVFIFDOSTD0m5q0L5B/QGXSFRjJX2ddAxOVd7usD9Wnb1MG+E+UU+Ifb+QklFOjk5SJM+eI/YSnTfWZUGmkmZcC0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdHOJVV0; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdHOJVV0"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2d3b595c18dso1211758a91.0
        for <linux-staging@lists.linux.dev>; Thu, 29 Aug 2024 04:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724931225; x=1725536025; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hV5buY2hB1xlUtDfHGx86HK7OMn1QR37YqmoagJMy/s=;
        b=BdHOJVV0245gB9ZonGxFf1pWTeRgQ7zEu+MY/wspBFoFhe7G117bl/VjoriiCGjr9J
         J9fIq5UXhucn7jFDS9a049DNUGYTI6hyyLxp+kjw97f3N24yUv0Lx9Cu92XkF6lsxPVt
         zqLByma0fdRNaebErPvAw+FbxgBpHQrWVOnkuGol2/3arSo5NdKhCREzSzcqz56T2UR4
         yUhyAd16L0nCf2xf7ZkQSteES/TWc0bZ0SdHmKf00CxOsVUaOkgFo4BwxHVX6Lov9eQb
         oQ04m/44FnSbqqefuEuMuFCkH8K5VAbCfYFvjwUfyO2GjdgOKQLve5zu2LgoFTso9Tcr
         Eirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724931225; x=1725536025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hV5buY2hB1xlUtDfHGx86HK7OMn1QR37YqmoagJMy/s=;
        b=Iz4bGTko2XpWs//afYzWevHp3CEm6JcuFl80TtymblEydYHJvdr+wu/uLLFoohJNGQ
         +cgEA7rKrVnWb4vUus87za8p340vrqLqPEAcY1Ja7PDIJkmac18hNJkX7elVFRKNPj69
         9CimR0g1OvpEQYL1zClG7Ib+gjSwQrtjT0C53oR5AEM1R3qKtWi5243nw1Kj8jQlSE9A
         NjVBuW3wvTnUH11OHE7qb22o8UPmTSObdn6ZYX6APcegpF/RwZFX3ciIryHUwp6Oa+xM
         Q1QwH1fA2OkKKrCEQs1lU8ftSm+lgP4WoMYZP1teuUZQOBQfZi3dp+r2e0+0IUcmwIyU
         uIRg==
X-Gm-Message-State: AOJu0Yy9IGt1eJ0N9nJc3AER3e1ETNGZCOf9sebx7JnvOjlR0MpV63I2
	KwyfpZczoI1lnT8mHuaU8sUPYz/MnvXIN4MbnvNzLmP2m3os7oz+
X-Google-Smtp-Source: AGHT+IHOPdsy0r/rCNiC/mlv05mzznubKK0H9FJgAuRtJqkeD2kv2ZZYLr9eAAiBjN594n/R8zCs9Q==
X-Received: by 2002:a17:902:d481:b0:202:2e81:27cd with SMTP id d9443c01a7336-2050ea14504mr37998215ad.26.1724931224907;
        Thu, 29 Aug 2024 04:33:44 -0700 (PDT)
Received: from ?IPV6:2804:14d:c098:8bf5:58c0:549d:d99a:c399? ([2804:14d:c098:8bf5:58c0:549d:d99a:c399])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e55a3b61sm941582b3a.48.2024.08.29.04.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 04:33:44 -0700 (PDT)
Message-ID: <8c1960d3-8f0b-4505-99aa-8af55685bbb3@gmail.com>
Date: Thu, 29 Aug 2024 08:33:41 -0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8192e: Fix Assignment operator '=' in
 rtl_wx.c:681
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 ~lkcamp/patches@lists.sr.ht
References: <20240825161335.21737-1-alienwesley51@gmail.com>
 <2024082916-savings-upstage-9606@gregkh>
Content-Language: en-US, pt-BR
From: Alien Wesley <alienwesley51@gmail.com>
In-Reply-To: <2024082916-savings-upstage-9606@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/24 06:52, Greg KH wrote:
> On Sun, Aug 25, 2024 at 01:13:35PM -0300, Alien Wesley wrote:
>> Separated assignments for pairwise_key_type and group_key_type
>> in order to silence the following checkpatch warning.
>>
>> CHECK: Assignment operator '=' should be on the previous line.
>>
>> Signed-off-by: Alien Wesley <alienwesley51@gmail.com>
> Please do not put line numbers in the subject line.
>
> thanks,
>
> greg k-h

Should I fix up the subject and resend it as v2?

Alien Wesley
