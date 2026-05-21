Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3241822E3E9
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 13:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368649; cv=none; b=Zy5AyW1zMjq4QocCUm2RqmF9Mad8OLtgDiOPIh19WWEUYsdgBT1xvnHZjdeG6Y+og+CR36e1gCq/QWuqFHilClAKHsU8uE5iGAkbmf7KYOR4u3YEHjYKKwb0lYbWWVA5Qwxu3i0Caw/XECnQPdfQO31D6UKOe8Ji2VNGrkc88u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368649; c=relaxed/simple;
	bh=Y/az4SiItbIAigjIqxrH/7l1AsFAjEqLedDBBPQ3Rrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qtO7hkE/aPASIC1Wk/QjynOSQvVB32TQXzx6UG+SxxdgbftREDQ3XzD9/eqJ7GbTVqfNvqetvi6MxuZl4k68lsvPKUMBR5JQkPpNnUX80BXE0DJcQwqEDeA43krLyFDdKSytioj2krEajIbtVvrHpX74O4zhG9AyMkzXgbUB6Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rX4U6vaE; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rX4U6vaE"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bdce61897ebso7608166b.2
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 06:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779368647; x=1779973447; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7XmRtRI1sy+uE3kBDpqO1yIxY6jN1aO/VOWIPFqnmA=;
        b=rX4U6vaEljD0hQ4M7Dl5fDVE+AfmB7dToWtarT7r/mXNtT6Ld4hclHJwg3ggp7RI5D
         kB08beoHvikQuRXEwig3+EnucDBznTMM1XI6A32d1OK4SDWyF4RtlJQ2eeCPZpYvbzA6
         +LVBYxyxpTOXQ7Ez5FBNaKral8lUlFUIxkWL79T1Q6glR7osIMlHSQ+Lu245tMo8zId9
         lbWPztTDMKPyZJhey2/SO75YmSYkGHNcdIPIBMnNSZtXmUCUWsSrc01lfGWtz9nBtW2i
         keXaHf0lYUCvee0F+AyBLGJqW/2KzHuYu5x5W+JnhTuJGrEv4UWM1+U/V0zSsK4eTMn6
         w4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368647; x=1779973447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M7XmRtRI1sy+uE3kBDpqO1yIxY6jN1aO/VOWIPFqnmA=;
        b=qqDxNaAADWp4gFwR9Ozglca4DEeMYVQhODt6xguLxR31bsIP6sbaas22TfaE1ItIuN
         0mFw3CGuF2yQHt6xVtgqVEbm2unUFL8laMbfPgnIPK9ldJRUkAPuf5R9chM3FwEdcJrk
         eu0XuXSun17qu8Nro+C9mojJdbbvqAnrvYjC0zsNdY7sUVxm55Hp+3iti3+VSs2tT6cH
         yxAMlZuTlfcB2CllgPQarce7U03p9PtYVCMT0KsFyD8Z3RjOn3ggQqflxbh/Zl3bGv8b
         y5/lS+60vpCchSyaplIPVzyeXUbaunhi7rjHIillCGWGXSlaC/4RKq+grJzlbW/XNGGp
         G8Qw==
X-Gm-Message-State: AOJu0YyIFrAAhsYs4asNiTEPgMHh/wv3BxxG8THy4YKc8kVpLkzitWo0
	hGMuU/Z4C6kRjmnRo1BhrVT/37YuEOBGdt3NtGAR/xIZLyQZgDDkqIhZ
X-Gm-Gg: Acq92OFefIrCRR0JllwdylvhN9iEoqMSomAWRa+8gWutZ799lCptVYpK03Fi1lnwm1i
	Fx/I7sLrGI5ukQFGHq0CO4NB7Zj9F5R0M1QXbI8PTTW9dGAz0JpAM1FBet4A7cM0Tuz0LwbTgCU
	LNhnwl3/OfXeLLXTjlEcmEdSpLbUayYYJWNZGUziE1ljzDgPb8Oc2gXVHVb7K50C+y9U4Xo6YcY
	t7qwV/PuS/4aAbmZXDqpxTj0y4DpaFb8Vy2CIPOm7fdxt00q3sGLSue7AUlp/dIdaSAkeOTGvUW
	YtjgACS0+gXW7gQx1vFN59GBccMbtZEvBbIWia5T05QLeFIYApWSpFn0SHSDXXT6XchgQxPui8s
	+XY3eLqV8zlCEohQzzxbmgX1UXrOdzR0vYNXVtAuIm94FDWPu6oAvY4hrH5uQuwvLWXbSTwPe4a
	2i8VjDfLSMCO+sEml8EcH5WOJwW/BLnJDfrnKQjpbuw5v3TtZjGGgJdXvsEvmgKH4NxPfj7p/LB
	10Qhk+Oauxv1OeQubfSE/Cgo9WSo+/mjeCz3bcWdlbPlq32cJN0yrEESyOCM5p+UvwCKPP4FQrl
	CvJCLd5J+syXSvSIWbhnP27FeIv610QSMDG1JfM=
X-Received: by 2002:a17:907:b19:b0:bae:456f:fbb2 with SMTP id a640c23a62f3a-bdc14b5e8a3mr106428166b.23.1779368646487;
        Thu, 21 May 2026 06:04:06 -0700 (PDT)
Received: from ahossu.localdomain (ip-217-105-56-94.ip.prioritytelecom.net. [217.105.56.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8a505905sm43766266b.37.2026.05.21.06.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:04:06 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	stable@vger.kernel.org,
	hossu.alexandru@gmail.com
Subject: [PATCH v6 7/7] staging: rtl8723bs: fix OOB reads in rtw_get_sec_ie(), rtw_get_wapi_ie(), and rtw_get_wps_attr()
Date: Thu, 21 May 2026 15:03:30 +0200
Message-ID: <20260521130330.754181-8-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521130330.754181-1-hossu.alexandru@gmail.com>
References: <20260521130330.754181-1-hossu.alexandru@gmail.com>
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

