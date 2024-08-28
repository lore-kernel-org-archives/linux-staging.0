Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92001AB530
	for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 18:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724871223; cv=none; b=sF/r2A9NlDxlYPlJexJz2Ce4PhScEZgjBdr7tVKCWDL1fPZH+2hv0fbUoAY5i0BCE0tlBJyobFxR7bUBiVd5yC1C60nRPzk02K3TO+5dCJMzatKvWNvoeYkwsfH0JIPOea40DvNicvN51C0VSQO64l4V5VpfEtuxFNOTiNG5J+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724871223; c=relaxed/simple;
	bh=mWWhHr5FhcCsGIpe/vAFA3YyUUBlhickxBm3OS4+PxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sL1GRuGoXYjCgS/xfkm0Tu4aC9CIk7P8+XbgNzDCr7jrizx75POC+EXlTjLmk4HJtOREr8aTfDUDZdJJncUcglAm/zQ7CsOGf+JSpG2GaZO483lRNh2D+ghwkC4V6x3E+YF5k5v1NadZXaXzBBJoiQiBFmh2ZHGJyR3vWhlNcvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MyoWe9xL; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MyoWe9xL"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f4f2868710so71562331fa.1
        for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 11:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724871220; x=1725476020; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XS+8S0ryMFAMWQssmQoYU8z7iU7cHo9/4lod3SR7u64=;
        b=MyoWe9xLd8gPrqWptJu0bURLtME1xWMNEHBeiZDWwPOzbKMbVzbOPZCLLmongRfEWs
         53hsZmXJlUL5eIb6LlEeFAFlJ8yNcnzw0ztF0eyRWp0IUWdAg2oeaG4Hhvodr3DiDRAs
         Wd+pqsgEP2BelkTGIy2hlUVD4RdrooB/SqKy08rjIsmN9wO0hXZOyfw5XKCRO7t7gpvV
         ofMgCqKIlApofr29GjQeYHYkoOjwhp6VhkYq5jk0mcT7wdkIThbTH0y6qwzyDkrMdVjn
         7hzMlpSqBVfUClk1b62fMsfR89DG/vxp89UD9UPMUGZC3Md/BMQvhPBs0611E/udyjUc
         XiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724871220; x=1725476020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XS+8S0ryMFAMWQssmQoYU8z7iU7cHo9/4lod3SR7u64=;
        b=in46ZnWGZLkfjkbH1uL8e1l+W8QyDmQPzcIeRf2Hjyn7yu5HNVi57b9HSKFLEbo7bc
         j805SLIp19+o4IVXlGyiE2rrlMhszENOrSBKUxFfT9ShX1Ltvnvy3WT+H1uvXuKH5Xpq
         3fIhfXGVwMlP0CLAYBlMmkcUMzdI/6OVj+Zh5sM9OB9rYdFhgsefUmY4Dmd92GRjsc/3
         JVxni6aSmbThKWbAlMhnNvvPlOb6TuXxo0R3mG6X/J5qGLNrqzVdUlj6lw2HOZSiTsFa
         L/LXYg/Vz89JkKz5M9jLLLJ56dOLakQwJ0jASyH42fnYaU4Tkh/JmXlWpa1tOrT9g0sw
         j6lg==
X-Forwarded-Encrypted: i=1; AJvYcCWbNCE0ZYGU27RdxVXKvOiyuIdttNwsYEJD5ECaUCvZ0XsQSAi7lCwqQe7I63jlw2f8iu758BuCuJ1415Dl@lists.linux.dev
X-Gm-Message-State: AOJu0YwEVTr9zrU44FOXRwgLv4zMSMdRn+RAM8ADghPMDGmgJex3996G
	hc7bOhDkK3s/+y0iRUFllZDNc+ODNyTa94uGOWDQMNjFIfD5mcA8
X-Google-Smtp-Source: AGHT+IGG1KK9bNlqKjmboXudHmFDGuox8xPH09r64BmCcLIP8gPu76NJnOkXeQjD/ZJEV/1LrvnSPQ==
X-Received: by 2002:a05:651c:2221:b0:2ef:2525:be90 with SMTP id 38308e7fff4ca-2f610922d15mr4064731fa.31.1724871219235;
        Wed, 28 Aug 2024 11:53:39 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8553:4dd4:7649:c4c2:f4e3? (p200300c78f2a85534dd47649c4c2f4e3.dip0.t-ipconnect.de. [2003:c7:8f2a:8553:4dd4:7649:c4c2:f4e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c0bb21975csm2593766a12.57.2024.08.28.11.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 11:53:38 -0700 (PDT)
Message-ID: <efe13a61-1607-419d-b330-9a7061511719@gmail.com>
Date: Wed, 28 Aug 2024 20:53:38 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] staging: rtl8192e: Fix parenthesis alignment in
 r8192E_dev.c 325
To: Nilo Alexandre <n1lux.comp@gmail.com>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 ~lkcamp/patches@lists.sr.ht
References: <20240828011842.67611-1-n1lux.comp@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240828011842.67611-1-n1lux.comp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/28/24 03:18, Nilo Alexandre wrote:
> Remove linebreak to improve readability
> 
Hi Nilo,

please end the above sentences with a ".".


> CHECK: Alignment should match open parenthesis
Why do we need the above line?

Thanks for your support.

Bye Philipp
> 
> Signed-off-by: Nilo Alexandre <n1lux.comp@gmail.com>
> ---
> v4: Remove linebreak to improve readability
> v3: Fix typo in commit message.
> v2: Using tabs instead of spaces.
> ---
>   drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> index b25e83743956d..a80efe6c7c209 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> @@ -321,8 +321,7 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
>   
>   		if (priv->epromtype == EEPROM_93C46) {
>   			if (!priv->autoload_fail_flag) {
> -				usValue = rtl92e_eeprom_read(dev,
> -					  EEPROM_TxPwDiff_CrystalCap >> 1);
> +				usValue = rtl92e_eeprom_read(dev, EEPROM_TxPwDiff_CrystalCap >> 1);
>   				priv->eeprom_ant_pwr_diff = usValue & 0x0fff;
>   				priv->eeprom_crystal_cap = (usValue & 0xf000)
>   							 >> 12;

