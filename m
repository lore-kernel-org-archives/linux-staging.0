Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783E7266EEA
	for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 12:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755953027; cv=none; b=impgCCWL6AnMtb/xCEsyelgehDl/6qt2blOILmi9dxswy76LGp2t5J7zrWfdvGhlKw8nfS7KgGdTm/f/U6lgmeA14FeUKIft9FJSx2AN3e39efrh1A+mwoa1GNQeR5UPCr7by2qpIxk+kpkcpR1gUq7naupw98GDzxjMKbFIz94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755953027; c=relaxed/simple;
	bh=EHd+pho2CKEgo1TnShr+E4CGerzPl5OLtXmFsDyNtVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LfZ1Rk9Aepybfnu4bP+4X9tDc2CXKE6Ux01fBn10LeFiUYfyfU7qfyqQ7ffj+t5OxgXVOFxPK2mKk2Hrs1ccVzFv7sWPQOfsdmIQKodwQJh8Bz0XIsr8OjRcmnXDpjcpm5sF1sMQf7n0rBzvXTcTN9vdu8vYuiZCX+R60ZajOos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GnFglwlv; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnFglwlv"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-afcb731caaaso440301866b.0
        for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 05:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755953024; x=1756557824; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBzxzKnHxbIaunAwDeVnqD0gBKox3dXJJ/Rscg6vwsQ=;
        b=GnFglwlv+0JnG1SbVODgqZAXjWb2QnmuwRE8M6hJ3yzF4qxHUG6sblF34G5e5nePIA
         ySrzYRpNWl8N5S85c2zDtdzRarZQ/jTNnXA+ituoE1Y+lxUWxQq3I2hOXchcmxGJRyHe
         s3C9g23IT7Hsol9tnSfLnx+/Wk5EykKK3OxN77p7pOWrFoqiY854OKLRdh9zGw/sNXV4
         LbR1Ol9r8ZM/S5bqVWx6qtY0gR+Jf0WTVYwQr4n6qz0nhg48FYFtaP8SObG0nIcY34D+
         2d9RHn1nnbOt+dXAk0+NeyT5x1SFkaMd3Y8XZcGc5f7avomCYf+baUVroIMlQ/4ulMrH
         n+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755953024; x=1756557824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xBzxzKnHxbIaunAwDeVnqD0gBKox3dXJJ/Rscg6vwsQ=;
        b=bu1QO+eTpc4hECaU9xRczFFmA5K+sK//Fwc60L9k2R+SNz69+evvGbPHFFUocf09ox
         YX8CiXkK/REIFJsuFzkZ973LUntI1llfkQ8Dv4jSug9mPn2GYoZCK4DDzGuhHv8bzqJw
         B2Qgj0nI0OA+hTrgj1TOiCgqC8gBqoUiMzkSqq6erzU0ePpVnzDPuNNKJKQAgM/fnQur
         bTdkD+98NZtCboHZeqjG5fTGxvYPOm/Xpxa3WudbPaGvGTFT9nSRBf68Nuj143TSmDmh
         uqJQ1c1ijOyRd8csRxusLuKpcMAeUUmyu5AQ5yZospYBqPZTqHfSRupXTWYj3tOnJay7
         zX2A==
X-Forwarded-Encrypted: i=1; AJvYcCVtHkJ4ButpzCVEn0aAkZWNBbtyjNLqPv1MONI+wEl/3IAXKLnVovjCaMAMINwgLU42XsQeBQi9TwGWCLd7@lists.linux.dev
X-Gm-Message-State: AOJu0YwjpI/WWnNMyjNkgFdB//sZ+pieL/MR2XQUx7xxKJ8nnJamQdYE
	2BXx5DhHJ+5WXtK8zjOZ2YZqmm1BDznQlEDnaHge2mlAIhK341bWUTir
X-Gm-Gg: ASbGncuA2HBV8ZiGi84DVjfZHMdnX7+e34tjkcjXQWBg2MF6EhxE6Sgazc5rZPT2eHW
	MaSeRK+0n4jyEuH4MZNxFsra61+5SRyMEhh80j6Uf/cT9YbvD/bgWtPRQQrnkcGm9lt8Vlq7M8z
	18fuDad9kt8YrjhhUZ3Bdif7gwXZ1OVeeNHGjlglU83EoSYBZVNPjRgS96wJvk8Qx75nHpvZFJN
	ognp06w6BkthSWSK7/z+cvjYw9uQXB+lfwrEdDsvoBQPdy5bY0BvQU3Ze2JgFQRXZLP3Ypxo7Cb
	kr8W2MXmWflqFiAkSbXC8tSLBD6zsdmSlc5nZY4IFdMDjjpRUOa5pOrLPKMSYWJList8Tnc3wpX
	gQhobuEUbbcbBZGDq5Ee84vvAUg==
X-Google-Smtp-Source: AGHT+IGOPYK8nbUxDZ882SzO7ZNhbK6L59vKLT7JZZ2ydjpaNIC9KyWvkjge3qksvdjnHlfHLmfpqg==
X-Received: by 2002:a17:907:ea8:b0:afd:e687:d280 with SMTP id a640c23a62f3a-afe295d7033mr515436866b.44.1755953023654;
        Sat, 23 Aug 2025 05:43:43 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe49a1f5a6sm165076466b.111.2025.08.23.05.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 05:43:43 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 11/14] staging: rtl8723bs: remove bPseudoTest from hal_EfuseSwitchToBank
Date: Sat, 23 Aug 2025 14:43:18 +0200
Message-ID: <20250823124321.485910-12-straube.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250823124321.485910-1-straube.linux@gmail.com>
References: <20250823124321.485910-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function hal_EfuseSwitchToBank is always called with bPseudoTest set to
false. Remove the pPseudoTest parameter and reomve resulting dead code to
reduce code complexity.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 62 +++++++------------
 1 file changed, 24 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 0679f77e3498..014d94894de9 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -445,47 +445,33 @@ void rtl8723b_InitializeFirmwareVars(struct adapter *padapter)
 /* 				Efuse related code */
 /*  */
 static u8 hal_EfuseSwitchToBank(
-	struct adapter *padapter, u8 bank, bool bPseudoTest
+	struct adapter *padapter, u8 bank
 )
 {
 	u8 bRet = false;
 	u32 value32 = 0;
-#ifdef HAL_EFUSE_MEMORY
-	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
-	struct efuse_hal *pEfuseHal = &pHalData->EfuseHal;
-#endif
 
-
-	if (bPseudoTest) {
-#ifdef HAL_EFUSE_MEMORY
-		pEfuseHal->fakeEfuseBank = bank;
-#else
-		fakeEfuseBank = bank;
-#endif
-		bRet = true;
-	} else {
-		value32 = rtw_read32(padapter, EFUSE_TEST);
-		bRet = true;
-		switch (bank) {
-		case 0:
-			value32 = (value32 & ~EFUSE_SEL_MASK) | EFUSE_SEL(EFUSE_WIFI_SEL_0);
-			break;
-		case 1:
-			value32 = (value32 & ~EFUSE_SEL_MASK) | EFUSE_SEL(EFUSE_BT_SEL_0);
-			break;
-		case 2:
-			value32 = (value32 & ~EFUSE_SEL_MASK) | EFUSE_SEL(EFUSE_BT_SEL_1);
-			break;
-		case 3:
-			value32 = (value32 & ~EFUSE_SEL_MASK) | EFUSE_SEL(EFUSE_BT_SEL_2);
-			break;
-		default:
-			value32 = (value32 & ~EFUSE_SEL_MASK) | EFUSE_SEL(EFUSE_WIFI_SEL_0);
-			bRet = false;
-			break;
-		}
-		rtw_write32(padapter, EFUSE_TEST, value32);
+	value32 = rtw_read32(padapter, EFUSE_TEST);
+	bRet = true;
+	switch (bank) {
+	case 0:
+		value32 = (value32 & ~EFUSE_SEL_MASK) | EFUSE_SEL(EFUSE_WIFI_SEL_0);
+		break;
+	case 1:
+		value32 = (value32 & ~EFUSE_SEL_MASK) | EFUSE_SEL(EFUSE_BT_SEL_0);
+		break;
+	case 2:
+		value32 = (value32 & ~EFUSE_SEL_MASK) | EFUSE_SEL(EFUSE_BT_SEL_1);
+		break;
+	case 3:
+		value32 = (value32 & ~EFUSE_SEL_MASK) | EFUSE_SEL(EFUSE_BT_SEL_2);
+		break;
+	default:
+		value32 = (value32 & ~EFUSE_SEL_MASK) | EFUSE_SEL(EFUSE_WIFI_SEL_0);
+		bRet = false;
+		break;
 	}
+	rtw_write32(padapter, EFUSE_TEST, value32);
 
 	return bRet;
 }
@@ -692,7 +678,7 @@ static void hal_ReadEFuse_WiFi(
 	memset(efuseTbl, 0xFF, EFUSE_MAX_MAP_LEN);
 
 	/*  switch bank back to bank 0 for later BT and wifi use. */
-	hal_EfuseSwitchToBank(padapter, 0, false);
+	hal_EfuseSwitchToBank(padapter, 0);
 
 	while (AVAILABLE_EFUSE_ADDR(eFuse_Addr)) {
 		efuse_OneByteRead(padapter, eFuse_Addr++, &efuseHeader, false);
@@ -782,7 +768,7 @@ static void hal_ReadEFuse_BT(
 	Hal_GetEfuseDefinition(padapter, EFUSE_BT, TYPE_AVAILABLE_EFUSE_BYTES_BANK, &total);
 
 	for (bank = 1; bank < 3; bank++) { /*  8723b Max bake 0~2 */
-		if (hal_EfuseSwitchToBank(padapter, bank, false) == false)
+		if (hal_EfuseSwitchToBank(padapter, bank) == false)
 			goto exit;
 
 		eFuse_Addr = 0;
@@ -833,7 +819,7 @@ static void hal_ReadEFuse_BT(
 	}
 
 	/*  switch bank back to bank 0 for later BT and wifi use. */
-	hal_EfuseSwitchToBank(padapter, 0, false);
+	hal_EfuseSwitchToBank(padapter, 0);
 
 	/*  Copy from Efuse map to output pointer memory!!! */
 	for (i = 0; i < _size_byte; i++)
-- 
2.51.0

