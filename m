Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8862C8B
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 02:44:36 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id t184so2413183pfd.0
        for <linux-staging@lists.linux.dev>; Thu, 21 Oct 2021 19:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=q9J8i6Oqi3Nvd9zUswhsYqfhpvCKVlNc8BWk095FDAU=;
        b=lJwxMYf9CwG56NQtiiSYnkT6kXackF8N/Wz6fmmNtssgd1MttrspLPK1+83CkGWOYy
         o19WWe/YnwTvyDQ7RMm0mjRxo1D40YdypZ9TrFgLKa2FO2ea5aP1nlUJCHy2h0HHK7IA
         y1kvVvTGKqDYWzxIHKuNv5COgnFeMgUxTjePNq6FZ7jNRZCGxv8u9xwqz2SnJOaeJcRD
         +pvpOO27DCEjGPwX+U+28Weq7YthX89JRrvdTIx8isCuBow2Khu1UwHHm1xecrfgp7qM
         0yTuBU7RstrIVc8EpZBnhxnQU3ZUGroJko1bZDbVKtuAV6k2R7ZORsKKMlVkKJ+dRDxq
         h8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=q9J8i6Oqi3Nvd9zUswhsYqfhpvCKVlNc8BWk095FDAU=;
        b=lac3IanptryOBItM7LDASwDBe7LEpc72EVb8PVNzjVOrRs7x03gpOmdmiH5T57I9B4
         BnOUhtSbkjCWfMqqv1IbkH/XKbmc5ej6KQbt6jrRHNYa+GtgJGEKDOMhmWGo9SAW5kkd
         np0WQc26GhvqdY2ISV3oJ0lVmfavhc6rp+4dZfD7Sp3GUzWB8LII94xbNY39i0eVfbn7
         NvfPuUJTiysbwuwDrMxUXkfRZ/bQgKyAhZnxJooOcJjg6CSZRnDhxyUN3CZ+GByyxaUo
         X6sxcPsg1BQ0hqXy/nOU2oQVQmohpJfzx2lEy3ZZkZsFgXVvaurbHx/ZdNVMPbFiP6vq
         a6aQ==
X-Gm-Message-State: AOAM5332kRm/pRpZgmbGuyBE7QsuKSDn8QSucGtIWCaXySI+NwWIunOi
	mloZucyGi0CH4M20Np4nT7w=
X-Google-Smtp-Source: ABdhPJw34Peasou5/YcGLPUXQ/L8wadWy4s5NOmtNJCSyl2NmlbFGDgcvjFFcvEs0lJxad3q/EZ3YQ==
X-Received: by 2002:a62:1d46:0:b0:44d:1a4d:5d03 with SMTP id d67-20020a621d46000000b0044d1a4d5d03mr9857794pfd.55.1634870676074;
        Thu, 21 Oct 2021 19:44:36 -0700 (PDT)
Received: from ?IPV6:2405:201:d007:e827:d9ab:a6dc:54b8:e75d? ([2405:201:d007:e827:d9ab:a6dc:54b8:e75d])
        by smtp.gmail.com with ESMTPSA id k14sm6727244pga.65.2021.10.21.19.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 19:44:35 -0700 (PDT)
Message-ID: <32059290-6c59-1cee-5edc-563fe5c2f18b@gmail.com>
Date: Fri, 22 Oct 2021 08:14:29 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [Outreachy kernel] [PATCH 1/4] staging: rtl8723bs: core: Remove
 true and false comparison
Content-Language: en-US
To: Kushal Kothari <kushalkothari285@gmail.com>, gregkh@linuxfoundation.org
Cc: fabioaiuto83@gmail.com, ross.schm.dev@gmail.com, fmdefrancesco@gmail.com,
 marcocesati@gmail.com, straube.linux@gmail.com, philippesdixon@gmail.com,
 manuelpalenzuelamerino@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, mike.rapoport@gmail.com,
 kushalkotharitest@googlegroups.com, outreachy-kernel@googlegroups.com
References: <cover.1634845504.git.kushalkothari285@gmail.com>
 <a9b75b3ab7c83dc5cef541301263fe17a704f026.1634845504.git.kushalkothari285@gmail.com>
From: Praveen Kumar <kpraveen.lkml@gmail.com>
In-Reply-To: <a9b75b3ab7c83dc5cef541301263fe17a704f026.1634845504.git.kushalkothari285@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22-10-2021 01:27, Kushal Kothari wrote:
> Remove comparison to true and false in if statement.
> Issue found with checkpatch.pl.
> CHECK: Using comparison to true is error prone
> CHECK: Using comparison to false is error prone
> 
> Signed-off-by: Kushal Kothari <kushalkothari285@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index 2624e994513f..0be3a8dbeec8 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -371,7 +371,7 @@ void rtw_free_cmd_obj(struct cmd_obj *pcmd)
>  void rtw_stop_cmd_thread(struct adapter *adapter)
>  {
>  	if (adapter->cmdThread &&
> -		atomic_read(&(adapter->cmdpriv.cmdthd_running)) == true &&
> +		atomic_read(&adapter->cmdpriv.cmdthd_running) &&

Lets keep it "atomic_read(&(adapter->cmdpriv.cmdthd_running))"
and remove the parentheses in next patch.

>  		adapter->cmdpriv.stop_req == 0) {
>  		adapter->cmdpriv.stop_req = 1;
>  		complete(&adapter->cmdpriv.cmd_queue_comp);
> @@ -542,7 +542,7 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
>  	struct cmd_priv 	*pcmdpriv = &padapter->cmdpriv;
>  	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
>  
> -	if (check_fwstate(pmlmepriv, _FW_LINKED) == true)
> +	if (check_fwstate(pmlmepriv, _FW_LINKED))
>  		rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_SCAN, 1);
>  
>  	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
> @@ -775,7 +775,7 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
>  	/*  If not,  we have to copy the connecting AP's MAC address to it so that */
>  	/*  the driver just has the bssid information for PMKIDList searching. */
>  
> -	if (pmlmepriv->assoc_by_bssid == false)
> +	if (!pmlmepriv->assoc_by_bssid)
>  		memcpy(&pmlmepriv->assoc_bssid[0], &pnetwork->network.mac_address[0], ETH_ALEN);
>  
>  	psecnetwork->ie_length = rtw_restruct_sec_ie(padapter, &pnetwork->network.ies[0], &psecnetwork->ies[0], pnetwork->network.ie_length);
> @@ -1164,7 +1164,7 @@ u8 rtw_set_chplan_cmd(struct adapter *padapter, u8 chplan, u8 enqueue, u8 swconf
>  	u8 res = _SUCCESS;
>  
>  	/*  check if allow software config */
> -	if (swconfig && rtw_hal_is_disable_sw_channel_plan(padapter) == true) {
> +	if (swconfig && rtw_hal_is_disable_sw_channel_plan(padapter)) {
>  		res = _FAIL;
>  		goto exit;
>  	}
> @@ -1250,7 +1250,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
>  	/*  */
>  	/*  Determine if our traffic is busy now */
>  	/*  */
> -	if ((check_fwstate(pmlmepriv, _FW_LINKED) == true)
> +	if ((check_fwstate(pmlmepriv, _FW_LINKED))
>  		/*&& !MgntInitAdapterInProgress(pMgntInfo)*/) {
>  		/*  if we raise bBusyTraffic in last watchdog, using lower threshold. */
>  		if (pmlmepriv->LinkDetectInfo.bBusyTraffic)
> @@ -1342,7 +1342,7 @@ static void dynamic_chk_wk_hdl(struct adapter *padapter)
>  
>  	pmlmepriv = &(padapter->mlmepriv);
>  
> -	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true)
> +	if (check_fwstate(pmlmepriv, WIFI_AP_STATE))
>  		expire_timeout_chk(padapter);
>  
>  	/* for debug purpose */
> @@ -1377,8 +1377,8 @@ void lps_ctrl_wk_hdl(struct adapter *padapter, u8 lps_ctrl_type)
>  	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
>  	u8 mstatus;
>  
> -	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)
> -		|| (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
> +	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
> +		check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
>  		return;
>  	}
>  
> @@ -1386,7 +1386,7 @@ void lps_ctrl_wk_hdl(struct adapter *padapter, u8 lps_ctrl_type)
>  	case LPS_CTRL_SCAN:
>  		hal_btcoex_ScanNotify(padapter, true);
>  
> -		if (check_fwstate(pmlmepriv, _FW_LINKED) == true) {
> +		if (check_fwstate(pmlmepriv, _FW_LINKED)) {
>  			/*  connect */
>  			LPS_Leave(padapter, "LPS_CTRL_SCAN");
>  		}
> @@ -1512,7 +1512,7 @@ static void rtw_lps_change_dtim_hdl(struct adapter *padapter, u8 dtim)
>  	if (dtim <= 0 || dtim > 16)
>  		return;
>  
> -	if (hal_btcoex_IsBtControlLps(padapter) == true)
> +	if (hal_btcoex_IsBtControlLps(padapter))
>  		return;
>  
>  	mutex_lock(&pwrpriv->lock);
> @@ -1840,7 +1840,7 @@ static void c2h_wk_callback(struct work_struct *work)
>  			continue;
>  		}
>  
> -		if (ccx_id_filter(c2h_evt) == true) {
> +		if (ccx_id_filter(c2h_evt)) {
>  			/* Handle CCX report here */
>  			rtw_hal_c2h_handler(adapter, c2h_evt);
>  			kfree(c2h_evt);
> 


Regards,

~Praveen.
