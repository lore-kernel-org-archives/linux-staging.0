Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CFC2877CF
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 17:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771694887; cv=none; b=Yu0udlnbhAPc+CKNPqLQhvmchTlXXCE0RwNhZ6J8VEAGZe1QIOiNLHugah7l5U9h6bHIrZ/FRUGZPFWnnE8iN+rmw3eq873MYpG21mJABtMgODjkA97JNTU+Nd2r5qyRO1NEG08ahz2lvZQ0u7BMLkIVwoh3BjL8mWynhRTf7lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771694887; c=relaxed/simple;
	bh=vmW/VYqYfDBv5kVhsDJtoLg9wLnMLLyLHdEpnIOcirM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r0CcsEf7zBMTh4W57VgnQBgOmKpadGVDJo63Xhw4D5VD40SyOBAaBAn8Pz3hg1hUETz14O7dzALNxvNZIW2nciOTnStvmLWXcDpCbsWkZiHOdDtFwkLchqwusEtWb42Xuzly3JsY6IQdohCvDolwIANuHyxkvQxZv0P55XfqVbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WYw2xM51; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYw2xM51"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-78fc4425b6bso27461027b3.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 09:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771694885; x=1772299685; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXUREJgFKzc8p2Qz2JqJ7OldOJmpncPFALJ4MK98A7Q=;
        b=WYw2xM51YmESSuVyO6N9ZniIXBWgR6yRHRluyZBDRO8VS2t6pgKNkMWLqnhOExHy+q
         WTIrTNKmpSUwN8jt0iaW2PyVAoCcdDHo0rKzORAzWDbo/5BvMM9SG9uLNedR3Tf4q60O
         CHttTBvlrRurOAGlv0VjJuKzWE3htmx2wLp23m/AIWwVaQFtyQyAfht0BWQUdu1kuH/N
         XNnqZaea86/qSQK3P75p3WJlShcPgj4wc++3eFFZQmsw7wFcq1jdbNeG1Pgb3cEwXW2u
         fV0iLwvNRJPE7Af7gN9WshjPW/wLRl/jRsNk+u5RDScn1WJ3keNvxITWxeDlWmYawoey
         FBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771694885; x=1772299685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HXUREJgFKzc8p2Qz2JqJ7OldOJmpncPFALJ4MK98A7Q=;
        b=cfSg8uq8ERCESvq6/xrjMsDHRUcPEaeJFKH40/XK6d+IZtLI6e+Z5d9LSamS8DMvYX
         +msIsx+jEA/My9ipgHZch7rDTqIh7zZPgHLaaCqYrCtw+OMar8e+5LqJWITI4c8++6rx
         vTAtgEb1PNhzpp45iGsSBQ2UADosqCeVVOF7pgOPPoIzv6bfIRKNiapqJSiJ2aZmqS95
         UhvgYJJuFX1ljb1A99/zcYm8bk8FDEIVmzVdu7v6eKu+0Dx0ae/aplBltq2YmgLVCwR6
         lMkWcA3xsjmAg5Lmq/z9tM6S2fwqAZn/lwaMNi5OqFR9H46uDKG2syvX6Z0RmvczR672
         0fLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAHg8kSlLOFuKEnAEoQMc+iwDo++eXV/N8FaJcb4xZGobFMUa5JFQSKpT4IMMUOwEciJTOQDU8Ez7MTqLc@lists.linux.dev
X-Gm-Message-State: AOJu0YzHIxuwxyITgjBvIwNf45AsRFmw+fhH5Q5JsDkPu1lJODQILoNG
	qds8mOaR1e+/kskjUM1/D7gMMt6zEIlguNN9ROvp4bJYOGn0S8ZkdASU
X-Gm-Gg: AZuq6aIGXejncUUINvL1WkPH81vSkfPNuQGj+Kz0rWjc14hv117YLeopdnZDYnwadfU
	vPvi0Ior6qY8GXiJcQ4fa9KEkI/HUtPvVBZiP+5sRLT3rEciKCoVwkcSCdIUURchVwDM526ljDQ
	LhDTKgq+MGz1y9ofklj8+BnbL6HJy5oBK9BQ5SwDtQl0r13B36EtYOFNPkQVPZhyPBhyL9VLvY7
	NXglQZSvvcyPOKHZlNIUMtEflm+IkkTai8JbT6Lj6LkggvdGjM5Jo65LdOoJHiQvUALOSkEJa7K
	g2a5CfAaDwa02pCADZnkd3esy9H7gte4gbv+bpvYLYsxRuT5yF19zrH0pRSuGJnn/+FDpvgyE8Z
	fz4Ylb+5wFRSONOehjGOGr0908fYFY/rDmG3R2+iuAPtZgJtojKka9uWFUhYBegsHhYjNEqoT68
	GDdKdkJsbb1DBKWLF/JZd2SA==
X-Received: by 2002:a05:690c:4b84:b0:794:c969:6fff with SMTP id 00721157ae682-79829172bd8mr34193767b3.57.1771694884894;
        Sat, 21 Feb 2026 09:28:04 -0800 (PST)
Received: from archlinux ([93.186.111.52])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7982ddce590sm11457247b3.41.2026.02.21.09.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 09:28:04 -0800 (PST)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ethantidmore06@gmail.com,
	linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: fix spaces around binary operators
Date: Sat, 21 Feb 2026 20:24:00 +0300
Message-ID: <20260221172751.52329-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260218113229.9171-1-nikolayof23@gmail.com>
References: <20260218113229.9171-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing spaces and fix line length to comply with kernel coding
style.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---

Changes in v3:
	- fix checkpatch.pl warnings about line lengths and logical
	  continuations

Changes in v2:
	- add spaces between numbers in ternary operators

 .../staging/rtl8723bs/core/rtw_ieee80211.c    | 88 ++++++++++---------
 1 file changed, 47 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 6cf217e21593..1477460aabcd 100644
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
@@ -450,10 +450,10 @@ int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwis
 		return _FAIL;
 	}
 
-	if ((*wpa_ie != WLAN_EID_VENDOR_SPECIFIC) || (*(wpa_ie+1) != (u8)(wpa_ie_len - 2)) ||
-	   (memcmp(wpa_ie+2, RTW_WPA_OUI_TYPE, WPA_SELECTOR_LEN))) {
+	if ((*wpa_ie != WLAN_EID_VENDOR_SPECIFIC) ||
+	    (*(wpa_ie + 1) != (u8)(wpa_ie_len - 2)) ||
+	    (memcmp(wpa_ie + 2, RTW_WPA_OUI_TYPE, WPA_SELECTOR_LEN)))
 		return _FAIL;
-	}
 
 	pos = wpa_ie;
 
@@ -513,7 +513,7 @@ int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwi
 		return _FAIL;
 	}
 
-	if ((*rsn_ie != WLAN_EID_RSN) || (*(rsn_ie+1) != (u8)(rsn_ie_len - 2)))
+	if ((*rsn_ie != WLAN_EID_RSN) || (*(rsn_ie + 1) != (u8)(rsn_ie_len - 2)))
 		return _FAIL;
 
 	pos = rsn_ie;
@@ -580,18 +580,18 @@ int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
 	while (cnt < in_len) {
 		authmode = in_ie[cnt];
 
-		/* if (authmode == WLAN_EID_BSS_AC_ACCESS_DELAY) */
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
 
@@ -614,9 +614,10 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
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
@@ -625,10 +626,10 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
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
@@ -660,20 +661,20 @@ u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen)
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
@@ -751,12 +752,12 @@ u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8
 
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
@@ -1007,20 +1008,25 @@ static int rtw_get_cipher_info(struct wlan_network *pnetwork)
 	int group_cipher = 0, pairwise_cipher = 0, is8021x = 0;
 	int ret = _FAIL;
 
-	pbuf = rtw_get_wpa_ie(&pnetwork->network.ies[12], &wpa_ielen, pnetwork->network.ie_length-12);
+	pbuf = rtw_get_wpa_ie(&pnetwork->network.ies[12],
+			      &wpa_ielen,
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
+			if (rtw_parse_wpa2_ie(pbuf, wpa_ielen + 2, &group_cipher,
+					      &pairwise_cipher, &is8021x) == _SUCCESS) {
 				pnetwork->bcn_info.pairwise_cipher = pairwise_cipher;
 				pnetwork->bcn_info.group_cipher = group_cipher;
 				pnetwork->bcn_info.is_8021x = is8021x;
@@ -1089,21 +1095,21 @@ u16 rtw_mcs_rate(u8 bw_40MHz, u8 short_GI, unsigned char *MCS_rate)
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
-- 
2.53.0

