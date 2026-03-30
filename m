Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC10391826
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 18:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896425; cv=none; b=qdxW2XIrtkDm3hN319lrI8Ba86qG+YJxoJiEyGWpJ3G+ZIhcjS8s80qw3P2DBkoaLZXZAoyI7XGCHg/7pwQqh9ki8BGFQS7yJobvhXuO5x+NyGQV+X6QgkG6ZwuQRJrXasKPtubk6LOFohDWOnKyquukaU3x4xF+XYsfnOOiuZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896425; c=relaxed/simple;
	bh=dHtaOk1BFbLEAUPaJf1uwN4r0xZkjtc4LtvLW+wRPwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lYvo26uGe+vkRFDJv39PqJuqbQzWYk3wG1n8t/vmY83xdNs1sMXSdsX8rRZlWhKdD9krJwY7pTMhKMTs2ZgZWBYfar+cHAPCnzWm5hDt11HcVU+quAag1JGpOjRQDwyQAxHoMhB5x2LuZxdTFmbcSS/wH0DdXZekVYx7/w5aqbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=M1taWU9p; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=u9Qr3c4y; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="M1taWU9p";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="u9Qr3c4y"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fl0bR2Msrz9vVg;
	Mon, 30 Mar 2026 20:46:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774896419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KJXVRw3bDq1UwfdBL3kPN1KdiWhvF2MV4Y0Z1EUFTbE=;
	b=M1taWU9pagIVPOgkM79pVZ8R4DfSw3dH4gOiGarByyi3gASNFJt7ddsUPhCAD+h6NZ7+ev
	gzERrN4clO8F0QkwarSQXSonlioGAcF8034U9KPwj00wK04felBQlmarBGVA8jZa8LxqyA
	tB0CM9Tejag/FP6r5J+YrnkYuk5hyr496YvKGCDhnNYWcrxaGEaBOW3spJ2t++ps2RXrEl
	u6hhX3CowbibgCTdbuyujdppMJEn9UaokhpZespWeBzYLqfO6shkE1yza0qQ5ir9yQzqQ1
	j0hd92Aavmi3LKfeZXfh1ZrMPKngA2It/d3FPRG9C+KiMi46d2yMyDGWsBKYJg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=u9Qr3c4y;
	spf=pass (outgoing_mbo_mout: domain of khomenkov@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=khomenkov@mailbox.org
From: Andrei Khomenkov <khomenkov@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774896418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KJXVRw3bDq1UwfdBL3kPN1KdiWhvF2MV4Y0Z1EUFTbE=;
	b=u9Qr3c4y51FDuqGfEdyJc+fgK7Y8h+wcLfnX88qTbo9YVkHaC0x4S1+ypOaI8h1NNNns9z
	ZA0oO74ceW7Bzk/oNQNK2LXTToeMfVCU/9xjxSy+nW9JPzxcySeRicgh3ftGfwY10fnmUn
	nrS1bAgkQMMjVsljHtgZdFkduOWTOrQqX1FlyYKdkKvQMRmXGRid4fgnVIyEBM0iy6h0N0
	xwDD4+Wy77qIWeCvl5iHoZH+lQZrOflOMTFhznSrB1h7zxxEoaNEXA15EXybLRqbHUX40I
	45TA6fK4uEtAvBuw0AWHtlStkXiH3fH/XYvMDAG5CM3kxJ7tVIHiYgo3fKoOOw==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Andrei Khomenkov <khomenkov@mailbox.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 1/2] staging: rtl8723bs: simplify boolean comparisons
Date: Mon, 30 Mar 2026 21:46:38 +0300
Message-ID: <20260330184640.17795-2-khomenkov@mailbox.org>
In-Reply-To: <20260330184640.17795-1-khomenkov@mailbox.org>
References: <20260330184640.17795-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ozmxpj7yw6zubj6szsosfkoe4g6psgb6
X-MBO-RS-ID: 07474e6431de0b52555
X-Rspamd-Queue-Id: 4fl0bR2Msrz9vVg

Simplify boolean comparisons to improve code readability
and match the kernel coding style.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c       |  2 +-
 drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  2 +-
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  2 +-
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    | 50 ++++++-------
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 14 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 16 ++---
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 70 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |  2 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 18 ++---
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 30 ++++----
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    | 10 +--
 drivers/staging/rtl8723bs/hal/hal_com.c       |  4 +-
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    |  4 +-
 drivers/staging/rtl8723bs/hal/hal_intf.c      |  4 +-
 drivers/staging/rtl8723bs/hal/odm.c           |  8 +--
 .../staging/rtl8723bs/hal/odm_CfoTracking.c   |  2 +-
 drivers/staging/rtl8723bs/hal/odm_DIG.c       | 24 +++----
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   | 10 +--
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 12 ++--
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |  2 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  6 +-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  2 +-
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 48 ++++++-------
 .../staging/rtl8723bs/os_dep/sdio_ops_linux.c |  4 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c |  4 +-
 26 files changed, 176 insertions(+), 176 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 4cdcdddf6b33..aa5b726bb621 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -301,7 +301,7 @@ void expire_timeout_chk(struct adapter *padapter)
 
 			psta->keep_alive_trycnt = 0;
 			spin_lock_bh(&pstapriv->asoc_list_lock);
-			if (list_empty(&psta->asoc_list) == false) {
+			if (!list_empty(&psta->asoc_list)) {
 				list_del_init(&psta->asoc_list);
 				pstapriv->asoc_list_cnt--;
 				updated = ap_free_sta(padapter, psta, false,
diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index 0191a943f0a4..9a7acabef409 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -11,7 +11,7 @@
 void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 media_status)
 {
 	if ((media_status == RT_MEDIA_CONNECT)
-		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)) {
+		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE))) {
 		rtw_hal_set_hwreg(padapter, HW_VAR_DL_RSVD_PAGE, NULL);
 	}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 72b7f731dd47..463a731fb37f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -347,7 +347,7 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv)
 
 	/* HT Cap. */
 	if ((pregistrypriv->wireless_mode & WIRELESS_11_24N) &&
-	    (pregistrypriv->ht_enable == true)) {
+	    (pregistrypriv->ht_enable)) {
 		/* todo: */
 	}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index d92ec9949d00..a55f484f575b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -82,7 +82,7 @@ u8 rtw_do_join(struct adapter *padapter)
 			pmlmepriv->to_join = false;
 			_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
 		} else {
-			if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) {
+			if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
 				/*  submit createbss_cmd to change to a ADHOC_MASTER */
 
 				/* pmlmepriv->lock has been acquired by caller... */
@@ -141,32 +141,32 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 	netdev_dbg(padapter->pnetdev, "set ssid [%s] fw_state = 0x%08x\n",
 		   ssid->ssid, get_fwstate(pmlmepriv));
 
-	if (padapter->hw_init_completed == false) {
+	if (!padapter->hw_init_completed) {
 		status = _FAIL;
 		goto exit;
 	}
 
 	spin_lock_bh(&pmlmepriv->lock);
 
-	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) == true)
+	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
 		goto handle_tkip_countermeasure;
-	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true)
+	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
 		goto release_mlme_lock;
 
-	if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE) == true) {
+	if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE)) {
 		if ((pmlmepriv->assoc_ssid.ssid_length == ssid->ssid_length) &&
 		    (!memcmp(&pmlmepriv->assoc_ssid.ssid, ssid->ssid, ssid->ssid_length))) {
-			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == false) {
-				if (rtw_is_same_ibss(padapter, pnetwork) == false) {
+			if (!check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
+				if (!rtw_is_same_ibss(padapter, pnetwork)) {
 					/* if in WIFI_ADHOC_MASTER_STATE | WIFI_ADHOC_STATE, create bss or rejoin again */
 					rtw_disassoc_cmd(padapter, 0, true);
 
-					if (check_fwstate(pmlmepriv, _FW_LINKED) == true)
+					if (check_fwstate(pmlmepriv, _FW_LINKED))
 						rtw_indicate_disconnect(padapter);
 
 					rtw_free_assoc_resources(padapter, 1);
 
-					if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true) {
+					if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
 						_clr_fwstate_(pmlmepriv, WIFI_ADHOC_MASTER_STATE);
 						set_fwstate(pmlmepriv, WIFI_ADHOC_STATE);
 					}
@@ -179,12 +179,12 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 		} else {
 			rtw_disassoc_cmd(padapter, 0, true);
 
-			if (check_fwstate(pmlmepriv, _FW_LINKED) == true)
+			if (check_fwstate(pmlmepriv, _FW_LINKED))
 				rtw_indicate_disconnect(padapter);
 
 			rtw_free_assoc_resources(padapter, 1);
 
-			if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true) {
+			if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
 				_clr_fwstate_(pmlmepriv, WIFI_ADHOC_MASTER_STATE);
 				set_fwstate(pmlmepriv, WIFI_ADHOC_STATE);
 			}
@@ -197,7 +197,7 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 		goto release_mlme_lock;
 	}
 
-	if (rtw_validate_ssid(ssid) == false) {
+	if (!rtw_validate_ssid(ssid)) {
 		status = _FAIL;
 		goto release_mlme_lock;
 	}
@@ -205,7 +205,7 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 	memcpy(&pmlmepriv->assoc_ssid, ssid, sizeof(struct ndis_802_11_ssid));
 	pmlmepriv->assoc_by_bssid = false;
 
-	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) == true)
+	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
 		pmlmepriv->to_join = true;
 	else
 		status = rtw_do_join(padapter);
@@ -225,10 +225,10 @@ u8 rtw_set_802_11_connect(struct adapter *padapter, u8 *bssid, struct ndis_802_1
 	bool ssid_valid = true;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
-	if (!ssid || rtw_validate_ssid(ssid) == false)
+	if (!ssid || !rtw_validate_ssid(ssid))
 		ssid_valid = false;
 
-	if (!bssid || rtw_validate_bssid(bssid) == false)
+	if (!bssid || !rtw_validate_bssid(bssid))
 		bssid_valid = false;
 
 	if (!ssid_valid && !bssid_valid) {
@@ -236,7 +236,7 @@ u8 rtw_set_802_11_connect(struct adapter *padapter, u8 *bssid, struct ndis_802_1
 		goto exit;
 	}
 
-	if (padapter->hw_init_completed == false) {
+	if (!padapter->hw_init_completed) {
 		status = _FAIL;
 		goto exit;
 	}
@@ -246,9 +246,9 @@ u8 rtw_set_802_11_connect(struct adapter *padapter, u8 *bssid, struct ndis_802_1
 	netdev_dbg(padapter->pnetdev, FUNC_ADPT_FMT "  fw_state = 0x%08x\n",
 		   FUNC_ADPT_ARG(padapter), get_fwstate(pmlmepriv));
 
-	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) == true)
+	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
 		goto handle_tkip_countermeasure;
-	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true)
+	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
 		goto release_mlme_lock;
 
 handle_tkip_countermeasure:
@@ -269,7 +269,7 @@ u8 rtw_set_802_11_connect(struct adapter *padapter, u8 *bssid, struct ndis_802_1
 		pmlmepriv->assoc_by_bssid = false;
 	}
 
-	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) == true)
+	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
 		pmlmepriv->to_join = true;
 	else
 		status = rtw_do_join(padapter);
@@ -298,15 +298,15 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 
 		spin_lock_bh(&pmlmepriv->lock);
 
-		if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) || (*pold_state == Ndis802_11IBSS))
+		if ((check_fwstate(pmlmepriv, _FW_LINKED)) || (*pold_state == Ndis802_11IBSS))
 			rtw_disassoc_cmd(padapter, 0, true);
 
-		if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) ||
-			(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true))
+		if ((check_fwstate(pmlmepriv, _FW_LINKED)) ||
+			(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)))
 			rtw_free_assoc_resources(padapter, 1);
 
 		if ((*pold_state == Ndis802_11Infrastructure) || (*pold_state == Ndis802_11IBSS)) {
-			if (check_fwstate(pmlmepriv, _FW_LINKED) == true)
+			if (check_fwstate(pmlmepriv, _FW_LINKED))
 				rtw_indicate_disconnect(padapter); /* will clr Linked_state; before this function, we must have checked whether issue dis-assoc_cmd or not */
 		}
 
@@ -349,7 +349,7 @@ u8 rtw_set_802_11_disassociate(struct adapter *padapter)
 
 	spin_lock_bh(&pmlmepriv->lock);
 
-	if (check_fwstate(pmlmepriv, _FW_LINKED) == true) {
+	if (check_fwstate(pmlmepriv, _FW_LINKED)) {
 		rtw_disassoc_cmd(padapter, 0, true);
 		rtw_indicate_disconnect(padapter);
 		/* modify for CONFIG_IEEE80211W, none 11w can use it */
@@ -371,7 +371,7 @@ u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_802_11_s
 		res = false;
 		goto exit;
 	}
-	if (padapter->hw_init_completed == false) {
+	if (!padapter->hw_init_completed) {
 		res = false;
 		goto exit;
 	}
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 5516593bc8ab..298f6cf6f2fd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -351,7 +351,7 @@ int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 fea
 	u16 s_cap, d_cap;
 	__le16 tmps, tmpd;
 
-	if (rtw_bug_check(dst, src, &s_cap, &d_cap) == false)
+	if (!rtw_bug_check(dst, src, &s_cap, &d_cap))
 		return false;
 
 	memcpy((u8 *)&tmps, rtw_get_capability_from_ie(src->ies), 2);
@@ -1301,7 +1301,7 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 	struct wlan_network	*cur_network = &pmlmepriv->cur_network;
 	struct wlan_network	*ptarget_wlan = NULL;
 
-	if (rtw_access_ctrl(adapter, pstassoc->macaddr) == false)
+	if (!rtw_access_ctrl(adapter, pstassoc->macaddr))
 		return;
 
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
@@ -1585,7 +1585,7 @@ void rtw_mlme_reset_auto_scan_int(struct adapter *adapter)
 
 	if (pmlmeinfo->VHT_enable) /* disable auto scan when connect to 11AC AP */
 		mlme->auto_scan_int_ms = 0;
-	else if (adapter->registrypriv.wifi_spec && is_client_associated_to_ap(adapter) == true)
+	else if (adapter->registrypriv.wifi_spec && is_client_associated_to_ap(adapter))
 		mlme->auto_scan_int_ms = 60 * 1000;
 	else if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
 		if (check_fwstate(mlme, WIFI_STATION_STATE) && check_fwstate(mlme, _FW_LINKED))
@@ -1687,10 +1687,10 @@ static int rtw_check_roaming_candidate(struct mlme_priv *mlme
 	int updated = false;
 	struct adapter *adapter = container_of(mlme, struct adapter, mlmepriv);
 
-	if (is_same_ess(&competitor->network, &mlme->cur_network.network) == false)
+	if (!is_same_ess(&competitor->network, &mlme->cur_network.network))
 		goto exit;
 
-	if (rtw_is_desired_network(adapter, competitor) == false)
+	if (!rtw_is_desired_network(adapter, competitor))
 		goto exit;
 
 	/* got specific addr to roam */
@@ -1782,12 +1782,12 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
 			goto exit;
 	}
 
-	if (rtw_is_desired_network(adapter, competitor)  == false)
+	if (!rtw_is_desired_network(adapter, competitor))
 		goto exit;
 
 	if (rtw_to_roam(adapter) > 0) {
 		if (jiffies_to_msecs(jiffies - competitor->last_scanned) >= mlme->roam_scanr_exp_ms
-			|| is_same_ess(&competitor->network, &mlme->cur_network.network) == false
+			|| !is_same_ess(&competitor->network, &mlme->cur_network.network)
 		)
 			goto exit;
 	}
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 5f00fe282d1b..bcc387844ff5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -512,8 +512,8 @@ unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame)
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE))
 		return _SUCCESS;
 
-	if (check_fwstate(pmlmepriv, _FW_LINKED) == false &&
-		check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE|WIFI_AP_STATE) == false) {
+	if (!check_fwstate(pmlmepriv, _FW_LINKED) &&
+		!check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE|WIFI_AP_STATE)) {
 		return _SUCCESS;
 	}
 
@@ -725,7 +725,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 		goto auth_fail;
 	}
 
-	if (rtw_access_ctrl(padapter, sa) == false) {
+	if (!rtw_access_ctrl(padapter, sa)) {
 		status = WLAN_STATUS_AP_UNABLE_TO_HANDLE_NEW_STA;
 		goto auth_fail;
 	}
@@ -748,7 +748,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	} else {
 
 		spin_lock_bh(&pstapriv->asoc_list_lock);
-		if (list_empty(&pstat->asoc_list) == false) {
+		if (!list_empty(&pstat->asoc_list)) {
 			list_del_init(&pstat->asoc_list);
 			pstapriv->asoc_list_cnt--;
 			if (pstat->expire_to > 0) {
@@ -1239,7 +1239,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		pstat->flags &= ~WLAN_STA_HT;
 
 
-	if ((pmlmepriv->htpriv.ht_option == false) && (pstat->flags&WLAN_STA_HT)) {
+	if ((!pmlmepriv->htpriv.ht_option) && (pstat->flags & WLAN_STA_HT)) {
 		status = WLAN_STATUS_CHALLENGE_FAIL;
 		goto OnAssocReqFail;
 	}
@@ -1474,7 +1474,7 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
 			u8 updated = false;
 
 			spin_lock_bh(&pstapriv->asoc_list_lock);
-			if (list_empty(&psta->asoc_list) == false) {
+			if (!list_empty(&psta->asoc_list)) {
 				list_del_init(&psta->asoc_list);
 				pstapriv->asoc_list_cnt--;
 				updated = ap_free_sta(padapter, psta, false, reason);
@@ -1546,7 +1546,7 @@ unsigned int OnDisassoc(struct adapter *padapter, union recv_frame *precv_frame)
 			u8 updated = false;
 
 			spin_lock_bh(&pstapriv->asoc_list_lock);
-			if (list_empty(&psta->asoc_list) == false) {
+			if (!list_empty(&psta->asoc_list)) {
 				list_del_init(&psta->asoc_list);
 				pstapriv->asoc_list_cnt--;
 				updated = ap_free_sta(padapter, psta, false, reason);
@@ -4973,7 +4973,7 @@ void linked_status_chk(struct adapter *padapter)
 		/*  todo: To check why we under miracast session, rx_chk would be false */
 		psta = rtw_get_stainfo(pstapriv, pmlmeinfo->network.mac_address);
 		if (psta) {
-			if (chk_ap_is_alive(padapter, psta) == false)
+			if (!chk_ap_is_alive(padapter, psta))
 				rx_chk = _FAIL;
 
 			if (pxmitpriv->last_tx_pkts == pxmitpriv->tx_pkts)
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index a52884d2129f..43977f868d29 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -382,7 +382,7 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 
 				/* psecuritypriv->dot118021XGrpKeyid, pmlmeinfo->key_index, rxdata_key_idx); */
 
-				if (psecuritypriv->binstallGrpkey == false) {
+				if (!psecuritypriv->binstallGrpkey) {
 					res = _FAIL;
 					goto exit;
 				}
@@ -406,10 +406,10 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 			}
 
 
-			if (bmic_err == true) {
+			if (bmic_err) {
 				/*  double check key_index for some timing issue , */
 				/*  cannot compare with psecuritypriv->dot118021XGrpKeyid also cause timing issue */
-				if ((is_multicast_ether_addr(prxattrib->ra) == true)  && (prxattrib->key_index != pmlmeinfo->key_index))
+				if ((is_multicast_ether_addr(prxattrib->ra))  && (prxattrib->key_index != pmlmeinfo->key_index))
 					brpt_micerror = false;
 
 				if (prxattrib->bdecrypted && brpt_micerror)
@@ -463,7 +463,7 @@ static union recv_frame *decryptor(struct adapter *padapter, union recv_frame *p
 		}
 	}
 
-	if ((prxattrib->encrypt > 0) && ((prxattrib->bdecrypted == 0) || (psecuritypriv->sw_decrypt == true))) {
+	if ((prxattrib->encrypt > 0) && ((prxattrib->bdecrypted == 0) || (psecuritypriv->sw_decrypt))) {
 		psecuritypriv->hw_decrypted = false;
 
 		switch (prxattrib->encrypt) {
@@ -713,8 +713,8 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 	u8 *sta_addr = NULL;
 	signed int bmcast = is_multicast_ether_addr(pattrib->dst);
 
-	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
+	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) ||
+		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))) {
 
 		/*  filter packets that SA is myself or multicast or broadcast */
 		if (!memcmp(myhwaddr, pattrib->src, ETH_ALEN)) {
@@ -736,7 +736,7 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 
 		sta_addr = pattrib->src;
 
-	} else if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) {
+	} else if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
 		/*  For Station mode, sa and bssid should always be BSSID, and DA is my mac-address */
 		if (memcmp(pattrib->bssid, pattrib->src, ETH_ALEN)) {
 			ret = _FAIL;
@@ -744,7 +744,7 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 		}
 
 		sta_addr = pattrib->bssid;
-	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) {
+	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 		if (bmcast) {
 			/*  For AP mode, if DA == MCAST, then BSSID should be also MCAST */
 			if (!is_multicast_ether_addr(pattrib->bssid)) {
@@ -761,7 +761,7 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 			sta_addr = pattrib->src;
 		}
 
-	} else if (check_fwstate(pmlmepriv, WIFI_MP_STATE) == true) {
+	} else if (check_fwstate(pmlmepriv, WIFI_MP_STATE)) {
 		memcpy(pattrib->dst, GetAddr1Ptr(ptr), ETH_ALEN);
 		memcpy(pattrib->src, GetAddr2Ptr(ptr), ETH_ALEN);
 		memcpy(pattrib->bssid, GetAddr3Ptr(ptr), ETH_ALEN);
@@ -800,9 +800,9 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 	u8 *myhwaddr = myid(&adapter->eeprompriv);
 	signed int bmcast = is_multicast_ether_addr(pattrib->dst);
 
-	if ((check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) &&
-	    (check_fwstate(pmlmepriv, _FW_LINKED) == true ||
-	     check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true)
+	if ((check_fwstate(pmlmepriv, WIFI_STATION_STATE)) &&
+	    (check_fwstate(pmlmepriv, _FW_LINKED) ||
+	     check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
 		) {
 
 		/*  filter packets that SA is myself or multicast or broadcast */
@@ -847,8 +847,8 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 			goto exit;
 		}
 
-	} else if ((check_fwstate(pmlmepriv, WIFI_MP_STATE) == true) &&
-		     (check_fwstate(pmlmepriv, _FW_LINKED) == true)) {
+	} else if ((check_fwstate(pmlmepriv, WIFI_MP_STATE)) &&
+		     (check_fwstate(pmlmepriv, _FW_LINKED))) {
 		memcpy(pattrib->dst, GetAddr1Ptr(ptr), ETH_ALEN);
 		memcpy(pattrib->src, GetAddr2Ptr(ptr), ETH_ALEN);
 		memcpy(pattrib->bssid, GetAddr3Ptr(ptr), ETH_ALEN);
@@ -866,7 +866,7 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 		}
 
 
-	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) {
+	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 		/* Special case */
 		ret = RTW_RX_HANDLED;
 		goto exit;
@@ -903,7 +903,7 @@ static signed int sta2ap_data_frame(struct adapter *adapter, union recv_frame *p
 	unsigned char *mybssid  = get_bssid(pmlmepriv);
 	signed int ret = _SUCCESS;
 
-	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) {
+	if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 		/* For AP mode, RA =BSSID, TX =STA(SRC_ADDR), A3 =DST_ADDR */
 		if (memcmp(pattrib->bssid, mybssid, ETH_ALEN)) {
 			ret = _FAIL;
@@ -1406,7 +1406,7 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 
 	/* only support station mode */
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) && check_fwstate(pmlmepriv, _FW_LINKED) &&
-	    adapter->securitypriv.binstallBIPkey == true) {
+	    adapter->securitypriv.binstallBIPkey) {
 		/* unicast management frame decrypt */
 		if (pattrib->privacy && !(is_multicast_ether_addr(GetAddr1Ptr(ptr))) &&
 			(subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC || subtype == WIFI_ACTION)) {
@@ -1590,7 +1590,7 @@ static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
 	eth_type = ntohs(be_tmp); /* pattrib->ether_type */
 	pattrib->eth_type = eth_type;
 
-	if ((check_fwstate(pmlmepriv, WIFI_MP_STATE) == true)) {
+	if ((check_fwstate(pmlmepriv, WIFI_MP_STATE))) {
 		ptr += rmv_len;
 		*ptr = 0x87;
 		*(ptr + 1) = 0x12;
@@ -1665,7 +1665,7 @@ static void rtw_recv_indicate_pkt(struct adapter *padapter, struct sk_buff *pkt,
 
 	/* Indicate the packets to upper layer */
 	if (pkt) {
-		if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) {
+		if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 			struct sk_buff *pskb2 = NULL;
 			struct sta_info *psta = NULL;
 			struct sta_priv *pstapriv = &padapter->stapriv;
@@ -1908,7 +1908,7 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 	plist = get_next(phead);
 
 	/*  Handling some condition for forced indicate case. */
-	if (bforced == true) {
+	if (bforced) {
 		if (list_empty(phead)) {
 			/*  spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
 			/* spin_unlock(&ppending_recvframe_queue->lock); */
@@ -1943,8 +1943,8 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 
 			/* indicate this recv_frame */
 			if (!pattrib->amsdu) {
-				if ((padapter->bDriverStopped == false) &&
-				    (padapter->bSurpriseRemoved == false))
+				if ((!padapter->bDriverStopped) &&
+				    (!padapter->bSurpriseRemoved))
 					rtw_recv_indicatepkt(padapter, prframe);/* indicate this recv_frame */
 
 			} else if (pattrib->amsdu == 1) {
@@ -1984,8 +1984,8 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 		wlanhdr_to_ethhdr(prframe);
 
 		if (pattrib->qos != 1) {
-			if ((padapter->bDriverStopped == false) &&
-			    (padapter->bSurpriseRemoved == false)) {
+			if ((!padapter->bDriverStopped) &&
+			    (!padapter->bSurpriseRemoved)) {
 				rtw_recv_indicatepkt(padapter, prframe);
 				return _SUCCESS;
 
@@ -1995,7 +1995,7 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 
 		}
 
-		if (preorder_ctrl->enable == false) {
+		if (!preorder_ctrl->enable) {
 			/* indicate this recv_frame */
 			preorder_ctrl->indicate_seq = pattrib->seq_num;
 
@@ -2006,7 +2006,7 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 			return _SUCCESS;
 		}
 	} else if (pattrib->amsdu == 1) { /* temp filter -> means didn't support A-MSDUs in a A-MPDU */
-		if (preorder_ctrl->enable == false) {
+		if (!preorder_ctrl->enable) {
 			preorder_ctrl->indicate_seq = pattrib->seq_num;
 
 			retval = amsdu_to_msdu(padapter, prframe);
@@ -2042,7 +2042,7 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 	/*  */
 
 	/* recv_indicatepkts_in_order(padapter, preorder_ctrl, true); */
-	if (recv_indicatepkts_in_order(padapter, preorder_ctrl, false) == true) {
+	if (recv_indicatepkts_in_order(padapter, preorder_ctrl, false)) {
 		_set_timer(&preorder_ctrl->reordering_ctrl_timer, REORDER_WAIT_TIME);
 		spin_unlock_bh(&ppending_recvframe_queue->lock);
 	} else {
@@ -2072,7 +2072,7 @@ void rtw_reordering_ctrl_timeout_handler(struct timer_list *t)
 
 	spin_lock_bh(&ppending_recvframe_queue->lock);
 
-	if (recv_indicatepkts_in_order(padapter, preorder_ctrl, true) == true)
+	if (recv_indicatepkts_in_order(padapter, preorder_ctrl, true))
 		_set_timer(&preorder_ctrl->reordering_ctrl_timer, REORDER_WAIT_TIME);
 
 	spin_unlock_bh(&ppending_recvframe_queue->lock);
@@ -2087,13 +2087,13 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct ht_priv *phtpriv = &pmlmepriv->htpriv;
 
-	if (phtpriv->ht_option == true) { /* B/G/N Mode */
+	if (phtpriv->ht_option) { /* B/G/N Mode */
 		/* prframe->u.hdr.preorder_ctrl = &precvpriv->recvreorder_ctrl[pattrib->priority]; */
 
 		if (recv_indicatepkt_reorder(padapter, prframe) != _SUCCESS) { /*  including perform A-MPDU Rx Ordering Buffer Control */
 
-			if ((padapter->bDriverStopped == false) &&
-			    (padapter->bSurpriseRemoved == false)) {
+			if ((!padapter->bDriverStopped) &&
+			    (!padapter->bSurpriseRemoved)) {
 				retval = _FAIL;
 				return retval;
 			}
@@ -2103,7 +2103,7 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 		if (retval != _SUCCESS)
 			return retval;
 
-		if ((padapter->bDriverStopped == false) && (padapter->bSurpriseRemoved == false)) {
+		if ((!padapter->bDriverStopped) && (!padapter->bSurpriseRemoved)) {
 			/* indicate this recv_frame */
 			rtw_recv_indicatepkt(padapter, prframe);
 		} else {
@@ -2192,7 +2192,7 @@ static int recv_func(struct adapter *padapter, union recv_frame *rframe)
 		/* check if need to enqueue into uc_swdec_pending_queue*/
 		if (check_fwstate(mlmepriv, WIFI_STATION_STATE) &&
 			!is_multicast_ether_addr(prxattrib->ra) && prxattrib->encrypt > 0 &&
-			(prxattrib->bdecrypted == 0 || psecuritypriv->sw_decrypt == true) &&
+			(prxattrib->bdecrypted == 0 || psecuritypriv->sw_decrypt) &&
 			psecuritypriv->ndisauthtype == Ndis802_11AuthModeWPAPSK &&
 			!psecuritypriv->busetkipkey) {
 			rtw_enqueue_recvframe(rframe, &padapter->recvpriv.uc_swdec_pending_queue);
@@ -2279,8 +2279,8 @@ static void rtw_signal_stat_timer_hdl(struct timer_list *t)
 			}
 		}
 
-		if (check_fwstate(&adapter->mlmepriv, _FW_UNDER_SURVEY) == true ||
-		    check_fwstate(&adapter->mlmepriv, _FW_LINKED) == false
+		if (check_fwstate(&adapter->mlmepriv, _FW_UNDER_SURVEY) ||
+		    !check_fwstate(&adapter->mlmepriv, _FW_LINKED)
 		) {
 			goto set_timer;
 		}
diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index 07a6db1d2317..349b27f91033 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -531,7 +531,7 @@ u8 rtw_access_ctrl(struct adapter *padapter, u8 *mac_addr)
 		paclnode = list_entry(plist, struct rtw_wlan_acl_node, list);
 
 		if (!memcmp(paclnode->addr, mac_addr, ETH_ALEN))
-			if (paclnode->valid == true) {
+			if (paclnode->valid) {
 				match = true;
 				break;
 			}
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 6a7c09db4cd9..fc9910eeeeec 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -147,7 +147,7 @@ unsigned int ratetbl2rateset(struct adapter *padapter, unsigned char *rateset)
 		default:
 			rate = ratetbl_val_2wifirate(rate);
 
-			if (is_basicrate(padapter, rate) == true)
+			if (is_basicrate(padapter, rate))
 				rate |= IEEE80211_BASIC_RATE_MASK;
 
 			rateset[len] = rate;
@@ -236,7 +236,7 @@ void Restore_DM_Func_Flag(struct adapter *padapter)
 
 void Switch_DM_Func(struct adapter *padapter, u32 mode, u8 enable)
 {
-	if (enable == true)
+	if (enable)
 		rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_SET, (u8 *)(&mode));
 	else
 		rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_CLR, (u8 *)(&mode));
@@ -847,7 +847,7 @@ static void bwmode_update_check(struct adapter *padapter, struct ndis_80211_var_
 	if (!pIE)
 		return;
 
-	if (phtpriv->ht_option == false)
+	if (!phtpriv->ht_option)
 		return;
 
 	if (pIE->length > sizeof(struct HT_info_element))
@@ -931,7 +931,7 @@ void HT_caps_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 	if (!pIE)
 		return;
 
-	if (phtpriv->ht_option == false)
+	if (!phtpriv->ht_option)
 		return;
 
 	pmlmeinfo->HT_caps_enable = 1;
@@ -994,7 +994,7 @@ void HT_info_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 	if (!pIE)
 		return;
 
-	if (phtpriv->ht_option == false)
+	if (!phtpriv->ht_option)
 		return;
 
 	if (pIE->length > sizeof(struct HT_info_element))
@@ -1122,7 +1122,7 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	struct mlme_priv *pmlmepriv = &Adapter->mlmepriv;
 	int ssid_len;
 
-	if (is_client_associated_to_ap(Adapter) == false)
+	if (!is_client_associated_to_ap(Adapter))
 		return true;
 
 	len = packet_len - sizeof(struct ieee80211_hdr_3addr);
@@ -1689,7 +1689,7 @@ void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
 		pmlmeext->bcn_delay_cnt[delay_ms]++;
 		/* pmlmeext->bcn_delay_ratio[delay_ms] = (pmlmeext->bcn_delay_cnt[delay_ms] * 100) /pmlmeext->bcn_cnt; */
 	/* dump for  adaptive_early_32k */
-	if (pmlmeext->bcn_cnt > 100 && (pmlmeext->adaptive_tsf_done == true)) {
+	if (pmlmeext->bcn_cnt > 100 && (pmlmeext->adaptive_tsf_done)) {
 		u8 ratio_20_delay, ratio_80_delay;
 		u8 DrvBcnEarly, DrvBcnTimeOut;
 
@@ -1737,7 +1737,7 @@ void rtw_alloc_macid(struct adapter *padapter, struct sta_info *psta)
 
 	spin_lock_bh(&pdvobj->lock);
 	for (i = 0; i < NUM_STA; i++) {
-		if (pdvobj->macid[i] == false) {
+		if (!pdvobj->macid[i]) {
 			pdvobj->macid[i]  = true;
 			break;
 		}
@@ -1762,7 +1762,7 @@ void rtw_release_macid(struct adapter *padapter, struct sta_info *psta)
 
 	spin_lock_bh(&pdvobj->lock);
 	if (psta->mac_id < NUM_STA && psta->mac_id != 1) {
-		if (pdvobj->macid[psta->mac_id] == true) {
+		if (pdvobj->macid[psta->mac_id]) {
 			pdvobj->macid[psta->mac_id] = false;
 			psta->mac_id = NUM_STA;
 		}
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 114b2c057f28..63972927433d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -386,7 +386,7 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 	} else {
 		while (true) {
 			/* IOT action */
-			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) && (pattrib->ampdu_en == true) &&
+			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) && (pattrib->ampdu_en) &&
 			    (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)) {
 				pattrib->vcs_mode = CTS_TO_SELF;
 				break;
@@ -422,7 +422,7 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 			/* to do list: check MIMO power save condition. */
 
 			/* check AMPDU aggregation for TXOP */
-			if (pattrib->ampdu_en == true) {
+			if (pattrib->ampdu_en) {
 				pattrib->vcs_mode = RTS_CTS;
 				break;
 			}
@@ -484,10 +484,10 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 	memset(pattrib->dot11tkiptxmickey.skey,  0, 16);
 	pattrib->mac_id = psta->mac_id;
 
-	if (psta->ieee8021x_blocked == true) {
+	if (psta->ieee8021x_blocked) {
 		pattrib->encrypt = 0;
 
-		if ((pattrib->ether_type != 0x888e) && (check_fwstate(pmlmepriv, WIFI_MP_STATE) == false)) {
+		if ((pattrib->ether_type != 0x888e) && (!check_fwstate(pmlmepriv, WIFI_MP_STATE))) {
 			res = _FAIL;
 			goto exit;
 		}
@@ -652,8 +652,8 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	memcpy(pattrib->dst, &etherhdr.h_dest, ETH_ALEN);
 	memcpy(pattrib->src, &etherhdr.h_source, ETH_ALEN);
 
-	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
+	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) ||
+		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))) {
 		memcpy(pattrib->ra, pattrib->dst, ETH_ALEN);
 		memcpy(pattrib->ta, pattrib->src, ETH_ALEN);
 	} else if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
@@ -719,7 +719,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 		if (!psta)	{ /*  if we cannot get psta => drop the pkt */
 			res = _FAIL;
 			goto exit;
-		} else if ((check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) && (!(psta->state & _FW_LINKED))) {
+		} else if ((check_fwstate(pmlmepriv, WIFI_AP_STATE) && (!(psta->state & _FW_LINKED))) {
 			res = _FAIL;
 			goto exit;
 		}
@@ -924,8 +924,8 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			if (pattrib->qos_en)
 				qos_option = true;
-		} else if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
+		} else if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) ||
+		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))) {
 			memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
 			memcpy(pwlanhdr->addr2, pattrib->src, ETH_ALEN);
 			memcpy(pwlanhdr->addr3, get_bssid(pmlmepriv), ETH_ALEN);
@@ -983,7 +983,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 						pattrib->ampdu_en = true;
 
 				/* re-check if enable ampdu by BA_starting_seqctrl */
-				if (pattrib->ampdu_en == true) {
+				if (pattrib->ampdu_en) {
 					u16 tx_seq;
 
 					tx_seq = psta->BA_starting_seqctrl[pattrib->priority & 0x0f];
@@ -1140,7 +1140,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 
 		frg_inx++;
 
-		if (bmcst || (rtw_endofpktfile(&pktfile) == true)) {
+		if (bmcst || (rtw_endofpktfile(&pktfile))) {
 			pattrib->nr_frags = frg_inx;
 
 			pattrib->last_txcmdsz = pattrib->hdrlen + pattrib->iv_len +
@@ -1166,7 +1166,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 
 	xmitframe_swencrypt(padapter, pxmitframe);
 
-	if (bmcst == false)
+	if (!bmcst)
 		update_attrib_vcs_info(padapter, pxmitframe);
 	else
 		pattrib->vcs_mode = NONE_VCS;
@@ -2002,14 +2002,14 @@ s32 rtw_xmit(struct adapter *padapter, struct sk_buff **ppkt)
 	do_queue_select(padapter, &pxmitframe->attrib);
 
 	spin_lock_bh(&pxmitpriv->lock);
-	if (xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe) == true) {
+	if (xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe)) {
 		spin_unlock_bh(&pxmitpriv->lock);
 		return 1;
 	}
 	spin_unlock_bh(&pxmitpriv->lock);
 
 	/* pre_xmitframe */
-	if (rtw_hal_xmit(padapter, pxmitframe) == false)
+	if (!rtw_hal_xmit(padapter, pxmitframe))
 		return 1;
 
 	return 0;
@@ -2053,7 +2053,7 @@ signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct x
 	signed int bmcst = is_multicast_ether_addr(pattrib->ra);
 	bool update_tim = false;
 
-	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == false)
+	if (!check_fwstate(pmlmepriv, WIFI_AP_STATE))
 		return ret;
 	psta = rtw_get_stainfo(&padapter->stapriv, pattrib->ra);
 	if (pattrib->psta != psta)
diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 2a2dd60be8bb..3974fa0e38b0 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -164,8 +164,8 @@ static u8 halbtcoutsrc_IsWifiBusy(struct adapter *padapter)
 
 	pmlmepriv = &padapter->mlmepriv;
 
-	if (check_fwstate(pmlmepriv, WIFI_ASOC_STATE) == true) {
-		if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true)
+	if (check_fwstate(pmlmepriv, WIFI_ASOC_STATE)) {
+		if (check_fwstate(pmlmepriv, WIFI_AP_STATE))
 			return true;
 		if (pmlmepriv->link_detect_info.busy_traffic)
 			return true;
@@ -185,8 +185,8 @@ static u32 _halbtcoutsrc_GetWifiLinkStatus(struct adapter *padapter)
 	bp2p = false;
 	portConnectedStatus = 0;
 
-	if (check_fwstate(pmlmepriv, WIFI_ASOC_STATE) == true) {
-		if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) {
+	if (check_fwstate(pmlmepriv, WIFI_ASOC_STATE)) {
+		if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 			if (bp2p)
 				portConnectedStatus |= WIFI_P2P_GO_CONNECTED;
 			else
@@ -528,7 +528,7 @@ static u8 halbtcoutsrc_Set(void *pBtcContext, u8 setType, void *pInBuf)
 	case BTC_SET_ACT_UPDATE_RAMASK:
 		pBtCoexist->btInfo.raMask = *pU4Tmp;
 
-		if (check_fwstate(&padapter->mlmepriv, WIFI_ASOC_STATE) == true) {
+		if (check_fwstate(&padapter->mlmepriv, WIFI_ASOC_STATE)) {
 			struct sta_info *psta;
 			struct wlan_bssid_ex *cur_network;
 
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 50370b14ce7c..8f97a3b54005 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -136,7 +136,7 @@ bool HAL_IsLegalChannel(struct adapter *adapter, u32 Channel)
 	bool bLegalChannel = true;
 
 	if ((Channel <= 14) && (Channel >= 1)) {
-		if (is_supported_24g(adapter->registrypriv.wireless_mode) == false)
+		if (!is_supported_24g(adapter->registrypriv.wireless_mode))
 			bLegalChannel = false;
 	} else {
 		bLegalChannel = false;
@@ -605,7 +605,7 @@ void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
 		odm->SupportAbility = *((u32 *)val);
 		break;
 	case HW_VAR_DM_FUNC_OP:
-		if (*((u8 *)val) == true) {
+		if (*((u8 *)val)) {
 			/* save dm flag */
 			odm->BK_SupportAbility = odm->SupportAbility;
 		} else {
diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index bdd595a99b98..d6e9c6f9e300 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -461,7 +461,7 @@ u8 PHY_GetTxPowerIndexBase(
 	u8 txPower = 0;
 	u8 chnlIdx = (Channel-1);
 
-	if (HAL_IsLegalChannel(padapter, Channel) == false)
+	if (!HAL_IsLegalChannel(padapter, Channel))
 		chnlIdx = 0;
 
 	if (IS_CCK_RATE(Rate))
@@ -490,7 +490,7 @@ s8 PHY_GetTxPowerTrackingOffset(struct adapter *padapter, u8 RFPath, u8 Rate)
 	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
 	s8 offset = 0;
 
-	if (pDM_Odm->RFCalibrateInfo.TxPowerTrackControl  == false)
+	if (!pDM_Odm->RFCalibrateInfo.TxPowerTrackControl)
 		return offset;
 
 	if ((Rate == MGN_1M) || (Rate == MGN_2M) || (Rate == MGN_5_5M) || (Rate == MGN_11M))
diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 27c0c0198714..9cae6462c705 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -160,7 +160,7 @@ s32	rtw_hal_mgnt_xmit(struct adapter *padapter, struct xmit_frame *pmgntframe)
 	/* pwlanhdr = (struct rtw_ieee80211_hdr *)pframe; */
 	/* memcpy(pmgntframe->attrib.ra, pwlanhdr->addr1, ETH_ALEN); */
 
-	if (padapter->securitypriv.binstallBIPkey == true) {
+	if (padapter->securitypriv.binstallBIPkey) {
 		if (is_multicast_ether_addr(pmgntframe->attrib.ra)) {
 			pmgntframe->attrib.encrypt = _BIP_;
 			/* pmgntframe->attrib.bswenc = true; */
@@ -206,7 +206,7 @@ void rtw_hal_update_ra_mask(struct sta_info *psta, u8 rssi_level)
 
 	pmlmepriv = &(padapter->mlmepriv);
 
-	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true)
+	if (check_fwstate(pmlmepriv, WIFI_AP_STATE))
 		add_ratid(padapter, psta, rssi_level);
 	else {
 		UpdateHalRAMask8723B(padapter, psta->mac_id, rssi_level);
diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index 639b6da2302b..4727ba276d59 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -381,7 +381,7 @@ static void FindMinimumRSSI(struct adapter *padapter)
 	/* 1 1.Determine the minimum RSSI */
 
 	if (
-		(pDM_Odm->bLinked != true) &&
+		(!pDM_Odm->bLinked) &&
 		(pdmpriv->EntryMinUndecoratedSmoothedPWDB == 0)
 	) {
 		pdmpriv->MinUndecoratedPWDBForDM = 0;
@@ -400,7 +400,7 @@ static void odm_RSSIMonitorCheckCE(struct dm_odm_t *pDM_Odm)
 	u32 PWDB_rssi[NUM_STA] = {0};/* 0~15]:MACID, [16~31]:PWDB_rssi */
 	struct ra_t *pRA_Table = &pDM_Odm->DM_RA_Table;
 
-	if (pDM_Odm->bLinked != true)
+	if (!pDM_Odm->bLinked)
 		return;
 
 	pRA_Table->firstconnect = pDM_Odm->bLinked;
@@ -431,7 +431,7 @@ static void odm_RSSIMonitorCheckCE(struct dm_odm_t *pDM_Odm)
 
 		for (i = 0; i < sta_cnt; i++) {
 			if (PWDB_rssi[i] != (0)) {
-				if (pHalData->fw_ractrl == true)/*  Report every sta's RSSI to FW */
+				if (pHalData->fw_ractrl) /* Report every sta's RSSI to FW */
 					rtl8723b_set_rssi_cmd(Adapter, (u8 *)(&PWDB_rssi[i]));
 			}
 		}
@@ -623,7 +623,7 @@ void ODM_DMWatchdog(struct dm_odm_t *pDM_Odm)
 	}
 	odm_CCKPacketDetectionThresh(pDM_Odm);
 
-	if (*(pDM_Odm->pbPowerSaving) == true)
+	if (*(pDM_Odm->pbPowerSaving))
 		return;
 
 
diff --git a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
index 166af5f6c9e0..e2e8cf5b6718 100644
--- a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
+++ b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
@@ -138,7 +138,7 @@ void ODM_CfoTracking(void *pDM_VOID)
 		pCfoTrack->CFO_ave_pre = CFO_ave;
 
 		/* 4 1.4 Dynamic Xtal threshold */
-		if (pCfoTrack->bAdjust == false) {
+		if (!pCfoTrack->bAdjust) {
 			if (CFO_ave > CFO_TH_XTAL_HIGH || CFO_ave < (-CFO_TH_XTAL_HIGH))
 				pCfoTrack->bAdjust = true;
 		} else {
diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.c b/drivers/staging/rtl8723bs/hal/odm_DIG.c
index 33661182d85a..9a1a1ec9ab89 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.c
@@ -82,7 +82,7 @@ void odm_NHMBB(void *pDM_VOID)
 
 
 	if ((pDM_Odm->NHMCurTxOkcnt) + 1 > (u64)(pDM_Odm->NHMCurRxOkcnt<<2) + 1) { /* Tx > 4*Rx possible for adaptivity test */
-		if (pDM_Odm->NHM_cnt_0 >= 190 || pDM_Odm->adaptivity_flag == true) {
+		if (pDM_Odm->NHM_cnt_0 >= 190 || pDM_Odm->adaptivity_flag) {
 			/* Enable EDCCA since it is possible running Adaptivity testing */
 			/* test_status = 1; */
 			pDM_Odm->adaptivity_flag = true;
@@ -99,7 +99,7 @@ void odm_NHMBB(void *pDM_VOID)
 			}
 		}
 	} else { /*  TX<RX */
-		if (pDM_Odm->adaptivity_flag == true && pDM_Odm->NHM_cnt_0 <= 200) {
+		if (pDM_Odm->adaptivity_flag && pDM_Odm->NHM_cnt_0 <= 200) {
 			/* test_status = 2; */
 			pDM_Odm->tolerance_cnt = 0;
 		} else {
@@ -189,7 +189,7 @@ void odm_AdaptivityInit(void *pDM_VOID)
 {
 	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
 
-	if (pDM_Odm->Carrier_Sense_enable == false)
+	if (!pDM_Odm->Carrier_Sense_enable)
 		pDM_Odm->TH_L2H_ini = 0xf7; /*  -7 */
 	else
 		pDM_Odm->TH_L2H_ini = 0xa;
@@ -232,7 +232,7 @@ void odm_Adaptivity(void *pDM_VOID, u8 IGI)
 	pDM_Odm->IGI_target = (u8) IGI_target;
 
 	/* Search pwdB lower bound */
-	if (pDM_Odm->TxHangFlg == true) {
+	if (pDM_Odm->TxHangFlg) {
 		PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_DBG_RPT_11N, bMaskDWord, 0x208);
 		odm_SearchPwdBLowerBound(pDM_Odm, pDM_Odm->IGI_target);
 	}
@@ -253,9 +253,9 @@ void odm_Adaptivity(void *pDM_VOID, u8 IGI)
 
 	if (
 		pDM_Odm->bLinked &&
-		pDM_Odm->Carrier_Sense_enable == false &&
-		pDM_Odm->NHM_disable == false &&
-		pDM_Odm->TxHangFlg == false
+		!pDM_Odm->Carrier_Sense_enable &&
+		!pDM_Odm->NHM_disable &&
+		!pDM_Odm->TxHangFlg
 	)
 		odm_NHMBB(pDM_Odm);
 
@@ -323,7 +323,7 @@ bool odm_DigAbort(void *pDM_VOID)
 		return	true;
 
 	/* add by Neil Chen to avoid PSD is processing */
-	if (pDM_Odm->bDMInitialGainEnable == false)
+	if (!pDM_Odm->bDMInitialGainEnable)
 		return	true;
 
 	return	false;
@@ -387,14 +387,14 @@ void odm_DIG(void *pDM_VOID)
 	if (odm_DigAbort(pDM_Odm))
 		return;
 
-	if (pDM_Odm->adaptivity_flag == true)
+	if (pDM_Odm->adaptivity_flag)
 		Adap_IGI_Upper = pDM_Odm->Adaptivity_IGI_upper;
 
 
 	/* 1 Update status */
 	DIG_Dynamic_MIN = pDM_DigTable->DIG_Dynamic_MIN_0;
-	FirstConnect = (pDM_Odm->bLinked) && (pDM_DigTable->bMediaConnect_0 == false);
-	FirstDisConnect = (!pDM_Odm->bLinked) && (pDM_DigTable->bMediaConnect_0 == true);
+	FirstConnect = (pDM_Odm->bLinked) && (!pDM_DigTable->bMediaConnect_0);
+	FirstDisConnect = (!pDM_Odm->bLinked) && (pDM_DigTable->bMediaConnect_0);
 
 	/* 1 Boundary Decision */
 	/* 2 For WIN\CE */
@@ -529,7 +529,7 @@ void odm_DIG(void *pDM_VOID)
 	/* 1 Force upper bound and lower bound for adaptivity */
 	if (
 		pDM_Odm->SupportAbility & ODM_BB_ADAPTIVITY &&
-		pDM_Odm->adaptivity_flag == true
+		pDM_Odm->adaptivity_flag
 	) {
 		if (CurrentIGI > Adap_IGI_Upper)
 			CurrentIGI = Adap_IGI_Upper;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 12416e499ac3..265418ebf94d 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -363,7 +363,7 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 	}
 
 	if (psmode > 0) {
-		if (hal_btcoex_IsBtControlLps(padapter) == true) {
+		if (hal_btcoex_IsBtControlLps(padapter)) {
 			PowerState = hal_btcoex_RpwmVal(padapter);
 			byte5 = hal_btcoex_LpsVal(padapter);
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
index 928226679ab4..195814de0df2 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
@@ -131,21 +131,21 @@ void rtl8723b_HalDmWatchDog(struct adapter *Adapter)
 
 	hw_init_completed = Adapter->hw_init_completed;
 
-	if (hw_init_completed == false)
+	if (!hw_init_completed)
 		goto skip_dm;
 
 	fw_current_in_ps_mode = adapter_to_pwrctl(Adapter)->fw_current_in_ps_mode;
 	rtw_hal_get_hwreg(Adapter, HW_VAR_FWLPS_RF_ON, (u8 *)(&bFwPSAwake));
 
 	if (
-		(hw_init_completed == true) &&
+		(hw_init_completed) &&
 		((!fw_current_in_ps_mode) && bFwPSAwake)
 	) {
 		rtw_hal_check_rxfifo_full(Adapter);
 	}
 
 	/* ODM */
-	if (hw_init_completed == true) {
+	if (hw_init_completed) {
 		u8 bLinked = false;
 		u8 bsta_state = false;
 		bool bBtDisabled = true;
@@ -207,7 +207,7 @@ void rtl8723b_HalDmWatchDog_in_LPS(struct adapter *Adapter)
 	struct sta_priv *pstapriv = &Adapter->stapriv;
 	struct sta_info *psta = NULL;
 
-	if (Adapter->hw_init_completed == false)
+	if (!Adapter->hw_init_completed)
 		goto skip_lps_dm;
 
 
@@ -216,7 +216,7 @@ void rtl8723b_HalDmWatchDog_in_LPS(struct adapter *Adapter)
 
 	ODM_CmnInfoUpdate(&pHalData->odmpriv, ODM_CMNINFO_LINK, bLinked);
 
-	if (bLinked == false)
+	if (!bLinked)
 		goto skip_lps_dm;
 
 	if (!(pDM_Odm->SupportAbility & ODM_BB_RSSI_MONITOR))
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index e794fe3caf9d..91fa289f81b7 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -738,7 +738,7 @@ static void hal_ReadEFuse_BT(
 	Hal_GetEfuseDefinition(padapter, EFUSE_BT, TYPE_AVAILABLE_EFUSE_BYTES_BANK, &total);
 
 	for (bank = 1; bank < 3; bank++) { /*  8723b Max bake 0~2 */
-		if (hal_EfuseSwitchToBank(padapter, bank) == false)
+		if (!hal_EfuseSwitchToBank(padapter, bank))
 			goto exit;
 
 		eFuse_Addr = 0;
@@ -882,7 +882,7 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 	rtw_write16(padapter, REG_TBTT_PROHIBIT, 0x6404);/*  ms */
 	/*  Firmware will control REG_DRVERLYINT when power saving is enable, */
 	/*  so don't set this register on STA mode. */
-	if (check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE) == false)
+	if (!check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE))
 		rtw_write8(padapter, REG_DRVERLYINT, DRIVER_EARLY_INT_TIME_8723B); /*  5ms */
 	rtw_write8(padapter, REG_BCNDMATIM, BCN_DMA_ATIME_INT_TIME_8723B); /*  2ms */
 
@@ -998,7 +998,7 @@ void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
 	rtw_write32(padapter, REG_TCR, value32);
 
 	/*  NOTE: Fix test chip's bug (about contention windows's randomness) */
-	if (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE|WIFI_ADHOC_MASTER_STATE|WIFI_AP_STATE) == true) {
+	if (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE|WIFI_ADHOC_MASTER_STATE|WIFI_AP_STATE)) {
 		rtw_write8(padapter, REG_RXTSF_OFFSET_CCK, 0x50);
 		rtw_write8(padapter, REG_RXTSF_OFFSET_OFDM, 0x50);
 	}
@@ -2118,7 +2118,7 @@ static void hw_var_set_mlme_sitesurvey(struct adapter *padapter, u8 variable, u8
 	/*  config RCR to receive different BSSID & not to receive data frame */
 	value_rxfltmap2 = 0;
 
-	if ((check_fwstate(pmlmepriv, WIFI_AP_STATE) == true))
+	if ((check_fwstate(pmlmepriv, WIFI_AP_STATE)))
 		rcr_clear_bit = RCR_CBSSID_BCN;
 
 	value_rcr = rtw_read32(padapter, REG_RCR);
@@ -2185,7 +2185,7 @@ static void hw_var_set_mlme_join(struct adapter *padapter, u8 variable, u8 *val)
 			val32 |= RCR_CBSSID_DATA|RCR_CBSSID_BCN;
 		rtw_write32(padapter, REG_RCR, val32);
 
-		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true)
+		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE))
 			RetryLimit = (pEEPROM->CustomerID == RT_CID_CCX) ? 7 : 48;
 		else /*  Ad-hoc Mode */
 			RetryLimit = 0x7;
@@ -2723,7 +2723,7 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 		break;
 
 	case HW_VAR_DL_RSVD_PAGE:
-		if (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)
+		if (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE))
 			rtl8723b_download_BTCoex_AP_mode_rsvd_page(padapter);
 		else
 			rtl8723b_download_rsvd_page(padapter, RT_MEDIA_CONNECT);
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index cab4707091e2..888029e21dcb 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -135,7 +135,7 @@ static void update_recvframe_phyinfo(union recv_frame *precvframe,
 	precvframe->u.hdr.psta = NULL;
 	if (
 		pkt_info.bssid_match &&
-		(check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)
+		(check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE))
 	) {
 		if (psta) {
 			precvframe->u.hdr.psta = psta;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index f50726d2ed0c..26b8107e69be 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -93,7 +93,7 @@ static s32 rtl8723_dequeue_writeport(struct adapter *padapter)
 	)
 		goto free_xmitbuf;
 
-	if (rtw_sdio_wait_enough_TxOQT_space(padapter, pxmitbuf->agg_num) == false)
+	if (!rtw_sdio_wait_enough_TxOQT_space(padapter, pxmitbuf->agg_num))
 		goto free_xmitbuf;
 
 	traffic_check_for_leave_lps(padapter, true, pxmitbuf->agg_num);
@@ -225,7 +225,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 
 			frame_phead = get_list_head(pframe_queue);
 
-			while (list_empty(frame_phead) == false) {
+			while (!list_empty(frame_phead)) {
 				frame_plist = get_next(frame_phead);
 				pxmitframe = container_of(frame_plist, struct xmit_frame, list);
 
@@ -269,7 +269,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 				}
 
 				/*  ok to send, remove frame from queue */
-				if (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)
+				if (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE))
 					if (
 						(pxmitframe->attrib.psta->state & WIFI_SLEEP_STATE) &&
 						(pxmitframe->attrib.triggered == 0)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index f2f73c65a636..f4073f6a342f 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -597,7 +597,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	pwrctrlpriv = adapter_to_pwrctl(padapter);
 
 	if (
-		adapter_to_pwrctl(padapter)->bips_processing == true &&
+		adapter_to_pwrctl(padapter)->bips_processing &&
 		adapter_to_pwrctl(padapter)->pre_ips_type == 0
 	) {
 		unsigned long start_time;
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 098456e97c96..38b84c8b1143 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -275,7 +275,7 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 	notify_timestamp = ktime_to_us(ktime_get_boottime());
 
 	/* We've set wiphy's signal_type as CFG80211_SIGNAL_TYPE_MBM: signal strength in mBm (100*dBm) */
-	if (check_fwstate(pmlmepriv, _FW_LINKED) == true &&
+	if (check_fwstate(pmlmepriv, _FW_LINKED) &&
 	    is_same_network(&pmlmepriv->cur_network.network, &pnetwork->network, 0)) {
 		notify_signal = 100 * translate_percentage_to_dbm(padapter->recvpriv.signal_strength);/* dbm */
 	} else {
@@ -372,7 +372,7 @@ void rtw_cfg80211_ibss_indicate_connect(struct adapter *padapter)
 		struct wlan_bssid_ex  *pnetwork = &(padapter->mlmeextpriv.mlmext_info.network);
 		struct wlan_network *scanned = pmlmepriv->cur_network_scanned;
 
-		if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true) {
+		if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
 			memcpy(&cur_network->network, pnetwork, sizeof(struct wlan_bssid_ex));
 			rtw_cfg80211_inform_bss(padapter, cur_network);
 		} else {
@@ -410,7 +410,7 @@ void rtw_cfg80211_indicate_connect(struct adapter *padapter)
 		return;
 	}
 
-	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true)
+	if (check_fwstate(pmlmepriv, WIFI_AP_STATE))
 		return;
 
 	{
@@ -479,7 +479,7 @@ void rtw_cfg80211_indicate_disconnect(struct adapter *padapter)
 		return;
 	}
 
-	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true)
+	if (check_fwstate(pmlmepriv, WIFI_AP_STATE))
 		return;
 
 	if (!padapter->mlmepriv.not_indic_disco) {
@@ -768,7 +768,7 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 		struct sta_info *psta, *pbcmc_sta;
 		struct sta_priv *pstapriv = &padapter->stapriv;
 
-		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE | WIFI_MP_STATE) == true) { /* sta mode */
+		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE | WIFI_MP_STATE)) { /* sta mode */
 			psta = rtw_get_stainfo(pstapriv, get_bssid(pmlmepriv));
 			if (psta) {
 				/* Jeff: don't disable ieee8021x_blocked while clearing key */
@@ -891,15 +891,15 @@ static int cfg80211_rtw_add_key(struct wiphy *wiphy, struct net_device *ndev,
 		memcpy(param->u.crypt.key, (u8 *)params->key, params->key_len);
 	}
 
-	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) {
+	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
 		ret =  rtw_cfg80211_set_encryption(ndev, param, param_len);
-	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) {
+	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 		if (mac_addr)
 			memcpy(param->sta_addr, mac_addr, ETH_ALEN);
 
 		ret = rtw_cfg80211_ap_set_encryption(ndev, param, param_len);
-	} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true
-		|| check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true) {
+	} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)
+		|| check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
 		ret =  rtw_cfg80211_set_encryption(ndev, param, param_len);
 	}
 
@@ -1031,7 +1031,7 @@ static int cfg80211_rtw_change_iface(struct wiphy *wiphy,
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	int ret = 0;
 
-	if (adapter_to_dvobj(padapter)->processing_dev_remove == true) {
+	if (adapter_to_dvobj(padapter)->processing_dev_remove) {
 		ret = -EPERM;
 		goto exit;
 	}
@@ -1072,7 +1072,7 @@ static int cfg80211_rtw_change_iface(struct wiphy *wiphy,
 
 	rtw_wdev->iftype = type;
 
-	if (rtw_set_802_11_infrastructure_mode(padapter, networkType) == false) {
+	if (!rtw_set_802_11_infrastructure_mode(padapter, networkType)) {
 		rtw_wdev->iftype = old_type;
 		ret = -EPERM;
 		goto exit;
@@ -1207,8 +1207,8 @@ static int cfg80211_rtw_scan(struct wiphy *wiphy
 	pwdev_priv->scan_request = request;
 	spin_unlock_bh(&pwdev_priv->scan_req_lock);
 
-	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) {
-		if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS | _FW_UNDER_SURVEY | _FW_UNDER_LINKING) == true) {
+	if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
+		if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS | _FW_UNDER_SURVEY | _FW_UNDER_LINKING)) {
 			need_indicate_scan_done = true;
 			goto check_need_indicate_scan_done;
 		}
@@ -1223,10 +1223,10 @@ static int cfg80211_rtw_scan(struct wiphy *wiphy
 	if (request->ie && request->ie_len > 0)
 		rtw_cfg80211_set_probe_req_wpsp2pie(padapter, (u8 *)request->ie, request->ie_len);
 
-	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) == true) {
+	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY)) {
 		need_indicate_scan_done = true;
 		goto check_need_indicate_scan_done;
-	} else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true) {
+	} else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING)) {
 		ret = -EBUSY;
 		goto check_need_indicate_scan_done;
 	}
@@ -1282,7 +1282,7 @@ static int cfg80211_rtw_scan(struct wiphy *wiphy
 	}
 	spin_unlock_bh(&pmlmepriv->lock);
 
-	if (_status == false)
+	if (!_status)
 		ret = -1;
 
 check_need_indicate_scan_done:
@@ -1582,7 +1582,7 @@ static int cfg80211_rtw_join_ibss(struct wiphy *wiphy, struct net_device *ndev,
 	ret = rtw_cfg80211_set_auth_type(psecuritypriv, NL80211_AUTHTYPE_OPEN_SYSTEM);
 	rtw_set_802_11_authentication_mode(padapter, psecuritypriv->ndisauthtype);
 
-	if (rtw_set_802_11_ssid(padapter, &ndis_ssid) == false) {
+	if (!rtw_set_802_11_ssid(padapter, &ndis_ssid)) {
 		ret = -1;
 		goto exit;
 	}
@@ -1608,7 +1608,7 @@ static int cfg80211_rtw_leave_ibss(struct wiphy *wiphy, struct net_device *ndev)
 
 		rtw_wdev->iftype = NL80211_IFTYPE_STATION;
 
-		if (rtw_set_802_11_infrastructure_mode(padapter, Ndis802_11Infrastructure) == false) {
+		if (!rtw_set_802_11_infrastructure_mode(padapter, Ndis802_11Infrastructure)) {
 			rtw_wdev->iftype = old_type;
 			ret = -EPERM;
 			goto leave_ibss;
@@ -1632,7 +1632,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 
 	padapter->mlmepriv.not_indic_disco = true;
 
-	if (adapter_wdev_data(padapter)->block == true) {
+	if (adapter_wdev_data(padapter)->block) {
 		ret = -EBUSY;
 		goto exit;
 	}
@@ -1662,11 +1662,11 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 	ndis_ssid.ssid_length = sme->ssid_len;
 	memcpy(ndis_ssid.ssid, (u8 *)sme->ssid, sme->ssid_len);
 
-	if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true) {
+	if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING)) {
 		ret = -EBUSY;
 		goto exit;
 	}
-	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) == true)
+	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
 		rtw_scan_abort(padapter);
 
 	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
@@ -1759,7 +1759,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 
 	/* rtw_set_802_11_encryption_mode(padapter, padapter->securitypriv.ndisencryptstatus); */
 
-	if (rtw_set_802_11_connect(padapter, (u8 *)sme->bssid, &ndis_ssid) == false) {
+	if (!rtw_set_802_11_connect(padapter, (u8 *)sme->bssid, &ndis_ssid)) {
 		ret = -1;
 		goto exit;
 	}
@@ -2065,7 +2065,7 @@ static netdev_tx_t rtw_cfg80211_monitor_if_xmit_entry(struct sk_buff *skb, struc
 		u32 len = skb->len;
 		u8 category, action;
 
-		if (rtw_action_frame_parse(buf, len, &category, &action) == false)
+		if (!rtw_action_frame_parse(buf, len, &category, &action))
 			goto fail;
 
 		/* starting alloc mgmt frame to dump it */
@@ -2546,7 +2546,7 @@ static int cfg80211_rtw_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 	/* indicate ack before issue frame to avoid racing with rsp frame */
 	rtw_cfg80211_mgmt_tx_status(padapter, *cookie, buf, len, ack, GFP_KERNEL);
 
-	if (rtw_action_frame_parse(buf, len, &category, &action) == false)
+	if (!rtw_action_frame_parse(buf, len, &category, &action))
 		goto exit;
 
 	rtw_ps_deny(padapter, PS_DENY_MGNT_TX);
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
index 3ea9fdfa14f8..e9a2f3f7ec74 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
@@ -224,7 +224,7 @@ u32 sd_read32(struct intf_hdl *pintfhdl, u32 addr, s32 *err)
 			if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
 				padapter->bSurpriseRemoved = true;
 
-			if (rtw_inc_and_chk_continual_io_error(psdiodev) == true) {
+			if (rtw_inc_and_chk_continual_io_error(psdiodev)) {
 				padapter->bSurpriseRemoved = true;
 				break;
 			}
@@ -300,7 +300,7 @@ void sd_write32(struct intf_hdl *pintfhdl, u32 addr, u32 v, s32 *err)
 			if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
 				padapter->bSurpriseRemoved = true;
 
-			if (rtw_inc_and_chk_continual_io_error(psdiodev) == true) {
+			if (rtw_inc_and_chk_continual_io_error(psdiodev)) {
 				padapter->bSurpriseRemoved = true;
 				break;
 			}
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 0be3143fffe5..8be1a736c9d3 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -188,13 +188,13 @@ void _rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	s32 res = 0;
 
-	if (rtw_if_up(padapter) == false)
+	if (!rtw_if_up(padapter))
 		goto drop_packet;
 
 	rtw_check_xmit_resource(padapter, pkt);
 
 	if (!rtw_mc2u_disable
-		&& check_fwstate(pmlmepriv, WIFI_AP_STATE) == true
+		&& check_fwstate(pmlmepriv, WIFI_AP_STATE)
 		&& (IP_MCAST_MAC(pkt->data)
 			|| ICMPV6_MCAST_MAC(pkt->data)
 			)
-- 
2.53.0

