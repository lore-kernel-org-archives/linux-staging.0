Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B531B4223
	for <linux-staging@lists.linux.dev>; Sat,  4 Apr 2026 22:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775341927; cv=none; b=a+EfnbGH1uiYzQ5goXe9lA2AyxG27ic7rQH3U0DXCk//Q4BNa7VCh6Q5GPkskjSNgZ8bwhFX7a7QPzsgmkDfh0HvPyD9wTrgOyhXQRGu/VnYv86aqQgSC0VqyxmOCJ8CPbA/aSvdOZGTNyiasA0HpNPMuoC8Fi2xKai+zgiQ/5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775341927; c=relaxed/simple;
	bh=ZFOY+U8fUTrYq9I+LJFqUKM/5/KC4WNw5rgtdpRO39E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IPQ9/L0vh4r3yKi9Esnd+b1DOIkry4nOx9mncQsr+Z1Bw2vua1GflmNwkszF9egLgzVQro7mkRu+/vNh4cEvio2xNrPfXmiEpGqctR4oVoMiuUGXvKO7eAYv4lOYe2tO0RkGaI51CN7MPco8KNOMUfnJsbsBTzRYVgBUtxj/KLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MA2ia8ft; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MA2ia8ft"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56a9a7e762bso2179724e0c.3
        for <linux-staging@lists.linux.dev>; Sat, 04 Apr 2026 15:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775341925; x=1775946725; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s7M/wb5ZE+bi0m58cYsS3oHIi0wg7WyajZ80sRcwVHU=;
        b=MA2ia8ftzPBsuPRz8GrwHf1Y2LR15sMdG8jCKSqtfr/8nMZNCFIF+hllv7CTGqe6b9
         mEwdZa85LW/8TqcfyIS/pzmhfUf4tDzndFD3Oci480LstSFeJpOh/1y+OQbvqTLRtKaB
         vAFAemfvAARKOIltY3jfBKgjxAKHlL2QSVz9QGzL+hmUINyQM7tn3mEQoeZwKo2Q4QzL
         RAGFjtFzAJeaARk85q2MCQMBlvbEPOdgeBwzrUdxWI2raSP5eUOl+agt/Oc6y1Y9UzS8
         TcQZnOMqtXCTzPsm4zsQK4i7hE5EOEoZ1/SCWGNnqzUJdxaSSuYqht6PoekE5MXAmrOI
         szsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775341925; x=1775946725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7M/wb5ZE+bi0m58cYsS3oHIi0wg7WyajZ80sRcwVHU=;
        b=YoPodPzZcAWKqi4AFu9NqdRfAR65VYy88txoczrJPJeABzMHivon67Yf0fTRlxDqak
         +a1J+KYqVTNMqCggreHyxrAM0J2wxEn9pQpHrmPsjxwUkBxDsLB1DyenD0hrfL3Y27Ci
         8C9fj44eWYlsOTZM6EoOA7mw6jsLWrAjiJiO8z2nGQR75mHSH/+eusKwAztFvVvzkWBF
         ZRPaPZXVrr6ZW1FD3O8ZxBSBwg526mVka4h/hLkO8UrdUA3b5IO1SRs2c4P2uJ7Y2N5k
         nfFsfZc7vwAoBdq/lsILD874DlBl7k4JIjiViDmMZn0G8fNltrHi3UoU/g3XqnAmMBtb
         lxIA==
X-Gm-Message-State: AOJu0Yzm+SUNU5yTd8AWDQneODEd9YSZdeElv+qFHIig0RXHBB/OsP9D
	YcxaS6nogUIQvzNuQtVgb4ea82ReUnv8dwYcIBY0k1QEJc6vJVGVTq3W
X-Gm-Gg: AeBDievn0tRqNDNYAbyoNh6OJLxFBZUWz8G9WwGU/HxZSY2E55VO5gBFU0F5iu2N1e+
	6MmlQedTn8yMa4fBSxINI5MWPaUcs+EDP1ETtIhsHscBqSHx9JQKPs446/wtiDX0223o4YirqXs
	rPJCcCSkHcFW072+TSKi2WM8B2CIojTBmnC7aUaa67GHqNVi0hT4cbQXyWTAhGcQU/ZxExWzAiV
	8r2Ym9yMquKQ0TeeKSn2Fa2hMSm3GkrOx05MHH/P5r6KPdwXdZV09nFpglTUVXCx33zmJi4fooR
	mlp6Ik6DSXQZ5Fgo4CY5+BDLHdVb12ORTBVTRkMayY29bK1rsB4XFBDnKrp6SUO5GMYffI7pIY5
	QH6FJGeuTOTlm2pnfwgPNV2Xn25dYaJ3CeQCTOQs+beXZQs7IF2ykrZNClViqCYiYLOciTwueWk
	FmhueRAV0OyYSZItyhabm46FDhrA66DZxhXLmw5Y52
X-Received: by 2002:a05:6102:801a:b0:600:106f:5fa8 with SMTP id ada2fe7eead31-605a4e0b2f6mr2965878137.15.1775341925479;
        Sat, 04 Apr 2026 15:32:05 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.15])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582e1d1edsm11631603137.1.2026.04.04.15.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 15:32:05 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix out-of-bounds reads in IE parsing functions
Date: Sat,  4 Apr 2026 23:31:44 +0100
Message-ID: <20260404223144.59168-1-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IE parsing loops in rtw_get_wapi_ie(), rtw_get_sec_ie(), and
rtw_get_wps_ie() check only that the element ID byte is within bounds
(cnt < in_len), but then immediately access the length byte at
in_ie[cnt+1] and data bytes at in_ie[cnt+2] and beyond without
verifying that these offsets are within the buffer.

A malicious access point can send beacon or probe response frames with
truncated Information Elements, triggering out-of-bounds reads on
kernel heap memory. No authentication is required.

Add two bounds checks to each function:
 - Ensure at least 2 bytes remain for the IE header (cnt + 1 < in_len)
 - Validate the full IE fits in the buffer before accessing its data
   (cnt + 2 + ie_len <= in_len)

Cc: stable@vger.kernel.org
Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 3e2b5e6b0..0c1138b90 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -582,9 +582,12 @@ int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
 
 	cnt = (_TIMESTAMP_ + _BEACON_ITERVAL_ + _CAPABILITY_);
 
-	while (cnt < in_len) {
+	while (cnt + 1 < in_len) {
 		authmode = in_ie[cnt];
 
+		if (cnt + 2 + in_ie[cnt + 1] > in_len)
+			break;
+
 		/* if (authmode == WLAN_EID_BSS_AC_ACCESS_DELAY) */
 		if (authmode == WLAN_EID_BSS_AC_ACCESS_DELAY && (!memcmp(&in_ie[cnt+6], wapi_oui1, 4) ||
 					!memcmp(&in_ie[cnt+6], wapi_oui2, 4))) {
@@ -616,9 +619,12 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
 
 	cnt = (_TIMESTAMP_ + _BEACON_ITERVAL_ + _CAPABILITY_);
 
-	while (cnt < in_len) {
+	while (cnt + 1 < in_len) {
 		authmode = in_ie[cnt];
 
+		if (cnt + 2 + in_ie[cnt + 1] > in_len)
+			break;
+
 		if ((authmode == WLAN_EID_VENDOR_SPECIFIC) && (!memcmp(&in_ie[cnt+2], &wpa_oui[0], 4))) {
 			if (wpa_ie)
 				memcpy(wpa_ie, &in_ie[cnt], in_ie[cnt+1]+2);
@@ -662,9 +668,12 @@ u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen)
 
 	cnt = 0;
 
-	while (cnt < in_len) {
+	while (cnt + 1 < in_len) {
 		eid = in_ie[cnt];
 
+		if (cnt + 2 + in_ie[cnt + 1] > in_len)
+			break;
+
 		if ((eid == WLAN_EID_VENDOR_SPECIFIC) && (!memcmp(&in_ie[cnt+2], wps_oui, 4))) {
 			wpsie_ptr = &in_ie[cnt];
 
-- 
2.43.0

