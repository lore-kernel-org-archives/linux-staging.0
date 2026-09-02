Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542284A5EA0
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 15:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361707; cv=none; b=WL1WRhnZDNJPSMDRLNQj74uJkAFWQ4BdHg33RsOpXYgWyHAlC5cUqZ4/T+h9U8/luIk+7AZIBpXjV+qfGnSD4OCs8sywTghdYnpDb/2aoiUJGZ1WsLAHEDBUbXDIqkGt3A6dIILzCwZnL06n/Nx5SiVvjs8wSIxwTlF3MxtEIBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361707; c=relaxed/simple;
	bh=nCXPAnuOSmmXY2rUfpFUiSRZF1+BwzVNVA0wJjmcfWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kNIgGmhDEcJ/HyTEW0Rro5S5ZfomKsrv8MOoGSQ3xWR19XWh0a/gEN+Zwz5iURi52iYSz/rOwTnaldiDYeXsezX39vN5ORLdrcB/TiCDpWr8ZwVAGK2M9dXCkA0Kn6AjlgLjo6PES9sqVXUPst0KpY1zKRwgOYcA28hORL9sdbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJQCqnOT; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJQCqnOT"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso11511455e9.1
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 08:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788361703; x=1788966503; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jNyVKvuZfkn0OMTvx0TpHoFHrsOmOkliSXO6rNR0S8s=;
        b=MJQCqnOT3Xv/TYn921O2mglOerqwAG+BM23nsTHCABsFAm6u7+C6GNtf77XcTy2r4A
         w6uo4urnScQSATLUpit2GGfyuTpCtHTBaG6C00Qfm1I3D/Yo37nWIcr2S+JZBEnGlZ0t
         ttp5mxE9VSVvn54Q4C4FY+mx6qc6bH1EIDaiQQafobQzCndE55V4KY7zolBFB/QBxsIS
         Upz9K+vSrmPMCvylItwcJcWvBAs9D6IBfxhuNli15ekH470pI4jUvW5YIn9IbAUhO6zh
         rZVzcZDl4xOpHiiSWaDipXQEBKOioCCteOazLSa3U1MJB3uxRDml7QpMe/nF0jqSuEne
         4YUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788361703; x=1788966503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jNyVKvuZfkn0OMTvx0TpHoFHrsOmOkliSXO6rNR0S8s=;
        b=iT0rhToHx7AKJXMXTpCSaipcNUEjIp33lTxoTZbVDBlhjSJeTHAN0zCFZ30iTLwZhQ
         SoOMTaJgynJ58XpAcq9MjmomwcdY8mxGKzPmwAxMCnv/G6BnBzo9/czaa56d4SZWj3y4
         LEVCUE5qfVLpUcJFN1FXVUHYWOJ8PYbR2P0/UJr5xFDN9P7WBbmIF38MBnjfy9K0p9X2
         iIS/SRipdRXNznnaY24tIwZ4JpAMKUrdExvHs8ln4RlXaB6n7KbmNg6D1zE7zYGnSEde
         BlaYdMgplF0G9NzODCuni4dhXeiDis57iHGuxwY5FtrH/iQhboXVMWkt/Cb8SaQQDPP2
         C4pQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqxd3ty39kb1qPzkS0CkkbBiZc3sgw1zKweFnFNAQxzVyRNJO+Z4TOTDvvasSwTuPiiLtl/Ifr4jZTxZAxG@lists.linux.dev
X-Gm-Message-State: AFuF++nMEaJzxn/15L7FnbLKVEzOOmPUAqCNitK/YbmgorWY2ZTm/C/v
	RN5NS42k8vb6eGQEmZdwNHE9XyKP+ANInzl7ZzXbWJzUq0Tr0stT9PwZ
X-Gm-Gg: AR+sD10qjnJk2RT1YPygf+MzU75QM+CjHfsT/p8W+/R4aKSFVIxnb4Bs0cfi/1hVhon
	Nm6cOa92AjLkT2LF53RSMwio0nImMysyBwdvRcNkCD89OFzO+XVYVbj0LwiMQAIFwQFVP37zl+w
	idYeJI2lhFV5IT1/BCnC44Yi+O0RWcdRFo09WI/XwYeWxBxVZVJn9bpuzDeIjNV1r0NcJr06Qvq
	n6jS0L/nhpiPRPLbhLCV2V/GihgTDa+U3PoSAai+elCMO8ltIx2Mub8nkncSkoljYSYC7JrBXZP
	Eai7XyUgtBItWU42TkFfuZxwGE17qqKbdUlYo05mq0emvjLaIqLvk5lWLVPzwXBGVgncAPuae80
	RSi2B5h00C3w7YQ624rWRhtX1D6ZbWhpBfACXB/xLRBUqLxuZqhpfecztp4obbAmvKQYBhA1BUx
	jlH0OTspu4VV5g/46RpQctQYyA7IHq4+WT+9GwHiVmMpsWHs4uzn6on1y82XQngig3ZMRjcAtL6
	agNUkd91Ocih2n0Ju3ZeZ1gbq+yCG4GI6TJVAd/zx2d4cTaOQ6uMVmGpEuynRI2vESFkvcDOpem
	gYVw0/To
X-Received: by 2002:a05:600c:630e:b0:49c:e27c:6b10 with SMTP id 5b1f17b1804b1-49ce55ecea8mr102752395e9.3.1788361703060;
        Wed, 02 Sep 2026 08:08:23 -0700 (PDT)
Received: from koolguy.fritz.box (dynamic-2a02-3100-1a72-6e00-ef52-6b66-008c-4439.310.pool.telefonica.de. [2a02:3100:1a72:6e00:ef52:6b66:8c:4439])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce3e0desm167404405e9.11.2026.09.02.08.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:08:22 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v4 2/2] staging: rtl8723bs: fix Alignment should match open parenthesis in rtw_mlme_ext.c
Date: Wed,  2 Sep 2026 15:05:42 +0000
Message-ID: <20260902150542.2746-3-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902150542.2746-1-fliegbert2@gmail.com>
References: <20260715171634.1550-1-fliegbert2@gmail.com>
 <20260902150542.2746-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixing almost every occurrence of checkpatch warning
Alignment should match open parenthesis in rtw_mlme_ext.c.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 60 +++++++++----------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index fa8a83f5d3cb..01d25068c64f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -256,8 +256,8 @@ static void init_mlme_ext_priv_value(struct adapter *padapter)
 }
 
 static int has_channel(struct rt_channel_info *channel_set,
-					   u8 chanset_size,
-					   u8 chan)
+		       u8 chanset_size,
+		       u8 chan)
 {
 	int i;
 
@@ -269,8 +269,8 @@ static int has_channel(struct rt_channel_info *channel_set,
 }
 
 static void init_channel_list(struct adapter *padapter, struct rt_channel_info *channel_set,
-							  u8 chanset_size,
-							  struct p2p_channels *channel_list)
+			      u8 chanset_size,
+			      struct p2p_channels *channel_list)
 {
 	static const struct p2p_oper_class_map op_class[] = {
 		{ IEEE80211G,  81,   1,  13,  1, BW20 },
@@ -302,7 +302,7 @@ static void init_channel_list(struct adapter *padapter, struct rt_channel_info *
 				continue;
 
 			if ((0 < (padapter->registrypriv.bw_mode & 0xf0)) &&
-				((o->bw == BW40MINUS) || (o->bw == BW40PLUS)))
+			    ((o->bw == BW40MINUS) || (o->bw == BW40PLUS)))
 				continue;
 
 			if (!reg) {
@@ -515,7 +515,7 @@ unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame)
 	}
 
 	p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + _PROBEREQ_IE_OFFSET_, WLAN_EID_SSID, (int *)&ielen,
-			len - WLAN_HDR_A3_LEN - _PROBEREQ_IE_OFFSET_);
+		       len - WLAN_HDR_A3_LEN - _PROBEREQ_IE_OFFSET_);
 
 	/* check (wildcard) SSID */
 	if (p) {
@@ -715,8 +715,8 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	seq	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 2));
 
 	if (auth_mode == 2 &&
-			psecuritypriv->dot11_privacy_algrthm != _WEP40_ &&
-			psecuritypriv->dot11_privacy_algrthm != _WEP104_)
+	    psecuritypriv->dot11_privacy_algrthm != _WEP40_ &&
+	    psecuritypriv->dot11_privacy_algrthm != _WEP104_)
 		auth_mode = 0;
 
 	if ((algorithm > 0 && auth_mode == 0) ||	/*  rx a shared-key auth but shared not enabled */
@@ -797,7 +797,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 			pstat->authalg = algorithm;
 		} else if (seq == 3) {
 			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + 4 + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&ie_len,
-					len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_ - 4);
+				       len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_ - 4);
 
 			if (!p || ie_len != 128) {
 				status = WLAN_STATUS_CHALLENGE_FAIL;
@@ -883,7 +883,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 		if (pmlmeinfo->auth_algo == dot11_auth_algrthm_shared) {
 			 /*  legendary shared system */
 			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&len,
-				pkt_len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_);
+				       pkt_len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_);
 
 			if (!p || len != WLAN_AUTH_CHALLENGE_LEN)
 				goto authclnt_fail;
@@ -992,7 +992,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	/*  now we should check all the fields... */
 	/*  checking SSID */
 	p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + ie_offset, WLAN_EID_SSID, &ie_len,
-		pkt_len - WLAN_HDR_A3_LEN - ie_offset);
+		       pkt_len - WLAN_HDR_A3_LEN - ie_offset);
 
 	if (!p || ie_len == 0) {
 		/*  broadcast ssid, however it is not allowed in assocreq */
@@ -1027,7 +1027,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		support_rate_num = ie_len;
 
 		p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + ie_offset, WLAN_EID_EXT_SUPP_RATES, &ie_len,
-				pkt_len - WLAN_HDR_A3_LEN - ie_offset);
+			       pkt_len - WLAN_HDR_A3_LEN - ie_offset);
 		if (p) {
 			if (support_rate_num + ie_len <= sizeof(supportRate)) {
 				memcpy(supportRate + support_rate_num, p + 2, ie_len);
@@ -1230,8 +1230,8 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	}
 
 	if ((pstat->flags & WLAN_STA_HT) &&
-		    ((pstat->wpa2_pairwise_cipher & WPA_CIPHER_TKIP) ||
-		      (pstat->wpa_pairwise_cipher & WPA_CIPHER_TKIP))) {
+	    ((pstat->wpa2_pairwise_cipher & WPA_CIPHER_TKIP) ||
+	    (pstat->wpa_pairwise_cipher & WPA_CIPHER_TKIP))) {
 		/* status = WLAN_STATUS_CIPHER_SUITE_REJECTED; */
 		/* goto OnAssocReqFail; */
 	}
@@ -1962,7 +1962,7 @@ void update_mgntframe_attrib_addr(struct adapter *padapter, struct xmit_frame *p
 void dump_mgntframe(struct adapter *padapter, struct xmit_frame *pmgntframe)
 {
 	if (padapter->surprise_removed ||
-		padapter->driver_stopped) {
+	    padapter->driver_stopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
 		return;
@@ -1979,7 +1979,7 @@ void dump_mgntframe_and_wait(struct adapter *padapter, struct xmit_frame *pmgntf
 	struct submit_ctx sctx;
 
 	if (padapter->surprise_removed ||
-		padapter->driver_stopped) {
+	    padapter->driver_stopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
 		return;
@@ -2004,7 +2004,7 @@ s32 dump_mgntframe_and_wait_ack(struct adapter *padapter, struct xmit_frame *pmg
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 
 	if (padapter->surprise_removed ||
-		padapter->driver_stopped) {
+	    padapter->driver_stopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
 		return -1;
@@ -2500,7 +2500,7 @@ inline void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *ps
 }
 
 int issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da, u8 ch, bool append_wps,
-	int try_cnt, int wait_ms)
+		      int try_cnt, int wait_ms)
 {
 	int ret;
 	int i = 0;
@@ -2901,8 +2901,8 @@ void issue_assocreq(struct adapter *padapter)
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
 			if ((!memcmp(pIE->data, RTW_WPA_OUI, 4)) ||
-					(!memcmp(pIE->data, WMM_OUI, 4)) ||
-					(!memcmp(pIE->data, WPS_OUI, 4))) {
+			    (!memcmp(pIE->data, WMM_OUI, 4)) ||
+			    (!memcmp(pIE->data, WPS_OUI, 4))) {
 				vs_ie_length = pIE->length;
 				if ((!padapter->registrypriv.wifi_spec) && (!memcmp(pIE->data, WPS_OUI, 4))) {
 					/* Commented by Kurt 20110629
@@ -3274,7 +3274,7 @@ int issue_deauth(struct adapter *padapter, unsigned char *da, unsigned short rea
 }
 
 int issue_deauth_ex(struct adapter *padapter, u8 *da, unsigned short reason, int try_cnt,
-	int wait_ms)
+		    int wait_ms)
 {
 	int ret;
 	int i = 0;
@@ -4166,7 +4166,7 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 
 	/*  Adjust channel plan by AP Country IE */
 	if (pregistrypriv->enable80211d &&
-		(!pmlmeext->update_channel_plan_by_ap_done)) {
+	    (!pmlmeext->update_channel_plan_by_ap_done)) {
 		u8 *ie, *p;
 		u32 len;
 		struct rt_channel_plan chplan_ap;
@@ -4216,8 +4216,8 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 		if (pregistrypriv->wireless_mode & WIRELESS_11G) {
 			do {
 				if ((i == MAX_CHANNEL_NUM) ||
-					(chplan_sta[i].channel_num == 0) ||
-					(chplan_sta[i].channel_num > 14))
+				    (chplan_sta[i].channel_num == 0) ||
+				    (chplan_sta[i].channel_num > 14))
 					break;
 
 				if ((j == chplan_ap.Len) || (chplan_ap.Channel[j] > 14))
@@ -4244,8 +4244,8 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 
 			/*  change AP not support channel to Passive scan */
 			while ((i < MAX_CHANNEL_NUM) &&
-				(chplan_sta[i].channel_num != 0) &&
-				(chplan_sta[i].channel_num <= 14)) {
+			       (chplan_sta[i].channel_num != 0) &&
+			       (chplan_sta[i].channel_num <= 14)) {
 				chplan_new[k].channel_num = chplan_sta[i].channel_num;
 				chplan_new[k].scan_type = SCAN_PASSIVE;
 				i++;
@@ -4262,8 +4262,8 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 		} else {
 			/*  keep original STA 2.4G channel plan */
 			while ((i < MAX_CHANNEL_NUM) &&
-				(chplan_sta[i].channel_num != 0) &&
-				(chplan_sta[i].channel_num <= 14)) {
+			       (chplan_sta[i].channel_num != 0) &&
+			       (chplan_sta[i].channel_num <= 14)) {
 				chplan_new[k].channel_num = chplan_sta[i].channel_num;
 				chplan_new[k].scan_type = chplan_sta[i].scan_type;
 				i++;
@@ -5337,7 +5337,7 @@ u8 disconnect_hdl(struct adapter *padapter, unsigned char *pbuf)
 }
 
 static int rtw_scan_ch_decision(struct adapter *padapter, struct rtw_ieee80211_channel *out,
-	u32 out_num, struct rtw_ieee80211_channel *in, u32 in_num)
+				u32 out_num, struct rtw_ieee80211_channel *in, u32 in_num)
 {
 	int i, j;
 	int set_idx;
@@ -5583,7 +5583,7 @@ u8 add_ba_hdl(struct adapter *padapter, unsigned char *pbuf)
 		return	H2C_SUCCESS;
 
 	if (((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && (pmlmeinfo->HT_enable)) ||
-		((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)) {
+	    ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)) {
 		/* pmlmeinfo->ADDBA_retry_count = 0; */
 		/* pmlmeinfo->candidate_tid_bitmap |= (0x1 << pparm->tid); */
 		/* psta->htpriv.candidate_tid_bitmap |= BIT(pparm->tid); */
-- 
2.55.0

