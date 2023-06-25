Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F86C63A1
	for <linux-staging@lists.linux.dev>; Sun, 25 Jun 2023 14:07:52 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-51669dd574aso601658a12.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Jun 2023 07:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687702070; x=1690294070;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6KAgxZ0e/Mp+Alk75/mq17h2w55B+c/Iz4lU0v72Yh4=;
        b=PFp3EHAt2PBxlImJsgnh+F8Xx+hMxzHe9RhLPTiZP0MHwIu5RsP+NjKY1O/2cvatUD
         AjYe6pdQaMUEEr8Mg3sTpAn7Y8LJalbxGSK6rgX9CAXRzeJhOPPUuHmkUtplO9I7wmsl
         +cC+cnRVSXRHrA+MQUdOWPlIRU7SNMiUA8Sj5Q6+MRb0xiZowHcA4KsZw4yqgk20gG4H
         hrcc/IpzfUUYSfvgEiRSWkSY8sLuEdaNLuJZY8jlPLX7al3SRSbyoFz/PKxvhhwbEU9v
         lYUyDHTpZgsfLsWRHa6bT8tXJZSS2riJbKFAwJ+fmVgimrtNf8uI0ibF2ApwyirYSReZ
         kXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687702070; x=1690294070;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6KAgxZ0e/Mp+Alk75/mq17h2w55B+c/Iz4lU0v72Yh4=;
        b=WGXHPU/flutunK/O4V22YD9Cd1qTM0GDaN+vl6Vsq0Kdtr4X5TW1YVYmPX0HyIaYQt
         4wulgFU2IzfrAetH208v0MmAaKpAFGyrWg5zgyJqEvNECbDaNvM6w0dtcMYurwxaQkin
         825hjrR0zIoBRoTFNH5QTycQLBJ6m1MBm3Ge4QsA3QVj/iqiQmv+EznVAIXB8srwaW+f
         Tp0khe6PKHKy23ghhXGtf2BKWmK3vCE/b17B2OkLrEvsNg5QBq95GHz3VyHPvlVkdxFO
         GaF+CmYMBPVUBrsAy39AAPj30scN1bsiaaQpI1WJIA8Tlg4Lwqy+yhSvqXT/JHeXcL8I
         lwHQ==
X-Gm-Message-State: AC+VfDx3Djta4kNxqOq5S8ZZyIqQSfCUZHhIy2liiU0/jwyfEd555tZs
	S3lPJGf/LOh2h3sZC45TgJ8n9yvk4zc=
X-Google-Smtp-Source: ACHHUZ6PHGAqmN3NnuYXAL4lX7muOsXomV/604xi3w5sRHNlXFpa+ue5yDJP1FuYYRrWx7rtjrCy/A==
X-Received: by 2002:a05:6402:27c8:b0:51d:9611:db3d with SMTP id c8-20020a05640227c800b0051d9611db3dmr1093359ede.2.1687702070294;
        Sun, 25 Jun 2023 07:07:50 -0700 (PDT)
Received: from [192.168.0.101] (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id w3-20020aa7d283000000b0051a2edb49b0sm1783713edq.63.2023.06.25.07.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 07:07:49 -0700 (PDT)
Message-ID: <ec2fcc62-90b8-f106-958a-7e1eb27009e3@gmail.com>
Date: Sun, 25 Jun 2023 16:07:47 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] staging: rtl8192e: Rename function HTIOTPeerDetermine to
 ht_iot_peer_determine
Content-Language: en-US
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
 dan.carpenter@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <ZJdagUiGPqzb5lp+@tacos.darkphysics>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <ZJdagUiGPqzb5lp+@tacos.darkphysics>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/23 23:05, Tree Davies wrote:
> Rename function HTIOTPeerDetermine to ht_iot_peer_determine in order to
> fix checkpatch warning: Avoid CamelCase
> 
> Signed-off-by: Tree Davies <tdavies@darkphysics.net>
> ---
>   drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> index f9fa3f2bb728..33fac7d9ada8 100644
> --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> @@ -164,7 +164,7 @@ bool IsHTHalfNmodeAPs(struct rtllib_device *ieee)
>   	return retValue;
>   }
>   
> -static void HTIOTPeerDetermine(struct rtllib_device *ieee)
> +static void ht_iot_peer_determine(struct rtllib_device *ieee)
>   {
>   	struct rt_hi_throughput *ht_info = ieee->ht_info;
>   	struct rtllib_network *net = &ieee->current_network;
> @@ -720,7 +720,7 @@ void HTResetSelfAndSavePeerSetting(struct rtllib_device *ieee,
>   			ht_info->RT2RT_HT_Mode = (enum rt_ht_capability)0;
>   		}
>   
> -		HTIOTPeerDetermine(ieee);
> +		ht_iot_peer_determine(ieee);
>   
>   		ht_info->iot_action = 0;
>   		bIOTAction = HTIOTActIsDisableMCS14(ieee, pNetwork->bssid);


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
