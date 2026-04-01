Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B908E21ADCB
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 02:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775009646; cv=none; b=mApS9Bios8Pm6/U0vhSh4+SKpLKEI7r5cpGyGZDVSHnu/ZM8I0Ccl3QSAfA70wZAZ338VpJZTPTVpM8d86/FQFjWMnnqX2gF24UP1E/pCqKIGpsmRD3PEBkfyD0PiBWma0mRBMxtZv5W4AXDBx49rbpOhzm1BAqx84Z6B3QnjsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775009646; c=relaxed/simple;
	bh=iLaXwmun8Wvsp+gKwrWJBkiCJgDya5XoV44fWcZ5Fj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KuN2Xf40ATW3j43F5fMMdTZc+H1m4EDNLK+pUaxbXu8cJDmQGP7ehKD2m34IIo/DDuxf9yy15T3MnxrAE5AvOuVIAzO6m3ovgOI95Isin7fCi0xd8OSrErBXZya+WCis2UI1XO+JEOeH/retFYGr9st/PmTnDoCI14Pq6wlj024=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QvfSuxwR; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvfSuxwR"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6500040f128so7763491d50.0
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 19:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775009644; x=1775614444; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SObpnJVeWfGqN9JTvGH1ashBk4cFLy6vnhnxbqUloA=;
        b=QvfSuxwRKjmRjmp0S4gkb60zfUY0NdXFvpgADTQlPVBcjAm8bElkD0fd22683ltXL0
         xHnuPeijIo0lb4ZDJotf6V522A3p+r/u5vUzo1wFu8qem+3w8H1zGxLPIjJaWc5Q3Yt2
         8U5nykQs5meYzw23LTrlJoX8Or2ju91vzCsFyHy5zc7/ZgtlHZDnsBSTBVBlqSSnKinx
         n5pXP8c6COBU6RyqfRkr8/KX1wWg9SXT84/pEfe6IwGdMClSYRXueEXTbFs1LLoRoNkt
         RPjMPCa4GBV0F0KbWIip8UCsPGmSX+u7TSK92BDFwh/86pG5WcHyyx+idn7BEs1QuCB6
         QgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775009644; x=1775614444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1SObpnJVeWfGqN9JTvGH1ashBk4cFLy6vnhnxbqUloA=;
        b=jjpf2YSBlsgM0XP4OJVl0wscSKPOo2VdLEebBUwRdhp8mNHTNmX3yDDKSoBFroxA0E
         bv/1ao0S9vz4BQGdBb5sWO1khW3l+w0OF+K8Xbtwi6gAzpYaCI9z8t68IcGuqsQuVoF8
         u/4jXIbddotbrVOlSESLRXLRAa/r2QAqIkWhpHlB/07/xomNxDHdI+Vn99stbJWAlGTs
         b+M2S/+wHvjfHv5ymRBy9fvNDADPi9TTA5rGYV7jGTAPJT28BtIZkevy2w20//IljQUl
         oln9MeBCmdG6AutnPUZXJWLV0m9th+Y2Xhjf6cNDu603I9OyYDRJchzmVzESl7pTTXlW
         LKAw==
X-Forwarded-Encrypted: i=1; AJvYcCUpkjyVikXy0s3g0PJU3rZYjx0aInqUj2ASJl2FgHG8uVILG3lBJNBxv1paEdR4aSN3vaU9F+VeUZxDhJGN@lists.linux.dev
X-Gm-Message-State: AOJu0YxEXuvxx/H/1S5s1e6UgIoExcFc3Hb2wUTYH/NWgPSvtk1HI2LF
	G4RU7jaYGgRJMOMegUFtJNm1nPQftvS46+7UhZJYY+n+WBz2RsZ8+Y2v
X-Gm-Gg: ATEYQzw8nKQ7gdL2od3wylp/NksVM9I3uRJ3W00g7dYQufaRgjK0/SxguR2jMNu/K6M
	3egEqkNeIwkV2vnZbZqUuxmKYHLIkpm0oKtYWkcc/FYs2upWH3YyC9GXSUzg1K6TvCJ87pSIc76
	UrjlELGQkNNZ2vOIePNEQ8R4851d0t2M0t8tuyU2pnEBxe/0BN6VgyXbRcbAiFoxjjom2t5hPKo
	w73ct54QDAEDh/jCv+zsFzWIWWMI1KucY7GjnNnrLYSB7RJAn8BZ7jMV0R+iplp+iNrMVs0F/9f
	r6kqNoRgBNWyVnFO5RysHCB7uYPChV8LI79pDm3plCdUF2kxm+zcUVG0ZHbFSk+THj1sZ7kEhtB
	wqR1s9NW7o0qrjmfbMs3q88hra4nhjdTTIUFxpPFxLp7xZLqvId5fagpChloSiJhfi83aEReBJR
	6E0Bqef9Ry5E0lyuJ+2KN8JjH2irntIz0mm8mN/p8zoQNxOcSfz1a0pby5KqbWsBVSSSY7ohxus
	eVi1c3vRknoWDR0ia9W9QTj
X-Received: by 2002:a05:690e:2502:20b0:64e:e567:1b1e with SMTP id 956f58d0204a3-6502fdd287amr1454069d50.31.1775009643768;
        Tue, 31 Mar 2026 19:14:03 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65009326eddsm6398951d50.13.2026.03.31.19.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 19:14:03 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v2 1/2] staging: rtl8723bs: Remove dead code
Date: Tue, 31 Mar 2026 21:13:56 -0500
Message-ID: <20260401021357.1176600-2-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401021357.1176600-1-ethantidmore06@gmail.com>
References: <20260401021357.1176600-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove commented out code and remove if statement with no body but a
line of commented out code.

Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
v2:
- Leave commeneted out if statement and keep scope.

 drivers/staging/rtl8723bs/core/rtw_ap.c | 68 +------------------------
 1 file changed, 1 insertion(+), 67 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 4cdcdddf6b33..8d1a35de037a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -20,8 +20,6 @@ void init_mlme_ap_info(struct adapter *padapter)
 	INIT_LIST_HEAD(&pacl_list->acl_node_q.queue);
 	spin_lock_init(&pacl_list->acl_node_q.lock);
 
-	/* pmlmeext->bstart_bss = false; */
-
 	start_ap_mode(padapter);
 }
 
@@ -32,8 +30,6 @@ void free_mlme_ap_info(struct adapter *padapter)
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
-	/* stop_ap_mode(padapter); */
-
 	pmlmepriv->update_bcn = false;
 	pmlmeext->bstart_bss = false;
 
@@ -377,7 +373,6 @@ void update_bmc_sta(struct adapter *padapter)
 
 	if (psta) {
 		psta->aid = 0;/* default set to 0 */
-		/* psta->mac_id = psta->aid+4; */
 		psta->mac_id = psta->aid + 1;/* mac_id = 1 for bc/mc stainfo */
 
 		pmlmeinfo->FW_sta_info[psta->mac_id].psta = psta;
@@ -448,12 +443,6 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
 	struct ht_priv *phtpriv_ap = &pmlmepriv->htpriv;
 	struct ht_priv *phtpriv_sta = &psta->htpriv;
 	u8 cur_ldpc_cap = 0, cur_stbc_cap = 0, cur_beamform_cap = 0;
-	/* set intf_tag to if1 */
-	/* psta->intf_tag = 0; */
-
-	/* psta->mac_id = psta->aid+4; */
-	/* psta->mac_id = psta->aid+1;//alloc macid when call rtw_alloc_stainfo(), */
-	/* release macid when call rtw_free_stainfo() */
 
 	/* ap mode */
 	rtw_hal_set_odm_var(padapter, HAL_ODM_STA_INFO, psta, true);
@@ -544,9 +533,6 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
 
 	memset(&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
-	/* add ratid */
-	/* add_ratid(padapter, psta); move to ap_sta_info_defer_update() */
-
 	spin_lock_bh(&psta->lock);
 	psta->state |= _FW_LINKED;
 	spin_unlock_bh(&psta->lock);
@@ -567,9 +553,6 @@ static void update_ap_info(struct adapter *padapter, struct sta_info *psta)
 
 	/* HT related cap */
 	if (phtpriv_ap->ht_option) {
-		/* check if sta supports rx ampdu */
-		/* phtpriv_ap->ampdu_enable = phtpriv_ap->ampdu_enable; */
-
 		/* check if sta support s Short GI 20M */
 		if ((phtpriv_ap->ht_cap.cap_info) & cpu_to_le16(IEEE80211_HT_CAP_SGI_20))
 			phtpriv_ap->sgi_20m = true;
@@ -621,11 +604,6 @@ static void update_hw_ht_param(struct adapter *padapter)
 	pmlmeinfo->SM_PS =
 		(le16_to_cpu(pmlmeinfo->HT_caps.u.HT_cap_element.HT_caps_info) &
 		 0x0C) >> 2;
-
-	/*  */
-	/*  Config current HT Protection mode. */
-	/*  */
-	/* pmlmeinfo->HT_protection = pmlmeinfo->HT_info.infos[1] & 0x3; */
 }
 
 void start_bss_network(struct adapter *padapter)
@@ -662,16 +640,11 @@ void start_bss_network(struct adapter *padapter)
 		pmlmeext->bstart_bss = true;
 
 	/* todo: update wmm, ht cap */
-	/* pmlmeinfo->WMM_enable; */
-	/* pmlmeinfo->HT_enable; */
 	if (pmlmepriv->qospriv.qos_option)
 		pmlmeinfo->WMM_enable = true;
 	if (pmlmepriv->htpriv.ht_option) {
 		pmlmeinfo->WMM_enable = true;
 		pmlmeinfo->HT_enable = true;
-		/* pmlmeinfo->HT_info_enable = true; */
-		/* pmlmeinfo->HT_caps_enable = true; */
-
 		update_hw_ht_param(padapter);
 	}
 
@@ -694,7 +667,6 @@ void start_bss_network(struct adapter *padapter)
 	rtw_hal_set_hwreg(padapter, HW_VAR_AC_PARAM_VO, (u8 *)(&acparm));
 	acparm = 0x005E4317; /*  VI */
 	rtw_hal_set_hwreg(padapter, HW_VAR_AC_PARAM_VI, (u8 *)(&acparm));
-	/* acparm = 0x00105320; // BE */
 	acparm = 0x005ea42b;
 	rtw_hal_set_hwreg(padapter, HW_VAR_AC_PARAM_BE, (u8 *)(&acparm));
 	acparm = 0x0000A444; /*  BK */
@@ -711,18 +683,8 @@ void start_bss_network(struct adapter *padapter)
 	rtw_hal_set_hwreg(padapter, HW_VAR_DO_IQK, NULL);
 
 	if (!pmlmepriv->cur_network.join_res) { /* setting only at  first time */
-		/* u32 initialgain; */
-
-		/* initialgain = 0x1e; */
-
-		/* disable dynamic functions, such as high power, DIG */
-		/* Save_DM_Func_Flag(padapter); */
-		/* Switch_DM_Func(padapter, DYNAMIC_FUNC_DISABLE, false); */
-
 		/* turn on all dynamic functions */
 		Switch_DM_Func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true);
-
-		/* rtw_hal_set_hwreg(padapter, HW_VAR_INITIAL_GAIN, (u8 *)(&initialgain)); */
 	}
 
 	/* set channel, bwmode */
@@ -739,21 +701,17 @@ void start_bss_network(struct adapter *padapter)
 
 		if ((cbw40_enable) &&	 (pht_info->infos[0] & BIT(2))) {
 			/* switch to the 40M Hz mode */
-			/* pmlmeext->cur_bwmode = CHANNEL_WIDTH_40; */
 			cur_bwmode = CHANNEL_WIDTH_40;
 			switch (pht_info->infos[0] & 0x3) {
 			case 1:
-				/* pmlmeext->cur_ch_offset = HAL_PRIME_CHNL_OFFSET_LOWER; */
 				cur_ch_offset = HAL_PRIME_CHNL_OFFSET_LOWER;
 				break;
 
 			case 3:
-				/* pmlmeext->cur_ch_offset = HAL_PRIME_CHNL_OFFSET_UPPER; */
 				cur_ch_offset = HAL_PRIME_CHNL_OFFSET_UPPER;
 				break;
 
 			default:
-				/* pmlmeext->cur_ch_offset = HAL_PRIME_CHNL_OFFSET_DONT_CARE; */
 				cur_ch_offset = HAL_PRIME_CHNL_OFFSET_DONT_CARE;
 				break;
 			}
@@ -789,8 +747,6 @@ void start_bss_network(struct adapter *padapter)
 
 	/* update bc/mc sta_info */
 	update_bmc_sta(padapter);
-
-	/* pmlmeext->bstart_bss = true; */
 }
 
 int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
@@ -836,12 +792,9 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	/* beacon interval */
 	/* ie + 8;	8: TimeStamp, 2: Beacon Interval 2:Capability */
 	p = rtw_get_beacon_interval_from_ie(ie);
-	/* pbss_network->configuration.beacon_period = le16_to_cpu(*(unsigned short*)p); */
 	pbss_network->configuration.beacon_period = get_unaligned_le16(p);
 
 	/* capability */
-	/* cap = *(unsigned short *)rtw_get_capability_from_ie(ie); */
-	/* cap = le16_to_cpu(cap); */
 	cap = get_unaligned_le16(ie);
 
 	/* SSID */
@@ -1075,12 +1028,6 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 	pmlmepriv->htpriv.ht_option = false;
 
-	if ((psecuritypriv->wpa2_pairwise_cipher & WPA_CIPHER_TKIP) ||
-	    (psecuritypriv->wpa_pairwise_cipher & WPA_CIPHER_TKIP)) {
-		/* todo: */
-		/* ht_cap = false; */
-	}
-
 	/* ht_cap */
 	if (pregistrypriv->ht_enable && ht_cap) {
 		pmlmepriv->htpriv.ht_option = true;
@@ -1098,7 +1045,6 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		get_wlan_bssid_ex_sz((struct wlan_bssid_ex *)pbss_network);
 
 	/* issue beacon to start bss network */
-	/* start_bss_network(padapter, (u8 *)pbss_network); */
 	rtw_startbss_cmd(padapter, RTW_CMDF_WAIT_ACK);
 
 	/* alloc sta_info for ap itself */
@@ -1117,9 +1063,6 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 	pmlmepriv->cur_network.join_res = true;/* for check if already set beacon */
 
-	/* update bc/mc sta_info */
-	/* update_bmc_sta(padapter); */
-
 	return ret;
 }
 
@@ -1475,14 +1418,12 @@ void update_beacon(struct adapter *padapter, u8 ie_id, u8 *oui, u8 tx)
 {
 	struct mlme_priv *pmlmepriv;
 	struct mlme_ext_priv *pmlmeext;
-	/* struct mlme_ext_info *pmlmeinfo; */
 
 	if (!padapter)
 		return;
 
 	pmlmepriv = &padapter->mlmepriv;
 	pmlmeext = &padapter->mlmeextpriv;
-	/* pmlmeinfo = &(pmlmeext->mlmext_info); */
 
 	if (!pmlmeext->bstart_bss)
 		return;
@@ -1540,10 +1481,8 @@ void update_beacon(struct adapter *padapter, u8 ie_id, u8 *oui, u8 tx)
 
 	spin_unlock_bh(&pmlmepriv->bcn_update_lock);
 
-	if (tx) {
-		/* send_beacon(padapter);//send_beacon must execute on TSR level */
+	if (tx)
 		set_tx_beacon_cmd(padapter);
-	}
 }
 
 /*
@@ -1847,8 +1786,6 @@ u8 ap_free_sta(struct adapter *padapter,
 	psta->htpriv.agg_enable_bitmap = 0x0;/* reset */
 	psta->htpriv.candidate_tid_bitmap = 0x0;/* reset */
 
-	/* report_del_sta_event(padapter, psta->hwaddr, reason); */
-
 	/* clear cam entry / key */
 	rtw_clearstakey_cmd(padapter, psta, true);
 
@@ -1888,9 +1825,7 @@ void rtw_sta_flush(struct adapter *padapter)
 		list_del_init(&psta->asoc_list);
 		pstapriv->asoc_list_cnt--;
 
-		/* spin_unlock_bh(&pstapriv->asoc_list_lock); */
 		ap_free_sta(padapter, psta, true, WLAN_REASON_DEAUTH_LEAVING);
-		/* spin_lock_bh(&pstapriv->asoc_list_lock); */
 	}
 	spin_unlock_bh(&pstapriv->asoc_list_lock);
 
@@ -2017,7 +1952,6 @@ void start_ap_mode(struct adapter *padapter)
 
 	pmlmepriv->update_bcn = false;
 
-	/* init_mlme_ap_info(padapter); */
 	pmlmeext->bstart_bss = false;
 
 	pmlmepriv->num_sta_non_erp = 0;
-- 
2.53.0

