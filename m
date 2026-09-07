Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC87C35DA47
	for <linux-staging@lists.linux.dev>; Mon,  7 Sep 2026 18:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788806136; cv=none; b=ltNq91zL/oUYjTyOST2Rjs+jEYNlRj4w6zMkoWZjmZqVDqptH53LaeQGEpfLGtdXFVO/AUGLR5x90NfKDxyZS98nPJMpSslrj09HUK7OUHbojaSfmRtxkOdwDz9u2204/dMxahwWzdiiimTqEXKuimzrED1zzCarDc7WKKZDA8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788806136; c=relaxed/simple;
	bh=IGeItGdIDZiozvaDAsFsvWwALEZKOuhDNK0k0jmGFVc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E1rrtkABNP4KlFP4B+5xfh7scFxsC6MsatdWg7AdmLVxUCRyOrMweDR7kPGChc6eJ3UHtLG3uP0hAJ96DKi+BN7xP2hze9ucIRe9sOshgbnsnmSfCuCFUp1GnazWn1uYEksFNSQ1x4YJS6TVNEEtwWtG78CEwUENb+loKSlVkaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJDEIB9j; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJDEIB9j"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d9004f39d3so46171635ad.2
        for <linux-staging@lists.linux.dev>; Mon, 07 Sep 2026 11:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788806134; x=1789410934; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8YM6m6xOV9uw11mc8TmjiFLP42F3JIT82VmXlnuJ/MQ=;
        b=eJDEIB9jCX1BKcLS8DL1Yp2cDP5p9UY9XhTLIvOeeHJIsBkbaSkKDNi1h8KaYD5xZv
         8vL5NAbaYjzzOkfb+UTI7+9AUH0OWmadkoleQ217f2FH365osbz9MsxGWnsGbajLGeMI
         wZUYiDSa9yMubmxnOMkX32gbMRQ8PpIrmLiTAcQapoBbL6XJllMAGMLmmvFwFpYHJKA3
         7anKo8lj1JP09m/IetLdKjbIX715/PDOirzcPVeqFtjln7aeeS2Z95WHtOqQnrA1XtLC
         vNgSUUHFlXt2zWlj/9yLE/EUgMUZE9VAv2HMB+MD2WiFOvUF/Np/OstzPsNEp1L9DIUe
         /e+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788806134; x=1789410934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8YM6m6xOV9uw11mc8TmjiFLP42F3JIT82VmXlnuJ/MQ=;
        b=mFRRTazf8adDq7OgmUph68fyngMF+HJdV6oH3OwE66PEVGk7fsfDsyCBmp6aZFPqEf
         OuovkjD+auRUs7dfmD4WKKjYTpDCQ++YXD+IA/cl9AxAaECbrEQFhqQV03yVnD09TcK5
         9cukizbgpb2qh0GS4dyNqEBLz0CjWJvjokZU5EFaK3la7xt8IFXYdrChr84WO+KzvK59
         eOWvJGT6TK0ZQxZFnvjaHWtt1dbHjoSspabXhHliRXuW06EtY4pghEyVIQXBQN4oL0Jq
         GPKkMRP1hGwxVdxz0i0BVCIphnd6ca59S4/3yo+k/RS2lg2/lQWsuzKQ65VHsqcmSWOP
         Z4sg==
X-Gm-Message-State: AFuF++nVcnrNN//QV/KmaiCVXqOWkRr3SvUwnPXsfNI3G/r0EHKyuTYW
	VK4OHcOV0VT3e+DjbnJ4VeboRbLaFjJ1cTZMaBxjWgSCX8wJxOoc5IxREper7Q==
X-Gm-Gg: AYBFou1jLaJzg4cpIwxxbyhOc/Y06bABMO2KvyAouxJ1Te0ydRv9liy32T1VS6BQAxd
	eHrz3/kMa+IGtpcazK6COtdQhPTabetTIJ7CBxaj5spQj9f6FlkNGcTLCpWLguBXExsjn1ezjMT
	P/26sY2QYRzKGpEF1K8J9PvE+OtggFzepFeD7j2X+QMBCIerbjML2Osr2INyOwP/WrI9lmleIx5
	YJuzYMoGPns0h1Ep5VoZFfne55JRGgfJkFLwDVDh9Yvc7aXIcp+Kvd6mlmARy411OzgGDb9gQbp
	IWdY5PyLOTIXW1bepgcOz2R4x92QhzpXODihcnOWzxtngAVVLCIylCIimBkGphpR1Fhqs1o3Nso
	7a8kdh6aj3IFYa2wKaOMaJ5GemJUHF/Wel+kZfH/b0ZEKOdgaYtuOnirwWKGFPH0CdQZo9mQEI1
	XGXXKB0lXDN0KpWLFTCRJQ5H4+/iA9CGyvg2AYHVvG/4kHhxhdtX2WVzpggTQDhBrXGye2sx4=
X-Received: by 2002:a17:90b:4c51:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39b26204e5bmr34222765a91.13.1788806133766;
        Mon, 07 Sep 2026 11:35:33 -0700 (PDT)
Received: from TestUbuntu22.. ([67.169.161.65])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-3339b123731sm28185174eec.18.2026.09.07.11.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 11:35:33 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guojy.bj@gmail.com
Subject: [PATCH] staging: rtl8723bs: remove commented out code in rtw_mlme_ext.c
Date: Mon,  7 Sep 2026 11:35:21 -0700
Message-Id: <20260907183521.68630-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all commented-out code in this file.
Remove adjacent comment where applicable.

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 89 -------------------
 1 file changed, 89 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index c39fb142302e..7622f0ef0aba 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -384,8 +384,6 @@ void init_mlme_ext_priv(struct adapter *padapter)
 
 	pmlmeext->padapter = padapter;
 
-	/* fill_fwpriv(padapter, &(pmlmeext->fwpriv)); */
-
 	init_mlme_ext_priv_value(padapter);
 	pmlmeinfo->accept_addba_req = pregistrypriv->accept_addba_req;
 
@@ -411,7 +409,6 @@ void free_mlme_ext_priv(struct mlme_ext_priv *pmlmeext)
 	if (padapter->driver_stopped) {
 		timer_delete_sync(&pmlmeext->survey_timer);
 		timer_delete_sync(&pmlmeext->link_timer);
-		/* timer_delete_sync(&pmlmeext->ADDBA_timer); */
 	}
 }
 
@@ -483,7 +480,6 @@ void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame)
 		_mgt_dispatcher(padapter, ptable, precv_frame);
 		break;
 	case WIFI_ACTION:
-		/* if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) */
 		_mgt_dispatcher(padapter, ptable, precv_frame);
 		break;
 	default:
@@ -743,9 +739,6 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 
 		pstat->state = WIFI_FW_AUTH_NULL;
 		pstat->auth_seq = 0;
-
-		/* pstat->flags = 0; */
-		/* pstat->capability = 0; */
 	} else {
 		spin_lock_bh(&pstapriv->asoc_list_lock);
 		if (!list_empty(&pstat->asoc_list)) {
@@ -872,7 +865,6 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 				pmlmeinfo->auth_algo = dot11_auth_algrthm_open;
 			else
 				pmlmeinfo->auth_algo = dot11_auth_algrthm_shared;
-			/* pmlmeinfo->reauth_count = 0; */
 		}
 
 		set_link_timer(pmlmeext, 1);
@@ -915,8 +907,6 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 
 authclnt_fail:
 
-	/* pmlmeinfo->state &= ~(WIFI_FW_AUTH_STATE); */
-
 	return _FAIL;
 }
 
@@ -961,7 +951,6 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	}
 
 	capab_info = get_unaligned_le16(pframe + WLAN_HDR_A3_LEN);
-	/* capab_info = le16_to_cpu(*(unsigned short *)(pframe + WLAN_HDR_A3_LEN)); */
 
 	left = pkt_len - (sizeof(struct ieee80211_hdr_3addr) + ie_offset);
 	pos = pframe + (sizeof(struct ieee80211_hdr_3addr) + ie_offset);
@@ -1013,10 +1002,6 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	/*  check if the supported rate is ok */
 	p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + ie_offset, WLAN_EID_SUPP_RATES, &ie_len, pkt_len - WLAN_HDR_A3_LEN - ie_offset);
 	if (!p) {
-		/*  use our own rate set as statoin used */
-		/* memcpy(supportRate, AP_BSSRATE, AP_BSSRATE_LEN); */
-		/* support_rate_num = AP_BSSRATE_LEN; */
-
 		status = WLAN_STATUS_CHALLENGE_FAIL;
 		goto OnAssocReqFail;
 	} else {
@@ -1037,7 +1022,6 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	}
 
 	/* todo: mask supportRate between AP & STA -> move to update raid */
-	/* get_matched_rate(pmlmeext, supportRate, &support_rate_num, 0); */
 
 	/* update station supportRate */
 	pstat->bssratelen = support_rate_num;
@@ -1232,8 +1216,6 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	if ((pstat->flags & WLAN_STA_HT) &&
 		    ((pstat->wpa2_pairwise_cipher & WPA_CIPHER_TKIP) ||
 		      (pstat->wpa_pairwise_cipher & WPA_CIPHER_TKIP))) {
-		/* status = WLAN_STATUS_CIPHER_SUITE_REJECTED; */
-		/* goto OnAssocReqFail; */
 	}
 	pstat->flags |= WLAN_STA_NONERP;
 	for (i = 0; i < pstat->bssratelen; i++) {
@@ -1260,7 +1242,6 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 			if (!pstapriv->sta_aid[pstat->aid - 1])
 				break;
 
-		/* if (pstat->aid > NUM_STA) { */
 		if (pstat->aid > pstapriv->max_num_sta) {
 			pstat->aid = 0;
 
@@ -1344,7 +1325,6 @@ unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
-	/* struct wlan_bssid_ex			*cur_network = &(pmlmeinfo->network); */
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 	uint pkt_len = precv_frame->u.hdr.len;
 
@@ -1449,8 +1429,6 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
 		struct sta_info *psta;
 		struct sta_priv *pstapriv = &padapter->stapriv;
 
-		/* rtw_free_stainfo(padapter, psta); */
-
 		netdev_dbg(padapter->pnetdev,
 			   "ap recv deauth reason code(%d) sta:%pM\n", reason,
 			   GetAddr2Ptr(pframe));
@@ -1519,8 +1497,6 @@ unsigned int OnDisassoc(struct adapter *padapter, union recv_frame *precv_frame)
 		struct sta_info *psta;
 		struct sta_priv *pstapriv = &padapter->stapriv;
 
-		/* rtw_free_stainfo(padapter, psta); */
-
 		netdev_dbg(padapter->pnetdev,
 			   "ap recv disassoc reason code(%d) sta:%pM\n",
 			   reason, GetAddr2Ptr(pframe));
@@ -1630,7 +1606,6 @@ unsigned int OnAction_back(struct adapter *padapter, union recv_frame *precv_fra
 		case WLAN_ACTION_ADDBA_REQ: /* ADDBA request */
 
 			memcpy(&(pmlmeinfo->ADDBA_req), &(frame_body[2]), sizeof(struct ADDBA_request));
-			/* process_addba_req(padapter, (u8 *)&(pmlmeinfo->ADDBA_req), GetAddr3Ptr(pframe)); */
 			process_addba_req(padapter, (u8 *)&(pmlmeinfo->ADDBA_req), addr);
 
 			if (pmlmeinfo->accept_addba_req)
@@ -1915,8 +1890,6 @@ void update_mgntframe_attrib(struct adapter *padapter, struct pkt_attrib *pattri
 	u8 wireless_mode;
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 
-	/* memset((u8 *)(pattrib), 0, sizeof(struct pkt_attrib)); */
-
 	pattrib->hdrlen = 24;
 	pattrib->nr_frags = 1;
 	pattrib->priority = 7;
@@ -2096,7 +2069,6 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 	memcpy(pwlanhdr->addr3, get_my_bssid(cur_network), ETH_ALEN);
 
 	SetSeqNum(pwlanhdr, 0/*pmlmeext->mgnt_seq*/);
-	/* pmlmeext->mgnt_seq++; */
 	SetFrameSubType(pframe, WIFI_BEACON);
 
 	pframe += sizeof(struct ieee80211_hdr_3addr);
@@ -2171,7 +2143,6 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 		u8 erpinfo = 0;
 		u32 ATIMWindow;
 		/*  IBSS Parameter Set... */
-		/* ATIMWindow = cur->configuration.ATIMWindow; */
 		ATIMWindow = 0;
 		pframe = rtw_set_ie(pframe, WLAN_EID_IBSS_PARAMS, 2, (unsigned char *)(&ATIMWindow), &pattrib->pktlen);
 
@@ -2381,7 +2352,6 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 			u8 erpinfo = 0;
 			u32 ATIMWindow;
 			/*  IBSS Parameter Set... */
-			/* ATIMWindow = cur->configuration.ATIMWindow; */
 			ATIMWindow = 0;
 			pframe = rtw_set_ie(pframe, WLAN_EID_IBSS_PARAMS, 2, (unsigned char *)(&ATIMWindow), &pattrib->pktlen);
 
@@ -2679,7 +2649,6 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 		uint ie_len = 0;
 
 		/* FILL HT CAP INFO IE */
-		/* p = hostapd_eid_ht_capabilities_info(hapd, p); */
 		pbuf = rtw_get_ie(ie + _BEACON_IE_OFFSET_, WLAN_EID_HT_CAPABILITY, &ie_len, (pnetwork->ie_length - _BEACON_IE_OFFSET_));
 		if (pbuf && ie_len > 0) {
 			memcpy(pframe, pbuf, ie_len + 2);
@@ -2688,7 +2657,6 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 		}
 
 		/* FILL HT ADD INFO IE */
-		/* p = hostapd_eid_ht_operation(hapd, p); */
 		pbuf = rtw_get_ie(ie + _BEACON_IE_OFFSET_, WLAN_EID_HT_OPERATION, &ie_len, (pnetwork->ie_length - _BEACON_IE_OFFSET_));
 		if (pbuf && ie_len > 0) {
 			memcpy(pframe, pbuf, ie_len + 2);
@@ -2802,9 +2770,6 @@ void issue_assocreq(struct adapter *padapter)
 	if (pmlmeext->cur_channel == 14) /*  for JAPAN, channel 14 can only uses B Mode(CCK) */
 		sta_bssrate_len = 4;
 
-	/* for (i = 0; i < sta_bssrate_len; i++) { */
-	/*  */
-
 	for (i = 0; i < NDIS_802_11_LENGTH_RATES_EX; i++) {
 		if (pmlmeinfo->network.supported_rates[i] == 0)
 			break;
@@ -3359,7 +3324,6 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 	fctrl = &(pwlanhdr->frame_control);
 	*(fctrl) = 0;
 
-	/* memcpy(pwlanhdr->addr1, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN); */
 	memcpy(pwlanhdr->addr1, raddr, ETH_ALEN);
 	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
 	memcpy(pwlanhdr->addr3, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
@@ -3401,7 +3365,6 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 			le_tmp = cpu_to_le16(BA_timeout_value);
 			pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)(&(le_tmp)), &(pattrib->pktlen));
 
-			/* if ((psta = rtw_get_stainfo(pstapriv, pmlmeinfo->network.mac_address)) != NULL) */
 			psta = rtw_get_stainfo(pstapriv, raddr);
 			if (psta) {
 				start_seq = (psta->sta_xmitpriv.txseq_tid[status & 0x07] % 4096u) + 1;
@@ -3529,7 +3492,6 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 	pframe = rtw_set_fixed_ie(pframe, 1, &(category), &(pattrib->pktlen));
 	pframe = rtw_set_fixed_ie(pframe, 1, &(action), &(pattrib->pktlen));
 
-	/*  */
 	if (pmlmepriv->num_FortyMHzIntolerant > 0) {
 		u8 iedata = 0;
 
@@ -3538,7 +3500,6 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 		pframe = rtw_set_ie(pframe, WLAN_EID_BSS_COEX_2040,  1, &iedata, &(pattrib->pktlen));
 	}
 
-	/*  */
 	memset(ICS, 0, sizeof(ICS));
 	if (pmlmepriv->num_sta_no_ht > 0) {
 		int i;
@@ -3584,7 +3545,6 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 				continue;
 
 			InfoContent[k] = i;
-			/* SET_BSS_INTOLERANT_ELE_REG_CLASS(InfoContent, i); */
 			k++;
 
 			for (j = 1; j <= 14; j++) {
@@ -3593,7 +3553,6 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 
 				if (k < 16) {
 					InfoContent[k] = j; /* channel number */
-					/* SET_BSS_INTOLERANT_ELE_CHANNEL(InfoContent+k, j); */
 					k++;
 				}
 			}
@@ -3611,7 +3570,6 @@ unsigned int send_delba(struct adapter *padapter, u8 initiator, u8 *addr)
 {
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct sta_info *psta = NULL;
-	/* struct recv_reorder_ctrl *preorder_ctrl; */
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u16 tid;
@@ -3749,15 +3707,8 @@ void site_survey(struct adapter *padapter)
 		{
 			pmlmeext->sitesurvey_res.state = SCAN_COMPLETE;
 
-			/* switch back to the original channel */
-			/* SelectChannel(padapter, pmlmeext->cur_channel, pmlmeext->cur_ch_offset); */
-
 			set_channel_bwmode(padapter, pmlmeext->cur_channel, pmlmeext->cur_ch_offset, pmlmeext->cur_bwmode);
 
-			/* flush 4-AC Queue after site_survey */
-			/* val8 = 0; */
-			/* rtw_hal_set_hwreg(padapter, HW_VAR_TXPAUSE, (u8 *)(&val8)); */
-
 			/* config MSR */
 			set_msr(padapter, (pmlmeinfo->state & 0x3));
 
@@ -3765,7 +3716,6 @@ void site_survey(struct adapter *padapter)
 			rtw_hal_set_hwreg(padapter, HW_VAR_INITIAL_GAIN, (u8 *)(&initialgain));
 			/* turn on dynamic functions */
 			restore_dm_func_flag(padapter);
-			/* switch_dm_func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true); */
 
 			if (is_client_associated_to_ap(padapter))
 				issue_nulldata(padapter, NULL, 0, 3, 500);
@@ -3962,7 +3912,6 @@ void start_create_ibss(struct adapter *padapter)
 		rtw_hal_set_hwreg(padapter, HW_VAR_SEC_CFG, (u8 *)(&val8));
 
 		/* switch channel */
-		/* SelectChannel(padapter, pmlmeext->cur_channel, HAL_PRIME_CHNL_OFFSET_DONT_CARE); */
 		set_channel_bwmode(padapter, pmlmeext->cur_channel, HAL_PRIME_CHNL_OFFSET_DONT_CARE, CHANNEL_WIDTH_20);
 
 		beacon_timing_control(padapter);
@@ -4259,8 +4208,6 @@ void report_survey_event(struct adapter *padapter, union recv_frame *precv_frame
 	struct C2HEvent_Header *pc2h_evt_hdr;
 	struct mlme_ext_priv *pmlmeext;
 	struct cmd_priv *pcmdpriv;
-	/* u8 *pframe = precv_frame->u.hdr.rx_data; */
-	/* uint len = precv_frame->u.hdr.len; */
 
 	if (!padapter)
 		return;
@@ -4599,8 +4546,6 @@ static void rtw_mlmeext_disconnect(struct adapter *padapter)
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct wlan_bssid_ex		*pnetwork = (struct wlan_bssid_ex *)(&(pmlmeinfo->network));
 
-	/* set_opmode_cmd(padapter, infra_client_with_mlme); */
-
 	/* For safety, prevent from keeping macid sleep.
 	 * If we can sure all power mode enter/leave are paired,
 	 * this check can be removed.
@@ -4706,8 +4651,6 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 	if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE) {
 		/*  correcting TSF */
 		correct_TSF(padapter, pmlmeext);
-
-		/* set_link_timer(pmlmeext, DISCONNECT_TO); */
 	}
 
 	rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_CONNECT, 0);
@@ -4725,9 +4668,6 @@ void mlmeext_sta_add_event_callback(struct adapter *padapter, struct sta_info *p
 
 			/* nothing to do */
 		} else { /* adhoc client */
-			/* update TSF Value */
-			/* update_TSF(pmlmeext, pframe, len); */
-
 			/*  correcting TSF */
 			correct_TSF(padapter, pmlmeext);
 
@@ -4921,8 +4861,6 @@ void linked_status_chk(struct adapter *padapter)
 				}
 			}
 		}
-
-		/* set_link_timer(pmlmeext, DISCONNECT_TO); */
 	}
 }
 
@@ -5043,7 +4981,6 @@ u8 setopmode_hdl(struct adapter *padapter, u8 *pbuf)
 	if (psetop->mode == NL80211_IFTYPE_AP) {
 		pmlmeinfo->state = WIFI_FW_AP_STATE;
 		type = _HW_STATE_AP_;
-		/* start_ap_mode(padapter); */
 	} else if (psetop->mode == NL80211_IFTYPE_STATION) {
 		pmlmeinfo->state &= ~(BIT(0) | BIT(1));/*  clear state */
 		pmlmeinfo->state |= WIFI_FW_STATION_STATE;/* set to	STATION_STATE */
@@ -5055,7 +4992,6 @@ u8 setopmode_hdl(struct adapter *padapter, u8 *pbuf)
 	}
 
 	rtw_hal_set_hwreg(padapter, HW_VAR_SET_OPMODE, (u8 *)(&type));
-	/* set_msr(padapter, type); */
 
 	if (psetop->mode == NL80211_IFTYPE_AP) {
 		/*  Do this after port switch to */
@@ -5072,7 +5008,6 @@ u8 createbss_hdl(struct adapter *padapter, u8 *pbuf)
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct wlan_bssid_ex	*pnetwork = (struct wlan_bssid_ex *)(&(pmlmeinfo->network));
 	struct joinbss_parm *pparm = (struct joinbss_parm *)pbuf;
-	/* u32 initialgain; */
 
 	if (pmlmeinfo->state == WIFI_FW_AP_STATE) {
 		start_bss_network(padapter);
@@ -5097,10 +5032,6 @@ u8 createbss_hdl(struct adapter *padapter, u8 *pbuf)
 		save_dm_func_flag(padapter);
 		switch_dm_func(padapter, DYNAMIC_FUNC_DISABLE, false);
 
-		/* config the initial gain under linking, need to write the BB registers */
-		/* initialgain = 0x1E; */
-		/* rtw_hal_set_hwreg(padapter, HW_VAR_INITIAL_GAIN, (u8 *)(&initialgain)); */
-
 		/* cancel link timer */
 		timer_delete_sync(&pmlmeext->link_timer);
 
@@ -5131,8 +5062,6 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 	struct wlan_bssid_ex		*pnetwork = (struct wlan_bssid_ex *)(&(pmlmeinfo->network));
 	u32 i;
 	u8 cbw40_enable = 0;
-	/* u32 initialgain; */
-	/* u32 acparm; */
 	u8 ch, bw, offset;
 
 	/* check already connecting to AP or not */
@@ -5147,7 +5076,6 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 		timer_delete_sync(&pmlmeext->link_timer);
 
 		/* set MSR to nolink -> infra. mode */
-		/* set_msr(padapter, _HW_STATE_NOLINK_); */
 		set_msr(padapter, _HW_STATE_STATION_);
 
 		rtw_hal_set_hwreg(padapter, HW_VAR_MLME_DISCONNECT, NULL);
@@ -5165,7 +5093,6 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 	pmlmeinfo->agg_enable_bitmap = 0;
 	pmlmeinfo->candidate_tid_bitmap = 0;
 	pmlmeinfo->bwmode_updated = false;
-	/* pmlmeinfo->assoc_AP_vendor = HT_IOT_PEER_MAX; */
 	pmlmeinfo->VHT_enable = 0;
 
 	memcpy(pnetwork, pbuf, offsetof(struct wlan_bssid_ex, ie_length));
@@ -5179,10 +5106,7 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 	pmlmeext->cur_channel = (u8)pnetwork->configuration.ds_config;
 	pmlmeinfo->bcn_interval = get_beacon_interval(pnetwork);
 
-	/* Check AP vendor to move rtw_joinbss_cmd() */
-	/* pmlmeinfo->assoc_AP_vendor = check_assoc_AP(pnetwork->ies, pnetwork->ie_length); */
 
-	/* sizeof(struct ndis_802_11_fix_ie) */
 	for (i = _FIXED_IE_LENGTH_; i < pnetwork->ie_length;) {
 		if (i + sizeof(*pIE) > pnetwork->ie_length)
 			break;
@@ -5245,13 +5169,6 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 		return H2C_SUCCESS;
 	}
 
-	/* disable dynamic functions, such as high power, DIG */
-	/* switch_dm_func(padapter, DYNAMIC_FUNC_DISABLE, false); */
-
-	/* config the initial gain under linking, need to write the BB registers */
-	/* initialgain = 0x1E; */
-	/* rtw_hal_set_hwreg(padapter, HW_VAR_INITIAL_GAIN, (u8 *)(&initialgain)); */
-
 	rtw_hal_set_hwreg(padapter, HW_VAR_BSSID, pmlmeinfo->network.mac_address);
 	join_type = 0;
 	rtw_hal_set_hwreg(padapter, HW_VAR_MLME_JOIN, (u8 *)(&join_type));
@@ -5540,11 +5457,7 @@ u8 add_ba_hdl(struct adapter *padapter, unsigned char *pbuf)
 
 	if (((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && (pmlmeinfo->HT_enable)) ||
 		((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)) {
-		/* pmlmeinfo->ADDBA_retry_count = 0; */
-		/* pmlmeinfo->candidate_tid_bitmap |= (0x1 << pparm->tid); */
-		/* psta->htpriv.candidate_tid_bitmap |= BIT(pparm->tid); */
 		issue_action_BA(padapter, pparm->addr, WLAN_ACTION_ADDBA_REQ, (u16)pparm->tid);
-		/* _set_timer(&pmlmeext->ADDBA_timer, ADDBA_TO); */
 		_set_timer(&psta->addba_retry_timer, ADDBA_TO);
 	} else {
 		psta->htpriv.candidate_tid_bitmap &= ~BIT(pparm->tid);
@@ -5702,7 +5615,6 @@ u8 chk_bmc_sleepq_hdl(struct adapter *padapter, unsigned char *pbuf)
 	if ((pstapriv->tim_bitmap & BIT(0)) && (psta_bmc->sleepq_len > 0)) {
 		msleep(10);/*  10ms, ATIM(HIQ) Windows */
 
-		/* spin_lock_bh(&psta_bmc->sleep_q.lock); */
 		spin_lock_bh(&pxmitpriv->lock);
 
 		xmitframe_phead = get_list_head(&psta_bmc->sleep_q);
@@ -5726,7 +5638,6 @@ u8 chk_bmc_sleepq_hdl(struct adapter *padapter, unsigned char *pbuf)
 			rtw_hal_xmitframe_enqueue(padapter, pxmitframe);
 		}
 
-		/* spin_unlock_bh(&psta_bmc->sleep_q.lock); */
 		spin_unlock_bh(&pxmitpriv->lock);
 
 		/* check hi queue and bmc_sleepq */
-- 
2.34.1

