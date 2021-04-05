Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF895F
	for <linux-staging@lists.linux.dev>; Mon,  5 Apr 2021 17:29:27 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id b9so3656283wrs.1
        for <linux-staging@lists.linux.dev>; Mon, 05 Apr 2021 10:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rcUgpTqj2kdU+YBskPn+v5vQYu9sPyQVI1xkvuqXoSs=;
        b=Pcn1mDLVtc2ZToBS3hq3liVHxCZozL7WAC8eAFCcnnfpjQxtun1OD7nOkWsg03hmR8
         YHOTEuom5dqrubW9YGhKDojT24v1KNUi7RFLDcG0onDJ0xg698AImgstOFj3uBWqsDKo
         fb9pEqFiSeSpuIVxNPqlkiWuowNSFNJnK4celRjZHFYKsgdhpoyqWYzXyL/hQ+gkkkad
         Uu9RSmDuvVT7fBMD9j8K3gKjaj7Vk/hFUISjnRq2kVO6HS48WYwVDoUUUuaFI5CoXUk1
         CAhiLz3ym6DgWEx3EwDOP2h+ruEGSTgz6YXl+XTFCFfzCL1tPWDzxpGGaiK7uks61+jT
         ojUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rcUgpTqj2kdU+YBskPn+v5vQYu9sPyQVI1xkvuqXoSs=;
        b=L9lzGJaJQW2yASuRc6yXjKHbpP0JwX18qQVeHj2wc3QKNZh6WKE+G2ipnm1z3mHqP/
         vCZeyjtH7LMn5/S4vtRnOtgxBFjEORZoDvQo6/TUrhFrlqXCMm74376x7kX6j+hMgbCj
         /hIAjzokeVZrma5oSKnRXVmvBuXCBqrjwZGc7mxHa+OcPvl8Kc+uqlCDWs5QbppfzONe
         PLf0YDtRLHY30gAq6NlN+h1QSdXhk2J3moJsd+ZmR9/sCxTdHmrEJqXSueNnLbBYyAE9
         A8SrgVQq/gBjq+qcy9sNWHMH1ErTq7xyOUtsLAv70+TtqsoO1HjHx6sodyjmxDW6SSJ1
         6GNA==
X-Gm-Message-State: AOAM533P1BSsYnSkZwPdmzeloY+SSYOBVYLqQT3xjWoctOiz10r7zRVr
	JjuZmnM6vnhouGpJdKCTUSQ=
X-Google-Smtp-Source: ABdhPJy7Ct4lChRU7qyUfTa66278O83sBZDYlZ5pKVDoGqpu9qC5ZlV99o2ANuG4EsRwmS4uvAYu5w==
X-Received: by 2002:a05:6000:c9:: with SMTP id q9mr3496265wrx.17.1617643765979;
        Mon, 05 Apr 2021 10:29:25 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:9a5b:98e6:2174:bf29])
        by smtp.gmail.com with ESMTPSA id x1sm17858699wro.66.2021.04.05.10.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 10:29:25 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: [PATCH 4/4] staging: rtl8723bs: core: align arguments with open parenthesis
Date: Mon,  5 Apr 2021 18:29:20 +0100
Message-Id: <00250c746ed850f6a73ff0ad4c1735cbd019b58f.1617641790.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617641790.git.martinsdecarvalhobeatriz@gmail.com>
References: <cover.1617641790.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cleans up checks of "Alignment should match open parenthesis"
in file rtw_ap.c

Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index ca6fec52d213..73a35b3320fe 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -439,7 +439,7 @@ void add_RATid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
 		arg[3] = psta->init_rate;
 
 		DBG_871X("%s => mac_id:%d , raid:%d , shortGIrate =%d, bitmap = 0x%x\n",
-			__func__, psta->mac_id, psta->raid, shortGIrate, tx_ra_bitmap);
+			 __func__, psta->mac_id, psta->raid, shortGIrate, tx_ra_bitmap);
 
 		rtw_hal_add_ra_tid(padapter, tx_ra_bitmap, arg, rssi_level);
 	} else {
@@ -512,7 +512,7 @@ void update_bmc_sta(struct adapter *padapter)
 			arg[3] = psta->init_rate;
 
 			DBG_871X("%s => mac_id:%d , raid:%d , bitmap = 0x%x\n",
-				__func__, psta->mac_id, psta->raid, tx_ra_bitmap);
+				 __func__, psta->mac_id, psta->raid, tx_ra_bitmap);
 
 			rtw_hal_add_ra_tid(padapter, tx_ra_bitmap, arg, 0);
 		}
@@ -605,14 +605,14 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
 
 		/*  B0 Config LDPC Coding Capability */
 		if (TEST_FLAG(phtpriv_ap->ldpc_cap, LDPC_HT_ENABLE_TX) &&
-			GET_HT_CAPABILITY_ELE_LDPC_CAP((u8 *)(&phtpriv_sta->ht_cap))) {
+			      GET_HT_CAPABILITY_ELE_LDPC_CAP((u8 *)(&phtpriv_sta->ht_cap))) {
 			SET_FLAG(cur_ldpc_cap, (LDPC_HT_ENABLE_TX | LDPC_HT_CAP_TX));
 			DBG_871X("Enable HT Tx LDPC for STA(%d)\n", psta->aid);
 		}
 
 		/*  B7 B8 B9 Config STBC setting */
 		if (TEST_FLAG(phtpriv_ap->stbc_cap, STBC_HT_ENABLE_TX) &&
-			GET_HT_CAPABILITY_ELE_RX_STBC((u8 *)(&phtpriv_sta->ht_cap))) {
+			      GET_HT_CAPABILITY_ELE_RX_STBC((u8 *)(&phtpriv_sta->ht_cap))) {
 			SET_FLAG(cur_stbc_cap, (STBC_HT_ENABLE_TX | STBC_HT_CAP_TX));
 			DBG_871X("Enable HT Tx STBC for STA(%d)\n", psta->aid);
 		}
@@ -1176,7 +1176,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		);
 
 		if ((psecuritypriv->wpa_pairwise_cipher & WPA_CIPHER_CCMP) ||
-			(psecuritypriv->wpa2_pairwise_cipher & WPA_CIPHER_CCMP)) {
+		     (psecuritypriv->wpa2_pairwise_cipher & WPA_CIPHER_CCMP)) {
 			pht_cap->ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_DENSITY & (0x07 << 2));
 		} else {
 			pht_cap->ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_DENSITY & 0x00);
@@ -1233,7 +1233,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	pmlmepriv->htpriv.ht_option = false;
 
 	if ((psecuritypriv->wpa2_pairwise_cipher & WPA_CIPHER_TKIP) ||
-		      (psecuritypriv->wpa_pairwise_cipher & WPA_CIPHER_TKIP)) {
+	     (psecuritypriv->wpa_pairwise_cipher & WPA_CIPHER_TKIP)) {
 		/* todo: */
 		/* ht_cap = false; */
 	}
@@ -1820,7 +1820,7 @@ static int rtw_ht_operation_update(struct adapter *padapter)
 	}
 
 	DBG_871X("%s new operation mode = 0x%X changes =%d\n",
-		   __func__, pmlmepriv->ht_op_mode, op_mode_changes);
+		 __func__, pmlmepriv->ht_op_mode, op_mode_changes);
 
 	return op_mode_changes;
 }
@@ -1865,7 +1865,7 @@ void bss_cap_update_on_sta_join(struct adapter *padapter, struct sta_info *psta)
 			pmlmepriv->num_sta_no_short_preamble++;
 
 			if ((pmlmeext->cur_wireless_mode > WIRELESS_11B) &&
-				(pmlmepriv->num_sta_no_short_preamble == 1)) {
+			    (pmlmepriv->num_sta_no_short_preamble == 1)) {
 				beacon_updated = true;
 				update_beacon(padapter, 0xFF, NULL, true);
 			}
-- 
2.25.1

