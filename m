Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CE6346A06
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364517; cv=none; b=bfn8+7P9izptNTfjB/zkNKvyfQYH3gyS4FpTUWK9cJ8QpoHcvYqUqGCo86Nzbc0+goiu9dbCkpuhnf//he5mxbWA7iibgIbqyvJbjg2yVYCHtxcKVxQ4PVAJccZflrghvyRy/YVNFryYuneelHVIrgeeYW1HV4IN7VVdmSZPzbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364517; c=relaxed/simple;
	bh=4MUw6W6LK2xoEU/UCL4E0rjGEIDZ9+L9zyiyibNJZpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LKps9Z/Gngio36B8SgT/nc1E/FulPz67W22RoFxdpA+TtxEKCjfAuyka4Ggf2bRjjD1fxNFvugQb7D/WBfr1YkAsk5XYIuyZaHEe9UKBxlo39rcHwPkvNCpPQc5t0nefHsm7U2zC1SyEa1eso2ZSKSr1yMLmGFnsGn2ElHWG9XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBoInlwH; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBoInlwH"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4362c932df8so126791f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770364514; x=1770969314; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WT6bdOQ4zFhLL1x6o6kK1EPCzHkMrCnYTMRenkmKh0s=;
        b=LBoInlwH1cgrzpOeNm9s84JUF+KjB/PQaAUij0mxUbCKZOKZmv5XNtnYGueEIF5aS9
         O+43w+LceHGeBS4UNuYekwiFzVu9BGXKWoEXREOUUgSaFD6ethnhLaG2slWSwW7up3/o
         JL1SnU5GLlivd2YqDNUaRoPIsAR0efAZB97dKrKoYS8NM7aJrGGvIBCjDbH4Z3+wU3pM
         vKyRCl3Ksjyhlov3cSrHOHfpu7v71jyj5jGUGG7l3hx1nO8O747u/qJ5fgXqXY5vpEiT
         1Dw0alt6+1VEw6qoeFGLA1Sq82cF/d8suG3fnaOeSrIdBf6GX/aQvEPr5PiN9dSjeyX9
         Yrvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770364514; x=1770969314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WT6bdOQ4zFhLL1x6o6kK1EPCzHkMrCnYTMRenkmKh0s=;
        b=CNEsvgWDIgXt5BWvc3iXNoXWZfX03P8Y989dEj8lgheB30jHZPyeTNObhm8fq/5bi0
         eAI2OciJ8zumXrABcVVAKa5rXKa51vd+Nda9i1jll2VMCBzrnfENipvcwG08Eza4MNdC
         ZoVfr79GMT+6bESW0zV1mManm4gXeZVJQpur2SoQJDTcxT1cmO4ZlawHAgPVfiLZi/Fq
         rHs8YGAKau7Vi8mUXD3fBMHsCe35LY5YiLoG5SZO7cUWuY9K9kyF2QtjBqNaMtEFR1Ia
         GdSBI/0ae66VpJ+cTM/OpCp3iHeABajc0VFPvD3QK9AeoaxUp76o3yyyn2/2cp5K2Glu
         bCrA==
X-Forwarded-Encrypted: i=1; AJvYcCXWdLiMDlSwkwnYCMr7kD6vjf/lEWWy/16VA/tb1wUIxxZHPDD/XYuHPO1hWO5g380yzIWzt83utGGyb+VB@lists.linux.dev
X-Gm-Message-State: AOJu0YyTtBWDMDLzKoOdMECoHRTUlpT6Wr1iwQMDk2zKU8Q9MzG/cdnT
	Y8NgbH0jNXsogFFsI4sd2cz+JPrqZLEsCpCvewckl24NilGfyak9q8g=
X-Gm-Gg: AZuq6aLo5nM4wJtczYqOtVsAPMzIvrazKOsAVXGH0hS393snqWL2elTu4p/pXA7C5ZP
	FbKdY2ZzegGLvQDVrW2iZhqUpW2xr6K1jGgi3fiW8x5VofVddQoaTK4KnGAvOoWciXmKrChYvSp
	WpK5LH6JYJWVEuihXrZuEqdCaMV18ftxMltrAMtELTrQ13cJ+9jy/mbWF9q8Zr5Pvu18p+S4fTz
	8qq/urKRjn7vmNvWx76hez9FJgeahudgTqofARNtdLnaej6gtHRqz1V5wtGDCyBwNiDxpX882rX
	9droPOCz5o1kvuqS+SyZt/O4r+BAU//DFSnKW1e899e9AdzUjaz82dySFK+1zje3iJlHkmnmE7W
	/9jzBupHYrC/v4cxOOlJYccPKeO1E5bV0KXOBTBADvciUJNX8JVsSSy3x31l6gim8yHFNGg6b1M
	D1X7sNP1O+UJGW1wSrABH++tz6Nhg6D9BwgBsa4uxQ3jF9dwRuRiaXtdvvcTKVcUs4aTUCkZYHG
	A==
X-Received: by 2002:a05:6000:188e:b0:435:91b8:e029 with SMTP id ffacd0b85a97d-436293b3857mr2682788f8f.37.1770364514115;
        Thu, 05 Feb 2026 23:55:14 -0800 (PST)
Received: from LGPC ([31.223.131.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd3b8sm3836039f8f.11.2026.02.05.23.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:55:13 -0800 (PST)
From: lukagejak5@gmail.com
X-Google-Original-From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v2 12/26] staging: rtl8723bs: core: fix line lengths in rtw_wlan_util.c
Date: Fri,  6 Feb 2026 08:54:25 +0100
Message-ID: <20260206075439.103287-13-luka.gejak@linux.dev>
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
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 215 ++++++++++++------
 1 file changed, 140 insertions(+), 75 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 9ab9fb25ced4..709f42f980d8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -335,7 +335,8 @@ void r8723bs_select_channel(struct adapter *padapter, unsigned char channel)
 	mutex_unlock(&(adapter_to_dvobj(padapter)->setch_mutex));
 }
 
-void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigned char channel_offset, unsigned short bwmode)
+void set_channel_bwmode(struct adapter *padapter, unsigned char channel,
+			unsigned char channel_offset, unsigned short bwmode)
 {
 	u8 center_ch, chnl_offset80 = HAL_PRIME_CHNL_OFFSET_DONT_CARE;
 
@@ -351,7 +352,9 @@ void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigne
 	rtw_set_oper_bw(padapter, bwmode);
 	rtw_set_oper_choffset(padapter, channel_offset);
 
-	rtw_hal_set_chnl_bw(padapter, center_ch, bwmode, channel_offset, chnl_offset80); /*  set center channel */
+	/* set center channel */
+	rtw_hal_set_chnl_bw(padapter, center_ch, bwmode,
+			    channel_offset, chnl_offset80);
 
 	mutex_unlock(&(adapter_to_dvobj(padapter)->setch_mutex));
 }
@@ -381,10 +384,14 @@ int is_client_associated_to_ap(struct adapter *padapter)
 	pmlmeext = &padapter->mlmeextpriv;
 	pmlmeinfo = &(pmlmeext->mlmext_info);
 
-	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE))
-		return true;
-	else
-		return _FAIL;
+	{
+		bool assoc_ok = pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS;
+		bool is_station = (pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE;
+
+		if (assoc_ok && is_station)
+			return true;
+	}
+	return _FAIL;
 }
 
 int is_client_associated_to_ibss(struct adapter *padapter)
@@ -392,10 +399,14 @@ int is_client_associated_to_ibss(struct adapter *padapter)
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 
-	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE))
-		return true;
-	else
-		return _FAIL;
+	{
+		bool assoc_ok = pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS;
+		bool is_adhoc = (pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE;
+
+		if (assoc_ok && is_adhoc)
+			return true;
+	}
+	return _FAIL;
 }
 
 int is_IBSS_empty(struct adapter *padapter)
@@ -467,7 +478,7 @@ void _write_cam(struct adapter *padapter, u8 entry, u16 ctrl, u8 *mac, u8 *key)
 void _clear_cam_entry(struct adapter *padapter, u8 entry)
 {
 	unsigned char null_sta[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
-	unsigned char null_key[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
+	unsigned char null_key[16] = {0};
 
 	_write_cam(padapter, entry, 0, null_sta, null_key);
 }
@@ -571,62 +582,74 @@ s16 rtw_camid_alloc(struct adapter *adapter, struct sta_info *sta, u8 kid)
 
 	mlmeinfo = &adapter->mlmeextpriv.mlmext_info;
 
-	if ((((mlmeinfo->state & 0x03) == WIFI_FW_AP_STATE) || ((mlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE))
-		&& !sta) {
-		/* AP/Ad-hoc mode group key: static alloction to default key by key ID */
-		if (kid > 3) {
-			netdev_dbg(adapter->pnetdev,
-				   FUNC_ADPT_FMT " group key with invalid key id:%u\n",
-				   FUNC_ADPT_ARG(adapter), kid);
-			rtw_warn_on(1);
-			goto bitmap_handle;
-		}
-
-		cam_id = kid;
-	} else {
-		int i;
-		u8 *addr = sta ? sta->hwaddr : NULL;
+	{
+		u8 state = mlmeinfo->state & 0x03;
+		bool is_ap_or_adhoc = (state == WIFI_FW_AP_STATE) ||
+				      (state == WIFI_FW_ADHOC_STATE);
 
-		if (!sta) {
-			if (!(mlmeinfo->state & WIFI_FW_ASSOC_SUCCESS)) {
-				/* bypass STA mode group key setting before connected(ex:WEP) because bssid is not ready */
+		if (is_ap_or_adhoc && !sta) {
+			/* AP/Ad-hoc mode group key: static alloction to default key by key ID */
+			if (kid > 3) {
+				netdev_dbg(adapter->pnetdev,
+					   FUNC_ADPT_FMT " group key with invalid key id:%u\n",
+					   FUNC_ADPT_ARG(adapter), kid);
+				rtw_warn_on(1);
 				goto bitmap_handle;
 			}
 
-			addr = get_bssid(&adapter->mlmepriv);
-		}
+			cam_id = kid;
+		} else {
+			int i;
+			u8 *addr = sta ? sta->hwaddr : NULL;
+
+			if (!sta) {
+				if (!(mlmeinfo->state & WIFI_FW_ASSOC_SUCCESS)) {
+					/*
+					 * bypass STA mode group key setting before
+					 * connected(ex:WEP) because bssid is not ready
+					 */
+					goto bitmap_handle;
+				}
+
+				addr = get_bssid(&adapter->mlmepriv);
+			}
 
-		i = _rtw_camid_search(adapter, addr, kid);
-		if (i >= 0) {
-			/* Fix issue that pairwise and group key have same key id. Pairwise key first, group key can overwirte group only(ex: rekey) */
-			if (sta || _rtw_camid_is_gk(adapter, i))
-				cam_id = i;
-			else
-				netdev_dbg(adapter->pnetdev,
-					   FUNC_ADPT_FMT " group key id:%u the same key id as pairwise key\n",
-					   FUNC_ADPT_ARG(adapter), kid);
-			goto bitmap_handle;
-		}
+			i = _rtw_camid_search(adapter, addr, kid);
+			if (i >= 0) {
+				/*
+				 * Fix issue that pairwise and group key have same
+				 * key id. Pairwise key first, group key can
+				 * overwirte group only(ex: rekey)
+				 */
+				if (sta || _rtw_camid_is_gk(adapter, i))
+					cam_id = i;
+				else
+					netdev_dbg(adapter->pnetdev,
+						   FUNC_ADPT_FMT " grp key:%u same as pairwise\n",
+						   FUNC_ADPT_ARG(adapter), kid);
+				goto bitmap_handle;
+			}
 
-		for (i = 4; i < TOTAL_CAM_ENTRY; i++)
-			if (!(cam_ctl->bitmap & BIT(i)))
-				break;
+			for (i = 4; i < TOTAL_CAM_ENTRY; i++)
+				if (!(cam_ctl->bitmap & BIT(i)))
+					break;
+
+			if (i == TOTAL_CAM_ENTRY) {
+				if (sta)
+					netdev_dbg(adapter->pnetdev,
+						   FUNC_ADPT_FMT " pairwise %pM id:%u no room\n",
+						   FUNC_ADPT_ARG(adapter),
+						   sta->hwaddr, kid);
+				else
+					netdev_dbg(adapter->pnetdev,
+						   FUNC_ADPT_FMT " group key id:%u no room\n",
+						   FUNC_ADPT_ARG(adapter), kid);
+				rtw_warn_on(1);
+				goto bitmap_handle;
+			}
 
-		if (i == TOTAL_CAM_ENTRY) {
-			if (sta)
-				netdev_dbg(adapter->pnetdev,
-					   FUNC_ADPT_FMT " pairwise key with %pM id:%u no room\n",
-					   FUNC_ADPT_ARG(adapter),
-					   sta->hwaddr, kid);
-			else
-				netdev_dbg(adapter->pnetdev,
-					   FUNC_ADPT_FMT " group key id:%u no room\n",
-					   FUNC_ADPT_ARG(adapter), kid);
-			rtw_warn_on(1);
-			goto bitmap_handle;
+			cam_id = i;
 		}
-
-		cam_id = i;
 	}
 
 bitmap_handle:
@@ -1136,9 +1159,14 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	if (!bssid)
 		return true;
 
-	if ((pmlmepriv->timeBcnInfoChkStart != 0) && (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) > DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS)) {
-		pmlmepriv->timeBcnInfoChkStart = 0;
-		pmlmepriv->NumOfBcnInfoChkFail = 0;
+	if (pmlmepriv->timeBcnInfoChkStart != 0) {
+		unsigned long elapsed;
+
+		elapsed = jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart);
+		if (elapsed > DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS) {
+			pmlmepriv->timeBcnInfoChkStart = 0;
+			pmlmepriv->NumOfBcnInfoChkFail = 0;
+		}
 	}
 
 	subtype = GetFrameSubType(pframe) >> 4;
@@ -1154,7 +1182,12 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 
 	/* check bw and channel offset */
 	/* parsing HT_CAP_IE */
-	p = rtw_get_ie(bssid->ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_CAPABILITY, &len, bssid->ie_length - _FIXED_IE_LENGTH_);
+	{
+		u8 *ies = bssid->ies + _FIXED_IE_LENGTH_;
+		uint ie_len = bssid->ie_length - _FIXED_IE_LENGTH_;
+
+		p = rtw_get_ie(ies, WLAN_EID_HT_CAPABILITY, &len, ie_len);
+	}
 	if (p && len > 0) {
 		pht_cap = (struct ieee80211_ht_cap *)(p + 2);
 		ht_cap_info = le16_to_cpu(pht_cap->cap_info);
@@ -1162,7 +1195,12 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 		ht_cap_info = 0;
 	}
 	/* parsing HT_INFO_IE */
-	p = rtw_get_ie(bssid->ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_OPERATION, &len, bssid->ie_length - _FIXED_IE_LENGTH_);
+	{
+		u8 *ies = bssid->ies + _FIXED_IE_LENGTH_;
+		uint ie_len = bssid->ie_length - _FIXED_IE_LENGTH_;
+
+		p = rtw_get_ie(ies, WLAN_EID_HT_OPERATION, &len, ie_len);
+	}
 	if (p && len > 0) {
 		pht_info = (struct HT_info_element *)(p + 2);
 		ht_info_infos_0 = pht_info->infos[0];
@@ -1181,7 +1219,12 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	}
 
 	/* Checking for channel */
-	p = rtw_get_ie(bssid->ies + _FIXED_IE_LENGTH_, WLAN_EID_DS_PARAMS, &len, bssid->ie_length - _FIXED_IE_LENGTH_);
+	{
+		u8 *ies = bssid->ies + _FIXED_IE_LENGTH_;
+		uint ie_len = bssid->ie_length - _FIXED_IE_LENGTH_;
+
+		p = rtw_get_ie(ies, WLAN_EID_DS_PARAMS, &len, ie_len);
+	}
 	if (p) {
 		bcn_channel = *(p + 2);
 	} else {/* In 5G, some ap do not have DSSET IE checking HT info for channel */
@@ -1198,7 +1241,12 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 
 	/* checking SSID */
 	ssid_len = 0;
-	p = rtw_get_ie(bssid->ies + _FIXED_IE_LENGTH_, WLAN_EID_SSID, &len, bssid->ie_length - _FIXED_IE_LENGTH_);
+	{
+		u8 *ies = bssid->ies + _FIXED_IE_LENGTH_;
+		uint ie_len = bssid->ie_length - _FIXED_IE_LENGTH_;
+
+		p = rtw_get_ie(ies, WLAN_EID_SSID, &len, ie_len);
+	}
 	if (p) {
 		ssid_len = *(p + 1);
 		if (ssid_len > NDIS_802_11_LENGTH_SSID)
@@ -1269,11 +1317,16 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 
 	pmlmepriv->NumOfBcnInfoChkFail++;
 
-	if ((pmlmepriv->timeBcnInfoChkStart != 0) && (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) <= DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS)
-		&& (pmlmepriv->NumOfBcnInfoChkFail >= DISCONNECT_BY_CHK_BCN_FAIL_THRESHOLD)) {
-		pmlmepriv->timeBcnInfoChkStart = 0;
-		pmlmepriv->NumOfBcnInfoChkFail = 0;
-		return _FAIL;
+	if (pmlmepriv->timeBcnInfoChkStart != 0) {
+		unsigned long elapsed;
+
+		elapsed = jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart);
+		if (elapsed <= DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS &&
+		    pmlmepriv->NumOfBcnInfoChkFail >= DISCONNECT_BY_CHK_BCN_FAIL_THRESHOLD) {
+			pmlmepriv->timeBcnInfoChkStart = 0;
+			pmlmepriv->NumOfBcnInfoChkFail = 0;
+			return _FAIL;
+		}
 	}
 
 	return _SUCCESS;
@@ -1526,7 +1579,11 @@ void update_capinfo(struct adapter *Adapter, u16 updateCap)
 		if (pmlmeext->cur_wireless_mode & (WIRELESS_11_24N)) {
 			pmlmeinfo->slotTime = SHORT_SLOT_TIME;
 		} else if (pmlmeext->cur_wireless_mode & (WIRELESS_11G)) {
-			if ((updateCap & cShortSlotTime) /* && (!(pMgntInfo->pHTInfo->RT2RT_HT_Mode & RT_HT_CAP_USE_LONG_PREAMBLE)) */)
+			/*
+			 * cShortSlotTime check:
+			 * (!(pMgntInfo->pHTInfo->RT2RT_HT_Mode & RT_HT_CAP_USE_LONG_PREAMBLE))
+			 */
+			if (updateCap & cShortSlotTime)
 				/*  Short Slot Time */
 				pmlmeinfo->slotTime = SHORT_SLOT_TIME;
 			else
@@ -1607,9 +1664,17 @@ int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, uint var_ie_l
 	memcpy(pmlmeinfo->FW_sta_info[cam_idx].SupportedRates, pIE->data, ie_len);
 	supportRateNum = ie_len;
 
-	pIE = (struct ndis_80211_var_ie *)rtw_get_ie(pvar_ie, WLAN_EID_EXT_SUPP_RATES, &ie_len, var_ie_len);
-	if (pIE && (ie_len <= sizeof(pmlmeinfo->FW_sta_info[cam_idx].SupportedRates) - supportRateNum))
-		memcpy((pmlmeinfo->FW_sta_info[cam_idx].SupportedRates + supportRateNum), pIE->data, ie_len);
+	{
+		u8 *rates = pmlmeinfo->FW_sta_info[cam_idx].SupportedRates;
+		size_t max_ext = sizeof(pmlmeinfo->FW_sta_info[cam_idx].SupportedRates) -
+				 supportRateNum;
+
+		pIE = (struct ndis_80211_var_ie *)rtw_get_ie(pvar_ie,
+							     WLAN_EID_EXT_SUPP_RATES,
+							     &ie_len, var_ie_len);
+		if (pIE && ie_len <= max_ext)
+			memcpy(rates + supportRateNum, pIE->data, ie_len);
+	}
 
 	return _SUCCESS;
 }
-- 
2.52.0

