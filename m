Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875F72C8B
	for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 21:06:37 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id a20-20020a1c7f14000000b003231d13ee3cso1043555wmd.3
        for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 14:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ccjx7hnRxE/J/c9yyhLNRfffYR9pyQjf+fAAPM9NmOQ=;
        b=dbwfCsQOOqfBeIcdWjxFeoDZqcnQuMwAbCmORcXtkJb1GG/GrmmYY2+ltqyhIVHYE+
         fK6+8+ZCFLRwygXXw2XHvpHif4n+PmJsGdbcxnyY38q8MdvH+8HsN9JWoif3ZOcRWpWh
         FblxRdtsScbeh2mgIuU/tAzfQGZLLjqFcuqgTRtD5xpJl6rbcGi/lIOuTBl6qCFCzFbd
         cEX9ctPx925hn6vjcIFX5xrFaiOafzpuPLQbSvIWpEMK03B3ZO4sunH4ay/NE6keQFxI
         CJjbVFqMxShUzFLaH0BMEG/mLKo992ZeBrIUqi386uOy2tZDilmbLqhPAKQ2YgXWPx+R
         Wnng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ccjx7hnRxE/J/c9yyhLNRfffYR9pyQjf+fAAPM9NmOQ=;
        b=RPsCwMa5CL7Z23j4H1poKpLk32rVpJvV4JVevUW8/ItvI8rQoxmvEOfILu0K3Ov54e
         lmYMb3O8z8K2y6YFiCDlUJesYbXGcP/34Bg3zC88dzC8UvtKH0LZO51+ZzQ3pinnL2oW
         dhjF3/VZwiNH4rjsVz9AiSYKf2nPzTKBeoxGWv2B2YNZSl051jM/GxgjbXRd5ScKFeai
         e0rwB0ss7GAOOTDw/mg3kTNkyaYoyDwFE5ZkavZWtOl6xLVXU34lGjBy040+VdxkWbcY
         ieCt2wjWBS7y85G5O+//WH3qPSjnfIis3pPH5NlhFeyX3LMBQb8opjKz8Zr0ED+6EL0l
         X0fQ==
X-Gm-Message-State: AOAM532qN+ZjVeDZADMDoAGJ0S4ZvzC85yT0TjwiqLc5wWGycf+JlMZx
	rVI8qMeoYa50lFwPKlWvp8xuCQ==
X-Google-Smtp-Source: ABdhPJyBmE92RiaoeeOP3asyWGRenIYhhxVUwqTEL8jS/NhElmzqIcTD6Hthg5sbnHZ4kKfPSPbSdQ==
X-Received: by 2002:a1c:1dcb:: with SMTP id d194mr1823387wmd.156.1634763995864;
        Wed, 20 Oct 2021 14:06:35 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id 196sm2907486wme.20.2021.10.20.14.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 14:06:35 -0700 (PDT)
Date: Wed, 20 Oct 2021 22:06:33 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] staging: r8188eu: odm_rate_adapt Type is constant
Message-ID: <YXCE2RSwiOP/nsfS@equinox>
References: <20211020195401.12931-1-martin@kaiser.cx>
 <20211020195401.12931-2-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211020195401.12931-2-martin@kaiser.cx>

On Wed, Oct 20, 2021 at 09:53:58PM +0200, Martin Kaiser wrote:
> Type in struct odm_rate_adapt is always DM_Type_ByDriver.
> Therefore, bUseRAMask is always true.
> 
> Remove the constant components, unused defines and dead code.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/hal/odm.c     | 9 ---------
>  drivers/staging/r8188eu/include/odm.h | 6 ------
>  2 files changed, 15 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
> index 47d8cdf1c3e8..67cf8f7baba5 100644
> --- a/drivers/staging/r8188eu/hal/odm.c
> +++ b/drivers/staging/r8188eu/hal/odm.c
> @@ -669,12 +669,6 @@ void odm_RateAdaptiveMaskInit(struct odm_dm_struct *pDM_Odm)
>  {
>  	struct odm_rate_adapt *pOdmRA = &pDM_Odm->RateAdaptive;
>  
> -	pOdmRA->Type = DM_Type_ByDriver;
> -	if (pOdmRA->Type == DM_Type_ByDriver)
> -		pDM_Odm->bUseRAMask = true;
> -	else
> -		pDM_Odm->bUseRAMask = false;
> -
>  	pOdmRA->RATRState = DM_RATR_STA_INIT;
>  	pOdmRA->HighRSSIThresh = 50;
>  	pOdmRA->LowRSSIThresh = 20;
> @@ -755,9 +749,6 @@ void odm_RefreshRateAdaptiveMask(struct odm_dm_struct *pDM_Odm)
>  	if (pAdapter->bDriverStopped)
>  		return;
>  
> -	if (!pDM_Odm->bUseRAMask)
> -		return;
> -
>  	for (i = 0; i < ODM_ASSOCIATE_ENTRY_NUM; i++) {
>  		struct sta_info *pstat = pDM_Odm->pODM_StaInfo[i];
>  		if (IS_STA_VALID(pstat)) {
> diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
> index 1fc90a8dc063..f08655208b32 100644
> --- a/drivers/staging/r8188eu/include/odm.h
> +++ b/drivers/staging/r8188eu/include/odm.h
> @@ -150,7 +150,6 @@ struct edca_turbo {
>  };
>  
>  struct odm_rate_adapt {
> -	u8	Type;		/*  DM_Type_ByFW/DM_Type_ByDriver */
>  	u8	HighRSSIThresh;	/*  if RSSI > HighRSSIThresh	=> RATRState is DM_RATR_STA_HIGH */
>  	u8	LowRSSIThresh;	/*  if RSSI <= LowRSSIThresh	=> RATRState is DM_RATR_STA_LOW */
>  	u8	RATRState;	/*  Current RSSI level, DM_RATR_STA_HIGH/DM_RATR_STA_MIDDLE/DM_RATR_STA_LOW */
> @@ -165,8 +164,6 @@ struct odm_rate_adapt {
>  #define AVG_THERMAL_NUM		8
>  #define IQK_Matrix_REG_NUM	8
>  
> -#define	DM_Type_ByDriver	1
> -
>  struct odm_phy_dbg_info {
>  	/* ODM Write,debug info */
>  	s8	RxSNRdB[MAX_PATH_NUM_92CS];
> @@ -586,9 +583,6 @@ struct odm_dm_struct {
>  	bool	bPSDinProcess;
>  	bool	bDMInitialGainEnable;
>  
> -	/* for rate adaptive, in fact,  88c/92c fw will handle this */
> -	u8	bUseRAMask;
> -
>  	struct odm_rate_adapt RateAdaptive;
>  
>  	struct odm_rf_cal RFCalibrateInfo;
> -- 
> 2.20.1
> 

Looks good.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
