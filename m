Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1A8368953
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 15:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523396; cv=none; b=D6mkV5QGRNpeg5emw9NBqND4fUiSIcI+U1CftETC+1C3Vq4VpU5wp8DtXDVVY1mcwc4RxLYr1Bd8uozJiKkqNRGsFVi8C8sV4Hy0qoNpunmsKJYYjAzDV7nZVFItXbMqm6wNpHIY7yWNc2ePHPPpS+fnsBAlLte6M1o8Um+fYXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523396; c=relaxed/simple;
	bh=WktfnNh5jGfzjSav3b5N/VVjAcmD8b6r65gdn+nqaIE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NCAoyHxL7AI4YJcK0/gOKkvxaIX9WTfW1Tg4XF4+RWcUccZgaQ9eLYlr01IrTxkwY+vySon727SSU+vWxgMaSYmNcfBPMABnI9r6Kr5KsxWdbP+R4ZI0jXkDS+nLNDmaWvA2iVVk4FVgGPF6p2x60PbQ06hb3RbDhXtazeQN3ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=N0o9DmW7; arc=none smtp.client-ip=220.197.31.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="N0o9DmW7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=CV
	BLJH7rKBv5MBPW37WAkqKOGbtV730hfHMoYmNuNmA=; b=N0o9DmW7WkP8SqvjQN
	l3jB89VpKXqrAWtTRxa+kTWigEB/xcrFp70EKF4qa5YekPWuNaxJlu55iBe+JdoD
	qUFmL+r7bOzaLUlGtzxVBMwhhKvzRryNs6qxt3Lh56bX86ZE6nP2Qoe80FTXx+Gl
	dBts5xOBtPLZDXw+B2ccJt4dc=
Received: from jax-virtual-machine.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PykvCgDnz2MqaE5qmk9uCg--.53577S4;
	Wed, 08 Jul 2026 23:09:37 +0800 (CST)
From: Jinke Wu <coolbeaner@126.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	coolbeaner@126.com
Subject: [PATCH v3 2/5] staging: rtl8723bs: fix line length and alignment in rtw_mlme_ext
Date: Wed,  8 Jul 2026 23:09:25 +0800
Message-Id: <20260708150928.74065-3-coolbeaner@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708150928.74065-1-coolbeaner@126.com>
References: <20260708150928.74065-1-coolbeaner@126.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PykvCgDnz2MqaE5qmk9uCg--.53577S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxtF13Zw1DJw48Cw1DGry8Zrb_yoWDGr4rpF
	4vg34DGr48Wrn0yr4kZr4xXFZ3GrWrWFWxKayfta4YkFn7Ar9IqFyYyryYvws8Ar45X3WY
	kFnYgwn8uw4DCrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Ur8nOUUUUU=
X-CM-SenderInfo: hfrrzuphdqv2a6rslhhfrp/xtbBqhFUW2pOaDGEZQAA3o

Fix checkpatch.pl warnings regarding lines exceeding 100 columns and
misaligned parentheses in rtw_mlme_ext.c.

No functional change.

Signed-off-by: Jinke Wu <coolbeaner@126.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 66 +++++++++++++------
 1 file changed, 45 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index d7404a3a5e0f..2b706f1abd4f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -591,7 +591,9 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 			}
 
 			/* check the vendor of the assoc AP */
-			pmlmeinfo->assoc_AP_vendor = check_assoc_AP(pframe + sizeof(struct ieee80211_hdr_3addr), len - sizeof(struct ieee80211_hdr_3addr));
+			pmlmeinfo->assoc_AP_vendor =
+				check_assoc_AP(pframe + sizeof(struct ieee80211_hdr_3addr),
+					       len - sizeof(struct ieee80211_hdr_3addr));
 
 			/* update TSF Value */
 			update_TSF(pmlmeext, pframe, len);
@@ -610,7 +612,8 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 			return _SUCCESS;
 		}
 
-		if (((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE) && (pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS)) {
+		if (((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE) &&
+		    (pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS)) {
 			psta = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
 			if (psta) {
 				ret = rtw_check_bcn_info(padapter, pframe, len);
@@ -1049,12 +1052,14 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		wpa_ie = elems.rsn_ie;
 		wpa_ie_len = elems.rsn_ie_len;
 
-		if (rtw_parse_wpa2_ie(wpa_ie - 2, wpa_ie_len + 2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
+		if (rtw_parse_wpa2_ie(wpa_ie - 2, wpa_ie_len + 2, &group_cipher,
+				      &pairwise_cipher, NULL) == _SUCCESS) {
 			pstat->dot8021xalg = 1;/* psk,  todo:802.1x */
 			pstat->wpa_psk |= BIT(1);
 
 			pstat->wpa2_group_cipher = group_cipher & psecuritypriv->wpa2_group_cipher;
-			pstat->wpa2_pairwise_cipher = pairwise_cipher & psecuritypriv->wpa2_pairwise_cipher;
+			pstat->wpa2_pairwise_cipher = pairwise_cipher &
+				psecuritypriv->wpa2_pairwise_cipher;
 
 			if (!pstat->wpa2_group_cipher)
 				status = WLAN_STATUS_INVALID_GROUP_CIPHER;
@@ -1071,12 +1076,14 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		wpa_ie = elems.wpa_ie;
 		wpa_ie_len = elems.wpa_ie_len;
 
-		if (rtw_parse_wpa_ie(wpa_ie - 2, wpa_ie_len + 2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
+		if (rtw_parse_wpa_ie(wpa_ie - 2, wpa_ie_len + 2, &group_cipher,
+				     &pairwise_cipher, NULL) == _SUCCESS) {
 			pstat->dot8021xalg = 1;/* psk,  todo:802.1x */
 			pstat->wpa_psk |= BIT(0);
 
 			pstat->wpa_group_cipher = group_cipher & psecuritypriv->wpa_group_cipher;
-			pstat->wpa_pairwise_cipher = pairwise_cipher & psecuritypriv->wpa_pairwise_cipher;
+			pstat->wpa_pairwise_cipher = pairwise_cipher &
+				psecuritypriv->wpa_pairwise_cipher;
 
 			if (!pstat->wpa_group_cipher)
 				status = WLAN_STATUS_INVALID_GROUP_CIPHER;
@@ -1105,8 +1112,8 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 		/*  AP support WPA/RSN, and sta is going to do WPS, but AP is not ready */
 		/*  that the selected registrar of AP is _FLASE */
-		if ((psecuritypriv->wpa_psk > 0)
-			&& (pstat->flags & (WLAN_STA_WPS | WLAN_STA_MAYBE_WPS))) {
+		if ((psecuritypriv->wpa_psk > 0) &&
+		    (pstat->flags & (WLAN_STA_WPS | WLAN_STA_MAYBE_WPS))) {
 			if (pmlmepriv->wps_beacon_ie) {
 				u8 selected_registrar = 0;
 
@@ -2106,8 +2113,12 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 			uint wps_ielen;
 			u8 sr = 0;
 
-			wps_ie = rtw_get_wps_ie(pmgntframe->buf_addr + TXDESC_OFFSET + sizeof(struct ieee80211_hdr_3addr) + _BEACON_IE_OFFSET_,
-				pattrib->pktlen - sizeof(struct ieee80211_hdr_3addr) - _BEACON_IE_OFFSET_, NULL, &wps_ielen);
+			wps_ie = rtw_get_wps_ie(pmgntframe->buf_addr + TXDESC_OFFSET +
+						sizeof(struct ieee80211_hdr_3addr) +
+						_BEACON_IE_OFFSET_,
+						pattrib->pktlen -
+						sizeof(struct ieee80211_hdr_3addr) -
+						_BEACON_IE_OFFSET_, NULL, &wps_ielen);
 			if (wps_ie && wps_ielen > 0)
 				rtw_get_wps_attr_content(wps_ie,  wps_ielen, WPS_ATTR_SELECTED_REGISTRAR, (u8 *)(&sr), NULL);
 			if (sr != 0)
@@ -2240,7 +2251,9 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 		return;
 
 	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE) {
-		pwps_ie = rtw_get_wps_ie(cur_network->ies + _FIXED_IE_LENGTH_, cur_network->ie_length - _FIXED_IE_LENGTH_, NULL, &wps_ielen);
+		pwps_ie = rtw_get_wps_ie(cur_network->ies + _FIXED_IE_LENGTH_,
+					 cur_network->ie_length - _FIXED_IE_LENGTH_,
+					 NULL, &wps_ielen);
 
 		/* inerset & update wps_probe_resp_ie */
 		if (pmlmepriv->wps_probe_resp_ie && pwps_ie && wps_ielen > 0) {
@@ -2281,14 +2294,15 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 			signed int ssid_ielen;
 			signed int ssid_ielen_diff;
 			u8 *buf;
-			u8 *ies = pmgntframe->buf_addr + TXDESC_OFFSET + sizeof(struct ieee80211_hdr_3addr);
+			u8 *ies = pmgntframe->buf_addr + TXDESC_OFFSET +
+				sizeof(struct ieee80211_hdr_3addr);
 
 			buf = kzalloc(MAX_IE_SZ, GFP_ATOMIC);
 			if (!buf)
 				return;
 
 			ssid_ie = rtw_get_ie(ies + _FIXED_IE_LENGTH_, WLAN_EID_SSID, &ssid_ielen,
-				(pframe - ies) - _FIXED_IE_LENGTH_);
+					     (pframe - ies) - _FIXED_IE_LENGTH_);
 
 			ssid_ielen_diff = cur_network->ssid.ssid_length - ssid_ielen;
 
@@ -2309,7 +2323,8 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 				memcpy(buf, remainder_ie, remainder_ielen);
 				memcpy(remainder_ie + ssid_ielen_diff, buf, remainder_ielen);
 				*(ssid_ie + 1) = cur_network->ssid.ssid_length;
-				memcpy(ssid_ie + 2, cur_network->ssid.ssid, cur_network->ssid.ssid_length);
+				memcpy(ssid_ie + 2, cur_network->ssid.ssid,
+				       cur_network->ssid.ssid_length);
 
 				pframe += ssid_ielen_diff;
 				pattrib->pktlen += ssid_ielen_diff;
@@ -2687,7 +2702,8 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, pstat->bssratelen, pstat->bssrateset, &(pattrib->pktlen));
 	} else {
 		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, 8, pstat->bssrateset, &(pattrib->pktlen));
-		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (pstat->bssratelen - 8), pstat->bssrateset + 8, &(pattrib->pktlen));
+		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (pstat->bssratelen - 8),
+				    pstat->bssrateset + 8, &(pattrib->pktlen));
 	}
 
 	if ((pstat->flags & WLAN_STA_HT) && (pmlmepriv->htpriv.ht_option)) {
@@ -3638,7 +3654,8 @@ unsigned int send_delba(struct adapter *padapter, u8 initiator, u8 *addr)
 	if (initiator == 0) {/*  recipient */
 		for (tid = 0; tid < MAXTID; tid++) {
 			if (psta->recvreorder_ctrl[tid].enable) {
-				issue_action_BA(padapter, addr, WLAN_ACTION_DELBA, (((tid << 1) | initiator) & 0x1F));
+				issue_action_BA(padapter, addr, WLAN_ACTION_DELBA,
+						(((tid << 1) | initiator) & 0x1F));
 				psta->recvreorder_ctrl[tid].enable = false;
 				psta->recvreorder_ctrl[tid].indicate_seq = 0xffff;
 			}
@@ -3646,7 +3663,8 @@ unsigned int send_delba(struct adapter *padapter, u8 initiator, u8 *addr)
 	} else if (initiator == 1) {/*  originator */
 		for (tid = 0; tid < MAXTID; tid++) {
 			if (psta->htpriv.agg_enable_bitmap & BIT(tid)) {
-				issue_action_BA(padapter, addr, WLAN_ACTION_DELBA, (((tid << 1) | initiator) & 0x1F));
+				issue_action_BA(padapter, addr, WLAN_ACTION_DELBA,
+						(((tid << 1) | initiator) & 0x1F));
 				psta->htpriv.agg_enable_bitmap &= ~BIT(tid);
 				psta->htpriv.candidate_tid_bitmap &= ~BIT(tid);
 			}
@@ -3671,7 +3689,9 @@ unsigned int send_beacon(struct adapter *padapter)
 			cond_resched();
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bxmitok));
 			poll++;
-		} while ((poll % 10) != 0 && false == bxmitok && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+		} while ((poll % 10) != 0 && false == bxmitok &&
+			 !padapter->bSurpriseRemoved &&
+			 !padapter->bDriverStopped);
 
 	} while (false == bxmitok && issue < 100 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
 
@@ -4550,7 +4570,9 @@ void update_sta_info(struct adapter *padapter, struct sta_info *psta)
 
 		psta->htpriv.ampdu_enable = pmlmepriv->htpriv.ampdu_enable;
 
-		psta->htpriv.rx_ampdu_min_spacing = (pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & IEEE80211_HT_CAP_AMPDU_DENSITY) >> 2;
+		psta->htpriv.rx_ampdu_min_spacing =
+			(pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para &
+			 IEEE80211_HT_CAP_AMPDU_DENSITY) >> 2;
 
 		if (support_short_GI(padapter, &(pmlmeinfo->HT_caps), CHANNEL_WIDTH_20))
 			psta->htpriv.sgi_20m = true;
@@ -5273,9 +5295,11 @@ u8 disconnect_hdl(struct adapter *padapter, unsigned char *pbuf)
 	u8 val8;
 
 	if (is_client_associated_to_ap(padapter))
-		issue_deauth_ex(padapter, pnetwork->mac_address, WLAN_REASON_DEAUTH_LEAVING, param->deauth_timeout_ms / 100, 100);
+		issue_deauth_ex(padapter, pnetwork->mac_address, WLAN_REASON_DEAUTH_LEAVING,
+				param->deauth_timeout_ms / 100, 100);
 
-	if (((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) || ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)) {
+	if (((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) ||
+	    ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)) {
 		/* Stop BCN */
 		val8 = 0;
 		rtw_hal_set_hwreg(padapter, HW_VAR_BCN_FUNC, (u8 *)(&val8));
-- 
2.34.1

