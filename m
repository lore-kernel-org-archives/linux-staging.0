Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335B52C697
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 05:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718168861; cv=none; b=R4UJwK+ZWxZzNQFtFKh9xjzXwFW91Tu+GzcFa4xXmU5iRwr7u6wQ+G2w2ABv5eBQNXYRbqg35pBZqw0Zp3395c75ETSeuTdsosolhVKNQNct6GrDBSoJRQ1YBy9/vamly0KFuAyRX0ZC9dL8hf7p7BDO8CKPdwXCLm/31GD8yKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718168861; c=relaxed/simple;
	bh=WjmktKeZlwW6thj1REFux9X6Fa55rngqfegdZkghqx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P0u6F4NubpVZ/rxkdxnFECypeyYS+T9e0FrTJMKypId1ygeHY5qB2u0CIlh9fwx9wHuxg8b7R5nl2MgvDypMMK+uxJOx8zN/PLECFIbRhcb7J4XL9WGqmqPbtiiqAMLk5cCCSvDmP0gxi6OBbS6AGChC6JiZTafez5jn+1l1iTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+rTcBmD; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+rTcBmD"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57c74085d57so610958a12.3
        for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 22:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718168858; x=1718773658; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qvq+FLhWYryoGqxlyUDGx6ThrzsXpwXKMCWedG+iFXo=;
        b=F+rTcBmDsI2mboPz+ty3ogkBCz4CbX6DtcO5HYt59d+S+di4mBFWl4788NR9vMx29G
         AaWcKlzrPFCAs+8NN4tezZNCf3yamZzeb6j+CzpCzaI3+xxkfzhfYu7bE6pEHlHLLAgC
         eTBdIFw6967xOm3pjyoakbUQZbt/e9kyPQI7i1SoeHcjZ65dG28e8tkTycKdgkxW+wzf
         xZ8DqrhIGn+V71TeptR5ba5FclWm1bSjoGRrvbQU216NtNgRmAEa5bWkjndTd4CTo/Qd
         za7U9ArMWgRxtgRL11on0b2T0ZDVGWU1L9dd14vTC6848OZ6m0qBuzpjbSL378sgQNtM
         9XSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718168858; x=1718773658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qvq+FLhWYryoGqxlyUDGx6ThrzsXpwXKMCWedG+iFXo=;
        b=M5MitSg3zi0TlDsx+MCMGqy8JqmuUdYEX7yMFImucykPQIf7rmuM4ae322PAwT9POD
         YOK9LqKltPFmSLw+A9iNcB8dKUgrb7sHLRkXzubGbMvs5m/k4EtOnhxGLBXiCitc+Btk
         6a2jQ7H9hQkKkN3RznEqBV6z1jPXU+uYHoLVieeBmWX4PA6T+coxZjYbfXZorvQHV58c
         VduC1Al5zO2D/jXUwOokU6ZNbsbWJmtEgqEAwfPVDL+KgP0wfwzhtL9RCa/sspkH69N8
         ZCzWLXKUTD/3SPhVprpCby0QV4SSd8aZGg7Rv6oHN4wKRrnqk8dXxUI9eyk8wfQrLt67
         4lpQ==
X-Gm-Message-State: AOJu0YzGheXY5vr8VXlXxb4MYVdxO/FfGeRtlHWu9xCBHXTlTnClPFGz
	VD1iJey2TGaiTbFWACzeZUKA2HSmp2Fd4fD0N1FqDeTyT7YxAgkdk2RJ6w==
X-Google-Smtp-Source: AGHT+IGYL/xS9J6m/swK/Sj5RpwgOawzjyVI55GlBqI24z3BUWgiiKtGTAGXgwiptkMdyimmZp3/hw==
X-Received: by 2002:a50:d591:0:b0:57c:710b:22ca with SMTP id 4fb4d7f45d1cf-57ca97497camr410101a12.1.1718168858109;
        Tue, 11 Jun 2024 22:07:38 -0700 (PDT)
Received: from [192.168.0.101] (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57c8f3a0c33sm2959245a12.82.2024.06.11.22.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 22:07:37 -0700 (PDT)
Message-ID: <f849b64f-eaf4-46ca-b4a0-039fd0f6f2e7@gmail.com>
Date: Wed, 12 Jun 2024 07:07:36 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8192e: add missing MODULE_DESCRIPTION()
 macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240610-md-drivers-staging-rtl8192e-v1-1-b5d11ee98297@quicinc.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240610-md-drivers-staging-rtl8192e-v1-1-b5d11ee98297@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/11/24 02:33, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib_crypt_ccmp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib_crypt_tkip.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib_crypt_wep.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>   drivers/staging/rtl8192e/rtllib_crypt_ccmp.c | 1 +
>   drivers/staging/rtl8192e/rtllib_crypt_tkip.c | 1 +
>   drivers/staging/rtl8192e/rtllib_crypt_wep.c  | 1 +
>   drivers/staging/rtl8192e/rtllib_module.c     | 1 +
>   4 files changed, 4 insertions(+)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c b/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
> index cbb8c8dbe9b0..da9e630b594c 100644
> --- a/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
> +++ b/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
> @@ -407,4 +407,5 @@ static void __exit rtllib_crypto_ccmp_exit(void)
>   module_init(rtllib_crypto_ccmp_init);
>   module_exit(rtllib_crypto_ccmp_exit);
>   
> +MODULE_DESCRIPTION("Support module for rtllib CCMP crypto");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/staging/rtl8192e/rtllib_crypt_tkip.c b/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
> index 0244b524a7d4..3969b6b916ed 100644
> --- a/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
> +++ b/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
> @@ -708,4 +708,5 @@ static void __exit rtllib_crypto_tkip_exit(void)
>   module_init(rtllib_crypto_tkip_init);
>   module_exit(rtllib_crypto_tkip_exit);
>   
> +MODULE_DESCRIPTION("Support module for rtllib TKIP crypto");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/staging/rtl8192e/rtllib_crypt_wep.c b/drivers/staging/rtl8192e/rtllib_crypt_wep.c
> index 21c2b7666d6f..eae75d122553 100644
> --- a/drivers/staging/rtl8192e/rtllib_crypt_wep.c
> +++ b/drivers/staging/rtl8192e/rtllib_crypt_wep.c
> @@ -238,4 +238,5 @@ static void __exit rtllib_crypto_wep_exit(void)
>   module_init(rtllib_crypto_wep_init);
>   module_exit(rtllib_crypto_wep_exit);
>   
> +MODULE_DESCRIPTION("Support module for rtllib WEP crypto");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/staging/rtl8192e/rtllib_module.c b/drivers/staging/rtl8192e/rtllib_module.c
> index e7af4a25b0be..469a69726c16 100644
> --- a/drivers/staging/rtl8192e/rtllib_module.c
> +++ b/drivers/staging/rtl8192e/rtllib_module.c
> @@ -175,4 +175,5 @@ static void __exit rtllib_exit(void)
>   module_init(rtllib_init);
>   module_exit(rtllib_exit);
>   
> +MODULE_DESCRIPTION("Support module for rtllib wireless devices");
>   MODULE_LICENSE("GPL");
> 
> ---
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> change-id: 20240610-md-drivers-staging-rtl8192e-0935b6c4b336
> 
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

