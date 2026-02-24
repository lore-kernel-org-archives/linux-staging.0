Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2811739E19D
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 13:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771939699; cv=none; b=XPxWC3g8O7H9KUFIn2QL3UF/qm8Cms3nZqI83Y4Kgw0d4zWbHEtiR5JIkE55m9fjR84IEZV7Fgsu7hZexCHBvEWMjtwC4yzDb2QXxR/ICcAeIc5QFKCsBV+PCeZQkFMEQa8fDul2ZbFYCWoV52PieKgevsYc4JPZYQUooiC2nfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771939699; c=relaxed/simple;
	bh=DrhwS7Q+1MUldYz3ZLWmZ5SRnMtlCetAS8QMoBQlYMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uWwy1yp58t/F2uzcHNFYk9q4u6gEc1Uc5Ef9rPX8rATfsmDNm1pP7MQPxJiFIlvnOwHiaGLKfO9wNx/NXvABcwF5yUYlhU/BScwidORNfzk+tqVIjl5RlkDR0iYfLHnuEucaaTGSBfFQz2o9smaeziC9FQhEwX7IDleouZXG4KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eROvqpw7; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eROvqpw7"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771939695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T+1sVrRn+Edtix1p4O8DkWvdajyAn+nC1Xd2maebxN8=;
	b=eROvqpw7LHWgZ49L28BLcC3j6Aux9LBFclQguXyyk55PN23VP59TOwSBa51N9Kgp9A9zDz
	s1kOr8TagEWlOQflzTMnv2e5Nemm/BI7FBAfFcS66PbobtR5Egi7ntkBDxH5qvq4j1NXnP
	gyV7wvIpGdnPcospHQK+4znKyJI3yts=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH 07/21] staging: rtl8723bs: core: fix line lengths in rtw_wlan_util.c
Date: Tue, 24 Feb 2026 14:27:34 +0100
Message-ID: <20260224132748.12336-8-luka.gejak@linux.dev>
In-Reply-To: <20260224132748.12336-1-luka.gejak@linux.dev>
References: <20260224132748.12336-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

Break long lines exceeding 100 characters to comply with kernel coding
style.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 215 ++++++++++++------
 1 file changed, 140 insertions(+), 75 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 9284657e23c2..ed8b76ca26cc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -334,7 +334,8 @@ void r8723bs_select_channel(struct adapter *padapter, unsigned char channel)
 	mutex_unlock(&(adapter_to_dvobj(padapter)->setch_mutex));
 }
 
-void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigned char channel_offset, unsigned short bwmode)
+void set_channel_bwmode(struct adapter *padapter, unsigned char channel,
+			unsigned char channel_offset, unsigned short bwmode)
 {
 	u8 center_ch, chnl_offset80 = HAL_PRIME_CHNL_OFFSET_DONT_CARE;
 
@@ -350,7 +351,9 @@ void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigne
 	rtw_set_oper_bw(padapter, bwmode);
 	rtw_set_oper_choffset(padapter, channel_offset);
 
-	rtw_hal_set_chnl_bw(padapter, center_ch, bwmode, channel_offset, chnl_offset80); /*  set center channel */
+	/* set center channel */
+	rtw_hal_set_chnl_bw(padapter, center_ch, bwmode,
+			    channel_offset, chnl_offset80);
 
 	mutex_unlock(&(adapter_to_dvobj(padapter)->setch_mutex));
 }
@@ -380,10 +383,14 @@ int is_client_associated_to_ap(struct adapter *padapter)
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
@@ -391,10 +398,14 @@ int is_client_associated_to_ibss(struct adapter *padapter)
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
@@ -466,7 +477,7 @@ void _write_cam(struct adapter *padapter, u8 entry, u16 ctrl, u8 *mac, u8 *key)
 void _clear_cam_entry(struct adapter *padapter, u8 entry)
 {
 	unsigned char null_sta[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
-	unsigned char null_key[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
+	unsigned char null_key[16] = {0};
 
 	_write_cam(padapter, entry, 0, null_sta, null_key);
 }
@@ -570,62 +581,74 @@ s16 rtw_camid_alloc(struct adapter *adapter, struct sta_info *sta, u8 kid)
 
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
@@ -1135,9 +1158,14 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
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
@@ -1153,7 +1181,12 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 
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
@@ -1161,7 +1194,12 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
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
@@ -1180,7 +1218,12 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
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
@@ -1197,7 +1240,12 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 
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
@@ -1268,11 +1316,16 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 
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
@@ -1525,7 +1578,11 @@ void update_capinfo(struct adapter *Adapter, u16 updateCap)
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
@@ -1606,9 +1663,17 @@ int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, uint var_ie_l
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
2.53.0

