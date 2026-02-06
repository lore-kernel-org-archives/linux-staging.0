Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926E2346FB6
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364532; cv=none; b=rGggWCcUjVDcV7XiL3VinL3DgE8LapfAIurrl08RTUF25MGXAA0hO5DEvLi/neltgg/Vp+HrahQDb6dpBCYrC/wCLHzS5qYwEmSR+CrUTJvvrv5Va50i0tHZ7X2Wyy7tYqJO4wgIGyCfJyk4S+Z6PtC8HVHUuZ5sNOqSHcMQrCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364532; c=relaxed/simple;
	bh=vb3ERhsVlDOO376ZUouJnU1OTA3aY+jXb70EUe9A2LU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ogX8yavkpD72IWlS8Ha2RN8w6vBw8LoJ7gXQCwBSH5t/yUgURHTUOvQkxsBCYOq3CsIqrD2bGaZoNliKRxTuxKlnDezhiKJ9wAn8l2lA0hMzjGCUKIDYfNCxWX6fXcDAb+Ul5J7HrNc7tRyxr0alotMHssZC9IYpR4JkgRw87kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFIgm9ei; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFIgm9ei"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-432da746749so1156568f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770364531; x=1770969331; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4ww1gg8mGycvEbb75ixZXs7LoNirH3xDQvVbOydIxg=;
        b=jFIgm9eiFKW82qf/6u67hvuhjbg2jiRJ2eV7Vu74glRtoONYixnZfxrBoOBDcZsVq4
         Q/seu0eXOGuImy5vffFa8cAJwz3KhEX7//xD5vA4RbV8SnJTEFpv7XPPZbQNkn2H0oX8
         pgxlE7gBzQ9weg0Ny4odYE3Nr1EgqEX/E577wvc0F/+yxVLS10ZxW3dl2dZCZL8kISLF
         m7GAR2IiDyZDH5ynHx6vqiJKJD4qat36MnzEnVBf6W5Q3MO87H1cJT7ioJvCJRty1fKV
         fX5WZxFJ0dkcB3QLTtZVgxBxiwVbVPfrXG9Hr1CWxQXgVfF+oXaUjJmE/lWJpkLSYPGy
         v7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770364531; x=1770969331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q4ww1gg8mGycvEbb75ixZXs7LoNirH3xDQvVbOydIxg=;
        b=WDkaXlXyloGO42Q+kceHDX+xbP9S5FCA98/8KUc9p6jI0JvBk15wS8Kqij8JHXFjbL
         sx3evh+zw9uWbJSgtyV8aw4NGi5CSXa+kpYzJNUA56NTDgQkHU7n5OX3Fo4EdQmvpkcL
         USapo1JJ+pEpeuVgJDrhnw3hE66/XgDl7O18kB5x/jcxK1C4L+Buu264XepI1rjYnYu6
         LC4dexq8b9JkKkMa6roEARqxt5swuQZVBfHDU+4BWHlCl22vwLAKdMIER5aM8F0iJ5Ra
         dUoKgOeQ9c2QtFs22+r769C7iTYJ8F7aFGgqzHOd1WkOtmklkXAifZ0gjPfMwTTxDy+A
         zqXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVkJUfSfwOF2nKOOqdVQtxt8cB3xYcqq+p4jdC6w6cSTFgIOZ8vZEHyELUNtFNZhCRxKj7Nqopmu2jLMUd@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+NyM6mTE4lH89mNsOu3LXN4Cluw5Sc95oInbV2UFWYzPxW/Gr
	yikQrRXQYteznwZ4M5SnEUoEHE0LDc9IuFmwCRfwmvKNj992ue5dWeU=
X-Gm-Gg: AZuq6aIwPOx6H2a1sGWk45MBpuhwAbJ/+4et8piqAS+JZM1+dl+9KzTqSFjd/Cz9lBc
	q9gX8OiwwKje9Krz7dda5GnMv+JCrtg2+f+cmBhrknWLv3pbYKkalvX1XpQZC85nSWQZgFICaik
	rM2r8NyZ1H+AS+KEbWxbACEgpB2WeE3Qtvac73gxr5Kp5U6EbszBOtY22SkkkmPibRXcZATnbUC
	zehtEfOXUrcLnWJrzsd4DBB5MRL4a8995sTaf6+Agf+IFu+7heJiHDebFhk62LwLVVzFwXUhPN1
	ZadUPwUudLzMZug0yxrNLCv0Jjjd95AMFnryDqq5ect7ZaGCBs6A58IIr3HzrZbVsif8+dsPUrk
	WSEqp8EHY2T/KACb4Wu3qCdMrsQM5fSpoAOA0ZSJs33BzxT0SD8EVtGJefI1UDBR+YqlHi7d1SN
	PgVq6ghw19stdDra4xmEdIQwthyBDw2xKfazgSKlkTlrgrkeZfs86cfqxWtXCoSgZKWkiGAF9uR
	w==
X-Received: by 2002:a5d:588d:0:b0:431:c60:c5ed with SMTP id ffacd0b85a97d-43629651e52mr2429465f8f.13.1770364530501;
        Thu, 05 Feb 2026 23:55:30 -0800 (PST)
Received: from LGPC ([31.223.131.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd3b8sm3836039f8f.11.2026.02.05.23.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:55:29 -0800 (PST)
From: lukagejak5@gmail.com
X-Google-Original-From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v2 24/26] staging: rtl8723bs: core: fix line lengths in rtw_mlme.c
Date: Fri,  6 Feb 2026 08:54:37 +0100
Message-ID: <20260206075439.103287-25-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206075439.103287-1-luka.gejak@linux.dev>
References: <20260206075439.103287-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luka Gejak <luka.gejak@linux.dev>

Break long lines exceeding 100 characters to comply with kernel coding
style.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 101 ++++++++++++++--------
 1 file changed, 66 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index d46f5025a0a5..503b3c239163 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -52,7 +52,8 @@ int	rtw_init_mlme_priv(struct adapter *padapter)
 	pmlmepriv->pscanned = NULL;
 	pmlmepriv->fw_state = WIFI_STATION_STATE; /*  Must sync with rtw_wdev_alloc() */
 	pmlmepriv->cur_network.network.infrastructure_mode = Ndis802_11AutoUnknown;
-	pmlmepriv->scan_mode = SCAN_ACTIVE;/*  1: active, 0: passive. Maybe someday we should rename this varable to "active_mode" (Jeff) */
+	/* 1: active, 0: passive. Maybe someday rename to "active_mode" */
+	pmlmepriv->scan_mode = SCAN_ACTIVE;
 
 	spin_lock_init(&pmlmepriv->lock);
 	INIT_LIST_HEAD(&pmlmepriv->free_bss_pool.queue);
@@ -376,7 +377,8 @@ int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 fea
 			(d_cap & WLAN_CAPABILITY_ESS));
 }
 
-struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queue, struct wlan_network *network)
+struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queue,
+					     struct wlan_network *network)
 {
 	struct list_head *phead, *plist;
 	struct wlan_network *found = NULL;
@@ -427,7 +429,8 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
 	long rssi_final;
 
 	/* The rule below is 1/5 for sample value, 4/5 for history value */
-	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) && is_same_network(&padapter->mlmepriv.cur_network.network, src, 0)) {
+	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) &&
+	    is_same_network(&padapter->mlmepriv.cur_network.network, src, 0)) {
 		/* Take the recvpriv's value for the connected AP*/
 		ss_final = padapter->recvpriv.signal_strength;
 		sq_final = padapter->recvpriv.signal_qual;
@@ -469,10 +472,13 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 		&pmlmepriv->cur_network.network,
 		&pmlmepriv->cur_network.network);
 
-	if (check_fwstate(pmlmepriv, _FW_LINKED) && (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
+	if (check_fwstate(pmlmepriv, _FW_LINKED) &&
+	    is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0)) {
 		update_network(&pmlmepriv->cur_network.network, pnetwork, adapter, true);
-		rtw_update_protection(adapter, (pmlmepriv->cur_network.network.ies) + sizeof(struct ndis_802_11_fix_ie),
-								pmlmepriv->cur_network.network.ie_length);
+		rtw_update_protection(adapter,
+				      pmlmepriv->cur_network.network.ies +
+				      sizeof(struct ndis_802_11_fix_ie),
+				      pmlmepriv->cur_network.network.ie_length);
 	}
 }
 
@@ -609,7 +615,10 @@ int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwor
 	privacy = pnetwork->network.privacy;
 
 	if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS)) {
-		if (rtw_get_wps_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, pnetwork->network.ie_length - _FIXED_IE_LENGTH_, NULL, &wps_ielen))
+		u8 *ies = pnetwork->network.ies + _FIXED_IE_LENGTH_;
+		uint ie_len = pnetwork->network.ie_length - _FIXED_IE_LENGTH_;
+
+		if (rtw_get_wps_ie(ies, ie_len, NULL, &wps_ielen))
 			return true;
 		else
 			return false;
@@ -617,12 +626,14 @@ int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwor
 	if (adapter->registrypriv.wifi_spec == 1) { /* for  correct flow of 8021X  to do.... */
 		u8 *p = NULL;
 		uint ie_len = 0;
+		u8 *ies = pnetwork->network.ies + _BEACON_IE_OFFSET_;
+		uint ies_len = pnetwork->network.ie_length - _BEACON_IE_OFFSET_;
 
 		if ((desired_encmode == Ndis802_11EncryptionDisabled) && (privacy != 0))
 			bselected = false;
 
 		if (psecuritypriv->ndisauthtype == Ndis802_11AuthModeWPA2PSK) {
-			p = rtw_get_ie(pnetwork->network.ies + _BEACON_IE_OFFSET_, WLAN_EID_RSN, &ie_len, (pnetwork->network.ie_length - _BEACON_IE_OFFSET_));
+			p = rtw_get_ie(ies, WLAN_EID_RSN, &ie_len, ies_len);
 			if (p && ie_len > 0)
 				bselected = true;
 			else
@@ -968,7 +979,8 @@ void rtw_scan_abort(struct adapter *adapter)
 	pmlmeext->scan_abort = false;
 }
 
-static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, struct wlan_network *pnetwork)
+static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter,
+						    struct wlan_network *pnetwork)
 {
 	int i;
 	struct sta_info *bmc_sta, *psta = NULL;
@@ -1052,7 +1064,9 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 
 /* pnetwork : returns from rtw_joinbss_event_callback */
 /* ptarget_wlan: found from scanned_queue */
-static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_network *ptarget_wlan, struct wlan_network  *pnetwork)
+static void rtw_joinbss_update_network(struct adapter *padapter,
+				       struct wlan_network *ptarget_wlan,
+				       struct wlan_network *pnetwork)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_network  *cur_network = &pmlmepriv->cur_network;
@@ -1070,7 +1084,8 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 	padapter->recvpriv.signal_strength = ptarget_wlan->network.phy_info.signal_strength;
 	padapter->recvpriv.signal_qual = ptarget_wlan->network.phy_info.signal_quality;
 	/* the ptarget_wlan->network.rssi is raw data, we use ptarget_wlan->network.phy_info.signal_strength instead (has scaled) */
-	padapter->recvpriv.rssi = translate_percentage_to_dbm(ptarget_wlan->network.phy_info.signal_strength);
+	padapter->recvpriv.rssi =
+		translate_percentage_to_dbm(ptarget_wlan->network.phy_info.signal_strength);
 
 	rtw_set_signal_stat_timer(&padapter->recvpriv);
 
@@ -1095,7 +1110,9 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 	rtw_update_protection(padapter, (cur_network->network.ies) + sizeof(struct ndis_802_11_fix_ie),
 									(cur_network->network.ie_length));
 
-	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->network.ie_length, (u8) cur_network->network.configuration.ds_config);
+	rtw_update_ht_cap(padapter, cur_network->network.ies,
+			  cur_network->network.ie_length,
+			  (u8)cur_network->network.configuration.ds_config);
 }
 
 static struct rt_pmkid_list   backupPMKIDList[NUM_PMKID_CACHE];
@@ -1117,7 +1134,8 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		/*  Backup the btkip_countermeasure information. */
 		/*  When the countermeasure is trigger, the driver have to disconnect with AP for 60 seconds. */
 
-		memcpy(&backupPMKIDList[0], &adapter->securitypriv.PMKIDList[0], sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
+		memcpy(&backupPMKIDList[0], &adapter->securitypriv.PMKIDList[0],
+		       sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
 		backupPMKIDIndex = adapter->securitypriv.PMKIDIndex;
 		backupTKIPCountermeasure = adapter->securitypriv.btkip_countermeasure;
 		backupTKIPcountermeasure_time = adapter->securitypriv.btkip_countermeasure_time;
@@ -1129,7 +1147,8 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 
 		/*  Added by Albert 2009/02/18 */
 		/*  Restore the PMK information to securitypriv structure for the following connection. */
-		memcpy(&adapter->securitypriv.PMKIDList[0], &backupPMKIDList[0], sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
+		memcpy(&adapter->securitypriv.PMKIDList[0], &backupPMKIDList[0],
+		       sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
 		adapter->securitypriv.PMKIDIndex = backupPMKIDIndex;
 		adapter->securitypriv.btkip_countermeasure = backupTKIPCountermeasure;
 		adapter->securitypriv.btkip_countermeasure_time = backupTKIPcountermeasure_time;
@@ -1177,7 +1196,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 	struct wlan_network	*pcur_wlan = NULL, *ptarget_wlan = NULL;
 	unsigned int		the_same_macaddr = false;
 
-	the_same_macaddr = !memcmp(pnetwork->network.mac_address, cur_network->network.mac_address, ETH_ALEN);
+	the_same_macaddr = !memcmp(pnetwork->network.mac_address,
+				   cur_network->network.mac_address, ETH_ALEN);
 
 	pnetwork->network.length = get_wlan_bssid_ex_sz(&pnetwork->network);
 	if (pnetwork->network.length > sizeof(struct wlan_bssid_ex))
@@ -1361,9 +1381,9 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 	/* for AD-HOC mode */
 	psta = rtw_get_stainfo(&adapter->stapriv, pstassoc->macaddr);
 	if (psta) {
-		/* the sta have been in sta_info_queue => do nothing */
-
-		return; /* between drv has received this event before and  fw have not yet to set key to CAM_ENTRY) */
+		/* sta already in sta_info_queue, do nothing */
+		/* drv received this event but fw hasn't set key to CAM_ENTRY yet */
+		return;
 	}
 
 	psta = rtw_alloc_stainfo(&adapter->stapriv, pstassoc->macaddr);
@@ -1447,7 +1467,8 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 
 		if (adapter->registrypriv.wifi_spec == 1) {
 			roam = false;
-		} else if (reason == WLAN_REASON_EXPIRATION_CHK && rtw_chk_roam_flags(adapter, RTW_ROAM_ON_EXPIRED)) {
+		} else if (reason == WLAN_REASON_EXPIRATION_CHK &&
+			   rtw_chk_roam_flags(adapter, RTW_ROAM_ON_EXPIRED)) {
 			roam = true;
 		} else if (reason == WLAN_REASON_ACTIVE_ROAM && rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
 			roam = true;
@@ -1916,7 +1937,8 @@ signed int rtw_set_auth(struct adapter *adapter, struct security_priv *psecurity
 	return res;
 }
 
-signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecuritypriv, signed int keyid, u8 set_tx, bool enqueue)
+signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecuritypriv,
+		       signed int keyid, u8 set_tx, bool enqueue)
 {
 	u8 keylen;
 	struct cmd_obj *pcmd;
@@ -1991,7 +2013,8 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 }
 
 /* adjust ies for rtw_joinbss_cmd in WMM */
-int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len, uint initial_out_len)
+int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie,
+			uint in_len, uint initial_out_len)
 {
 	unsigned	int ielength = 0;
 	unsigned int i, j;
@@ -2302,7 +2325,9 @@ void rtw_build_wmm_ie_ht(struct adapter *padapter, u8 *out_ie, uint *pout_len)
 }
 
 /* the function is >= passive_level */
-unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_ie, uint in_len, uint *pout_len, u8 channel)
+unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie,
+				   u8 *out_ie, uint in_len,
+				   uint *pout_len, u8 channel)
 {
 	u32 ielen, out_len;
 	enum ieee80211_max_ampdu_length_exp max_rx_ampdu_factor;
@@ -2448,20 +2473,26 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 		phtpriv->ampdu_enable = true;
 
 	/* check Max Rx A-MPDU Size */
-	len = 0;
-	p = rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_CAPABILITY, &len, ie_len - sizeof(struct ndis_802_11_fix_ie));
-	if (p && len > 0) {
-		pht_capie = (struct ieee80211_ht_cap *)(p + 2);
-		max_ampdu_sz = (pht_capie->ampdu_params_info & IEEE80211_HT_CAP_AMPDU_FACTOR);
-		max_ampdu_sz = 1 << (max_ampdu_sz + 3); /*  max_ampdu_sz (kbytes); */
-
-		phtpriv->rx_ampdu_maxlen = max_ampdu_sz;
-	}
+	{
+		u8 *ies = pie + sizeof(struct ndis_802_11_fix_ie);
+		uint ies_len = ie_len - sizeof(struct ndis_802_11_fix_ie);
+
+		len = 0;
+		p = rtw_get_ie(ies, WLAN_EID_HT_CAPABILITY, &len, ies_len);
+		if (p && len > 0) {
+			pht_capie = (struct ieee80211_ht_cap *)(p + 2);
+			max_ampdu_sz = pht_capie->ampdu_params_info &
+				       IEEE80211_HT_CAP_AMPDU_FACTOR;
+			max_ampdu_sz = 1 << (max_ampdu_sz + 3);
+
+			phtpriv->rx_ampdu_maxlen = max_ampdu_sz;
+		}
 
-	len = 0;
-	p = rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_OPERATION, &len, ie_len - sizeof(struct ndis_802_11_fix_ie));
-	if (p && len > 0) {
-		/* todo: */
+		len = 0;
+		p = rtw_get_ie(ies, WLAN_EID_HT_OPERATION, &len, ies_len);
+		if (p && len > 0) {
+			/* todo: */
+		}
 	}
 
 	if ((pregistrypriv->bw_mode & 0x0f) > 0)
-- 
2.52.0

