Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55E42C11D9
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 17:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778432504; cv=none; b=nM3DvJwt+XgDfN4MGrfiZoHJ6u/1M++le1qWnQOr4SE7Nn9RoIodhH2qKdStdrkl4TGmpCr85ofn12wTxt7XHwJ3T4q/v7sToeU8+dRzx7hcwUOGgjkFs/1iYU58fTvKK7xQPLny6bWl/P4TL3UIdnT1ubQzv0uh6tumrC09x7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778432504; c=relaxed/simple;
	bh=bMkrJNHD5YPswBNQMNAn+Uk4uvD3AuLxzJ4wGRyt6EU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYMpPT9qpN9e7l0j99LUrjcnGW3CVyGEUYA7Ecx1xWJDCqPsnBCok/8+1OK4d5CYBY43WjXEZQ4d8JSahgDXDwnx/FPHRDITAEDCrQyc6aRafFfSWJBqPErpCKaXWzT1Fj2F4lSkuooiDEHBdyBe8D8SbIAoxLSruYOT9IdB8wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbiE497d; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbiE497d"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a8704dc3a8so3552959e87.3
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 10:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778432501; x=1779037301; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XvL2QBMyrunKKsQx2ZLUm46lAGQOJiMPRTV9+0ckVHI=;
        b=WbiE497de3uRVj/vseU5sLkW35pLGbGktzTNgenk/DGzSWvSuG5SQKE+La332lcHPj
         L/AyvHu7SeVaSkD60mKAjp/zwSBoZ4xWRcgKcBfEtsPjDxBMtWhrUrLMgdF1IyWaQx3T
         wB+7o4bZrSWzU3hPzwnHDYq78VnxkcYCFepvRgNLu08+wc98WdImpoEoxUl2PlhJvr/M
         c7Clsjq0iM7+PcdtKF00bBLUKyLGnSOGVd3RmmcgNnBXRN9A3/9caKMdHVIDIWdwRIK/
         QgOO1HHAUzyjsSoboE91uQUerj/u5cV8dzWnDfnZOEKTYy0+zD5DurZC6NDO8Z9FCm1t
         kpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778432501; x=1779037301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XvL2QBMyrunKKsQx2ZLUm46lAGQOJiMPRTV9+0ckVHI=;
        b=qTd2NxbfqUlLaLvrJNlyWDcR4u84SkMy4Qhq69ReMARjzCinzlzU1uHI26dFhpJ8Is
         /rGZqMOKrZs7l5odZ4D4yfG57kOekZTlwKa6eKsy0bbynNZJqO+P3ewqJQDDPubic/NY
         fm51Y0WP1PMRCQQR8YFrm1NAcJbD9uzruKv3aRsksI1PqhFORKECsRphlyhiu3vkIqPq
         VDlIwkfTYRVFb9HHeVyTvAF296xdXTX9sRbJqmYkC5Hp0AWUxIRLiWiQFRxQm7thBvZR
         +qh6PcmmvXU736iBwkyVEpJQWC/IIdTi+7lAOCTAOZ/haFhcqLn8+v6bEF/VInUlCzqB
         yS9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/yCw+w6hVsftCmcyYGHb5hGstSHSiAT3EF24v3sQMeyJkxMN5baIy7ISMi13o6CCiCRpToZUsHv98VES0e@lists.linux.dev
X-Gm-Message-State: AOJu0Yys7YEoO2ZjIqcCh2YMTNij3Wpl/AU4ABaay7bQtZnLes56+7kd
	P/yiHhMZoenPlrK0r95VlbZ1ivmGZ9t/RTyOkRkQC1DYeqfABDf9Yr2FwMUNUBJ6
X-Gm-Gg: Acq92OHsM7wDVWEtqdZJeQBjPAnSzzDeZQXQ6mAHBqgwO3ihHEmAEBL1BI3dU5eNCiX
	KEfDRiA1a4ORhQec7ZTKj7W0tB5by8moAUuVg0UI3F6oM3qDiqLJIIIOvtJUq/bPhW+XtBxUXTV
	Mz5pSY33fjqwuzpYuwbqHXwXFgVp1RoMgIgiFozy11sdt4y28+/FYMjDTfYjegpzg+MYRKAU3qa
	KrYO070m8Oe+t7tUcHFbK+hdo8TV3JijEmYM4Ta5sf0yRraWbg8ZwsP179htGCM4XFM2nFOha6L
	rNNnep9KMwpTKrw3IH63MF5IT8shn6tL1uNWG/SXTqDsq08NQfJK9hXeIJLmtVlYfneNsasuSlA
	cvfrUJeajsWTh//l6SzZ09ma8+OMUZ++nXmP1wnW4NSQjy/cszypxEqc3t7ucMD3l7OXYVF+kBa
	wc7P7HiB0apfh4cHzMldKE8P3L
X-Received: by 2002:a05:6512:114e:b0:5a8:9b8c:96e0 with SMTP id 2adb3069b0e04-5a89b8c9738mr5667193e87.25.1778432500795;
        Sun, 10 May 2026 10:01:40 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8cbfc5115sm236700e87.7.2026.05.10.10.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 10:01:40 -0700 (PDT)
Date: Sun, 10 May 2026 20:01:37 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Pramod Maurya <pramod.nexgen@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: Re: [PATCH 2/2] staging: rtl8723bs: Fix coding style in include
 headers
Message-ID: <agC58XCiXVKdR2Lv@archlinux>
References: <20260510151735.520685-1-pramod.nexgen@gmail.com>
 <20260510151735.520685-2-pramod.nexgen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510151735.520685-2-pramod.nexgen@gmail.com>

On Sun, May 10, 2026 at 11:17:21AM -0400, Pramod Maurya wrote:
> Remove multiple blank lines and extern keywords from function
> prototypes in header files as flagged by checkpatch.pl.

Please one patch for one logical change.


> 
> Files changed:
> - rtw_wifi_regd.h: remove multiple blank lines
> - sdio_ops_linux.h: remove multiple blank lines
> - cmd_osdep.h: remove multiple blank lines and extern prototypes
> - rtw_ioctl_set.h: remove multiple blank lines
> - rtl8192c_recv.h: remove multiple blank lines
> - rtl8723b_dm.h: remove multiple blank lines

git diff does this for you perfectly well, why repeat it?


Thanks,
Nikolay

> 
> Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/cmd_osdep.h      | 7 +++----
>  drivers/staging/rtl8723bs/include/rtl8192c_recv.h  | 1 -
>  drivers/staging/rtl8723bs/include/rtl8723b_dm.h    | 1 -
>  drivers/staging/rtl8723bs/include/rtw_ioctl_set.h  | 1 -
>  drivers/staging/rtl8723bs/include/rtw_wifi_regd.h  | 1 -
>  drivers/staging/rtl8723bs/include/sdio_ops_linux.h | 1 -
>  6 files changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/cmd_osdep.h b/drivers/staging/rtl8723bs/include/cmd_osdep.h
> index 5506f513dc01..7aaee3b480ba 100644
> --- a/drivers/staging/rtl8723bs/include/cmd_osdep.h
> +++ b/drivers/staging/rtl8723bs/include/cmd_osdep.h
> @@ -7,12 +7,11 @@
>  #ifndef __CMD_OSDEP_H_
>  #define __CMD_OSDEP_H_
>  
> -
>  int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv);
>  int rtw_init_evt_priv(struct evt_priv *pevtpriv);
> -extern void _rtw_free_evt_priv(struct	evt_priv *pevtpriv);
> -extern void _rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv);
> +void _rtw_free_evt_priv(struct	evt_priv *pevtpriv);
> +void _rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv);
>  int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj);
> -extern struct	cmd_obj	*_rtw_dequeue_cmd(struct __queue *queue);
> +struct	cmd_obj	*_rtw_dequeue_cmd(struct __queue *queue);
>  
>  #endif
> diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
> index e2e9aa03ffdf..1f86654f0403 100644
> --- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
> +++ b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
> @@ -30,7 +30,6 @@ struct phy_stat {
>  /*  Rx smooth factor */
>  #define	Rx_Smooth_Factor (20)
>  
> -
>  void rtl8192c_translate_rx_signal_stuff(union recv_frame *precvframe, struct phy_stat *pphy_status);
>  void rtl8192c_query_rx_desc_status(union recv_frame *precvframe, struct recv_stat *pdesc);
>  
> diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_dm.h b/drivers/staging/rtl8723bs/include/rtl8723b_dm.h
> index 1d2da5286e7c..50ab7aed079e 100644
> --- a/drivers/staging/rtl8723bs/include/rtl8723b_dm.h
> +++ b/drivers/staging/rtl8723bs/include/rtl8723b_dm.h
> @@ -29,5 +29,4 @@ void rtl8723b_HalDmWatchDog(struct adapter *padapter);
>  void rtl8723b_HalDmWatchDog_in_LPS(struct adapter *padapter);
>  void rtl8723b_hal_dm_in_lps(struct adapter *padapter);
>  
> -
>  #endif
> diff --git a/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h b/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
> index ab349de733c8..c3a1d1a84f78 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
> @@ -7,7 +7,6 @@
>  #ifndef __RTW_IOCTL_SET_H_
>  #define __RTW_IOCTL_SET_H_
>  
> -
>  typedef u8 NDIS_802_11_PMKID_VALUE[16];
>  
>  u8 rtw_set_802_11_authentication_mode(struct adapter *pdapter, enum ndis_802_11_authentication_mode authmode);
> diff --git a/drivers/staging/rtl8723bs/include/rtw_wifi_regd.h b/drivers/staging/rtl8723bs/include/rtw_wifi_regd.h
> index e611651cb40b..e4d8fe9bf68d 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_wifi_regd.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_wifi_regd.h
> @@ -13,5 +13,4 @@ void rtw_regd_init(struct wiphy *wiphy,
>  					struct regulatory_request *request));
>  void rtw_reg_notifier(struct wiphy *wiphy, struct regulatory_request *request);
>  
> -
>  #endif
> diff --git a/drivers/staging/rtl8723bs/include/sdio_ops_linux.h b/drivers/staging/rtl8723bs/include/sdio_ops_linux.h
> index 18830dd18372..cd67a7201065 100644
> --- a/drivers/staging/rtl8723bs/include/sdio_ops_linux.h
> +++ b/drivers/staging/rtl8723bs/include/sdio_ops_linux.h
> @@ -25,6 +25,5 @@ void sd_write32(struct intf_hdl *pintfhdl, u32 addr, u32 v, s32 *err);
>  s32 _sd_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, void *pdata);
>  s32 sd_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, void *pdata);
>  
> -
>  void rtw_sdio_set_irq_thd(struct dvobj_priv *dvobj, void *thd_hdl);
>  #endif
> -- 
> 2.52.0
> 
