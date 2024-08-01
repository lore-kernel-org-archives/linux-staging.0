Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8C2132114
	for <linux-staging@lists.linux.dev>; Thu,  1 Aug 2024 05:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722489859; cv=none; b=llk97zXyCB6L9IsA/8eU0zxy6I4sftj+KCHp18RiHIodDAvAS+eSco4EYbj7Wrp2xIVgdGiM+TLjo/a+zscNGYmucVO+EAA2bjsmnkvHcIU6IWHGaNC2Am1ydozRJX9JQwW+u2YsT1Vga/uLMXTFwdrZFLMuu5p5IlhX/hvDtJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722489859; c=relaxed/simple;
	bh=Yomr5iZ2RYuI8MiommezWCszl7V/zyy4FImaVpWSAJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=krJnRFSFA1HoiLqT3V5W529VziD9Ho1KNnCWgiy/srmaLkxEv7xKwloNlR4NHmBtnanrPhR3GK6LvOhpVBs6f3Ip4RhmO7olgIZfWfYygHtVZfhWwhiutsYYtjgmlckOqOvT9k2mUjmwwkHH1w+iEp758DsBNqa8U0OszL2nTJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSATS3X0; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSATS3X0"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a7abaea2afeso59335566b.3
        for <linux-staging@lists.linux.dev>; Wed, 31 Jul 2024 22:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722489856; x=1723094656; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eTCkhYC110sy/G2TV66FBtBgbpExBLZ3KMUjKZM4qT4=;
        b=DSATS3X0cmzGAYWoSqt083fzZLqkw24I7Meh+9J7/yActE2Q3YNY8Q3xZmeVBNCeVe
         A4bWBIiO2pWn8MqV/xDjpplgvr1mkgrY5LO3S8kMdwCWinCvax0KXgd9+BnKhj6tGkHU
         NnMIo00gQdgaznYe0uZBfwmAClTVUATGuCQ0VQz3DMIHEr1ybcDTCfSSqMS3OKrRMXRX
         TR3v3JfjAKG5l85KMWOCfc8+83+gk2iC4yTce7DIFXKY+1XN4UDkb9/bUxPvE9tz+ncg
         XiN6F9sX/bSGIR34eW6FFr+Tbxeith2oNIqKXOHVvrodHt6ChBGZEtrsXuTUOS3iTrh1
         dasg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722489856; x=1723094656;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eTCkhYC110sy/G2TV66FBtBgbpExBLZ3KMUjKZM4qT4=;
        b=RnnoJn2fk7ywSNa6/AI2WZj3Qs9B+mhpCcfDLRBUwRI8Y4a8zu6BBWzNWFTEyfvDry
         dBvYXZJQILR4aegxUNo3VsXLvOffIdaHMtcxJtY2EZe28PACcqEPNjuIt6YvkyjqOfLL
         4ge3ZFh3hVWYfLp2leQzEeCRuKtvf83TDQzvgd8W4cu0koLgUJSOCREuVJCAl2fv+mKR
         NDkqajBQzzTzfUy29F7m2309jsZN9IZM3o9wpxaikO4dA8PJTVUYP6ujVURsBeUs/HCW
         YBv0RhBYT66jpHdJD0oNXzc4Rc9auGjEyLDWp9GLcXsRiWc2Sdt1mC4GR7ru92f6CKku
         sXlQ==
X-Gm-Message-State: AOJu0YxrQKx3AC8W9Mwf+z2pT+iJlkEJcT43406qz19qBSnjr+iA7ZYF
	CWYqkF01OMyzzjIIR80CG9BpM1zw6A3EiAqsZeFC7aLi60WZbLEw
X-Google-Smtp-Source: AGHT+IFlZr68ijykOhEFF19rgRm12fwRwHIyPsAwN+nI1o5ek8oPATxR4OnCVtRqFblnAWDqocOA1A==
X-Received: by 2002:a50:c181:0:b0:5aa:19b1:ffd6 with SMTP id 4fb4d7f45d1cf-5b70159020fmr445985a12.4.1722489855721;
        Wed, 31 Jul 2024 22:24:15 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8500:57d2:826:6de3:1237? (p200300c78f2a850057d208266de31237.dip0.t-ipconnect.de. [2003:c7:8f2a:8500:57d2:826:6de3:1237])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac6377d724sm9628385a12.40.2024.07.31.22.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 22:24:15 -0700 (PDT)
Message-ID: <fd2dc636-762f-4fd4-acd0-a473097406ff@gmail.com>
Date: Thu, 1 Aug 2024 07:24:14 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] staging: rtl8723bs: Improve clarity of MAR usage
To: Manjae Cho <manjae.cho@samsung.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <CGME20240731225631epcas1p2658d1e469ff9339c90542f6dd947746e@epcas1p2.samsung.com>
 <20240731225134.917542-1-manjae.cho@samsung.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240731225134.917542-1-manjae.cho@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/1/24 00:51, Manjae Cho wrote:
> This patch improves the readability of the code related to the Multicast
> Address Register (REG_MAR) in the rtl8723bs driver. It adds comments to
> clarify the purpose and offset of the register, making the code more
> self-documenting without introducing new macros.
> 
> Signed-off-by: Manjae Cho <manjae.cho@samsung.com>
> ---
> 
> v5:
> - Maintain consistent patch versioning
> - Add change history
> 
> v4:
> - Refine commit message
> - Adjust comment wording
> 
> v3:
> - Remove MAR0 and MAR4 definitions
> - Add comments for clarity instead of new macros
> - Maintain existing REG_MAR usage
> 
> v2:
> - Update patch title
> - Improve commit message
> 
> v1:
> - Initial version: Introduce MAR0 and MAR4 definitions
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

Reviewed-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
