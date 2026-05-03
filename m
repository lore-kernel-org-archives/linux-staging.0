Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DD32D8390
	for <linux-staging@lists.linux.dev>; Sun,  3 May 2026 13:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777816665; cv=none; b=lRuk44gJGcb73tHNBf3elOcYrBvv3J9sHzMMNkwuiMjwZhIKeX93fzNZfWE9vPNuzVJTrAaO+eAwcAhR+SaBKg12Rj9grSOhAjiUiUUBe1uh7KQpDeuWZKSEygLNtEeO7amShE/RixCyMKUW8mvfyu7XqSYAFfH/NBO3/eN3zP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777816665; c=relaxed/simple;
	bh=yaM2l25k0qE3jRkqQGzeQvd2kbcFfN6t3wS0xIT7MGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0+greQgrgWobBYQ3PWVuyjKDyZPa7DeKnJLYZ+iIeVMPwr8M7pz8dsBFYIfLI6GjCNNJ22Z4xLQMviAJNa2T2AnoxuhkVbmAqxUybF8Aq2xmhoU1gAwayD6mFVMXgx6hXGk47L85AInQGmoJ8qeLEXeavcNK9QWqSsGvvdtZxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m++EPpyq; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m++EPpyq"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59dcdf60427so2878075e87.3
        for <linux-staging@lists.linux.dev>; Sun, 03 May 2026 06:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777816662; x=1778421462; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z23gOWoR1z1ahTQKLxmV0sRvBUZMTeXg1Wmc4ZGdXz4=;
        b=m++EPpyqEtv3DaLst2Sxdi+AtOem1MMTQa0I6UaDtZf71col8SO1VaG4mBPMMYmW53
         QZHKpVuWw5X3IQ2dyqrrr+4J+5UAg/JAJrgHlfdXek6FpDKI02W8JHcNQA8uelLov7RW
         0vwhHb49kKrjCd/ygXrM5aHfp7VEvSAKnkohmS7iYJZmoaTRgYRxaCX6pn0DsuZeDsUo
         bx5A84fwk5EqzujNIXGohQTsI88T6vhJP5Voiqg5CJf90Ed+ePEPOVasAPHzVEPeeBAA
         DyuV1HyR4PNDi/Sll0WDwUAH/BOrBadDZ6+autkNU2rXi641ezjqM6FrOWQcxa7a8XzW
         w23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777816662; x=1778421462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z23gOWoR1z1ahTQKLxmV0sRvBUZMTeXg1Wmc4ZGdXz4=;
        b=gsTuKMKekbuqS4fIoyoK75iEbZN31f02qrT8yynt5oeTlTZ03mMiISVcOjgfy32ryx
         dpCT7XuqLTdVVpiQhVLgle5q5WApjF5L3iyY5tK6Jd4WxUtrbhN3zWA1apfm46oh9hk3
         wpnrkh0uGJ9gfJA0QyDp7bsBMu3AV1WY8hwgSRvA+MCzwTu4wGB9WJDlq3ow0PeDvDwW
         f6p0qLMV5rxtbI/ILgZeeWE3n+mbsblfN6mTBcY55WtJ+McKT/2HmEmOt5QQXw2tQ6Al
         lXtWXFyjGNcuikZn3hiZn6ib85PnqNrZJD7XARYDm3PkwXDjgIgdA38gEdvtNRbiGXYx
         35uA==
X-Forwarded-Encrypted: i=1; AFNElJ/NIHww0cTeglE37HurNWNkCyDMU8cmELmOLh1/1f2s3A1mBDxTErfvGMeYQmwfboAlzT+GikEpHykZu6U5@lists.linux.dev
X-Gm-Message-State: AOJu0YwS0Z0dJ/U/+M5BjSKxve547ZWUf2fnojxsOkx4b0rixIuZV+uD
	ovLG4Px9eFuEeVkG0e0Qvhuz+bLWCptSlljREpk40cPUG+lZQKVfEjks
X-Gm-Gg: AeBDieuECoz+6CGcHzTlbaTco7JB5lqGTRYglrLsRgnsArb4K4Tb9yKzAAGYc1kwkEk
	zAv+jw1S0o3VlkRJk9+gdepfbiU8TMgt6Ki7UGgpS9yxjO4GyC5RE6Hp+tp6tVz/417e/SSsnOT
	3zwpf9He69O8Sx8qF8l0iVTZvri3Ybx6eZ+W2EgUJJLSOxOYmuo16dPFZqmbFNw2HBRwht/wnLU
	usTm19m2OgRiJ7N+AIEcGzc0Aa6aDABpk7e0WJG4EywfGJkXMvPqj+Z2umh1nNDpuZN4PxjI78S
	gUNMkr5dTjCvILCvBtzkDPwTWu2Y73ztZZEk8EwWe9HyCz0BD7Sy/bmrbqPaT+Cb6iO6uIgM6S5
	THU3bAYKMY5Ul55OHn1bOFkAPoNx5eamRIOI//u3yd/JZ4I0O6EyeuPr/myCK9Q5l4RE95njIE5
	RFQdb8F0MW/PDOuvbOJDTYQ+ix7Kwmko2+QJM=
X-Received: by 2002:a05:6512:68b:b0:5a7:49e7:a7b6 with SMTP id 2adb3069b0e04-5a862ebb69amr1758174e87.1.1777816661114;
        Sun, 03 May 2026 06:57:41 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c342498sm2068506e87.68.2026.05.03.06.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 06:57:40 -0700 (PDT)
Date: Sun, 3 May 2026 16:57:37 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Aidan Russell <aidanlrussell@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Fix spelling mistakes in comments
Message-ID: <afdUUVrjrN0PKBRw@archlinux>
References: <20260501065657.641287-1-aidanlrussell@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501065657.641287-1-aidanlrussell@gmail.com>

On Thu, Apr 30, 2026 at 11:56:57PM -0700, Aidan Russell wrote:
> Fix several spelling mistakes in comments in the rtl8723bs staging
> driver.
> 
> No functional changes.
> 
> Signed-off-by: Aidan Russell <aidanlrussell@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c          |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_efuse.c        |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_mlme.c         |  9 ++++++---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     |  3 ++-
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c      |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_recv.c         |  4 ++--
>  drivers/staging/rtl8723bs/core/rtw_xmit.c         |  4 ++--
>  drivers/staging/rtl8723bs/hal/HalPhyRf.c          |  2 +-
>  drivers/staging/rtl8723bs/hal/odm_DIG.c           |  2 +-
>  drivers/staging/rtl8723bs/hal/odm_types.h         |  2 +-
>  drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c      |  2 +-
>  drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 12 ++++++++----
>  drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c   |  2 +-
>  drivers/staging/rtl8723bs/include/drv_types.h     |  2 +-
>  drivers/staging/rtl8723bs/include/hal_com_reg.h   |  6 +++---
>  drivers/staging/rtl8723bs/include/rtw_xmit.h      |  2 +-
>  drivers/staging/rtl8723bs/include/wlan_bssdef.h   |  4 ++--
>  drivers/staging/rtl8723bs/os_dep/wifi_regd.c      |  2 +-
>  18 files changed, 36 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index 72d5905a48e9..eca1a5bc79be 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -1650,7 +1650,7 @@ u8 rtw_c2h_packet_wk_cmd(struct adapter *padapter, u8 *pbuf, u16 length)
>  	return res;
>  }
>  
> -/* dont call R/W in this function, beucase SDIO interrupt have claim host */
> +/* dont call R/W in this function, because SDIO interrupt have claim host */
>  /* or deadlock will happen and cause special-systemserver-died in android */
>  u8 rtw_c2h_wk_cmd(struct adapter *padapter, u8 *c2h_evt)
>  {
> diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> index a7a636449813..205fc5a5ce50 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> @@ -28,7 +28,7 @@ rtw_efuse_calculate_word_counts(u8 word_en)
>  /*-----------------------------------------------------------------------------
>   * Function:	rtw_efuse_read_1_byte
>   *
> - * Overview:	Copy from WMAC fot EFUSE read 1 byte.
> + * Overview:	Copy from WMAC for EFUSE read 1 byte.
>   *
>   * Input:       NONE
>   *
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 3ecf4f979c03..35818df73808 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /******************************************************************************
> - *
> +
>   * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
>   *
>   ******************************************************************************/
> @@ -52,7 +52,10 @@ int	rtw_init_mlme_priv(struct adapter *padapter)
>  	pmlmepriv->pscanned = NULL;
>  	pmlmepriv->fw_state = WIFI_STATION_STATE; /*  Must sync with rtw_wdev_alloc() */
>  	pmlmepriv->cur_network.network.infrastructure_mode = Ndis802_11AutoUnknown;
> -	pmlmepriv->scan_mode = SCAN_ACTIVE;/*  1: active, 0: passive. Maybe someday we should rename this varable to "active_mode" (Jeff) */
> +	pmlmepriv->scan_mode = SCAN_ACTIVE;/*  1: active, 0: passive.
> +					    * Maybe someday we should rename
> +					    * this variable to "active_mode" (Jeff)
> +					    */
>  
>  	spin_lock_init(&pmlmepriv->lock);
>  	INIT_LIST_HEAD(&pmlmepriv->free_bss_pool.queue);
> @@ -1378,7 +1381,7 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
>  		u16 media_status;
>  
>  		media_status = (mac_id << 8) | 0; /*   MACID|OPMODE:0 means disconnect */
> -		/* for STA, AP, ADHOC mode, report disconnect stauts to FW */
> +		/* for STA, AP, ADHOC mode, report disconnect status to FW */
>  		rtw_hal_set_hwreg(adapter, HW_VAR_H2C_MEDIA_STATUS_RPT, (u8 *)&media_status);
>  	}
>  
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index cfd3eb253350..cccba2dd9cf2 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -1478,7 +1478,8 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
>  	/* Commented by Albert 20130604
>  	 * Before sending the auth frame to start the STA/GC mode connection with AP/GO,
>  	 * we will send the deauth first.
> -	 * However, the Win8.1 with BRCM Wi-Fi will send the deauth with reason code 6 to us after receieving our deauth.
> +	 * However, the Win8.1 with BRCM Wi-Fi will send the deauth with
> +	 * reason code 6 to us after receiving our deauth.
>  	 * Added the following code to avoid this case.
>  	 */
>  	if ((pmlmeinfo->state & WIFI_FW_AUTH_STATE) ||
> diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> index f074ea6e0f38..ca1cb58fc801 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> @@ -576,7 +576,7 @@ void LPS_Leave_check(struct adapter *padapter)
>   *
>   * This will be called when CPWM interrupt is up.
>   *
> - * using to update cpwn of drv; and drv willl make a decision to up or down pwr level
> + * using to update cpwn of drv; and drv will make a decision to up or down pwr level
>   */
>  void cpwm_int_hdl(struct adapter *padapter, struct reportpwrstate_parm *preportpwrstate)
>  {
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index e11127992cfd..5ef31e604775 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -828,7 +828,7 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
>  		}
>  
>  		if (GetFrameSubType(ptr) & BIT(6)) {
> -			/* No data, will not indicate to upper layer, temporily count it here */
> +			/* No data, will not indicate to upper layer, temporarily count it here */
>  			count_rx_stats(adapter, precv_frame, *psta);
>  			ret = RTW_RX_HANDLED;
>  			goto exit;
> @@ -909,7 +909,7 @@ static signed int sta2ap_data_frame(struct adapter *adapter, union recv_frame *p
>  			process_wmmps_data(adapter, precv_frame);
>  
>  		if (GetFrameSubType(ptr) & BIT(6)) {
> -			/* No data, will not indicate to upper layer, temporily count it here */
> +			/* No data, will not indicate to upper layer, temporarily count it here */
>  			count_rx_stats(adapter, precv_frame, *psta);
>  			ret = RTW_RX_HANDLED;
>  			goto exit;
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index dba146b696e0..a21aa2964a6b 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -726,7 +726,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
>  			}
>  		}
>  
> -		/* for parsing ICMP pakcets */
> +		/* for parsing ICMP packets */
>  		{
>  			struct iphdr *piphdr = (struct iphdr *)tmp;
>  
> @@ -1358,7 +1358,7 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
>  			/* set final tx command size */
>  			pattrib->last_txcmdsz = pattrib->pktlen;
>  
> -			/* set protected bit must be beofre SW encrypt */
> +			/* set protected bit must be before SW encrypt */
>  			SetPrivacy(mem_start);
>  			/* software encrypt */
>  			xmitframe_swencrypt(padapter, pxmitframe);
> diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf.c b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
> index 7bef05a9a063..fbc045a02852 100644
> --- a/drivers/staging/rtl8723bs/hal/HalPhyRf.c
> +++ b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
> @@ -18,7 +18,7 @@ void ConfigureTxpowerTrack(struct dm_odm_t *pDM_Odm, struct txpwrtrack_cfg *pCon
>  /*  Otherwise the previous compensation is gone, because we record the */
>  /*  delta of temperature between two TxPowerTracking watch dogs. */
>  /*  */
> -/*  NOTE: If Tx BB swing or Tx scaling is varified during run-time, still */
> +/*  NOTE: If Tx BB swing or Tx scaling is verified during run-time, still */
>  /*        need to call this function. */
>  /*  */
>  void ODM_ClearTxPowerTrackingState(struct dm_odm_t *pDM_Odm)
> diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.c b/drivers/staging/rtl8723bs/hal/odm_DIG.c
> index a31c8368f9d9..f794b6b2d402 100644
> --- a/drivers/staging/rtl8723bs/hal/odm_DIG.c
> +++ b/drivers/staging/rtl8723bs/hal/odm_DIG.c
> @@ -602,7 +602,7 @@ void odm_DIGbyRSSI_LPS(void *pDM_VOID)
>  }
>  
>  /* 3 ============================================================ */
> -/* 3 FASLE ALARM CHECK */
> +/* 3 FALSE ALARM CHECK */
>  /* 3 ============================================================ */
>  
>  void odm_FalseAlarmCounterStatistics(void *pDM_VOID)
> diff --git a/drivers/staging/rtl8723bs/hal/odm_types.h b/drivers/staging/rtl8723bs/hal/odm_types.h
> index 0da662e1493a..a2fe4f258408 100644
> --- a/drivers/staging/rtl8723bs/hal/odm_types.h
> +++ b/drivers/staging/rtl8723bs/hal/odm_types.h
> @@ -9,7 +9,7 @@
>  
>  #include <drv_types.h>
>  
> -/*  Deifne HW endian support */
> +/*  Define HW endian support */
>  #define	ODM_ENDIAN_BIG	0
>  #define	ODM_ENDIAN_LITTLE	1
>  
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> index 4bdc8e314015..9fc104af343b 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> @@ -832,7 +832,7 @@ static void SetFwRsvdPagePkt_BTCoex(struct adapter *padapter)
>  
>  	BufIndex += (CurtPktPageNum*PageSize);
>  
> -	/*  Jump to lastest page */
> +	/*  Jump to last page */
>  	if (BufIndex < (MaxRsvdPageBufSize - PageSize)) {
>  		BufIndex = TxDescOffset + (MaxRsvdPageBufSize - PageSize);
>  		TotalPageNum = BCNQ_PAGE_NUM_8723B - 1;
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index 9a91fd0a96eb..8af6bff13fa4 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> @@ -1859,9 +1859,11 @@ void rtl8723b_update_txdesc(struct xmit_frame *pxmitframe, u8 *pbuf)
>  }
>  
>  /*  */
> -/*  Description: In normal chip, we should send some packet to Hw which will be used by Fw */
> -/* 			in FW LPS mode. The function is to fill the Tx descriptor of this packets, then */
> -/* 			Fw can tell Hw to send these packet derectly. */
> +/*  Description: In normal chip, we should send some packet to Hw which will be used by Fw
> + *		 in FW LPS mode. The function is to fill the
> + *		 Tx descriptor of this packets, then
> + *		 Fw can tell Hw to send these packet directly.
> + */
>  /*  Added by tynli. 2009.10.15. */
>  /*  */
>  /* type1:pspoll, type2:null */
> @@ -2582,7 +2584,9 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
>  		{
>  			u8 psmode = *val;
>  
> -			/*  Forece leave RF low power mode for 1T1R to prevent conficting setting in Fw power */
> +			/*  Force leave RF low power mode for 1T1R to
> +			 *  prevent conflicting setting in Fw power
> +			 */
>  			/*  saving sequence. 2010.06.07. Added by tynli. Suggested by SD3 yschang. */
>  			if (psmode != PS_MODE_ACTIVE) {
>  				ODM_RF_Saving(&pHalData->odmpriv, true);
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
> index ffb35e1ace62..d4095b0b441b 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
> @@ -119,7 +119,7 @@ static int phy_RF6052_Config_ParaFile(struct adapter *Adapter)
>  		PHY_SetBBReg(Adapter, pPhyReg->rfHSSIPara2, b3WireDataLength, 0x0);	/*  Set 0 to 12  bits for 8255 */
>  		udelay(1);/* PlatformStallExecution(1); */
>  
> -		/*----Initialize RF fom connfiguration file----*/
> +		/*----Initialize RF from configuration file----*/
>  		switch (eRFPath) {
>  		case RF_PATH_A:
>  		case RF_PATH_B:
> diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
> index 7ed375ba18d8..4f6b4ec220c0 100644
> --- a/drivers/staging/rtl8723bs/include/drv_types.h
> +++ b/drivers/staging/rtl8723bs/include/drv_types.h
> @@ -273,7 +273,7 @@ enum {
>  struct adapter {
>  	int	DriverState;/*  for disable driver using module, use dongle to replace module. */
>  	int	pid[3];/* process id from UI, 0:wps, 1:hostapd, 2:dhcpcd */
> -	int	bDongle;/* build-in module or external dongle */
> +	int	bDongle;/* built-in module or external dongle */
>  
>  	struct dvobj_priv *dvobj;
>  	struct	mlme_priv mlmepriv;
> diff --git a/drivers/staging/rtl8723bs/include/hal_com_reg.h b/drivers/staging/rtl8723bs/include/hal_com_reg.h
> index cf5c15dc2bfd..407894ce4d86 100644
> --- a/drivers/staging/rtl8723bs/include/hal_com_reg.h
> +++ b/drivers/staging/rtl8723bs/include/hal_com_reg.h
> @@ -20,7 +20,7 @@
>  #define REG_RSV_CTRL					0x001C
>  #define REG_RF_CTRL						0x001F
>  #define REG_AFE_XTAL_CTRL				0x0024
> -#define REG_MAC_PHY_CTRL				0x002c /* for 92d, DMDP, SMSP, DMSP contrl */
> +#define REG_MAC_PHY_CTRL				0x002c /* for 92d, DMDP, SMSP, DMSP control */
>  #define REG_EFUSE_CTRL					0x0030
>  #define REG_EFUSE_TEST					0x0034
>  #define REG_PWR_DATA					0x0038
> @@ -186,7 +186,7 @@
>  
>  /*  */
>  /*  */
> -/* 	Redifine 8192C register definition for compatibility */
> +/*	Redefine 8192C register definition for compatibility */
>  /*  */
>  /*  */
>  #define EFUSE_CTRL				REG_EFUSE_CTRL		/*  E-Fuse Control. */
> @@ -273,7 +273,7 @@
>  /*  */
>  /*        8192C (RCR) Receive Configuration Register	(Offset 0x608, 32 bits) */
>  /*  */
> -#define RCR_APPFCS				BIT31	/*  WMAC append FCS after pauload */
> +#define RCR_APPFCS				BIT31	/*  WMAC append FCS after payload */
>  #define RCR_APP_MIC				BIT30	/*  MACRX will retain the MIC at the bottom of the packet. */
>  #define RCR_APP_ICV				BIT29	/*  MACRX will retain the ICV at the bottom of the packet. */
>  #define RCR_APP_PHYST_RXFF		BIT28	/*  PHY Status is appended before RX packet in RXFF */
> diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
> index b0189a703d28..a00163f41853 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
> @@ -157,7 +157,7 @@ struct pkt_attrib {
>  	u8 key_idx;
>  	u8 qos_en;
>  	u8 ht_en;
> -	u8 raid;/* rate adpative id */
> +	u8 raid;/* rate adaptive id */
>  	u8 bwmode;
>  	u8 ch_offset;/* PRIME_CHNL_OFFSET */
>  	u8 sgi;/* short GI */
> diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
> index 812a68394268..2d45e69f4f4c 100644
> --- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
> +++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
> @@ -137,7 +137,7 @@ struct wlan_phy_info {
>  };
>  
>  struct wlan_bcn_info {
> -	/* these infor get from rtw_get_encrypt_info when
> +	/* these info get from rtw_get_encrypt_info when
>  	 * * translate scan to UI */
>  	u8 encryp_protocol;/* ENCRYP_PROTOCOL_E: OPEN/WEP/WPA/WPA2/WAPI */
>  	int group_cipher; /* WPA/WPA2 group cipher */
> @@ -149,7 +149,7 @@ struct wlan_bcn_info {
>  	unsigned char ht_info_infos_0;
>  };
>  
> -/* temporally add #pragma pack for structure alignment issue of
> +/* temporarily add #pragma pack for structure alignment issue of
>  *   struct wlan_bssid_ex and get_wlan_bssid_ex_sz()
>  */
>  struct wlan_bssid_ex {
> diff --git a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
> index c48a1e3ba4ac..c80f844e45cb 100644
> --- a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
> +++ b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
> @@ -27,7 +27,7 @@
>   * by case basis by regulatory domain
>   */
>  
> -/* 2G chan 12 - chan 13, PASSIV SCAN */
> +/* 2G chan 12 - chan 13, PASSIVE SCAN */
>  #define RTW_2GHZ_CH12_13	\
>  	REG_RULE(2467 - 10, 2472 + 10, 40, 0, 20,	\
>  	NL80211_RRF_PASSIVE_SCAN)
> -- 
> 2.54.0
> 

In commit message you say you're fixing spelling mistakes, but in
reality you're making several other unrelated changes.
Please remove them or split them into separate patches so that each
patch contains one logical change.


Thanks,
Nikolay
