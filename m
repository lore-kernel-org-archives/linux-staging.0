Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA36413255
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 15:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774972420; cv=none; b=pKBVNLoDQdGsgjGkVZ3Z0Wwj5QtpfxdV0Wy4QxGx30kETms7KHpXTiFdTdzmajzs+4SkxE70zsTDLP06rfgUa1Zc0F9OWYARLNY4bzESF50iM0Ue9BvwXCDV4ZIYiC+HKiuKuK1JEZeJJJS9jZe/5gAFtRIjGZltqwvaP8m76Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774972420; c=relaxed/simple;
	bh=6WzrvMR4PQOtWYMzuK7jn4ymghlKGn4L09ExTZ2y9aA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IooqQmxXIJ/5lXkWrO1PMroFOnDT4hfG+v/XNwkoaGlEXRnKqSP7qH2O5bo++TYbFYaQMME5aDjIJcA7aYONLlcUbOadAq2NGJOpexWBPub2GxNySe8c4G5ajfH84T7FqGH9CFv96xtn+fj9j6t72kDXkvYNt6jvNYyVqZXJbHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFS1Ie9b; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFS1Ie9b"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-386b553c70eso47685871fa.0
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 08:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774972417; x=1775577217; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QyZxslmQhmTniMR3k/BCXzzigkI42PnVR8XFXphsXc=;
        b=PFS1Ie9b4CJZJ1vinbaXsQbUgHV4xzrOR4DpKxmFlUa50oYuu4GtI/NYteXpHtrFV0
         xwAP/DOzvVucpxt42Y+4PLNnIZJ0uIxAS7rDyF5HotKe4EKqyqdqppQhffZbNaz/iABJ
         9SHpNxbbCbxaq0yze/Av+JGDZN2f7XR5jgjUoJYkRZYZRAzQFiUIxDryfD8rmWQqd3XF
         XK8j8IlXFZeiBfO3D0U0hjWs8CpFMJUrwYixp1oSQi53L9btjASwpYIL+9L4gjJejo2Z
         j9aUWX8vnTB2hLyw055+l4wBXVa7fPuw3SBLnp0gIuB/QxA/Q3AP3fvq8a75blK/4iZT
         kmhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774972417; x=1775577217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/QyZxslmQhmTniMR3k/BCXzzigkI42PnVR8XFXphsXc=;
        b=qKl8jjNhj6kPOcZLw3oYRTkmBWRk0RIbYXnTsFcDWvdaqqwzGbudoPI6vrmM/mJAdY
         lh5kwSYqMCZiOeBiH02slYm4C7rUuzmwnWOHx8izuxVbToG3CqCEGccEU4YKcyEMhLFE
         S5eD5yjdQ5nTnP0oibt9a21qHrQzFZfGnBtghoJ3MUMklKTBZEHgw+QYq9WnScTjppYC
         qBMtZL8i79hSSOrMFwXaQPNr/Mf/gFsvPFv57YOv1IWId4vSX72R7YNR9sQXURYr4Q+p
         5y3EevG2hv9+WZjhnAu6hb1+7tKA61IwTIjrvNb4tf9cCzWJdjkejOBFGMASG93EuCwo
         ykYA==
X-Gm-Message-State: AOJu0YxcRa8W+ULjT4+WuQN+hENgsxYRCUYGOQi+/hkClbsG/9H//xE8
	jNHuLRue9Inf17fnIfdDHkvDbB+vzW2ZhG9Bak5eXMwVEPt2ds9f7EWR8BeDoKkB
X-Gm-Gg: ATEYQzwTmfUokCTLT4mjn66SdtAtsZb4vtrkU7lHXLaKH6/I8cXAIqROdFN07BAHxW9
	MfMa+l7xLRJVwSbvaUbh0qXeise1AVvshyGm0jJX87/d+LjJxdOy10vFpt5FhzGZQbwF4SQI5SP
	nJ5pww1Gz+1nYbPRZHfkzP2pEKlj5oJee9Oo5NcHW/PDHlmBCHCXEBIcyVq9kIkE3ydMy0HREx6
	cE0LDkONF7R6xHHNFYZRowoFzoKxBcoOWg1sGIHz4ZEQPKqBWcrwoQ7V10YH4yMdxgEOYKGC3qT
	h7azByUBanF48YImQJrj/o+8NeVKxC3bXPfpc6b10TfF5AbIGkJS9hFUpJeszMW3k8UG7JPo0gL
	Cpql1UhdRm7trsWrN4qDuuKZny4KY7iTjJ4UsHejqXcy4iVaNbbq3GSNB1uvsGUvce04t3jxuCV
	+sImt1yxZ82ZWNzqC9jSR7U70w3mHgt+GKNWG+LUSzbherkj5TvgxoQFI+GY/MKA==
X-Received: by 2002:a05:651c:4183:b0:38a:45e7:17df with SMTP id 38308e7fff4ca-38c730ff136mr47605121fa.1.1774972416744;
        Tue, 31 Mar 2026 08:53:36 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83903e44sm20063761fa.40.2026.03.31.08.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:53:36 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v3 2/7] staging: rtl8723bs: rename global function to snake_case
Date: Tue, 31 Mar 2026 17:53:13 +0200
Message-ID: <20260331155318.185117-3-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331155318.185117-1-linus.probert@gmail.com>
References: <20260331155318.185117-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renames efuse_OneByteRead to rtw_efuse_one_byte_read in order to conform
to kernel coding style.

Discovered using the checkpatch.pl tool.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c    |  2 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 22 +++++++++++--------
 drivers/staging/rtl8723bs/include/rtw_efuse.h |  2 +-
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 7fb0c4ad7583..a7b120cc70a3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -83,7 +83,7 @@ u16		Address)
 
 /*  11/16/2008 MH Read one byte from real Efuse. */
 u8
-efuse_OneByteRead(
+rtw_efuse_one_byte_read(
 struct adapter *padapter,
 u16	addr,
 u8	*data)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 652127af736d..355167883f08 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -651,7 +651,7 @@ static void hal_ReadEFuse_WiFi(
 	hal_EfuseSwitchToBank(padapter, 0);
 
 	while (AVAILABLE_EFUSE_ADDR(eFuse_Addr)) {
-		efuse_OneByteRead(padapter, eFuse_Addr++, &efuseHeader);
+		rtw_efuse_one_byte_read(padapter, eFuse_Addr++, &efuseHeader);
 		if (efuseHeader == 0xFF)
 			break;
 
@@ -659,7 +659,7 @@ static void hal_ReadEFuse_WiFi(
 		if (EXT_HEADER(efuseHeader)) { /* extended header */
 			offset = GET_HDR_OFFSET_2_0(efuseHeader);
 
-			efuse_OneByteRead(padapter, eFuse_Addr++, &efuseExtHdr);
+			rtw_efuse_one_byte_read(padapter, eFuse_Addr++, &efuseExtHdr);
 			if (ALL_WORDS_DISABLED(efuseExtHdr))
 				continue;
 
@@ -678,10 +678,12 @@ static void hal_ReadEFuse_WiFi(
 			for (i = 0; i < EFUSE_MAX_WORD_UNIT; i++) {
 				/*  Check word enable condition in the section */
 				if (!(wden & (0x01<<i))) {
-					efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData);
+					rtw_efuse_one_byte_read(padapter, eFuse_Addr++,
+								&efuseData);
 					efuseTbl[addr] = efuseData;
 
-					efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData);
+					rtw_efuse_one_byte_read(padapter, eFuse_Addr++,
+								&efuseData);
 					efuseTbl[addr+1] = efuseData;
 				}
 				addr += 2;
@@ -744,7 +746,7 @@ static void hal_ReadEFuse_BT(
 		eFuse_Addr = 0;
 
 		while (AVAILABLE_EFUSE_ADDR(eFuse_Addr)) {
-			efuse_OneByteRead(padapter, eFuse_Addr++, &efuseHeader);
+			rtw_efuse_one_byte_read(padapter, eFuse_Addr++, &efuseHeader);
 			if (efuseHeader == 0xFF)
 				break;
 
@@ -752,7 +754,7 @@ static void hal_ReadEFuse_BT(
 			if (EXT_HEADER(efuseHeader)) { /* extended header */
 				offset = GET_HDR_OFFSET_2_0(efuseHeader);
 
-				efuse_OneByteRead(padapter, eFuse_Addr++, &efuseExtHdr);
+				rtw_efuse_one_byte_read(padapter, eFuse_Addr++, &efuseExtHdr);
 				if (ALL_WORDS_DISABLED(efuseExtHdr))
 					continue;
 
@@ -770,10 +772,12 @@ static void hal_ReadEFuse_BT(
 				for (i = 0; i < EFUSE_MAX_WORD_UNIT; i++) {
 					/*  Check word enable condition in the section */
 					if (!(wden & (0x01<<i))) {
-						efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData);
+						rtw_efuse_one_byte_read(padapter, eFuse_Addr++,
+									&efuseData);
 						efuseTbl[addr] = efuseData;
 
-						efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData);
+						rtw_efuse_one_byte_read(padapter, eFuse_Addr++,
+									&efuseData);
 						efuseTbl[addr+1] = efuseData;
 					}
 					addr += 2;
@@ -1447,7 +1451,7 @@ void Hal_EfuseParsePackageType_8723B(
 	u8 efuseContent;
 
 	Hal_EfusePowerSwitch(padapter, true);
-	efuse_OneByteRead(padapter, 0x1FB, &efuseContent);
+	rtw_efuse_one_byte_read(padapter, 0x1FB, &efuseContent);
 	Hal_EfusePowerSwitch(padapter, false);
 
 	package = efuseContent & 0x7;
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index df430c9fd25b..b8cd9e694f56 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -69,7 +69,7 @@ struct efuse_hal {
 };
 
 u8 rtw_efuse_calculate_word_counts(u8 word_en);
-u8 efuse_OneByteRead(struct adapter *padapter, u16 addr, u8 *data);
+u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data);
 
 u8 EFUSE_Read1Byte(struct adapter *padapter, u16 Address);
 void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType);
-- 
2.53.0

