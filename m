Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BC2381D5
	for <linux-staging@lists.linux.dev>; Wed, 31 Jul 2024 19:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722454685; cv=none; b=RQ1ap1Kl6gykYbDZeblGNb9EtqzkdTL4wBkRk4OF7AlDSB+N7ciynR1b1a3vR6+XbZLO8v2a4b3cP1qr/L5fKnqPD2+HAOb6pphWH/dWATPN83i7x4A60ptPRjAMgrjP4fhM2/LFMmx+j4Sc8A9h9mKNZ0Ru2WqqT+1P3Qyj8Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722454685; c=relaxed/simple;
	bh=dSb8vVCLtvBwVy0nW+BM0SMjTiQyTQKs//IgzE0RTUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WWUgP8UTtdsZ54J85z+nSJbvUk7p17v7t3fON+rlLylxCwwn30VEhfIYmxBoT1A+pWknDktztTsrQ3FHUtAIJ6zcgD88T1AJNg+TjsyGlP0xXBnbEjxsSLPGOu8Spyb5cOYO8dLyAT5oqFRZ12q9n4JYYUWxEYj8OjLPhxetBFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d05huEVl; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d05huEVl"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ef302f5dbbso5970001fa.2
        for <linux-staging@lists.linux.dev>; Wed, 31 Jul 2024 12:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722454682; x=1723059482; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=72sAWVBR8h+gUQRIaEFVlfyy2iR2XsX6552mwHwwfZo=;
        b=d05huEVluUjv646rrAiSujlzpURD5tPErACiC/VAyiu8Wi0qg0Y1Oxaae7sLfssULm
         tyyiHxO/BLe3k87iFBC/iZn0I/ivllWoaoOVxoPzIVJve0BA4akeK+lVjiKFiWufI2mH
         myhPrIm1ygL75j7o5SOpokK5AWtxhEUOsAvaHXcGZSEpciEo/RbEeNdwrLZSDQJUssh1
         203ud+zSTOhpjg+hK7ganLrOTFRxSmpUBGawMyhHqSYgYNrSGdMVEnWqiV6+ETJybSO5
         C8Z9qegfZAOef2iqPOOwQEIgMFOyTmzqPfzocO2mZ1VXn77Cy5bBh4MfKEH9jKW594Ev
         YTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722454682; x=1723059482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=72sAWVBR8h+gUQRIaEFVlfyy2iR2XsX6552mwHwwfZo=;
        b=HOVhnpAk+mCJc0D/hlgho/2MdSScykozBdmIGXRFbOtjNQYHdE1ecrmJU3Q0sQDNRo
         2nxEyWWj/ufL0JSBvIfE3Q4IeOyNnnLhNDM09hq2e3EjYYL9tpiwQ8sZ28TnEsRjnFlw
         6HAlLizzb/FSncu4fROUit9SuCXp0/P5QSRO/So3fgkGFOBKWZsquEh5yNFNxJVf5+Po
         USvXsX0zc+f2Ej4c0xRKCoBivitr7iuSuzWtpKm7KEx8zD38H0i/TvNCGjdFJDsFUXug
         9Cx1Omm8Umd8Z0DVJkVL8N835jlDwRyHcmfdVFSgMdHhe/JooVMLs+zGFpZGCna28a52
         06PQ==
X-Gm-Message-State: AOJu0YwHx/X5pM0mLFGM+iQAmU11x8b7abCwXwh1fKTwgZ4gdcPssqfr
	smL/VGK5uOp5QFS3lWp4HCNKbI2IeQ8mG1hGhYIauv+GeaR8xoo0
X-Google-Smtp-Source: AGHT+IFX5EBt208JIlRQZNgRtMb35uf1gZ2AWx4Ej3RVS/mj0n7QNgKL7UUCQ0rbAcgcHJYP0DaOyA==
X-Received: by 2002:a05:651c:b27:b0:2ef:315c:67e1 with SMTP id 38308e7fff4ca-2f1532e7c89mr2091761fa.4.1722454681414;
        Wed, 31 Jul 2024 12:38:01 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8500:f3cf:8e28:7954:b203? (p200300c78f2a8500f3cf8e287954b203.dip0.t-ipconnect.de. [2003:c7:8f2a:8500:f3cf:8e28:7954:b203])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac63b59c95sm9188229a12.50.2024.07.31.12.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 12:38:01 -0700 (PDT)
Message-ID: <8f82f816-b677-4f6d-b381-d25f0bb04521@gmail.com>
Date: Wed, 31 Jul 2024 21:38:00 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: rtl8723bs: Improve clarity of MAR usage
To: Manjae Cho <manjae.cho@samsung.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <CGME20240731081603epcas1p1d140964329ddaf9146bacb6bd1111506@epcas1p1.samsung.com>
 <20240731081540.912533-1-manjae.cho@samsung.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240731081540.912533-1-manjae.cho@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/31/24 10:15, Manjae Cho wrote:
> This patch improves the readability of the code related to the Multicast
> Address Register (REG_MAR) in the rtl8723bs driver. It adds comments to
> clarify the purpose and offset of the register, making the code more
> self-documenting without introducing new macros.
> 
> Signed-off-by: Manjae Cho <manjae.cho@samsung.com>
> ---
> 
> v2: Add comments for clarity instead of new macros
> 
>   drivers/staging/rtl8723bs/hal/sdio_halinit.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> index c9cd6578f7f8..535cd439121d 100644
> --- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> +++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> @@ -380,8 +380,8 @@ static void _InitWMACSetting(struct adapter *padapter)
>   	rtw_write32(padapter, REG_RCR, pHalData->ReceiveConfig);
>   
>   	/*  Accept all multicast address */
> -	rtw_write32(padapter, REG_MAR, 0xFFFFFFFF);
> -	rtw_write32(padapter, REG_MAR + 4, 0xFFFFFFFF);
> +	rtw_write32(padapter, REG_MAR, 0xFFFFFFFF);	/* Offset 0x0620-0x0623 */
> +	rtw_write32(padapter, REG_MAR + 4, 0xFFFFFFFF);	/* Offset 0x0624-0x0627 */
>   
>   	/*  Accept all data frames */
>   	value16 = 0xFFFF;

Hi Manjae,

may be this is version v2 of this patch with this subject. But the 
version is not about the subject. It is about the code change itself.

So I can see that this patch was send in with the following subjects:
[PATCH] Improve MAR register definition and usage for rtl8723
[PATCH v2] staging: rtl8723bs: Improve MAR register definition and usage
[PATCH] staging: rtl8723bs: Improve MAR register definition and usage
[PATCH v2] staging: rtl8723bs: Improve clarity of MAR usage

To me the last patch should be a v4. The next patch you send is the v5.
A change history is expected.

Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks for your support.

Bye Philipp
