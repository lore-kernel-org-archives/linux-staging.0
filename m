Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BA55A7D
	for <linux-staging@lists.linux.dev>; Sat, 10 Sep 2022 19:29:09 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id m15so8291287lfl.9
        for <linux-staging@lists.linux.dev>; Sat, 10 Sep 2022 12:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=oOdTLog1ww4+Rwiwa3MAUwOOPiXVgt0XEL/X6i9LfOQ=;
        b=WGCl8V+AXHCnsZ/XXjoZRsoOxyOF1hPDc4jVXjwgWrr7B9vtRqexou1Mty3/Lgnedg
         1KyAamL9bu2qFziYV6GgJM1W94yun4ly9cVtEKevrICOvCBEAfuxHESke580tKKtqVEC
         PkTG4GUUJVjcVudGWGvstPLeUnVh/gh3nRZE/s6oRPosQ+FTSV+VTUPF5N0iz20rgZOZ
         nZO3cyEFxB4pMb3n80UmRLvW1JRJ3i5rIZLMfyoYMOIwfc6ubjDnz4dZMPzu+6FM3d+v
         leaiErteasjlKd8OcSOTN1bQ0TeCv/fGfe/OuIVOapfHWMEGzdGJMUT9tlCkq4xS2k0N
         H8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=oOdTLog1ww4+Rwiwa3MAUwOOPiXVgt0XEL/X6i9LfOQ=;
        b=THrSJGQ7anaCFE61NsWsaTBwe37VBfIsMKD/gV/PxlOOu79psceIk1+xeItWLKChPc
         lLHkefdn/Fet1kAyuRcunZVrQ7zQDQXePW6MgWcEKLELncI2yHg5RvVfPKPDLONtlOD4
         UT6zCscNCM+fecYIGIZXVJIIpmq1Ct8SZlbDslH+d+lM+ZLURFVnF/qKKBIb/ULRfSWc
         dQeTWszvn9jVN43rYM8f1V3yxa51x46pROYt94R9XIfmzD2ptgop0l460Dqns36lmUSn
         AiY9hRyglYFqeSKa7UBpnLPBgTAn4lagxWSvEIpR0dUIqTbPECqmHE0rNX8LxxpBjiPU
         PoMQ==
X-Gm-Message-State: ACgBeo2r0xBbTxjFA0NdyOe5Klk0dboJ5ejfWcfaRI3l85db/byOe7Gj
	5gVGrxpsQa1Npqhi6saKQRs=
X-Google-Smtp-Source: AA6agR7jcY3FAyjxtezWbgMGBh752c3IXRZnmhtVH/5q4ruz/GBmFkF2o0smgP5hdwm93W53pcbc7Q==
X-Received: by 2002:a05:6512:3984:b0:499:b142:9a52 with SMTP id j4-20020a056512398400b00499b1429a52mr1108383lfu.253.1662838147458;
        Sat, 10 Sep 2022 12:29:07 -0700 (PDT)
Received: from [192.168.1.11] ([217.117.246.58])
        by smtp.gmail.com with ESMTPSA id i24-20020a0565123e1800b00492e5d31201sm353098lfv.7.2022.09.10.12.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 12:29:06 -0700 (PDT)
Message-ID: <9df4bb0a-d494-551b-c7b9-cc93853e8620@gmail.com>
Date: Sat, 10 Sep 2022 22:29:05 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 0/4] staging: r8188eu: remove empty rtw_*scan* macros
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220910180236.489808-1-martin@kaiser.cx>
Content-Language: en-US
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220910180236.489808-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

Martin Kaiser <martin@kaiser.cx> says:
> Remove four rtw_*scan* macros which are empty or constant.
> 
> Martin Kaiser (4):
>    staging: r8188eu: remove empty rtw_set_scan_deny macro
>    staging: r8188eu: remove rtw_set_scan_deny_timer_hdl
>    staging: r8188eu: remove rtw_clear_scan_deny
>    staging: r8188eu: rtw_is_scan_deny is always false
> 
>   drivers/staging/r8188eu/core/rtw_ioctl_set.c | 5 -----
>   drivers/staging/r8188eu/core/rtw_mlme.c      | 5 -----
>   drivers/staging/r8188eu/core/rtw_xmit.c      | 3 ---
>   drivers/staging/r8188eu/include/rtw_mlme.h   | 4 ----
>   4 files changed, 17 deletions(-)
> 

Acked-by: Pavel Skripkin <paskripkin@gmail.com>


With regards,
Pavel Skripkin
