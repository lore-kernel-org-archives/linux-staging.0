Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2222B9BA
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 14:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785507739; cv=none; b=CrPHNJqwhXLhbZGwEOK6UXR5qyyXk1NA/uKKunAbf5pk6hgQPpuv/PmxW5DbSbW8SWrclmq9xG15xQGEzvxCe/+4kWnDHQJoZcRBImFQ33iSihRsMdiUSWUv3rz/hRs1/3gHI1DN+tBaIj1/0eqfQmqcoUU489yR5IAfpX+zN5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785507739; c=relaxed/simple;
	bh=OrjPIgmQO6mJaGefthcfjpUDpBZd14JPRr6HpqbPDhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mPAa7cH8yfbnVoTuMph864AT1WROCstnXY+V/SEcs9PSbJjGIdXVtEruuxwajprprmmxrmEpyiIHj/rBGXjKe9wxGdHBSEyXUj6qR+pFw8/a41H6fwg1N0VvrL6/vZ8ennBmT/YEPAv0O39cDQgsBGm6ChFvzordRSMfoqmbTVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fKeeSg+t; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKeeSg+t"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f7872abb6so766385f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 07:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785507736; x=1786112536; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FXUwTM3TEbyr/DfT8gIKhzbn8hpE6KHAjl8EfZV8JPk=;
        b=fKeeSg+tmaIthMEC9bsfFBkZz55836cgVeAtUVInGFKE15j1uVHelYLRuA+j4kyT/q
         pzmn+TUL5Ei2pwun1nZNqCXYpQj8RKZGAOHQinePghrLan3fGZNkkswAbbnP+F8UkEwr
         Qfa+jDazD1pmdzME7nTEbqve3s55wGSa4is5/9qzHTVky29Fiv5JvY8g3SgfroWbB5U2
         c0C0dZyWPRZVCJXOc43d1qCz+cyTdA73abcgwllZo8hskWX1kbn5hyGTZwekjSQnpEL2
         aJyLCWaETlgJX8x+6RdbfbNQpT6hPC1qEqDG9ekXZYgB5ziRXtEzsE2W6OdumhmiKVgy
         BLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785507736; x=1786112536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FXUwTM3TEbyr/DfT8gIKhzbn8hpE6KHAjl8EfZV8JPk=;
        b=Brme36grvPsPwZ9lokl1kdIgpzPmZGPxe1HjVM0qGolANroiKjXlb3H8AJ6bIjptW7
         DHxynlCCXMCP0UOUdg15LNFOuQxwvmj3Ug55Vvajd+jIDtJK5m16ckw7Embn8CJIakNx
         Tj8FXSLr1v7CJTOuA/iPFbzWC9hOBuD4UjSzEjOJlpyu0+jwWvRvYCWWz0mc+Iw9iQon
         nM1IaLzRSm/Szj8JgTinai59wbyMZCK2Y7gVe323Eeit3s3gMUb5hrupLBNhP4TyezGN
         KDKXeRTTYmKSZSjWJBKK2PZQJFpPp5K8IeJDYd+pGzPdpGs9aQIkgH1d8I9ku/4DL9o7
         8DlA==
X-Forwarded-Encrypted: i=1; AHgh+RoRQKWFXIpj3V/u1TzYLwsEqfX7oOkRYybTO8ufeRNZnL8cDIjAwMDbmLcW5zU+w7Y69Lbm5xOxqEmhp0gz@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2FIzWcwNKoZe12NsVZoqQNQgRXs/OPotGCeNWHM23UM9gT01R
	EUGm2x9SHlUHfpO+8rKsf5BraFn6IQD0kPOgzX71gZk86bc72bR3t+CH
X-Gm-Gg: AR+sD10wTvL1/aTEq3vwczA0fz4st66Bt0RvqHO7v4py/geB5xGghqdyDZ5/5/giUP9
	63RyGbS8QVI+xEJgEp6fr+rlsHauWpMDx7czrs4Ndy6ARto99qaUyPwW1TBEt5L4skq+kZTBMWJ
	2jtjRi6ipr5SyadOxTEiCc7KhGyhcieuN3dsJhcvHPb/BagzDLXkI+928gQJMoaGJTc3Fk1JpgR
	Kln1il3fp2C5vxI0Y0Ad4RTGMw9D3qK3bE/IO6y3MW0/Ft1TpLHJD4dyojTOvGCc9ovS05qkzbp
	pzWErrDUBHYqjnVrhX6dKwQwHfsGkWtVP0tG2rV6bnrzY7lCysTPOjdzL0tUtq+iOC1W8PaG4nq
	kli7X5NBa1b6a3vGj+adnvlSEP84WDfZfUjLOxvjXND7jHfLNK0//P17cfyyNEnTsYX7OrnAYJI
	biNWykbbdTHss3bby6PnZfZm0nfSbPsxmjNX/+jcH/MQFWFZBZ4+FjFeZURY0dY49MP+VzmKuDM
	vRIm1mAQy8BdkTCQ4QpWOB/zWq5jFfSG0fN9Hk6bqP3Lniot27zqzXvPCDvh+g=
X-Received: by 2002:a05:6000:40cc:b0:474:64bf:8fb6 with SMTP id ffacd0b85a97d-47fd2b365d6mr4741179f8f.39.1785507735892;
        Fri, 31 Jul 2026 07:22:15 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-233-039.088.074.pools.vodafone-ip.de. [88.74.233.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456220esm5560224f8f.18.2026.07.31.07.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:22:15 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v3 2/2] staging: rtl8723bs: fix Alignment should match open parenthesis in rtw_mlme_ext.c
Date: Fri, 31 Jul 2026 14:20:04 +0000
Message-ID: <20260731142004.15281-3-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731142004.15281-1-fliegbert2@gmail.com>
References: <20260715171634.1550-1-fliegbert2@gmail.com>
 <20260731142004.15281-1-fliegbert2@gmail.com>
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
index d662cc8f5c59..e5eb56d55689 100644
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
@@ -2505,7 +2505,7 @@ inline void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *ps
 }
 
 int issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da, u8 ch, bool append_wps,
-	int try_cnt, int wait_ms)
+		      int try_cnt, int wait_ms)
 {
 	int ret;
 	int i = 0;
@@ -2906,8 +2906,8 @@ void issue_assocreq(struct adapter *padapter)
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
@@ -3279,7 +3279,7 @@ int issue_deauth(struct adapter *padapter, unsigned char *da, unsigned short rea
 }
 
 int issue_deauth_ex(struct adapter *padapter, u8 *da, unsigned short reason, int try_cnt,
-	int wait_ms)
+		    int wait_ms)
 {
 	int ret;
 	int i = 0;
@@ -4171,7 +4171,7 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 
 	/*  Adjust channel plan by AP Country IE */
 	if (pregistrypriv->enable80211d &&
-		(!pmlmeext->update_channel_plan_by_ap_done)) {
+	    (!pmlmeext->update_channel_plan_by_ap_done)) {
 		u8 *ie, *p;
 		u32 len;
 		struct rt_channel_plan chplan_ap;
@@ -4221,8 +4221,8 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 		if (pregistrypriv->wireless_mode & WIRELESS_11G) {
 			do {
 				if ((i == MAX_CHANNEL_NUM) ||
-					(chplan_sta[i].channel_num == 0) ||
-					(chplan_sta[i].channel_num > 14))
+				    (chplan_sta[i].channel_num == 0) ||
+				    (chplan_sta[i].channel_num > 14))
 					break;
 
 				if ((j == chplan_ap.Len) || (chplan_ap.Channel[j] > 14))
@@ -4249,8 +4249,8 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 
 			/*  change AP not support channel to Passive scan */
 			while ((i < MAX_CHANNEL_NUM) &&
-				(chplan_sta[i].channel_num != 0) &&
-				(chplan_sta[i].channel_num <= 14)) {
+			       (chplan_sta[i].channel_num != 0) &&
+			       (chplan_sta[i].channel_num <= 14)) {
 				chplan_new[k].channel_num = chplan_sta[i].channel_num;
 				chplan_new[k].scan_type = SCAN_PASSIVE;
 				i++;
@@ -4267,8 +4267,8 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
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
@@ -5342,7 +5342,7 @@ u8 disconnect_hdl(struct adapter *padapter, unsigned char *pbuf)
 }
 
 static int rtw_scan_ch_decision(struct adapter *padapter, struct rtw_ieee80211_channel *out,
-	u32 out_num, struct rtw_ieee80211_channel *in, u32 in_num)
+				u32 out_num, struct rtw_ieee80211_channel *in, u32 in_num)
 {
 	int i, j;
 	int set_idx;
@@ -5588,7 +5588,7 @@ u8 add_ba_hdl(struct adapter *padapter, unsigned char *pbuf)
 		return	H2C_SUCCESS;
 
 	if (((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && (pmlmeinfo->HT_enable)) ||
-		((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)) {
+	    ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)) {
 		/* pmlmeinfo->ADDBA_retry_count = 0; */
 		/* pmlmeinfo->candidate_tid_bitmap |= (0x1 << pparm->tid); */
 		/* psta->htpriv.candidate_tid_bitmap |= BIT(pparm->tid); */
-- 
2.55.0

