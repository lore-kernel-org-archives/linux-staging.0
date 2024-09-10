Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85B1745E4
	for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 05:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725946563; cv=none; b=ZOEhwFgBSeAQGApE/HK3lj3E6BXdRfmStr+O6v1Zj5of/HJ3wQN6Ro1L1nUDuDP3KjwYrB72U6hJz6i6ZY4EP4PAGmqh37PpGHl9bZ0aOsj6vq9vj0BQnmskOyfsJTdIqlEdRhDDdoVEkcBzn0Ws+1UXP0XirBugbcgEr4EODZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725946563; c=relaxed/simple;
	bh=/qC3d5HW+DGJD/g6O+fEv4NuAihwErpe5X6U3mHLd7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bWNQgvdSywKPJBTAOfAqIV7kuwHuftEmaN2xur3t0+Ke7phf3QHwguzI3z4vclvS31C/Abz/7VQEkqG0bwdw1tGlNFN3XMqCj5l1vb8Za16MPBzXEVvBI7zY3RKeUkFCoIdteEeR2hEtolxbyh8s8dOhHnIhxFO57gZ0wU9Y9NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M7BfBDXy; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M7BfBDXy"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a8d29b7edc2so377326066b.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Sep 2024 22:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725946560; x=1726551360; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rob6GRXtYDNA7DhHsgmiePqlSPWTvJEWrfOPcbfODMo=;
        b=M7BfBDXyzWU7AlWY3y4YPxo2xJ3aQ/yM5DgLTOXjVcvZQ5bR5Q+3k2RALbIRWsZSyv
         SiP10MXxcn+9pBkf+68GO8+26C+15YScUAB259td0ZdwQNRQ3kr06C81eWTJTqJEylK6
         gXBwxj9g+uTG4wCEmRvtaj7uPfWx8ztQNsmvX89OTEducGk4j7iQQZamcArpRB/U7Iva
         dWJ+iQL9PWuoWiygwVb7yRTpz2PTcDPtLZVZAZh5EthKS/Ne708A6O/Qe6tY4y1qUzCy
         N0Jmtr4a9Mt8APvUXDlyDwGtPHIfoZN5e5eWFuqWkMeVyV6pC6lxXQwbKaYqgK+V1M/O
         GCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725946560; x=1726551360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rob6GRXtYDNA7DhHsgmiePqlSPWTvJEWrfOPcbfODMo=;
        b=ghnqD1HlhYdaZ5ADFVgDX3Rkdjva/pNB8Lruw4T7fCiKL0tQmKgsWnCkla4si1f/pw
         JvHVdqjirCSVUHjB2Xy1RSWGnQLXMJo5JqSgEGRDGDtGCLbRCGJmuESWZMUt8rs010ui
         3fzB/cp45FE+0tdaCPyS+wzWao6TcHLgTC40SjFijwtfA8zt5489gMiwDOX0IBAOxfnK
         JxBcpZBFReBQLRPIZd3kreifz5poUo8C0kmbTKWwrvifhqgzR+TwsUAwrbyukhhmDBtS
         PhhFibdY5jp3ZuU0FrZ11dALdF+wh182RvSrF7mKMvbIOIiShR0++JmFxrDA3vYNGYyu
         0gCw==
X-Gm-Message-State: AOJu0YzwE2lSIfugAynkzZq3Z460qfNI6qQ5sGH2G6zBt7DDARQdT6RV
	8KucFWRSN4nAr+Ey485iHmJVkSslIoeotR5viJaX60/NFSVq+ooB
X-Google-Smtp-Source: AGHT+IEe9Pz6RHgUxmA7q53brln0aZhwJ16V895i0+mEtPsa6gF0H0ro6Xl/FUkvGVPIUAnf1uGN9g==
X-Received: by 2002:a17:906:dc8c:b0:a77:d52c:c42d with SMTP id a640c23a62f3a-a8a885bdfccmr1189339166b.13.1725946559741;
        Mon, 09 Sep 2024 22:35:59 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8598:b80c:2d4e:9a81:3f29? (p200300c78f2a8598b80c2d4e9a813f29.dip0.t-ipconnect.de. [2003:c7:8f2a:8598:b80c:2d4e:9a81:3f29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d5dc97sm430359466b.212.2024.09.09.22.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 22:35:59 -0700 (PDT)
Message-ID: <6e2d4e6f-1587-474c-8730-482e702f1dbe@gmail.com>
Date: Tue, 10 Sep 2024 07:35:58 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] staging: rtl8723bs: Fix spelling mistakes
To: Roshan Khatri <topofeverest8848@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1725933169.git.topofeverest8848@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1725933169.git.topofeverest8848@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/24 06:03, Roshan Khatri wrote:
> This patch series fixes various spelling mistakes in the
> rtl8723bs/include/rtw_xmit.h, rtl8723bs/include/rtw_io.h,
> rtl8723bs/include/rtw_mlme.h and rtl8723bs/core/rtw_xmit.h files.
> This patch series is created after receiving feedback on
> individual patches.
> 
> Roshan Khatri (4):
>    staging: rtl8723bs: include: Fix spelling mistake in rtw_xmit.h
>    staging: rtl8723bs: include: Fix spelling mistake in rtw_io.h
>    staging: rtl8723bs: include: Fix spelling mistake in rtw_mlme.h
>    staging: rtl8723bs: core: Fix spelling mistake in rtw_xmit.c
> 
>   drivers/staging/rtl8723bs/core/rtw_xmit.c    | 2 +-
>   drivers/staging/rtl8723bs/include/rtw_io.h   | 2 +-
>   drivers/staging/rtl8723bs/include/rtw_mlme.h | 2 +-
>   drivers/staging/rtl8723bs/include/rtw_xmit.h | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
