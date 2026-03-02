Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3CA3630B3
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 12:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772452802; cv=none; b=btEnTWHD3XwJcEE2UCOhTTxOhPVvGtlMj3UHVV4c9rVuqcg4mIOwzJVLHngKoN/rruM2nZe2vB2AEZkBZS6UcMT1ucHVJ5xBW1vzDLIWhCPxtKrhRm40Lf9FgiovXxdJn9HPg66fkp+71RxdKsqejELgv8+tyS31D97+XxO6MVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772452802; c=relaxed/simple;
	bh=i5Q4r678rjgEAb/Qaeot2fwaegmoPEhaSak2t0Gmiho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P1ihJNkHpMYHzoHiQ3G73krPorOVJQJFaKQ/olm0A1KqYVU6betq90m2nFosjLb9r0PdQD5a5/vV0C5TeItuy0Jc9YIUHZyO250PUPadDUi9Lzq1kyGQn20HVi6C44B0RiV1JvKAlIcwHZWueueYF4W8zXx5Bp8ipRKvc9TAWXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bEq2o8vk; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bEq2o8vk"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-483a2338616so27466965e9.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 04:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772452799; x=1773057599; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e3FjBQtVGlu6A8tGrJ9zirjh6wKPE2tAkDBcrCReDYU=;
        b=bEq2o8vkojFNSISoK/zdwTs2lvZbBuI7YtJ/oLQlq9afyBpYRGU2FPIgBGaz6TT53i
         UMae0vwlDaOfZcRzLJ5Yvw/Bi+DEfjplAlW5tZGHlLsXXZzcIuDfd9l8ritXJVogturM
         O0f7xd2Y0DpKop0riAmTrIkt58Tcid9pI0j4Hohij3pGXQKSw5L8JuBg0NJ8n4Xl/Hx+
         t/kzouqa+hY8lAgzn4GZJYvAQ/ZeuDq9Ur2w0YThkThHJm0oYdihNPU+UffJHZ6T7yZo
         y5ijCRniXcAJQIg1FW0w8QxbcNVm1USII7LPVvZeXOf/vX9Gnez9YIW8WnPDGE60Asup
         Lj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772452799; x=1773057599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3FjBQtVGlu6A8tGrJ9zirjh6wKPE2tAkDBcrCReDYU=;
        b=axdpRp5FxgDwzTq/HyoKLijEf8XprvufKIrVYlMmHVXKKvEUqQmtTL3oHD6Zudz89K
         /wNwyxajfkxo4/qpJM5Dus0Oio3luiSi9i8smtAjZ3tr6/q25/KqGTPYz8u/0Da2IJAR
         LgNhsJQNdsqRnA1K5K0KxAkWarKMykamw10V5hqzABvjCR/UYVZPJRJR8oH5PjbOqd4m
         vwV5LbSTGdnRkpZ73VeWF42hp+Anw/Lst0ZTcIUnz3c0b4UB6P9iv+sMmaFmaZC3M4Cb
         rhreipo8S05ZNzfL3aovoIhbai/MGdBbdYLprrJdYJpdPJF+kh14OCYdGeVpaAepQNVE
         ++xA==
X-Gm-Message-State: AOJu0YyoTs3Ic1hhB+h8RARo/PGyDQUigDvJh/sHKGHCtrEyUjBjXT08
	qGf9kGZdERJmg+Is1xz9drGO1n7+MplD9gOcp8DEqI6Wep8128/nsIArmpQsQUhr
X-Gm-Gg: ATEYQzyUssFsfGOCOfmzUdUZe3UT/VRitfiD2VyWbS2FchHHui0Rs4EMG26/NQhfBet
	qNHGM+SbSr4gow933Ke8DEpelENB3+NrGXkABZMlwumNuj4S6Puf6po6hQpTeACPCmOyO77CIq5
	NeKVkmbPzUmQ73FFORN/tgeTxnSlOeymM0ME6VECsRsoqDznMNCENZc3xo8buhbR/wfuUXq41/2
	4qw00een5S5mFLEY7tYzEeqlPu4EeZGV7JNsoP0TE2uBsWBRYZ/0SMwbeFkwTz5bQQa2IIHngOz
	ygU4ZuwCJyRdfrKpyya55gt+jQFYciODXBjifqgllR9ZccPRkYq82PKfUVNqjCuc1AfZfp3dDMb
	C6WAT0r6CgrTwanHHG1sP8UcRxbMm6IQrlajUF8I94ixKdqTGAxrZQh9NVWUlrgeQgK6o3Vp1L8
	YUC/7/+CML0EwJklTMGWxohUuz4oRppPnkO9Eeb2fOuw==
X-Received: by 2002:a05:600c:3486:b0:480:3a72:524a with SMTP id 5b1f17b1804b1-483c9bed89emr237248255e9.19.1772452798746;
        Mon, 02 Mar 2026 03:59:58 -0800 (PST)
Received: from localhost.localdomain ([90.167.55.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd75df9fsm475345415e9.13.2026.03.02.03.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 03:59:58 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Navaneeth K <knavaneeth786@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix operator spacing in rtw_ieee80211.c
Date: Mon,  2 Mar 2026 12:54:44 +0100
Message-ID: <20260302115501.31596-2-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing spaces around binary and ternary operators to improve
readability. Also adjust line wrapping and indentation to align
continuations consistently.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 .../staging/rtl8723bs/core/rtw_ieee80211.c    | 89 ++++++++++---------
 1 file changed, 48 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 6cf217e21593..ba7b8ef78b4c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -187,19 +187,19 @@ u8 *rtw_get_ie_ex(u8 *in_ie, uint in_len, u8 eid, u8 *oui, u8 oui_len, u8 *ie, u
 	cnt = 0;
 
 	while (cnt < in_len) {
-		if (eid == in_ie[cnt]
-			&& (!oui || !memcmp(&in_ie[cnt+2], oui, oui_len))) {
+		if (eid == in_ie[cnt] &&
+		    (!oui || !memcmp(&in_ie[cnt + 2], oui, oui_len))) {
 			target_ie = &in_ie[cnt];
 
 			if (ie)
-				memcpy(ie, &in_ie[cnt], in_ie[cnt+1]+2);
+				memcpy(ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
 
 			if (ielen)
-				*ielen = in_ie[cnt+1]+2;
+				*ielen = in_ie[cnt + 1] + 2;
 
 			break;
 		}
-		cnt += in_ie[cnt+1]+2; /* goto next */
+		cnt += in_ie[cnt + 1] + 2; /* goto next */
 	}
 
 	return target_ie;
@@ -450,8 +450,8 @@ int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwis
 		return _FAIL;
 	}
 
-	if ((*wpa_ie != WLAN_EID_VENDOR_SPECIFIC) || (*(wpa_ie+1) != (u8)(wpa_ie_len - 2)) ||
-	   (memcmp(wpa_ie+2, RTW_WPA_OUI_TYPE, WPA_SELECTOR_LEN))) {
+	if ((*wpa_ie != WLAN_EID_VENDOR_SPECIFIC) || (*(wpa_ie + 1) != (u8)(wpa_ie_len - 2)) ||
+	    (memcmp(wpa_ie + 2, RTW_WPA_OUI_TYPE, WPA_SELECTOR_LEN))) {
 		return _FAIL;
 	}
 
@@ -513,7 +513,7 @@ int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwi
 		return _FAIL;
 	}
 
-	if ((*rsn_ie != WLAN_EID_RSN) || (*(rsn_ie+1) != (u8)(rsn_ie_len - 2)))
+	if ((*rsn_ie != WLAN_EID_RSN) || (*(rsn_ie + 1) != (u8)(rsn_ie_len - 2)))
 		return _FAIL;
 
 	pos = rsn_ie;
@@ -581,17 +581,18 @@ int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
 		authmode = in_ie[cnt];
 
 		/* if (authmode == WLAN_EID_BSS_AC_ACCESS_DELAY) */
-		if (authmode == WLAN_EID_BSS_AC_ACCESS_DELAY && (!memcmp(&in_ie[cnt+6], wapi_oui1, 4) ||
-					!memcmp(&in_ie[cnt+6], wapi_oui2, 4))) {
+		if (authmode == WLAN_EID_BSS_AC_ACCESS_DELAY &&
+		    (!memcmp(&in_ie[cnt + 6], wapi_oui1, 4) ||
+		     !memcmp(&in_ie[cnt + 6], wapi_oui2, 4))) {
 			if (wapi_ie)
-				memcpy(wapi_ie, &in_ie[cnt], in_ie[cnt+1]+2);
+				memcpy(wapi_ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
 
 			if (wapi_len)
-				*wapi_len = in_ie[cnt+1]+2;
+				*wapi_len = in_ie[cnt + 1] + 2;
 
-			cnt += in_ie[cnt+1]+2;  /* get next */
+			cnt += in_ie[cnt + 1] + 2;  /* get next */
 		} else {
-			cnt += in_ie[cnt+1]+2;   /* get next */
+			cnt += in_ie[cnt + 1] + 2;   /* get next */
 		}
 	}
 
@@ -614,9 +615,10 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
 	while (cnt < in_len) {
 		authmode = in_ie[cnt];
 
-		if ((authmode == WLAN_EID_VENDOR_SPECIFIC) && (!memcmp(&in_ie[cnt+2], &wpa_oui[0], 4))) {
+		if ((authmode == WLAN_EID_VENDOR_SPECIFIC) &&
+		    (!memcmp(&in_ie[cnt + 2], &wpa_oui[0], 4))) {
 			if (wpa_ie)
-				memcpy(wpa_ie, &in_ie[cnt], in_ie[cnt+1]+2);
+				memcpy(wpa_ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
 
 			*wpa_len = in_ie[cnt + 1] + 2;
 			cnt += in_ie[cnt + 1] + 2;  /* get next */
@@ -625,10 +627,10 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
 				if (rsn_ie)
 					memcpy(rsn_ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
 
-				*rsn_len = in_ie[cnt+1]+2;
-				cnt += in_ie[cnt+1]+2;  /* get next */
+				*rsn_len = in_ie[cnt + 1] + 2;
+				cnt += in_ie[cnt + 1] + 2;  /* get next */
 			} else {
-				cnt += in_ie[cnt+1]+2;   /* get next */
+				cnt += in_ie[cnt + 1] + 2;   /* get next */
 			}
 		}
 	}
@@ -660,20 +662,20 @@ u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen)
 	while (cnt < in_len) {
 		eid = in_ie[cnt];
 
-		if ((eid == WLAN_EID_VENDOR_SPECIFIC) && (!memcmp(&in_ie[cnt+2], wps_oui, 4))) {
+		if ((eid == WLAN_EID_VENDOR_SPECIFIC) && (!memcmp(&in_ie[cnt + 2], wps_oui, 4))) {
 			wpsie_ptr = &in_ie[cnt];
 
 			if (wps_ie)
-				memcpy(wps_ie, &in_ie[cnt], in_ie[cnt+1]+2);
+				memcpy(wps_ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
 
 			if (wps_ielen)
-				*wps_ielen = in_ie[cnt+1]+2;
+				*wps_ielen = in_ie[cnt + 1] + 2;
 
-			cnt += in_ie[cnt+1]+2;
+			cnt += in_ie[cnt + 1] + 2;
 
 			break;
 		}
-		cnt += in_ie[cnt+1]+2; /* goto next */
+		cnt += in_ie[cnt + 1] + 2; /* goto next */
 	}
 
 	return wpsie_ptr;
@@ -751,12 +753,12 @@ u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8
 
 	if (attr_ptr && attr_len) {
 		if (buf_content)
-			memcpy(buf_content, attr_ptr+4, attr_len-4);
+			memcpy(buf_content, attr_ptr + 4, attr_len - 4);
 
 		if (len_content)
-			*len_content = attr_len-4;
+			*len_content = attr_len - 4;
 
-		return attr_ptr+4;
+		return attr_ptr + 4;
 	}
 
 	return NULL;
@@ -1007,20 +1009,25 @@ static int rtw_get_cipher_info(struct wlan_network *pnetwork)
 	int group_cipher = 0, pairwise_cipher = 0, is8021x = 0;
 	int ret = _FAIL;
 
-	pbuf = rtw_get_wpa_ie(&pnetwork->network.ies[12], &wpa_ielen, pnetwork->network.ie_length-12);
+	pbuf = rtw_get_wpa_ie(&pnetwork->network.ies[12], &wpa_ielen,
+			      pnetwork->network.ie_length - 12);
 
 	if (pbuf && (wpa_ielen > 0)) {
-		if (rtw_parse_wpa_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is8021x) == _SUCCESS) {
+		if (rtw_parse_wpa_ie(pbuf, wpa_ielen + 2, &group_cipher,
+				     &pairwise_cipher, &is8021x) == _SUCCESS) {
 			pnetwork->bcn_info.pairwise_cipher = pairwise_cipher;
 			pnetwork->bcn_info.group_cipher = group_cipher;
 			pnetwork->bcn_info.is_8021x = is8021x;
 			ret = _SUCCESS;
 		}
 	} else {
-		pbuf = rtw_get_wpa2_ie(&pnetwork->network.ies[12], &wpa_ielen, pnetwork->network.ie_length-12);
+		pbuf = rtw_get_wpa2_ie(&pnetwork->network.ies[12], &wpa_ielen,
+				       pnetwork->network.ie_length - 12);
 
 		if (pbuf && (wpa_ielen > 0)) {
-			if (rtw_parse_wpa2_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is8021x) == _SUCCESS) {
+			if (rtw_parse_wpa2_ie(pbuf, wpa_ielen + 2,
+					      &group_cipher, &pairwise_cipher,
+					      &is8021x) == _SUCCESS) {
 				pnetwork->bcn_info.pairwise_cipher = pairwise_cipher;
 				pnetwork->bcn_info.group_cipher = group_cipher;
 				pnetwork->bcn_info.is_8021x = is8021x;
@@ -1089,21 +1096,21 @@ u16 rtw_mcs_rate(u8 bw_40MHz, u8 short_GI, unsigned char *MCS_rate)
 	u16 max_rate = 0;
 
 	if (MCS_rate[0] & BIT(7))
-		max_rate = (bw_40MHz) ? ((short_GI)?1500:1350):((short_GI)?722:650);
+		max_rate = (bw_40MHz) ? ((short_GI) ? 1500 : 1350) : ((short_GI) ? 722 : 650);
 	else if (MCS_rate[0] & BIT(6))
-		max_rate = (bw_40MHz) ? ((short_GI)?1350:1215):((short_GI)?650:585);
+		max_rate = (bw_40MHz) ? ((short_GI) ? 1350 : 1215) : ((short_GI) ? 650 : 585);
 	else if (MCS_rate[0] & BIT(5))
-		max_rate = (bw_40MHz) ? ((short_GI)?1200:1080):((short_GI)?578:520);
+		max_rate = (bw_40MHz) ? ((short_GI) ? 1200 : 1080) : ((short_GI) ? 578 : 520);
 	else if (MCS_rate[0] & BIT(4))
-		max_rate = (bw_40MHz) ? ((short_GI)?900:810):((short_GI)?433:390);
+		max_rate = (bw_40MHz) ? ((short_GI) ? 900 : 810) : ((short_GI) ? 433 : 390);
 	else if (MCS_rate[0] & BIT(3))
-		max_rate = (bw_40MHz) ? ((short_GI)?600:540):((short_GI)?289:260);
+		max_rate = (bw_40MHz) ? ((short_GI) ? 600 : 540) : ((short_GI) ? 289 : 260);
 	else if (MCS_rate[0] & BIT(2))
-		max_rate = (bw_40MHz) ? ((short_GI)?450:405):((short_GI)?217:195);
+		max_rate = (bw_40MHz) ? ((short_GI) ? 450 : 405) : ((short_GI) ? 217 : 195);
 	else if (MCS_rate[0] & BIT(1))
-		max_rate = (bw_40MHz) ? ((short_GI)?300:270):((short_GI)?144:130);
+		max_rate = (bw_40MHz) ? ((short_GI) ? 300 : 270) : ((short_GI) ? 144 : 130);
 	else if (MCS_rate[0] & BIT(0))
-		max_rate = (bw_40MHz) ? ((short_GI)?150:135):((short_GI)?72:65);
+		max_rate = (bw_40MHz) ? ((short_GI) ? 150 : 135) : ((short_GI) ? 72 : 65);
 
 	return max_rate;
 }
@@ -1117,8 +1124,8 @@ int rtw_action_frame_parse(const u8 *frame, u32 frame_len, u8 *category, u8 *act
 
 	fc = le16_to_cpu(((struct ieee80211_hdr_3addr *)frame)->frame_control);
 
-	if ((fc & (IEEE80211_FCTL_FTYPE|IEEE80211_FCTL_STYPE))
-		!= (IEEE80211_FTYPE_MGMT|IEEE80211_STYPE_ACTION)
+	if ((fc & (IEEE80211_FCTL_FTYPE | IEEE80211_FCTL_STYPE))
+		!= (IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_ACTION)
 	) {
 		return false;
 	}
-- 
2.53.0

