Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBA919992C
	for <linux-staging@lists.linux.dev>; Thu, 20 Nov 2025 00:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763598594; cv=none; b=SPhpfLvhT2qxleRaj4xsUsXSkkvqVd92bjfXod7rAihS290n/hBwfoBKHEnaiBl35oNtfV20rFucYmqI/X05Qruer1CjfrpmYtFwIicBlikAF8SsIe2zpJNh3pORVnwPSUqDc3aSd5wPVzl1a35KsEw0qNTFhxluStzBmLqZEoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763598594; c=relaxed/simple;
	bh=WyhterUIUeasTQj0gimyhixGcq4sH6V97ZkOD5Er1No=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pDmQfx9rub6XrQUPIGxjhgh/OePHC7eCg5AuyxETV7f/qaProUbFhGk8HvZwu11P0Dk7kpkmkSlJDdar/uymuWtDJ8E4mB+r1GJjeJvIiH2E3M5LwfS54fFC3jCBHNqzvIcr2EwIpHyA0o5Y3/BTKRBFX1VqXap9GbaAE50umAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ul0prt9A; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ul0prt9A"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29812589890so3804365ad.3
        for <linux-staging@lists.linux.dev>; Wed, 19 Nov 2025 16:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763598591; x=1764203391; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRrGUmaovt0R97si4Ukyb1q4iVfc43FtiDhdXgbGoYI=;
        b=Ul0prt9AiFf7LSU27NFMGoxKJ246Fqf9g8mnsbDcs9Ds15wLU+UGSF2WVpzP1GS6BK
         GBylIye5XvuaerJwdJF0DeqrAhS1kMk2HjSJAX5146l/EaJbQKGXi3D6dGcYx/0OMXfA
         Hfj3emuLQWKd7U8grlw5G7nCQOXcfJYCSlJkwKJm1JjUuCnNo8ozhU1C7tCWDW7PUWbI
         hFuQZD9I/STPhIfR9uNpLKmNEdEPm5ZrcLjjDTCo8mPKGFreyH7kH+6VvlHoQMqoUoDd
         Yk6Y0wr+tYT5B8td/4+PbZX5xjM1QVDNfvHypY7fXmF+ZbDrDpVLes7+Z+7y5k6YI+7U
         h1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763598591; x=1764203391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fRrGUmaovt0R97si4Ukyb1q4iVfc43FtiDhdXgbGoYI=;
        b=Lxtu+bTEM/W2qh6qXvrxN0lelzUbIvO+Zs/15fX9ydA7pL7oKQ9nbmTFMg+3VP7da1
         qEX16ddMdiO1MAq7fJHTPwMUrsLFe8V3kLostq4grgCcVJSCltnXglTmmbCKk/FvrRcV
         fbR4QS9iXQ7Lx0XqvxVzXWzL2/lZObiZlqu0kOD8xwNGztdt4hODzD3i/5+2d5aUd0z7
         UKxdccuAzEYf9x7CnRfao7FhT2K1zKerWwLecN1y71EzufW/qwZtbupCJ8Kc5nnSHcJb
         MQhUfTvFX3ev5Kj5MV3kpKwhCJhrzW+IOUlZaE8Iln64Ppfl/00pHNf7zEjJtL5D/I4/
         fyrg==
X-Gm-Message-State: AOJu0YwTgFqpfaOzsCwrBq1Oj7zR6qDudtsGHe4o8Uvz62/hx7ZqAbxJ
	QDZWbrNJpNfiohBR0ASPMQ4A5BLMx5KpmAwnz44TjJGUi1kEugMhohZp
X-Gm-Gg: ASbGncswpr1hLWd9aQejrvZNn+PPmT03kWeSpYUtvzaNygLb1cIcWl7f4PBZE0q5vGG
	gIC/GDB8v+pwFTXDnMcuIp11fuzFmkYZjtu2ANARx38XWo40E2UtnfwjpGr48z+ohJSFIcVi4e5
	wfI0o7quhSkdI/cIKKSI2zqUAm+WfRD0H3D+hwsuLj4gVMsFngKUzsCeAEsyOkZsGtGv1POC9Ma
	QhOyy4mTBc4ODW+sCkCyTr91EKHv/1V/1mA2i3emn9I/4OuhJHH8f1OKKQnuIK+aZjLorn6Ziwo
	SwMt+HLIpOECiEt38levoqAflolqdODwT1QKQASHls+oTtqvXjxICOtRPYvUGLxpD3XDgFTtKuO
	xk0PAGFu+hnacEDnQHQRqjEvhygeHTWyiFns1Hw61kJRoamMTbDVSwQC2G2siZyDo2DpHuwIzsZ
	PQKUvjoANHUXNofbhiT77/aqpJbkCyz427kiAnGoyuPZhKe2MMmvqci5v9Otbk8Bab64MDQWdYF
	IsggNxiU/wn8R1Mkn7ArUNphqHpRfI=
X-Google-Smtp-Source: AGHT+IF1tdHuWiDx7UE0cag+8oLtqzPGUiXWjyLf4ihC3TB/qGGKm5C39cH2S9YsHt/qrXbmkvV7cA==
X-Received: by 2002:a17:903:3843:b0:297:c272:80ec with SMTP id d9443c01a7336-29b5ec70596mr2736075ad.42.1763598591384;
        Wed, 19 Nov 2025 16:29:51 -0800 (PST)
Received: from main.. (c-76-146-85-33.hsd1.wa.comcast.net. [76.146.85.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b25e579sm6245665ad.51.2025.11.19.16.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 16:29:50 -0800 (PST)
From: Artur Stupa <arthur.stupa@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	dan.carpenter@linaro.org,
	linux-kernel@vger.kernel.org,
	arthur.stupa@gmail.com
Subject: [PATCH v2] staging: rtl8723bs: core: fix block comment style issues
Date: Wed, 19 Nov 2025 16:29:21 -0800
Message-ID: <20251120002948.23153-1-arthur.stupa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119062701.38279-1-arthur.stupa@gmail.com>
References: <20251119062701.38279-1-arthur.stupa@gmail.com>
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
* Block comments use a trailing */ on a separate line

Also delete dead commented-out code.

No functional changes.

Signed-off-by: Artur Stupa <arthur.stupa@gmail.com>
---
Changes in v2:
* Fixed "trailing */" checkpatch warnings
* Deleted dead commented-out code
---
 .../staging/rtl8723bs/core/rtw_ieee80211.c    | 22 +++--
 drivers/staging/rtl8723bs/core/rtw_io.c       | 48 +++++------
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 76 ++++++++---------
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 59 +++----------
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 10 +--
 drivers/staging/rtl8723bs/core/rtw_security.c | 85 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |  8 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 15 +---
 8 files changed, 138 insertions(+), 185 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 027b2dd0a4b9..10911a661223 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -132,9 +132,7 @@ u8 *rtw_set_ie(u8 *pbuf,
 	return pbuf + len + 2;
 }
 
-/*----------------------------------------------------------------------------
-index: the information element id index, limit is the limit for search
------------------------------------------------------------------------------*/
+/* index: the information element id index, limit is the limit for search */
 u8 *rtw_get_ie(u8 *pbuf, signed int index, signed int *len, signed int limit)
 {
 	signed int tmp, i;
@@ -767,21 +765,27 @@ static int rtw_ieee802_11_parse_vendor_specific(u8 *pos, uint elen,
 {
 	unsigned int oui;
 
-	/* first 3 bytes in vendor specific information element are the IEEE
+	/*
+	 * first 3 bytes in vendor specific information element are the IEEE
 	 * OUI of the vendor. The following byte is used a vendor specific
-	 * sub-type. */
+	 * sub-type.
+	 */
 	if (elen < 4)
 		return -1;
 
 	oui = get_unaligned_be24(pos);
 	switch (oui) {
 	case OUI_MICROSOFT:
-		/* Microsoft/Wi-Fi information elements are further typed and
-		 * subtyped */
+		/*
+		 * Microsoft/Wi-Fi information elements are further typed and
+		 * subtyped
+		 */
 		switch (pos[3]) {
 		case 1:
-			/* Microsoft OUI (00:50:F2) with OUI Type 1:
-			 * real WPA information element */
+			/*
+			 * Microsoft OUI (00:50:F2) with OUI Type 1:
+			 * real WPA information element
+			 */
 			elems->wpa_ie = pos;
 			elems->wpa_ie_len = elen;
 			break;
diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index 79d543d88278..fe9f94001eed 100644
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
@@ -149,9 +147,7 @@ int rtw_inc_and_chk_continual_io_error(struct dvobj_priv *dvobj)
 	return false;
 }
 
-/*
-* Set the continual_io_error of this @param dvobjprive to 0
-*/
+/* Set the continual_io_error of this @param dvobjprive to 0 */
 void rtw_reset_continual_io_error(struct dvobj_priv *dvobj)
 {
 	atomic_set(&dvobj->continual_io_error, 0);
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index c06d990350e6..98704179ad35 100644
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
@@ -476,9 +476,7 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 	}
 }
 
-/*
-Caller must hold pmlmepriv->lock first.
-*/
+/* Caller must hold pmlmepriv->lock first. */
 void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *target)
 {
 	struct list_head	*plist, *phead;
@@ -510,8 +508,10 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 			oldest = pnetwork;
 	}
 
-	/* If we didn't find a match, then get a new network slot to initialize
-	 * with this beacon's information */
+	/*
+	 * If we didn't find a match, then get a new network slot to initialize
+	 * with this beacon's information
+	 */
 	if (!target_find) {
 		if (list_empty(&pmlmepriv->free_bss_pool.queue)) {
 			/* If there are no more slots, expire the oldest */
@@ -843,9 +843,7 @@ static void find_network(struct adapter *adapter)
 		rtw_free_network_nolock(adapter, pwlan);
 }
 
-/*
-*rtw_free_assoc_resources: the caller has to lock pmlmepriv->lock
-*/
+/* rtw_free_assoc_resources: the caller has to lock pmlmepriv->lock */
 void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
 {
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
@@ -879,9 +877,7 @@ void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
 	rtw_reset_rx_info(pdbgpriv);
 }
 
-/*
-*rtw_indicate_connect: the caller has to lock pmlmepriv->lock
-*/
+/* rtw_indicate_connect: the caller has to lock pmlmepriv->lock */
 void rtw_indicate_connect(struct adapter *padapter)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -908,9 +904,7 @@ void rtw_indicate_connect(struct adapter *padapter)
 	rtw_set_scan_deny(padapter, 3000);
 }
 
-/*
-*rtw_indicate_disconnect: the caller has to lock pmlmepriv->lock
-*/
+/* rtw_indicate_disconnect: the caller has to lock pmlmepriv->lock */
 void rtw_indicate_disconnect(struct adapter *padapter)
 {
 	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -1543,9 +1537,9 @@ void rtw_wmm_event_callback(struct adapter *padapter, u8 *pbuf)
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
@@ -1586,9 +1580,9 @@ void _rtw_join_timeout_handler(struct timer_list *t)
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
@@ -1704,10 +1698,10 @@ void rtw_set_scan_deny(struct adapter *adapter, u32 ms)
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
@@ -1785,10 +1779,10 @@ int rtw_select_roaming_candidate(struct mlme_priv *mlme)
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
@@ -1829,11 +1823,11 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
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
index 8fe0555ab033..016609cd1292 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -18,9 +18,7 @@ static struct mlme_handler mlme_sta_tbl[] = {
 	{WIFI_PROBEREQ,		"OnProbeReq",	&OnProbeReq},
 	{WIFI_PROBERSP,		"OnProbeRsp",		&OnProbeRsp},
 
-	/*----------------------------------------------------------
-					below 2 are reserved
-	-----------------------------------------------------------*/
+	/* below 2 are reserved */
 	{0,					"DoReserved",		&DoReserved},
 	{0,					"DoReserved",		&DoReserved},
 	{WIFI_BEACON,		"OnBeacon",		&OnBeacon},
@@ -50,9 +48,7 @@ static struct action_handler OnAction_tbl[] = {
 
 static u8 null_addr[ETH_ALEN] = {0, 0, 0, 0, 0, 0};
 
-/**************************************************
-OUI definitions for the vendor specific IE
-***************************************************/
+/* OUI definitions for the vendor specific IE */
 unsigned char RTW_WPA_OUI[] = {0x00, 0x50, 0xf2, 0x01};
 unsigned char WMM_OUI[] = {0x00, 0x50, 0xf2, 0x02};
 unsigned char WPS_OUI[] = {0x00, 0x50, 0xf2, 0x04};
@@ -64,9 +60,7 @@ unsigned char WMM_PARA_OUI[] = {0x00, 0x50, 0xf2, 0x02, 0x01, 0x01};
 
 static unsigned char REALTEK_96B_IE[] = {0x00, 0xe0, 0x4c, 0x02, 0x01, 0x20};
 
-/********************************************************
-ChannelPlan definitions
-*********************************************************/
+/* ChannelPlan definitions */
 static struct rt_channel_plan_2g	RTW_ChannelPlan2G[RT_CHANNEL_DOMAIN_2G_MAX] = {
 	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, 13},		/*  0x00, RT_CHANNEL_DOMAIN_2G_WORLD , Passive scan CH 12, 13 */
 	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, 13},		/*  0x01, RT_CHANNEL_DOMAIN_2G_ETSI1 */
@@ -187,11 +181,7 @@ int rtw_ch_set_search_ch(struct rt_channel_info *ch_set, const u32 ch)
 	return i;
 }
 
-/****************************************************************************
-
-Following are the initialization functions for WiFi MLME
-
-*****************************************************************************/
+/* Following are the initialization functions for WiFi MLME */
 
 int init_hw_mlme_ext(struct adapter *padapter)
 {
@@ -507,11 +497,7 @@ void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame)
 	}
 }
 
-/****************************************************************************
-
-Following are the callback functions for each subtype of the management frames
-
-*****************************************************************************/
+/* Following are the callback functions for each subtype of the management frames */
 
 unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame)
 {
@@ -1950,11 +1936,7 @@ inline struct xmit_frame *alloc_mgtxmitframe(struct xmit_priv *pxmitpriv)
 	return _alloc_mgtxmitframe(pxmitpriv, false);
 }
 
-/****************************************************************************
-
-Following are some TX functions for WiFi MLME
-
-*****************************************************************************/
+/* Following are some TX functions for WiFi MLME */
 
 void update_mgnt_tx_rate(struct adapter *padapter, u8 rate)
 {
@@ -3797,11 +3779,7 @@ unsigned int send_beacon(struct adapter *padapter)
 		return _SUCCESS;
 }
 
-/****************************************************************************
-
-Following are some utility functions for WiFi MLME
-
-*****************************************************************************/
+/* Following are some utility functions for WiFi MLME */
 
 void site_survey(struct adapter *padapter)
 {
@@ -4392,11 +4370,7 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 	}
 }
 
-/****************************************************************************
-
-Following are the functions to report events
-
-*****************************************************************************/
+/* Following are the functions to report events */
 
 void report_survey_event(struct adapter *padapter, union recv_frame *precv_frame)
 {
@@ -4692,11 +4666,7 @@ void report_add_sta_event(struct adapter *padapter, unsigned char *MacAddr, int
 	rtw_enqueue_cmd(pcmdpriv, pcmd_obj);
 }
 
-/****************************************************************************
-
-Following are the event callback functions
-
-*****************************************************************************/
+/* Following are the event callback functions */
 
 /* for sta/adhoc mode */
 void update_sta_info(struct adapter *padapter, struct sta_info *psta)
@@ -4863,8 +4833,10 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 
 		rtw_sta_media_status_rpt(padapter, psta, 1);
 
-		/* wakeup macid after join bss successfully to ensure
-			the subsequent data frames can be sent out normally */
+		/*
+		 * wakeup macid after join bss successfully to ensure
+		 * the subsequent data frames can be sent out normally
+		 */
 		rtw_hal_macid_wakeup(padapter, psta->mac_id);
 	}
 
@@ -4940,11 +4912,8 @@ void mlmeext_sta_del_event_callback(struct adapter *padapter)
 		rtw_mlmeext_disconnect(padapter);
 }
 
-/****************************************************************************
-
-Following are the functions for the timer handlers
+/* Following are the functions for the timer handlers */
 
-*****************************************************************************/
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
index b2c783ada49b..9a74f90e1d3c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -30,9 +30,7 @@ const char *security_type_str(u8 value)
 
 /* WEP related ===== */
 
-/*
-	Need to consider the fragment  situation
-*/
+/* Need to consider the fragment  situation */
 void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
 {																	/*  exclude ICV */
 	union {
@@ -343,23 +341,23 @@ static const unsigned short Sbox1[2][256] = {      /* Sbox for hash (can be in R
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
@@ -386,28 +384,28 @@ static void phase1(u16 *p1k, const u8 *tk, const u8 *ta, u32 iv32)
 
 
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
@@ -1483,7 +1481,8 @@ static int omac1_aes_128_vector(u8 *key, size_t num_elem,
  * This is a mode for using block cipher (AES in this case) for authentication.
  * OMAC1 was standardized with the name CMAC by NIST in a Special Publication
  * (SP) 800-38B.
- * modify for CONFIG_IEEE80211W */
+ * modify for CONFIG_IEEE80211W
+ */
 int omac1_aes_128(u8 *key, u8 *data, size_t data_len, u8 *mac)
 {
 	return omac1_aes_128_vector(key, 1, &data, &data_len, mac);
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
index 74d3f2de360d..5ffefa50699e 100644
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
@@ -1689,15 +1689,6 @@ void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
 	else
 		pmlmeext->bcn_delay_cnt[delay_ms]++;
 		/* pmlmeext->bcn_delay_ratio[delay_ms] = (pmlmeext->bcn_delay_cnt[delay_ms] * 100) /pmlmeext->bcn_cnt; */
-
-/*
-
-	for (i = 0; i<9; i++)
-	{
-			pmlmeext->bcn_delay_cnt[i] , i, pmlmeext->bcn_delay_ratio[i]);
-	}
-*/
-
 	/* dump for  adaptive_early_32k */
 	if (pmlmeext->bcn_cnt > 100 && (pmlmeext->adaptive_tsf_done == true)) {
 		u8 ratio_20_delay, ratio_80_delay;
-- 
2.43.0

