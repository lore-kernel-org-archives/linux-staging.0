Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEF8438478
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 17:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783444514; cv=none; b=NQZntB2Kyr0iI5/laLGISPNlartPuLnkpiCi1l8CzkGPGd7cmQVG1YQDWwEml2M5EzqZOl/xdJoDhTTs6mj450KEQDUH3Q8bTpyVfgr2JOc4rQIbZQ1rkuBYxhbHVRvOIygsPinAHo+fGkfJ6i6qJzs6OuWFldRmCcUBxyiJUHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783444514; c=relaxed/simple;
	bh=Y0PTofG/A5cESuSzFfA+/lddNJ9GGi67jWhBo4CuklI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MpmI17ncQw9CX7m53N0Ht1hgVE0IPPhmjrxEWT6ltVKYv1zgZbcxaGjAz1+4EGef0280Ee4YN37alrWqDvjohkMIm5+jGrp+G010W0tljpxZAFgULryOsc7biZ/hk53ZLnqcPacDQ3LtplMOVbTf2ZnO07thEIHKLhBVqJUhT1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=pOBRuH89; arc=none smtp.client-ip=117.135.210.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="pOBRuH89"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=DE
	EYwmii546zXWPotmFANvXJWV3eXh5TA26/shqGYxk=; b=pOBRuH89pBMJ4w1DT+
	spvJ8SEi3m3gv1krYohgHGtacwWungV/btIWHg490DbRZ3DvlDVBIUKpmW5NqOAP
	ETGBMxCOVLHQsw5onLhhU8loYN1milgXt7xO2ztCy6ZFCMwZwvHF3TQ5nGsplQjl
	0pFTvX4TlC1kHsAzl2xN3QN+c=
Received: from jax-virtual-machine.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnz8cMNE1qRiRvCw--.53372S3;
	Wed, 08 Jul 2026 01:14:58 +0800 (CST)
From: Jinke Wu <coolbeaner@126.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	coolbeaner@126.com
Subject: [PATCH v2 1/5] staging: rtl8723bs: fix operator spacing in rtw_mlme_ext
Date: Wed,  8 Jul 2026 01:14:46 +0800
Message-Id: <20260707171450.70997-2-coolbeaner@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707171450.70997-1-coolbeaner@126.com>
References: <20260707171450.70997-1-coolbeaner@126.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnz8cMNE1qRiRvCw--.53372S3
X-Coremail-Antispam: 1Uf129KBjvAXoWfXF4UKFW5Jr48tF47JFykuFg_yoW5WF13Wo
	WIk39xtw48W3yUt348KFy0kr9xur4rKry3Cws3uwn8Xw47C3Wjvry3A3W5Was2qF10qF9F
	va1SvrWqqF1ktFWfn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RW5l8DUUUU
X-CM-SenderInfo: hfrrzuphdqv2a6rslhhfrp/xtbBqhP+BmpNNBPvzgAA3g

Fix checkpatch.pl warnings regarding preferred spaces around
operators in rtw_mlme_ext.c

No functional change.

Signed-off-by: Jinke Wu <coolbeaner@126.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 200 +++++++++---------
 1 file changed, 100 insertions(+), 100 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index a86d6f97cf02..bf41187e66a0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -324,7 +324,7 @@ static u8 init_channel_set(struct adapter *padapter, u8 ChannelPlan, struct rt_c
 	u8 b2_4GBand = false;
 	u8 Index2G = 0;
 
-	memset(channel_set, 0, sizeof(struct rt_channel_info)*MAX_CHANNEL_NUM);
+	memset(channel_set, 0, sizeof(struct rt_channel_info) * MAX_CHANNEL_NUM);
 
 	if (ChannelPlan >= RT_CHANNEL_DOMAIN_MAX && ChannelPlan != RT_CHANNEL_DOMAIN_REALTEK_DEFINE)
 		return chanset_size;
@@ -519,7 +519,7 @@ unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame)
 		if (is_valid_p2p_probereq)
 			goto _issue_probersp;
 
-		if ((ielen != 0 && false == !memcmp((p+2), cur->ssid.ssid, cur->ssid.ssid_length))
+		if ((ielen != 0 && false == !memcmp((p + 2), cur->ssid.ssid, cur->ssid.ssid_length))
 			|| (ielen == 0 && pmlmeinfo->hidden_ssid_mode)
 		)
 			return _SUCCESS;
@@ -588,7 +588,7 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 			}
 
 			/* check the vendor of the assoc AP */
-			pmlmeinfo->assoc_AP_vendor = check_assoc_AP(pframe+sizeof(struct ieee80211_hdr_3addr), len-sizeof(struct ieee80211_hdr_3addr));
+			pmlmeinfo->assoc_AP_vendor = check_assoc_AP(pframe + sizeof(struct ieee80211_hdr_3addr), len - sizeof(struct ieee80211_hdr_3addr));
 
 			/* update TSF Value */
 			update_TSF(pmlmeext, pframe, len);
@@ -607,7 +607,7 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 			return _SUCCESS;
 		}
 
-		if (((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE) && (pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS)) {
+		if (((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE) && (pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS)) {
 			psta = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
 			if (psta) {
 				ret = rtw_check_bcn_info(padapter, pframe, len);
@@ -625,7 +625,7 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 
 				adaptive_early_32k(pmlmeext, pframe, len);
 			}
-		} else if ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) {
+		} else if ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) {
 			psta = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
 			if (psta) {
 				/* update WMM, ERP in the beacon */
@@ -674,7 +674,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	uint len = precv_frame->u.hdr.len;
 	u8 offset = 0;
 
-	if ((pmlmeinfo->state&0x03) != WIFI_FW_AP_STATE)
+	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
 		return _FAIL;
 
 	sa = GetAddr2Ptr(pframe);
@@ -688,8 +688,8 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 		prxattrib->hdrlen = WLAN_HDR_A3_LEN;
 		prxattrib->encrypt = _WEP40_;
 
-		iv = pframe+prxattrib->hdrlen;
-		prxattrib->key_index = ((iv[3]>>6)&0x3);
+		iv = pframe + prxattrib->hdrlen;
+		prxattrib->key_index = ((iv[3] >> 6) & 0x3);
 
 		prxattrib->iv_len = 4;
 		prxattrib->icv_len = 4;
@@ -930,7 +930,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 	uint pkt_len = precv_frame->u.hdr.len;
 
-	if ((pmlmeinfo->state&0x03) != WIFI_FW_AP_STATE)
+	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
 		return _FAIL;
 
 	frame_type = GetFrameSubType(pframe);
@@ -988,7 +988,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		goto OnAssocReqFail;
 	} else {
 		/*  check if ssid match */
-		if (memcmp(p+2, cur->ssid.ssid, cur->ssid.ssid_length))
+		if (memcmp(p + 2, cur->ssid.ssid, cur->ssid.ssid_length))
 			status = WLAN_STATUS_CHALLENGE_FAIL;
 
 		if (ie_len != cur->ssid.ssid_length)
@@ -1011,7 +1011,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		if (ie_len > sizeof(supportRate))
 			ie_len = sizeof(supportRate);
 
-		memcpy(supportRate, p+2, ie_len);
+		memcpy(supportRate, p + 2, ie_len);
 		support_rate_num = ie_len;
 
 		p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + ie_offset, WLAN_EID_EXT_SUPP_RATES, &ie_len,
@@ -1046,12 +1046,12 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		wpa_ie = elems.rsn_ie;
 		wpa_ie_len = elems.rsn_ie_len;
 
-		if (rtw_parse_wpa2_ie(wpa_ie-2, wpa_ie_len+2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
+		if (rtw_parse_wpa2_ie(wpa_ie - 2, wpa_ie_len + 2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
 			pstat->dot8021xalg = 1;/* psk,  todo:802.1x */
 			pstat->wpa_psk |= BIT(1);
 
-			pstat->wpa2_group_cipher = group_cipher&psecuritypriv->wpa2_group_cipher;
-			pstat->wpa2_pairwise_cipher = pairwise_cipher&psecuritypriv->wpa2_pairwise_cipher;
+			pstat->wpa2_group_cipher = group_cipher & psecuritypriv->wpa2_group_cipher;
+			pstat->wpa2_pairwise_cipher = pairwise_cipher & psecuritypriv->wpa2_pairwise_cipher;
 
 			if (!pstat->wpa2_group_cipher)
 				status = WLAN_STATUS_INVALID_GROUP_CIPHER;
@@ -1068,12 +1068,12 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		wpa_ie = elems.wpa_ie;
 		wpa_ie_len = elems.wpa_ie_len;
 
-		if (rtw_parse_wpa_ie(wpa_ie-2, wpa_ie_len+2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
+		if (rtw_parse_wpa_ie(wpa_ie - 2, wpa_ie_len + 2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
 			pstat->dot8021xalg = 1;/* psk,  todo:802.1x */
 			pstat->wpa_psk |= BIT(0);
 
-			pstat->wpa_group_cipher = group_cipher&psecuritypriv->wpa_group_cipher;
-			pstat->wpa_pairwise_cipher = pairwise_cipher&psecuritypriv->wpa_pairwise_cipher;
+			pstat->wpa_group_cipher = group_cipher & psecuritypriv->wpa_group_cipher;
+			pstat->wpa_pairwise_cipher = pairwise_cipher & psecuritypriv->wpa_pairwise_cipher;
 
 			if (!pstat->wpa_group_cipher)
 				status = WLAN_STATUS_INVALID_GROUP_CIPHER;
@@ -1103,7 +1103,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		/*  AP support WPA/RSN, and sta is going to do WPS, but AP is not ready */
 		/*  that the selected registrar of AP is _FLASE */
 		if ((psecuritypriv->wpa_psk > 0)
-			&& (pstat->flags & (WLAN_STA_WPS|WLAN_STA_MAYBE_WPS))) {
+			&& (pstat->flags & (WLAN_STA_WPS | WLAN_STA_MAYBE_WPS))) {
 			if (pmlmepriv->wps_beacon_ie) {
 				u8 selected_registrar = 0;
 
@@ -1134,7 +1134,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		}
 
 		if (copy_len > 0)
-			memcpy(pstat->wpa_ie, wpa_ie-2, copy_len);
+			memcpy(pstat->wpa_ie, wpa_ie - 2, copy_len);
 	}
 
 	/*  check if there is WMM IE & support WWM-PS */
@@ -1153,7 +1153,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 			if (!p)
 				break;
 
-			if (memcmp(p+2, WMM_IE, 6)) {
+			if (memcmp(p + 2, WMM_IE, 6)) {
 				p = p + ie_len + 2;
 				continue;
 			}
@@ -1161,33 +1161,33 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 			pstat->flags |= WLAN_STA_WME;
 
 			pstat->qos_option = 1;
-			pstat->qos_info = *(p+8);
+			pstat->qos_info = *(p + 8);
 
-			pstat->max_sp_len = (pstat->qos_info>>5)&0x3;
+			pstat->max_sp_len = (pstat->qos_info >> 5) & 0x3;
 
-			if ((pstat->qos_info&0xf) != 0xf)
+			if ((pstat->qos_info & 0xf) != 0xf)
 				pstat->has_legacy_ac = true;
 			else
 				pstat->has_legacy_ac = false;
 
-			if (pstat->qos_info&0xf) {
-				if (pstat->qos_info&BIT(0))
-					pstat->uapsd_vo = BIT(0)|BIT(1);
+			if (pstat->qos_info & 0xf) {
+				if (pstat->qos_info & BIT(0))
+					pstat->uapsd_vo = BIT(0) | BIT(1);
 				else
 					pstat->uapsd_vo = 0;
 
-				if (pstat->qos_info&BIT(1))
-					pstat->uapsd_vi = BIT(0)|BIT(1);
+				if (pstat->qos_info & BIT(1))
+					pstat->uapsd_vi = BIT(0) | BIT(1);
 				else
 					pstat->uapsd_vi = 0;
 
-				if (pstat->qos_info&BIT(2))
-					pstat->uapsd_bk = BIT(0)|BIT(1);
+				if (pstat->qos_info & BIT(2))
+					pstat->uapsd_bk = BIT(0) | BIT(1);
 				else
 					pstat->uapsd_bk = 0;
 
-				if (pstat->qos_info&BIT(3))
-					pstat->uapsd_be = BIT(0)|BIT(1);
+				if (pstat->qos_info & BIT(3))
+					pstat->uapsd_be = BIT(0) | BIT(1);
 				else
 					pstat->uapsd_be = 0;
 			}
@@ -1208,14 +1208,14 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	} else
 		pstat->flags &= ~WLAN_STA_HT;
 
-	if (!pmlmepriv->htpriv.ht_option && (pstat->flags&WLAN_STA_HT)) {
+	if (!pmlmepriv->htpriv.ht_option && (pstat->flags & WLAN_STA_HT)) {
 		status = WLAN_STATUS_CHALLENGE_FAIL;
 		goto OnAssocReqFail;
 	}
 
 	if ((pstat->flags & WLAN_STA_HT) &&
-		    ((pstat->wpa2_pairwise_cipher&WPA_CIPHER_TKIP) ||
-		      (pstat->wpa_pairwise_cipher&WPA_CIPHER_TKIP))) {
+		    ((pstat->wpa2_pairwise_cipher & WPA_CIPHER_TKIP) ||
+		      (pstat->wpa_pairwise_cipher & WPA_CIPHER_TKIP))) {
 		/* status = WLAN_STATUS_CIPHER_SUITE_REJECTED; */
 		/* goto OnAssocReqFail; */
 	}
@@ -1359,7 +1359,7 @@ unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame)
 	pmlmeinfo->slotTime = (pmlmeinfo->capability & BIT(10)) ? 9 : 20;
 
 	/* AID */
-	res = pmlmeinfo->aid = (int)(le16_to_cpu(*(__le16 *)(pframe + WLAN_HDR_A3_LEN + 4))&0x3fff);
+	res = pmlmeinfo->aid = (int)(le16_to_cpu(*(__le16 *)(pframe + WLAN_HDR_A3_LEN + 4)) & 0x3fff);
 
 	/* following are moved to join event callback function */
 	/* to handle HT, WMM, rate adaptive, update MAC reg */
@@ -1587,7 +1587,7 @@ unsigned int OnAction_back(struct adapter *padapter, union recv_frame *precv_fra
 	if (memcmp(myid(&(padapter->eeprompriv)), GetAddr1Ptr(pframe), ETH_ALEN))/* for if1, sta/ap mode */
 		return _SUCCESS;
 
-	if ((pmlmeinfo->state&0x03) != WIFI_FW_AP_STATE)
+	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
 		if (!(pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS))
 			return _SUCCESS;
 
@@ -1667,7 +1667,7 @@ static s32 rtw_action_public_decache(union recv_frame *recv_frame, s32 token)
 	struct adapter *adapter = recv_frame->u.hdr.adapter;
 	struct mlme_ext_priv *mlmeext = &(adapter->mlmeextpriv);
 	u8 *frame = recv_frame->u.hdr.rx_data;
-	u16 seq_ctrl = ((recv_frame->u.hdr.attrib.seq_num&0xffff) << 4) |
+	u16 seq_ctrl = ((recv_frame->u.hdr.attrib.seq_num & 0xffff) << 4) |
 		(recv_frame->u.hdr.attrib.frag_num & 0xf);
 
 	if (GetRetry(frame)) {
@@ -1803,9 +1803,9 @@ unsigned int OnAction_sa_query(struct adapter *padapter, union recv_frame *precv
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	unsigned short tid;
 
-	switch (pframe[WLAN_HDR_A3_LEN+1]) {
+	switch (pframe[WLAN_HDR_A3_LEN + 1]) {
 	case 0: /* SA Query req */
-		memcpy(&tid, &pframe[WLAN_HDR_A3_LEN+2], sizeof(unsigned short));
+		memcpy(&tid, &pframe[WLAN_HDR_A3_LEN + 2], sizeof(unsigned short));
 		issue_action_SA_Query(padapter, GetAddr2Ptr(pframe), 1, tid);
 		break;
 
@@ -2023,10 +2023,10 @@ static int update_hidden_ssid(u8 *ies, u32 ies_len, u8 hidden_ssid_mode)
 			u8 *next_ie = ssid_ie + 2 + ssid_len_ori;
 			u32 remain_len = 0;
 
-			remain_len = ies_len - (next_ie-ies);
+			remain_len = ies_len - (next_ie - ies);
 
 			ssid_ie[1] = 0;
-			memcpy(ssid_ie+2, next_ie, remain_len);
+			memcpy(ssid_ie + 2, next_ie, remain_len);
 			len_diff -= ssid_len_ori;
 
 			break;
@@ -2086,16 +2086,16 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 	pframe += sizeof(struct ieee80211_hdr_3addr);
 	pattrib->pktlen = sizeof(struct ieee80211_hdr_3addr);
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE) {
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE) {
 		{
 			int len_diff;
 
 			memcpy(pframe, cur_network->ies, cur_network->ie_length);
-			len_diff = update_hidden_ssid(pframe+_BEACON_IE_OFFSET_,
-						      cur_network->ie_length-_BEACON_IE_OFFSET_,
+			len_diff = update_hidden_ssid(pframe + _BEACON_IE_OFFSET_,
+						      cur_network->ie_length - _BEACON_IE_OFFSET_,
 						      pmlmeinfo->hidden_ssid_mode);
-			pframe += (cur_network->ie_length+len_diff);
-			pattrib->pktlen += (cur_network->ie_length+len_diff);
+			pframe += (cur_network->ie_length + len_diff);
+			pattrib->pktlen += (cur_network->ie_length + len_diff);
 		}
 
 		{
@@ -2103,8 +2103,8 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 			uint wps_ielen;
 			u8 sr = 0;
 
-			wps_ie = rtw_get_wps_ie(pmgntframe->buf_addr+TXDESC_OFFSET+sizeof(struct ieee80211_hdr_3addr)+_BEACON_IE_OFFSET_,
-				pattrib->pktlen-sizeof(struct ieee80211_hdr_3addr)-_BEACON_IE_OFFSET_, NULL, &wps_ielen);
+			wps_ie = rtw_get_wps_ie(pmgntframe->buf_addr + TXDESC_OFFSET + sizeof(struct ieee80211_hdr_3addr) + _BEACON_IE_OFFSET_,
+				pattrib->pktlen - sizeof(struct ieee80211_hdr_3addr) - _BEACON_IE_OFFSET_, NULL, &wps_ielen);
 			if (wps_ie && wps_ielen > 0)
 				rtw_get_wps_attr_content(wps_ie,  wps_ielen, WPS_ATTR_SELECTED_REGISTRAR, (u8 *)(&sr), NULL);
 			if (sr != 0)
@@ -2236,8 +2236,8 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 	if (cur_network->ie_length > MAX_IE_SZ)
 		return;
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE) {
-		pwps_ie = rtw_get_wps_ie(cur_network->ies+_FIXED_IE_LENGTH_, cur_network->ie_length-_FIXED_IE_LENGTH_, NULL, &wps_ielen);
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE) {
+		pwps_ie = rtw_get_wps_ie(cur_network->ies + _FIXED_IE_LENGTH_, cur_network->ie_length - _FIXED_IE_LENGTH_, NULL, &wps_ielen);
 
 		/* inerset & update wps_probe_resp_ie */
 		if (pmlmepriv->wps_probe_resp_ie && pwps_ie && wps_ielen > 0) {
@@ -2255,13 +2255,13 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 			pattrib->pktlen += wps_offset;
 
 			wps_ielen = (uint)pmlmepriv->wps_probe_resp_ie[1];/* to get ie data len */
-			if ((wps_offset+wps_ielen+2) <= MAX_IE_SZ) {
-				memcpy(pframe, pmlmepriv->wps_probe_resp_ie, wps_ielen+2);
-				pframe += wps_ielen+2;
-				pattrib->pktlen += wps_ielen+2;
+			if ((wps_offset + wps_ielen + 2) <= MAX_IE_SZ) {
+				memcpy(pframe, pmlmepriv->wps_probe_resp_ie, wps_ielen + 2);
+				pframe += wps_ielen + 2;
+				pattrib->pktlen += wps_ielen + 2;
 			}
 
-			if ((wps_offset+wps_ielen+2+remainder_ielen) <= MAX_IE_SZ) {
+			if ((wps_offset + wps_ielen + 2 + remainder_ielen) <= MAX_IE_SZ) {
 				memcpy(pframe, premainder_ie, remainder_ielen);
 				pframe += remainder_ielen;
 				pattrib->pktlen += remainder_ielen;
@@ -2278,14 +2278,14 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 			signed int ssid_ielen;
 			signed int ssid_ielen_diff;
 			u8 *buf;
-			u8 *ies = pmgntframe->buf_addr+TXDESC_OFFSET+sizeof(struct ieee80211_hdr_3addr);
+			u8 *ies = pmgntframe->buf_addr + TXDESC_OFFSET + sizeof(struct ieee80211_hdr_3addr);
 
 			buf = kzalloc(MAX_IE_SZ, GFP_ATOMIC);
 			if (!buf)
 				return;
 
-			ssid_ie = rtw_get_ie(ies+_FIXED_IE_LENGTH_, WLAN_EID_SSID, &ssid_ielen,
-				(pframe-ies)-_FIXED_IE_LENGTH_);
+			ssid_ie = rtw_get_ie(ies + _FIXED_IE_LENGTH_, WLAN_EID_SSID, &ssid_ielen,
+				(pframe - ies) - _FIXED_IE_LENGTH_);
 
 			ssid_ielen_diff = cur_network->ssid.ssid_length - ssid_ielen;
 
@@ -2293,8 +2293,8 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 				uint remainder_ielen;
 				u8 *remainder_ie;
 
-				remainder_ie = ssid_ie+2;
-				remainder_ielen = (pframe-remainder_ie);
+				remainder_ie = ssid_ie + 2;
+				remainder_ielen = (pframe - remainder_ie);
 
 				if (remainder_ielen > MAX_IE_SZ) {
 					netdev_warn(padapter->pnetdev,
@@ -2304,9 +2304,9 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 				}
 
 				memcpy(buf, remainder_ie, remainder_ielen);
-				memcpy(remainder_ie+ssid_ielen_diff, buf, remainder_ielen);
-				*(ssid_ie+1) = cur_network->ssid.ssid_length;
-				memcpy(ssid_ie+2, cur_network->ssid.ssid, cur_network->ssid.ssid_length);
+				memcpy(remainder_ie + ssid_ielen_diff, buf, remainder_ielen);
+				*(ssid_ie + 1) = cur_network->ssid.ssid_length;
+				memcpy(ssid_ie + 2, cur_network->ssid.ssid, cur_network->ssid.ssid_length);
 
 				pframe += ssid_ielen_diff;
 				pattrib->pktlen += ssid_ielen_diff;
@@ -2344,7 +2344,7 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 		/*  DS parameter set */
 		pframe = rtw_set_ie(pframe, WLAN_EID_DS_PARAMS, 1, (unsigned char *)&(cur_network->configuration.ds_config), &pattrib->pktlen);
 
-		if ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) {
+		if ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) {
 			u8 erpinfo = 0;
 			u32 ATIMWindow;
 			/*  IBSS Parameter Set... */
@@ -2684,7 +2684,7 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, pstat->bssratelen, pstat->bssrateset, &(pattrib->pktlen));
 	} else {
 		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, 8, pstat->bssrateset, &(pattrib->pktlen));
-		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (pstat->bssratelen-8), pstat->bssrateset+8, &(pattrib->pktlen));
+		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (pstat->bssratelen - 8), pstat->bssrateset + 8, &(pattrib->pktlen));
 	}
 
 	if ((pstat->flags & WLAN_STA_HT) && (pmlmepriv->htpriv.ht_option)) {
@@ -2694,18 +2694,18 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 		/* p = hostapd_eid_ht_capabilities_info(hapd, p); */
 		pbuf = rtw_get_ie(ie + _BEACON_IE_OFFSET_, WLAN_EID_HT_CAPABILITY, &ie_len, (pnetwork->ie_length - _BEACON_IE_OFFSET_));
 		if (pbuf && ie_len > 0) {
-			memcpy(pframe, pbuf, ie_len+2);
-			pframe += (ie_len+2);
-			pattrib->pktlen += (ie_len+2);
+			memcpy(pframe, pbuf, ie_len + 2);
+			pframe += (ie_len + 2);
+			pattrib->pktlen += (ie_len + 2);
 		}
 
 		/* FILL HT ADD INFO IE */
 		/* p = hostapd_eid_ht_operation(hapd, p); */
 		pbuf = rtw_get_ie(ie + _BEACON_IE_OFFSET_, WLAN_EID_HT_OPERATION, &ie_len, (pnetwork->ie_length - _BEACON_IE_OFFSET_));
 		if (pbuf && ie_len > 0) {
-			memcpy(pframe, pbuf, ie_len+2);
-			pframe += (ie_len+2);
-			pattrib->pktlen += (ie_len+2);
+			memcpy(pframe, pbuf, ie_len + 2);
+			pframe += (ie_len + 2);
+			pattrib->pktlen += (ie_len + 2);
 		}
 	}
 
@@ -2716,10 +2716,10 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 
 		for (pbuf = ie + _BEACON_IE_OFFSET_; ; pbuf += (ie_len + 2)) {
 			pbuf = rtw_get_ie(pbuf, WLAN_EID_VENDOR_SPECIFIC, &ie_len, (pnetwork->ie_length - _BEACON_IE_OFFSET_ - (ie_len + 2)));
-			if (pbuf && !memcmp(pbuf+2, WMM_PARA_IE, 6)) {
-				memcpy(pframe, pbuf, ie_len+2);
-				pframe += (ie_len+2);
-				pattrib->pktlen += (ie_len+2);
+			if (pbuf && !memcmp(pbuf + 2, WMM_PARA_IE, 6)) {
+				memcpy(pframe, pbuf, ie_len + 2);
+				pframe += (ie_len + 2);
+				pattrib->pktlen += (ie_len + 2);
 
 				break;
 			}
@@ -2953,9 +2953,9 @@ static int _issue_nulldata(struct adapter *padapter, unsigned char *da,
 	fctrl = &(pwlanhdr->frame_control);
 	*(fctrl) = 0;
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE)
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)
 		SetFrDs(fctrl);
-	else if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE)
+	else if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE)
 		SetToDs(fctrl);
 
 	if (power_mode)
@@ -3095,9 +3095,9 @@ static int _issue_qos_nulldata(struct adapter *padapter, unsigned char *da,
 	fctrl = &(pwlanhdr->frame_control);
 	*(fctrl) = 0;
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE)
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)
 		SetFrDs(fctrl);
-	else if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE)
+	else if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE)
 		SetToDs(fctrl);
 
 	qc = (unsigned short *)(pframe + pattrib->hdrlen - 2);
@@ -3624,7 +3624,7 @@ unsigned int send_delba(struct adapter *padapter, u8 initiator, u8 *addr)
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u16 tid;
 
-	if ((pmlmeinfo->state&0x03) != WIFI_FW_AP_STATE)
+	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
 		if (!(pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS))
 			return _SUCCESS;
 
@@ -3635,7 +3635,7 @@ unsigned int send_delba(struct adapter *padapter, u8 initiator, u8 *addr)
 	if (initiator == 0) {/*  recipient */
 		for (tid = 0; tid < MAXTID; tid++) {
 			if (psta->recvreorder_ctrl[tid].enable) {
-				issue_action_BA(padapter, addr, WLAN_ACTION_DELBA, (((tid << 1) | initiator)&0x1F));
+				issue_action_BA(padapter, addr, WLAN_ACTION_DELBA, (((tid << 1) | initiator) & 0x1F));
 				psta->recvreorder_ctrl[tid].enable = false;
 				psta->recvreorder_ctrl[tid].indicate_seq = 0xffff;
 			}
@@ -3643,7 +3643,7 @@ unsigned int send_delba(struct adapter *padapter, u8 initiator, u8 *addr)
 	} else if (initiator == 1) {/*  originator */
 		for (tid = 0; tid < MAXTID; tid++) {
 			if (psta->htpriv.agg_enable_bitmap & BIT(tid)) {
-				issue_action_BA(padapter, addr, WLAN_ACTION_DELBA, (((tid << 1) | initiator)&0x1F));
+				issue_action_BA(padapter, addr, WLAN_ACTION_DELBA, (((tid << 1) | initiator) & 0x1F));
 				psta->htpriv.agg_enable_bitmap &= ~BIT(tid);
 				psta->htpriv.candidate_tid_bitmap &= ~BIT(tid);
 			}
@@ -3668,7 +3668,7 @@ unsigned int send_beacon(struct adapter *padapter)
 			cond_resched();
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bxmitok));
 			poll++;
-		} while ((poll%10) != 0 && false == bxmitok && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+		} while ((poll % 10) != 0 && false == bxmitok && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
 
 	} while (false == bxmitok && issue < 100 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
 
@@ -3863,7 +3863,7 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 
 	p = rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_EXT_SUPP_RATES, &len, bssid->ie_length - ie_offset);
 	if (p) {
-		if (len > (NDIS_802_11_LENGTH_RATES_EX-i))
+		if (len > (NDIS_802_11_LENGTH_RATES_EX - i))
 			return _FAIL;
 
 		memcpy(bssid->supported_rates + i, (p + 2), len);
@@ -3956,7 +3956,7 @@ void start_create_ibss(struct adapter *padapter)
 	/* update capability */
 	caps = rtw_get_capability((struct wlan_bssid_ex *)pnetwork);
 	update_capinfo(padapter, caps);
-	if (caps&WLAN_CAPABILITY_IBSS) {/* adhoc master */
+	if (caps & WLAN_CAPABILITY_IBSS) {/* adhoc master */
 		val8 = 0xcf;
 		rtw_hal_set_hwreg(padapter, HW_VAR_SEC_CFG, (u8 *)(&val8));
 
@@ -4007,7 +4007,7 @@ void start_clnt_join(struct adapter *padapter)
 	/* update capability */
 	caps = rtw_get_capability((struct wlan_bssid_ex *)pnetwork);
 	update_capinfo(padapter, caps);
-	if (caps&WLAN_CAPABILITY_ESS) {
+	if (caps & WLAN_CAPABILITY_ESS) {
 		set_msr(padapter, WIFI_FW_STATION_STATE);
 
 		val8 = (pmlmeinfo->auth_algo == dot11AuthAlgrthm_8021X) ? 0xcc : 0xcf;
@@ -4031,10 +4031,10 @@ void start_clnt_join(struct adapter *padapter)
 		beacon_timeout = decide_wait_for_beacon_timeout(pmlmeinfo->bcn_interval);
 		set_link_timer(pmlmeext, beacon_timeout);
 		_set_timer(&padapter->mlmepriv.assoc_timer,
-			(REAUTH_TO * REAUTH_LIMIT) + (REASSOC_TO*REASSOC_LIMIT) + beacon_timeout);
+			(REAUTH_TO * REAUTH_LIMIT) + (REASSOC_TO * REASSOC_LIMIT) + beacon_timeout);
 
 		pmlmeinfo->state = WIFI_FW_AUTH_NULL | WIFI_FW_STATION_STATE;
-	} else if (caps&WLAN_CAPABILITY_IBSS) { /* adhoc client */
+	} else if (caps & WLAN_CAPABILITY_IBSS) { /* adhoc client */
 		set_msr(padapter, WIFI_FW_ADHOC_STATE);
 
 		val8 = 0xcf;
@@ -4096,7 +4096,7 @@ unsigned int receive_disconnect(struct adapter *padapter, unsigned char *MacAddr
 	if (!(!memcmp(MacAddr, get_my_bssid(&pmlmeinfo->network), ETH_ALEN)))
 		return _SUCCESS;
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE) {
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE) {
 		if (pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) {
 			pmlmeinfo->state = WIFI_FW_NULL_STATE;
 			report_del_sta_event(padapter, MacAddr, reason);
@@ -4157,7 +4157,7 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 				if (fcn <= 14)
 					channel = fcn + j; /*  2.4 GHz */
 				else
-					channel = fcn + j*4; /*  5 GHz */
+					channel = fcn + j * 4; /*  5 GHz */
 
 				chplan_ap.Channel[i++] = channel;
 			}
@@ -4548,7 +4548,7 @@ void update_sta_info(struct adapter *padapter, struct sta_info *psta)
 
 		psta->htpriv.ampdu_enable = pmlmepriv->htpriv.ampdu_enable;
 
-		psta->htpriv.rx_ampdu_min_spacing = (pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para&IEEE80211_HT_CAP_AMPDU_DENSITY)>>2;
+		psta->htpriv.rx_ampdu_min_spacing = (pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & IEEE80211_HT_CAP_AMPDU_DENSITY) >> 2;
 
 		if (support_short_GI(padapter, &(pmlmeinfo->HT_caps), CHANNEL_WIDTH_20))
 			psta->htpriv.sgi_20m = true;
@@ -4653,7 +4653,7 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 		return;
 	}
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE)
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE)
 		/* update bc/mc sta_info */
 		update_bmc_sta(padapter);
 
@@ -4702,7 +4702,7 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 	join_type = 2;
 	rtw_hal_set_hwreg(padapter, HW_VAR_MLME_JOIN, (u8 *)(&join_type));
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE) {
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE) {
 		/*  correcting TSF */
 		correct_TSF(padapter, pmlmeext);
 
@@ -4719,7 +4719,7 @@ void mlmeext_sta_add_event_callback(struct adapter *padapter, struct sta_info *p
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 join_type;
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) {
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) {
 		if (pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) { /* adhoc master or sta_count>1 */
 
 			/* nothing to do */
@@ -4781,7 +4781,7 @@ void _linked_info_dump(struct adapter *padapter)
 	struct dvobj_priv *pdvobj = adapter_to_dvobj(padapter);
 
 	if (padapter->bLinkInfoDump) {
-		if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE)
+		if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE)
 			rtw_hal_get_def_var(padapter,
 					    HAL_DEF_UNDERCORATEDSMOOTHEDPWDB,
 					    &UndecoratedSmoothedPWDB);
@@ -5271,9 +5271,9 @@ u8 disconnect_hdl(struct adapter *padapter, unsigned char *pbuf)
 	u8 val8;
 
 	if (is_client_associated_to_ap(padapter))
-		issue_deauth_ex(padapter, pnetwork->mac_address, WLAN_REASON_DEAUTH_LEAVING, param->deauth_timeout_ms/100, 100);
+		issue_deauth_ex(padapter, pnetwork->mac_address, WLAN_REASON_DEAUTH_LEAVING, param->deauth_timeout_ms / 100, 100);
 
-	if (((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) || ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE)) {
+	if (((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) || ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)) {
 		/* Stop BCN */
 		val8 = 0;
 		rtw_hal_set_hwreg(padapter, HW_VAR_BCN_FUNC, (u8 *)(&val8));
@@ -5294,7 +5294,7 @@ static int rtw_scan_ch_decision(struct adapter *padapter, struct rtw_ieee80211_c
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 
 	/* clear first */
-	memset(out, 0, sizeof(struct rtw_ieee80211_channel)*out_num);
+	memset(out, 0, sizeof(struct rtw_ieee80211_channel) * out_num);
 
 	/* acquire channels from in */
 	j = 0;
@@ -5533,7 +5533,7 @@ u8 add_ba_hdl(struct adapter *padapter, unsigned char *pbuf)
 		return	H2C_SUCCESS;
 
 	if (((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && (pmlmeinfo->HT_enable)) ||
-		((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE)) {
+		((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)) {
 		/* pmlmeinfo->ADDBA_retry_count = 0; */
 		/* pmlmeinfo->candidate_tid_bitmap |= (0x1 << pparm->tid); */
 		/* psta->htpriv.candidate_tid_bitmap |= BIT(pparm->tid); */
-- 
2.34.1

