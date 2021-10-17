Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2876D2C83
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 11:53:16 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id v127so6236237wme.5
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 04:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=fcVWJXrW45Et+2LnPbZKeMYi/maZWSV+sabjN0AySK0=;
        b=LClOC1C7tS7xUCv/rixOnhmQXoj5bE7N5xMo1pKGfyLl9MsyKbCEXwPaO3efjTZkMO
         nzoMAa2gSlk/+KM4J+X1kleWU9KUfU+KbpRPWPPCtg4KMfGBd1GmkvmEtS2Ncxb+yQ3H
         /6zIQWTWkrdLMxFYcbGps+1NkNcZZVdXG26hjy/Q9hC1PffBluIJ7thRKMhahPvZ5c6H
         98EJQBliZ/7mlDRrzuHOzPY3T8PHi5/BPOg5x27frxa3DexDtLsKe9AOl+f3YAMxdSHi
         64JbHlpDwgfTF9QYq2GEspKf9t3ZecGvQOH2Pu51Ey7536TiwQsfu19T3l54Mg98hilG
         CZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fcVWJXrW45Et+2LnPbZKeMYi/maZWSV+sabjN0AySK0=;
        b=HiRL4Dzsb0gqeo1+qaRfcLx8EvKnwczcXD9h//SkHUa6bmdYwjTwlssFI59eKFyGGg
         3p3qJaljaNERjPHiFW94w8ux/i/zueJA0Qt7FyvU/AZ+h3GNAzZpzo+kktdtVtgvYcPF
         q0zT2x3Wo6Ojy+lBaDlkflEJwZaE56hnWvfxxw2emgbWXahgygW4k9XbHo0RIriYviMu
         ZPqtXCar2iyCMdmGblWFSxC7zwzHOCuwiPL5rqhmcFN1Qtn0vmWc4Mi+Jp/wz91rOpU2
         nOBGe5AfM74OXANNSGoKP1DK+d/mYXDDYvHoCSGICb4EkCnbWmZFTuNX6WuYNK8A/ZjU
         UFfg==
X-Gm-Message-State: AOAM53355shaoPYOHxmUvgCLBo7e/1wPyq6esMzOGM/xkcnT9jMLN6TG
	4uX5wKwB7+gAZKYVOH7Rn7o=
X-Google-Smtp-Source: ABdhPJyrZLc6zFYEsptqt7ggfUJG6T1FRqTvMcM/T14D0MmOKX4iVvBgfuZRzbKcS5W0NO21FwtVyg==
X-Received: by 2002:a7b:c350:: with SMTP id l16mr37279766wmj.151.1634471594508;
        Sun, 17 Oct 2021 04:53:14 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::d7f0? ([2a02:8108:96c0:3b88::d7f0])
        by smtp.gmail.com with ESMTPSA id q12sm6076354wrp.13.2021.10.17.04.53.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Oct 2021 04:53:14 -0700 (PDT)
Message-ID: <5909156a-3942-f6a8-9742-1b5898405fbb@gmail.com>
Date: Sun, 17 Oct 2021 13:53:13 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 5/8] staging: r8188eu: PHY_SetRFPathSwitch_8188E is not
 used
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20211016113008.27549-1-martin@kaiser.cx>
 <20211016113008.27549-6-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20211016113008.27549-6-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/21 13:30, Martin Kaiser wrote:
> Remove the PHY_SetRFPathSwitch_8188E function which is not used.
> 
> It was the only caller of phy_setrfpathswitch_8188e, that function
> can be removed as well.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/hal/HalPhyRf_8188e.c  | 38 -------------------
>   .../staging/r8188eu/include/Hal8188EPhyCfg.h  |  3 --
>   2 files changed, 41 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
> index f01ee3cd8795..79f407c280be 100644
> --- a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
> +++ b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
> @@ -1189,41 +1189,3 @@ void PHY_LCCalibrate_8188E(struct adapter *adapt)
>   		phy_LCCalibrate_8188E(adapt, false);
>   	}
>   }
> -
> -static void phy_setrfpathswitch_8188e(struct adapter *adapt, bool main, bool is2t)
> -{
> -	struct hal_data_8188e	*pHalData = GET_HAL_DATA(adapt);
> -	struct odm_dm_struct *dm_odm = &pHalData->odmpriv;
> -
> -	if (!adapt->hw_init_completed) {
> -		u8 u1btmp;
> -		u1btmp = ODM_Read1Byte(dm_odm, REG_LEDCFG2) | BIT(7);
> -		ODM_Write1Byte(dm_odm, REG_LEDCFG2, u1btmp);
> -		ODM_SetBBReg(dm_odm, rFPGA0_XAB_RFParameter, BIT(13), 0x01);
> -	}
> -
> -	if (is2t) {	/* 92C */
> -		if (main)
> -			ODM_SetBBReg(dm_odm, rFPGA0_XB_RFInterfaceOE, BIT(5) | BIT(6), 0x1);	/* 92C_Path_A */
> -		else
> -			ODM_SetBBReg(dm_odm, rFPGA0_XB_RFInterfaceOE, BIT(5) | BIT(6), 0x2);	/* BT */
> -	} else {			/* 88C */
> -		if (main)
> -			ODM_SetBBReg(dm_odm, rFPGA0_XA_RFInterfaceOE, BIT(8) | BIT(9), 0x2);	/* Main */
> -		else
> -			ODM_SetBBReg(dm_odm, rFPGA0_XA_RFInterfaceOE, BIT(8) | BIT(9), 0x1);	/* Aux */
> -	}
> -}
> -
> -void PHY_SetRFPathSwitch_8188E(struct adapter *adapt, bool main)
> -{
> -	struct hal_data_8188e	*pHalData = GET_HAL_DATA(adapt);
> -	struct odm_dm_struct *dm_odm = &pHalData->odmpriv;
> -
> -	if (dm_odm->RFType == ODM_2T2R) {
> -		phy_setrfpathswitch_8188e(adapt, main, true);
> -	} else {
> -		/*  For 88C 1T1R */
> -		phy_setrfpathswitch_8188e(adapt, main, false);
> -	}
> -}
> diff --git a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
> index 084bccc5dcb9..feae0b32cac6 100644
> --- a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
> +++ b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
> @@ -195,9 +195,6 @@ void PHY_SetBWMode8188E(struct adapter *adapter,
>   /*  channel switch related funciton */
>   void PHY_SwChnl8188E(struct adapter *adapter, u8 channel);
>   
> -/*  BB/MAC/RF other monitor API */
> -void PHY_SetRFPathSwitch_8188E(struct adapter *adapter,	bool main);
> -
>   void storePwrIndexDiffRateOffset(struct adapter *adapter, u32 regaddr,
>   				 u32 mask, u32 data);
>   /*--------------------------Exported Function prototype---------------------*/
> 


Acked-by: Michael Straube <straube.linux@gmail.com>
