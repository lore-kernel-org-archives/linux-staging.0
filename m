Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A22339843
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 22:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770761766; cv=none; b=onV3B1Kdp9oQ1oCmV7Nvp9S3DHWpcW2MxlasnR9NjVvixyCHykvuFTQ7409/66hvPohY7+lMmnxLtYw5+4Zb3P0sn2u484+hWqTa4noTLOGnaGS40meiE+6IpUj6e38dj2SptAX2h/rl11KmnTS7k9ApxkBP8DhtFqDhG7kQ0Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770761766; c=relaxed/simple;
	bh=rcS9UXpBMki+g8wklx8OJXM3R7e/8S/77Vnj/UnagJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i3MzeCnBN7ICUKLZJNxx5ZPlkjIeNyr3NukcCKsa2dBeLlZeAufs93VFUoCn07rt9m3pb8b4CxJc/V1h06FOiGomYjEUOoY7movjfgI0aXAv5pe7lYfFDcfb+r95ZW/SqlkjXyF8XFjU3eNOi73MvoIF88n8sbcdzwZ0jrnlWCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D8/+jjYf; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8/+jjYf"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4376de3f128so1806618f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 14:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770761762; x=1771366562; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D5EErwWZNIVjRi0PtzrUowuno8mLa9CPrxyLIiYgoJA=;
        b=D8/+jjYfjFW+MzIiXy6Q0+bv1YfeiaGxSzEdC4Q2Y/2MeUvox0QFmblmIN/fFOya6M
         9e2TrSe3uv7px5+NQFrxI7Qod8jfDP0ub2aggTUXOVH3FbRwUQ5b5WQPXwmA/KOK5S4o
         AZ9OH6g9Iu/dSTxWoprMTUqWPIKWgxaZC663tPdA9sDIDaQ2OpEPCW/1CBIiezq0CXZ9
         ac6Urj/OC3iROuDTm/3bHU8KggO6vsqKOSGi5MAeu1kn5DPGyTMVyhts6YYAhGBTg6xN
         q3NDnt47dgcF0B6Y+V8RpcfW9hG8YTlvbaQraStOKRONG7TTKogMElhupkCUYRH7dn/J
         djkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770761762; x=1771366562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D5EErwWZNIVjRi0PtzrUowuno8mLa9CPrxyLIiYgoJA=;
        b=KfEUJuMLkiOeTHZFFUuHsQZsMvxb5xz2fUEZZG3Qk6nbau07EY5V98SUpk68b7fuQe
         lZX7UaI8FQZ4uykOnQH4YLl1SgmxHDwv236CFVCZ5nQaxsKfbuK9zL8c8Bf4p/7ecj/9
         n1lcBBgYOa1ElnBcAEac8s22seOnwJDJr57FCppu2kAyju3GSfzN2wlO/4+zfoJUrAs2
         aTU2T+hrlRBAcyROsxEZJiN0PmYNr3r94T0whbR6wsQuDBCccN2h4ciCnTFmha3Qsqtr
         PwESOePxuQw7sbb0XQahPNFaR9jESWpmHtqYG8PErvrhU5ZoZmGuWTDXbgQBQFEJoZln
         J5tA==
X-Forwarded-Encrypted: i=1; AJvYcCXCT7qHyA3vJnJXiwYAU6NeGqeKBwvUEFvKRIkD3cxn9nuIHdA3gW3LdWs22HMyl3DW8rXEJsb7QIlGHffS@lists.linux.dev
X-Gm-Message-State: AOJu0YzoNra/g9+SImJSZXX7hjq1fxz8gusVsUzdhDprbfb7tHE3/8uS
	O7q6MfcKfx/rLcRJopru8Dvz4D+/I1q2LWCNscaa/htM+smuU1rqRtf/
X-Gm-Gg: AZuq6aIJj4r5xD85hrVOl/6hUUgT9QdUNDyZsoTjfrTl11hztezrm76rULIBAFnDr+R
	fWwYPDZQngWg/LVB2NwNYhZbroEh1rS+3R9DghgG8MfsSHiBKC7be3fCt+kUFnbEaQ8mQkUVGMX
	n8qOAStqUfTZz2VbP+GQhjM43gjv9O8qS0UKWI7gnoftjwSUqif5FCzmiJ/yNuQSQTN11pkNvVp
	5QA3K1OG099rc3lgk1FcGBSweRjFNMt9g1nu4u/lViRyVN3o/9upM6JmpHc3T16odjhlI0PtBbb
	SCYpSQIAMGSeDamhO6gEtJitvMtPKdkjMXTQ5MYTSpP7jP30mgomLemdGAR5/akAF2TB+oGf4bo
	7JSDs/LwcxgYOnfzp82tlr5sXMqOkc87/n8wDynLk78qeGxODS5SLzqRPTNF+WIO7nsER8iBDYU
	edQFgR2U2xK+xxc8clPrK0dyPsxmPh9lMefNI=
X-Received: by 2002:a05:6000:420e:b0:436:1517:aec7 with SMTP id ffacd0b85a97d-43782c25862mr804400f8f.17.1770761761347;
        Tue, 10 Feb 2026 14:16:01 -0800 (PST)
Received: from MARKPC.localdomain ([37.203.152.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783e5c93asm24878f8f.39.2026.02.10.14.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 14:16:01 -0800 (PST)
From: markatbritain@gmail.com
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mark Wu <markatbritain@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove NDIS_802_11 types and cleanup style
Date: Tue, 10 Feb 2026 22:15:07 +0000
Message-ID: <20260210221556.73872-1-markatbritain@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mark Wu <markatbritain@gmail.com>

The rtl8723bs driver contains legacy NDIS_802_11 definitions and
typedefs that are not idiomatic to the Linux kernel. This patch
replaces these with standard Linux types and enums where applicable
to improve portability and readability.

These changes bring the driver closer to the standard Linux kernel
coding style and prepare it for eventual promotion out of staging.

Signed-off-by: Mark Wu <markatbritain@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c       |  14 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  10 +-
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  27 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  58 ++++----
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  16 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     |   2 +-
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |   2 +-
 drivers/staging/rtl8723bs/hal/hal_intf.c      |  10 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |   6 +-
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |   2 +-
 .../staging/rtl8723bs/include/rtw_security.h  |   8 +-
 .../staging/rtl8723bs/include/wlan_bssdef.h   | 115 +++++++--------
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 138 ++++++++++--------
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |   6 +-
 14 files changed, 219 insertions(+), 195 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index ebe73abab892..94282360bc3e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -829,7 +829,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 	memcpy(ie, pbuf, pbss_network->ie_length);
 
-	if (pbss_network->infrastructure_mode != Ndis802_11APMode)
+	if (pbss_network->infrastructure_mode != NDIS_802_11_AP_MODE)
 		return _FAIL;
 
 	pbss_network->rssi = 0;
@@ -1063,16 +1063,16 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 	switch (network_type) {
 	case WIRELESS_11B:
-		pbss_network->network_type_in_use = Ndis802_11DS;
+		pbss_network->network_type_in_use = NDIS_802_11_DS;
 		break;
 	case WIRELESS_11G:
 	case WIRELESS_11BG:
 	case WIRELESS_11G_24N:
 	case WIRELESS_11BG_24N:
-		pbss_network->network_type_in_use = Ndis802_11OFDM24;
+		pbss_network->network_type_in_use = NDIS_802_11_FDM24;
 		break;
 	default:
-		pbss_network->network_type_in_use = Ndis802_11OFDM24;
+		pbss_network->network_type_in_use = NDIS_802_11_FDM24;
 		break;
 	}
 
@@ -1959,7 +1959,7 @@ void rtw_ap_restore_network(struct adapter *padapter)
 	char chk_alive_list[NUM_STA];
 	int i;
 
-	rtw_setopmode_cmd(padapter, Ndis802_11APMode, false);
+	rtw_setopmode_cmd(padapter, NDIS_802_11_AP_MODE, false);
 
 	set_channel_bwmode(padapter,
 			   pmlmeext->cur_channel,
@@ -2079,8 +2079,8 @@ void stop_ap_mode(struct adapter *padapter)
 	memset((unsigned char *)&padapter->securitypriv,
 	       0,
 	       sizeof(struct security_priv));
-	padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeOpen;
-	padapter->securitypriv.ndisencryptstatus = Ndis802_11WEPDisabled;
+	padapter->securitypriv.ndisauthtype = NDIS_802_11_AUTH_MODE_OPEN;
+	padapter->securitypriv.ndisencryptstatus = NDIS_802_11_WEP_DISABLED;
 
 	/* for ACL */
 	spin_lock_bh(&pacl_node_q->lock);
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index b2e7f479f72b..a7b92d42397e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -697,17 +697,17 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	/* for hidden ap to set fw_state here */
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE | WIFI_ADHOC_STATE) != true) {
 		switch (ndis_network_mode) {
-		case Ndis802_11IBSS:
+		case NDIS_802_11_IBSS:
 			set_fwstate(pmlmepriv, WIFI_ADHOC_STATE);
 			break;
 
-		case Ndis802_11Infrastructure:
+		case NDIS_802_11_INFRASTRUCTURE:
 			set_fwstate(pmlmepriv, WIFI_STATION_STATE);
 			break;
 
-		case Ndis802_11APMode:
-		case Ndis802_11AutoUnknown:
-		case Ndis802_11InfrastructureMax:
+		case NDIS_802_11_AP_MODE:
+		case NDIS_802_11_AUTO_UNKNOWN:
+		case NDIS_802_11_INFRASTRUCTURE_MAX:
 			break;
 		}
 	}
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 587a87fbffeb..e70e6e18eb19 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -292,8 +292,8 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 	enum ndis_802_11_network_infrastructure *pold_state = &(cur_network->network.infrastructure_mode);
 
 	if (*pold_state != networktype) {
-		if (*pold_state == Ndis802_11APMode) {
-			/* change to other mode from Ndis802_11APMode */
+		if (*pold_state == NDIS_802_11_AP_MODE) {
+			/* change to other mode from NDIS_802_11_AP_MODE */
 			cur_network->join_res = -1;
 
 			stop_ap_mode(padapter);
@@ -301,16 +301,21 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 
 		spin_lock_bh(&pmlmepriv->lock);
 
-		if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) || (*pold_state == Ndis802_11IBSS))
+		if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) ||
+		    (*pold_state == NDIS_802_11_IBSS))
 			rtw_disassoc_cmd(padapter, 0, true);
 
 		if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) ||
-			(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true))
+		    (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true))
 			rtw_free_assoc_resources(padapter, 1);
 
-		if ((*pold_state == Ndis802_11Infrastructure) || (*pold_state == Ndis802_11IBSS)) {
+		if ((*pold_state == NDIS_802_11_INFRASTRUCTURE) ||
+		    (*pold_state == NDIS_802_11_IBSS)) {
 			if (check_fwstate(pmlmepriv, _FW_LINKED) == true)
-				rtw_indicate_disconnect(padapter); /* will clr Linked_state; before this function, we must have checked whether issue dis-assoc_cmd or not */
+				/* will clr Linked_state; before this function
+				 * we must have checked whether issue dis-assoc_cmd or not
+				 */
+				rtw_indicate_disconnect(padapter);
 		}
 
 		*pold_state = networktype;
@@ -318,23 +323,23 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 		_clr_fwstate_(pmlmepriv, ~WIFI_NULL_STATE);
 
 		switch (networktype) {
-		case Ndis802_11IBSS:
+		case NDIS_802_11_IBSS:
 			set_fwstate(pmlmepriv, WIFI_ADHOC_STATE);
 			break;
 
-		case Ndis802_11Infrastructure:
+		case NDIS_802_11_INFRASTRUCTURE:
 			set_fwstate(pmlmepriv, WIFI_STATION_STATE);
 			break;
 
-		case Ndis802_11APMode:
+		case NDIS_802_11_AP_MODE:
 			set_fwstate(pmlmepriv, WIFI_AP_STATE);
 			start_ap_mode(padapter);
 			/* rtw_indicate_connect(padapter); */
 
 			break;
 
-		case Ndis802_11AutoUnknown:
-		case Ndis802_11InfrastructureMax:
+		case NDIS_802_11_AUTO_UNKNOWN:
+		case NDIS_802_11_INFRASTRUCTURE_MAX:
 			break;
 		}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 22dc36e8e38a..1cd017d2ebcf 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -51,8 +51,12 @@ int	rtw_init_mlme_priv(struct adapter *padapter)
 
 	pmlmepriv->pscanned = NULL;
 	pmlmepriv->fw_state = WIFI_STATION_STATE; /*  Must sync with rtw_wdev_alloc() */
-	pmlmepriv->cur_network.network.infrastructure_mode = Ndis802_11AutoUnknown;
-	pmlmepriv->scan_mode = SCAN_ACTIVE;/*  1: active, 0: passive. Maybe someday we should rename this varable to "active_mode" (Jeff) */
+	pmlmepriv->cur_network.network.infrastructure_mode = NDIS_802_11_AUTO_UNKNOWN;
+	/*
+	 * SCAN_ACTIVE: 1=active, 0=passive. Maybe someday we
+	 * should rename this variable to "active_mode" (Jeff).
+	 */
+	pmlmepriv->scan_mode = SCAN_ACTIVE;
 
 	spin_lock_init(&pmlmepriv->lock);
 	INIT_LIST_HEAD(&pmlmepriv->free_bss_pool.queue);
@@ -267,7 +271,7 @@ signed int rtw_if_up(struct adapter *padapter)
 	signed int res;
 
 	if (padapter->bDriverStopped || padapter->bSurpriseRemoved ||
-		!check_fwstate(&padapter->mlmepriv, _FW_LINKED))
+	    !check_fwstate(&padapter->mlmepriv, _FW_LINKED))
 		res = false;
 	else
 		res =  true;
@@ -336,7 +340,7 @@ int rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork)
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
 
 	if ((psecuritypriv->dot11PrivacyAlgrthm != _NO_PRIVACY_) &&
-		    (pnetwork->network.privacy == 0))
+	    (pnetwork->network.privacy == 0))
 		ret = false;
 	else if ((psecuritypriv->dot11PrivacyAlgrthm == _NO_PRIVACY_) &&
 		 (pnetwork->network.privacy == 1))
@@ -416,7 +420,7 @@ struct	wlan_network	*rtw_get_oldest_wlan_network(struct __queue *scanned_queue)
 }
 
 void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
-	struct adapter *padapter, bool update_ie)
+		    struct adapter *padapter, bool update_ie)
 {
 	long rssi_ori = dst->rssi;
 
@@ -465,14 +469,14 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
 
 	rtw_bug_check(&pmlmepriv->cur_network.network,
-		&pmlmepriv->cur_network.network,
-		&pmlmepriv->cur_network.network,
-		&pmlmepriv->cur_network.network);
+		      &pmlmepriv->cur_network.network,
+		      &pmlmepriv->cur_network.network,
+		      &pmlmepriv->cur_network.network);
 
 	if (check_fwstate(pmlmepriv, _FW_LINKED) && (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
 		update_network(&pmlmepriv->cur_network.network, pnetwork, adapter, true);
 		rtw_update_protection(adapter, (pmlmepriv->cur_network.network.ies) + sizeof(struct ndis_802_11_fix_ie),
-								pmlmepriv->cur_network.network.ie_length);
+				      pmlmepriv->cur_network.network.ie_length);
 	}
 }
 
@@ -618,10 +622,10 @@ int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwor
 		u8 *p = NULL;
 		uint ie_len = 0;
 
-		if ((desired_encmode == Ndis802_11EncryptionDisabled) && (privacy != 0))
+		if ((desired_encmode == NDIS_802_11_ENCRYPTION_DISABLED) && (privacy != 0))
 			bselected = false;
 
-		if (psecuritypriv->ndisauthtype == Ndis802_11AuthModeWPA2PSK) {
+		if (psecuritypriv->ndisauthtype == NDIS_802_11_AUTH_MODE_WPA_2_PSK) {
 			p = rtw_get_ie(pnetwork->network.ies + _BEACON_IE_OFFSET_, WLAN_EID_RSN, &ie_len, (pnetwork->network.ie_length - _BEACON_IE_OFFSET_));
 			if (p && ie_len > 0)
 				bselected = true;
@@ -630,7 +634,7 @@ int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwor
 		}
 	}
 
-	if ((desired_encmode != Ndis802_11EncryptionDisabled) && (privacy == 0))
+	if ((desired_encmode != NDIS_802_11_ENCRYPTION_DISABLED) && (privacy == 0))
 		bselected = false;
 
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
@@ -1065,7 +1069,7 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 
 	/* update fw_state will clr _FW_UNDER_LINKING here indirectly */
 	switch (pnetwork->network.infrastructure_mode) {
-	case Ndis802_11Infrastructure:
+	case NDIS_802_11_INFRASTRUCTURE:
 
 			if (pmlmepriv->fw_state & WIFI_UNDER_WPS)
 				pmlmepriv->fw_state = WIFI_STATION_STATE | WIFI_UNDER_WPS;
@@ -1073,7 +1077,7 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 				pmlmepriv->fw_state = WIFI_STATION_STATE;
 
 			break;
-	case Ndis802_11IBSS:
+	case NDIS_802_11_IBSS:
 			pmlmepriv->fw_state = WIFI_ADHOC_STATE;
 			break;
 	default:
@@ -1082,7 +1086,7 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 	}
 
 	rtw_update_protection(padapter, (cur_network->network.ies) + sizeof(struct ndis_802_11_fix_ie),
-									(cur_network->network.ie_length));
+			      (cur_network->network.ie_length));
 
 	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->network.ie_length, (u8) cur_network->network.configuration.ds_config);
 }
@@ -1123,8 +1127,8 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		adapter->securitypriv.btkip_countermeasure = backupTKIPCountermeasure;
 		adapter->securitypriv.btkip_countermeasure_time = backupTKIPcountermeasure_time;
 
-		adapter->securitypriv.ndisauthtype = Ndis802_11AuthModeOpen;
-		adapter->securitypriv.ndisencryptstatus = Ndis802_11WEPDisabled;
+		adapter->securitypriv.ndisauthtype = NDIS_802_11_AUTH_MODE_OPEN;
+		adapter->securitypriv.ndisencryptstatus = NDIS_802_11_WEP_DISABLED;
 
 	} else {
 		/* reset values in securitypriv */
@@ -1139,8 +1143,8 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		psec_priv->dot118021XGrpPrivacy = _NO_PRIVACY_;
 		psec_priv->dot118021XGrpKeyid = 1;
 
-		psec_priv->ndisauthtype = Ndis802_11AuthModeOpen;
-		psec_priv->ndisencryptstatus = Ndis802_11WEPDisabled;
+		psec_priv->ndisauthtype = NDIS_802_11_AUTH_MODE_OPEN;
+		psec_priv->ndisencryptstatus = NDIS_802_11_WEP_DISABLED;
 		/*  */
 	}
 	/*  add for CONFIG_IEEE80211W, none 11w also can use */
@@ -1469,7 +1473,7 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 	}
 
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
-	      check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
+	    check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
 		rtw_free_stainfo(adapter,  psta);
 
 		if (adapter->stapriv.asoc_sta_count == 1) {/* a sta + bc/mc_stainfo (not Ibss_stainfo) */
@@ -2023,7 +2027,7 @@ static int SecIsInPMKIDList(struct adapter *Adapter, u8 *bssid)
 
 	for (i = 0; i < NUM_PMKID_CACHE; i++)
 		if ((p->PMKIDList[i].bUsed) &&
-				(!memcmp(p->PMKIDList[i].Bssid, bssid, ETH_ALEN)))
+		    (!memcmp(p->PMKIDList[i].Bssid, bssid, ETH_ALEN)))
 			return i;
 	return -1;
 }
@@ -2099,9 +2103,11 @@ signed int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, u
 	/* copy fixed ie only */
 	memcpy(out_ie, in_ie, 12);
 	ielength = 12;
-	if ((ndisauthmode == Ndis802_11AuthModeWPA) || (ndisauthmode == Ndis802_11AuthModeWPAPSK))
+	if ((ndisauthmode == NDIS_802_11_AUTH_MODE_WPA) ||
+	    (ndisauthmode == NDIS_802_11_AUTH_MODE_WPA_PSK))
 		authmode = WLAN_EID_VENDOR_SPECIFIC;
-	if ((ndisauthmode == Ndis802_11AuthModeWPA2) || (ndisauthmode == Ndis802_11AuthModeWPA2PSK))
+	if ((ndisauthmode == NDIS_802_11_AUTH_MODE_WPA_2) ||
+	    (ndisauthmode == NDIS_802_11_AUTH_MODE_WPA_2_PSK))
 		authmode = WLAN_EID_RSN;
 
 	if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS)) {
@@ -2154,14 +2160,14 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 
 	switch (pregistrypriv->wireless_mode) {
 	case WIRELESS_11B:
-		pdev_network->network_type_in_use = (Ndis802_11DS);
+		pdev_network->network_type_in_use = (NDIS_802_11_DS);
 		break;
 	case WIRELESS_11G:
 	case WIRELESS_11BG:
 	case WIRELESS_11_24N:
 	case WIRELESS_11G_24N:
 	case WIRELESS_11BG_24N:
-		pdev_network->network_type_in_use = (Ndis802_11OFDM24);
+		pdev_network->network_type_in_use = (NDIS_802_11_FDM24);
 		break;
 	default:
 		/*  TODO */
@@ -2170,7 +2176,7 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 
 	pdev_network->configuration.ds_config = (pregistrypriv->channel);
 
-	if (cur_network->network.infrastructure_mode == Ndis802_11IBSS)
+	if (cur_network->network.infrastructure_mode == NDIS_802_11_IBSS)
 		pdev_network->configuration.atim_window = (0);
 
 	pdev_network->infrastructure_mode = (cur_network->network.infrastructure_mode);
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 78abc5f5191f..847181486a9c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3969,7 +3969,7 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 		memcpy(bssid->supported_rates + i, (p + 2), len);
 	}
 
-	bssid->network_type_in_use = Ndis802_11OFDM24;
+	bssid->network_type_in_use = NDIS_802_11_FDM24;
 
 	if (bssid->ie_length < 12)
 		return _FAIL;
@@ -4001,10 +4001,10 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 	val16 = rtw_get_capability((struct wlan_bssid_ex *)bssid);
 
 	if (val16 & BIT(0)) {
-		bssid->infrastructure_mode = Ndis802_11Infrastructure;
+		bssid->infrastructure_mode = NDIS_802_11_INFRASTRUCTURE;
 		memcpy(bssid->mac_address, GetAddr2Ptr(pframe), ETH_ALEN);
 	} else {
-		bssid->infrastructure_mode = Ndis802_11IBSS;
+		bssid->infrastructure_mode = NDIS_802_11_IBSS;
 		memcpy(bssid->mac_address, GetAddr3Ptr(pframe), ETH_ALEN);
 	}
 
@@ -5170,15 +5170,15 @@ u8 setopmode_hdl(struct adapter *padapter, u8 *pbuf)
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct setopmode_parm *psetop = (struct setopmode_parm *)pbuf;
 
-	if (psetop->mode == Ndis802_11APMode) {
+	if (psetop->mode == NDIS_802_11_AP_MODE) {
 		pmlmeinfo->state = WIFI_FW_AP_STATE;
 		type = _HW_STATE_AP_;
 		/* start_ap_mode(padapter); */
-	} else if (psetop->mode == Ndis802_11Infrastructure) {
+	} else if (psetop->mode == NDIS_802_11_INFRASTRUCTURE) {
 		pmlmeinfo->state &= ~(BIT(0) | BIT(1));/*  clear state */
 		pmlmeinfo->state |= WIFI_FW_STATION_STATE;/* set to	STATION_STATE */
 		type = _HW_STATE_STATION_;
-	} else if (psetop->mode == Ndis802_11IBSS) {
+	} else if (psetop->mode == NDIS_802_11_IBSS) {
 		type = _HW_STATE_ADHOC_;
 	} else {
 		type = _HW_STATE_NOLINK_;
@@ -5187,7 +5187,7 @@ u8 setopmode_hdl(struct adapter *padapter, u8 *pbuf)
 	rtw_hal_set_hwreg(padapter, HW_VAR_SET_OPMODE, (u8 *)(&type));
 	/* set_msr(padapter, type); */
 
-	if (psetop->mode == Ndis802_11APMode) {
+	if (psetop->mode == NDIS_802_11_AP_MODE) {
 		/*  Do this after port switch to */
 		/*  prevent from downloading rsvd page to wrong port */
 		rtw_btcoex_MediaStatusNotify(padapter, 1); /* connect */
@@ -5210,7 +5210,7 @@ u8 createbss_hdl(struct adapter *padapter, u8 *pbuf)
 	}
 
 	/* below is for ad-hoc master */
-	if (pparm->network.infrastructure_mode == Ndis802_11IBSS) {
+	if (pparm->network.infrastructure_mode == NDIS_802_11_IBSS) {
 		rtw_joinbss_reset(padapter);
 
 		pmlmeext->cur_bwmode = CHANNEL_WIDTH_20;
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 337671b1211f..bbd8bd79e1c7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -2196,7 +2196,7 @@ static int recv_func(struct adapter *padapter, union recv_frame *rframe)
 		if (check_fwstate(mlmepriv, WIFI_STATION_STATE) &&
 			!is_multicast_ether_addr(prxattrib->ra) && prxattrib->encrypt > 0 &&
 			(prxattrib->bdecrypted == 0 || psecuritypriv->sw_decrypt == true) &&
-			psecuritypriv->ndisauthtype == Ndis802_11AuthModeWPAPSK &&
+			psecuritypriv->ndisauthtype == NDIS_802_11_AUTH_MODE_WPA_PSK &&
 			!psecuritypriv->busetkipkey) {
 			rtw_enqueue_recvframe(rframe, &padapter->recvpriv.uc_swdec_pending_queue);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index bdd4b6d8fd2e..2fc966ac5d3f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -491,7 +491,7 @@ struct sta_info *rtw_get_stainfo(struct sta_priv *pstapriv, u8 *hwaddr)
 u32 rtw_init_bcmc_stainfo(struct adapter *padapter)
 {
 	struct sta_info *psta;
-	NDIS_802_11_MAC_ADDRESS	bcast_addr = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
+	u8 bcast_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 
 	struct	sta_priv *pstapriv = &padapter->stapriv;
 	/* struct __queue	*pstapending = &padapter->xmitpriv.bm_pending; */
diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 27c0c0198714..3c3949a92b5d 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -40,22 +40,22 @@ void rtw_hal_dm_init(struct adapter *padapter)
 
 static void rtw_hal_init_opmode(struct adapter *padapter)
 {
-	enum ndis_802_11_network_infrastructure networkType = Ndis802_11InfrastructureMax;
+	enum ndis_802_11_network_infrastructure network_type = NDIS_802_11_INFRASTRUCTURE_MAX;
 	struct  mlme_priv *pmlmepriv = &(padapter->mlmepriv);
 	signed int fw_state;
 
 	fw_state = get_fwstate(pmlmepriv);
 
 	if (fw_state & WIFI_ADHOC_STATE)
-		networkType = Ndis802_11IBSS;
+		network_type = NDIS_802_11_IBSS;
 	else if (fw_state & WIFI_STATION_STATE)
-		networkType = Ndis802_11Infrastructure;
+		network_type = NDIS_802_11_INFRASTRUCTURE;
 	else if (fw_state & WIFI_AP_STATE)
-		networkType = Ndis802_11APMode;
+		network_type = NDIS_802_11_AP_MODE;
 	else
 		return;
 
-	rtw_setopmode_cmd(padapter, networkType, false);
+	rtw_setopmode_cmd(padapter, network_type, false);
 }
 
 uint rtw_hal_init(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index af6cdda8238d..23e4d2d82dbd 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -245,19 +245,19 @@ static void ConstructNullFunctionData(
 		SetPwrMgt(fctrl);
 
 	switch (cur_network->network.infrastructure_mode) {
-	case Ndis802_11Infrastructure:
+	case NDIS_802_11_INFRASTRUCTURE:
 		SetToDs(fctrl);
 		ether_addr_copy(pwlanhdr->addr1, get_my_bssid(&(pmlmeinfo->network)));
 		ether_addr_copy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)));
 		ether_addr_copy(pwlanhdr->addr3, StaAddr);
 		break;
-	case Ndis802_11APMode:
+	case NDIS_802_11_AP_MODE:
 		SetFrDs(fctrl);
 		ether_addr_copy(pwlanhdr->addr1, StaAddr);
 		ether_addr_copy(pwlanhdr->addr2, get_my_bssid(&(pmlmeinfo->network)));
 		ether_addr_copy(pwlanhdr->addr3, myid(&(padapter->eeprompriv)));
 		break;
-	case Ndis802_11IBSS:
+	case NDIS_802_11_IBSS:
 	default:
 		ether_addr_copy(pwlanhdr->addr1, StaAddr);
 		ether_addr_copy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)));
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index afa5631a441a..77b50e72b065 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -253,7 +253,7 @@ struct FW_Sta_Info {
 	u32 status;
 	u32 rx_pkt;
 	u32 retry;
-	NDIS_802_11_RATES_EX  SupportedRates;
+	u8  SupportedRates[NDIS_802_11_LENGTH_RATES_EX];
 };
 
 /*
diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 32f6d3a5e309..ade18f7fa6bf 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -35,12 +35,12 @@ enum {
 };
 
 
-#ifndef Ndis802_11AuthModeWPA2
-#define Ndis802_11AuthModeWPA2 (Ndis802_11AuthModeWPANone + 1)
+#ifndef NDIS_802_11_AUTH_MODE_WPA_2
+#define NDIS_802_11_AUTH_MODE_WPA_2 (NDIS_802_11_AUTH_MODE_WPA_NONE + 1)
 #endif
 
-#ifndef Ndis802_11AuthModeWPA2PSK
-#define Ndis802_11AuthModeWPA2PSK (Ndis802_11AuthModeWPANone + 2)
+#ifndef NDIS_802_11_AUTH_MODE_WPA_2_PSK
+#define NDIS_802_11_AUTH_MODE_WPA_2_PSK (NDIS_802_11_AUTH_MODE_WPA_NONE + 2)
 #endif
 
 union pn48	{
diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index eb38594c8f5c..a8c596d20039 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -7,17 +7,12 @@
 #ifndef __WLAN_BSSDEF_H__
 #define __WLAN_BSSDEF_H__
 
-
 #define MAX_IE_SZ	768
 
-
 #define NDIS_802_11_LENGTH_SSID         32
 #define NDIS_802_11_LENGTH_RATES        8
 #define NDIS_802_11_LENGTH_RATES_EX     16
-
-typedef unsigned char   NDIS_802_11_MAC_ADDRESS[6];
-typedef unsigned char   NDIS_802_11_RATES[NDIS_802_11_LENGTH_RATES];        /*  Set of 8 data rates */
-typedef unsigned char   NDIS_802_11_RATES_EX[NDIS_802_11_LENGTH_RATES_EX];  /*  Set of 16 data rates */
+#define ETH_ALEN					    6
 
 struct ndis_802_11_ssid {
 	u32  ssid_length;
@@ -25,30 +20,30 @@ struct ndis_802_11_ssid {
 };
 
 enum ndis_802_11_network_type {
-	Ndis802_11FH,
-	Ndis802_11DS,
-	Ndis802_11OFDM5,
-	Ndis802_11OFDM24,
-	Ndis802_11NetworkTypeMax    /*  not a real type, defined as an upper bound */
+	NDIS_802_11_FH,
+	NDIS_802_11_DS,
+	NDIS_802_11_FDM5,
+	NDIS_802_11_FDM24,
+	NDIS_802_11_NETWORK_TYPE_MAX    /*  not a real type, defined as an upper bound */
 };
 
 /*
-	FW will only save the channel number in DSConfig.
-	ODI Handler will convert the channel number to freq. number.
-*/
+ *	FW will only save the channel number in DSConfig.
+ *	ODI Handler will convert the channel number to freq. number.
+ */
 struct ndis_802_11_conf {
-	u32 length;             /*  Length of structure */
+	u32 length;              /*  Length of structure */
 	u32 beacon_period;       /*  units are Kusec */
 	u32 atim_window;         /*  units are Kusec */
 	u32 ds_config;           /*  Frequency, units are kHz */
 };
 
 enum ndis_802_11_network_infrastructure {
-	Ndis802_11IBSS,
-	Ndis802_11Infrastructure,
-	Ndis802_11AutoUnknown,
-	Ndis802_11InfrastructureMax,     /*  Not a real value, defined as upper bound */
-	Ndis802_11APMode,
+	NDIS_802_11_IBSS,
+	NDIS_802_11_INFRASTRUCTURE,
+	NDIS_802_11_AUTO_UNKNOWN,
+	NDIS_802_11_INFRASTRUCTURE_MAX,     /*  Not a real value, defined as upper bound */
+	NDIS_802_11_AP_MODE,
 };
 
 struct ndis_802_11_fix_ie {
@@ -63,40 +58,39 @@ struct ndis_80211_var_ie {
 	u8  data[];
 };
 
-/* Length is the 4 bytes multiples of the sum of
- * sizeof (NDIS_802_11_MAC_ADDRESS) + 2 +
- * sizeof (struct ndis_802_11_ssid) + sizeof (u32) +
- * sizeof (long) + sizeof (enum ndis_802_11_network_type) +
- * sizeof (struct ndis_802_11_conf) + sizeof (NDIS_802_11_RATES_EX) + ie_length
+/* Length is the 4-byte multiple of the sum of:
+ * ETH_ALEN + 2 + sizeof(struct ndis_802_11_ssid) + sizeof(u32) +
+ * sizeof(long) + sizeof(enum ndis_802_11_network_type) +
+ * sizeof(struct ndis_802_11_conf) + NDIS_802_11_LENGTH_RATES_EX + ie_length
  *
  * Except for ie_length, all other fields are fixed length. Therefore, we can
- * define a macro to present the partial sum.
+ * define a macro to represent the partial sum.
  */
 enum ndis_802_11_authentication_mode {
-	Ndis802_11AuthModeOpen,
-	Ndis802_11AuthModeShared,
-	Ndis802_11AuthModeAutoSwitch,
-	Ndis802_11AuthModeWPA,
-	Ndis802_11AuthModeWPAPSK,
-	Ndis802_11AuthModeWPANone,
-	Ndis802_11AuthModeWAPI,
-	Ndis802_11AuthModeMax   /*  Not a real mode, defined as upper bound */
+	NDIS_802_11_AUTH_MODE_OPEN,
+	NDIS_802_11_AUTH_MODE_SHARED,
+	NDIS_802_11_AUTH_MODE_AUTO_SWITCH,
+	NDIS_802_11_AUTH_MODE_WPA,
+	NDIS_802_11_AUTH_MODE_WPA_PSK,
+	NDIS_802_11_AUTH_MODE_WPA_NONE,
+	NDIS_802_11_AUTH_MODE_W_A_P_I,
+	NDIS_802_11_AUTH_MODE_MAX   /*  Not a real mode, defined as upper bound */
 };
 
 enum {
-	Ndis802_11WEPEnabled,
-	Ndis802_11Encryption1Enabled = Ndis802_11WEPEnabled,
-	Ndis802_11WEPDisabled,
-	Ndis802_11EncryptionDisabled = Ndis802_11WEPDisabled,
-	Ndis802_11WEPKeyAbsent,
-	Ndis802_11Encryption1KeyAbsent = Ndis802_11WEPKeyAbsent,
-	Ndis802_11WEPNotSupported,
-	Ndis802_11EncryptionNotSupported = Ndis802_11WEPNotSupported,
-	Ndis802_11Encryption2Enabled,
-	Ndis802_11Encryption2KeyAbsent,
-	Ndis802_11Encryption3Enabled,
-	Ndis802_11Encryption3KeyAbsent,
-	Ndis802_11_EncrypteionWAPI
+	NDIS_802_11_WEP_ENABLED,
+	NDIS_802_11_ENCRYPTION_ENABLED = NDIS_802_11_WEP_ENABLED,
+	NDIS_802_11_WEP_DISABLED,
+	NDIS_802_11_ENCRYPTION_DISABLED = NDIS_802_11_WEP_DISABLED,
+	NDIS_802_11_WEP_KEY_ABSENT,
+	NDIS_802_11_ENCRYPTION_1_KEY_ABSENT = NDIS_802_11_WEP_KEY_ABSENT,
+	NDIS_802_11_WEP_NOT_SUPPORTED,
+	NDIS_802_11_ENCRYPTION_NOT_SUPPORTED = NDIS_802_11_WEP_NOT_SUPPORTED,
+	NDIS_802_11_ENCRYPTION_2_ENABLED,
+	NDIS_802_11_ENCRYPTION_2_KEY_ABSENT,
+	NDIS_802_11_ENCRYPTION_3_ENABLED,
+	NDIS_802_11_ENCRYPTION_3_KEY_ABSENT,
+	NDIS_802_11_ENCRYPTION_W_A_P_I
 };
 
 #define NDIS_802_11_AI_REQFI_CAPABILITIES      1
@@ -110,7 +104,7 @@ enum {
 /*  Key mapping keys require a BSSID */
 
 struct ndis_802_11_wep {
-	u32 length;        /*  Length of this structure */
+	u32 length;         /*  Length of this structure */
 	u32 key_index;      /*  0 is the per-client key, 1-N are the global keys */
 	u32 key_length;     /*  length of key in bytes */
 	u8 key_material[16];/*  variable length depending on above field */
@@ -126,21 +120,22 @@ struct ndis_802_11_wep {
 /*  MIC check time, 60 seconds. */
 #define MIC_CHECK_TIME	60000000
 
-#ifndef Ndis802_11APMode
-#define Ndis802_11APMode (Ndis802_11InfrastructureMax + 1)
+#ifndef NDIS_802_11_AP_MODE
+#define NDIS_802_11_AP_MODE (NDIS_802_11_INFRASTRUCTURE_MAX + 1)
 #endif
 
 struct wlan_phy_info {
-	u8 signal_strength;/* in percentage) */
-	u8 signal_quality;/* in percentage) */
+	u8 signal_strength; /* in percentage) */
+	u8 signal_quality; /* in percentage) */
 	u8 optimum_antenna;  /* for Antenna diversity */
 	u8 reserved_0;
 };
 
 struct wlan_bcn_info {
 	/* these infor get from rtw_get_encrypt_info when
-	 * * translate scan to UI */
-	u8 encryp_protocol;/* ENCRYP_PROTOCOL_E: OPEN/WEP/WPA/WPA2/WAPI */
+	 * translate scan to UI
+	 */
+	u8 encryp_protocol; /* ENCRYP_PROTOCOL_E: OPEN/WEP/WPA/WPA2/WAPI */
 	int group_cipher; /* WPA/WPA2 group cipher */
 	int pairwise_cipher;/* WPA/WPA2/WEP pairwise cipher */
 	int is_8021x;
@@ -151,19 +146,19 @@ struct wlan_bcn_info {
 };
 
 /* temporally add #pragma pack for structure alignment issue of
-*   struct wlan_bssid_ex and get_wlan_bssid_ex_sz()
-*/
+ *   struct wlan_bssid_ex and get_wlan_bssid_ex_sz()
+ */
 struct wlan_bssid_ex {
 	u32  length;
-	NDIS_802_11_MAC_ADDRESS  mac_address;
-	u8  reserved[2];/* 0]: IS beacon frame */
+	u8 mac_address[ETH_ALEN];
+	u8  reserved[2]; /* 0]: IS beacon frame */
 	struct ndis_802_11_ssid  ssid;
 	u32  privacy;
-	long  rssi;/* in dBM, raw data , get from PHY) */
+	long  rssi; /* in dBM, raw data , get from PHY) */
 	enum ndis_802_11_network_type  network_type_in_use;
 	struct ndis_802_11_conf  configuration;
 	enum ndis_802_11_network_infrastructure  infrastructure_mode;
-	NDIS_802_11_RATES_EX  supported_rates;
+	u8 supported_rates[NDIS_802_11_LENGTH_RATES_EX];
 	struct wlan_phy_info phy_info;
 	u32  ie_length;
 	u8  ies[MAX_IE_SZ];	/* timestamp, beacon interval, and capability information) */
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index a47d0d3fa2b7..55570b1eb26c 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -380,9 +380,10 @@ void rtw_cfg80211_ibss_indicate_connect(struct adapter *padapter)
 				rtw_warn_on(1);
 				return;
 			}
-			if (!memcmp(&(scanned->network.ssid), &(pnetwork->ssid), sizeof(struct ndis_802_11_ssid))
-				&& !memcmp(scanned->network.mac_address, pnetwork->mac_address, sizeof(NDIS_802_11_MAC_ADDRESS))
-			)
+
+			if (!memcmp(&scanned->network.ssid, &pnetwork->ssid,
+				    sizeof(struct ndis_802_11_ssid)) &&
+			    !memcmp(scanned->network.mac_address, pnetwork->mac_address, ETH_ALEN))
 				rtw_cfg80211_inform_bss(padapter, scanned);
 			else
 				rtw_warn_on(1);
@@ -422,7 +423,7 @@ void rtw_cfg80211_indicate_connect(struct adapter *padapter)
 			goto check_bss;
 		}
 
-		if (!memcmp(scanned->network.mac_address, pnetwork->mac_address, sizeof(NDIS_802_11_MAC_ADDRESS))
+		if (!memcmp(scanned->network.mac_address, pnetwork->mac_address, ETH_ALEN)
 			&& !memcmp(&(scanned->network.ssid), &(pnetwork->ssid), sizeof(struct ndis_802_11_ssid))
 		)
 			rtw_cfg80211_inform_bss(padapter, scanned);
@@ -547,7 +548,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 			/* wep default key has not been set, so use this key index as default key. */
 
 			psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Auto;
-			psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
+			psecuritypriv->ndisencryptstatus = NDIS_802_11_ENCRYPTION_ENABLED;
 			psecuritypriv->dot11PrivacyAlgrthm = _WEP40_;
 			psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
 
@@ -743,7 +744,7 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 
 			wep_key_len = wep_key_len <= 5 ? 5 : 13;
 
-			psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
+			psecuritypriv->ndisencryptstatus = NDIS_802_11_ENCRYPTION_ENABLED;
 			psecuritypriv->dot11PrivacyAlgrthm = _WEP40_;
 			psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
 
@@ -775,15 +776,19 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 				if (strcmp(param->u.crypt.alg, "none") != 0)
 					psta->ieee8021x_blocked = false;
 
-				if ((padapter->securitypriv.ndisencryptstatus == Ndis802_11Encryption2Enabled) ||
-				    (padapter->securitypriv.ndisencryptstatus ==  Ndis802_11Encryption3Enabled)) {
+				if ((padapter->securitypriv.ndisencryptstatus ==
+				     NDIS_802_11_ENCRYPTION_2_ENABLED) ||
+				    (padapter->securitypriv.ndisencryptstatus ==
+				     NDIS_802_11_ENCRYPTION_3_ENABLED)) {
 					psta->dot118021XPrivacy = padapter->securitypriv.dot11PrivacyAlgrthm;
 				}
 
 				if (param->u.crypt.set_tx == 1) { /* pairwise key */
+					struct ieee_crypt_arg *crypt = &param->u.crypt;
+					u32 len = min(crypt->key_len, 16U);
 
-					memcpy(psta->dot118021x_UncstKey.skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
-
+					memcpy(psta->dot118021x_UncstKey.skey,
+					       crypt->key, len);
 					if (strcmp(param->u.crypt.alg, "TKIP") == 0) { /* set mic key */
 						memcpy(psta->dot11tkiptxmickey.skey, &(param->u.crypt.key[16]), 8);
 						memcpy(psta->dot11tkiprxmickey.skey, &(param->u.crypt.key[24]), 8);
@@ -794,19 +799,30 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 
 					rtw_setstakey_cmd(padapter, psta, true, true);
 				} else { /* group key */
-					if (strcmp(param->u.crypt.alg, "TKIP") == 0 || strcmp(param->u.crypt.alg, "CCMP") == 0) {
-						memcpy(padapter->securitypriv.dot118021XGrpKey[param->u.crypt.idx].skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
-						memcpy(padapter->securitypriv.dot118021XGrptxmickey[param->u.crypt.idx].skey, &(param->u.crypt.key[16]), 8);
-						memcpy(padapter->securitypriv.dot118021XGrprxmickey[param->u.crypt.idx].skey, &(param->u.crypt.key[24]), 8);
-						padapter->securitypriv.binstallGrpkey = true;
-
-						padapter->securitypriv.dot118021XGrpKeyid = param->u.crypt.idx;
-						rtw_set_key(padapter, &padapter->securitypriv, param->u.crypt.idx, 1, true);
-					} else if (strcmp(param->u.crypt.alg, "BIP") == 0) {
+					struct security_priv *psec = &padapter->securitypriv;
+					struct ieee_crypt_arg *crypt = &param->u.crypt;
+					u32 len = min(crypt->key_len, 16U);
+
+					if (strcmp(crypt->alg, "TKIP") == 0 ||
+					    strcmp(crypt->alg, "CCMP") == 0) {
+						memcpy(psec->dot118021XGrpKey[crypt->idx].skey,
+						       crypt->key, len);
+
+						memcpy(psec->dot18021XGrptxmickey[crypt->idx].skey,
+						       &crypt->key[16], 8);
+
+						memcpy(psec->dot118021XGrprxmickey[crypt->idx].skey,
+						       &crypt->key[24], 8);
+
+						psec->binstallGrpkey = true;
+						psec->dot118021XGrpKeyid = crypt->idx;
+						rtw_set_key(padapter, psec, crypt->idx, 1, true);
+					} else if (strcmp(crypt->alg, "BIP") == 0) {
 						/* save the IGTK key, length 16 bytes */
-						memcpy(padapter->securitypriv.dot11wBIPKey[param->u.crypt.idx].skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
-						padapter->securitypriv.dot11wBIPKeyid = param->u.crypt.idx;
-						padapter->securitypriv.binstallBIPkey = true;
+						memcpy(psec->dot11wBIPKey[crypt->idx].skey,
+						       crypt->key, len);
+						psec->dot11wBIPKeyid = crypt->idx;
+						psec->binstallBIPkey = true;
 					}
 				}
 			}
@@ -817,8 +833,10 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 				if (strcmp(param->u.crypt.alg, "none") != 0)
 					pbcmc_sta->ieee8021x_blocked = false;
 
-				if ((padapter->securitypriv.ndisencryptstatus == Ndis802_11Encryption2Enabled) ||
-				    (padapter->securitypriv.ndisencryptstatus ==  Ndis802_11Encryption3Enabled)) {
+				if ((padapter->securitypriv.ndisencryptstatus ==
+				     NDIS_802_11_ENCRYPTION_2_ENABLED) ||
+				    (padapter->securitypriv.ndisencryptstatus ==
+				     NDIS_802_11_ENCRYPTION_3_ENABLED)) {
 					pbcmc_sta->dot118021XPrivacy = padapter->securitypriv.dot11PrivacyAlgrthm;
 				}
 			}
@@ -942,7 +960,7 @@ static int cfg80211_rtw_set_default_key(struct wiphy *wiphy,
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 
 	if ((key_index < WEP_KEYS) && ((psecuritypriv->dot11PrivacyAlgrthm == _WEP40_) || (psecuritypriv->dot11PrivacyAlgrthm == _WEP104_))) { /* set wep default key */
-		psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
+		psecuritypriv->ndisencryptstatus = NDIS_802_11_ENCRYPTION_ENABLED;
 
 		psecuritypriv->dot11PrivacyKeyIndex = key_index;
 
@@ -1025,7 +1043,7 @@ static int cfg80211_rtw_change_iface(struct wiphy *wiphy,
 				     struct vif_params *params)
 {
 	enum nl80211_iftype old_type;
-	enum ndis_802_11_network_infrastructure networkType;
+	enum ndis_802_11_network_infrastructure network_type;
 	struct adapter *padapter = rtw_netdev_priv(ndev);
 	struct wireless_dev *rtw_wdev = padapter->rtw_wdev;
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
@@ -1057,13 +1075,13 @@ static int cfg80211_rtw_change_iface(struct wiphy *wiphy,
 
 	switch (type) {
 	case NL80211_IFTYPE_ADHOC:
-		networkType = Ndis802_11IBSS;
+		network_type = NDIS_802_11_IBSS;
 		break;
 	case NL80211_IFTYPE_STATION:
-		networkType = Ndis802_11Infrastructure;
+		network_type = NDIS_802_11_INFRASTRUCTURE;
 		break;
 	case NL80211_IFTYPE_AP:
-		networkType = Ndis802_11APMode;
+		network_type = NDIS_802_11_AP_MODE;
 		break;
 	default:
 		ret = -EOPNOTSUPP;
@@ -1072,13 +1090,13 @@ static int cfg80211_rtw_change_iface(struct wiphy *wiphy,
 
 	rtw_wdev->iftype = type;
 
-	if (rtw_set_802_11_infrastructure_mode(padapter, networkType) == false) {
+	if (rtw_set_802_11_infrastructure_mode(padapter, network_type) == false) {
 		rtw_wdev->iftype = old_type;
 		ret = -EPERM;
 		goto exit;
 	}
 
-	rtw_setopmode_cmd(padapter, networkType, true);
+	rtw_setopmode_cmd(padapter, network_type, true);
 
 exit:
 
@@ -1307,12 +1325,12 @@ static int cfg80211_rtw_set_wiphy_params(struct wiphy *wiphy, int radio_idx,
 static int rtw_cfg80211_set_wpa_version(struct security_priv *psecuritypriv, u32 wpa_version)
 {
 	if (!wpa_version) {
-		psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
+		psecuritypriv->ndisauthtype = NDIS_802_11_AUTH_MODE_OPEN;
 		return 0;
 	}
 
 	if (wpa_version & (NL80211_WPA_VERSION_1 | NL80211_WPA_VERSION_2))
-		psecuritypriv->ndisauthtype = Ndis802_11AuthModeWPAPSK;
+		psecuritypriv->ndisauthtype = NDIS_802_11_AUTH_MODE_WPA_PSK;
 
 	return 0;
 }
@@ -1330,7 +1348,7 @@ static int rtw_cfg80211_set_auth_type(struct security_priv *psecuritypriv,
 
 		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open;
 
-		if (psecuritypriv->ndisauthtype > Ndis802_11AuthModeWPA)
+		if (psecuritypriv->ndisauthtype > NDIS_802_11_AUTH_MODE_WPA)
 			psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
 
 		break;
@@ -1338,7 +1356,7 @@ static int rtw_cfg80211_set_auth_type(struct security_priv *psecuritypriv,
 
 		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Shared;
 
-		psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
+		psecuritypriv->ndisencryptstatus = NDIS_802_11_ENCRYPTION_ENABLED;
 
 		break;
 	default:
@@ -1351,7 +1369,7 @@ static int rtw_cfg80211_set_auth_type(struct security_priv *psecuritypriv,
 
 static int rtw_cfg80211_set_cipher(struct security_priv *psecuritypriv, u32 cipher, bool ucast)
 {
-	u32 ndisencryptstatus = Ndis802_11EncryptionDisabled;
+	u32 ndisencryptstatus = NDIS_802_11_ENCRYPTION_DISABLED;
 
 	u32 *profile_cipher = ucast ? &psecuritypriv->dot11PrivacyAlgrthm :
 		&psecuritypriv->dot118021XGrpPrivacy;
@@ -1365,23 +1383,23 @@ static int rtw_cfg80211_set_cipher(struct security_priv *psecuritypriv, u32 ciph
 	switch (cipher) {
 	case IW_AUTH_CIPHER_NONE:
 		*profile_cipher = _NO_PRIVACY_;
-		ndisencryptstatus = Ndis802_11EncryptionDisabled;
+		ndisencryptstatus = NDIS_802_11_ENCRYPTION_DISABLED;
 		break;
 	case WLAN_CIPHER_SUITE_WEP40:
 		*profile_cipher = _WEP40_;
-		ndisencryptstatus = Ndis802_11Encryption1Enabled;
+		ndisencryptstatus = NDIS_802_11_ENCRYPTION_ENABLED;
 		break;
 	case WLAN_CIPHER_SUITE_WEP104:
 		*profile_cipher = _WEP104_;
-		ndisencryptstatus = Ndis802_11Encryption1Enabled;
+		ndisencryptstatus = NDIS_802_11_ENCRYPTION_ENABLED;
 		break;
 	case WLAN_CIPHER_SUITE_TKIP:
 		*profile_cipher = _TKIP_;
-		ndisencryptstatus = Ndis802_11Encryption2Enabled;
+		ndisencryptstatus = NDIS_802_11_ENCRYPTION_2_ENABLED;
 		break;
 	case WLAN_CIPHER_SUITE_CCMP:
 		*profile_cipher = _AES_;
-		ndisencryptstatus = Ndis802_11Encryption3Enabled;
+		ndisencryptstatus = NDIS_802_11_ENCRYPTION_3_ENABLED;
 		break;
 	default:
 		return -ENOTSUPP;
@@ -1391,7 +1409,7 @@ static int rtw_cfg80211_set_cipher(struct security_priv *psecuritypriv, u32 ciph
 		psecuritypriv->ndisencryptstatus = ndisencryptstatus;
 
 		/* if (psecuritypriv->dot11PrivacyAlgrthm >= _AES_) */
-		/*	psecuritypriv->ndisauthtype = Ndis802_11AuthModeWPA2PSK; */
+		/*	psecuritypriv->ndisauthtype = NDIS_802_11_AUTH_MODE_WPA_2_PSK; */
 	}
 
 	return 0;
@@ -1447,7 +1465,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	if (pwpa && wpa_ielen > 0) {
 		if (rtw_parse_wpa_ie(pwpa, wpa_ielen + 2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
 			padapter->securitypriv.dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
-			padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeWPAPSK;
+			padapter->securitypriv.ndisauthtype = NDIS_802_11_AUTH_MODE_WPA_PSK;
 			memcpy(padapter->securitypriv.supplicant_ie, &pwpa[0], wpa_ielen + 2);
 		}
 	}
@@ -1456,7 +1474,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	if (pwpa2 && wpa2_ielen > 0) {
 		if (rtw_parse_wpa2_ie(pwpa2, wpa2_ielen + 2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
 			padapter->securitypriv.dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
-			padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeWPA2PSK;
+			padapter->securitypriv.ndisauthtype = NDIS_802_11_AUTH_MODE_WPA_2_PSK;
 			memcpy(padapter->securitypriv.supplicant_ie, &pwpa2[0], wpa2_ielen + 2);
 		}
 	}
@@ -1470,46 +1488,46 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	switch (group_cipher) {
 	case WPA_CIPHER_NONE:
 		padapter->securitypriv.dot118021XGrpPrivacy = _NO_PRIVACY_;
-		padapter->securitypriv.ndisencryptstatus = Ndis802_11EncryptionDisabled;
+		padapter->securitypriv.ndisencryptstatus = NDIS_802_11_ENCRYPTION_DISABLED;
 		break;
 	case WPA_CIPHER_WEP40:
 		padapter->securitypriv.dot118021XGrpPrivacy = _WEP40_;
-		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption1Enabled;
+		padapter->securitypriv.ndisencryptstatus = NDIS_802_11_ENCRYPTION_ENABLED;
 		break;
 	case WPA_CIPHER_TKIP:
 		padapter->securitypriv.dot118021XGrpPrivacy = _TKIP_;
-		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption2Enabled;
+		padapter->securitypriv.ndisencryptstatus = NDIS_802_11_ENCRYPTION_2_ENABLED;
 		break;
 	case WPA_CIPHER_CCMP:
 		padapter->securitypriv.dot118021XGrpPrivacy = _AES_;
-		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption3Enabled;
+		padapter->securitypriv.ndisencryptstatus = NDIS_802_11_ENCRYPTION_3_ENABLED;
 		break;
 	case WPA_CIPHER_WEP104:
 		padapter->securitypriv.dot118021XGrpPrivacy = _WEP104_;
-		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption1Enabled;
+		padapter->securitypriv.ndisencryptstatus = NDIS_802_11_ENCRYPTION_ENABLED;
 		break;
 	}
 
 	switch (pairwise_cipher) {
 	case WPA_CIPHER_NONE:
 		padapter->securitypriv.dot11PrivacyAlgrthm = _NO_PRIVACY_;
-		padapter->securitypriv.ndisencryptstatus = Ndis802_11EncryptionDisabled;
+		padapter->securitypriv.ndisencryptstatus = NDIS_802_11_ENCRYPTION_DISABLED;
 		break;
 	case WPA_CIPHER_WEP40:
 		padapter->securitypriv.dot11PrivacyAlgrthm = _WEP40_;
-		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption1Enabled;
+		padapter->securitypriv.ndisencryptstatus = NDIS_802_11_ENCRYPTION_ENABLED;
 		break;
 	case WPA_CIPHER_TKIP:
 		padapter->securitypriv.dot11PrivacyAlgrthm = _TKIP_;
-		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption2Enabled;
+		padapter->securitypriv.ndisencryptstatus = NDIS_802_11_ENCRYPTION_2_ENABLED;
 		break;
 	case WPA_CIPHER_CCMP:
 		padapter->securitypriv.dot11PrivacyAlgrthm = _AES_;
-		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption3Enabled;
+		padapter->securitypriv.ndisencryptstatus = NDIS_802_11_ENCRYPTION_3_ENABLED;
 		break;
 	case WPA_CIPHER_WEP104:
 		padapter->securitypriv.dot11PrivacyAlgrthm = _WEP104_;
-		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption1Enabled;
+		padapter->securitypriv.ndisencryptstatus = NDIS_802_11_ENCRYPTION_ENABLED;
 		break;
 	}
 
@@ -1575,11 +1593,11 @@ static int cfg80211_rtw_join_ibss(struct wiphy *wiphy, struct net_device *ndev,
 	ndis_ssid.ssid_length = params->ssid_len;
 	memcpy(ndis_ssid.ssid, (u8 *)params->ssid, params->ssid_len);
 
-	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
+	psecuritypriv->ndisencryptstatus = NDIS_802_11_ENCRYPTION_DISABLED;
 	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
 	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
 	psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open; /* open system */
-	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
+	psecuritypriv->ndisauthtype = NDIS_802_11_AUTH_MODE_OPEN;
 
 	ret = rtw_cfg80211_set_auth_type(psecuritypriv, NL80211_AUTHTYPE_OPEN_SYSTEM);
 	rtw_set_802_11_authentication_mode(padapter, psecuritypriv->ndisauthtype);
@@ -1610,12 +1628,12 @@ static int cfg80211_rtw_leave_ibss(struct wiphy *wiphy, struct net_device *ndev)
 
 		rtw_wdev->iftype = NL80211_IFTYPE_STATION;
 
-		if (rtw_set_802_11_infrastructure_mode(padapter, Ndis802_11Infrastructure) == false) {
+		if (!rtw_set_802_11_infrastructure_mode(padapter, NDIS_802_11_INFRASTRUCTURE)) {
 			rtw_wdev->iftype = old_type;
 			ret = -EPERM;
 			goto leave_ibss;
 		}
-		rtw_setopmode_cmd(padapter, Ndis802_11Infrastructure, true);
+		rtw_setopmode_cmd(padapter, NDIS_802_11_INFRASTRUCTURE, true);
 	}
 
 leave_ibss:
@@ -1671,11 +1689,11 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) == true)
 		rtw_scan_abort(padapter);
 
-	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
+	psecuritypriv->ndisencryptstatus = NDIS_802_11_ENCRYPTION_DISABLED;
 	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
 	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
 	psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open; /* open system */
-	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
+	psecuritypriv->ndisauthtype = NDIS_802_11_AUTH_MODE_OPEN;
 
 	ret = rtw_cfg80211_set_wpa_version(psecuritypriv, sme->crypto.wpa_versions);
 	if (ret < 0)
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 21a0c3cf4c31..7a2f1c82cac3 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -19,7 +19,7 @@ static int rtw_rfintfs = HWPI;
 static int rtw_lbkmode;/* RTL8712_AIR_TRX; */
 
 
-static int rtw_network_mode = Ndis802_11IBSS;/* Ndis802_11Infrastructure;infra, ad-hoc, auto */
+static int rtw_network_mode = NDIS_802_11_IBSS;/* Ndis802_11Infrastructure;infra, ad-hoc, auto */
 /* struct ndis_802_11_ssid	ssid; */
 static int rtw_channel = 1;/* ad-hoc support requirement */
 static int rtw_wireless_mode = WIRELESS_11BG_24N;
@@ -542,8 +542,8 @@ static void rtw_init_default_value(struct adapter *padapter)
 	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
 	psecuritypriv->dot118021XGrpKeyid = 1;
 
-	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
-	psecuritypriv->ndisencryptstatus = Ndis802_11WEPDisabled;
+	psecuritypriv->ndisauthtype = NDIS_802_11_AUTH_MODE_OPEN;
+	psecuritypriv->ndisencryptstatus = NDIS_802_11_WEP_DISABLED;
 
 	/* registry_priv */
 	rtw_init_registrypriv_dev_network(padapter);
-- 
2.43.0

