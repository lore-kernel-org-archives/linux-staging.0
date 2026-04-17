Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455AB36E468
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 06:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776406352; cv=none; b=oXaifNfy0XCT0hYqWCcgc9De9h5pie0GrQpppM6EjucTwN9PnWT34zonI5lzFKuEVIggp4G08UdAL17SbeN1AGE0ix3aZj702jtAfyuEfi5VY9nEjRatLSHBC4CWbEfcPlKj4nEDry7TnlqlrWmcc/PJmYk3+xjXKF18Boci+SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776406352; c=relaxed/simple;
	bh=383DPhuBRF2QD41DluR/ZrbwJ45uuKmVigIRiLoVWL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ml1YrYYObBrhLABT9GshD5lgDddnWR8Aw0Ihqzf1IbkF21S/9HEPRhF8NUnjniKzF8FIowlyBSTVpLonNoUJuIYsD/Z4NcJhEvVoe8jfJdFWhyJK3Ap0ZVvxixc1DqylubyFw2eDlk8G3c89UlirVf4utz1wH2RC+d2wt7rwEpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqHjomNB; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqHjomNB"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-94ac7f22d23so53170241.3
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 23:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776406349; x=1777011149; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SwebIuwdOWzOTm6KMf4wXBgHNPaHunXqUFUotpGec4=;
        b=QqHjomNBa9aqrDWRZOKY6XvGWgcG5jB+hBGtV23S9f8e55/IMTtbgGRO6IziEKFEBS
         740I7tvTCzXIO7ZgmZZhpUgkFzcvOjLqowqPxc7kQxloDmiBvquHVd+zKOVZsbnG0PsR
         aqcDHoQMC6dL05IBYnhL9VqIDG6uLdOTl0jVuoUxr2dyWOsWlM6qdzx1CRsiGkTxPMvj
         6Vd9BDOUypAQzQi10xECa0jZkqsIi+ebg5PXEyv6H3Zb9c+fXrTOxNYk/3Duvwij6bLJ
         6wF+4BbdY8pi6NL9YOznldXjufUZxhaigDpVAgQ0bT5C3fw39cfr05glqo0FsPsEGgO2
         mjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776406349; x=1777011149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9SwebIuwdOWzOTm6KMf4wXBgHNPaHunXqUFUotpGec4=;
        b=Ybx0mNFS/ekRqICeTliXAXe71sfzGZG7IOAQTE8IKK+6/uYob0IkojsIo/6XlY66Tc
         w5yYb8lJXjJeXB8D4AmwpueZNhyHT7g0MRzvyufagX9noj1+JUfnV+39mk14OwgjKpsm
         PDIPQVq2UO/6PRvT4rBES3xeQsYmA9lpvRcqyClBpMKAOJ8u+NllKk2lzv3wL0yxxqll
         MZs+xCSBtkkHLv+PjdN2UeA8TpphkOUc00JQ/l8DZWH4z/mo4Kt1Zy8Reyu5BHWoog/X
         2zv6Vu5dSa2EspW/jCYtfzETSMyCd/XRsviFv6Ll8GUIy7JPL8OcdN07QshX/VGVD0Fv
         Al4g==
X-Forwarded-Encrypted: i=1; AFNElJ+Qa3PqQvyOX/E5CjdcZB1lH/xuEKpMz/RzEgtLwF06cQGvzVBqr3ruJs5dpA71qO1/GPlShCdiobgCEyME@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/D8Epn1aO+lKmIimOmHjJ4RzrPqT1Ci+CPbc+COdmcxglFJY8
	E4xgHaLFMXUFZ+727nT0eCtEclN1qNz1nAIVnaAZkb93owvIcFaRz8yU
X-Gm-Gg: AeBDieuW63CjUQpwQ88EvsCh/AOqZMICVHxVYKMmBmd+NJpU+igDfMWwzlq70nJ7iXi
	f65VDtv2z0ZTunxQ1nsOIORWmNIwYdDL213rbbXW5K0GG9oMB8Cdq9jUNv7OoJpaGiSiPmeex4q
	1xC1jGjuGe/hqnbRpqRb0yK9VVEf/2wObbEJOlX7bAVHeN5P8XYpL9MHUx/e0DUJiBG9N3d+972
	NR8pdIH4P2yMMlJ6/5xz2ve14lCQ4d0xpRxC2LWFf7ZDh4+3rtTLRDEn8vWI1AkPiOaRduzzeCP
	wMA0v05cQooDDVjsBAyIw6L1m4JFHLf3JJSAsmTzlavegGBwsBX29eEsHRKSQMqK2jml691m5P4
	f1fvZSItaK2ujoiYZoD3hscBLuDXBsb871I+qZ8PtkPbkmhP8bQwGbnMpWfjvYoBeVQtYg7RTwt
	6sd20vfBAFeex1tTuPcrUTg5unKGpHc4gt/OchZPKjW2gBJaOzAKqnKZny3jh5tUM=
X-Received: by 2002:a05:6102:2ad3:b0:605:b96a:a0d4 with SMTP id ada2fe7eead31-616f8fdbdbdmr504002137.27.1776406349142;
        Thu, 16 Apr 2026 23:12:29 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.124])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9589093a8bbsm297947241.3.2026.04.16.23.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 23:12:28 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	luka.gejak@linux.dev,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>
Subject: [PATCH v6 4/5] staging: rtl8723bs: fix out-of-bounds reads in IE parsing functions
Date: Fri, 17 Apr 2026 07:10:47 +0100
Message-ID: <20260417061048.62484-5-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417061048.62484-1-delenetchior1@gmail.com>
References: <20260417061048.62484-1-delenetchior1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_get_wapi_ie(), rtw_get_sec_ie() and rtw_get_wps_ie() walk a
buffer of Information Elements using the TLV length field without
first verifying that the length byte itself is inside the buffer,
and without verifying that the specific bytes dereferenced by the
subsequent memcmp() calls fit inside the declared element.

An attacker within WiFi radio range can exploit this by sending
crafted beacon or probe-response frames carrying truncated or
oversized IEs. No authentication is required.

Ensure the length byte is inside the buffer (cnt + 1 < in_len),
break out of the loop if the declared element length would read
past in_len, and before each memcmp() verify that the offsets it
touches are inside the buffer: cnt + 10 for the WAPI OUI compared
at offset 6, and cnt + 6 for the WPA/WPS OUIs compared at offset 2.

Found by reviewing bounds checks in IE walkers.
Not tested on hardware.

Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
---
v6: unchanged.
v5: add an inner bound check before each memcmp() so that
    the OUI read at offset 6 (WAPI) or offset 2 (WPA/WPS)
    stays inside the declared element (Dan Carpenter).
v4: add Fixes: tag and Cc: stable (Dan Carpenter).
v3: rebased on staging-next; sent as numbered series with
    proper Cc from get_maintainer.pl.
v2: rebased on staging-next (v1 was based on v7.0-rc6 and
    did not apply).

 .../staging/rtl8723bs/core/rtw_ieee80211.c    | 70 +++++++++++++------
 1 file changed, 47 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 72b7f731dd471..1b61879acb48e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -582,18 +582,25 @@ int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
 
 	cnt = (_TIMESTAMP_ + _BEACON_ITERVAL_ + _CAPABILITY_);
 
-	while (cnt < in_len) {
+	while (cnt + 1 < in_len) {
 		authmode = in_ie[cnt];
 
-		if (authmode == WLAN_EID_BSS_AC_ACCESS_DELAY &&
-		    (!memcmp(&in_ie[cnt + 6], wapi_oui1, 4) ||
-		     !memcmp(&in_ie[cnt + 6], wapi_oui2, 4))) {
-			if (wapi_ie)
-				memcpy(wapi_ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
+		if (cnt + 2 + in_ie[cnt + 1] > in_len)
+			break;
+
+		if (authmode == WLAN_EID_BSS_AC_ACCESS_DELAY) {
+			if (cnt + 10 > in_len)
+				break;
 
-			if (wapi_len)
-				*wapi_len = in_ie[cnt + 1] + 2;
+			if (!memcmp(&in_ie[cnt + 6], wapi_oui1, 4) ||
+			    !memcmp(&in_ie[cnt + 6], wapi_oui2, 4)) {
+				if (wapi_ie)
+					memcpy(wapi_ie, &in_ie[cnt],
+					       in_ie[cnt + 1] + 2);
 
+				if (wapi_len)
+					*wapi_len = in_ie[cnt + 1] + 2;
+			}
 		}
 
 		cnt += in_ie[cnt + 1] + 2;   /* get next */
@@ -615,15 +622,23 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
 
 	cnt = (_TIMESTAMP_ + _BEACON_ITERVAL_ + _CAPABILITY_);
 
-	while (cnt < in_len) {
+	while (cnt + 1 < in_len) {
 		authmode = in_ie[cnt];
 
-		if ((authmode == WLAN_EID_VENDOR_SPECIFIC) &&
-		    (!memcmp(&in_ie[cnt + 2], &wpa_oui[0], 4))) {
-			if (wpa_ie)
-				memcpy(wpa_ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
+		if (cnt + 2 + in_ie[cnt + 1] > in_len)
+			break;
+
+		if (authmode == WLAN_EID_VENDOR_SPECIFIC) {
+			if (cnt + 6 > in_len)
+				break;
+
+			if (!memcmp(&in_ie[cnt + 2], &wpa_oui[0], 4)) {
+				if (wpa_ie)
+					memcpy(wpa_ie, &in_ie[cnt],
+					       in_ie[cnt + 1] + 2);
 
-			*wpa_len = in_ie[cnt + 1] + 2;
+				*wpa_len = in_ie[cnt + 1] + 2;
+			}
 		} else if (authmode == WLAN_EID_RSN) {
 			if (rsn_ie)
 				memcpy(rsn_ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
@@ -658,21 +673,30 @@ u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen)
 
 	cnt = 0;
 
-	while (cnt < in_len) {
+	while (cnt + 1 < in_len) {
 		eid = in_ie[cnt];
 
-		if ((eid == WLAN_EID_VENDOR_SPECIFIC) && (!memcmp(&in_ie[cnt + 2], wps_oui, 4))) {
-			wpsie_ptr = &in_ie[cnt];
+		if (cnt + 2 + in_ie[cnt + 1] > in_len)
+			break;
 
-			if (wps_ie)
-				memcpy(wps_ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
+		if (eid == WLAN_EID_VENDOR_SPECIFIC) {
+			if (cnt + 6 > in_len)
+				break;
 
-			if (wps_ielen)
-				*wps_ielen = in_ie[cnt + 1] + 2;
+			if (!memcmp(&in_ie[cnt + 2], wps_oui, 4)) {
+				wpsie_ptr = &in_ie[cnt];
 
-			cnt += in_ie[cnt + 1] + 2;
+				if (wps_ie)
+					memcpy(wps_ie, &in_ie[cnt],
+					       in_ie[cnt + 1] + 2);
 
-			break;
+				if (wps_ielen)
+					*wps_ielen = in_ie[cnt + 1] + 2;
+
+				cnt += in_ie[cnt + 1] + 2;
+
+				break;
+			}
 		}
 		cnt += in_ie[cnt + 1] + 2; /* goto next */
 	}
-- 
2.43.0

