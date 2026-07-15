Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DD143787A
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 17:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784135913; cv=none; b=laU3dOUHMgsnBIRueYrwCI6faG719yWHrd0krMnaYVz8bWjrOa1/dR9KBOci8rcNtKn44YSBYFBuv/4FhGecuRMjQu44FDUg0l0F4iGKJWwYOwbZIv/1wVb7/6oC1nYKaOg41IpSzlH+t1gxs073UEcXunJbggZZC0CZiT167eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784135913; c=relaxed/simple;
	bh=UrKuEu3VwvbneKE3xgcSG66IF7BNQpn+wyBrcsHd8Ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A6oduW5ikwFatuuRBfy75hABguCEFP/nOTOuFYrADQX60qdJyHxf9ZYYCwA+mNFqvl4W29KwUU8kaGFd0k8r5e/+xYs+mAHJX8n2MCYM+TzuBG2BaGsxzlK3x+UE4rbOexToTkFR0xuEUffWO0h621iIu2YIjDHa7QPrmBLQ854=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOhGak84; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOhGak84"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4953ddae026so6290715e9.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 10:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784135905; x=1784740705; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i02h31wkr6anz/TeVj2mj/Sfis3LsVTW6kXryjzsDtw=;
        b=TOhGak84DRWK4Ok6GB8TUa3enegJBcWD12fxViyjZ23TByRZcw7yXnYinPu0+meXz9
         YssGYEN93Nwnp2FVgCKkXPvlIswgmnyunCmqde1QgAydCDn+UVJq21gaBJ4fT7n7tCvh
         ZcxXS1sOqRRGisAO671hhkYzT1IigCWr/fx8ulJ8vYj2p0b9x4BXNYyw1YQotk+cwHUC
         zJAnpnJ0+WPufwCMQvHaib9Zzoyf3VmzwOMuhvPicGbGfdqtLf3+C5sGEYN6hGTymnrA
         vlA0vp/4kM+YJsdHHaD/UYXqWBHsxcdtReyZKHCfeHcnsIKK0FZquUygjxoZ97M22252
         wx0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784135905; x=1784740705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i02h31wkr6anz/TeVj2mj/Sfis3LsVTW6kXryjzsDtw=;
        b=hYl1quF1J6L3pGZ8nSjiHjiRuBjhfsjVQEOMZV3AOFMzqW900aewc8KX2w1q1NB4wp
         JnHDadA4Vzava7ObPtjA6cJKz6J5UUUpffmsAIcp/1Sy/XJadyaFFhl+hYWCJyO48w30
         omYGJFnbg+09GtQ17wpRhpGiI0P53vdS8BrPqXVGwPQEcAxz19u1BLao1eIsO+GkULrF
         8OTKqX7nJRDwIfXJ0erbuSuuqCgWPuJj6bfxW4uA2UjOpfUtg7d7SDEVP8G+FHFCFZNf
         Z1oWcCQQHYU9NsBhtA6nCJqibMjOzEF8iP9WOR186rsozBcB7oeBrDAqDiWdMSjN5AJB
         NZ6g==
X-Gm-Message-State: AOJu0YyQ4xJY/iA0+eXd43Ek5gTdnZPH15fqUtW40rg9C1A1YMTZLLXv
	YQK7IMKEPMivazw8lrE8K3NWcHT3JozAsJwwffwK1DzBPcTWUK0SDwl7
X-Gm-Gg: AfdE7cliamGgw7GroeOVgB0McQqJpPamMHul1a4gY74X1WIVoieY/2BNuQwKDxu02gj
	Sz1KiHFQ0Tp3jiHR8S7CsUcttqD8RXVqCFDH3EvkD/zQyno+PhwayZC2A+xH8qqQmiwvGwbYQtn
	UchYcEh8d9oii6s/0VUIOpiFr7C1sgx6vCCHmHLOAjmA3N0WjwV42d7c5mnSgyggpjpl1hOVjyG
	DxxSddHneNPKmztkwgZq8xJYHeU/QtS+SECXymcIeA0YUfGwiOoQnxil0ANXb9op/IyE8I4A7On
	lsozJlVVK8MYZ9tzAe1d4KFYvt4/Nj3e0I46PV/kqsvisiaGQBGph5/RHTIsuwdfqUoc4ySLvm9
	c+PqEj0RWdN9BZgA8xxIvu2xvtqJTkivFN7WKjZ230JQRQBRReRzCee7wbcNxhNDFDyG/glbbMy
	trRRfy+UoXCErG/MlP0KGp/6/gYRGAzy0Q0AUaC2dWAkrFvYLV+i/VOnP4viNryeCdP77VMYJbg
	W7RVw==
X-Received: by 2002:a05:600c:3acf:b0:492:3754:15f2 with SMTP id 5b1f17b1804b1-493f8829917mr185102345e9.32.1784135905113;
        Wed, 15 Jul 2026 10:18:25 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7f84sm17123032f8f.27.2026.07.15.10.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 10:18:24 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH 4/4] staging: rtl8723bs: fix Alignment should match open parenthesis in rtw_mlme_ext.c
Date: Wed, 15 Jul 2026 17:16:34 +0000
Message-ID: <20260715171634.1550-5-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715171634.1550-1-fliegbert2@gmail.com>
References: <20260715171634.1550-1-fliegbert2@gmail.com>
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
index 5206cd464778..379d964769ad 100644
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
 		if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared) {
 			 /*  legendary shared system */
 			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&len,
-				pkt_len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_);
+				       pkt_len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_);
 
 			if (!p)
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
@@ -1980,7 +1980,7 @@ s32 dump_mgntframe_and_wait(struct adapter *padapter, struct xmit_frame *pmgntfr
 	struct submit_ctx sctx;
 
 	if (padapter->surprise_removed ||
-		padapter->driver_stopped) {
+	    padapter->driver_stopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
 		return ret;
@@ -2009,7 +2009,7 @@ s32 dump_mgntframe_and_wait_ack(struct adapter *padapter, struct xmit_frame *pmg
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 
 	if (padapter->surprise_removed ||
-		padapter->driver_stopped) {
+	    padapter->driver_stopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
 		return -1;
@@ -2496,7 +2496,7 @@ inline void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *ps
 }
 
 int issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da, u8 ch, bool append_wps,
-	int try_cnt, int wait_ms)
+		      int try_cnt, int wait_ms)
 {
 	int ret;
 	int i = 0;
@@ -2894,8 +2894,8 @@ void issue_assocreq(struct adapter *padapter)
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
@@ -3267,7 +3267,7 @@ int issue_deauth(struct adapter *padapter, unsigned char *da, unsigned short rea
 }
 
 int issue_deauth_ex(struct adapter *padapter, u8 *da, unsigned short reason, int try_cnt,
-	int wait_ms)
+		    int wait_ms)
 {
 	int ret;
 	int i = 0;
@@ -4161,7 +4161,7 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 
 	/*  Adjust channel plan by AP Country IE */
 	if (pregistrypriv->enable80211d &&
-		(!pmlmeext->update_channel_plan_by_ap_done)) {
+	    (!pmlmeext->update_channel_plan_by_ap_done)) {
 		u8 *ie, *p;
 		u32 len;
 		struct rt_channel_plan chplan_ap;
@@ -4211,8 +4211,8 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 		if (pregistrypriv->wireless_mode & WIRELESS_11G) {
 			do {
 				if ((i == MAX_CHANNEL_NUM) ||
-					(chplan_sta[i].channel_num == 0) ||
-					(chplan_sta[i].channel_num > 14))
+				    (chplan_sta[i].channel_num == 0) ||
+				    (chplan_sta[i].channel_num > 14))
 					break;
 
 				if ((j == chplan_ap.Len) || (chplan_ap.Channel[j] > 14))
@@ -4239,8 +4239,8 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 
 			/*  change AP not support channel to Passive scan */
 			while ((i < MAX_CHANNEL_NUM) &&
-				(chplan_sta[i].channel_num != 0) &&
-				(chplan_sta[i].channel_num <= 14)) {
+			       (chplan_sta[i].channel_num != 0) &&
+			       (chplan_sta[i].channel_num <= 14)) {
 				chplan_new[k].channel_num = chplan_sta[i].channel_num;
 				chplan_new[k].scan_type = SCAN_PASSIVE;
 				i++;
@@ -4257,8 +4257,8 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
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
@@ -5333,7 +5333,7 @@ u8 disconnect_hdl(struct adapter *padapter, unsigned char *pbuf)
 }
 
 static int rtw_scan_ch_decision(struct adapter *padapter, struct rtw_ieee80211_channel *out,
-	u32 out_num, struct rtw_ieee80211_channel *in, u32 in_num)
+				u32 out_num, struct rtw_ieee80211_channel *in, u32 in_num)
 {
 	int i, j;
 	int set_idx;
@@ -5579,7 +5579,7 @@ u8 add_ba_hdl(struct adapter *padapter, unsigned char *pbuf)
 		return	H2C_SUCCESS;
 
 	if (((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && (pmlmeinfo->HT_enable)) ||
-		((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)) {
+	    ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)) {
 		/* pmlmeinfo->ADDBA_retry_count = 0; */
 		/* pmlmeinfo->candidate_tid_bitmap |= (0x1 << pparm->tid); */
 		/* psta->htpriv.candidate_tid_bitmap |= BIT(pparm->tid); */
-- 
2.54.0

