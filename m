Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111602475E3
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 20:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783542640; cv=none; b=joEuLbq5IdboQ3pGWyHnueRiPlOcnQ7IFSb0h9GbT5iTPB8wFVu0RISSXuZ7KfDcVm28cDzwnv7zTPb6d1MeMXbCsMYmtKAcEuCDVS1meKpjd90zWZ41IraDpt0hDNcRMrTXRRdr33PBL9+Gbn1o5Fm8Tgb6YGDQsPwbwJeB6ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783542640; c=relaxed/simple;
	bh=WrNRQxY7AipyMhqInw3zTp+EXasUkjfzZIvsYQsQIvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YbmUPSYCsmzCRYVze6F6Kk6qF0Oodi511lrLR4Ju15OrlCBHSdHLXfZfYOA8NEXnMQtY5g3TamPa1QktzmaDMpA4pBj8mIWghgHEFGFHhZE5N7WdyUVQGmeG4E52P/M5W7Je7FpdJDobvbnn0WuEMKJsPZTYKcYAng1ZfcaGkmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PW3mOf/3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PW3mOf/3"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so8570105e9.0
        for <linux-staging@lists.linux.dev>; Wed, 08 Jul 2026 13:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783542629; x=1784147429; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qMn5OubbXTVSZbj8cKdiiA+f4Esko5ewMzDFyrbajrI=;
        b=PW3mOf/3GOpkWtflGu1V/rItJ8Tg7KpfADF1T/g0R3Je+EK8ry9Ha9KnOG7gbVRRuC
         25hktIL/qLXiVEgFqEyVOX9Zcf1ZbGJXfucykeVoaIIQPQ250KdcUVrOqhZzBHaRrURC
         4CnrUUY9bz877nHwdIa6QOzHc8DZMI/w8LoJdot/V0UiYitDYD2ZQyHRMkOyTJVKL9us
         qAD/Zb5EkZDleLCopsMKcwIjwtxa3V7PmaHhonrw90DgwON7lgya9ADdh9COIa2+OLWJ
         THX7uVozgWrbk5zIuGX3OFqVOiP0CfX/RR+UGHN+QAfQJksLh4KKfuj7Rhwh2e28yhL4
         q7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783542629; x=1784147429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qMn5OubbXTVSZbj8cKdiiA+f4Esko5ewMzDFyrbajrI=;
        b=gk8gg9vt35EVvTbWeG1eR8kSAeHOMsq9SHYcF0cKepSnlrFprzAN+I0PNw7B2ocsHO
         4kzLaWO42853DksH4UDtkAg1fvr63Gc4fs6pmkQ1TpWkDgVQOEPc9IYG1I+8A99T1NeD
         0mNgij/M3TZabvYvlubbDAv6xlxzEJKLeihpLPHVaurdbNayWI2PKd7bP1yUw5D4Gza1
         /SB36SscCjss7CtGO3pmx8d5Yg14UehWzhVvCXTyY2WRiBJEyxXRutnVXDRcke6udZia
         DlSAPkSnGKIOmCHTqNQ0HkhkrkkLom/TXySnUyhmKl7tfB2D4L6bFPoh/kVqwZK4yQit
         AFdg==
X-Gm-Message-State: AOJu0YxDxUKZduI468Dln3tPJHtferxuIVW7YXIZwUJxdhunKRtmH5+L
	nRWA4tykHICyGCdXfPWFTU+9RbTTliAFEhhI5aJXEZK/xiBK3WoemTwG
X-Gm-Gg: AfdE7ck7lxvMuxoRkiDJgR7jkqI+BbCXqh/YwhKKdyHNVBSwxEvIltRlNX6wmavLhLn
	zS7lb7z3J1W0TTNFox9we3OACOCeFcNDlGTEKsqvpujnOz6BsV7ECXF0f1C4xAG/cFXlGK3UQGg
	CrF2/h0aPFdKG8ajciJlVg9iwLkwDmF2daTyGeIi4880HfPhwiOYpyMGFkI9lwnTh8WLqvncZ3a
	nkqg6CPN7ieSUdWWUAWHNOrUPnzdjgcSAVkFDlARetT7ZbFqx8hUx4gstXgnX+hz/TIp0nI/7cG
	iw730pX9hddn9DbrbYvfvVawFl9KINGHsqE36YxhvdbFDYkkB1BITQ0dOUufwivmEtOxuAgnS0n
	RvGPlcM+k0xy8U94VCSF+Me5irxWEhHIKHQ7vbaQcW98pUUKY2pET1FvnEOYrD3KhVjQAunVX+j
	M8/n0mIJvNzVg4NwrLPNZFYjWrejV6ZW0RWQ41YQWtPL/W27Mn+uNnVRJ6DvY3AZDeT8lkZ9Fj+
	SYOpw==
X-Received: by 2002:a05:600c:528c:b0:493:d21f:8f98 with SMTP id 5b1f17b1804b1-493e68de964mr41332605e9.36.1783542629241;
        Wed, 08 Jul 2026 13:30:29 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d4f9fsm4655155e9.4.2026.07.08.13.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 13:30:28 -0700 (PDT)
From: fliegbert2@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: spaces preferred fix
Date: Wed,  8 Jul 2026 20:28:26 +0000
Message-ID: <20260708202826.3099-1-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <ajUOSj9A8AUxNZQC@koolguy>
References: <ajUOSj9A8AUxNZQC@koolguy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>

Adding spaces around operators to match kernel coding style.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
- Rebased onto latest staging-testing

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 194 +++++++++---------
 1 file changed, 97 insertions(+), 97 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 128213c97a61..7a3fdc903aad 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -591,7 +591,7 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 			}
 
 			/* check the vendor of the assoc AP */
-			pmlmeinfo->assoc_AP_vendor = check_assoc_AP(pframe+sizeof(struct ieee80211_hdr_3addr), len-sizeof(struct ieee80211_hdr_3addr));
+			pmlmeinfo->assoc_AP_vendor = check_assoc_AP(pframe + sizeof(struct ieee80211_hdr_3addr), len - sizeof(struct ieee80211_hdr_3addr));
 
 			/* update TSF Value */
 			update_TSF(pmlmeext, pframe, len);
@@ -610,7 +610,7 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 			return _SUCCESS;
 		}
 
-		if (((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE) && (pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS)) {
+		if (((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE) && (pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS)) {
 			psta = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
 			if (psta) {
 				ret = rtw_check_bcn_info(padapter, pframe, len);
@@ -628,7 +628,7 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 
 				adaptive_early_32k(pmlmeext, pframe, len);
 			}
-		} else if ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) {
+		} else if ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) {
 			psta = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
 			if (psta) {
 				/* update WMM, ERP in the beacon */
@@ -677,7 +677,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	uint len = precv_frame->u.hdr.len;
 	u8 offset = 0;
 
-	if ((pmlmeinfo->state&0x03) != WIFI_FW_AP_STATE)
+	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
 		return _FAIL;
 
 	sa = GetAddr2Ptr(pframe);
@@ -691,8 +691,8 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 		prxattrib->hdrlen = WLAN_HDR_A3_LEN;
 		prxattrib->encrypt = _WEP40_;
 
-		iv = pframe+prxattrib->hdrlen;
-		prxattrib->key_index = ((iv[3]>>6)&0x3);
+		iv = pframe + prxattrib->hdrlen;
+		prxattrib->key_index = ((iv[3] >> 6) & 0x3);
 
 		prxattrib->iv_len = 4;
 		prxattrib->icv_len = 4;
@@ -933,7 +933,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 	uint pkt_len = precv_frame->u.hdr.len;
 
-	if ((pmlmeinfo->state&0x03) != WIFI_FW_AP_STATE)
+	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
 		return _FAIL;
 
 	frame_type = GetFrameSubType(pframe);
@@ -991,7 +991,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		goto OnAssocReqFail;
 	} else {
 		/*  check if ssid match */
-		if (memcmp(p+2, cur->ssid.ssid, cur->ssid.ssid_length))
+		if (memcmp(p + 2, cur->ssid.ssid, cur->ssid.ssid_length))
 			status = WLAN_STATUS_CHALLENGE_FAIL;
 
 		if (ie_len != cur->ssid.ssid_length)
@@ -1014,7 +1014,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		if (ie_len > sizeof(supportRate))
 			ie_len = sizeof(supportRate);
 
-		memcpy(supportRate, p+2, ie_len);
+		memcpy(supportRate, p + 2, ie_len);
 		support_rate_num = ie_len;
 
 		p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + ie_offset, WLAN_EID_EXT_SUPP_RATES, &ie_len,
@@ -1049,12 +1049,12 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
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
@@ -1071,12 +1071,12 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
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
@@ -1106,7 +1106,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		/*  AP support WPA/RSN, and sta is going to do WPS, but AP is not ready */
 		/*  that the selected registrar of AP is _FLASE */
 		if ((psecuritypriv->wpa_psk > 0)
-			&& (pstat->flags & (WLAN_STA_WPS|WLAN_STA_MAYBE_WPS))) {
+			&& (pstat->flags & (WLAN_STA_WPS | WLAN_STA_MAYBE_WPS))) {
 			if (pmlmepriv->wps_beacon_ie) {
 				u8 selected_registrar = 0;
 
@@ -1137,7 +1137,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		}
 
 		if (copy_len > 0)
-			memcpy(pstat->wpa_ie, wpa_ie-2, copy_len);
+			memcpy(pstat->wpa_ie, wpa_ie - 2, copy_len);
 	}
 
 	/*  check if there is WMM IE & support WWM-PS */
@@ -1156,7 +1156,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 			if (!p)
 				break;
 
-			if (memcmp(p+2, WMM_IE, 6)) {
+			if (memcmp(p + 2, WMM_IE, 6)) {
 				p = p + ie_len + 2;
 				continue;
 			}
@@ -1164,33 +1164,33 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
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
@@ -1211,14 +1211,14 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
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
@@ -1590,7 +1590,7 @@ unsigned int OnAction_back(struct adapter *padapter, union recv_frame *precv_fra
 	if (memcmp(myid(&(padapter->eeprompriv)), GetAddr1Ptr(pframe), ETH_ALEN))/* for if1, sta/ap mode */
 		return _SUCCESS;
 
-	if ((pmlmeinfo->state&0x03) != WIFI_FW_AP_STATE)
+	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
 		if (!(pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS))
 			return _SUCCESS;
 
@@ -1670,7 +1670,7 @@ static s32 rtw_action_public_decache(union recv_frame *recv_frame, s32 token)
 	struct adapter *adapter = recv_frame->u.hdr.adapter;
 	struct mlme_ext_priv *mlmeext = &(adapter->mlmeextpriv);
 	u8 *frame = recv_frame->u.hdr.rx_data;
-	u16 seq_ctrl = ((recv_frame->u.hdr.attrib.seq_num&0xffff) << 4) |
+	u16 seq_ctrl = ((recv_frame->u.hdr.attrib.seq_num & 0xffff) << 4) |
 		(recv_frame->u.hdr.attrib.frag_num & 0xf);
 
 	if (GetRetry(frame)) {
@@ -1806,9 +1806,9 @@ unsigned int OnAction_sa_query(struct adapter *padapter, union recv_frame *precv
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	unsigned short tid;
 
-	switch (pframe[WLAN_HDR_A3_LEN+1]) {
+	switch (pframe[WLAN_HDR_A3_LEN + 1]) {
 	case 0: /* SA Query req */
-		memcpy(&tid, &pframe[WLAN_HDR_A3_LEN+2], sizeof(unsigned short));
+		memcpy(&tid, &pframe[WLAN_HDR_A3_LEN + 2], sizeof(unsigned short));
 		issue_action_SA_Query(padapter, GetAddr2Ptr(pframe), 1, tid);
 		break;
 
@@ -2026,10 +2026,10 @@ static int update_hidden_ssid(u8 *ies, u32 ies_len, u8 hidden_ssid_mode)
 			u8 *next_ie = ssid_ie + 2 + ssid_len_ori;
 			u32 remain_len = 0;
 
-			remain_len = ies_len - (next_ie-ies);
+			remain_len = ies_len - (next_ie - ies);
 
 			ssid_ie[1] = 0;
-			memcpy(ssid_ie+2, next_ie, remain_len);
+			memcpy(ssid_ie + 2, next_ie, remain_len);
 			len_diff -= ssid_len_ori;
 
 			break;
@@ -2089,16 +2089,16 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
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
@@ -2106,8 +2106,8 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 			uint wps_ielen;
 			u8 sr = 0;
 
-			wps_ie = rtw_get_wps_ie(pmgntframe->buf_addr+TXDESC_OFFSET+sizeof(struct ieee80211_hdr_3addr)+_BEACON_IE_OFFSET_,
-				pattrib->pktlen-sizeof(struct ieee80211_hdr_3addr)-_BEACON_IE_OFFSET_, NULL, &wps_ielen);
+			wps_ie = rtw_get_wps_ie(pmgntframe->buf_addr + TXDESC_OFFSET + sizeof(struct ieee80211_hdr_3addr) + _BEACON_IE_OFFSET_,
+				pattrib->pktlen - sizeof(struct ieee80211_hdr_3addr) - _BEACON_IE_OFFSET_, NULL, &wps_ielen);
 			if (wps_ie && wps_ielen > 0)
 				rtw_get_wps_attr_content(wps_ie,  wps_ielen, WPS_ATTR_SELECTED_REGISTRAR, (u8 *)(&sr), NULL);
 			if (sr != 0)
@@ -2239,8 +2239,8 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 	if (cur_network->ie_length > MAX_IE_SZ)
 		return;
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE) {
-		pwps_ie = rtw_get_wps_ie(cur_network->ies+_FIXED_IE_LENGTH_, cur_network->ie_length-_FIXED_IE_LENGTH_, NULL, &wps_ielen);
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE) {
+		pwps_ie = rtw_get_wps_ie(cur_network->ies + _FIXED_IE_LENGTH_, cur_network->ie_length - _FIXED_IE_LENGTH_, NULL, &wps_ielen);
 
 		/* inerset & update wps_probe_resp_ie */
 		if (pmlmepriv->wps_probe_resp_ie && pwps_ie && wps_ielen > 0) {
@@ -2258,13 +2258,13 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
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
@@ -2281,14 +2281,14 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
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
 
@@ -2296,8 +2296,8 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 				uint remainder_ielen;
 				u8 *remainder_ie;
 
-				remainder_ie = ssid_ie+2;
-				remainder_ielen = (pframe-remainder_ie);
+				remainder_ie = ssid_ie + 2;
+				remainder_ielen = (pframe - remainder_ie);
 
 				if (remainder_ielen > MAX_IE_SZ) {
 					netdev_warn(padapter->pnetdev,
@@ -2307,9 +2307,9 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
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
@@ -2347,7 +2347,7 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 		/*  DS parameter set */
 		pframe = rtw_set_ie(pframe, WLAN_EID_DS_PARAMS, 1, (unsigned char *)&(cur_network->configuration.ds_config), &pattrib->pktlen);
 
-		if ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) {
+		if ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) {
 			u8 erpinfo = 0;
 			u32 ATIMWindow;
 			/*  IBSS Parameter Set... */
@@ -2687,7 +2687,7 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, pstat->bssratelen, pstat->bssrateset, &(pattrib->pktlen));
 	} else {
 		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, 8, pstat->bssrateset, &(pattrib->pktlen));
-		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (pstat->bssratelen-8), pstat->bssrateset+8, &(pattrib->pktlen));
+		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (pstat->bssratelen - 8), pstat->bssrateset + 8, &(pattrib->pktlen));
 	}
 
 	if ((pstat->flags & WLAN_STA_HT) && (pmlmepriv->htpriv.ht_option)) {
@@ -2697,18 +2697,18 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
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
 
@@ -2719,10 +2719,10 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 
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
@@ -2956,9 +2956,9 @@ static int _issue_nulldata(struct adapter *padapter, unsigned char *da,
 	fctrl = &(pwlanhdr->frame_control);
 	*(fctrl) = 0;
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE)
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)
 		SetFrDs(fctrl);
-	else if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE)
+	else if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE)
 		SetToDs(fctrl);
 
 	if (power_mode)
@@ -3098,9 +3098,9 @@ static int _issue_qos_nulldata(struct adapter *padapter, unsigned char *da,
 	fctrl = &(pwlanhdr->frame_control);
 	*(fctrl) = 0;
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE)
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)
 		SetFrDs(fctrl);
-	else if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE)
+	else if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE)
 		SetToDs(fctrl);
 
 	qc = (unsigned short *)(pframe + pattrib->hdrlen - 2);
@@ -3627,7 +3627,7 @@ unsigned int send_delba(struct adapter *padapter, u8 initiator, u8 *addr)
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u16 tid;
 
-	if ((pmlmeinfo->state&0x03) != WIFI_FW_AP_STATE)
+	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
 		if (!(pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS))
 			return _SUCCESS;
 
@@ -3638,7 +3638,7 @@ unsigned int send_delba(struct adapter *padapter, u8 initiator, u8 *addr)
 	if (initiator == 0) {/*  recipient */
 		for (tid = 0; tid < MAXTID; tid++) {
 			if (psta->recvreorder_ctrl[tid].enable) {
-				issue_action_BA(padapter, addr, WLAN_ACTION_DELBA, (((tid << 1) | initiator)&0x1F));
+				issue_action_BA(padapter, addr, WLAN_ACTION_DELBA, (((tid << 1) | initiator) & 0x1F));
 				psta->recvreorder_ctrl[tid].enable = false;
 				psta->recvreorder_ctrl[tid].indicate_seq = 0xffff;
 			}
@@ -3646,7 +3646,7 @@ unsigned int send_delba(struct adapter *padapter, u8 initiator, u8 *addr)
 	} else if (initiator == 1) {/*  originator */
 		for (tid = 0; tid < MAXTID; tid++) {
 			if (psta->htpriv.agg_enable_bitmap & BIT(tid)) {
-				issue_action_BA(padapter, addr, WLAN_ACTION_DELBA, (((tid << 1) | initiator)&0x1F));
+				issue_action_BA(padapter, addr, WLAN_ACTION_DELBA, (((tid << 1) | initiator) & 0x1F));
 				psta->htpriv.agg_enable_bitmap &= ~BIT(tid);
 				psta->htpriv.candidate_tid_bitmap &= ~BIT(tid);
 			}
@@ -3671,7 +3671,7 @@ unsigned int send_beacon(struct adapter *padapter)
 			cond_resched();
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bxmitok));
 			poll++;
-		} while ((poll%10) != 0 && false == bxmitok && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+		} while ((poll % 10) != 0 && false == bxmitok && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
 
 	} while (false == bxmitok && issue < 100 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
 
@@ -3867,7 +3867,7 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 
 	p = rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_EXT_SUPP_RATES, &len, bssid->ie_length - ie_offset);
 	if (p) {
-		if (len > (NDIS_802_11_LENGTH_RATES_EX-i))
+		if (len > (NDIS_802_11_LENGTH_RATES_EX - i))
 			return _FAIL;
 
 		memcpy(bssid->supported_rates + i, (p + 2), len);
@@ -3958,7 +3958,7 @@ void start_create_ibss(struct adapter *padapter)
 	/* update capability */
 	caps = rtw_get_capability((struct wlan_bssid_ex *)pnetwork);
 	update_capinfo(padapter, caps);
-	if (caps&WLAN_CAPABILITY_IBSS) {/* adhoc master */
+	if (caps & WLAN_CAPABILITY_IBSS) {/* adhoc master */
 		val8 = 0xcf;
 		rtw_hal_set_hwreg(padapter, HW_VAR_SEC_CFG, (u8 *)(&val8));
 
@@ -4009,7 +4009,7 @@ void start_clnt_join(struct adapter *padapter)
 	/* update capability */
 	caps = rtw_get_capability((struct wlan_bssid_ex *)pnetwork);
 	update_capinfo(padapter, caps);
-	if (caps&WLAN_CAPABILITY_ESS) {
+	if (caps & WLAN_CAPABILITY_ESS) {
 		set_msr(padapter, WIFI_FW_STATION_STATE);
 
 		val8 = (pmlmeinfo->auth_algo == dot11AuthAlgrthm_8021X) ? 0xcc : 0xcf;
@@ -4033,10 +4033,10 @@ void start_clnt_join(struct adapter *padapter)
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
@@ -4098,7 +4098,7 @@ unsigned int receive_disconnect(struct adapter *padapter, unsigned char *MacAddr
 	if (!(!memcmp(MacAddr, get_my_bssid(&pmlmeinfo->network), ETH_ALEN)))
 		return _SUCCESS;
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE) {
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE) {
 		if (pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) {
 			pmlmeinfo->state = WIFI_FW_NULL_STATE;
 			report_del_sta_event(padapter, MacAddr, reason);
@@ -4159,7 +4159,7 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 				if (fcn <= 14)
 					channel = fcn + j; /*  2.4 GHz */
 				else
-					channel = fcn + j*4; /*  5 GHz */
+					channel = fcn + j * 4; /*  5 GHz */
 
 				chplan_ap.Channel[i++] = channel;
 			}
@@ -4550,7 +4550,7 @@ void update_sta_info(struct adapter *padapter, struct sta_info *psta)
 
 		psta->htpriv.ampdu_enable = pmlmepriv->htpriv.ampdu_enable;
 
-		psta->htpriv.rx_ampdu_min_spacing = (pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para&IEEE80211_HT_CAP_AMPDU_DENSITY)>>2;
+		psta->htpriv.rx_ampdu_min_spacing = (pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & IEEE80211_HT_CAP_AMPDU_DENSITY) >> 2;
 
 		if (support_short_GI(padapter, &(pmlmeinfo->HT_caps), CHANNEL_WIDTH_20))
 			psta->htpriv.sgi_20m = true;
@@ -4655,7 +4655,7 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 		return;
 	}
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE)
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE)
 		/* update bc/mc sta_info */
 		update_bmc_sta(padapter);
 
@@ -4704,7 +4704,7 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 	join_type = 2;
 	rtw_hal_set_hwreg(padapter, HW_VAR_MLME_JOIN, (u8 *)(&join_type));
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE) {
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE) {
 		/*  correcting TSF */
 		correct_TSF(padapter, pmlmeext);
 
@@ -4721,7 +4721,7 @@ void mlmeext_sta_add_event_callback(struct adapter *padapter, struct sta_info *p
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 join_type;
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) {
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) {
 		if (pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) { /* adhoc master or sta_count>1 */
 
 			/* nothing to do */
@@ -4783,7 +4783,7 @@ void _linked_info_dump(struct adapter *padapter)
 	struct dvobj_priv *pdvobj = adapter_to_dvobj(padapter);
 
 	if (padapter->bLinkInfoDump) {
-		if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE)
+		if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE)
 			rtw_hal_get_def_var(padapter,
 					    HAL_DEF_UNDERCORATEDSMOOTHEDPWDB,
 					    &UndecoratedSmoothedPWDB);
@@ -5273,9 +5273,9 @@ u8 disconnect_hdl(struct adapter *padapter, unsigned char *pbuf)
 	u8 val8;
 
 	if (is_client_associated_to_ap(padapter))
-		issue_deauth_ex(padapter, pnetwork->mac_address, WLAN_REASON_DEAUTH_LEAVING, param->deauth_timeout_ms/100, 100);
+		issue_deauth_ex(padapter, pnetwork->mac_address, WLAN_REASON_DEAUTH_LEAVING, param->deauth_timeout_ms / 100, 100);
 
-	if (((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) || ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE)) {
+	if (((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) || ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)) {
 		/* Stop BCN */
 		val8 = 0;
 		rtw_hal_set_hwreg(padapter, HW_VAR_BCN_FUNC, (u8 *)(&val8));
@@ -5296,7 +5296,7 @@ static int rtw_scan_ch_decision(struct adapter *padapter, struct rtw_ieee80211_c
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 
 	/* clear first */
-	memset(out, 0, sizeof(struct rtw_ieee80211_channel)*out_num);
+	memset(out, 0, sizeof(struct rtw_ieee80211_channel) * out_num);
 
 	/* acquire channels from in */
 	j = 0;
@@ -5535,7 +5535,7 @@ u8 add_ba_hdl(struct adapter *padapter, unsigned char *pbuf)
 		return	H2C_SUCCESS;
 
 	if (((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && (pmlmeinfo->HT_enable)) ||
-		((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE)) {
+		((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)) {
 		/* pmlmeinfo->ADDBA_retry_count = 0; */
 		/* pmlmeinfo->candidate_tid_bitmap |= (0x1 << pparm->tid); */
 		/* psta->htpriv.candidate_tid_bitmap |= BIT(pparm->tid); */
-- 
2.54.0

