Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D88B36EAA7
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 16:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889715; cv=none; b=nCtqvDl+UIxaxla5xoTiBiCvKl8YHYjhsBtEUx6VC6Z4XCZ0/6MQMsLRTTyJTn/QUls+CeMVsnaYxrLXRC4ulA+ii1LL8hxkHSrMlGMsgFKoFT0lvH82YQLZUaVfHlmP9VYJp84EYx1uvrA4BwspuZK2OE3FPGjAin1EReml7gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889715; c=relaxed/simple;
	bh=+SaACf2PNmxd5pQWD0kHDgFviaN9ipDMh+KEaWIpRr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kl9llncp2ak1odUKqzt1EABR55zRfgBJU1BuyHFmxxUGaxy0pYTwRp5o+cPWG5OOjeeMSOy5b88GD4YnBQWhExmRyvQv+d+uv3qUP1r+l5SA1qXKbmMqrtcomHARaiP0i5/XxohPbfxvksa2qAHLtAVxbBKRElvRpQ9Uk4fRWSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kv9gR/Y8; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kv9gR/Y8"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6500040f172so5364287d50.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 09:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774889713; x=1775494513; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2f9qYmvdl3SMYn7348I/foZIVCTRci1cAAcILJVHy94=;
        b=Kv9gR/Y8oAeMpEXaHIu3lVGJK4BJkoxjJ3VW9IKHn1HO16jiWd7xsMLkA3W2e6IraO
         x6uscJ6EMeVYmZ6o2AY1ji5ogHqRUPYJZa5LtvAmt42tvrMBWJVs2yGW7dViAPiAl9Yc
         A0ek0Xw3peDy0i7sundbllkJDuePSNhwejeHXCLS8+erQ/e2m0OqFb/YXYYmDYhcoHZK
         EUkXOUxJd6vDHe2uQKkCOQpsI8K0g5ZZGnPOTQiJxWsAlUnMAOaEqm0qYFrhHR4iqnOh
         b+0yKkvcofRIWBdagDBy7H7nGsyKYi25MIsYG+DwEaZXBmc7vXU76ZG5cDQXiDhrVXB5
         X7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774889713; x=1775494513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2f9qYmvdl3SMYn7348I/foZIVCTRci1cAAcILJVHy94=;
        b=Lg5xKVNBexvaf5bNZTqQshuJ0GKtdwEgWyJ0VF/6e4m4uXwxor01CSTQGpp4/wuU9P
         ThJ1OclQaDoUiK+xNh2BZZ1nZP8uxq7TZfQQcPjRXImAqUv1Lo62iXpsQnGYDSqxVFTS
         FW0TiljMaYC0OLjRP60Nf//z/xqPmCRkC8nq3R/2S4sjzf0AYe/szeSmNRdkDXvEGjh+
         oBF03yRwoS1KGlmlUzTo3iCUb1mBT4nrKSaqcVg+eGTnDGj5pjx0dmwRW19S1MRfjQqo
         Ooczj52uTAmgsIgBXKoLYxRxSgievjuazI726bW7uD1zSwMK8KzNABBKGt0f1BZPvtkW
         +e4w==
X-Forwarded-Encrypted: i=1; AJvYcCWDNOMRKi6GXHWuoGcjVWeOBkZBmvAIlG6dL42qNvF3ACO5lTK+KyHEKlzvoQ5jlq4XlShpOFg5BSFOuLFg@lists.linux.dev
X-Gm-Message-State: AOJu0YxXgiY/n9eEKMkx7PSaTC701Wi1yafRkNyknUIM9UtCsvayQRkJ
	ceCrHiiY5o5k6kiPQPdSXd227SiSnzGEk/mrBbzwnEsjNVFwHXKKfsJM
X-Gm-Gg: ATEYQzyygCcwEKqFRvK1nEhWZSgFyYHZtJA1M0RMqCpSE68LXXQLWt4GSfN24kNNskZ
	79VYNH946Sepx5+f2BiUPBoV5hXhcODKpslxC4TZ6utu/+97MBUaaD1ufGsLvlEUf9KIr9oyR3p
	P/qIgeAJMYuA6Or2DQWTlNMQ7pXLD8rZ3OdThWeNzDXRY+4Jzm9MFvrZunO8PGghjF8yV3UcfJ+
	CIZVNHPZwj3+fOCt/4b2CK1UhytywEfq6Rq5+1TvZ9rhX0oi7Yz+mh3Iax2228NUqDKJVFsy+5i
	ho4gugVMCRkJOHP+8hCwlDnAvmsTjeiY0Mvegg6+HIQT6i0NMPOG4k5Vhs3f6a2nraf0C4fD8tO
	kHDWvtv3Uslrvzv3nXFQTRjoN02DD4dBLmPqse580So/hC/Epg71A2C/cqJ37bo4W+NqUIGePfD
	532nXQ6ob2IXCxLQfqscAO5XLaQAUk9lFrrbfNdOpq05QIjwRgr0P2VIfcbl5LVWW4gzJNrW6tI
	F4qRnrne+c6AzLzIflxkB0fmIvar3otZS0=
X-Received: by 2002:a05:690c:6e87:b0:79a:bf27:fe65 with SMTP id 00721157ae682-79bde0a01f5mr130241797b3.35.1774889713195;
        Mon, 30 Mar 2026 09:55:13 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a09583f32asm1639527b3.24.2026.03.30.09.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 09:55:12 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: Remove dead code
Date: Mon, 30 Mar 2026 11:55:09 -0500
Message-ID: <20260330165510.33134-2-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330165510.33134-1-ethantidmore06@gmail.com>
References: <20260330165510.33134-1-ethantidmore06@gmail.com>
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
 drivers/staging/rtl8723bs/core/rtw_ap.c | 83 +++----------------------
 1 file changed, 7 insertions(+), 76 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 4b4012411011..3327519dd729 100644
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
@@ -413,17 +408,14 @@ void update_bmc_sta(struct adapter *padapter)
 		/* ap mode */
 		rtw_hal_set_odm_var(padapter, HAL_ODM_STA_INFO, psta, true);
 
-		/* if (pHalData->fw_ractrl == true) */
-		{
-			u8 arg[4] = {0};
+		u8 arg[4] = {0};
 
-			arg[0] = psta->mac_id;
-			arg[1] = psta->raid;
-			arg[2] = 0;
-			arg[3] = psta->init_rate;
+		arg[0] = psta->mac_id;
+		arg[1] = psta->raid;
+		arg[2] = 0;
+		arg[3] = psta->init_rate;
 
-			rtw_hal_add_ra_tid(padapter, tx_ra_bitmap, arg, 0);
-		}
+		rtw_hal_add_ra_tid(padapter, tx_ra_bitmap, arg, 0);
 
 		rtw_sta_media_status_rpt(padapter, psta, 1);
 
@@ -448,12 +440,6 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
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
@@ -544,9 +530,6 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
 
 	memset(&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
-	/* add ratid */
-	/* add_ratid(padapter, psta); move to ap_sta_info_defer_update() */
-
 	spin_lock_bh(&psta->lock);
 	psta->state |= _FW_LINKED;
 	spin_unlock_bh(&psta->lock);
@@ -567,9 +550,6 @@ static void update_ap_info(struct adapter *padapter, struct sta_info *psta)
 
 	/* HT related cap */
 	if (phtpriv_ap->ht_option) {
-		/* check if sta supports rx ampdu */
-		/* phtpriv_ap->ampdu_enable = phtpriv_ap->ampdu_enable; */
-
 		/* check if sta support s Short GI 20M */
 		if ((phtpriv_ap->ht_cap.cap_info) & cpu_to_le16(IEEE80211_HT_CAP_SGI_20))
 			phtpriv_ap->sgi_20m = true;
@@ -621,11 +601,6 @@ static void update_hw_ht_param(struct adapter *padapter)
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
@@ -662,16 +637,11 @@ void start_bss_network(struct adapter *padapter)
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
 
@@ -694,7 +664,6 @@ void start_bss_network(struct adapter *padapter)
 	rtw_hal_set_hwreg(padapter, HW_VAR_AC_PARAM_VO, (u8 *)(&acparm));
 	acparm = 0x005E4317; /*  VI */
 	rtw_hal_set_hwreg(padapter, HW_VAR_AC_PARAM_VI, (u8 *)(&acparm));
-	/* acparm = 0x00105320; // BE */
 	acparm = 0x005ea42b;
 	rtw_hal_set_hwreg(padapter, HW_VAR_AC_PARAM_BE, (u8 *)(&acparm));
 	acparm = 0x0000A444; /*  BK */
@@ -711,18 +680,8 @@ void start_bss_network(struct adapter *padapter)
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
@@ -739,21 +698,17 @@ void start_bss_network(struct adapter *padapter)
 
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
@@ -789,8 +744,6 @@ void start_bss_network(struct adapter *padapter)
 
 	/* update bc/mc sta_info */
 	update_bmc_sta(padapter);
-
-	/* pmlmeext->bstart_bss = true; */
 }
 
 int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
@@ -836,12 +789,9 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
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
@@ -1075,12 +1025,6 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
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
@@ -1098,7 +1042,6 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		get_wlan_bssid_ex_sz((struct wlan_bssid_ex *)pbss_network);
 
 	/* issue beacon to start bss network */
-	/* start_bss_network(padapter, (u8 *)pbss_network); */
 	rtw_startbss_cmd(padapter, RTW_CMDF_WAIT_ACK);
 
 	/* alloc sta_info for ap itself */
@@ -1117,9 +1060,6 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 	pmlmepriv->cur_network.join_res = true;/* for check if already set beacon */
 
-	/* update bc/mc sta_info */
-	/* update_bmc_sta(padapter); */
-
 	return ret;
 }
 
@@ -1475,14 +1415,12 @@ void update_beacon(struct adapter *padapter, u8 ie_id, u8 *oui, u8 tx)
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
@@ -1540,10 +1478,8 @@ void update_beacon(struct adapter *padapter, u8 ie_id, u8 *oui, u8 tx)
 
 	spin_unlock_bh(&pmlmepriv->bcn_update_lock);
 
-	if (tx) {
-		/* send_beacon(padapter);//send_beacon must execute on TSR level */
+	if (tx)
 		set_tx_beacon_cmd(padapter);
-	}
 }
 
 /*
@@ -1847,8 +1783,6 @@ u8 ap_free_sta(struct adapter *padapter,
 	psta->htpriv.agg_enable_bitmap = 0x0;/* reset */
 	psta->htpriv.candidate_tid_bitmap = 0x0;/* reset */
 
-	/* report_del_sta_event(padapter, psta->hwaddr, reason); */
-
 	/* clear cam entry / key */
 	rtw_clearstakey_cmd(padapter, psta, true);
 
@@ -1888,9 +1822,7 @@ void rtw_sta_flush(struct adapter *padapter)
 		list_del_init(&psta->asoc_list);
 		pstapriv->asoc_list_cnt--;
 
-		/* spin_unlock_bh(&pstapriv->asoc_list_lock); */
 		ap_free_sta(padapter, psta, true, WLAN_REASON_DEAUTH_LEAVING);
-		/* spin_lock_bh(&pstapriv->asoc_list_lock); */
 	}
 	spin_unlock_bh(&pstapriv->asoc_list_lock);
 
@@ -2017,7 +1949,6 @@ void start_ap_mode(struct adapter *padapter)
 
 	pmlmepriv->update_bcn = false;
 
-	/* init_mlme_ap_info(padapter); */
 	pmlmeext->bstart_bss = false;
 
 	pmlmepriv->num_sta_non_erp = 0;
-- 
2.53.0

