Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A859033ADBF
	for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 17:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771521351; cv=none; b=qmCWxtE/RlDjIljzynQu5YPx4hIfI3bhYsBDv65lldX6nq51ZHmlFzMW58qmOML5IwFDhHyh9JMLkqfhzbxZoH5Ucjb3HJR6LIMdE9agyDB0ODyM1xmAsB4aUVIo3PqXvznW41BwYlGlpTqcezfNRZfSxKwHPBIqTYQTlkXI9tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771521351; c=relaxed/simple;
	bh=c8qsJ1V0bT+qw2XjGCmleG+VDRz+YrKwJvIHhct3AZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GaNqYlgougXx67KyUeOiQ1SXvY3A0nymamJaEzWGdsgoc36KaxoFGRICsm0Xr1bYgLsC0ytFuu1tBZ5K55ODerxdH7gVekadcNFjywcPXw1BlslcDXWMhzNttLFSCnFqLiYBovEtytmGHg3A8Lwi9Jqtk08x5kpkCsQD1lc4voc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kgaCUxQ2; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kgaCUxQ2"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7962119ff2bso11336627b3.3
        for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 09:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771521348; x=1772126148; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCfXuvPfgIIwmEVo1FAoRmXPdRnWpPJ30k+JGwSvcPQ=;
        b=kgaCUxQ2dqFUDGP+kvWRha3yV0St8eiZQEEnKhfxMmn1VgDEAWCH7fcXp7q2XvlpsR
         fGlD1uIg1wlpgbeg2hmpfvL3IjNY5pzfEpTR5RC9okrWP0zX0iQR046b6UaJvkpyDzi6
         Kiz22buZp6GrTSFnXIZhWOnVNcooyfjAsYmqACEs7dTLXLZG2crlzubFxIR4sRhmcifE
         BrYYkbOg54PCH6v81FGVATY17QqvTBVjJp80A2RCJBf0S5IShwBgvkYyEJkz/cjSp42w
         /hDCQ0v9/Hn2uN0Qdlo0p6qhEfhx2lr/aA3WGvLFh1OYLo6UTdqwZtCW9JQWI18GCB2I
         ms3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771521348; x=1772126148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zCfXuvPfgIIwmEVo1FAoRmXPdRnWpPJ30k+JGwSvcPQ=;
        b=f94KisTwgj4x8MMs9IVjsAomRdd/BRGQ1M28pFB/MpPLkcJGQi76Cyn7A9IWNVmv2m
         3ZXjedT3LSAD35wgDpWN/ZzslRoML2x7K0a1tGiKOo4OU7Tk3jg8auuHvJrMTKUkO2sR
         dOD+dipex3EJGaiRAdk8WabuCvP5HEzMIbqh6xHel+VGc4+P8XlwZf2d63VILMax/KcL
         t5GupCyFxZvDNkQF6N4hMsTdsEB0B566vV5bJHsjA0MgzegqUvkmv9P1prIl8bglT/01
         MU0unVFa2ZOlvTTAnVzdL98lfBkAz9E5awVMLYTdcPK9kWa/+GVGFP4Xh3mLJJhXut+g
         +fuw==
X-Forwarded-Encrypted: i=1; AJvYcCUKMYAxDnYPY/BxOWY+L94zLQSrlFUDow1vdN1ze2bbyMEa+PoV+oiUsr+CUtojGNevkbhCnLDaSCaa0g8U@lists.linux.dev
X-Gm-Message-State: AOJu0YziZTmMtMwzhNBYJ7B9YHOFTvttKwsp+ZeAEmSjT9jjAI+rDJoi
	x13RqkEf+61g3owAjJr/dnuvYFJxgPz8GQ+zygppoK+KVn/PY8VVVLaQ
X-Gm-Gg: AZuq6aJ0eOmwPs/lhT2/EMmisgzSaj6qkAQuRksDsnagYH63eETI5BlSgGIh0ULwcmS
	rdrvHS8VsPLLhDPmwc23qDo7VnnWeqAJxkdHajxbFlaQw1tjOp3vhgCFWh3KV8dHr5gQYCs4kcG
	V0xH1vEkho57JApzcplozXBXSFWst32iiMwm+XYN3LQ9+XGCvcq4fFKHkZ1eINOjBrQWoP+MD8r
	xkqfwXIn2dpU8CF6F6HRKw49cOjzWPwxUXs5cvdosdx2f4jngdIPbOLAl27i4IH9IalZh2fAKSd
	LDYKVwYkbNedRpTarKezxRXb+oB11ilDd5LXAOp/PgFkfAkRVr0bw14Kg0GPh8Bjz5qVneSB2dX
	CuY2PCHnkxfDJIYN627h8HJvyeIOr6SEOhIt3hvAOanKD+wrIMjE7TaW6V4yVidcrn5iA1TTAEr
	0pm4mkpAZzGkN0q5cpmQ9kIvTuZsj/exOk
X-Received: by 2002:a05:690e:d4f:b0:649:b943:2cc6 with SMTP id 956f58d0204a3-64c21b25f4bmr13487404d50.52.1771521348418;
        Thu, 19 Feb 2026 09:15:48 -0800 (PST)
Received: from archlinux ([93.186.111.52])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64c22f875b7sm7474339d50.13.2026.02.19.09.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 09:15:47 -0800 (PST)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ethantidmore06@gmail.com,
	linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: fix spaces around binary operators
Date: Thu, 19 Feb 2026 20:14:11 +0300
Message-ID: <20260219171434.4756-1-nikolayof23@gmail.com>
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

Add missing spaces to comply with kernel coding style.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---

Changes in v2:
	- add spaces between numbers in ternary operators

 .../staging/rtl8723bs/core/rtw_ieee80211.c    | 76 +++++++++----------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 6cf217e21593..690edd01e490 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -188,18 +188,18 @@ u8 *rtw_get_ie_ex(u8 *in_ie, uint in_len, u8 eid, u8 *oui, u8 oui_len, u8 *ie, u
 
 	while (cnt < in_len) {
 		if (eid == in_ie[cnt]
-			&& (!oui || !memcmp(&in_ie[cnt+2], oui, oui_len))) {
+			&& (!oui || !memcmp(&in_ie[cnt + 2], oui, oui_len))) {
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
+	   (memcmp(wpa_ie + 2, RTW_WPA_OUI_TYPE, WPA_SELECTOR_LEN))) {
 		return _FAIL;
 	}
 
@@ -513,7 +513,7 @@ int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwi
 		return _FAIL;
 	}
 
-	if ((*rsn_ie != WLAN_EID_RSN) || (*(rsn_ie+1) != (u8)(rsn_ie_len - 2)))
+	if ((*rsn_ie != WLAN_EID_RSN) || (*(rsn_ie + 1) != (u8)(rsn_ie_len - 2)))
 		return _FAIL;
 
 	pos = rsn_ie;
@@ -581,17 +581,17 @@ int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
 		authmode = in_ie[cnt];
 
 		/* if (authmode == WLAN_EID_BSS_AC_ACCESS_DELAY) */
-		if (authmode == WLAN_EID_BSS_AC_ACCESS_DELAY && (!memcmp(&in_ie[cnt+6], wapi_oui1, 4) ||
-					!memcmp(&in_ie[cnt+6], wapi_oui2, 4))) {
+		if (authmode == WLAN_EID_BSS_AC_ACCESS_DELAY && (!memcmp(&in_ie[cnt + 6], wapi_oui1, 4) ||
+					!memcmp(&in_ie[cnt + 6], wapi_oui2, 4))) {
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
 
@@ -614,9 +614,9 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
 	while (cnt < in_len) {
 		authmode = in_ie[cnt];
 
-		if ((authmode == WLAN_EID_VENDOR_SPECIFIC) && (!memcmp(&in_ie[cnt+2], &wpa_oui[0], 4))) {
+		if ((authmode == WLAN_EID_VENDOR_SPECIFIC) && (!memcmp(&in_ie[cnt + 2], &wpa_oui[0], 4))) {
 			if (wpa_ie)
-				memcpy(wpa_ie, &in_ie[cnt], in_ie[cnt+1]+2);
+				memcpy(wpa_ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
 
 			*wpa_len = in_ie[cnt + 1] + 2;
 			cnt += in_ie[cnt + 1] + 2;  /* get next */
@@ -625,10 +625,10 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
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
@@ -660,20 +660,20 @@ u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen)
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
@@ -751,12 +751,12 @@ u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8
 
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
@@ -1007,20 +1007,20 @@ static int rtw_get_cipher_info(struct wlan_network *pnetwork)
 	int group_cipher = 0, pairwise_cipher = 0, is8021x = 0;
 	int ret = _FAIL;
 
-	pbuf = rtw_get_wpa_ie(&pnetwork->network.ies[12], &wpa_ielen, pnetwork->network.ie_length-12);
+	pbuf = rtw_get_wpa_ie(&pnetwork->network.ies[12], &wpa_ielen, pnetwork->network.ie_length - 12);
 
 	if (pbuf && (wpa_ielen > 0)) {
-		if (rtw_parse_wpa_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is8021x) == _SUCCESS) {
+		if (rtw_parse_wpa_ie(pbuf, wpa_ielen + 2, &group_cipher, &pairwise_cipher, &is8021x) == _SUCCESS) {
 			pnetwork->bcn_info.pairwise_cipher = pairwise_cipher;
 			pnetwork->bcn_info.group_cipher = group_cipher;
 			pnetwork->bcn_info.is_8021x = is8021x;
 			ret = _SUCCESS;
 		}
 	} else {
-		pbuf = rtw_get_wpa2_ie(&pnetwork->network.ies[12], &wpa_ielen, pnetwork->network.ie_length-12);
+		pbuf = rtw_get_wpa2_ie(&pnetwork->network.ies[12], &wpa_ielen, pnetwork->network.ie_length - 12);
 
 		if (pbuf && (wpa_ielen > 0)) {
-			if (rtw_parse_wpa2_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is8021x) == _SUCCESS) {
+			if (rtw_parse_wpa2_ie(pbuf, wpa_ielen + 2, &group_cipher, &pairwise_cipher, &is8021x) == _SUCCESS) {
 				pnetwork->bcn_info.pairwise_cipher = pairwise_cipher;
 				pnetwork->bcn_info.group_cipher = group_cipher;
 				pnetwork->bcn_info.is_8021x = is8021x;
@@ -1089,21 +1089,21 @@ u16 rtw_mcs_rate(u8 bw_40MHz, u8 short_GI, unsigned char *MCS_rate)
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

