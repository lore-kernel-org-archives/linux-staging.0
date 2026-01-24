Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E502857C7
	for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 10:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769251933; cv=none; b=fU6A2L4Y9bCw4KrJMerSm0N4MZH9Ruha+R8ADR3WrZfbxgLwJRP7cm5gUteov14aHeGVqBgtJALi8bPQ0+yi7slZQFB9U2W+I9AeZ04HiZUJn87b4ZsqV4NBD9wx6aBaPb9Wkxuox6FeBPE1xn4uj+De+ZBJlzVAQEblCuDo/PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769251933; c=relaxed/simple;
	bh=hQFfkIriyYzMEDnBEfzLyP+bxMoyMHWs4T3RNgbBU4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FOAtix/c4WTO8guB11q3VLb2XXuy9XSUata9zge8x/PWBhtOCA2cUPSO7JW5eWK3VATHWPTW7sELqKkzJCKNzyCVXR8RoEEcj6kktZs1kBkslKwJ7cQfBKpKerYSZnW7cu+BZ0OgW8v7LqcMbqQ6xGHenOj7mRNrxVGviRqQyDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/lVKGa9; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/lVKGa9"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a7b47a5460so16735315ad.1
        for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 02:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769251931; x=1769856731; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w44jX1+sppLkgDk00+rQsAGRmhfR3Zu5ZIfROqDd/Gw=;
        b=D/lVKGa9HwvzemdMEnQhMKFtUjB3+GMh3/Lfywwdms5JppRolFFiWqGLKggZWvjhc6
         zdpo88ZQratu+JgbYPbiDbM+9gwKoYBS2fKxLOut2lVMJbWqTMVWS28nm0xIYhNzq7RT
         gw0B8oi8kmlWCVJXS6lRHzSeHleDatYC2ihJ6UmMR/e7KghZcz5+juwdTdNPpbgvbbHY
         iphKHkpWivANykS4c5phK0IfXRdIY8+JwUA1iGqQq7xaVIiXOBl5II9jeJUelB0Hiyph
         kc8C2WC9AdbdGnvyPP/8hcsQ3rnzL8R076Ik8tr7zBDHsFZ1nae2B6OlK6UXhvPkzYhm
         9+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769251931; x=1769856731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w44jX1+sppLkgDk00+rQsAGRmhfR3Zu5ZIfROqDd/Gw=;
        b=L1hs409sJCHWgFMXoeXF8toM1krd8lacyP0/brG6SZGdJ/ruZhzufqXTJZUSdqUtdN
         j9QZCFwOiEg6TPeRcuzmNKOf6N2grJ5xmtGHXSdZmripXYM1qqTT1U++0oFfEhBli20o
         r2AtxCOpA7ss3BhMqgXTNDAg2yhc8HudFuhAF5hCQuUBLwQUpPJ+MZK7UvJgNN/dg7+A
         M5XhbDl3BeMor8aH9+nn0zV6kWzdVlr3adeLbJ62YuXZNp9Cfo7wTk58m/u33VC9gXvn
         KwUNwj4Rt1T5AL4VXQnP9fpSGaniOtQ8B9ix5ZDsgx2DP9LIgOdL/DeKI7+oGcvWsoTk
         jvJA==
X-Gm-Message-State: AOJu0YwHL6O3HQlG725VRKVxUUMBTW4ysfBfq8eJS7MGzrJXbyt2CEoc
	w1A0uqrh3VBQqkaU2fxSPnDYWGpcfCpzA8RuklSMZ/37aA/QI+auDwbq
X-Gm-Gg: AZuq6aKSoeDTLscHyHv1091tK3/yNy6ML3wdWcV1fkiHJPuhtP23fVOusa9KLj0eixP
	yijg8EX7OCirijLxa9LJP4GTcvsfRifE9RGj4GZ7m2wl33u+BAjvy6qBRsaVVtJxnoG1oHQ7P31
	pWCtkwjCK1CUKS1r9uyv21f7dOQYHzbCdGq9fRt127JdgwiYv8bqZPCC3KrYV2b1Stid8xz1mY+
	4do/fS3xIcwz2HubC8C0lcwkChD7QP/tVvbmtzM4MYuyl3lbYTbf5W6Dv3nJ4+dTk5I+VzNkpkr
	GZlgJ2Mwkl5KOiKx1PuuFoL7GarscBG9XPliGB70qCHtZclGfFdnuqelh3+rCDt3xx/GzRQX1xj
	TUnyZSq3+GczeSk80tHnaFsSXubxroPv+cRlszelXQhVDhiB34w6eebNwMOC5yqEVQRprvaofO2
	E7TtybfiKfndJSooHDxBqbTRcgJV717xKf
X-Received: by 2002:a17:903:f8e:b0:2a7:9163:8e60 with SMTP id d9443c01a7336-2a7fe80fddfmr52834715ad.23.1769251931160;
        Sat, 24 Jan 2026 02:52:11 -0800 (PST)
Received: from tehuang-Alienware-m16-R2.. ([50.47.240.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802de5cd4sm42468985ad.40.2026.01.24.02.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 02:52:10 -0800 (PST)
From: Michael Huang <tehsiu.huang@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Huang <tehsiu.huang@gmail.com>
Subject: [PATCH v4 2/2] staging: rtl8723bs: fix line length and coding style issues
Date: Sat, 24 Jan 2026 02:49:20 -0800
Message-ID: <20260124104920.5721-3-tehsiu.huang@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260124104920.5721-1-tehsiu.huang@gmail.com>
References: <20260123211904.64589-1-tehsiu.huang@gmail.com>
 <20260124104920.5721-1-tehsiu.huang@gmail.com>
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
Changes in v4:
- Fix canonical patch format by moving the changelog below the "---" line.
- Initial public submission (corrected versioning).

Changes in v3:
- Fix line wrapping in commit description (under 75 chars).
- Fix line length exceeding 100 columns in comments.
- Add missing Signed-off-by tag.

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

