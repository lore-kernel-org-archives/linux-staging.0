Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AB02C326E
	for <linux-staging@lists.linux.dev>; Mon, 11 Aug 2025 06:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754893381; cv=none; b=pvH/vkIgHDOUkDaLEy84OYtYJAaN2yaH3zKU02DzZdUCEqIV0yb8slqqiwFCF1GhAtRVVfbevUF4bFMEL0XYOYz/WREtsrGOgLh0daofuysP0nbOuQjFPB+tuxZs+S84ngnxt2gVUjyHjejr8Mvq/znY6Ub0IBjrL27ygOTETFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754893381; c=relaxed/simple;
	bh=AnaxUoK9gzxsFCBQgNja68/bicu3TmEoaEFFVMIYvJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IVLGJQ8h/2HObRAy8gV6S+QcXnbv5pYmuT4sXsIqtKVaL0mcE5Ebt+pHL9aDS2WJ1zJs1ojpTOrnPXrO+JTcPqsftTbDUGJRpvEgH1de6WRN50UhEYBJXSMuyECpplpGnj7c+Sxo5lAkMsZO4iv52auqCkh2aSqdDONh7xqv0Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQu3Xjbt; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQu3Xjbt"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76bde897110so3088707b3a.3
        for <linux-staging@lists.linux.dev>; Sun, 10 Aug 2025 23:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754893379; x=1755498179; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4h/8L43+V+oJvbDoQBPDW4FdKdpW4NfBoaQD3n9AqY=;
        b=DQu3XjbtFlj7SG0Lz6BymlRBZYlWboEszyxSmzN7IerTUgkjwRwFvxiEo7klc32c5f
         5wTiRFQxniJSxwlPQuRWAPisFN93HIxqKirEXqtjfcU5cnTOjjyzrJ3xHo0tKBHFmfxV
         6U2xqnF95LC7eurtbxbvA3EkA89jQE2rivIMiBYCTgidg6EwnbyALeu6+H/sHG9vWq9K
         Ltg8Hd6B3YeNZ3mYm64F16W5Yro4lPU5T4RrPxdWI1wKC0XjSueltCCLv8mFl1ga28nI
         cfgcUmNvKP7z5dWXm8BpYFE1lwjAJ03Pl2aD5nxdtuOnL4xe2kVidkWw4NRi90BlcHzD
         Yn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754893379; x=1755498179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X4h/8L43+V+oJvbDoQBPDW4FdKdpW4NfBoaQD3n9AqY=;
        b=GyQWeoyp1cSMUGqFFh4/zNKtV5pDuqSQfAC/fhryf0M6h8/G2Udaxf9UjnyiWrRoG5
         7gV6TDRG5jE0rg5802hkMmAfbX+9+gxGy41H2374fRAyOe3AOIwuOeX3Ei2O99QJIkqz
         HToC+ZmQP+3xmIEXUTv73nnMocTRXCjoTY9eRUR2di3XrxiV2m2W3oO6SIrStOf2S3DL
         Up865kivmE360Nmmj1h5VBEP33yo5VAMCuUoNGGwcbhlCJbVhQa9xuaaIGKrhV4/VOup
         fmlMTYGrIhh0q3mpZGMV+nYmt4Ua6OoEr6BwaUM2yyJ6Gdll0P6+ClQs00FhKWaYwu9M
         mHgQ==
X-Gm-Message-State: AOJu0YyshXd19Y+Dvz1GkWjy30UUmvQqCKC1zG7hQu1XP1VvQbXYCK3t
	L6870KCc5pxkfnh4nRohwWIvWlaoPIZ9oZ8w1LA94ZvBOYe4JXiljWge
X-Gm-Gg: ASbGncsIXZfGQVlHP+H/lGIQcK6XgTzaFikruz0IEKeX/UzpFcVOWzh9G9fLS0xNIYy
	er/Gc/1/BQOkiANZIFIJsXpql61Kx6ZKBTYb8qjf2bLVIQMjo+LXASloBGh4WcMvGZWP6NDtvGy
	WA26z07t+CHNDBsdZ8oDbY7jAngUBoCqB7qQ5C8A6s9dGtOdvruEB9WBlC1mcZlh6ypZvND0dXc
	r+bxjMkX41hlXnzYTt8Q5z4cVNVC3MLHO5kyQOJ6geU/2zEEh3D9cbxD1lVLiz5keyJchUEH0Kt
	uGTCRDK9UlGMbPCz0cFTWjgaLFgQOCP041uUfbQZTfbW60h/TBNuMENWdjgeXHezT8jW7Dkf4aD
	X18isw5ccfc+Q5zx7fO8jIx+xeRyjns1Y8YFm/oA6b26EXcdJxkLE/V7fE7Ka3Qx54ARostr57u
	qRNCtKWd+ACfAB2LaI2KCz7EIWAPvP0Qjz+qPbjv4ud5kpSMfmLz8=
X-Google-Smtp-Source: AGHT+IGZP3EUDv+evXSYZZ3v78r9tqVXonXmWXGdIhoU5USQNOsuGY2MlOzBJviOy2jzJKFjvFd20A==
X-Received: by 2002:a05:6a20:6305:b0:240:1ad8:1821 with SMTP id adf61e73a8af0-240550b7a59mr12227298637.19.1754893379325;
        Sun, 10 Aug 2025 23:22:59 -0700 (PDT)
Received: from wen-HP-ProBook-445-14-inch-G9-Notebook-PC.. (36-239-105-221.dynamic-ip.hinet.net. [36.239.105.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f800sm25861623b3a.42.2025.08.10.23.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 23:22:58 -0700 (PDT)
From: Yao-Wen Chang <changyaowen19980629@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yao-Wen Chang <changyaowen19980629@gmail.com>
Subject: [PATCH 05/11] staging: rtl8723bs: Rmove unnecessary parentheses around the statement
Date: Mon, 11 Aug 2025 14:21:28 +0800
Message-ID: <20250811062132.102525-5-changyaowen19980629@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811062132.102525-1-changyaowen19980629@gmail.com>
References: <20250811062132.102525-1-changyaowen19980629@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit removes the unnecessary parentheses around the statement.
This change will not modify the logic of the code.

Signed-off-by: Yao-Wen Chang <changyaowen19980629@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 28 ++++++++++++-------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 0bbbf62a7097..919581965015 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -514,12 +514,12 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
 
 		/*  B0 Config LDPC Coding Capability */
 		if (TEST_FLAG(phtpriv_ap->ldpc_cap, LDPC_HT_ENABLE_TX) &&
-		    GET_HT_CAPABILITY_ELE_LDPC_CAP((u8 *)(&phtpriv_sta->ht_cap)))
+		    GET_HT_CAPABILITY_ELE_LDPC_CAP((u8 *)&phtpriv_sta->ht_cap))
 			SET_FLAG(cur_ldpc_cap, (LDPC_HT_ENABLE_TX | LDPC_HT_CAP_TX));
 
 		/*  B7 B8 B9 Config STBC setting */
 		if (TEST_FLAG(phtpriv_ap->stbc_cap, STBC_HT_ENABLE_TX) &&
-		    GET_HT_CAPABILITY_ELE_RX_STBC((u8 *)(&phtpriv_sta->ht_cap)))
+		    GET_HT_CAPABILITY_ELE_RX_STBC((u8 *)&phtpriv_sta->ht_cap))
 			SET_FLAG(cur_stbc_cap, (STBC_HT_ENABLE_TX | STBC_HT_CAP_TX));
 	} else {
 		phtpriv_sta->ampdu_enable = false;
@@ -575,11 +575,11 @@ static void update_ap_info(struct adapter *padapter, struct sta_info *psta)
 		/* phtpriv_ap->ampdu_enable = phtpriv_ap->ampdu_enable; */
 
 		/* check if sta support s Short GI 20M */
-		if ((phtpriv_ap->ht_cap.cap_info) & cpu_to_le16(IEEE80211_HT_CAP_SGI_20))
+		if (phtpriv_ap->ht_cap.cap_info & cpu_to_le16(IEEE80211_HT_CAP_SGI_20))
 			phtpriv_ap->sgi_20m = true;
 
 		/* check if sta support s Short GI 40M */
-		if ((phtpriv_ap->ht_cap.cap_info) & cpu_to_le16(IEEE80211_HT_CAP_SGI_40))
+		if (phtpriv_ap->ht_cap.cap_info & cpu_to_le16(IEEE80211_HT_CAP_SGI_40))
 			phtpriv_ap->sgi_40m = true;
 
 		psta->qos_option = true;
@@ -849,8 +849,8 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	p = rtw_get_ie(ie + _BEACON_IE_OFFSET_,
 		WLAN_EID_SSID,
 		&ie_len,
-		(pbss_network->ie_length - _BEACON_IE_OFFSET_)
-	);
+		       pbss_network->ie_length - _BEACON_IE_OFFSET_);
+
 	if (p && ie_len > 0) {
 		memset(&pbss_network->ssid, 0, sizeof(struct ndis_802_11_ssid));
 		memcpy(pbss_network->ssid.ssid, (p + 2), ie_len);
@@ -1667,8 +1667,8 @@ void bss_cap_update_on_sta_join(struct adapter *padapter, struct sta_info *psta)
 
 			pmlmepriv->num_sta_no_short_preamble++;
 
-			if ((pmlmeext->cur_wireless_mode > WIRELESS_11B) &&
-			    (pmlmepriv->num_sta_no_short_preamble == 1)) {
+			if (pmlmeext->cur_wireless_mode > WIRELESS_11B &&
+			    pmlmepriv->num_sta_no_short_preamble == 1) {
 				beacon_updated = true;
 				update_beacon(padapter, 0xFF, NULL, true);
 			}
@@ -1679,8 +1679,8 @@ void bss_cap_update_on_sta_join(struct adapter *padapter, struct sta_info *psta)
 
 			pmlmepriv->num_sta_no_short_preamble--;
 
-			if ((pmlmeext->cur_wireless_mode > WIRELESS_11B) &&
-			    (pmlmepriv->num_sta_no_short_preamble == 0)) {
+			if (pmlmeext->cur_wireless_mode > WIRELESS_11B &&
+			    pmlmepriv->num_sta_no_short_preamble == 0) {
 				beacon_updated = true;
 				update_beacon(padapter, 0xFF, NULL, true);
 			}
@@ -1717,8 +1717,8 @@ void bss_cap_update_on_sta_join(struct adapter *padapter, struct sta_info *psta)
 
 			pmlmepriv->num_sta_no_short_slot_time++;
 
-			if ((pmlmeext->cur_wireless_mode > WIRELESS_11B) &&
-			    (pmlmepriv->num_sta_no_short_slot_time == 1)) {
+			if (pmlmeext->cur_wireless_mode > WIRELESS_11B &&
+			    pmlmepriv->num_sta_no_short_slot_time == 1) {
 				beacon_updated = true;
 				update_beacon(padapter, 0xFF, NULL, true);
 			}
@@ -1729,8 +1729,8 @@ void bss_cap_update_on_sta_join(struct adapter *padapter, struct sta_info *psta)
 
 			pmlmepriv->num_sta_no_short_slot_time--;
 
-			if ((pmlmeext->cur_wireless_mode > WIRELESS_11B) &&
-			    (pmlmepriv->num_sta_no_short_slot_time == 0)) {
+			if (pmlmeext->cur_wireless_mode > WIRELESS_11B &&
+			    pmlmepriv->num_sta_no_short_slot_time == 0) {
 				beacon_updated = true;
 				update_beacon(padapter, 0xFF, NULL, true);
 			}
-- 
2.43.0

