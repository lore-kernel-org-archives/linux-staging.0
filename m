Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9F834EEE3
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 03:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776394987; cv=none; b=shEjNAm0i+gY4yAqSeLXEzq8j7kddOgnheH4OsYd/JNsvD0fYVThW3twUPBs7xVVyJgay+KKuHD4cI6B1sPxervqWS1yhIlhV+NEpXEqQ2s2xRpmVy1tuFEMdAMncR+X5d0U5y0/sBxOVWnjGqfqu7AoB5dyXDBRgjyqA8/TN8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776394987; c=relaxed/simple;
	bh=tJMT7+DrVL8F21RA6G4NVXKLEUtt++LIxE74yyak3A0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eCfSBpuh2Zn3MyP0jHUuJUGG9h1HgTA2QJTsvQffQRJoQTvE8zu5PpsTuCK+hW64FqBDAml4GKkGhs0+7/cZRvu+2NNKrPIoj+cT1XyU83W1FLAFCHiYnThE8NmxYjvXiG34h5fYj7WH2KVeEJLA/fj7ynO1Sfs5/boYSRJn8zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djIfajeT; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djIfajeT"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56f75445470so152104e0c.2
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 20:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776394982; x=1776999782; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBxmxbvKHEUkAZ0NAG9KhKLPqXshWJk8Q9pRuQVQFJs=;
        b=djIfajeTR44D/ilaGLz1FJiRFLw+Zs/2TI1r7v04aJFIq8r+VeQiPeWPBn9hbJ2oOs
         /1FlwxMxNGjLShARXE69WxGkzbU4GbGPq4RyLKKbg6SkI41j8KRGWlhavduUMQq2eYVi
         trQCiCrli2rRTSS+QW2u9cFppbYOyIhIO1S1A4UOMt+9HX/uC89stJB5BzaWyQO1khdf
         I5E+UKc20zZKZZq0HdnGaYQb2V/Tf1MJQV5ehtWFX8+CFwsZ+0LIFeYHMg1yAn8YS+NT
         XVNGrvAZ0ZPcFZ701a0Rz1R6zdOlpb0lgGBug0rLK+G5wmjnHS49Rcx2LvxJmjiHMTsf
         b3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776394982; x=1776999782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QBxmxbvKHEUkAZ0NAG9KhKLPqXshWJk8Q9pRuQVQFJs=;
        b=TSzJmy3euPImWFA/+IIt2xDMefWt/SLFbNAJY3wVvl1rsTNyUiGeQenT19XzjcxHEA
         zXi8TRVktiPRsSEbEf6qRhyrY2JI44mvfOIIP2JLW8IQeHp0TmaoTcujVmXnnopB4r4O
         A3CLgdnwYYtA+ds5tOl2DRwBzlPQGyGoUtVMmy/t4qfgOo36oA9qXO8T1vqwr6shR+8z
         LG/UpK/UzmWMLAKWUZzOaRfVAjj6rxoUjucJPmQ8QCyN+WCW7zWtvfkBllFSN5tEUIy6
         Obe0YAxlm566+kkInQyZGc2aqdVzGIPMXjudltx8P4P/UAJ2hakzGCcYUcrYQnut5wSa
         bqhA==
X-Forwarded-Encrypted: i=1; AFNElJ+jfVFo/hocMg4oOZoHEPlbOC/rHeKyVAxtgVXd1vZkx3tQNFRJC3ZMlAH8f7tZQArBoeLSIaPbzdZi1qto@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ2O5b34H0x8TMfVVjU3iRawRiuQI7lHgVNlSttTYe3q8e37AO
	buSkTYZ0wmDAnY5yipnfzpHgOjr2UFNe52QVoev7qdwL8E0QA9hwkS9F
X-Gm-Gg: AeBDievYc4fVPlB4cdzIolWOCjQr7S9D9HF/yEVjClLfgbJSkNHqEPbNq7sADUXTMpp
	ZLCToPHGAnrJeOA6BeBv+KMjQJgsjAyxNMdYIVaiR6GyK+Iiq+NY23feOKL0Wj7Aop74U6xts6p
	Afcb/bxiQww9YBsmVK6xAP8Ggy23+suqowaWSpzROYxLu1O4ewbv5LcLX0l7LUkJzCM0oP4yvlN
	y1jbyP+rZjzQ3f7xF2DYf6TbSm6F7RbHVPQ2JSQbSNj3I43McQZFj/SPjVQna+DmjnsfBu2ZEQa
	qUhdRfUSZ02uBTg6DJdbSA5m4JP/B8po7uG/LKVo+uMgA4ScoFckmnbEwPjlTnnK7b05Zjq9Hsr
	oef2LUkW7M6CSG3NO6PjqiEJa54PWujAjv3ACusI+BljpOu7nrmeVxzNZUGn+Bigy7ZI3zpxkdk
	2b+nhxZv4LITcSgzqAMlg8rxRxq4ZUyX1OvWiJMNOxQKZYAAdNgs5k
X-Received: by 2002:a05:6122:c95:b0:56d:aa1f:e48a with SMTP id 71dfb90a1353d-56fa5a24eb7mr580372e0c.12.1776394982645;
        Thu, 16 Apr 2026 20:03:02 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.124])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa93275f4sm131275e0c.13.2026.04.16.20.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 20:03:01 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	luka.gejak@linux.dev,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>
Subject: [PATCH v5 4/5] staging: rtl8723bs: fix out-of-bounds reads in IE parsing functions
Date: Fri, 17 Apr 2026 04:01:09 +0100
Message-ID: <20260417030110.42991-5-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417030110.42991-1-delenetchior1@gmail.com>
References: <20260417030110.42991-1-delenetchior1@gmail.com>
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
v5: add an inner bound check before each memcmp() so that the
    OUI read at offset 6 (WAPI) or offset 2 (WPA/WPS) stays
    inside the declared element (Dan Carpenter).
v4: add Fixes: tag and Cc: stable (Dan Carpenter).
v3: rebased on staging-next; sent as numbered series with
    proper Cc from get_maintainer.pl.
v2: rebased on staging-next (v1 was based on v7.0-rc6 and did
    not apply).

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

