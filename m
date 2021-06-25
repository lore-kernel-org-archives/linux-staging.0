Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718692FB2
	for <linux-staging@lists.linux.dev>; Fri, 25 Jun 2021 00:08:19 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id c23so17339037qkc.10
        for <linux-staging@lists.linux.dev>; Thu, 24 Jun 2021 17:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qtQVHMi9H+pVQHes6iy9TLOxEnRSZ/aLA/5YcVtVSdI=;
        b=M1vxDsejmyj8tBID3bfpA9E7hQZzzlSemxHS/IYxrIurcRqzmtLCjiT2XFDDI4mb/m
         /FTT4blPjwVSJ9nL73Ourm0yt5wWqWGTUNgcw72ESaGJAeFZyYTybX7a1D4OwAElAMJG
         cRAsd1jK9L7iAiyYMT3s3VehJjriYg6MHvIUjTZK3pJ2uatfaP7gNqBjV32uXCe63Jhm
         qxJzYb3kTyevpOPIRZ15kXeH/aAH13cYUXZq5s9ivo+nbFlxdX9s5cRZawONmMYt3RzV
         KEamVkKWccsTLWbrrNcTCahcg51ZnVmfQQ8xjbdlKjIE6Dd4QapxProXlN+MQ1C3wKIe
         D4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qtQVHMi9H+pVQHes6iy9TLOxEnRSZ/aLA/5YcVtVSdI=;
        b=bKCoFaHQcRkzRHuHGzJI41uyr2d9whE/8/44mZm9fPP4c5Eytu+wfFx+pZEq0V0JCL
         qZVD1lmimltgGJDHo9OMYOvacKjAbZeSXnTSvuImrtlt5z9L7bUORZUyaivfD7INk4Xv
         Yho+A15a+Sf9BNWpM49Du/FLcMf06SX7AeBFcOm8CraA6IIgk46zbpajGrSCv5ugYDkf
         bNRUI6aaCJjJS5XLU3xQ6fJWhfXLJ92C3Flo1uAZy4XC/pVsHUtuzz1WdDj9PpFg820A
         QOdEcUFbjt79/Qj3OsrgRPqt12jKzyI9R6dVKmGg8lCU7nXmtTqCiwMz7h8UIFvLq2kc
         6feA==
X-Gm-Message-State: AOAM530fiQBNjn+vzZsW7phksBCevOe08jpH7DbvZfaKAFNZoP/VV9Gd
	RwrqFjvgHULDF1eU7G2ZX/1Vjw==
X-Google-Smtp-Source: ABdhPJyd/u/M7JUrUZ59goM4P1BM9lwKVIuA+hAi7Vlr+O9uTs2fu43wpV5MAYGXRV/nxP/ttgS7ew==
X-Received: by 2002:a37:b44:: with SMTP id 65mr8465068qkl.248.1624579698645;
        Thu, 24 Jun 2021 17:08:18 -0700 (PDT)
Received: from kerneldevvm.. (5.6.a.8.a.a.b.f.c.9.4.c.a.9.a.a.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:aa9a:c49c:fbaa:8a65])
        by smtp.gmail.com with ESMTPSA id m187sm3629014qkd.131.2021.06.24.17.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 17:08:18 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 12/23] staging: rtl8188eu: remove all RT_TRACE calls from core/rtw_ieee80211.c
Date: Fri, 25 Jun 2021 01:07:45 +0100
Message-Id: <20210625000756.6313-13-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625000756.6313-1-phil@philpotter.co.uk>
References: <20210625000756.6313-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all RT_TRACE calls from core/rtw_ieee80211.c as this macro is
unnecessary, and these calls are dubious in terms of necessity.
Removing all calls will ultimately allow the removal of the macro
itself.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 .../staging/rtl8188eu/core/rtw_ieee80211.c    | 71 ++-----------------
 1 file changed, 7 insertions(+), 64 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_ieee80211.c b/drivers/staging/rtl8188eu/core/rtw_ieee80211.c
index 7a0544cba4bf..e431914db008 100644
--- a/drivers/staging/rtl8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8188eu/core/rtw_ieee80211.c
@@ -370,7 +370,6 @@ int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwis
 		pos += WPA_SELECTOR_LEN;
 		left -= WPA_SELECTOR_LEN;
 	} else if (left > 0) {
-		RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_, ("%s: ie length mismatch, %u too much", __func__, left));
 		return _FAIL;
 	}
 
@@ -380,11 +379,8 @@ int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwis
 		pos += 2;
 		left -= 2;
 
-		if (count == 0 || left < count * WPA_SELECTOR_LEN) {
-			RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_, ("%s: ie count botch (pairwise), count %u left %u",
-						__func__, count, left));
+		if (count == 0 || left < count * WPA_SELECTOR_LEN)
 			return _FAIL;
-		}
 
 		for (i = 0; i < count; i++) {
 			*pairwise_cipher |= rtw_get_wpa_cipher_suite(pos);
@@ -393,17 +389,14 @@ int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwis
 			left -= WPA_SELECTOR_LEN;
 		}
 	} else if (left == 1) {
-		RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_, ("%s: ie too short (for key mgmt)",   __func__));
 		return _FAIL;
 	}
 
 	if (is_8021x) {
 		if (left >= 6) {
 			pos += 2;
-			if (!memcmp(pos, SUITE_1X, 4)) {
-				RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("%s : there has 802.1x auth\n", __func__));
+			if (!memcmp(pos, SUITE_1X, 4))
 				*is_8021x = 1;
-			}
 		}
 	}
 
@@ -437,7 +430,6 @@ int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwi
 		left -= RSN_SELECTOR_LEN;
 
 	} else if (left > 0) {
-		RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_, ("%s: ie length mismatch, %u too much", __func__, left));
 		return _FAIL;
 	}
 
@@ -447,11 +439,8 @@ int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwi
 		pos += 2;
 		left -= 2;
 
-		if (count == 0 || left < count * RSN_SELECTOR_LEN) {
-			RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_, ("%s: ie count botch (pairwise), count %u left %u",
-						__func__, count, left));
+		if (count == 0 || left < count * RSN_SELECTOR_LEN)
 			return _FAIL;
-		}
 
 		for (i = 0; i < count; i++) {
 			*pairwise_cipher |= rtw_get_wpa2_cipher_suite(pos);
@@ -461,18 +450,14 @@ int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwi
 		}
 
 	} else if (left == 1) {
-		RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_, ("%s: ie too short (for key mgmt)",  __func__));
-
 		return _FAIL;
 	}
 
 	if (is_8021x) {
 		if (left >= 6) {
 			pos += 2;
-			if (!memcmp(pos, SUITE_1X, 4)) {
-				RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("%s (): there has 802.1x auth\n", __func__));
+			if (!memcmp(pos, SUITE_1X, 4))
 				*is_8021x = 1;
-			}
 		}
 	}
 	return ret;
@@ -480,7 +465,7 @@ int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwi
 
 void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie, u16 *wpa_len)
 {
-	u8 authmode, sec_idx, i;
+	u8 authmode, sec_idx;
 	u8 wpa_oui[4] = {0x0, 0x50, 0xf2, 0x01};
 	uint cnt;
 
@@ -494,40 +479,16 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
 		authmode = in_ie[cnt];
 
 		if ((authmode == WLAN_EID_VENDOR_SPECIFIC) && (!memcmp(&in_ie[cnt + 2], &wpa_oui[0], 4))) {
-			RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
-				 ("\n rtw_get_wpa_ie: sec_idx =%d in_ie[cnt+1]+2 =%d\n",
-				 sec_idx, in_ie[cnt + 1] + 2));
-
-			if (wpa_ie) {
+			if (wpa_ie)
 				memcpy(wpa_ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
 
-				for (i = 0; i < (in_ie[cnt + 1] + 2); i += 8) {
-					RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
-						 ("\n %2x,%2x,%2x,%2x,%2x,%2x,%2x,%2x\n",
-						 wpa_ie[i], wpa_ie[i + 1], wpa_ie[i + 2], wpa_ie[i + 3], wpa_ie[i + 4],
-						 wpa_ie[i + 5], wpa_ie[i + 6], wpa_ie[i + 7]));
-				}
-			}
-
 			*wpa_len = in_ie[cnt + 1] + 2;
 			cnt += in_ie[cnt + 1] + 2;  /* get next */
 		} else {
 			if (authmode == WLAN_EID_RSN) {
-				RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
-					 ("\n get_rsn_ie: sec_idx =%d in_ie[cnt+1]+2 =%d\n",
-					 sec_idx, in_ie[cnt + 1] + 2));
-
-				if (rsn_ie) {
+				if (rsn_ie)
 					memcpy(rsn_ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
 
-					for (i = 0; i < (in_ie[cnt + 1] + 2); i += 8) {
-						RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
-							 ("\n %2x,%2x,%2x,%2x,%2x,%2x,%2x,%2x\n",
-							 rsn_ie[i], rsn_ie[i + 1], rsn_ie[i + 2], rsn_ie[i + 3], rsn_ie[i + 4],
-							 rsn_ie[i + 5], rsn_ie[i + 6], rsn_ie[i + 7]));
-						}
-				}
-
 				*rsn_len = in_ie[cnt + 1] + 2;
 				cnt += in_ie[cnt + 1] + 2;  /* get next */
 			} else {
@@ -895,30 +856,20 @@ static int rtw_get_cipher_info(struct wlan_network *pnetwork)
 	pbuf = rtw_get_wpa_ie(&pnetwork->network.ies[12], &wpa_ielen, pnetwork->network.ie_length - 12);
 
 	if (pbuf && (wpa_ielen > 0)) {
-		RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("%s: wpa_ielen: %d", __func__, wpa_ielen));
 		if (rtw_parse_wpa_ie(pbuf, wpa_ielen + 2, &group_cipher, &pairwise_cipher, &is8021x) == _SUCCESS) {
 			pnetwork->BcnInfo.pairwise_cipher = pairwise_cipher;
 			pnetwork->BcnInfo.group_cipher = group_cipher;
 			pnetwork->BcnInfo.is_8021x = is8021x;
-			RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
-				 ("%s: pnetwork->pairwise_cipher: %d, is_8021x is %d",
-				  __func__, pnetwork->BcnInfo.pairwise_cipher,
-				  pnetwork->BcnInfo.is_8021x));
 			ret = _SUCCESS;
 		}
 	} else {
 		pbuf = rtw_get_wpa2_ie(&pnetwork->network.ies[12], &wpa_ielen, pnetwork->network.ie_length - 12);
 
 		if (pbuf && (wpa_ielen > 0)) {
-			RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("get RSN IE\n"));
 			if (rtw_parse_wpa2_ie(pbuf, wpa_ielen + 2, &group_cipher, &pairwise_cipher, &is8021x) == _SUCCESS) {
-				RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("get RSN IE  OK!!!\n"));
 				pnetwork->BcnInfo.pairwise_cipher = pairwise_cipher;
 				pnetwork->BcnInfo.group_cipher = group_cipher;
 				pnetwork->BcnInfo.is_8021x = is8021x;
-				RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("%s: pnetwork->pairwise_cipher: %d, pnetwork->group_cipher is %d, is_8021x is %d",
-							__func__, pnetwork->BcnInfo.pairwise_cipher,
-							pnetwork->BcnInfo.group_cipher, pnetwork->BcnInfo.is_8021x));
 				ret = _SUCCESS;
 			}
 		}
@@ -946,10 +897,6 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork)
 		pnetwork->BcnInfo.encryp_protocol = ENCRYP_PROTOCOL_OPENSYS;
 	}
 	rtw_get_sec_ie(pnetwork->network.ies, pnetwork->network.ie_length, NULL, &rsn_len, NULL, &wpa_len);
-	RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("%s: ssid =%s\n", __func__, pnetwork->network.ssid.ssid));
-	RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("%s: wpa_len =%d rsn_len =%d\n", __func__, wpa_len, rsn_len));
-	RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("%s: ssid =%s\n", __func__, pnetwork->network.ssid.ssid));
-	RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("%s: wpa_len =%d rsn_len =%d\n", __func__, wpa_len, rsn_len));
 
 	if (rsn_len > 0) {
 		pnetwork->BcnInfo.encryp_protocol = ENCRYP_PROTOCOL_WPA2;
@@ -959,10 +906,6 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork)
 		if (bencrypt)
 			pnetwork->BcnInfo.encryp_protocol = ENCRYP_PROTOCOL_WEP;
 	}
-	RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("%s: pnetwork->encryp_protocol is %x\n",
-							__func__, pnetwork->BcnInfo.encryp_protocol));
-	RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("%s: pnetwork->encryp_protocol is %x\n",
-							__func__, pnetwork->BcnInfo.encryp_protocol));
 	rtw_get_cipher_info(pnetwork);
 
 	/* get bwmode and ch_offset */
-- 
2.31.1

