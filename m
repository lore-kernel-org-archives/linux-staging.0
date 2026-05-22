Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03942D0C94
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 00:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779410790; cv=none; b=LnytKpyddFXe0sEhsPBjmtkZpss4hiClyHM7fDNocxwvMm6r7UOwsB35+mHQK+v6wgZEeDQFOnEJ8btfXbwv7BnmQf0DeSZ+u68ypPe2fBN1wcRsOYxdlBOV4ILMKpZFmJQ1arftLlKlqhBUN1PAfW/o1IBbYBcXYtDsYjIbaNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779410790; c=relaxed/simple;
	bh=Y/az4SiItbIAigjIqxrH/7l1AsFAjEqLedDBBPQ3Rrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q1A6BRmLtkfMrEXYr/1FHdqY4LPkwooYyw9XjWiZSBeF81QQE9wgH0+2jnCCCrlI2/nJncljaPifQmvsenUYhxXxeYOe98gHUdso1z2y2FwLg8oPEkPQiGxzAwdxbYgErYVz89mc0CkQC5d05bWnISohQv5K5LyAefvBR2UrrRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddn5zWi0; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddn5zWi0"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6877c719cb0so3303734a12.2
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 17:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779410787; x=1780015587; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7XmRtRI1sy+uE3kBDpqO1yIxY6jN1aO/VOWIPFqnmA=;
        b=ddn5zWi0RfM2iWu6rAzERGuBfFR0UYXwIGFbekq2pOrkHKdLciI0tbiDClJhJg7mNu
         pDjdQwB1Uiw4HvcF9FJYHoZgPr9R/q16/KErQLJte/WEVr8TW9ti2vnssnSgofYoiUwT
         P0MxXFoYGtzpQ3DGculp8GMEWNXAXP3KNMPbA4VtTWptX9CjxdEI9VlRQSmI2CYh+qYR
         /9sFn+0GfXt69x0y/xRE2S6VBCC5dhhU+SRjnmaIGbW/NJuoYyNCvHSArQu9TOS7YR7a
         QAsPYRYPUH44UIOCGjRwE8fDlZT/3NIaI49rNSYuaQ2Ripa24+cXZyzpsODkcZhPqOZI
         +3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779410787; x=1780015587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M7XmRtRI1sy+uE3kBDpqO1yIxY6jN1aO/VOWIPFqnmA=;
        b=KQ7wXvyI0Z7UzA6P8oQMau97sBiknfhMGStOn+M8KQkkt5/qs5r2CIB+ItJfXOMxFV
         BdLcDIF/mtiEB86Tnm03DJyBhqt5n2aRtZB/cx/Xeal28OjvEEmM1D/S4MloPqxYgEqS
         EIbR68tpox1sGZlyyn50EmB0Es6GMHl6JWQNY7MyzqMGAJeY1eXXwaEYAFhdJenVoymn
         vmw1qncOb22GChQnZCpjxpPulZjlLKV5IuiFKNvnRXPQYWp67EtNgFg/iPjd9PPriUbV
         wnuVrPRXSIJ/VBmSH5u6SmpjtHSP///TM0Hv6MWEF9bkH7SdJD9lsWeRnQepwwfCrT5m
         X84g==
X-Gm-Message-State: AOJu0YwoTQwxpvR9McI91iWcy1TnpNChS8FOkMcLe3PCduOgUuWY9EVP
	aCnFAfcb7RncH50RpS4LzfSkDGt9B/OA5E4TOn4xL88bRTgFh7OcoCJe
X-Gm-Gg: Acq92OEYEPw5dHUG4vwmFT4/WIKxWbDNKw9ZaSuUCC2yD0Up3kAntk12TCI8UkjUr6b
	vq56/TrpqCuI4m0jqBenr22WzCdF/2c9BkiZO4pFFottJ3qMBv6Wg5bYHBaviJySOOIcR2NnkSg
	a/VzkgY2odzJ9u+z2XZY46UYWivlu4T38DGK+IjKqtGFt5+LrnwXuAJ/YBIC7SOBhxZeXQGG+UE
	VmUxypds4jdDrLMh/0q9PfV6ZsmLuCcRJ45PBgKl043hFQUbIUpFHE/oi4xYeeIcK4FsmWciavg
	UK/s//fEP2MvZAXAUld/Nt4u2rP3qw/xUdKakA9QlKLkS3uJefHabjJXgtQb2w2TO9KiiDaqqjW
	PPqT8Eky9A/I67SUE8P+Cz4hf3l+hJ9plRgI4NnAdE6Pxnv6GzMMRAY4biyWubUsm3U7sucXVU6
	/aJ7MaYsVZhVSyVl0mNulkDSAidWPt5vD0OnaCLYmfIXYmWxTApSzJ79G0SPvGtSfGW9+1tXJym
	B7/Yoo9jEj9rDZfVzrXOMNk747Mz1Efk3+TRshlErYTz732AoBmKHvUSG7EFQBWVOXHqX9BUPuM
	QANocRa9Ik8mi0zA28VJqKBg7qdS2oKfnP7p4nA=
X-Received: by 2002:a05:6402:d08:b0:678:a507:e837 with SMTP id 4fb4d7f45d1cf-6889c4080a8mr560571a12.1.1779410787257;
        Thu, 21 May 2026 17:46:27 -0700 (PDT)
Received: from ahossu.localdomain (ip-217-105-56-94.ip.prioritytelecom.net. [217.105.56.94])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b72cbbf3sm3535a12.0.2026.05.21.17.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 17:46:26 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	luka.gejak@linux.dev,
	Alexandru Hossu <hossu.alexandru@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v7 7/7] staging: rtl8723bs: fix OOB reads in rtw_get_sec_ie(), rtw_get_wapi_ie(), and rtw_get_wps_attr()
Date: Fri, 22 May 2026 02:45:31 +0200
Message-ID: <20260522004531.1038924-8-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522004531.1038924-1-hossu.alexandru@gmail.com>
References: <20260521130330.754181-1-hossu.alexandru@gmail.com>
 <20260522004531.1038924-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three IE/attribute parsing functions have missing bounds checks.

rtw_get_sec_ie() and rtw_get_wapi_ie() iterate over a raw IE buffer
without verifying that the header bytes (tag + length) are within the
remaining buffer before reading them.  Additionally, rtw_get_sec_ie()
compares the 4-byte WPA OUI at cnt+2 without checking that at least
6 bytes remain, and rtw_get_wapi_ie() compares a 4-byte WAPI OUI at
cnt+6 without checking that at least 10 bytes remain.

rtw_get_wps_attr() reads wps_ie[0] and wps_ie+2 unconditionally at
entry, before verifying that wps_ielen is large enough to contain
the 6-byte WPS IE header (element_id + length + 4-byte OUI).  Inside
the attribute loop, get_unaligned_be16() is called on attr_ptr and
attr_ptr+2 without checking that 4 bytes remain in the buffer.

Add a cnt+2 bounds check before each loop body in rtw_get_sec_ie()
and rtw_get_wapi_ie(), guard each multi-byte comparison with a minimum
IE length requirement, add a wps_ielen < 6 early return in
rtw_get_wps_attr(), and add a 4-byte bounds check in its inner loop.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 72b7f731dd47..3c1f0068cd92 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -583,9 +583,14 @@ int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
 	cnt = (_TIMESTAMP_ + _BEACON_ITERVAL_ + _CAPABILITY_);
 
 	while (cnt < in_len) {
+		if (cnt + 2 > in_len)
+			break;
+		if (cnt + 2 + in_ie[cnt + 1] > in_len)
+			break;
 		authmode = in_ie[cnt];
 
 		if (authmode == WLAN_EID_BSS_AC_ACCESS_DELAY &&
+		    in_ie[cnt + 1] >= 8 &&
 		    (!memcmp(&in_ie[cnt + 6], wapi_oui1, 4) ||
 		     !memcmp(&in_ie[cnt + 6], wapi_oui2, 4))) {
 			if (wapi_ie)
@@ -616,9 +621,14 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
 	cnt = (_TIMESTAMP_ + _BEACON_ITERVAL_ + _CAPABILITY_);
 
 	while (cnt < in_len) {
+		if (cnt + 2 > in_len)
+			break;
+		if (cnt + 2 + in_ie[cnt + 1] > in_len)
+			break;
 		authmode = in_ie[cnt];
 
 		if ((authmode == WLAN_EID_VENDOR_SPECIFIC) &&
+		    in_ie[cnt + 1] >= 4 &&
 		    (!memcmp(&in_ie[cnt + 2], &wpa_oui[0], 4))) {
 			if (wpa_ie)
 				memcpy(wpa_ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
@@ -699,6 +709,9 @@ u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_att
 	if (len_attr)
 		*len_attr = 0;
 
+	if (wps_ielen < 6)
+		return attr_ptr;
+
 	if ((wps_ie[0] != WLAN_EID_VENDOR_SPECIFIC) ||
 		(memcmp(wps_ie + 2, wps_oui, 4))) {
 		return attr_ptr;
@@ -709,6 +722,8 @@ u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_att
 
 	while (attr_ptr - wps_ie < wps_ielen) {
 		/*  4 = 2(Attribute ID) + 2(Length) */
+		if (attr_ptr + 4 > wps_ie + wps_ielen)
+			break;
 		u16 attr_id = get_unaligned_be16(attr_ptr);
 		u16 attr_data_len = get_unaligned_be16(attr_ptr + 2);
 		u16 attr_len = attr_data_len + 4;
-- 
2.54.0

