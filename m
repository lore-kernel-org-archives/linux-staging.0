Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94061B4F2C;
	Fri, 21 Nov 2025 06:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763708364; cv=none; b=fKQPIzXugdkOGZQadIzeoPUL30suNt2E3q/nUOd1Y7JXPFl6SEEsz9EiAN07Y/ZP2TdzscuCf0xrNQ3iT+noJp9RLGCJvarrUeUGFLPut67GSxrMRzxXb5xtZN2AzYiFk4gptdDuqWsKsdyg/yDcQUuKcBIFNNb/9SaJFgv8JLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763708364; c=relaxed/simple;
	bh=2B6yJMec2EbhLQ/vWqCruPcz01M3t61eMLexO9OkWPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eDxYfRAk90vvRTCfmzjiANKNwGg73WN/pIaIjP78vt3fmO/1OvlMabanpnoynG2OvxGqskmiX1bjQLkDqfowhF8MbGr6qJWMkv0FAJqXEWqg/TX2uMFMegVT4clPaorasv9jnUzKxoy0hSUIdj7kLLOBmnopbN9zNu+llmkbfbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yzFHdKPd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yzFHdKPd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E84C4CEF1;
	Fri, 21 Nov 2025 06:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763708364;
	bh=2B6yJMec2EbhLQ/vWqCruPcz01M3t61eMLexO9OkWPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yzFHdKPdSL6PGaL6AUdcDIYcPfL5bG6YBycIN31VzQQmyF9rK/pvHuCGqD7gZPD9a
	 LxqxSFvjC4Ko3FugH5DqYfAc3to0qe4Rv7pGsqaz0lijAAMVPYXrr6zeUFPidIybEm
	 cYlW8kxYmE3CjzJGV35S45z9yprD7LEj8pFAq0xw=
Date: Fri, 21 Nov 2025 07:59:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Artur Stupa <arthur.stupa@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org
Subject: Re: [PATCH v3 1/2] staging: rtl8723bs: core: fix block comment style
 issues
Message-ID: <2025112102-unpack-patriot-dd1b@gregkh>
References: <20251120002948.23153-1-arthur.stupa@gmail.com>
 <20251120203056.15314-1-arthur.stupa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120203056.15314-1-arthur.stupa@gmail.com>

On Thu, Nov 20, 2025 at 12:30:43PM -0800, Artur Stupa wrote:
> Fix the following checkpatch warnings for block comments:
> * Block comments should align the * on each line
> * Block comments use * on subsequent lines
> * Block comments use a trailing */ on a separate line
> 
> No functional changes.
> 
> Signed-off-by: Artur Stupa <arthur.stupa@gmail.com>
> ---
>  .../staging/rtl8723bs/core/rtw_ieee80211.c    | 22 +++---
>  drivers/staging/rtl8723bs/core/rtw_io.c       | 48 ++++++-----
>  drivers/staging/rtl8723bs/core/rtw_mlme.c     | 76 ++++++++----------
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 59 ++++----------
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 10 +--
>  drivers/staging/rtl8723bs/core/rtw_security.c | 79 +++++++++----------
>  .../staging/rtl8723bs/core/rtw_wlan_util.c    |  6 +-
>  7 files changed, 128 insertions(+), 172 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> index 027b2dd0a4b9..10911a661223 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> @@ -132,9 +132,7 @@ u8 *rtw_set_ie(u8 *pbuf,
>  	return pbuf + len + 2;
>  }
>  
> -/*----------------------------------------------------------------------------
> -index: the information element id index, limit is the limit for search
> ------------------------------------------------------------------------------*/
> +/* index: the information element id index, limit is the limit for search */
>  u8 *rtw_get_ie(u8 *pbuf, signed int index, signed int *len, signed int limit)
>  {
>  	signed int tmp, i;
> @@ -767,21 +765,27 @@ static int rtw_ieee802_11_parse_vendor_specific(u8 *pos, uint elen,
>  {
>  	unsigned int oui;
>  
> -	/* first 3 bytes in vendor specific information element are the IEEE
> +	/*
> +	 * first 3 bytes in vendor specific information element are the IEEE
>  	 * OUI of the vendor. The following byte is used a vendor specific
> -	 * sub-type. */
> +	 * sub-type.
> +	 */
>  	if (elen < 4)
>  		return -1;
>  
>  	oui = get_unaligned_be24(pos);
>  	switch (oui) {
>  	case OUI_MICROSOFT:
> -		/* Microsoft/Wi-Fi information elements are further typed and
> -		 * subtyped */
> +		/*
> +		 * Microsoft/Wi-Fi information elements are further typed and
> +		 * subtyped
> +		 */
>  		switch (pos[3]) {
>  		case 1:
> -			/* Microsoft OUI (00:50:F2) with OUI Type 1:
> -			 * real WPA information element */
> +			/*
> +			 * Microsoft OUI (00:50:F2) with OUI Type 1:
> +			 * real WPA information element
> +			 */
>  			elems->wpa_ie = pos;
>  			elems->wpa_ie_len = elen;
>  			break;
> diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
> index 79d543d88278..fe9f94001eed 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_io.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_io.c
> @@ -5,25 +5,23 @@
>   *
>   ******************************************************************************/
>  /*
> -
> -The purpose of rtw_io.c
> -
> -a. provides the API
> -
> -b. provides the protocol engine
> -
> -c. provides the software interface between caller and the hardware interface
> -
> -
> -Compiler Flag Option:
> -
> -1. CONFIG_SDIO_HCI:
> -    a. USE_SYNC_IRP:  Only sync operations are provided.
> -    b. USE_ASYNC_IRP:Both sync/async operations are provided.
> -
> -jackson@realtek.com.tw
> -
> -*/
> + * The purpose of rtw_io.c
> + *
> + * a. provides the API
> + *
> + * b. provides the protocol engine
> + *
> + * c. provides the software interface between caller and the hardware interface
> + *
> + *
> + * Compiler Flag Option:
> + *
> + * 1. CONFIG_SDIO_HCI:
> + *  a. USE_SYNC_IRP:  Only sync operations are provided.
> + *  b. USE_ASYNC_IRP:Both sync/async operations are provided.
> + *
> + *  jackson@realtek.com.tw
> + */
>  
>  #include <drv_types.h>
>  
> @@ -135,10 +133,10 @@ int rtw_init_io_priv(struct adapter *padapter, void (*set_intf_ops)(struct adapt
>  }
>  
>  /*
> -* Increase and check if the continual_io_error of this @param dvobjprive is larger than MAX_CONTINUAL_IO_ERR
> -* @return true:
> -* @return false:
> -*/
> + * Increase and check if the continual_io_error of this @param dvobjprive is larger than MAX_CONTINUAL_IO_ERR
> + * @return true:
> + * @return false:
> + */
>  int rtw_inc_and_chk_continual_io_error(struct dvobj_priv *dvobj)
>  {
>  	int error_count = atomic_inc_return(&dvobj->continual_io_error);
> @@ -149,9 +147,7 @@ int rtw_inc_and_chk_continual_io_error(struct dvobj_priv *dvobj)
>  	return false;
>  }
>  
> -/*
> -* Set the continual_io_error of this @param dvobjprive to 0
> -*/
> +/* Set the continual_io_error of this @param dvobjprive to 0 */
>  void rtw_reset_continual_io_error(struct dvobj_priv *dvobj)
>  {
>  	atomic_set(&dvobj->continual_io_error, 0);
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index c06d990350e6..98704179ad35 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -214,10 +214,10 @@ void _rtw_free_network_nolock(struct	mlme_priv *pmlmepriv, struct wlan_network *
>  }
>  
>  /*
> -	return the wlan_network with the matching addr
> -
> -	Shall be called under atomic context... to avoid possible racing condition...
> -*/
> + * return the wlan_network with the matching addr
> + *
> + * Shall be called under atomic context... to avoid possible racing condition...
> + */
>  struct wlan_network *_rtw_find_network(struct __queue *scanned_queue, u8 *addr)
>  {
>  	struct list_head	*phead, *plist;
> @@ -319,10 +319,10 @@ void rtw_free_network_nolock(struct adapter *padapter, struct wlan_network *pnet
>  }
>  
>  /*
> -	return the wlan_network with the matching addr
> -
> -	Shall be called under atomic context... to avoid possible racing condition...
> -*/
> + * return the wlan_network with the matching addr
> + *
> + * Shall be called under atomic context... to avoid possible racing condition...
> + */
>  struct	wlan_network *rtw_find_network(struct __queue *scanned_queue, u8 *addr)
>  {
>  	struct	wlan_network *pnetwork = _rtw_find_network(scanned_queue, addr);
> @@ -476,9 +476,7 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
>  	}
>  }
>  
> -/*
> -Caller must hold pmlmepriv->lock first.
> -*/
> +/* Caller must hold pmlmepriv->lock first. */
>  void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *target)
>  {
>  	struct list_head	*plist, *phead;
> @@ -510,8 +508,10 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
>  			oldest = pnetwork;
>  	}
>  
> -	/* If we didn't find a match, then get a new network slot to initialize
> -	 * with this beacon's information */
> +	/*
> +	 * If we didn't find a match, then get a new network slot to initialize
> +	 * with this beacon's information
> +	 */
>  	if (!target_find) {
>  		if (list_empty(&pmlmepriv->free_bss_pool.queue)) {
>  			/* If there are no more slots, expire the oldest */
> @@ -843,9 +843,7 @@ static void find_network(struct adapter *adapter)
>  		rtw_free_network_nolock(adapter, pwlan);
>  }
>  
> -/*
> -*rtw_free_assoc_resources: the caller has to lock pmlmepriv->lock
> -*/
> +/* rtw_free_assoc_resources: the caller has to lock pmlmepriv->lock */
>  void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
>  {
>  	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
> @@ -879,9 +877,7 @@ void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
>  	rtw_reset_rx_info(pdbgpriv);
>  }
>  
> -/*
> -*rtw_indicate_connect: the caller has to lock pmlmepriv->lock
> -*/
> +/* rtw_indicate_connect: the caller has to lock pmlmepriv->lock */
>  void rtw_indicate_connect(struct adapter *padapter)
>  {
>  	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
> @@ -908,9 +904,7 @@ void rtw_indicate_connect(struct adapter *padapter)
>  	rtw_set_scan_deny(padapter, 3000);
>  }
>  
> -/*
> -*rtw_indicate_disconnect: the caller has to lock pmlmepriv->lock
> -*/
> +/* rtw_indicate_disconnect: the caller has to lock pmlmepriv->lock */
>  void rtw_indicate_disconnect(struct adapter *padapter)
>  {
>  	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
> @@ -1543,9 +1537,9 @@ void rtw_wmm_event_callback(struct adapter *padapter, u8 *pbuf)
>  }
>  
>  /*
> -* _rtw_join_timeout_handler - Timeout/failure handler for CMD JoinBss
> -* @adapter: pointer to struct adapter structure
> -*/
> + * _rtw_join_timeout_handler - Timeout/failure handler for CMD JoinBss
> + * @adapter: pointer to struct adapter structure
> + */
>  void _rtw_join_timeout_handler(struct timer_list *t)
>  {
>  	struct adapter *adapter = timer_container_of(adapter, t,
> @@ -1586,9 +1580,9 @@ void _rtw_join_timeout_handler(struct timer_list *t)
>  }
>  
>  /*
> -* rtw_scan_timeout_handler - Timeout/Failure handler for CMD SiteSurvey
> -* @adapter: pointer to struct adapter structure
> -*/
> + * rtw_scan_timeout_handler - Timeout/Failure handler for CMD SiteSurvey
> + * @adapter: pointer to struct adapter structure
> + */
>  void rtw_scan_timeout_handler(struct timer_list *t)
>  {
>  	struct adapter *adapter = timer_container_of(adapter, t,
> @@ -1704,10 +1698,10 @@ void rtw_set_scan_deny(struct adapter *adapter, u32 ms)
>  }
>  
>  /*
> -* Select a new roaming candidate from the original @param candidate and @param competitor
> -* @return true: candidate is updated
> -* @return false: candidate is not updated
> -*/
> + * Select a new roaming candidate from the original @param candidate and @param competitor
> + * @return true: candidate is updated
> + * @return false: candidate is not updated
> + */
>  static int rtw_check_roaming_candidate(struct mlme_priv *mlme
>  	, struct wlan_network **candidate, struct wlan_network *competitor)
>  {
> @@ -1785,10 +1779,10 @@ int rtw_select_roaming_candidate(struct mlme_priv *mlme)
>  }
>  
>  /*
> -* Select a new join candidate from the original @param candidate and @param competitor
> -* @return true: candidate is updated
> -* @return false: candidate is not updated
> -*/
> + * Select a new join candidate from the original @param candidate and @param competitor
> + * @return true: candidate is updated
> + * @return false: candidate is not updated
> + */
>  static int rtw_check_join_candidate(struct mlme_priv *mlme
>  	, struct wlan_network **candidate, struct wlan_network *competitor)
>  {
> @@ -1829,11 +1823,11 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
>  }
>  
>  /*
> -Calling context:
> -The caller of the sub-routine will be in critical section...
> -The caller must hold the following spinlock
> -pmlmepriv->lock
> -*/
> + * Calling context:
> + * The caller of the sub-routine will be in critical section...
> + * The caller must hold the following spinlock
> + * pmlmepriv->lock
> + */
>  
>  int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv)
>  {
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index 8fe0555ab033..016609cd1292 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -18,9 +18,7 @@ static struct mlme_handler mlme_sta_tbl[] = {
>  	{WIFI_PROBEREQ,		"OnProbeReq",	&OnProbeReq},
>  	{WIFI_PROBERSP,		"OnProbeRsp",		&OnProbeRsp},
>  
> -	/*----------------------------------------------------------
> -					below 2 are reserved
> -	-----------------------------------------------------------*/
> +	/* below 2 are reserved */
>  	{0,					"DoReserved",		&DoReserved},
>  	{0,					"DoReserved",		&DoReserved},
>  	{WIFI_BEACON,		"OnBeacon",		&OnBeacon},
> @@ -50,9 +48,7 @@ static struct action_handler OnAction_tbl[] = {
>  
>  static u8 null_addr[ETH_ALEN] = {0, 0, 0, 0, 0, 0};
>  
> -/**************************************************
> -OUI definitions for the vendor specific IE
> -***************************************************/
> +/* OUI definitions for the vendor specific IE */
>  unsigned char RTW_WPA_OUI[] = {0x00, 0x50, 0xf2, 0x01};
>  unsigned char WMM_OUI[] = {0x00, 0x50, 0xf2, 0x02};
>  unsigned char WPS_OUI[] = {0x00, 0x50, 0xf2, 0x04};
> @@ -64,9 +60,7 @@ unsigned char WMM_PARA_OUI[] = {0x00, 0x50, 0xf2, 0x02, 0x01, 0x01};
>  
>  static unsigned char REALTEK_96B_IE[] = {0x00, 0xe0, 0x4c, 0x02, 0x01, 0x20};
>  
> -/********************************************************
> -ChannelPlan definitions
> -*********************************************************/
> +/* ChannelPlan definitions */
>  static struct rt_channel_plan_2g	RTW_ChannelPlan2G[RT_CHANNEL_DOMAIN_2G_MAX] = {
>  	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, 13},		/*  0x00, RT_CHANNEL_DOMAIN_2G_WORLD , Passive scan CH 12, 13 */
>  	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, 13},		/*  0x01, RT_CHANNEL_DOMAIN_2G_ETSI1 */
> @@ -187,11 +181,7 @@ int rtw_ch_set_search_ch(struct rt_channel_info *ch_set, const u32 ch)
>  	return i;
>  }
>  
> -/****************************************************************************
> -
> -Following are the initialization functions for WiFi MLME
> -
> -*****************************************************************************/
> +/* Following are the initialization functions for WiFi MLME */
>  
>  int init_hw_mlme_ext(struct adapter *padapter)
>  {
> @@ -507,11 +497,7 @@ void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame)
>  	}
>  }
>  
> -/****************************************************************************
> -
> -Following are the callback functions for each subtype of the management frames
> -
> -*****************************************************************************/
> +/* Following are the callback functions for each subtype of the management frames */
>  
>  unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame)
>  {
> @@ -1950,11 +1936,7 @@ inline struct xmit_frame *alloc_mgtxmitframe(struct xmit_priv *pxmitpriv)
>  	return _alloc_mgtxmitframe(pxmitpriv, false);
>  }
>  
> -/****************************************************************************
> -
> -Following are some TX functions for WiFi MLME
> -
> -*****************************************************************************/
> +/* Following are some TX functions for WiFi MLME */
>  
>  void update_mgnt_tx_rate(struct adapter *padapter, u8 rate)
>  {
> @@ -3797,11 +3779,7 @@ unsigned int send_beacon(struct adapter *padapter)
>  		return _SUCCESS;
>  }
>  
> -/****************************************************************************
> -
> -Following are some utility functions for WiFi MLME
> -
> -*****************************************************************************/
> +/* Following are some utility functions for WiFi MLME */
>  
>  void site_survey(struct adapter *padapter)
>  {
> @@ -4392,11 +4370,7 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
>  	}
>  }
>  
> -/****************************************************************************
> -
> -Following are the functions to report events
> -
> -*****************************************************************************/
> +/* Following are the functions to report events */
>  
>  void report_survey_event(struct adapter *padapter, union recv_frame *precv_frame)
>  {
> @@ -4692,11 +4666,7 @@ void report_add_sta_event(struct adapter *padapter, unsigned char *MacAddr, int
>  	rtw_enqueue_cmd(pcmdpriv, pcmd_obj);
>  }
>  
> -/****************************************************************************
> -
> -Following are the event callback functions
> -
> -*****************************************************************************/
> +/* Following are the event callback functions */
>  
>  /* for sta/adhoc mode */
>  void update_sta_info(struct adapter *padapter, struct sta_info *psta)
> @@ -4863,8 +4833,10 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
>  
>  		rtw_sta_media_status_rpt(padapter, psta, 1);
>  
> -		/* wakeup macid after join bss successfully to ensure
> -			the subsequent data frames can be sent out normally */
> +		/*
> +		 * wakeup macid after join bss successfully to ensure
> +		 * the subsequent data frames can be sent out normally
> +		 */
>  		rtw_hal_macid_wakeup(padapter, psta->mac_id);
>  	}
>  
> @@ -4940,11 +4912,8 @@ void mlmeext_sta_del_event_callback(struct adapter *padapter)
>  		rtw_mlmeext_disconnect(padapter);
>  }
>  
> -/****************************************************************************
> -
> -Following are the functions for the timer handlers
> +/* Following are the functions for the timer handlers */
>  
> -*****************************************************************************/
>  void _linked_info_dump(struct adapter *padapter)
>  {
>  	int i;
> diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> index 7b643ac320f0..0ef788abf403 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> @@ -999,11 +999,11 @@ inline void rtw_set_ips_deny(struct adapter *padapter, u32 ms)
>  }
>  
>  /*
> -* rtw_pwr_wakeup - Wake the NIC up from: 1)IPS. 2)USB autosuspend
> -* @adapter: pointer to struct adapter structure
> -* @ips_deffer_ms: the ms will prevent from falling into IPS after wakeup
> -* Return _SUCCESS or _FAIL
> -*/
> + * rtw_pwr_wakeup - Wake the NIC up from: 1)IPS. 2)USB autosuspend
> + * @adapter: pointer to struct adapter structure
> + * @ips_deffer_ms: the ms will prevent from falling into IPS after wakeup
> + * Return _SUCCESS or _FAIL
> + */
>  
>  int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_deffer_ms, const char *caller)
>  {
> diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
> index b2c783ada49b..2f941ffbd465 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_security.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_security.c
> @@ -30,9 +30,7 @@ const char *security_type_str(u8 value)
>  
>  /* WEP related ===== */
>  
> -/*
> -	Need to consider the fragment  situation
> -*/
> +/* Need to consider the fragment  situation */
>  void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
>  {																	/*  exclude ICV */
>  	union {
> @@ -343,23 +341,20 @@ static const unsigned short Sbox1[2][256] = {      /* Sbox for hash (can be in R
>  	}
>  };
>  
> - /*
> -**********************************************************************
> -* Routine: Phase 1 -- generate P1K, given TA, TK, IV32
> -*
> -* Inputs:
> -*     tk[]      = temporal key                         [128 bits]
> -*     ta[]      = transmitter's MAC address            [ 48 bits]
> -*     iv32      = upper 32 bits of IV                  [ 32 bits]
> -* Output:
> -*     p1k[]     = Phase 1 key                          [ 80 bits]
> -*
> -* Note:
> -*     This function only needs to be called every 2**16 packets,
> -*     although in theory it could be called every packet.
> -*
> -**********************************************************************
> -*/
> +/*
> + * Routine: Phase 1 -- generate P1K, given TA, TK, IV32
> + *
> + * Inputs:
> + *     tk[]      = temporal key                         [128 bits]
> + *     ta[]      = transmitter's MAC address            [ 48 bits]
> + *     iv32      = upper 32 bits of IV                  [ 32 bits]
> + * Output:
> + *     p1k[]     = Phase 1 key                          [ 80 bits]
> + *
> + * Note:
> + *     This function only needs to be called every 2**16 packets,
> + *     although in theory it could be called every packet.
> + */
>  static void phase1(u16 *p1k, const u8 *tk, const u8 *ta, u32 iv32)
>  {
>  	signed int  i;
> @@ -386,28 +381,25 @@ static void phase1(u16 *p1k, const u8 *tk, const u8 *ta, u32 iv32)
>  
>  
>  /*
> -**********************************************************************
> -* Routine: Phase 2 -- generate RC4KEY, given TK, P1K, IV16
> -*
> -* Inputs:
> -*     tk[]      = Temporal key                         [128 bits]
> -*     p1k[]     = Phase 1 output key                   [ 80 bits]
> -*     iv16      = low 16 bits of IV counter            [ 16 bits]
> -* Output:
> -*     rc4key[]  = the key used to encrypt the packet   [128 bits]
> -*
> -* Note:
> -*     The value {TA, IV32, IV16} for Phase1/Phase2 must be unique
> -*     across all packets using the same key TK value. Then, for a
> -*     given value of TK[], this TKIP48 construction guarantees that
> -*     the final RC4KEY value is unique across all packets.
> -*
> -* Suggested implementation optimization: if PPK[] is "overlaid"
> -*     appropriately on RC4KEY[], there is no need for the final
> -*     for loop below that copies the PPK[] result into RC4KEY[].
> -*
> -**********************************************************************
> -*/
> + * Routine: Phase 2 -- generate RC4KEY, given TK, P1K, IV16
> + *
> + * Inputs:
> + *     tk[]      = Temporal key                         [128 bits]
> + *     p1k[]     = Phase 1 output key                   [ 80 bits]
> + *     iv16      = low 16 bits of IV counter            [ 16 bits]
> + * Output:
> + *     rc4key[]  = the key used to encrypt the packet   [128 bits]
> + *
> + * Note:
> + *     The value {TA, IV32, IV16} for Phase1/Phase2 must be unique
> + *     across all packets using the same key TK value. Then, for a
> + *     given value of TK[], this TKIP48 construction guarantees that
> + *     the final RC4KEY value is unique across all packets.
> + *
> + * Suggested implementation optimization: if PPK[] is "overlaid"
> + *     appropriately on RC4KEY[], there is no need for the final
> + *     for loop below that copies the PPK[] result into RC4KEY[].
> + */
>  static void phase2(u8 *rc4key, const u8 *tk, const u16 *p1k, u16 iv16)
>  {
>  	signed int  i;
> @@ -1483,7 +1475,8 @@ static int omac1_aes_128_vector(u8 *key, size_t num_elem,
>   * This is a mode for using block cipher (AES in this case) for authentication.
>   * OMAC1 was standardized with the name CMAC by NIST in a Special Publication
>   * (SP) 800-38B.
> - * modify for CONFIG_IEEE80211W */
> + * modify for CONFIG_IEEE80211W
> + */
>  int omac1_aes_128(u8 *key, u8 *data, size_t data_len, u8 *mac)
>  {
>  	return omac1_aes_128_vector(key, 1, &data, &data_len, mac);
> diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> index 74d3f2de360d..c8909ffe0248 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> @@ -1021,9 +1021,9 @@ void HTOnAssocRsp(struct adapter *padapter)
>  
>  	/* handle A-MPDU parameter field */
>  	/*
> -		AMPDU_para [1:0]:Max AMPDU Len => 0:8k , 1:16k, 2:32k, 3:64k
> -		AMPDU_para [4:2]:Min MPDU Start Spacing
> -	*/
> +	 * AMPDU_para [1:0]:Max AMPDU Len => 0:8k , 1:16k, 2:32k, 3:64k
> +	 * AMPDU_para [4:2]:Min MPDU Start Spacing
> +	 */
>  	max_AMPDU_len = pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x03;
>  
>  	min_MPDU_spacing = (pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x1c) >> 2;
> -- 
> 2.43.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
