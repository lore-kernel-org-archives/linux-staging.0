Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8613A48
	for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 06:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPGYCNA4"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-53db2f8d193so763090a12.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 23:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697956406; x=1698561206; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EKJUErbxOXHZPj/kx1d122d7DJQ0FfNFwOU0fGvvDNc=;
        b=IPGYCNA44pf4pNgNJHCvCpsdHSQDTaKezsdpjfkLCbiKGXQef/XrlN4pcb4p5bZr5S
         gdLS6nfJ+5hzLbvhv3n+IqSNtjD+ZZXcnNlUZtdgDZwGgDfe+daz4tM3/cAipmP3cSTe
         szIVA3Nl+Cv5H45PgaOyCEK1QbtP3wfiBuac/pDeDYU30rjwpWj65uSxlQSOqrT9aTyf
         86i82umk0oXdv7lsXkVpEtYAg1zMK59m2VObDGCphcKk8exg2oCPOx0Z4Sslq4tFLasC
         7e2IPRyDRuG+4BN7GCJ7lsIC0tZjQuNcs3qejfp/nbCYWB35Jktc4IDicLLMKBMldHXt
         lL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697956406; x=1698561206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EKJUErbxOXHZPj/kx1d122d7DJQ0FfNFwOU0fGvvDNc=;
        b=bqWeuM+Cluxr1UD+VHGNcIQlrUI+D/HO6G0MlVnPIBDZrTpZv5Yh0kwvzcu2OnsvlC
         JcaYW4onqxx2JvTg74Y1/JT6pf/qf8a65QzqPt3ng+VVAZiAt02LDloZjuzhW1oKCH+p
         QypHD6DRNPmICOHJx0CA/u7Yb+RQSd+aLwY5d7H8Qp8M29H+7+Lqa8DArSajDvnlk+vI
         FgK+yzwYb/nR1pFCtXdpPiCWoBTjAXhBC947BHgk4SXPNFHDxFK/ihXE9K/C0IrpnBiy
         ogV2+5VT9UWh0lDoXRg8S6JR5sCDhvZb4u81izjfD/O/PF39ZzL+Ytve3wKrPNMd3pk/
         PQ9A==
X-Gm-Message-State: AOJu0Ywlt7JP04qtzTD7LSUGaegWoarPEf7vi6dyECp1Y94kjph6GE2b
	zgap/2ltg1CMmB7UtfBme1k=
X-Google-Smtp-Source: AGHT+IHlp2xaWSq/I0HNXUr0JY8YObAOXsztk/HulJIAXpNgXiXcR3AR9nNhKA6nJdjaaB08yK+66Q==
X-Received: by 2002:aa7:c78f:0:b0:53f:e6a9:5b2a with SMTP id n15-20020aa7c78f000000b0053fe6a95b2amr3158992eds.2.1697956405758;
        Sat, 21 Oct 2023 23:33:25 -0700 (PDT)
Received: from [192.168.0.104] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id i7-20020a50fc07000000b00534e791296bsm4378227edr.37.2023.10.21.23.33.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Oct 2023 23:33:25 -0700 (PDT)
Message-ID: <1cf90dc0-7b7e-4639-b71c-a2a1f7fba11f@gmail.com>
Date: Sun, 22 Oct 2023 08:33:24 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8192e: renamed varaible
 HTIOTActIsDisableMCS15
To: Gary Rookard <garyrookard@fastmail.org>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20231021235305.10741-1-garyrookard@fastmail.org>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20231021235305.10741-1-garyrookard@fastmail.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/23 01:53, Gary Rookard wrote:
> Renamed from Pascal/CamelCase to Snake case the variable
> HTIOCActIsDisableMCS15, HTIOTActIsDisableMCS15 -> ht_ioc_act_disable_mcs15.
> 
> Linux kernel coding style (cleanup), checkpatch Avoid CamelCase
> Driver rtl8192e compiles.
> 
> Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
> ---
>   drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> index 5dca97b07874..8868672131a1 100644
> --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> @@ -212,7 +212,7 @@ static u8 ht_iot_act_is_disable_mcs14(struct rtllib_device *ieee, u8 *PeerMacAdd
>   	return 0;
>   }
>   
> -static bool HTIOTActIsDisableMCS15(struct rtllib_device *ieee)
> +static bool ht_iot_act_is_disable_mcs15(struct rtllib_device *ieee)
>   {
>   	return false;
>   }
> @@ -700,7 +700,7 @@ void HTResetSelfAndSavePeerSetting(struct rtllib_device *ieee,
>   		if (bIOTAction)
>   			ht_info->iot_action |= HT_IOT_ACT_DISABLE_MCS14;
>   
> -		bIOTAction = HTIOTActIsDisableMCS15(ieee);
> +		bIOTAction = ht_iot_act_is_disable_mcs15(ieee);
>   		if (bIOTAction)
>   			ht_info->iot_action |= HT_IOT_ACT_DISABLE_MCS15;
>   

Hi,

please use checkpatch on your patches.

WARNING: 'varaible' may be misspelled - perhaps 'variable'?
#4:
Subject: [PATCH] staging: rtl8192e: renamed varaible HTIOTActIsDisableMCS15
                                             ^^^^^^^^

Bye Philipp
