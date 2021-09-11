Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6577A3FC3
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 13:32:38 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id q26so6868188wrc.7
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 06:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=oIzPjX/18gjtmjPtMT0Q5tMQbXEiRiTEAyoWi1fuT58=;
        b=FJ/zuTIRyMBgsWzpgu2Pmsrn8+j4yi0UKfWW+M+oaS4Zm8Jtummv7cvU/a0PxEI08O
         jnegvDSfBo3EpVrvugbbvFxeQxRGTq1bVEz04olod+/7NTdPq1yCrYn82FIMSjS0ixXn
         lNBu2UQbwiFvLoZEnBjZQ2aNPn0Ua6uB/QPMstDdbd9z+77/UsnxNqald/gp0K61Y8Fe
         PTYgfABtFhumF6W2GXpg+9dTGxdcXRwz3I0QZKxI+HIAPR1Uno24PWGSW4sg+PmhS1mG
         i8BWi7UuVUVp3IW9Pb69G4yL0clpwyOo5DtTaag7reYEBAG09NBxRvDIF+wye4ZJCl9W
         9uBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oIzPjX/18gjtmjPtMT0Q5tMQbXEiRiTEAyoWi1fuT58=;
        b=a1QDIi6zctXHBSi8T4aL2td9ksqwobdDcjvZ+rrcXYhCuXSItFHsyIExDoXhimsNR1
         mxt0AyN70ocfA0+bRBbgYTk+muzEtVYKCMnl7kMV11ph15oqcci76n/sYePaoWaRwrXt
         aQvkPrMBxTBk/5Ev+jkuJFbZs7CLW/Uo47WQATp+GczwX4ls7N4Jrb7Le6FCTP33U+X1
         eH3OsTLpYqLM3rZWaFGOVwUqbJnboYPdlV+5W7+pwugiykqmi8YIreczd5c+1MQ4uqi3
         UoDFnI1RQVWye9n3vuwKwEzLfgBM2cRxDb5t5wNkPCGXjWWXgSB0RNKDGTaYE+SK3GA2
         vVrg==
X-Gm-Message-State: AOAM5311bNFwzllUiP9FwZ3k3urzB5f0WCL5HqDt4KA7C2aeX8g7suDT
	PtbRVK95fR+AOkGCJZF2XBI=
X-Google-Smtp-Source: ABdhPJz1/YTdbTgNvwRulv9+DRG3D/K2pPQt/4BI5LAdTCIfus0mhOAimpnEeZw8lLynhoOx4cfTKA==
X-Received: by 2002:adf:e4c5:: with SMTP id v5mr3111332wrm.1.1631367156840;
        Sat, 11 Sep 2021 06:32:36 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::ae40? ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id q201sm1717160wme.2.2021.09.11.06.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Sep 2021 06:32:36 -0700 (PDT)
Message-ID: <58796c32-5105-b3a3-fdeb-bf38e97ecd6b@gmail.com>
Date: Sat, 11 Sep 2021 15:32:35 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [PATCH] staging: r8188eu: remove write-only variable
 bLCKInProgress
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210911132338.1415-1-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20210911132338.1415-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/21 15:23, Martin Kaiser wrote:
> bLCKInProgress in struct odm_rf_cal is never read. Remove it.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/hal/HalPhyRf_8188e.c | 4 ----
>   drivers/staging/r8188eu/include/odm.h        | 1 -
>   2 files changed, 5 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
> index 6e0abaf58791..d9693c8014ce 100644
> --- a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
> +++ b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
> @@ -1212,16 +1212,12 @@ void PHY_LCCalibrate_8188E(struct adapter *adapt)
>   		timecount += 50;
>   	}
>   
> -	dm_odm->RFCalibrateInfo.bLCKInProgress = true;
> -
>   	if (dm_odm->RFType == ODM_2T2R) {
>   		phy_LCCalibrate_8188E(adapt, true);
>   	} else {
>   		/*  For 88C 1T1R */
>   		phy_LCCalibrate_8188E(adapt, false);
>   	}
> -
> -	dm_odm->RFCalibrateInfo.bLCKInProgress = false;
>   }
>   
>   static void phy_setrfpathswitch_8188e(struct adapter *adapt, bool main, bool is2t)
> diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
> index 7c8f082930dd..cda8b3ffe0be 100644
> --- a/drivers/staging/r8188eu/include/odm.h
> +++ b/drivers/staging/r8188eu/include/odm.h
> @@ -679,7 +679,6 @@ struct odm_rf_cal {
>   	u32	Reg864;
>   
>   	bool	bIQKInitialized;
> -	bool	bLCKInProgress;
>   	bool	bAntennaDetected;
>   	u32	ADDA_backup[IQK_ADDA_REG_NUM];
>   	u32	IQK_MAC_backup[IQK_MAC_REG_NUM];
> 

Compiles and looks good to me, thanks.

Acked-by: Michael Straube <straube.linux@gmail.com>
