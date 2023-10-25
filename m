Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CFF2D623
	for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 11:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pWqIlxsR"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-507b18cf2e1so7538992e87.3
        for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 04:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698232385; x=1698837185; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8+D+BeZsEPMEv5rNbntpopdiMR8fAehJzR7Avs9K/vA=;
        b=pWqIlxsRrBIgdLwO/UQ1YiaqUyjuW1SYKv+yjXwDaSGBd1k/tl1EI1I5q+0a8zFBU1
         Y4B1ofmtS5/lRzwQJpjWk/H66HjcaqIKSEPu6XicqfYAVv4f8vK697NPIW6XpYNuwZRd
         6xeeta1+6D5tg0WiKl4tJf2a7KAn84/YEnkGUFbZOsFY77FGljS/NpsmhMt5U2kQvIoT
         Wj6x7/RAk7NjAaDA3ZYLeDhLNm5ApbmIn1WdUzOHDoy2xamKsMGTaMwQhXraUlizB/dC
         tq1bF2Pois/0aZ+fDBkL9ekmNK+YUATiASHzOnBemNkfwaG3QUmdxBLsrY3EyYyQZok1
         N/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698232385; x=1698837185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+D+BeZsEPMEv5rNbntpopdiMR8fAehJzR7Avs9K/vA=;
        b=BHhNIckwye237bIJZsLnoJjKcxPBuegAlOO+sue3Umtk6JLAsiTe+RTlmOIfOcF4WR
         aBAP4ts3QvOqpzm+iAFF+bKY0TNEeIYgHCdHSWrP5SwrIUjSz3hv1J0tiwF6ULFUtbNE
         0yYQfxoLXi8zZ+vZ2F8pJhvLgGhjhopciVQOunL26zHesDy1m6Wr2LkV/k3hXG7QB6+J
         ZqDq6rsBva/YlPSqP3TI60hNofEt9qSdBtIbYjO8Set4bSOhNgzWitp+sQBKP0Xi2hRs
         nZ6Tnq+8tJt2L03HvTyfVCDJpC5cm/NUOjdemytvKmYb/hwbkTQDYVQWF3H6eKP67GNe
         0W7A==
X-Gm-Message-State: AOJu0YyK9ky5wKMZ4ncGxhLwvDhD82G4DE+s+i8d3+PrvuGSUcbQN2f3
	L4AJm22XXM3laItxHvPcg2coIg==
X-Google-Smtp-Source: AGHT+IF6szpxVxi80L5DU+dz954HXLZrnokCw6BZ1SAPk+8FOozdTZyH6sWiSPC2QHqTXJPyIrNuqw==
X-Received: by 2002:a19:9115:0:b0:503:1722:bf3a with SMTP id t21-20020a199115000000b005031722bf3amr10959254lfd.1.1698232385526;
        Wed, 25 Oct 2023 04:13:05 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l7-20020a5d6687000000b00327bf4f2f14sm11754326wru.88.2023.10.25.04.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 04:13:05 -0700 (PDT)
Date: Wed, 25 Oct 2023 14:13:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wiktor Grzywacz <wiktor.grzywacz@3mdeb.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Signed-off-by: Wiktor Grzywacz
 <wiktor.grzywacz@3mdeb.com>
Message-ID: <793abd56-abaa-4780-a6ae-a5ea2cc2b7bd@kadam.mountain>
References: <20231025102614.125291-1-wiktor.grzywacz@3mdeb.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025102614.125291-1-wiktor.grzywacz@3mdeb.com>

On Wed, Oct 25, 2023 at 12:24:20PM +0200, Wiktor Grzywacz wrote:
> staging: rtl8723bs: fix checkpatch space before tab warning
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_dm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
> index 2028791988e7..8bdb685c10e7 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
> @@ -46,7 +46,7 @@ static void Init_ODM_ComInfo_8723b(struct adapter *Adapter)
>  	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_CUT_VER, cut_ver);
>  
>  	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_PATCH_ID, pHalData->CustomerID);
> -	/* 	ODM_CMNINFO_BINHCT_TEST only for MP Team */
> +	/*  ODM_CMNINFO_BINHCT_TEST only for MP Team */
>  	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_BWIFI_TEST, Adapter->registrypriv.wifi_spec);
>  
>  	pdmpriv->InitODMFlag = ODM_RF_CALIBRATION|ODM_RF_TX_PWR_TRACK;
> @@ -84,7 +84,7 @@ static void Update_ODM_ComInfo_8723b(struct adapter *Adapter)
>  	/*  Pointer reference */
>  	/*  */
>  	/* ODM_CMNINFO_MAC_PHY_MODE pHalData->MacPhyMode92D */
> -	/* 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_MAC_PHY_MODE,&(pDM_Odm->u8_temp)); */
> +	/*  ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_MAC_PHY_MODE,&(pDM_Odm->u8_temp)); */

This looks weird now because of the extra space.  Also it's dead,
commented out code.  Just delete it.

regards,
dan carpenter

