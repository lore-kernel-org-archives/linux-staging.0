Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944A33F99E1
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 16:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784304928; cv=none; b=lB6Ai3WCxicsGzc1kXFYliDx17gDdkV5dq97nMvz4Mb2Q8/m9GkiQOLHR1j18UyH/X8OZkuRC/OrZNSx6Mbqa9A9B4eVhnasCmg2AF/Q2srDbz5wvqJc0nk8jOaxqHmdHmwe0TK430CXGU4KdAgXpY41SXc7w487l6UDvabhjfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784304928; c=relaxed/simple;
	bh=RHo9R8BnTqDlxq7u6OixE5fwGbLhjtZ+mxTR7WKgVe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CaePaIPHlgPtrB/uO16XiBY/SX+8pyEY9R+TNz+l9zHSSKzh53LQ/TZmE036VLTsDm1fuel/EPFJurca9frLsKmT4+lOA6QYZYiMYvJfJAuGCisVY7d394yUrMjAHNy+f1uI/ZOifCjXCs1/U/bUte5gDRf2fhp7OTRGFZHXe/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mrrCOiDw; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrrCOiDw"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-475881b9a4bso4706688f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 09:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784304925; x=1784909725; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8LrC2qwHf2lSigkZwM3f4GEqTfOppRZaIXNSrf/Vrak=;
        b=mrrCOiDwUMsB/minfaSOwL5BNUONc4Zh7n17Imj9m/gxgh+PGN5Cu3EoVLGD1vc960
         skce2iKL3f78JtUzNDZEmWiIAy+IbS9pE+qt2EJgW2x3IfYgh91CMHkkgY20sA4AlHI4
         5Vg0+5NecAoEKjy305AA9R//62y6Wr1MSokjdUpAH05v9S3jHMZt2N5aKK3Zbp4Zga0D
         DVY9mS/6P2EuZPTw4RLDS1vkXumHWE4oKH5O+46NeBAwoaAfQ9G6IuohzrKNNwSh+d8N
         zphzsG6+AWB62X9Z6/Zn4uGLwjAU2k1EYVUl2VZMjXmHE/yZUXUsQvt9ryFW+8f8J7fj
         uUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784304925; x=1784909725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8LrC2qwHf2lSigkZwM3f4GEqTfOppRZaIXNSrf/Vrak=;
        b=ov6TUP/PchtH7PEvEZa9hk7Ez2mXpIRVjnLr/KR+vnW/h3Dlqdrq+riAQ0BUj+sYly
         0gLbH/eCeT2MCWM1NdhyH0itIbEZtAzxCfHaw3mgwkGMAmQYu+gRwBsBHdQFa5iR8e19
         XPKNfMDfSsU1t75I4IWxrzHmxA1b82LzibNb3mOkEekz9Z/TLc9bv9My6Zx5jJligG01
         WwTYjKGF2EhGam+FVrt1AxJfMpaPy00HbPIsTpTQNDb+XW6kU55sd48sS3bOwXdpt/RN
         6h0O/O+9Fm7KOUC17pipmYwVW5VPqMg3wlPe3E3EhRfc4eQA+MdsVdxE9mHLtpeIdvGa
         9cPw==
X-Gm-Message-State: AOJu0Yx35grqqaHOf0ikm6I6fPYNByvyi2O0Xqi5N4X1KEvlRE5o3SrS
	/odgFqFuVTDyqoZl0XG5LhuGTg4Nchxeh/H5SwTy7Easf1N3eiJkkTjM
X-Gm-Gg: AfdE7clTs6Y2HCdvzx3xW8UK18rbhZrem9Bxz3vBH60DWL1G5hGYqusr8vX3B6X4YVb
	GSwC+WDSqxK39yy9Q+5GQY9HqI9u5fl0P8Xv1smarCBMfU3UFqSfeyOS7UBFPEgnGwgVWE87yp4
	S7oVF47lzScl8YvoDZExmOY4I296DCAZan+GuNEpb5I++yDc4MqRmnfB+OcvqcN1Hl1UfYrMJd7
	0iU1Vg3TiwSfJomCb4gDjwv1V6En1dzEhmq/wxCdaPedQ453OWhqhMZIQ8MhY+XhiHD3aU9LwvC
	l7c2TIBN0cyfDYgxdcB3691CLeABbCUOwvuhsA/7jr23luYPwUMOjtilUqPGjMBC7Lp0uglMA7s
	G8x/usF1BZvLG30BUPGwG6IWIUO3GHiFnVn81Ot67B5sQiyJtXtVYkhw20axuLpHoLCFC4LGFYq
	HwN4OstYEVPbia29Tf0ildoq82GjobMcaK9xcpBl2sWjJLWlAS0/636lON0BMiIwzY89I=
X-Received: by 2002:a5d:5f55:0:b0:460:6a13:9131 with SMTP id ffacd0b85a97d-47f622f8373mr4347703f8f.19.1784304924669;
        Fri, 17 Jul 2026 09:15:24 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f66df025csm3252526f8f.0.2026.07.17.09.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:15:24 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v2 4/4] staging: rtl8723bs: fix Alignment should match open parenthesis in rtw_mlme_ext.c
Date: Fri, 17 Jul 2026 16:13:29 +0000
Message-ID: <20260717161329.3400-5-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260717161329.3400-1-fliegbert2@gmail.com>
References: <20260715171634.1550-1-fliegbert2@gmail.com>
 <20260717161329.3400-1-fliegbert2@gmail.com>
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
index 5d2254222701..94a4574d57d0 100644
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
@@ -4173,7 +4173,7 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 
 	/*  Adjust channel plan by AP Country IE */
 	if (pregistrypriv->enable80211d &&
-		(!pmlmeext->update_channel_plan_by_ap_done)) {
+	    (!pmlmeext->update_channel_plan_by_ap_done)) {
 		u8 *ie, *p;
 		u32 len;
 		struct rt_channel_plan chplan_ap;
@@ -4223,8 +4223,8 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 		if (pregistrypriv->wireless_mode & WIRELESS_11G) {
 			do {
 				if ((i == MAX_CHANNEL_NUM) ||
-					(chplan_sta[i].channel_num == 0) ||
-					(chplan_sta[i].channel_num > 14))
+				    (chplan_sta[i].channel_num == 0) ||
+				    (chplan_sta[i].channel_num > 14))
 					break;
 
 				if ((j == chplan_ap.Len) || (chplan_ap.Channel[j] > 14))
@@ -4251,8 +4251,8 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 
 			/*  change AP not support channel to Passive scan */
 			while ((i < MAX_CHANNEL_NUM) &&
-				(chplan_sta[i].channel_num != 0) &&
-				(chplan_sta[i].channel_num <= 14)) {
+			       (chplan_sta[i].channel_num != 0) &&
+			       (chplan_sta[i].channel_num <= 14)) {
 				chplan_new[k].channel_num = chplan_sta[i].channel_num;
 				chplan_new[k].scan_type = SCAN_PASSIVE;
 				i++;
@@ -4269,8 +4269,8 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
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
@@ -5345,7 +5345,7 @@ u8 disconnect_hdl(struct adapter *padapter, unsigned char *pbuf)
 }
 
 static int rtw_scan_ch_decision(struct adapter *padapter, struct rtw_ieee80211_channel *out,
-	u32 out_num, struct rtw_ieee80211_channel *in, u32 in_num)
+				u32 out_num, struct rtw_ieee80211_channel *in, u32 in_num)
 {
 	int i, j;
 	int set_idx;
@@ -5591,7 +5591,7 @@ u8 add_ba_hdl(struct adapter *padapter, unsigned char *pbuf)
 		return	H2C_SUCCESS;
 
 	if (((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && (pmlmeinfo->HT_enable)) ||
-		((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)) {
+	    ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)) {
 		/* pmlmeinfo->ADDBA_retry_count = 0; */
 		/* pmlmeinfo->candidate_tid_bitmap |= (0x1 << pparm->tid); */
 		/* psta->htpriv.candidate_tid_bitmap |= BIT(pparm->tid); */
-- 
2.54.0

