Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A21257E1
	for <linux-staging@lists.linux.dev>; Fri,  1 Jul 2022 19:59:02 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id a11so3804721ljb.5
        for <linux-staging@lists.linux.dev>; Fri, 01 Jul 2022 12:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VKjYZjtyWMGAgtOQRu2VL2Cr62DJTgW2LkTbwG92hCg=;
        b=C+MTQq4+apcBMl7BgiWqLAHOh7NSZDD0CFIVPxfddtAW14mMHGs0Ioc+hv7hKF3n8E
         eDAvrZJHs9qrMQ5ZmhbFu3ei9BEf82NF51RPm5SUOwdbzDax7HVEygm9OM8JD6GQ0nOJ
         9n7tYpSC45VPI8wrTph7neA0dKddbENGyic3w119+axKiwFEw429WHKgRZeypMsenhPq
         kbSSKHvywE2fVk9KdcN4e6P0W6w3AcDbEyYXmnA2WlJxRCUoZwJfqPADp/RapVF9XPwR
         +rLFJllHOCuAoiOkG2/z9rmAiaZYOgd3+nhaqks1ItsTdveYBSTVpd+QTX0TamDSl4vO
         Ms+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VKjYZjtyWMGAgtOQRu2VL2Cr62DJTgW2LkTbwG92hCg=;
        b=tDSBweVVNANWicPCju5XfqXyGzUNidL75CUrmWUke69TerR5OsBxzMs+wKgEC9cSvU
         RxmQpGX+BUdb16kRugewdTQR4nK2qlbb+pvV7jm8/7BjCsHIY7LtY7bCknt8wAO/LJ1i
         JTJ9q+X9mmbqEg974xv6Sxr0dl+Sp5FShgjClZSsNzK9XCf05GT0+ZksrtotEF60eCEK
         PgZO7xTWQPNbYOx5aZIu69Q2pU05XPf3pbltGMkldCvVSJAlT2Wf2q0EXtIi72HsJJPn
         fdvYMIHLfpRP6MFrU7/ChDcc4X8kzpSIgbPGWZ3muMOTLlQ9kvDSCs2j+gpgEVdcGLiP
         AgMg==
X-Gm-Message-State: AJIora8GBoIr0G1DKrR4Jor3XZdK/4Npw2fOZ/7MTH+HxUQ4VsdTDfP0
	w61jSTXdnaRwE7pFD5CeG9c=
X-Google-Smtp-Source: AGRyM1tFXGQtubcqz/kTqQxPAh+cUZXJFrL2Y6sn1DklEs5NkS1oXEDSXZhJBDobwrXJBo/yQxynBA==
X-Received: by 2002:a2e:9f12:0:b0:25b:ad89:80e8 with SMTP id u18-20020a2e9f12000000b0025bad8980e8mr8600710ljk.145.1656705540635;
        Fri, 01 Jul 2022 12:59:00 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.63])
        by smtp.gmail.com with ESMTPSA id a24-20020a2e88d8000000b0025c05ce1bdasm376669ljk.49.2022.07.01.12.58.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 12:59:00 -0700 (PDT)
Message-ID: <7d763251-c761-1260-b03a-cecf8f6f9738@gmail.com>
Date: Fri, 1 Jul 2022 22:58:58 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH -next] staging: r8188eu: remove unneeded semicolon
Content-Language: en-US
To: Martin Kaiser <lists@kaiser.cx>, Yang Li <yang.lee@linux.alibaba.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220630090937.4983-1-yang.lee@linux.alibaba.com>
 <20220630115848.hkzavd67cwjubjq4@viti.kaiser.cx>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220630115848.hkzavd67cwjubjq4@viti.kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

Martin Kaiser <lists@kaiser.cx> says:
> Thus wrote Yang Li (yang.lee@linux.alibaba.com):
> 
>> Eliminate the following coccicheck warning:
>> ./drivers/staging/r8188eu/hal/HalPwrSeqCmd.c:70:2-3: Unneeded semicolon
> 
>> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
>> ---
>>  drivers/staging/r8188eu/hal/HalPwrSeqCmd.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
>> diff --git a/drivers/staging/r8188eu/hal/HalPwrSeqCmd.c b/drivers/staging/r8188eu/hal/HalPwrSeqCmd.c
>> index b5f6d41464db..5b0f66573d94 100644
>> --- a/drivers/staging/r8188eu/hal/HalPwrSeqCmd.c
>> +++ b/drivers/staging/r8188eu/hal/HalPwrSeqCmd.c
>> @@ -67,7 +67,7 @@ u8 HalPwrSeqCmdParsing(struct adapter *padapter, enum r8188eu_pwr_seq seq)
>>  		break;
>>  	default:
>>  		return false;
>> -	};
>> +	}
> 
>>  	do {
>>  		pwrcfgcmd = pwrseqcmd[aryidx];
>> -- 
>> 2.20.1.7.g153144c
> 
> Thanks for spotting this.
> 
> Fixes: df8d0a55047b ("staging: r8188eu: make power sequences static")

^^^^^^^^^^^^^^^^^^^^^^^^^^

No need to backport code-style warning, so Fixes: is not needed here.




Thanks,
--Pavel Skripkin
