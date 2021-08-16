Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0646D19
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 15:59:42 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id l7-20020a1c2507000000b002e6be5d86b3so276134wml.3
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 08:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2+mPLSxvcss4yLtby9231KQWWeFOG+4M3LUPF7HGTnU=;
        b=iR6T4yGK7qpRJgQ1jRhBjr3A7pBux2EJfJNvDUDqlTl+JfVt3AkGlI0CCVpyS5+DWz
         6sqlfArVILAF7wFynDngwVSH+kGWnn+RGeUa3mxyvY93wysWuMGzsK9cZpbXwSrv3h0+
         IRNhHRw4Z7B6O5dGc62z6dDEpGHjIHnhJQwWEk+uv3MOrqMvj9wD5Y49uHq0yPHY8FsP
         wg3jC351aupmaz1KhDZkv/3dEfSIqfrchb7nJyyUtEr4tgqZvsbA2LOcRNE739i3qLRP
         ecgZGKz3mCcethiQuNW6kLr55tJ6RLAgobXoDeaUrR/ox8H9MlkzKRR8PGypRed3T2Tu
         d8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2+mPLSxvcss4yLtby9231KQWWeFOG+4M3LUPF7HGTnU=;
        b=WYRO6kF7/FOIkjutEnQBTAAaMv4hj9AGmeZtwJfCaQ/aPms723kx1SjjF5tPOAxG19
         /4S2dqjJWfkw84BQHJ5RgvKzdcIvp2kKGbdoRqwicsvzrxtmYgAk+nkZRONOP1tieEUv
         CMnyCSc20ttGzCfhMaPmhXar2iCG9VnJlbwJGs17CUqzsbU0Vk+ndYwV/vk/YDfGih+H
         Y3WTpxVLzr5W6C+XO14AW+Uk/kHYZYNc6ktzwDhkJt7RPVQSwLjuAx5jiHBOKw6q40Vj
         WcLbROBzqa4Gr8jnT3kSMjcO0RY9zgE9uqDAjmq5sjsSnS92/8TGzXBkbeGP56/A+s+O
         I4TA==
X-Gm-Message-State: AOAM530Xk9e6uqBCt6ZYDUb5+k+HwpbKrZ3zy6aK9SOtH1ZItTXCpw5m
	IB0YAoZ4T826f+/9jxV8YvU=
X-Google-Smtp-Source: ABdhPJy40kMTJ+/EWp1sxg5RTlnbEaVqdgjU6AubQ0MKsGnH9IIHrDQRQC7oikh0LwCZpPq1fCdV2Q==
X-Received: by 2002:a7b:c04b:: with SMTP id u11mr9524443wmc.41.1629129580712;
        Mon, 16 Aug 2021 08:59:40 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id a77sm11589597wmd.31.2021.08.16.08.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 08:59:40 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 18/23] staging: r8188eu: add spaces around operators in core/rtw_wlan_util.c
Date: Mon, 16 Aug 2021 17:58:13 +0200
Message-Id: <20210816155818.24005-19-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816155818.24005-1-straube.linux@gmail.com>
References: <20210816155818.24005-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missung spaces around operators in core/rtw_wlan_util.c reported
by checkpatch.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c | 60 ++++++++++----------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index cddacf023fa6..96f03e84b7e5 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -29,20 +29,20 @@ unsigned char REALTEK_96B_IE[] = {0x00, 0xe0, 0x4c, 0x02, 0x01, 0x20};
 #define WAIT_FOR_BCN_TO_MAX	(20000)
 
 static u8 rtw_basic_rate_cck[4] = {
-	IEEE80211_CCK_RATE_1MB|IEEE80211_BASIC_RATE_MASK, IEEE80211_CCK_RATE_2MB|IEEE80211_BASIC_RATE_MASK,
-	IEEE80211_CCK_RATE_5MB|IEEE80211_BASIC_RATE_MASK, IEEE80211_CCK_RATE_11MB|IEEE80211_BASIC_RATE_MASK
+	IEEE80211_CCK_RATE_1MB | IEEE80211_BASIC_RATE_MASK, IEEE80211_CCK_RATE_2MB | IEEE80211_BASIC_RATE_MASK,
+	IEEE80211_CCK_RATE_5MB | IEEE80211_BASIC_RATE_MASK, IEEE80211_CCK_RATE_11MB | IEEE80211_BASIC_RATE_MASK
 };
 
 static u8 rtw_basic_rate_ofdm[3] = {
-	IEEE80211_OFDM_RATE_6MB|IEEE80211_BASIC_RATE_MASK, IEEE80211_OFDM_RATE_12MB|IEEE80211_BASIC_RATE_MASK,
-	IEEE80211_OFDM_RATE_24MB|IEEE80211_BASIC_RATE_MASK
+	IEEE80211_OFDM_RATE_6MB | IEEE80211_BASIC_RATE_MASK, IEEE80211_OFDM_RATE_12MB | IEEE80211_BASIC_RATE_MASK,
+	IEEE80211_OFDM_RATE_24MB | IEEE80211_BASIC_RATE_MASK
 };
 
 static u8 rtw_basic_rate_mix[7] = {
-	IEEE80211_CCK_RATE_1MB|IEEE80211_BASIC_RATE_MASK, IEEE80211_CCK_RATE_2MB|IEEE80211_BASIC_RATE_MASK,
-	IEEE80211_CCK_RATE_5MB|IEEE80211_BASIC_RATE_MASK, IEEE80211_CCK_RATE_11MB|IEEE80211_BASIC_RATE_MASK,
-	IEEE80211_OFDM_RATE_6MB|IEEE80211_BASIC_RATE_MASK, IEEE80211_OFDM_RATE_12MB|IEEE80211_BASIC_RATE_MASK,
-	IEEE80211_OFDM_RATE_24MB|IEEE80211_BASIC_RATE_MASK
+	IEEE80211_CCK_RATE_1MB | IEEE80211_BASIC_RATE_MASK, IEEE80211_CCK_RATE_2MB | IEEE80211_BASIC_RATE_MASK,
+	IEEE80211_CCK_RATE_5MB | IEEE80211_BASIC_RATE_MASK, IEEE80211_CCK_RATE_11MB | IEEE80211_BASIC_RATE_MASK,
+	IEEE80211_OFDM_RATE_6MB | IEEE80211_BASIC_RATE_MASK, IEEE80211_OFDM_RATE_12MB | IEEE80211_BASIC_RATE_MASK,
+	IEEE80211_OFDM_RATE_24MB | IEEE80211_BASIC_RATE_MASK
 };
 
 int cckrates_included(unsigned char *rate, int ratelen)
@@ -407,7 +407,7 @@ int is_client_associated_to_ap(struct adapter *padapter)
 	pmlmeext = &padapter->mlmeextpriv;
 	pmlmeinfo = &pmlmeext->mlmext_info;
 
-	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE))
+	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE))
 		return true;
 	else
 		return _FAIL;
@@ -418,7 +418,7 @@ int is_client_associated_to_ibss(struct adapter *padapter)
 	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
 
-	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE))
+	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE))
 		return true;
 	else
 		return _FAIL;
@@ -475,7 +475,7 @@ void write_cam(struct adapter *padapter, u8 entry, u16 ctrl, u8 *mac, u8 *key)
 			break;
 		default:
 			i = (j - 2) << 2;
-			val = (key[i] | (key[i+1] << 8) | (key[i+2] << 16) | (key[i+3] << 24));
+			val = (key[i] | (key[i + 1] << 8) | (key[i + 2] << 16) | (key[i + 3] << 24));
 			break;
 		}
 
@@ -613,7 +613,7 @@ void WMMOnAssocRsp(struct adapter *padapter)
 
 		/* entry indx: 0->vo, 1->vi, 2->be, 3->bk. */
 		for (i = 0; i < 4; i++) {
-			for (j = i+1; j < 4; j++) {
+			for (j = i + 1; j < 4; j++) {
 				/* compare CW and AIFS */
 				if ((edca[j] & 0xFFFF) < (edca[i] & 0xFFFF)) {
 					change_inx = true;
@@ -942,7 +942,7 @@ int rtw_check_bcn_info(struct adapter  *Adapter, u8 *pframe, u32 packet_len)
 			ht_info_infos_0 = 0;
 	}
 	if (ht_cap_info != cur_network->BcnInfo.ht_cap_info ||
-	    ((ht_info_infos_0&0x03) != (cur_network->BcnInfo.ht_info_infos_0&0x03))) {
+	    ((ht_info_infos_0 & 0x03) != (cur_network->BcnInfo.ht_info_infos_0 & 0x03))) {
 			DBG_88E("%s bcn now: ht_cap_info:%x ht_info_infos_0:%x\n", __func__,
 				ht_cap_info, ht_info_infos_0);
 			DBG_88E("%s bcn link: ht_cap_info:%x ht_info_infos_0:%x\n", __func__,
@@ -1029,14 +1029,14 @@ int rtw_check_bcn_info(struct adapter  *Adapter, u8 *pframe, u32 packet_len)
 	}
 
 	if (encryp_protocol == ENCRYP_PROTOCOL_WPA || encryp_protocol == ENCRYP_PROTOCOL_WPA2) {
-		pbuf = rtw_get_wpa_ie(&bssid->IEs[12], &wpa_ielen, bssid->IELength-12);
+		pbuf = rtw_get_wpa_ie(&bssid->IEs[12], &wpa_ielen, bssid->IELength - 12);
 		if (pbuf && (wpa_ielen > 0)) {
-			rtw_parse_wpa_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is_8021x);
+			rtw_parse_wpa_ie(pbuf, wpa_ielen + 2, &group_cipher, &pairwise_cipher, &is_8021x);
 		} else {
-			pbuf = rtw_get_wpa2_ie(&bssid->IEs[12], &wpa_ielen, bssid->IELength-12);
+			pbuf = rtw_get_wpa2_ie(&bssid->IEs[12], &wpa_ielen, bssid->IELength - 12);
 
 			if (pbuf && (wpa_ielen > 0))
-				rtw_parse_wpa2_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is_8021x);
+				rtw_parse_wpa2_ie(pbuf, wpa_ielen + 2, &group_cipher, &pairwise_cipher, &is_8021x);
 		}
 
 		if (pairwise_cipher != cur_network->BcnInfo.pairwise_cipher || group_cipher != cur_network->BcnInfo.group_cipher) {
@@ -1193,40 +1193,40 @@ int wifirate2_ratetbl_inx(unsigned char rate)
 	rate = rate & 0x7f;
 
 	switch (rate) {
-	case 54*2:
+	case 54 * 2:
 		inx = 11;
 		break;
-	case 48*2:
+	case 48 * 2:
 		inx = 10;
 		break;
-	case 36*2:
+	case 36 * 2:
 		inx = 9;
 		break;
-	case 24*2:
+	case 24 * 2:
 		inx = 8;
 		break;
-	case 18*2:
+	case 18 * 2:
 		inx = 7;
 		break;
-	case 12*2:
+	case 12 * 2:
 		inx = 6;
 		break;
-	case 9*2:
+	case 9 * 2:
 		inx = 5;
 		break;
-	case 6*2:
+	case 6 * 2:
 		inx = 4;
 		break;
-	case 11*2:
+	case 11 * 2:
 		inx = 3;
 		break;
 	case 11:
 		inx = 2;
 		break;
-	case 2*2:
+	case 2 * 2:
 		inx = 1;
 		break;
-	case 1*2:
+	case 1 * 2:
 		inx = 0;
 		break;
 	}
@@ -1584,7 +1584,7 @@ void process_addba_req(struct adapter *padapter, u8 *paddba_req, u8 *addr)
 
 	if (psta) {
 		param = le16_to_cpu(preq->BA_para_set);
-		tid = (param>>2)&0x0f;
+		tid = (param >> 2) & 0x0f;
 		preorder_ctrl = &psta->recvreorder_ctrl[tid];
 		preorder_ctrl->indicate_seq = 0xffff;
 		preorder_ctrl->enable = (pmlmeinfo->bAcceptAddbaReq) ? true : false;
@@ -1599,7 +1599,7 @@ void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
 	pIE = pframe + sizeof(struct rtw_ieee80211_hdr_3addr);
 	pbuf = (__le32 *)pIE;
 
-	pmlmeext->TSFValue = le32_to_cpu(*(pbuf+1));
+	pmlmeext->TSFValue = le32_to_cpu(*(pbuf + 1));
 
 	pmlmeext->TSFValue = pmlmeext->TSFValue << 32;
 
-- 
2.32.0

