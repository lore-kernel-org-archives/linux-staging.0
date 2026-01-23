Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78ADA26C3BD
	for <linux-staging@lists.linux.dev>; Fri, 23 Jan 2026 21:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769203169; cv=none; b=oh6DFF69AI4SzZlXif04ejMIzmM4cWBP7K3iIzLeZo7kwQR9DBolOBezdQJFLXGbUx23joAKk02HRG2hVma3YN5TlP/M7fxDYIwZYTllupBA9+kQI6TyUmZYUvMQ88hriutirYmIabHjJXnDrw0tHptCv5FFqvkt79qsExD/+ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769203169; c=relaxed/simple;
	bh=x081jC8JXriAE4oHCAWY2bSuHY7h6TucW0qI94b3sjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fO3eY0As5xvmoUJx+GZ7C2uktCuCjilcPQ1UtuZOBnbn+nulnEe1ai04hYpWpRBHRehRJTvs6ufaPrN3wYM4atX8Jx+HbkluyUgo+dHVH5j6vpNlZgBcGs8I+O7FgYJx87sYwJmfbN8NKJEo/CE5FqJMQwlrw3zReKt+zJMW8Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABTiHhwh; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABTiHhwh"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-81dbc0a99d2so1376806b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 23 Jan 2026 13:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769203167; x=1769807967; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnGBmszyGaByDQK4I91utuBBzBnkbHQvK2pzSg1xsvc=;
        b=ABTiHhwhu6CtOHy01WtvG24AXeq84+DzwWfhpzAEnyRUuoV1abl3zmbb9UnMLzb1T2
         2YECoPrsyWvlYL1ml+0MYLmu4MEMu3y2NKwNHf4R6iEMVf/yu4KHwyNGBY2Mi6GGrJ38
         rHMLkcKrTrsP3S3Gf9GO1e6yPntC+LMsVJcA4cl16D9MF+Xd3dP6W+4d7ey/ac7QSU7x
         87vhtdlDp/HBylLATgAhowEEgW2x4xl9r/yjE8dYjMfYtC9njCsHxCIMQCTFpQo6XCNi
         flFXfakOw6l0OmA6LUZA6n8D+nL/BTX0USorK53rGllBt4XNg0ehJfTvlQRV8/3XqGkF
         UsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769203167; x=1769807967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MnGBmszyGaByDQK4I91utuBBzBnkbHQvK2pzSg1xsvc=;
        b=Du6vnp2m1Z0y6B8OA/iUFV0r4I3Dyz4Djy4SmJYBDvUjIptrcEZWzOJQQ1rTxDD8Ld
         fkRsTpsqIXEnojpYoUcIkBrITyUlBmZ+BLWdCcGCDAeN367IZu+lh0wHEyJuR/fZPk7k
         Y3JiEwmjHWXLxMuTygYtxocysRfmoKExMlsZKNQ3+BSFcrxJvCww4a+51qEup0G1S05h
         QuqUhiAM9oQc5GJ0qF8av34XFlGlro6M3Cr0ntL43jzsc3fRm0hXbi+qnpHlTbV6dkUW
         NpNOi79sAoQe5LgvbV7MQtoH9UEyptEBhMGsRDsmzu9HJz7zDGM9ToXwl50d4DC5T/ii
         TRqA==
X-Gm-Message-State: AOJu0YwseO/uhkSoVH33jC20lmo/r8xTupQnzWlS+NGGcKfXJzsbBCpo
	TOEVW/4GMIn7DO+PEPg8mIlbfPlJ2sz7pTT54MJSkwwp78hMw5B9tO8mKc6qhrBc
X-Gm-Gg: AZuq6aIZZNP5lUogMxb843vW3F3jZFLYdg14tr0NZVdgxKjInxx9rALYHma1ulFtgT2
	Hu427lQ4GY4S3l44KRjtbcw+eSQgx7a7drK4YHJATRXLRbOZVdou/54v+9cu1PwoorlMDm003mV
	W4lH2xsIx7/malOO+RfZnYH7yjWN8ErHjenfn+mtIwsmHHZMdXjx0DGpLEcKfZqpMkpGXDvINkF
	uRgqW6NPi3bhMBBLvhFEkT97MKhpzGZlo+Aa1dlA7xgSrqQ9dCsxAmLYqBLZBU+wHwDQmRzZugp
	YwTV/jJREKqf1+Ib9asFAbxqf8+eU3xXZNgQ+xUCzuPQS18HM4Lgj4o6wzyudWwYVzO7kSAVGP1
	dS8NF7jSUfMvs7mhwyVHFp6hLVDyzfCjJabBxU4UP9V4maPWzhFf6Fo7X52QI42Cy9VnyeFHSlK
	T0hguxgMeh+rZVZsGe0gOdjmOYjsquxvxVID4C/XeiZOY=
X-Received: by 2002:a05:6a21:4591:b0:38b:ecae:6718 with SMTP id adf61e73a8af0-38e6f52f48fmr4193861637.0.1769203166623;
        Fri, 23 Jan 2026 13:19:26 -0800 (PST)
Received: from tehuang-Alienware-m16-R2.. ([50.47.240.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a141fc4sm2779469a12.8.2026.01.23.13.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 13:19:26 -0800 (PST)
From: Michael Huang <tehsiu.huang@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Huang <tehsiu.huang@gmail.com>
Subject: [PATCH v3 2/2] staging: rtl8723bs: fix line length and coding style issues
Date: Fri, 23 Jan 2026 13:19:04 -0800
Message-ID: <20260123211904.64589-3-tehsiu.huang@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123211904.64589-1-tehsiu.huang@gmail.com>
References: <20260123211904.64589-1-tehsiu.huang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warnings regarding line length exceeding 100
columns, white spaces, and unnecessary braces in rtw_mlme_ext.c.

Signed-off-by: Michael Huang <tehsiu.huang@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 81 ++++++++++---------
 1 file changed, 45 insertions(+), 36 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 0ab3629608ce..848d503ffd1d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1120,11 +1120,10 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 	pstat->flags &= ~(WLAN_STA_WPS | WLAN_STA_MAYBE_WPS);
 	if (!wpa_ie) {
-		if (elems.wps_ie) {
+		if (elems.wps_ie)
 			pstat->flags |= WLAN_STA_WPS;
-		} else {
+		else
 			pstat->flags |= WLAN_STA_MAYBE_WPS;
-		}
 
 
 		/*  AP support WPA/RSN, and sta is going to do WPS, but AP is not ready */
@@ -4939,7 +4938,9 @@ void _linked_info_dump(struct adapter *padapter)
 	if (padapter->bLinkInfoDump) {
 
 		if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE)
-			rtw_hal_get_def_var(padapter, HAL_DEF_UNDERCORATEDSMOOTHEDPWDB, &UndecoratedSmoothedPWDB);
+			rtw_hal_get_def_var(padapter,
+					    HAL_DEF_UNDERCORATEDSMOOTHEDPWDB,
+					    &UndecoratedSmoothedPWDB);
 
 		for (i = 0; i < NUM_STA; i++) {
 			if (pdvobj->macid[i]) {
@@ -4978,7 +4979,6 @@ void linked_status_chk(struct adapter *padapter)
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 
-
 	if (is_client_associated_to_ap(padapter)) {
 		/* linked infrastructure client mode */
 
@@ -4994,7 +4994,8 @@ void linked_status_chk(struct adapter *padapter)
 		link_count_limit = 7; /*  16 sec */
 
 		/*  Marked by Kurt 20130715 */
-		/*  For WiDi 3.5 and latered on, they don't ask WiDi sink to do roaming, so we could not check rx limit that strictly. */
+		/*  For WiDi 3.5 and latered on, they don't ask WiDi sink to do roaming, */
+		/* so we could not check rx limit that strictly. */
 		/*  todo: To check why we under miracast session, rx_chk would be false */
 		psta = rtw_get_stainfo(pstapriv, pmlmeinfo->network.mac_address);
 		if (psta) {
@@ -5007,9 +5008,18 @@ void linked_status_chk(struct adapter *padapter)
 			{
 				if (rx_chk != _SUCCESS) {
 					if (pmlmeext->retry == 0) {
-						issue_probereq_ex(padapter, &pmlmeinfo->network.ssid, pmlmeinfo->network.mac_address, 0, 0, 0, 0);
-						issue_probereq_ex(padapter, &pmlmeinfo->network.ssid, pmlmeinfo->network.mac_address, 0, 0, 0, 0);
-						issue_probereq_ex(padapter, &pmlmeinfo->network.ssid, pmlmeinfo->network.mac_address, 0, 0, 0, 0);
+						issue_probereq_ex(padapter,
+								  &pmlmeinfo->network.ssid,
+								  pmlmeinfo->network.mac_address,
+								  0, 0, 0, 0);
+						issue_probereq_ex(padapter,
+								  &pmlmeinfo->network.ssid,
+								  pmlmeinfo->network.mac_address,
+								  0, 0, 0, 0);
+						issue_probereq_ex(padapter,
+								  &pmlmeinfo->network.ssid,
+								  pmlmeinfo->network.mac_address,
+								  0, 0, 0, 0);
 					}
 				}
 
@@ -5033,7 +5043,7 @@ void linked_status_chk(struct adapter *padapter)
 			}
 
 			if (tx_chk == _FAIL) {
-				pmlmeinfo->link_count %= (link_count_limit+1);
+				pmlmeinfo->link_count %= (link_count_limit + 1);
 			} else {
 				pxmitpriv->last_tx_pkts = pxmitpriv->tx_pkts;
 				pmlmeinfo->link_count = 0;
@@ -5051,7 +5061,6 @@ void linked_status_chk(struct adapter *padapter)
 					continue;
 
 				if (pmlmeinfo->FW_sta_info[i].rx_pkt == sta_rx_pkts(psta)) {
-
 					if (pmlmeinfo->FW_sta_info[i].retry < 3) {
 						pmlmeinfo->FW_sta_info[i].retry++;
 					} else {
@@ -5069,9 +5078,7 @@ void linked_status_chk(struct adapter *padapter)
 		}
 
 		/* set_link_timer(pmlmeext, DISCONNECT_TO); */
-
 	}
-
 }
 
 void survey_timer_hdl(struct timer_list *t)
@@ -5195,7 +5202,7 @@ u8 setopmode_hdl(struct adapter *padapter, u8 *pbuf)
 		type = _HW_STATE_AP_;
 		/* start_ap_mode(padapter); */
 	} else if (psetop->mode == Ndis802_11Infrastructure) {
-		pmlmeinfo->state &= ~(BIT(0)|BIT(1));/*  clear state */
+		pmlmeinfo->state &= ~(BIT(0) | BIT(1));/*  clear state */
 		pmlmeinfo->state |= WIFI_FW_STATION_STATE;/* set to	STATION_STATE */
 		type = _HW_STATE_STATION_;
 	} else if (psetop->mode == Ndis802_11IBSS) {
@@ -5214,7 +5221,6 @@ u8 setopmode_hdl(struct adapter *padapter, u8 *pbuf)
 	}
 
 	return H2C_SUCCESS;
-
 }
 
 u8 createbss_hdl(struct adapter *padapter, u8 *pbuf)
@@ -5518,8 +5524,11 @@ u8 sitesurvey_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 
 		for (i = 0; i < RTW_SSID_SCAN_AMOUNT; i++) {
 			if (pparm->ssid[i].ssid_length) {
-				memcpy(pmlmeext->sitesurvey_res.ssid[i].ssid, pparm->ssid[i].ssid, IW_ESSID_MAX_SIZE);
-				pmlmeext->sitesurvey_res.ssid[i].ssid_length = pparm->ssid[i].ssid_length;
+				memcpy(pmlmeext->sitesurvey_res.ssid[i].ssid,
+				       pparm->ssid[i].ssid,
+				       IW_ESSID_MAX_SIZE);
+				pmlmeext->sitesurvey_res.ssid[i].ssid_length =
+					pparm->ssid[i].ssid_length;
 			} else {
 				pmlmeext->sitesurvey_res.ssid[i].ssid_length = 0;
 			}
@@ -5547,7 +5556,8 @@ u8 sitesurvey_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 		}
 	}
 
-	if ((pmlmeext->sitesurvey_res.state == SCAN_START) || (pmlmeext->sitesurvey_res.state == SCAN_TXNULL)) {
+	if ((pmlmeext->sitesurvey_res.state == SCAN_START) ||
+	    (pmlmeext->sitesurvey_res.state == SCAN_TXNULL)) {
 		/* disable dynamic functions, such as high power, DIG */
 		Save_DM_Func_Flag(padapter);
 		Switch_DM_Func(padapter, DYNAMIC_FUNC_DISABLE, false);
@@ -5571,7 +5581,6 @@ u8 sitesurvey_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 	site_survey(padapter);
 
 	return H2C_SUCCESS;
-
 }
 
 u8 setauth_hdl(struct adapter *padapter, unsigned char *pbuf)
@@ -5701,7 +5710,6 @@ u8 add_ba_hdl(struct adapter *padapter, unsigned char *pbuf)
 	return	H2C_SUCCESS;
 }
 
-
 u8 chk_bmc_sleepq_cmd(struct adapter *padapter)
 {
 	struct cmd_obj *ph2c;
@@ -5747,8 +5755,8 @@ u8 set_tx_beacon_cmd(struct adapter *padapter)
 
 	memcpy(&(ptxBeacon_parm->network), &(pmlmeinfo->network), sizeof(struct wlan_bssid_ex));
 
-	len_diff = update_hidden_ssid(ptxBeacon_parm->network.ies+_BEACON_IE_OFFSET_,
-				      ptxBeacon_parm->network.ie_length-_BEACON_IE_OFFSET_,
+	len_diff = update_hidden_ssid(ptxBeacon_parm->network.ies + _BEACON_IE_OFFSET_,
+				      ptxBeacon_parm->network.ie_length - _BEACON_IE_OFFSET_,
 				      pmlmeinfo->hidden_ssid_mode);
 	ptxBeacon_parm->network.ie_length += len_diff;
 
@@ -5803,8 +5811,8 @@ u8 mlme_evt_hdl(struct adapter *padapter, unsigned char *pbuf)
 		goto _abort_event_;
 
 	peventbuf = (uint *)pbuf;
-	evt_sz = (u16)(*peventbuf&0xffff);
-	evt_code = (u8)((*peventbuf>>16)&0xff);
+	evt_sz = (u16)(*peventbuf & 0xffff);
+	evt_code = (u8)((*peventbuf >> 16) & 0xff);
 
 	/*  checking if event code is valid */
 	if (evt_code >= MAX_C2HEVT)
@@ -5812,7 +5820,7 @@ u8 mlme_evt_hdl(struct adapter *padapter, unsigned char *pbuf)
 
 	/*  checking if event size match the event parm size */
 	if ((wlanevents[evt_code].parmsize != 0) &&
-			(wlanevents[evt_code].parmsize != evt_sz))
+	    (wlanevents[evt_code].parmsize != evt_sz))
 		goto _abort_event_;
 
 	atomic_inc(&pevt_priv->event_seq);
@@ -5826,12 +5834,8 @@ u8 mlme_evt_hdl(struct adapter *padapter, unsigned char *pbuf)
 		pevt_priv->evt_done_cnt++;
 	}
 
-
 _abort_event_:
-
-
 	return H2C_SUCCESS;
-
 }
 
 u8 h2c_msg_hdl(struct adapter *padapter, unsigned char *pbuf)
@@ -5855,7 +5859,7 @@ u8 chk_bmc_sleepq_hdl(struct adapter *padapter, unsigned char *pbuf)
 	if (!psta_bmc)
 		return H2C_SUCCESS;
 
-	if ((pstapriv->tim_bitmap&BIT(0)) && (psta_bmc->sleepq_len > 0)) {
+	if ((pstapriv->tim_bitmap & BIT(0)) && (psta_bmc->sleepq_len > 0)) {
 		msleep(10);/*  10ms, ATIM(HIQ) Windows */
 
 		/* spin_lock_bh(&psta_bmc->sleep_q.lock); */
@@ -5954,8 +5958,13 @@ u8 set_chplan_hdl(struct adapter *padapter, unsigned char *pbuf)
 
 	setChannelPlan_param = (struct SetChannelPlan_param *)pbuf;
 
-	pmlmeext->max_chan_nums = init_channel_set(padapter, setChannelPlan_param->channel_plan, pmlmeext->channel_set);
-	init_channel_list(padapter, pmlmeext->channel_set, pmlmeext->max_chan_nums, &pmlmeext->channel_list);
+	pmlmeext->max_chan_nums = init_channel_set(padapter,
+						   setChannelPlan_param->channel_plan,
+						   pmlmeext->channel_set);
+	init_channel_list(padapter,
+			  pmlmeext->channel_set,
+			  pmlmeext->max_chan_nums,
+			  &pmlmeext->channel_list);
 
 	if (padapter->rtw_wdev && padapter->rtw_wdev->wiphy) {
 		struct regulatory_request request;
@@ -5975,9 +5984,10 @@ u8 set_csa_hdl(struct adapter *padapter, unsigned char *pbuf)
 /*  TDLS_ESTABLISHED	: write RCR DATA BIT */
 /*  TDLS_CS_OFF		: go back to the channel linked with AP, terminating channel switch procedure */
 /*  TDLS_INIT_CH_SEN	: init channel sensing, receive all data and mgnt frame */
-/*  TDLS_DONE_CH_SEN: channel sensing and report candidate channel */
+/*  TDLS_DONE_CH_SEN	: channel sensing and report candidate channel */
 /*  TDLS_OFF_CH		: first time set channel to off channel */
-/*  TDLS_BASE_CH		: go back tp the channel linked with AP when set base channel as target channel */
+/*  TDLS_BASE_CH	: go back tp the channel linked with AP when set */
+/*			  base channel as target channel */
 /*  TDLS_P_OFF_CH	: periodically go to off channel */
 /*  TDLS_P_BASE_CH	: periodically go back to base channel */
 /*  TDLS_RS_RCR		: restore RCR */
@@ -5991,8 +6001,7 @@ u8 run_in_thread_hdl(struct adapter *padapter, u8 *pbuf)
 {
 	struct RunInThread_param *p;
 
-
-	if (pbuf == NULL)
+	if (!pbuf)
 		return H2C_PARAMETERS_ERROR;
 	p = (struct RunInThread_param *)pbuf;
 
-- 
2.43.0

