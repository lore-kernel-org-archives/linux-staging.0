Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3C335CB60
	for <linux-staging@lists.linux.dev>; Sat, 25 Apr 2026 11:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777116232; cv=none; b=ZvZfXbmuLAasNmNjd20GGjqiQAb6uYjbiNPN7OqQqIW/iPnyNmVCwQo6ZPGn4fx8ho5C5w7HjC6vI5rzKTKAPY3h39/QSWILxrIwdt6kiKqEVYKD2MCrSEqbtEBq/Dh7hnbXzzWOnFn1+6SnC863EHWLvVLDXTOUFmU02nTPcdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777116232; c=relaxed/simple;
	bh=Nd2YpYXkYwsT9Hqnikd//G9zwL81moaGyRyEtae5hzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rv863/Gx3/KM8A3uowdfeolIfWscOxZN9kRdznkBZhOLUuhcJLY/0Xhg2GxcrdIS9hl4TGtcwXNWiyHrHrFoaXffdYkE/55eW3sNlGcokZs8cxWlyctM5y5RZ30kPDUSjwAN2mDefOMGnQn4tgWLpAM+4y33VJLCSEzqe/nfKNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+Z66ye7; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+Z66ye7"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35da8d037a5so4208489a91.0
        for <linux-staging@lists.linux.dev>; Sat, 25 Apr 2026 04:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777116228; x=1777721028; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EC5GCYSicRRMb4FQaPYtSGQC3GW6bBL73dVA9vXac2I=;
        b=U+Z66ye7Stxr0sZrb8139CZgYD8zAdY6anLER3T2AaPv1s9+qPFIouvujY73gMQOvD
         Dwxw7VMXqlEYcLuk//Uqal5r6H8G9xfJbPFATQUNpDQqsMdpIj3Jx4SjuquClF3gmBD3
         FwCmczz8YyuetW2qf6i2DjyDLYn572Kr+Bggq61q7wTLZDzB5pDXsIbJ6d0YTJLwsBTt
         nT00eAr6npD5nra71KnfxjTEO+MTlnr7GIfRhA9/kYiHMVwXjjbVwuWsSLnboShoE6nA
         wFJPEoXBoq3J7b8emJtiFQx8wUIaPtMz0VL4KJwbEhFydISVs5fWe4HrRGd6n6UU/CsS
         VI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777116228; x=1777721028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EC5GCYSicRRMb4FQaPYtSGQC3GW6bBL73dVA9vXac2I=;
        b=NzilRWo20c7xsmrPWoMnbQR08K+C9BNIkx+/qQHKvFhvdDNQ+KxDAMXtVTajATeg7P
         7Hm4O97CDLj6d3BMhtflIkuiAWVBXviK4VjDKIQsDerWKktv00qI+hUVtBA6md4pMoqN
         9SRYICV+Pc5MFCXlqFqBIar3RzHaDaRBRzwY4xhQ/TAh2+Goeakq2GLqDnp0NHOe75DT
         dUZ9AMozBv0a3FITel3oKd6rCYhs3wc0qS5n4XeUHdBxivnxNrbMWZgxt8fh4ChG1Mxv
         5hK93ueWrSFVrgoKNCdfABIXAgFhQOX4Pf74ww/nSLKjM8mB/oJuu6J67xdIlUeBPWLZ
         rT1w==
X-Gm-Message-State: AOJu0YzVWVfveEtzCSrvlN3sc7JCOapekR2GQzMfFSbpKfUykJOVZJJj
	XZ1xciIVrjX85HbJmGPaqT3DhKlPH8k4Fg4hdbUEhAdM/3ezxEXdKGd3
X-Gm-Gg: AeBDievlA2PZxXnCBQitLMzrb4jgLcRrY/hGNxurqL96faV5ef3TWM8G3qxBrnhCn/9
	NsGcqAOzFm1CZlsYdgxHLpKSF1lCjLnnbRdj2aTq8GeqrXTiP94pe1DgJgF9N03oGL7NS2A+RY1
	pEbCcOo/y6SJnA8Hg+e+BQSHA0uSkrHzBcQL/+9PaVrFPOA1Mx66JvWLdZfUEBFlPGPUGlL+HaU
	lB2Jnii7BOYKxr2LESJV5hLLivKVCnviaJOMEJcbOOnr8avhcCCGduz/3E4h5zSP3tmx2HjQRCC
	AosVz2/vlAs+vVHrmFnlyZNEBeE0fQZ5odXnKODekarjsN5r0iAlAhLt7UJKrfOwKGkdb760Iji
	R6vV2QH//giVMoOdfOwh/gmhxcSV7XIDSneG+5DnZB44mrpxdXl46zlr6mjcTEbA8z5cBCO32Jt
	YjVLW1zTJkCvGdAc1aJzSeLT1pi7TxjQaydEcowoiDzKJR/CqcgYI6ChA3OLCsokzZzw==
X-Received: by 2002:a17:90b:55cf:b0:35d:9c43:57fe with SMTP id 98e67ed59e1d1-3614046583dmr36594785a91.13.1777116227957;
        Sat, 25 Apr 2026 04:23:47 -0700 (PDT)
Received: from mohammed-rizwan-HP-Laptop-15-bs1xx.. ([2406:7400:63:37af:8b14:a97e:deba:1a93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614195a9f0sm25727999a91.9.2026.04.25.04.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 04:23:47 -0700 (PDT)
From: Mohammed Rizwan Kaniyate <mrizwank004@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohammed Rizwan Kaniyate <mrizwank004@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove multiple blank lines in core/
Date: Sat, 25 Apr 2026 16:53:27 +0530
Message-ID: <20260425112327.215355-1-mrizwank004@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove multiple consecutive blank lines.
Issue reported by checkpatch.pl

Signed-off-by: Mohammed Rizwan Kaniyate <mrizwank004@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  1 -
 drivers/staging/rtl8723bs/core/rtw_efuse.c    |  1 -
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  1 -
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 48 -------------------
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 25 ----------
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  1 -
 6 files changed, 77 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index 0191a943f..27dfd00b4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -65,7 +65,6 @@ void rtw_btcoex_LPS_Leave(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv;
 
-
 	pwrpriv = adapter_to_pwrctl(padapter);
 
 	if (pwrpriv->pwr_mode != PS_MODE_ACTIVE) {
diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 099320e4e..0cd7ce242 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -232,7 +232,6 @@ void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType)
 	/* void *)&pHalData->EfuseMap[EFUSE_INIT_MAP][0], mapLen); */
 } /*  EFUSE_ShadowMapUpdate */
 
-
 /*-----------------------------------------------------------------------------
  * Function:	EFUSE_ShadowRead
  *
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index c70541f95..32c0af6af 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -340,7 +340,6 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 	return true;
 }
 
-
 u8 rtw_set_802_11_disassociate(struct adapter *padapter)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 5f00fe282..6e149f166 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -520,7 +520,6 @@ unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame)
 	p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + _PROBEREQ_IE_OFFSET_, WLAN_EID_SSID, (int *)&ielen,
 			len - WLAN_HDR_A3_LEN - _PROBEREQ_IE_OFFSET_);
 
-
 	/* check (wildcard) SSID */
 	if (p) {
 		if (is_valid_p2p_probereq)
@@ -773,7 +772,6 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	if (pstat->auth_seq == 0)
 		pstat->expire_to = pstapriv->auth_to;
 
-
 	if ((pstat->auth_seq + 1) != seq) {
 		status = WLAN_STATUS_UNKNOWN_AUTH_TRANSACTION;
 		goto auth_fail;
@@ -822,7 +820,6 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 		}
 	}
 
-
 	/*  Now, we are going to issue_auth... */
 	pstat->auth_seq = seq + 1;
 
@@ -831,7 +828,6 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	if (pstat->state & WIFI_FW_AUTH_SUCCESS)
 		pstat->auth_seq = 0;
 
-
 	return _SUCCESS;
 
 auth_fail:
@@ -958,7 +954,6 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	else /*  WIFI_REASSOCREQ */
 		ie_offset = _REASOCREQ_IE_OFFSET_;
 
-
 	if (pkt_len < sizeof(struct ieee80211_hdr_3addr) + ie_offset)
 		return _FAIL;
 
@@ -988,7 +983,6 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		pstat->state |= WIFI_FW_ASSOC_STATE;
 	}
 
-
 	pstat->capability = capab_info;
 
 	/* now parse all ieee802_11 ie to point to elems */
@@ -1124,7 +1118,6 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		else
 			pstat->flags |= WLAN_STA_MAYBE_WPS;
 
-
 		/*  AP support WPA/RSN, and sta is going to do WPS, but AP is not ready */
 		/*  that the selected registrar of AP is _FLASE */
 		if ((psecuritypriv->wpa_psk > 0)
@@ -1159,13 +1152,11 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 			copy_len = min(sizeof(pstat->wpa_ie), wpa_ie_len + 2u);
 		}
 
-
 		if (copy_len > 0)
 			memcpy(pstat->wpa_ie, wpa_ie-2, copy_len);
 
 	}
 
-
 	/*  check if there is WMM IE & support WWM-PS */
 	pstat->flags &= ~WLAN_STA_WME;
 	pstat->qos_option = 0;
@@ -1238,13 +1229,11 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	} else
 		pstat->flags &= ~WLAN_STA_HT;
 
-
 	if ((pmlmepriv->htpriv.ht_option == false) && (pstat->flags&WLAN_STA_HT)) {
 		status = WLAN_STATUS_CHALLENGE_FAIL;
 		goto OnAssocReqFail;
 	}
 
-
 	if ((pstat->flags & WLAN_STA_HT) &&
 		    ((pstat->wpa2_pairwise_cipher&WPA_CIPHER_TKIP) ||
 		      (pstat->wpa_pairwise_cipher&WPA_CIPHER_TKIP))) {
@@ -1285,13 +1274,11 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 			goto OnAssocReqFail;
 
-
 		} else {
 			pstapriv->sta_aid[pstat->aid - 1] = pstat;
 		}
 	}
 
-
 	pstat->state &= (~WIFI_FW_ASSOC_STATE);
 	pstat->state |= WIFI_FW_ASSOC_SUCCESS;
 
@@ -1485,7 +1472,6 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
 			associated_clients_update(padapter, updated);
 		}
 
-
 		return _SUCCESS;
 	}
 
@@ -2115,7 +2101,6 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 	pframe = (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET;
 	pwlanhdr = (struct ieee80211_hdr *)pframe;
 
-
 	fctrl = &(pwlanhdr->frame_control);
 	*(fctrl) = 0;
 
@@ -2204,12 +2189,10 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 		pframe = rtw_set_ie(pframe, WLAN_EID_ERP_INFO, 1, &erpinfo, &pattrib->pktlen);
 	}
 
-
 	/*  EXTERNDED SUPPORTED RATE */
 	if (rate_len > 8)
 		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8), (cur_network->supported_rates + 8), &pattrib->pktlen);
 
-
 	/* todo:HT for adhoc */
 
 _issue_bcn:
@@ -2281,7 +2264,6 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 	pattrib->pktlen = pattrib->hdrlen;
 	pframe += pattrib->hdrlen;
 
-
 	if (cur_network->ie_length > MAX_IE_SZ)
 		return;
 
@@ -2405,19 +2387,16 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 			pframe = rtw_set_ie(pframe, WLAN_EID_ERP_INFO, 1, &erpinfo, &pattrib->pktlen);
 		}
 
-
 		/*  EXTERNDED SUPPORTED RATE */
 		if (rate_len > 8)
 			pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8), (cur_network->supported_rates + 8), &pattrib->pktlen);
 
-
 		/* todo:HT for adhoc */
 
 	}
 
 	pattrib->last_txcmdsz = pattrib->pktlen;
 
-
 	dump_mgntframe(padapter, pmgntframe);
 
 	return;
@@ -2449,7 +2428,6 @@ static int _issue_probereq(struct adapter *padapter,
 	pattrib = &pmgntframe->attrib;
 	update_mgntframe_attrib(padapter, pattrib);
 
-
 	memset(pmgntframe->buf_addr, 0, WLANHDR_OFFSET + TXDESC_OFFSET);
 
 	pframe = (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET;
@@ -2593,7 +2571,6 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 	pframe += sizeof(struct ieee80211_hdr_3addr);
 	pattrib->pktlen = sizeof(struct ieee80211_hdr_3addr);
 
-
 	if (psta) { /*  for AP mode */
 		memcpy(pwlanhdr->addr1, psta->hwaddr, ETH_ALEN);
 		memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
@@ -2654,7 +2631,6 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 		le_tmp = cpu_to_le16(pmlmeinfo->auth_seq);
 		pframe = rtw_set_fixed_ie(pframe, _AUTH_SEQ_NUM_, (unsigned char *)&le_tmp, &(pattrib->pktlen));
 
-
 		/*  setting status code... */
 		le_tmp = cpu_to_le16(status);
 		pframe = rtw_set_fixed_ie(pframe, _STATUS_CODE_, (unsigned char *)&le_tmp, &(pattrib->pktlen));
@@ -2683,7 +2659,6 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 	dump_mgntframe(padapter, pmgntframe);
 }
 
-
 void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_info *pstat, int pkt_type)
 {
 	struct xmit_frame	*pmgntframe;
@@ -2708,7 +2683,6 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 	pattrib = &pmgntframe->attrib;
 	update_mgntframe_attrib(padapter, pattrib);
 
-
 	memset(pmgntframe->buf_addr, 0, WLANHDR_OFFSET + TXDESC_OFFSET);
 
 	pframe = (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET;
@@ -2721,7 +2695,6 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 	memcpy(GetAddr2Ptr(pwlanhdr), myid(&(padapter->eeprompriv)), ETH_ALEN);
 	memcpy(GetAddr3Ptr(pwlanhdr), get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
 
-
 	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
 	if ((pkt_type == WIFI_ASSOCRSP) || (pkt_type == WIFI_REASSOCRSP))
@@ -2880,7 +2853,6 @@ void issue_assocreq(struct adapter *padapter)
 	if (pmlmeext->cur_channel == 14) /*  for JAPAN, channel 14 can only uses B Mode(CCK) */
 		sta_bssrate_len = 4;
 
-
 	/* for (i = 0; i < sta_bssrate_len; i++) { */
 	/*  */
 
@@ -2889,12 +2861,10 @@ void issue_assocreq(struct adapter *padapter)
 			break;
 	}
 
-
 	for (i = 0; i < NDIS_802_11_LENGTH_RATES_EX; i++) {
 		if (pmlmeinfo->network.supported_rates[i] == 0)
 			break;
 
-
 		/*  Check if the AP's supported rates are also supported by STA. */
 		for (j = 0; j < sta_bssrate_len; j++) {
 			 /*  Avoid the proprietary data rate (22Mbps) of Handlink WSG-4000 AP */
@@ -2916,7 +2886,6 @@ void issue_assocreq(struct adapter *padapter)
 		goto exit; /* don't connect to AP if no joint supported rate */
 	}
 
-
 	if (bssrate_len > 8) {
 		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, 8, bssrate, &(pattrib->pktlen));
 		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (bssrate_len - 8), (bssrate + 8), &(pattrib->pktlen));
@@ -2973,7 +2942,6 @@ void issue_assocreq(struct adapter *padapter)
 	if (pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_REALTEK)
 		pframe = rtw_set_ie(pframe, WLAN_EID_VENDOR_SPECIFIC, 6, REALTEK_96B_IE, &(pattrib->pktlen));
 
-
 	pattrib->last_txcmdsz = pattrib->pktlen;
 	dump_mgntframe(padapter, pmgntframe);
 
@@ -3070,7 +3038,6 @@ int issue_nulldata(struct adapter *padapter, unsigned char *da, unsigned int pow
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct sta_info *psta;
 
-
 	/* da == NULL, assume it's null data for sta to ap*/
 	if (!da)
 		da = get_my_bssid(&(pmlmeinfo->network));
@@ -3120,7 +3087,6 @@ s32 issue_nulldata_in_interrupt(struct adapter *padapter, u8 *da)
 	struct mlme_ext_priv *pmlmeext;
 	struct mlme_ext_info *pmlmeinfo;
 
-
 	pmlmeext = &padapter->mlmeextpriv;
 	pmlmeinfo = &pmlmeext->mlmext_info;
 
@@ -3289,7 +3255,6 @@ static int _issue_deauth(struct adapter *padapter, unsigned char *da,
 
 	pattrib->last_txcmdsz = pattrib->pktlen;
 
-
 	if (wait_ack) {
 		ret = dump_mgntframe_and_wait_ack(padapter, pmgntframe);
 	} else {
@@ -3611,7 +3576,6 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 	pframe = rtw_set_fixed_ie(pframe, 1, &(category), &(pattrib->pktlen));
 	pframe = rtw_set_fixed_ie(pframe, 1, &(action), &(pattrib->pktlen));
 
-
 	/*  */
 	if (pmlmepriv->num_FortyMHzIntolerant > 0) {
 		u8 iedata = 0;
@@ -3622,7 +3586,6 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 
 	}
 
-
 	/*  */
 	memset(ICS, 0, sizeof(ICS));
 	if (pmlmepriv->num_sta_no_ht > 0) {
@@ -3663,7 +3626,6 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 
 		spin_unlock_bh(&(pmlmepriv->scanned_queue.lock));
 
-
 		for (i = 0; i < 8; i++) {
 			int j, k = 0;
 
@@ -3691,7 +3653,6 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 
 	}
 
-
 	pattrib->last_txcmdsz = pattrib->pktlen;
 
 	dump_mgntframe(padapter, pmgntframe);
@@ -4170,7 +4131,6 @@ void start_clnt_auth(struct adapter *padapter)
 	pmlmeinfo->link_count = 0;
 	pmlmeext->retry = 0;
 
-
 	netdev_dbg(padapter->pnetdev, "start auth\n");
 	issue_auth(padapter, NULL, 0);
 
@@ -4178,7 +4138,6 @@ void start_clnt_auth(struct adapter *padapter)
 
 }
 
-
 void start_clnt_assoc(struct adapter *padapter)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
@@ -4225,7 +4184,6 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 	u8 channel;
 	u8 i;
 
-
 	pregistrypriv = &padapter->registrypriv;
 	pmlmeext = &padapter->mlmeextpriv;
 
@@ -4505,10 +4463,8 @@ void report_join_res(struct adapter *padapter, int res)
 	memcpy((unsigned char *)(&(pjoinbss_evt->network.network)), &(pmlmeinfo->network), sizeof(struct wlan_bssid_ex));
 	pjoinbss_evt->network.join_res	= pjoinbss_evt->network.aid = res;
 
-
 	rtw_joinbss_event_prehandle(padapter, (u8 *)&pjoinbss_evt->network);
 
-
 	rtw_enqueue_cmd(pcmdpriv, pcmd_obj);
 
 	return;
@@ -4600,7 +4556,6 @@ void report_del_sta_event(struct adapter *padapter, unsigned char *MacAddr, unsi
 	memcpy((unsigned char *)(&(pdel_sta_evt->macaddr)), MacAddr, ETH_ALEN);
 	memcpy((unsigned char *)(pdel_sta_evt->rsvd), (unsigned char *)(&reason), 2);
 
-
 	psta = rtw_get_stainfo(&padapter->stapriv, MacAddr);
 	if (psta)
 		mac_id = (int)psta->mac_id;
@@ -4784,7 +4739,6 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 		/* update bc/mc sta_info */
 		update_bmc_sta(padapter);
 
-
 	/* turn on dynamic functions */
 	Switch_DM_Func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true);
 
@@ -5097,7 +5051,6 @@ void link_timer_hdl(struct timer_list *t)
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
-
 	if (pmlmeinfo->state & WIFI_FW_AUTH_NULL) {
 		pmlmeinfo->state = WIFI_FW_NULL_STATE;
 		report_join_res(padapter, -3);
@@ -5283,7 +5236,6 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 		/* set_msr(padapter, _HW_STATE_NOLINK_); */
 		set_msr(padapter, _HW_STATE_STATION_);
 
-
 		rtw_hal_set_hwreg(padapter, HW_VAR_MLME_DISCONNECT, NULL);
 	}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index f78194d50..e81fcfe88 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -60,7 +60,6 @@ signed int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *pada
 
 	precvframe = (union recv_frame *) precvpriv->precv_frame_buf;
 
-
 	for (i = 0; i < NR_RECVFRAME; i++) {
 		INIT_LIST_HEAD(&(precvframe->u.list));
 
@@ -180,9 +179,6 @@ int rtw_free_recvframe(union recv_frame *precvframe, struct __queue *pfree_recv_
 	return _SUCCESS;
 }
 
-
-
-
 signed int _rtw_enqueue_recvframe(union recv_frame *precvframe, struct __queue *queue)
 {
 
@@ -192,7 +188,6 @@ signed int _rtw_enqueue_recvframe(union recv_frame *precvframe, struct __queue *
 	/* INIT_LIST_HEAD(&(precvframe->u.hdr.list)); */
 	list_del_init(&(precvframe->u.hdr.list));
 
-
 	list_add_tail(&(precvframe->u.hdr.list), get_list_head(queue));
 
 	if (padapter)
@@ -257,7 +252,6 @@ u32 rtw_free_uc_swdec_pending_queue(struct adapter *adapter)
 	return cnt;
 }
 
-
 signed int rtw_enqueue_recvbuf_to_head(struct recv_buf *precvbuf, struct __queue *queue)
 {
 	spin_lock_bh(&queue->lock);
@@ -405,7 +399,6 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 					bmic_err = true;
 			}
 
-
 			if (bmic_err == true) {
 				/*  double check key_index for some timing issue , */
 				/*  cannot compare with psecuritypriv->dot118021XGrpKeyid also cause timing issue */
@@ -772,8 +765,6 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 	} else
 		ret  = _FAIL;
 
-
-
 	if (bmcast)
 		*psta = rtw_get_bcmc_stainfo(adapter);
 	else
@@ -817,7 +808,6 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 			goto exit;
 		}
 
-
 		/*  check BSSID */
 		if (is_zero_ether_addr(pattrib->bssid) ||
 		    is_zero_ether_addr(mybssid) ||
@@ -858,14 +848,12 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 		/*  */
 		memcpy(pattrib->bssid,  mybssid, ETH_ALEN);
 
-
 		*psta = rtw_get_stainfo(pstapriv, pattrib->bssid); /*  get sta_info */
 		if (!*psta) {
 			ret = _FAIL;
 			goto exit;
 		}
 
-
 	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) {
 		/* Special case */
 		ret = RTW_RX_HANDLED;
@@ -1109,7 +1097,6 @@ static union recv_frame *recvframe_defrag(struct adapter *adapter,
 		pnextrframe = (union recv_frame *)plist;
 		pnfhdr = &pnextrframe->u.hdr;
 
-
 		/* check the fragment sequence  (2nd ~n fragment frame) */
 
 		if (curfragnum != pnfhdr->attrib.frag_num) {
@@ -1197,7 +1184,6 @@ static union recv_frame *recvframe_chk_defrag(struct adapter *padapter, union re
 					/* free current defrag_q */
 					rtw_free_recvframe_queue(pdefrag_q, pfree_recv_queue);
 
-
 			/* Then enqueue the 0~(n-1) fragment into the defrag_q */
 
 			/* spin_lock(&pdefrag_q->lock); */
@@ -1236,7 +1222,6 @@ static union recv_frame *recvframe_chk_defrag(struct adapter *padapter, union re
 
 	}
 
-
 	if ((prtnframe) && (prtnframe->u.hdr.attrib.privacy)) {
 		/* after defrag we must check tkip mic code */
 		if (recvframe_chkmic(padapter,  prtnframe) == _FAIL) {
@@ -1349,7 +1334,6 @@ static signed int validate_recv_data_frame(struct adapter *adapter, union recv_f
 	if (ret == _FAIL || ret == RTW_RX_HANDLED)
 		goto exit;
 
-
 	if (!psta) {
 		ret = _FAIL;
 		goto exit;
@@ -1359,7 +1343,6 @@ static signed int validate_recv_data_frame(struct adapter *adapter, union recv_f
 	/* psta->signal_quality = prxcmd->sq; */
 	precv_frame->u.hdr.psta = psta;
 
-
 	pattrib->amsdu = 0;
 	pattrib->ack_policy = 0;
 	/* parsing QC field */
@@ -1377,7 +1360,6 @@ static signed int validate_recv_data_frame(struct adapter *adapter, union recv_f
 		pattrib->hdrlen = pattrib->to_fr_ds == 3 ? 30 : 24;
 	}
 
-
 	if (pattrib->order)/* HT-CTRL 11n */
 		pattrib->hdrlen += 4;
 
@@ -1827,7 +1809,6 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 	/* spin_lock_irqsave(&ppending_recvframe_queue->lock, irql); */
 	/* spin_lock(&ppending_recvframe_queue->lock); */
 
-
 	phead = get_list_head(ppending_recvframe_queue);
 	plist = get_next(phead);
 
@@ -1846,7 +1827,6 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 
 	}
 
-
 	/* spin_lock_irqsave(&ppending_recvframe_queue->lock, irql); */
 	/* spin_lock(&ppending_recvframe_queue->lock); */
 
@@ -1962,7 +1942,6 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 				/* error condition; */
 			}
 
-
 			/* Update local variables. */
 			bPktInBuf = false;
 
@@ -2037,7 +2016,6 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 		goto _err_exit;
 	}
 
-
 	/* s4. */
 	/*  Indication process. */
 	/*  After Packet dropping and Sliding Window shifting as above, we can now just indicate the packets */
@@ -2065,7 +2043,6 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 	return _FAIL;
 }
 
-
 void rtw_reordering_ctrl_timeout_handler(struct timer_list *t)
 {
 	struct recv_reorder_ctrl *preorder_ctrl =
@@ -2073,7 +2050,6 @@ void rtw_reordering_ctrl_timeout_handler(struct timer_list *t)
 	struct adapter *padapter = preorder_ctrl->padapter;
 	struct __queue *ppending_recvframe_queue = &preorder_ctrl->pending_recvframe_queue;
 
-
 	if (padapter->bDriverStopped || padapter->bSurpriseRemoved)
 		return;
 
@@ -2221,7 +2197,6 @@ static int recv_func(struct adapter *padapter, union recv_frame *rframe)
 	return ret;
 }
 
-
 s32 rtw_recv_entry(union recv_frame *precvframe)
 {
 	struct adapter *padapter;
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 6a7c09db4..cc8c323c1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -340,7 +340,6 @@ void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigne
 
 	center_ch = rtw_get_center_ch(channel, bwmode, channel_offset);
 
-
 	/* set Channel */
 	if (mutex_lock_interruptible(&(adapter_to_dvobj(padapter)->setch_mutex)))
 		return;
-- 
2.43.0

