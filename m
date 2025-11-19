Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6F12C17A0
	for <linux-staging@lists.linux.dev>; Wed, 19 Nov 2025 06:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763533639; cv=none; b=LllWSjcYLlNcgqnzewckRXGmsexvVO1vLv6GBZ2RncVn/3blpHLh6s87zMFR2bX22o7v7UkVY9+2Qgxk+2ycsdXNrB5mEUsgR3h8En9mjZwERrODVtIqSfkpe9qqNjPYrIufhtmj6vyGba6ySxuylZyUIML8fYGD1LwfWWt96Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763533639; c=relaxed/simple;
	bh=few/recAdOcfW53vblM7KJ+tt/5ju8Co/TBjXPZG9dU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Phf6D4s02Lwy91BW8B8K1y40u8vWYkla/glFYdyRRZChR6jiNXPyIIlv5oeNCfto3nYys1dxES3aQA0SuwFLOd8+AKEO+B112ROA5XCi5x0Am91jDFT7S18G0g+0Ej7cr46LNcOpWAS/HjeM8tRxtyjRTD/lap2Vz9bTTK7GszU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVf1gjTV; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVf1gjTV"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-343ea89896eso6366389a91.2
        for <linux-staging@lists.linux.dev>; Tue, 18 Nov 2025 22:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763533636; x=1764138436; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kSik/hqJY6uQJXt0ntFdhTi0p+xzQjXt/XbyHMNi+hw=;
        b=OVf1gjTV9FNN7YewX9Zau2QpuA1Ffw8Zc/d0g91TB5Kpc5J7kGOObWg1Pk8McDdq8f
         /iqyLTXJRxY2XOws+RqRu0iSN4RCJPOvFOvyDPCPHeyaW/83S79HnUQzwKT6zsoJeFnm
         /+nrtrKn3f2JPHdbysroz0dUE0c7QvBO+t0/aGbKm9ECqW5tX8c30crhIzUhnzGe2Yjc
         qMC1ofBhxgg7rUcUl1oTsrZl9FILO1s7RvOOPgacDfWrAcd+A5UtGTRuA3bEQJnDis9S
         Y24ayIBYY0MHd0HsQF/rVS1CiDdKy8sB1LCov9W+L4dr15ktTRp/qdvDlES10OkLL2hU
         tfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763533636; x=1764138436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSik/hqJY6uQJXt0ntFdhTi0p+xzQjXt/XbyHMNi+hw=;
        b=NzG9GmxI6dC4UjeCwMTuPBhNe+GlsoDtWZktK/RvZfaTX38ofA9X701z3jZyLQJWm5
         V/5Gnvan2TCAos1rv2NQ289zatEIU6ANPwjt9YujVFyKvZevHCg3cjz7OuNEv81fh+YV
         MfLwMblD+u4eMp/L8zFYr4wnzenXSq0WyHPkPvG41PWycGXG5OdOnY5EHiTGuCVnE691
         x2vWowAO5agUlMzW/p30jWIunEaQdvbvOq2bKI4NBs3Z6P23IP9khoZE7snX1Cao9jtL
         3SQ7wqtwOgPObXL5rK1H/E4o6vOXUnouTrpVah0uK9KJxTio0mFzXySOjPCBGDDQK4ST
         ySXg==
X-Gm-Message-State: AOJu0YxvqJZmBHgHfKCX7SZpp3b72cCEO0aWtjB1IIrPgxtF+0J5r32l
	9b4o5rsQnjchuTaoOprpqydJG+BDk0Z2UGtgIFvUnQNBO9xBFaFlBnkS
X-Gm-Gg: ASbGnct6YH5lE35dRHcpnqDjpIZngqwL9I02A158rVIgLgByAxhkcZalFrh8D5T73FL
	Ddbd7k446TTOVLUG0Cd9bQq9hfmQWXBUTB/F7GRNkUx8rjQc+3RF3B0FxMknywxQAxQwf8H7Iw/
	EQpIYZ7xCg7omItwg4/lSiy/d5ldQjfqiJuhOxyTuI9mFZNJlOTUaGtU3FXKwGuOnV2xkM7b8JZ
	J+gdM1sK2X+gHGz+kOPysCNwDowulZebEfmPIdYk+X9ioxTvVB8hu51hvyLJieCf/r/xojjhNiT
	5krp2J+tr3plW/RZer0OJPs25P+tg8es3gmDkF8iHeeJws9tmv4x+ajwEqJqapn4ItPMXE4HYS7
	3lrv6t0lgPNayMRVBF3efmj2c9eSrXiAGb6jEYS2Z93UFMpge+MdCKXjVaWxgOGlK2NXErFebtg
	nNAvLgmFbado6SGs2B/xvAMEqynGDkOt5VMvwiGativD90M7x/kKR4GRXOoxs3vGJYrCTKCfodx
	gZPV5s2RM1TET5luoV3DzAktUsk0XK7MtQTzblFBg==
X-Google-Smtp-Source: AGHT+IHu9kCY2nVl01ucwCzHU+ppI6/17K10GvjoyFkmg42G4zI90nikifbreC3DcgzrOwW8FLfpGA==
X-Received: by 2002:a17:90b:17cc:b0:340:d511:e167 with SMTP id 98e67ed59e1d1-343f99c41d7mr20731166a91.0.1763533636292;
        Tue, 18 Nov 2025 22:27:16 -0800 (PST)
Received: from main.. (c-76-146-85-33.hsd1.wa.comcast.net. [76.146.85.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345b03971fcsm2322705a91.5.2025.11.18.22.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 22:27:15 -0800 (PST)
From: Artur Stupa <arthur.stupa@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artur Stupa <arthur.stupa@gmail.com>
Subject: [PATCH] staging: rtl8723bs: core: fix block comment style issues
Date: Tue, 18 Nov 2025 22:26:40 -0800
Message-ID: <20251119062701.38279-1-arthur.stupa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following checkpatch warnings for block comments:
* Block comments should align the * on each line
* Block comments use * on subsequent lines

No functional changes.

Signed-off-by: Artur Stupa <arthur.stupa@gmail.com>
---
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  4 +-
 drivers/staging/rtl8723bs/core/rtw_io.c       | 48 ++++++-----
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 70 ++++++++--------
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 70 ++++++++--------
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 10 +--
 drivers/staging/rtl8723bs/core/rtw_security.c | 82 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |  8 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 17 ++--
 8 files changed, 153 insertions(+), 156 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 027b2dd0a4b9..a5234fdbf984 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -133,8 +133,8 @@ u8 *rtw_set_ie(u8 *pbuf,
 }
 
 /*----------------------------------------------------------------------------
-index: the information element id index, limit is the limit for search
------------------------------------------------------------------------------*/
+ * index: the information element id index, limit is the limit for search
+ *--------------------------------------------------------------------------*/
 u8 *rtw_get_ie(u8 *pbuf, signed int index, signed int *len, signed int limit)
 {
 	signed int tmp, i;
diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index 79d543d88278..5d3b6d810aac 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -5,25 +5,23 @@
  *
  ******************************************************************************/
 /*
-
-The purpose of rtw_io.c
-
-a. provides the API
-
-b. provides the protocol engine
-
-c. provides the software interface between caller and the hardware interface
-
-
-Compiler Flag Option:
-
-1. CONFIG_SDIO_HCI:
-    a. USE_SYNC_IRP:  Only sync operations are provided.
-    b. USE_ASYNC_IRP:Both sync/async operations are provided.
-
-jackson@realtek.com.tw
-
-*/
+ * The purpose of rtw_io.c
+ *
+ * a. provides the API
+ *
+ * b. provides the protocol engine
+ *
+ * c. provides the software interface between caller and the hardware interface
+ *
+ *
+ * Compiler Flag Option:
+ *
+ * 1. CONFIG_SDIO_HCI:
+ *  a. USE_SYNC_IRP:  Only sync operations are provided.
+ *  b. USE_ASYNC_IRP:Both sync/async operations are provided.
+ *
+ *  jackson@realtek.com.tw
+ */
 
 #include <drv_types.h>
 
@@ -135,10 +133,10 @@ int rtw_init_io_priv(struct adapter *padapter, void (*set_intf_ops)(struct adapt
 }
 
 /*
-* Increase and check if the continual_io_error of this @param dvobjprive is larger than MAX_CONTINUAL_IO_ERR
-* @return true:
-* @return false:
-*/
+ * Increase and check if the continual_io_error of this @param dvobjprive is larger than MAX_CONTINUAL_IO_ERR
+ * @return true:
+ * @return false:
+ */
 int rtw_inc_and_chk_continual_io_error(struct dvobj_priv *dvobj)
 {
 	int error_count = atomic_inc_return(&dvobj->continual_io_error);
@@ -150,8 +148,8 @@ int rtw_inc_and_chk_continual_io_error(struct dvobj_priv *dvobj)
 }
 
 /*
-* Set the continual_io_error of this @param dvobjprive to 0
-*/
+ * Set the continual_io_error of this @param dvobjprive to 0
+ */
 void rtw_reset_continual_io_error(struct dvobj_priv *dvobj)
 {
 	atomic_set(&dvobj->continual_io_error, 0);
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index c06d990350e6..16b130d8fe5b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -214,10 +214,10 @@ void _rtw_free_network_nolock(struct	mlme_priv *pmlmepriv, struct wlan_network *
 }
 
 /*
-	return the wlan_network with the matching addr
-
-	Shall be called under atomic context... to avoid possible racing condition...
-*/
+ * return the wlan_network with the matching addr
+ *
+ * Shall be called under atomic context... to avoid possible racing condition...
+ */
 struct wlan_network *_rtw_find_network(struct __queue *scanned_queue, u8 *addr)
 {
 	struct list_head	*phead, *plist;
@@ -319,10 +319,10 @@ void rtw_free_network_nolock(struct adapter *padapter, struct wlan_network *pnet
 }
 
 /*
-	return the wlan_network with the matching addr
-
-	Shall be called under atomic context... to avoid possible racing condition...
-*/
+ * return the wlan_network with the matching addr
+ *
+ * Shall be called under atomic context... to avoid possible racing condition...
+ */
 struct	wlan_network *rtw_find_network(struct __queue *scanned_queue, u8 *addr)
 {
 	struct	wlan_network *pnetwork = _rtw_find_network(scanned_queue, addr);
@@ -477,8 +477,8 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 }
 
 /*
-Caller must hold pmlmepriv->lock first.
-*/
+ * Caller must hold pmlmepriv->lock first.
+ */
 void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *target)
 {
 	struct list_head	*plist, *phead;
@@ -844,8 +844,8 @@ static void find_network(struct adapter *adapter)
 }
 
 /*
-*rtw_free_assoc_resources: the caller has to lock pmlmepriv->lock
-*/
+ * rtw_free_assoc_resources: the caller has to lock pmlmepriv->lock
+ */
 void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
 {
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
@@ -880,8 +880,8 @@ void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
 }
 
 /*
-*rtw_indicate_connect: the caller has to lock pmlmepriv->lock
-*/
+ * rtw_indicate_connect: the caller has to lock pmlmepriv->lock
+ */
 void rtw_indicate_connect(struct adapter *padapter)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -909,8 +909,8 @@ void rtw_indicate_connect(struct adapter *padapter)
 }
 
 /*
-*rtw_indicate_disconnect: the caller has to lock pmlmepriv->lock
-*/
+ * rtw_indicate_disconnect: the caller has to lock pmlmepriv->lock
+ */
 void rtw_indicate_disconnect(struct adapter *padapter)
 {
 	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -1543,9 +1543,9 @@ void rtw_wmm_event_callback(struct adapter *padapter, u8 *pbuf)
 }
 
 /*
-* _rtw_join_timeout_handler - Timeout/failure handler for CMD JoinBss
-* @adapter: pointer to struct adapter structure
-*/
+ * _rtw_join_timeout_handler - Timeout/failure handler for CMD JoinBss
+ * @adapter: pointer to struct adapter structure
+ */
 void _rtw_join_timeout_handler(struct timer_list *t)
 {
 	struct adapter *adapter = timer_container_of(adapter, t,
@@ -1586,9 +1586,9 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 }
 
 /*
-* rtw_scan_timeout_handler - Timeout/Failure handler for CMD SiteSurvey
-* @adapter: pointer to struct adapter structure
-*/
+ * rtw_scan_timeout_handler - Timeout/Failure handler for CMD SiteSurvey
+ * @adapter: pointer to struct adapter structure
+ */
 void rtw_scan_timeout_handler(struct timer_list *t)
 {
 	struct adapter *adapter = timer_container_of(adapter, t,
@@ -1704,10 +1704,10 @@ void rtw_set_scan_deny(struct adapter *adapter, u32 ms)
 }
 
 /*
-* Select a new roaming candidate from the original @param candidate and @param competitor
-* @return true: candidate is updated
-* @return false: candidate is not updated
-*/
+ * Select a new roaming candidate from the original @param candidate and @param competitor
+ * @return true: candidate is updated
+ * @return false: candidate is not updated
+ */
 static int rtw_check_roaming_candidate(struct mlme_priv *mlme
 	, struct wlan_network **candidate, struct wlan_network *competitor)
 {
@@ -1785,10 +1785,10 @@ int rtw_select_roaming_candidate(struct mlme_priv *mlme)
 }
 
 /*
-* Select a new join candidate from the original @param candidate and @param competitor
-* @return true: candidate is updated
-* @return false: candidate is not updated
-*/
+ * Select a new join candidate from the original @param candidate and @param competitor
+ * @return true: candidate is updated
+ * @return false: candidate is not updated
+ */
 static int rtw_check_join_candidate(struct mlme_priv *mlme
 	, struct wlan_network **candidate, struct wlan_network *competitor)
 {
@@ -1829,11 +1829,11 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
 }
 
 /*
-Calling context:
-The caller of the sub-routine will be in critical section...
-The caller must hold the following spinlock
-pmlmepriv->lock
-*/
+ * Calling context:
+ * The caller of the sub-routine will be in critical section...
+ * The caller must hold the following spinlock
+ * pmlmepriv->lock
+ */
 
 int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv)
 {
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 8fe0555ab033..86d117dd2534 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -19,8 +19,8 @@ static struct mlme_handler mlme_sta_tbl[] = {
 	{WIFI_PROBERSP,		"OnProbeRsp",		&OnProbeRsp},
 
 	/*----------------------------------------------------------
-					below 2 are reserved
-	-----------------------------------------------------------*/
+	 *				below 2 are reserved
+	 *--------------------------------------------------------*/
 	{0,					"DoReserved",		&DoReserved},
 	{0,					"DoReserved",		&DoReserved},
 	{WIFI_BEACON,		"OnBeacon",		&OnBeacon},
@@ -51,8 +51,8 @@ static struct action_handler OnAction_tbl[] = {
 static u8 null_addr[ETH_ALEN] = {0, 0, 0, 0, 0, 0};
 
 /**************************************************
-OUI definitions for the vendor specific IE
-***************************************************/
+ * OUI definitions for the vendor specific IE
+ *************************************************/
 unsigned char RTW_WPA_OUI[] = {0x00, 0x50, 0xf2, 0x01};
 unsigned char WMM_OUI[] = {0x00, 0x50, 0xf2, 0x02};
 unsigned char WPS_OUI[] = {0x00, 0x50, 0xf2, 0x04};
@@ -65,8 +65,8 @@ unsigned char WMM_PARA_OUI[] = {0x00, 0x50, 0xf2, 0x02, 0x01, 0x01};
 static unsigned char REALTEK_96B_IE[] = {0x00, 0xe0, 0x4c, 0x02, 0x01, 0x20};
 
 /********************************************************
-ChannelPlan definitions
-*********************************************************/
+ * ChannelPlan definitions
+ *******************************************************/
 static struct rt_channel_plan_2g	RTW_ChannelPlan2G[RT_CHANNEL_DOMAIN_2G_MAX] = {
 	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, 13},		/*  0x00, RT_CHANNEL_DOMAIN_2G_WORLD , Passive scan CH 12, 13 */
 	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, 13},		/*  0x01, RT_CHANNEL_DOMAIN_2G_ETSI1 */
@@ -188,10 +188,10 @@ int rtw_ch_set_search_ch(struct rt_channel_info *ch_set, const u32 ch)
 }
 
 /****************************************************************************
-
-Following are the initialization functions for WiFi MLME
-
-*****************************************************************************/
+ *
+ * Following are the initialization functions for WiFi MLME
+ *
+ ***************************************************************************/
 
 int init_hw_mlme_ext(struct adapter *padapter)
 {
@@ -508,10 +508,10 @@ void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame)
 }
 
 /****************************************************************************
-
-Following are the callback functions for each subtype of the management frames
-
-*****************************************************************************/
+ *
+ * Following are the callback functions for each subtype of the management frames
+ *
+ ***************************************************************************/
 
 unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame)
 {
@@ -1951,10 +1951,10 @@ inline struct xmit_frame *alloc_mgtxmitframe(struct xmit_priv *pxmitpriv)
 }
 
 /****************************************************************************
-
-Following are some TX functions for WiFi MLME
-
-*****************************************************************************/
+ *
+ * Following are some TX functions for WiFi MLME
+ *
+ ***************************************************************************/
 
 void update_mgnt_tx_rate(struct adapter *padapter, u8 rate)
 {
@@ -3798,10 +3798,10 @@ unsigned int send_beacon(struct adapter *padapter)
 }
 
 /****************************************************************************
-
-Following are some utility functions for WiFi MLME
-
-*****************************************************************************/
+ *
+ * Following are some utility functions for WiFi MLME
+ *
+ ***************************************************************************/
 
 void site_survey(struct adapter *padapter)
 {
@@ -4393,10 +4393,10 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 }
 
 /****************************************************************************
-
-Following are the functions to report events
-
-*****************************************************************************/
+ *
+ * Following are the functions to report events
+ *
+ ***************************************************************************/
 
 void report_survey_event(struct adapter *padapter, union recv_frame *precv_frame)
 {
@@ -4693,10 +4693,10 @@ void report_add_sta_event(struct adapter *padapter, unsigned char *MacAddr, int
 }
 
 /****************************************************************************
-
-Following are the event callback functions
-
-*****************************************************************************/
+ *
+ * Following are the event callback functions
+ *
+ ***************************************************************************/
 
 /* for sta/adhoc mode */
 void update_sta_info(struct adapter *padapter, struct sta_info *psta)
@@ -4864,7 +4864,7 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 		rtw_sta_media_status_rpt(padapter, psta, 1);
 
 		/* wakeup macid after join bss successfully to ensure
-			the subsequent data frames can be sent out normally */
+		 * the subsequent data frames can be sent out normally */
 		rtw_hal_macid_wakeup(padapter, psta->mac_id);
 	}
 
@@ -4941,10 +4941,10 @@ void mlmeext_sta_del_event_callback(struct adapter *padapter)
 }
 
 /****************************************************************************
-
-Following are the functions for the timer handlers
-
-*****************************************************************************/
+ *
+ * Following are the functions for the timer handlers
+ *
+ ***************************************************************************/
 void _linked_info_dump(struct adapter *padapter)
 {
 	int i;
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 7b643ac320f0..0ef788abf403 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -999,11 +999,11 @@ inline void rtw_set_ips_deny(struct adapter *padapter, u32 ms)
 }
 
 /*
-* rtw_pwr_wakeup - Wake the NIC up from: 1)IPS. 2)USB autosuspend
-* @adapter: pointer to struct adapter structure
-* @ips_deffer_ms: the ms will prevent from falling into IPS after wakeup
-* Return _SUCCESS or _FAIL
-*/
+ * rtw_pwr_wakeup - Wake the NIC up from: 1)IPS. 2)USB autosuspend
+ * @adapter: pointer to struct adapter structure
+ * @ips_deffer_ms: the ms will prevent from falling into IPS after wakeup
+ * Return _SUCCESS or _FAIL
+ */
 
 int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_deffer_ms, const char *caller)
 {
diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index b2c783ada49b..45dc1e1a56a9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -31,8 +31,8 @@ const char *security_type_str(u8 value)
 /* WEP related ===== */
 
 /*
-	Need to consider the fragment  situation
-*/
+ * Need to consider the fragment  situation
+ */
 void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
 {																	/*  exclude ICV */
 	union {
@@ -343,23 +343,23 @@ static const unsigned short Sbox1[2][256] = {      /* Sbox for hash (can be in R
 	}
 };
 
- /*
-**********************************************************************
-* Routine: Phase 1 -- generate P1K, given TA, TK, IV32
-*
-* Inputs:
-*     tk[]      = temporal key                         [128 bits]
-*     ta[]      = transmitter's MAC address            [ 48 bits]
-*     iv32      = upper 32 bits of IV                  [ 32 bits]
-* Output:
-*     p1k[]     = Phase 1 key                          [ 80 bits]
-*
-* Note:
-*     This function only needs to be called every 2**16 packets,
-*     although in theory it could be called every packet.
-*
-**********************************************************************
-*/
+/*
+ **********************************************************************
+ * Routine: Phase 1 -- generate P1K, given TA, TK, IV32
+ *
+ * Inputs:
+ *     tk[]      = temporal key                         [128 bits]
+ *     ta[]      = transmitter's MAC address            [ 48 bits]
+ *     iv32      = upper 32 bits of IV                  [ 32 bits]
+ * Output:
+ *     p1k[]     = Phase 1 key                          [ 80 bits]
+ *
+ * Note:
+ *     This function only needs to be called every 2**16 packets,
+ *     although in theory it could be called every packet.
+ *
+ **********************************************************************
+ */
 static void phase1(u16 *p1k, const u8 *tk, const u8 *ta, u32 iv32)
 {
 	signed int  i;
@@ -386,28 +386,28 @@ static void phase1(u16 *p1k, const u8 *tk, const u8 *ta, u32 iv32)
 
 
 /*
-**********************************************************************
-* Routine: Phase 2 -- generate RC4KEY, given TK, P1K, IV16
-*
-* Inputs:
-*     tk[]      = Temporal key                         [128 bits]
-*     p1k[]     = Phase 1 output key                   [ 80 bits]
-*     iv16      = low 16 bits of IV counter            [ 16 bits]
-* Output:
-*     rc4key[]  = the key used to encrypt the packet   [128 bits]
-*
-* Note:
-*     The value {TA, IV32, IV16} for Phase1/Phase2 must be unique
-*     across all packets using the same key TK value. Then, for a
-*     given value of TK[], this TKIP48 construction guarantees that
-*     the final RC4KEY value is unique across all packets.
-*
-* Suggested implementation optimization: if PPK[] is "overlaid"
-*     appropriately on RC4KEY[], there is no need for the final
-*     for loop below that copies the PPK[] result into RC4KEY[].
-*
-**********************************************************************
-*/
+ **********************************************************************
+ * Routine: Phase 2 -- generate RC4KEY, given TK, P1K, IV16
+ *
+ * Inputs:
+ *     tk[]      = Temporal key                         [128 bits]
+ *     p1k[]     = Phase 1 output key                   [ 80 bits]
+ *     iv16      = low 16 bits of IV counter            [ 16 bits]
+ * Output:
+ *     rc4key[]  = the key used to encrypt the packet   [128 bits]
+ *
+ * Note:
+ *     The value {TA, IV32, IV16} for Phase1/Phase2 must be unique
+ *     across all packets using the same key TK value. Then, for a
+ *     given value of TK[], this TKIP48 construction guarantees that
+ *     the final RC4KEY value is unique across all packets.
+ *
+ * Suggested implementation optimization: if PPK[] is "overlaid"
+ *     appropriately on RC4KEY[], there is no need for the final
+ *     for loop below that copies the PPK[] result into RC4KEY[].
+ *
+ **********************************************************************
+ */
 static void phase2(u8 *rc4key, const u8 *tk, const u16 *p1k, u16 iv16)
 {
 	signed int  i;
diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index d1f6030799cb..2014998245db 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -385,10 +385,10 @@ u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
 	rtw_release_macid(pstapriv->padapter, psta);
 
 /*
-	spin_lock_bh(&pstapriv->asoc_list_lock);
-	list_del_init(&psta->asoc_list);
-	spin_unlock_bh(&pstapriv->asoc_list_lock);
-*/
+ * spin_lock_bh(&pstapriv->asoc_list_lock);
+ * list_del_init(&psta->asoc_list);
+ * spin_unlock_bh(&pstapriv->asoc_list_lock);
+ */
 	spin_lock_bh(&pstapriv->auth_list_lock);
 	if (!list_empty(&psta->auth_list)) {
 		list_del_init(&psta->auth_list);
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 74d3f2de360d..186a982cb99e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1021,9 +1021,9 @@ void HTOnAssocRsp(struct adapter *padapter)
 
 	/* handle A-MPDU parameter field */
 	/*
-		AMPDU_para [1:0]:Max AMPDU Len => 0:8k , 1:16k, 2:32k, 3:64k
-		AMPDU_para [4:2]:Min MPDU Start Spacing
-	*/
+	 * AMPDU_para [1:0]:Max AMPDU Len => 0:8k , 1:16k, 2:32k, 3:64k
+	 * AMPDU_para [4:2]:Min MPDU Start Spacing
+	 */
 	max_AMPDU_len = pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x03;
 
 	min_MPDU_spacing = (pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x1c) >> 2;
@@ -1691,12 +1691,11 @@ void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
 		/* pmlmeext->bcn_delay_ratio[delay_ms] = (pmlmeext->bcn_delay_cnt[delay_ms] * 100) /pmlmeext->bcn_cnt; */
 
 /*
-
-	for (i = 0; i<9; i++)
-	{
-			pmlmeext->bcn_delay_cnt[i] , i, pmlmeext->bcn_delay_ratio[i]);
-	}
-*/
+ * for (i = 0; i<9; i++)
+ * {
+ *	pmlmeext->bcn_delay_cnt[i] , i, pmlmeext->bcn_delay_ratio[i]);
+ * }
+ */
 
 	/* dump for  adaptive_early_32k */
 	if (pmlmeext->bcn_cnt > 100 && (pmlmeext->adaptive_tsf_done == true)) {
-- 
2.43.0

