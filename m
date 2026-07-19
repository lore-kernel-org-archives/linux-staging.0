Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D0439150D
	for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 11:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784462208; cv=none; b=Ac2YX5QHEWADm3VdC5+X6fTvMv5jIYBJX94/F41tZPmCs6V/SA8vp0hQ+1a4ct5mH6wLrVRk+F+KCci4RpelI6YESI8D0bMOnzPwLxTxASTLPdo+/DxGVjyckduwMS5eqLhKM664ubCGLgxgqgaZDoZu7GujXavpg3bFSPSNNmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784462208; c=relaxed/simple;
	bh=aT8WjfevnvQnjKEbBzJVfhDy2wMuzZXUG18aOn86CRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uu9eFCOdSwkHY/Jt3rxH9KC8X6NDAGP2UMfTBmi9Qfi9UtLZmBAC9wJCvqElGlaKtKJmfNppIBcXceanMnDCoSahoduant1t/CXH/1fsMQJ19m00a7tJ+uoaSeQGq65ZHilooBkbjnRiRdGFKhl0PJyZuq63A7u5Ud/vinW3Ms4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAZ0kuro; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAZ0kuro"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954aff6088so12695195e9.3
        for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 04:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784462205; x=1785067005; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IV1qrWNsywXanbaou7CIYryBIVcu0WcT7k41OagbRXk=;
        b=HAZ0kuroF++mmjK1+6nDUEiYFh6wB0q4y0hY77zVP57BvBQnsCiQ2QJpEVk/ugr12W
         ksBwMeGU6ue0LpjMdmyaqPTTFUt6i27/+NrpPn48C1g02eaRhuAAzAGjewdSVBV4JGHU
         myCPC8G36T/9LwzmDYjQRvTWSFmYd/96mBkmvnLDHQDyO88jPx5s36g0ZBc6Y6gNBlMG
         UvKMDPs32QzsneBgtAv7M+sjutCon7ijcAy8HlezmdoiKOhp1O07ffWYa2vznQ4LhKTe
         OOME+OXCgFcKkC0/ImE9HOgP6687yoQy8AzgxdFr9Z7BsyGF7HjmZIGxGKeS1tOc+gXL
         pKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784462205; x=1785067005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IV1qrWNsywXanbaou7CIYryBIVcu0WcT7k41OagbRXk=;
        b=at9DUqyEKabEod8kPuPBL4dpzEiXttd6BHa5YAOizgONLei4LW5iNnTQ3Zyu0gnUrx
         DUfBz4vQD5rhryebOTYOzQqSUG5LANOOt1oO3luPiA+LV3wjL6jJ0msoc+9mAxZ0fIaD
         axxjfX5Jj9FVl2iLP9chNoqJyvfwrr80sfFT0QfI/BR/VlrrmvMupnIhEvSL9IATilFs
         CM0nyUtwmkGw9rd93sn3zBug0l3Jawb4bySwKLlGeFuvxoLHHvy/WzY6LQUWDJgehkr1
         2TLvC7G6qx8idK9c1yHzWWQUW0evy04NPv/gCi1C9QjgC3NNdkvWmnru6BDcs6Zx1bO/
         0j5Q==
X-Gm-Message-State: AOJu0YzOfkLRiefPz6EBmI6HnTZ7CSWGvV7yTNmFfgRbqI6mufHfxDZ+
	BTfGYpVhqyckoHdxBFdz0xVIuKbqdlND2lKquat3FyfT300VgcrLNpGO
X-Gm-Gg: AfdE7clZMWnBZb+XbKvi3GFA3gz7rVl/fc6StkdH0pIhTMTd23p5K27FxR9HJlM7mZZ
	01V07ITB54HUf0xLJboMqkl2v/IZcmcEQf+2xNzGM+KA6mljXanw02Gv3zxVz+8+V52bOEh8j62
	mpJjyzS1sJMOeicpP7DyQWmmQ+OmzNlVgN1N2dn5GmXt6pGw+E6nJUQX8GB3kg3iqvwhX1qDqHw
	7YMvUsET+3Rhg4MLEp5Lq3+QoHQOaNTMOepoL3/gE++JbIVhazbMwhsEI98exFaIMHAVHVFmf+O
	29UVKpqXBhaSpJe963dUIy8GqrOJmu1rjAPjuaxvx5cWC8D9MLxireXsLJ6cbFDNuwJGqhKnca+
	nMNHQOZ6vqhOjVTVCZFY3wp8XUczxdZ0bzeWc3PQIEsDymJ/SogGmIwzS1PHarn/xdkTvzcaGbF
	tB9MGFGtllF9NHsBmFeAP8MxMhcorhEgAe4mOwE21cgS/n0LTV5ZcJfxlhzJFzXp7MWzI=
X-Received: by 2002:a05:600c:6d82:b0:495:4072:4194 with SMTP id 5b1f17b1804b1-4954a40c4acmr72912765e9.28.1784462205277;
        Sun, 19 Jul 2026 04:56:45 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a35830sm199719265e9.3.2026.07.19.04.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 04:56:44 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: Renaming variables with type prefix
Date: Sun, 19 Jul 2026 11:54:51 +0000
Message-ID: <20260719115451.4401-4-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260719115451.4401-1-fliegbert2@gmail.com>
References: <20260719115451.4401-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renaming deprecated variable names which use prefixes as type
indicators to conform to the styleguide and for improved readability.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 152 +++++++++++-----------
 1 file changed, 76 insertions(+), 76 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 114deeecc80f..7e3be8cbc829 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -675,52 +675,52 @@ void rtw_survey_event_callback(struct adapter *adapter, u8 *pbuf)
 	spin_unlock_bh(&pmlmepriv->lock);
 }
 
-void rtw_surveydone_event_callback(struct adapter *adapter, u8 *pbuf)
+void rtw_surveydone_event_callback(struct adapter *adapter, u8 *buf)
 {
-	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
+	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 
-	spin_lock_bh(&pmlmepriv->lock);
-	if (pmlmepriv->wps_probe_req_ie) {
-		pmlmepriv->wps_probe_req_ie_len = 0;
-		kfree(pmlmepriv->wps_probe_req_ie);
-		pmlmepriv->wps_probe_req_ie = NULL;
+	spin_lock_bh(&mlme_priv->lock);
+	if (mlme_priv->wps_probe_req_ie) {
+		mlme_priv->wps_probe_req_ie_len = 0;
+		kfree(mlme_priv->wps_probe_req_ie);
+		mlme_priv->wps_probe_req_ie = NULL;
 	}
 
-	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY)) {
-		spin_unlock_bh(&pmlmepriv->lock);
-		timer_delete_sync(&pmlmepriv->scan_to_timer);
-		spin_lock_bh(&pmlmepriv->lock);
-		_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY);
+	if (check_fwstate(mlme_priv, _FW_UNDER_SURVEY)) {
+		spin_unlock_bh(&mlme_priv->lock);
+		timer_delete_sync(&mlme_priv->scan_to_timer);
+		spin_lock_bh(&mlme_priv->lock);
+		_clr_fwstate_(mlme_priv, _FW_UNDER_SURVEY);
 	}
 
 	rtw_set_signal_stat_timer(&adapter->recvpriv);
 
-	if (pmlmepriv->to_join) {
-		if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
-			if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
-				set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
+	if (mlme_priv->to_join) {
+		if (check_fwstate(mlme_priv, WIFI_ADHOC_STATE)) {
+			if (!check_fwstate(mlme_priv, _FW_LINKED)) {
+				set_fwstate(mlme_priv, _FW_UNDER_LINKING);
 
-				if (rtw_select_and_join_from_scanned_queue(pmlmepriv) == _SUCCESS) {
-					_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
+				if (rtw_select_and_join_from_scanned_queue(mlme_priv) == _SUCCESS) {
+					_set_timer(&mlme_priv->assoc_timer, MAX_JOIN_TIMEOUT);
 				} else {
 					u8 ret = _SUCCESS;
-					struct wlan_bssid_ex *pdev_network =
+					struct wlan_bssid_ex *dev_network =
 						&adapter->registrypriv.dev_network;
 
-					u8 *pibss = adapter->registrypriv.dev_network.mac_address;
+					u8 *ibss = adapter->registrypriv.dev_network.mac_address;
 
-					/* pmlmepriv->fw_state ^= _FW_UNDER_SURVEY;because don't set assoc_timer */
-					_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY);
+					/* mlme_priv->fw_state ^= _FW_UNDER_SURVEY;because don't set assoc_timer */
+					_clr_fwstate_(mlme_priv, _FW_UNDER_SURVEY);
 
-					memcpy(&pdev_network->ssid, &pmlmepriv->assoc_ssid,
+					memcpy(&dev_network->ssid, &mlme_priv->assoc_ssid,
 					       sizeof(struct ndis_802_11_ssid));
 
 					rtw_update_registrypriv_dev_network(adapter);
-					rtw_generate_random_ibss(pibss);
+					rtw_generate_random_ibss(ibss);
 
-					pmlmepriv->fw_state = WIFI_ADHOC_MASTER_STATE;
+					mlme_priv->fw_state = WIFI_ADHOC_MASTER_STATE;
 
-					pmlmepriv->to_join = false;
+					mlme_priv->to_join = false;
 
 					ret = rtw_createbss_cmd(adapter);
 					if (ret != _SUCCESS)
@@ -730,37 +730,37 @@ void rtw_surveydone_event_callback(struct adapter *adapter, u8 *pbuf)
 		} else {
 			int s_ret;
 
-			set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
-			pmlmepriv->to_join = false;
-			s_ret = rtw_select_and_join_from_scanned_queue(pmlmepriv);
+			set_fwstate(mlme_priv, _FW_UNDER_LINKING);
+			mlme_priv->to_join = false;
+			s_ret = rtw_select_and_join_from_scanned_queue(mlme_priv);
 			if (s_ret == _SUCCESS) {
-				_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
+				_set_timer(&mlme_priv->assoc_timer, MAX_JOIN_TIMEOUT);
 			} else if (s_ret == 2) {/* there is no need to wait for join */
-				_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
+				_clr_fwstate_(mlme_priv, _FW_UNDER_LINKING);
 				rtw_indicate_connect(adapter);
 			} else {
 				if (rtw_to_roam(adapter) != 0) {
 					if (rtw_dec_to_roam(adapter) == 0 ||
-					    rtw_sitesurvey_cmd(adapter, &pmlmepriv->assoc_ssid,
+					    rtw_sitesurvey_cmd(adapter, &mlme_priv->assoc_ssid,
 							       1, NULL, 0) != _SUCCESS) {
 						rtw_set_to_roam(adapter, 0);
 						rtw_free_assoc_resources(adapter, 1);
 						rtw_indicate_disconnect(adapter);
 					} else {
-						pmlmepriv->to_join = true;
+						mlme_priv->to_join = true;
 					}
 				} else {
 					rtw_indicate_disconnect(adapter);
 				}
-				_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
+				_clr_fwstate_(mlme_priv, _FW_UNDER_LINKING);
 			}
 		}
 	} else {
 		if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
-			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) &&
-			    check_fwstate(pmlmepriv, _FW_LINKED)) {
-				if (rtw_select_roaming_candidate(pmlmepriv) == _SUCCESS) {
-					receive_disconnect(adapter, pmlmepriv->cur_network.network.mac_address
+			if (check_fwstate(mlme_priv, WIFI_STATION_STATE) &&
+			    check_fwstate(mlme_priv, _FW_LINKED)) {
+				if (rtw_select_roaming_candidate(mlme_priv) == _SUCCESS) {
+					receive_disconnect(adapter, mlme_priv->cur_network.network.mac_address
 						, WLAN_REASON_ACTIVE_ROAM);
 				}
 			}
@@ -768,7 +768,7 @@ void rtw_surveydone_event_callback(struct adapter *adapter, u8 *pbuf)
 	}
 
 unlock:
-	spin_unlock_bh(&pmlmepriv->lock);
+	spin_unlock_bh(&mlme_priv->lock);
 
 	rtw_os_xmit_schedule(adapter);
 
@@ -2177,57 +2177,57 @@ void rtw_joinbss_reset(struct adapter *padapter)
 	}
 }
 
-void rtw_ht_use_default_setting(struct adapter *padapter)
+void rtw_ht_use_default_setting(struct adapter *adapter)
 {
-	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct ht_priv *phtpriv = &pmlmepriv->htpriv;
-	struct registry_priv *pregistrypriv = &padapter->registrypriv;
-	bool bHwLDPCSupport = false, bHwSTBCSupport = false;
-	bool bHwSupportBeamformer = false, bHwSupportBeamformee = false;
+	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
+	struct ht_priv *ht_priv = &mlme_priv->htpriv;
+	struct registry_priv *registry_priv = &adapter->registrypriv;
+	bool hw_ldpc_support = false, hw_stbc_support = false;
+	bool hw_support_beamformer = false, hw_support_beamformee = false;
 
-	if (pregistrypriv->wifi_spec)
-		phtpriv->bss_coexist = 1;
+	if (registry_priv->wifi_spec)
+		ht_priv->bss_coexist = 1;
 	else
-		phtpriv->bss_coexist = 0;
+		ht_priv->bss_coexist = 0;
 
-	phtpriv->sgi_40m = TEST_FLAG(pregistrypriv->short_gi, BIT(1)) ? true : false;
-	phtpriv->sgi_20m = TEST_FLAG(pregistrypriv->short_gi, BIT(0)) ? true : false;
+	ht_priv->sgi_40m = TEST_FLAG(registry_priv->short_gi, BIT(1)) ? true : false;
+	ht_priv->sgi_20m = TEST_FLAG(registry_priv->short_gi, BIT(0)) ? true : false;
 
 	/*  LDPC support */
-	rtw_hal_get_def_var(padapter, HAL_DEF_RX_LDPC, (u8 *)&bHwLDPCSupport);
-	CLEAR_FLAGS(phtpriv->ldpc_cap);
-	if (bHwLDPCSupport) {
-		if (TEST_FLAG(pregistrypriv->ldpc_cap, BIT(4)))
-			SET_FLAG(phtpriv->ldpc_cap, LDPC_HT_ENABLE_RX);
+	rtw_hal_get_def_var(adapter, HAL_DEF_RX_LDPC, (u8 *)&hw_ldpc_support);
+	CLEAR_FLAGS(ht_priv->ldpc_cap);
+	if (hw_ldpc_support) {
+		if (TEST_FLAG(registry_priv->ldpc_cap, BIT(4)))
+			SET_FLAG(ht_priv->ldpc_cap, LDPC_HT_ENABLE_RX);
 	}
-	rtw_hal_get_def_var(padapter, HAL_DEF_TX_LDPC, (u8 *)&bHwLDPCSupport);
-	if (bHwLDPCSupport) {
-		if (TEST_FLAG(pregistrypriv->ldpc_cap, BIT(5)))
-			SET_FLAG(phtpriv->ldpc_cap, LDPC_HT_ENABLE_TX);
+	rtw_hal_get_def_var(adapter, HAL_DEF_TX_LDPC, (u8 *)&hw_ldpc_support);
+	if (hw_ldpc_support) {
+		if (TEST_FLAG(registry_priv->ldpc_cap, BIT(5)))
+			SET_FLAG(ht_priv->ldpc_cap, LDPC_HT_ENABLE_TX);
 	}
 
 	/*  STBC */
-	rtw_hal_get_def_var(padapter, HAL_DEF_TX_STBC, (u8 *)&bHwSTBCSupport);
-	CLEAR_FLAGS(phtpriv->stbc_cap);
-	if (bHwSTBCSupport) {
-		if (TEST_FLAG(pregistrypriv->stbc_cap, BIT(5)))
-			SET_FLAG(phtpriv->stbc_cap, STBC_HT_ENABLE_TX);
+	rtw_hal_get_def_var(adapter, HAL_DEF_TX_STBC, (u8 *)&hw_stbc_support);
+	CLEAR_FLAGS(ht_priv->stbc_cap);
+	if (hw_stbc_support) {
+		if (TEST_FLAG(registry_priv->stbc_cap, BIT(5)))
+			SET_FLAG(ht_priv->stbc_cap, STBC_HT_ENABLE_TX);
 	}
-	rtw_hal_get_def_var(padapter, HAL_DEF_RX_STBC, (u8 *)&bHwSTBCSupport);
-	if (bHwSTBCSupport) {
-		if (TEST_FLAG(pregistrypriv->stbc_cap, BIT(4)))
-			SET_FLAG(phtpriv->stbc_cap, STBC_HT_ENABLE_RX);
+	rtw_hal_get_def_var(adapter, HAL_DEF_RX_STBC, (u8 *)&hw_stbc_support);
+	if (hw_stbc_support) {
+		if (TEST_FLAG(registry_priv->stbc_cap, BIT(4)))
+			SET_FLAG(ht_priv->stbc_cap, STBC_HT_ENABLE_RX);
 	}
 
 	/*  Beamforming setting */
-	rtw_hal_get_def_var(padapter, HAL_DEF_EXPLICIT_BEAMFORMER, (u8 *)&bHwSupportBeamformer);
-	rtw_hal_get_def_var(padapter, HAL_DEF_EXPLICIT_BEAMFORMEE, (u8 *)&bHwSupportBeamformee);
-	CLEAR_FLAGS(phtpriv->beamform_cap);
-	if (TEST_FLAG(pregistrypriv->beamform_cap, BIT(4)) && bHwSupportBeamformer)
-		SET_FLAG(phtpriv->beamform_cap, BEAMFORMING_HT_BEAMFORMER_ENABLE);
-
-	if (TEST_FLAG(pregistrypriv->beamform_cap, BIT(5)) && bHwSupportBeamformee)
-		SET_FLAG(phtpriv->beamform_cap, BEAMFORMING_HT_BEAMFORMEE_ENABLE);
+	rtw_hal_get_def_var(adapter, HAL_DEF_EXPLICIT_BEAMFORMER, (u8 *)&hw_support_beamformer);
+	rtw_hal_get_def_var(adapter, HAL_DEF_EXPLICIT_BEAMFORMEE, (u8 *)&hw_support_beamformee);
+	CLEAR_FLAGS(ht_priv->beamform_cap);
+	if (TEST_FLAG(registry_priv->beamform_cap, BIT(4)) && hw_support_beamformer)
+		SET_FLAG(ht_priv->beamform_cap, BEAMFORMING_HT_BEAMFORMER_ENABLE);
+
+	if (TEST_FLAG(registry_priv->beamform_cap, BIT(5)) && hw_support_beamformee)
+		SET_FLAG(ht_priv->beamform_cap, BEAMFORMING_HT_BEAMFORMEE_ENABLE);
 }
 
 void rtw_build_wmm_ie_ht(struct adapter *padapter, u8 *out_ie, uint *pout_len)
-- 
2.54.0

