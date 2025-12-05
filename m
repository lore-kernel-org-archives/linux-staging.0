Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25338279DC2
	for <linux-staging@lists.linux.dev>; Fri,  5 Dec 2025 02:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764900866; cv=none; b=fF6q0nN2tCeO1njXJEUfcyXkJ5+IOj2JuVFdG2k6Dg79KkzMlZynTMm4Tk+VXgmoAdxxCeqr1m55N8cZayO52pcMLQqynE0Bfcsaa2fclrsAFXPh9UU3NhzeE1JZ6HxmFiw+E+TGr8DsR6ub54wE3M30XmStnZFpPKWDFvwWZJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764900866; c=relaxed/simple;
	bh=38FW7T3f6KXbr3W56lX2Gm8v1ZHC13wBHMVO0WfIzb4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HeYR7OdQRUg3DAYWKqKCOEA8FthoK9sdH1Ae+23hj2TsNGVvkmMBotu3bkwI8G1xs0ZNX8RtJLOyZ7uX/FqvBkpKObHnpBnrDCXG24XJgsOS35hnKiSUeD8MvlrlCuAA0KAPHQSo+TZJScN95kEkov6vKUaF9h0UMpv1BaBuuSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fr5YJ5+c; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fr5YJ5+c"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-88246401c9eso16639306d6.1
        for <linux-staging@lists.linux.dev>; Thu, 04 Dec 2025 18:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764900862; x=1765505662; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9EkX9xIZmrDKns4gmD6bJf1u0HOD6NrUYQev1zAiK8=;
        b=fr5YJ5+cmG3wWlnQkRgePqdkQf4rKD5u/5Hs+TyPOKeWLUmEyiUOsfOUnKivR21dRz
         rvIEzihXePs6CSFL4OUKQpLdZdJx2TCaRGJFfqEy2DSDprUngAdQ6XYX1oI3no7+Hs0J
         BUVz85eJ0UKwCAQ/nuKYQ3u0kCwXgXykIlL8BLKCFa27eXtJ4JVcm5cZGf1ZiDLZpkGM
         aHIYGbCrobWEL9If8Sv5fx7AzxY10qIFkOHCPiONGX+sbqlkSqcOirzqr7boVqiFS9Av
         Iya7CPq37DVwSlQmI9OfvZD4YThsI8M7Sm0yiJtoDdh8+HbzP/f2IaZbrXitnSJ8WNhC
         iJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764900862; x=1765505662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W9EkX9xIZmrDKns4gmD6bJf1u0HOD6NrUYQev1zAiK8=;
        b=svvwiXZlVtlpjl3/RY/XherMF/+PqYBU/p9ysJune81gCAfEdvWWE4O5w/i49Rym4R
         DZhVi8LqOjV5dfCIyTdTtt9hEIzxT7CQ+wBk1IFgu9+FCr0T8jUqN/lw4D8CJQ5GlWcM
         V0CYmG6j3aO7LmcozDcFlrmtRDG0/QGbao3ijdmNVB4pkkSflEA9Aa4UmD6uDNc4MXBT
         cbiALkDcQNINUlHcXV8w1tASzmm3385mVlJl2j5EbSRxCaT/s9mZGJsbKK3x/k6tXxEP
         bXWEdWNtinbRqk1qKjq+qbUX1ORSB0pEANsLsi65vzWBy/y/dlSF1mdQHB/vwv+u18BQ
         cKXg==
X-Forwarded-Encrypted: i=1; AJvYcCWAquqaNxhk51BmNtrMCEMXZuTGhH46ddpJmH06u6YZgR1oSMQIjz7UxvQFCpxbSLBvjwXoIboMgA0VU8qi@lists.linux.dev
X-Gm-Message-State: AOJu0YxMc3petE4bW2jLdLXgd5GmH6WuIaCSdAWwUmygs4j+RLleOmTt
	8kSXuyhU1pmBAfQL4oPZzUR+0F/22s3P0k9Jq3FQzC28FlVxKBqLvwXa
X-Gm-Gg: ASbGnctToIYXq8yB7PjVOtNsGIXHEPZUEzCBYVfBD8HrZOYwauyF6adxZVNtuQ6kyvo
	12Qp21XgNonLcXch3+hMx3507+3J/YO5JImfh8ii53jh0RpV5xQGkBM3BPcP6/eEeHyfO6SsVIF
	UbGUX9tWizgUA/CYTIukVlhS1oxpbpPeU/8PAPg2ai3DWjUjCW987NC1LWn1I0nFVhWHfAlI6EC
	fOiNX6TqhSUv/fMOyb3IXl5Xv9bQAmWicdBwJv52Wmt10oRFj8lsGhkMDxXt8U9qHca31sMJnbK
	7JqQU3kFQYIM4ZMOtHFtYxNtAfOV0oEuYuoFHbnqy5rtgbTJYKCF8jhiNp473wCmxjf5yRB2z+G
	w9ll+AJwEEU49nrMR2qnYgbvNMdvWCcg9n5Jc1PUv32oHW94TvXFqXwUfw9e8WZEmJl3u23aXih
	8jd7RI1OrrIBf40tUIIfLmv8v/dwgBB7duwnuxpXb1VPQ=
X-Google-Smtp-Source: AGHT+IErLBSCgrPV3mS9UQoIBIwIRD2ZcbqJEo49z6eOrXxK+ftwGawB85kZfvjU+ajSKxxfR0l5Hw==
X-Received: by 2002:ad4:5ec9:0:b0:87c:f64:7571 with SMTP id 6a1803df08f44-888194b7163mr131750386d6.23.1764900861906;
        Thu, 04 Dec 2025 18:14:21 -0800 (PST)
Received: from kernel-internship-machine.. ([143.110.209.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88827f51ab8sm23661356d6.21.2025.12.04.18.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 18:14:21 -0800 (PST)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	hansg@kernel.org,
	tglx@linutronix.de,
	abrahamadeakunle50@gmail.com,
	mingo@kernel.org,
	dizhouweng@kylinos.cn,
	ninoxzhang001@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH 2/2] staging: rtl8723bs: fix spacing around operators
Date: Fri,  5 Dec 2025 02:14:17 +0000
Message-Id: <20251205021417.2705864-3-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251205021417.2705864-1-vivek.balachandhar@gmail.com>
References: <20251205021417.2705864-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix several instances where operators lacked spaces around them.
This improves readability and brings the driver closer to kernel
coding-style guidelines. No functional change.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 72 +++++++++++------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 778b8715cdb2..02357c6ca815 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -283,8 +283,8 @@ void rtw_generate_random_ibss(u8 *pibss)
 	pibss[1] = 0x11;
 	pibss[2] = 0x87;
 	pibss[3] = (u8)(curtime & 0xff) ;/* p[0]; */
-	pibss[4] = (u8)((curtime>>8) & 0xff) ;/* p[1]; */
-	pibss[5] = (u8)((curtime>>16) & 0xff) ;/* p[2]; */
+	pibss[4] = (u8)((curtime >> 8) & 0xff) ;/* p[1]; */
+	pibss[5] = (u8)((curtime >> 16) & 0xff) ;/* p[2]; */
 }
 
 u8 *rtw_get_capability_from_ie(u8 *ie)
@@ -433,14 +433,14 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
 		sq_final = padapter->recvpriv.signal_qual;
 		/* the rssi value here is undecorated, and will be used for antenna diversity */
 		if (sq_smp != 101) /* from the right channel */
-			rssi_final = (src->rssi+dst->rssi*4)/5;
+			rssi_final = (src->rssi + dst->rssi * 4) / 5;
 		else
 			rssi_final = rssi_ori;
 	} else {
 		if (sq_smp != 101) { /* from the right channel */
-			ss_final = ((u32)(src->phy_info.signal_strength)+(u32)(dst->phy_info.signal_strength)*4)/5;
-			sq_final = ((u32)(src->phy_info.signal_quality)+(u32)(dst->phy_info.signal_quality)*4)/5;
-			rssi_final = (src->rssi+dst->rssi*4)/5;
+			ss_final = ((u32)(src->phy_info.signal_strength) + (u32)(dst->phy_info.signal_strength) * 4) / 5;
+			sq_final = ((u32)(src->phy_info.signal_quality) + (u32)(dst->phy_info.signal_quality) * 4) / 5;
+			rssi_final = (src->rssi + dst->rssi * 4) / 5;
 		} else {
 			/* bss info not receiving from the right channel, use the original RX signal infos */
 			ss_final = dst->phy_info.signal_strength;
@@ -609,7 +609,7 @@ int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwor
 	privacy = pnetwork->network.privacy;
 
 	if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS)) {
-		if (rtw_get_wps_ie(pnetwork->network.ies+_FIXED_IE_LENGTH_, pnetwork->network.ie_length-_FIXED_IE_LENGTH_, NULL, &wps_ielen))
+		if (rtw_get_wps_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, pnetwork->network.ie_length - _FIXED_IE_LENGTH_, NULL, &wps_ielen))
 			return true;
 		else
 			return false;
@@ -853,14 +853,14 @@ void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
 	struct dvobj_priv *psdpriv = adapter->dvobj;
 	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
 
-	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE|WIFI_AP_STATE)) {
+	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE | WIFI_AP_STATE)) {
 		struct sta_info *psta;
 
 		psta = rtw_get_stainfo(&adapter->stapriv, tgt_network->network.mac_address);
 		rtw_free_stainfo(adapter,  psta);
 	}
 
-	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE|WIFI_ADHOC_MASTER_STATE|WIFI_AP_STATE)) {
+	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE)) {
 		struct sta_info *psta;
 
 		rtw_free_all_stainfo(adapter);
@@ -915,7 +915,7 @@ void rtw_indicate_disconnect(struct adapter *padapter)
 {
 	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
-	_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING|WIFI_UNDER_WPS);
+	_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING | WIFI_UNDER_WPS);
 
 	if (rtw_to_roam(padapter) > 0)
 		_clr_fwstate_(pmlmepriv, _FW_LINKED);
@@ -946,7 +946,7 @@ inline void rtw_indicate_scan_done(struct adapter *padapter, bool aborted)
 
 	if ((!adapter_to_pwrctl(padapter)->bInSuspend) &&
 	    (!check_fwstate(&padapter->mlmepriv,
-			    WIFI_ASOC_STATE|WIFI_UNDER_LINKING))) {
+			    WIFI_ASOC_STATE | WIFI_UNDER_LINKING))) {
 		rtw_set_ips_deny(padapter, 0);
 		_set_timer(&padapter->mlmepriv.dynamic_chk_timer, 1);
 	}
@@ -1084,8 +1084,8 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 	switch (pnetwork->network.infrastructure_mode) {
 	case Ndis802_11Infrastructure:
 
-			if (pmlmepriv->fw_state&WIFI_UNDER_WPS)
-				pmlmepriv->fw_state = WIFI_STATION_STATE|WIFI_UNDER_WPS;
+			if (pmlmepriv->fw_state & WIFI_UNDER_WPS)
+				pmlmepriv->fw_state = WIFI_STATION_STATE | WIFI_UNDER_WPS;
 			else
 				pmlmepriv->fw_state = WIFI_STATION_STATE;
 
@@ -1315,7 +1315,7 @@ void rtw_sta_media_status_rpt(struct adapter *adapter, struct sta_info *psta, u3
 	if (!psta)
 		return;
 
-	media_status_rpt = (u16)((psta->mac_id<<8)|mstatus); /*   MACID|OPMODE:1 connect */
+	media_status_rpt = (u16)((psta->mac_id << 8) | mstatus); /*   MACID|OPMODE:1 connect */
 	rtw_hal_set_hwreg(adapter, HW_VAR_H2C_MEDIA_STATUS_RPT, (u8 *)&media_status_rpt);
 }
 
@@ -1433,13 +1433,13 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 	if (mac_id >= 0) {
 		u16 media_status;
 
-		media_status = (mac_id<<8)|0; /*   MACID|OPMODE:0 means disconnect */
+		media_status = (mac_id << 8) | 0; /*   MACID|OPMODE:0 means disconnect */
 		/* for STA, AP, ADHOC mode, report disconnect stauts to FW */
 		rtw_hal_set_hwreg(adapter, HW_VAR_H2C_MEDIA_STATUS_RPT, (u8 *)&media_status);
 	}
 
 	/* if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) */
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE)
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)
 		return;
 
 	mlmeext_sta_del_event_callback(adapter);
@@ -1613,7 +1613,7 @@ void rtw_mlme_reset_auto_scan_int(struct adapter *adapter)
 	if (pmlmeinfo->VHT_enable) /* disable auto scan when connect to 11AC AP */
 		mlme->auto_scan_int_ms = 0;
 	else if (adapter->registrypriv.wifi_spec && is_client_associated_to_ap(adapter) == true)
-		mlme->auto_scan_int_ms = 60*1000;
+		mlme->auto_scan_int_ms = 60 * 1000;
 	else if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
 		if (check_fwstate(mlme, WIFI_STATION_STATE) && check_fwstate(mlme, _FW_LINKED))
 			mlme->auto_scan_int_ms = mlme->roam_scan_int_ms;
@@ -2006,7 +2006,7 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	while (i < in_len) {
 		ielength = initial_out_len;
 
-		if (in_ie[i] == 0xDD && in_ie[i+2] == 0x00 && in_ie[i+3] == 0x50  && in_ie[i+4] == 0xF2 && in_ie[i+5] == 0x02 && i+5 < in_len) { /* WMM element ID and OUI */
+		if (in_ie[i] == 0xDD && in_ie[i + 2] == 0x00 && in_ie[i + 3] == 0x50  && in_ie[i + 4] == 0xF2 && in_ie[i + 5] == 0x02 && i + 5 < in_len) { /* WMM element ID and OUI */
 			for (j = i; j < i + 9; j++) {
 				out_ie[ielength] = in_ie[j];
 				ielength++;
@@ -2018,7 +2018,7 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 			break;
 		}
 
-		i += (in_ie[i+1]+2); /*  to the next IE element */
+		i += (in_ie[i + 1] + 2); /*  to the next IE element */
 	}
 
 	return ielength;
@@ -2124,13 +2124,13 @@ signed int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, u
 		authmode = WLAN_EID_RSN;
 
 	if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS)) {
-		memcpy(out_ie+ielength, psecuritypriv->wps_ie, psecuritypriv->wps_ie_len);
+		memcpy(out_ie + ielength, psecuritypriv->wps_ie, psecuritypriv->wps_ie_len);
 
 		ielength += psecuritypriv->wps_ie_len;
 	} else if ((authmode == WLAN_EID_VENDOR_SPECIFIC) || (authmode == WLAN_EID_RSN)) {
 		/* copy RSN or SSN */
-		memcpy(&out_ie[ielength], &psecuritypriv->supplicant_ie[0], psecuritypriv->supplicant_ie[1]+2);
-		ielength += psecuritypriv->supplicant_ie[1]+2;
+		memcpy(&out_ie[ielength], &psecuritypriv->supplicant_ie[0], psecuritypriv->supplicant_ie[1] + 2);
+		ielength += psecuritypriv->supplicant_ie[1] + 2;
 		rtw_report_sec_ie(adapter, authmode, psecuritypriv->supplicant_ie);
 	}
 
@@ -2298,7 +2298,7 @@ void rtw_build_wmm_ie_ht(struct adapter *padapter, u8 *out_ie, uint *pout_len)
 
 	if (padapter->mlmepriv.qospriv.qos_option == 0) {
 		out_len = *pout_len;
-		rtw_set_ie(out_ie+out_len, WLAN_EID_VENDOR_SPECIFIC,
+		rtw_set_ie(out_ie + out_len, WLAN_EID_VENDOR_SPECIFIC,
 			   _WMM_IE_Length_, WMM_IE, pout_len);
 
 		padapter->mlmepriv.qospriv.qos_option = 1;
@@ -2342,7 +2342,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 	} else {
 		p = rtw_get_ie(in_ie, WLAN_EID_HT_OPERATION, &ielen, in_len);
 		if (p && (ielen == sizeof(struct ieee80211_ht_addt_info))) {
-			struct HT_info_element *pht_info = (struct HT_info_element *)(p+2);
+			struct HT_info_element *pht_info = (struct HT_info_element *)(p + 2);
 
 			if (pht_info->infos[0] & BIT(2)) {
 				switch (pht_info->infos[0] & 0x3) {
@@ -2405,14 +2405,14 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 		rtw_hal_get_def_var(padapter, HW_VAR_MAX_RX_AMPDU_FACTOR,
 				    &max_rx_ampdu_factor);
 
-	ht_capie.ampdu_params_info = (max_rx_ampdu_factor&0x03);
+	ht_capie.ampdu_params_info = (max_rx_ampdu_factor & 0x03);
 
 	if (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)
-		ht_capie.ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_DENSITY&(0x07<<2));
+		ht_capie.ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_DENSITY & (0x07 << 2));
 	else
-		ht_capie.ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_DENSITY&0x00);
+		ht_capie.ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_DENSITY & 0x00);
 
-	rtw_set_ie(out_ie+out_len, WLAN_EID_HT_CAPABILITY,
+	rtw_set_ie(out_ie + out_len, WLAN_EID_HT_CAPABILITY,
 		   sizeof(struct ieee80211_ht_cap), (unsigned char *)&ht_capie, pout_len);
 
 	phtpriv->ht_option = true;
@@ -2421,7 +2421,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 		p = rtw_get_ie(in_ie, WLAN_EID_HT_OPERATION, &ielen, in_len);
 		if (p && (ielen == sizeof(struct ieee80211_ht_addt_info))) {
 			out_len = *pout_len;
-			rtw_set_ie(out_ie+out_len, WLAN_EID_HT_OPERATION, ielen, p+2, pout_len);
+			rtw_set_ie(out_ie + out_len, WLAN_EID_HT_OPERATION, ielen, p + 2, pout_len);
 		}
 	}
 
@@ -2453,17 +2453,17 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 
 	/* check Max Rx A-MPDU Size */
 	len = 0;
-	p = rtw_get_ie(pie+sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_CAPABILITY, &len, ie_len-sizeof(struct ndis_802_11_fix_ie));
+	p = rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_CAPABILITY, &len, ie_len - sizeof(struct ndis_802_11_fix_ie));
 	if (p && len > 0) {
-		pht_capie = (struct ieee80211_ht_cap *)(p+2);
+		pht_capie = (struct ieee80211_ht_cap *)(p + 2);
 		max_ampdu_sz = (pht_capie->ampdu_params_info & IEEE80211_HT_CAP_AMPDU_FACTOR);
-		max_ampdu_sz = 1 << (max_ampdu_sz+3); /*  max_ampdu_sz (kbytes); */
+		max_ampdu_sz = 1 << (max_ampdu_sz + 3); /*  max_ampdu_sz (kbytes); */
 
 		phtpriv->rx_ampdu_maxlen = max_ampdu_sz;
 	}
 
 	len = 0;
-	p = rtw_get_ie(pie+sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_OPERATION, &len, ie_len-sizeof(struct ndis_802_11_fix_ie));
+	p = rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_OPERATION, &len, ie_len - sizeof(struct ndis_802_11_fix_ie));
 	if (p && len > 0) {
 		/* todo: */
 	}
@@ -2542,8 +2542,8 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 	phtpriv = &psta->htpriv;
 
 	if (phtpriv->ht_option && phtpriv->ampdu_enable) {
-		issued = (phtpriv->agg_enable_bitmap>>priority)&0x1;
-		issued |= (phtpriv->candidate_tid_bitmap>>priority)&0x1;
+		issued = (phtpriv->agg_enable_bitmap >> priority) & 0x1;
+		issued |= (phtpriv->candidate_tid_bitmap >> priority) & 0x1;
 
 		if (issued == 0) {
 			psta->htpriv.candidate_tid_bitmap |= BIT((u8)priority);
@@ -2614,7 +2614,7 @@ void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 signed int rtw_linked_check(struct adapter *padapter)
 {
 	if ((check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true) ||
-			(check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE|WIFI_ADHOC_MASTER_STATE) == true)) {
+			(check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE) == true)) {
 		if (padapter->stapriv.asoc_sta_count > 2)
 			return true;
 	} else {	/* Station mode */
-- 
2.34.1

