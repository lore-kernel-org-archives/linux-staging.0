Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AE626B765
	for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 12:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755953028; cv=none; b=jekORaVcpcYH06HkqpDv1Q0idFWGzdxaj+pjQivz0w1yITrgRmfcnAJX3MxCsxk39LTdm6d78ppwLJy9Hwh1h2SMGlWfKJdEOFOZYLkMXNKmvHWM+sVrzVE9QUZ04rgmfMCptf23FI3BBLH2pzpCxnb++tfqoqqw3k09TtvPprs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755953028; c=relaxed/simple;
	bh=1iD4N72zpEvrDT/vkabmBpqrXAD7v9kigY0P6Ya3BJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HHX0mRfcezs4y3zZ6v6mIRnT0i89U7e0UELoe7iKXXpGb15MP+qK/H2Z6r916mjK2YloBD/E0AJ3LUjZtRgXNNgQcO4r9cXem0sVWppwf54MgFkW08lMloI64kr+f0kLvdOX1LnMnoElss/7REN4kbxK0u2DozEXZDX7wCwVnvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3/s+oDc; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3/s+oDc"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb72d51dcso398003966b.0
        for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 05:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755953025; x=1756557825; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OM/rkBuH9r5TAbmD24hZvuqqZlQB7lq4axdod89JEA=;
        b=T3/s+oDcxNVPbJAFBOvi7x6xsRHiz+dalTxx7ONJX/nG7sxdIVQTyxH7jGQmYcTOyE
         BzliX4oolWpV1AJ39JsnVfA62IwaktDIr9OaJCSZOh1Xnsgu2pH1SHOMZzq8VdYY9pBT
         cSYKF03h3KG/h1w4Ewk93qW27LVStGDMzeH9igjO3C2Vo2mo/MZN8LpQgBNn69oY2CM1
         13i+mYeF11e4Kfj4Haj+LlhanhzDO/GxR4m37/6dexEtAU10hwcLGQr8wAPxFmPrhNKo
         7LaYX4znAu8kShUU9rMDpTnxEP4TH8bqj/4nLGX/rkMjBianBDvKiRHK+BnWnwEJPtXQ
         TGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755953025; x=1756557825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OM/rkBuH9r5TAbmD24hZvuqqZlQB7lq4axdod89JEA=;
        b=tEeblKFraiTe12ttr/MycV42fl/mFb/zwG4nrtXROBHRoollCN6wsZTBViGbpDrn5k
         upJBn0LKwN5gllNXtc7Gj1LSvN6h4tGs7Ipusqm1GxE4VAbSKqsrQX7BlcmyTOC6U/xQ
         vIW+TbpO4sWpVj8kfEq7p3D3zZKi9qud9yq15ozP+ebgU2WPr/DtXLrC9uuIM8l6JzyL
         0uUevfWDB7uxPowOrHDd4lXOu/XyVXeGWEKcPAbJH/0Tyko6yCngNvjvkq9uvAAeog9D
         XTYyaD/WYeeo76x4+ynQ6REtkrYdmEmrMuXy1alF/USCshNK4xWXNJs00FozvC9dP6sE
         Gk6g==
X-Forwarded-Encrypted: i=1; AJvYcCXpmTzuPuxe1H31MoxT5May2kJFWE0bwqupdxYvXD0Jln+7JX1QrKOuche7utPcy8HJF/YeYLVJamciJGBD@lists.linux.dev
X-Gm-Message-State: AOJu0YxOykwaguYKNZErgywaRm1BFJTJcIoUBoMdb3sdA9/WPEjP++vm
	WCZQ0+AzN1dA2StP9fmJAw3cSA+nh/TVot5EDwYUky0C0Prdcedjsqt4
X-Gm-Gg: ASbGncuFFEIUV6r4p3Fum4i0VIC77hGpDQspUGhjzzwroYCy37ULLi1fG9hhZIMvRuG
	tU5CjpAFjEK2BK8AB2yQiED3gQhWeopzh+/wosP+Og6daL52aAQoSpqmdDUqBGUJ5eg5CZiPFQX
	mOetLZi9yR95Dh6ekcAZcqK+ABCoa2D4dG8avvXQCfjlHJ+hm3liXRrS51JyxFnkIs4r8IS+iDu
	GNIvc5zQe91sOQa7Db4Y8FUePP4cGbMxlqF+GJe1kN4+GF+fd54lzSDONtCLf5CsQjuWpeL7gaf
	d1f0BVhP6t4w5uZzAhv+IfOI3+ubVHwWnfKOZnEtt3IQuL96SFtvLDduUzRNtzuVcmeMcDBkVDl
	eJNiO9/ydtWNMTSi6modUvFpZXYJNv+C6h0FO
X-Google-Smtp-Source: AGHT+IF+fUUJ00qonInRkhsPMbg8I8eHguAEM0CaE8rrqXu0ZRPWU8WGRNM2MArAExnDQI9PVF7R7w==
X-Received: by 2002:a17:906:c10f:b0:af6:3248:62bb with SMTP id a640c23a62f3a-afe29046a6amr581207866b.30.1755953024916;
        Sat, 23 Aug 2025 05:43:44 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe49a1f5a6sm165076466b.111.2025.08.23.05.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 05:43:44 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 13/14] staging: rtl8723bs: remove bPseudoTest from efuse_OneByteRead
Date: Sat, 23 Aug 2025 14:43:20 +0200
Message-ID: <20250823124321.485910-14-straube.linux@gmail.com>
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

The function efuse_OneByteRead is always called with bPseudoTest set to
false. Remove the pPseudoTest parameter and reomve resulting dead code to
reduce code complexity.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c     | 18 +-----------------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c  | 18 +++++++++---------
 drivers/staging/rtl8723bs/include/rtw_efuse.h  |  2 +-
 3 files changed, 11 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 9d065721c28a..c4542e00c730 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -29,18 +29,6 @@ u8 fakeBTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN] = {0};
 #define REG_EFUSE_CTRL		0x0030
 #define EFUSE_CTRL			REG_EFUSE_CTRL		/*  E-Fuse Control. */
 
-static bool
-Efuse_Read1ByteFromFakeContent(u16 Offset, u8 *Value)
-{
-	if (Offset >= EFUSE_MAX_HW_SIZE)
-		return false;
-	if (fakeEfuseBank == 0)
-		*Value = fakeEfuseContent[Offset];
-	else
-		*Value = fakeBTEfuseContent[fakeEfuseBank - 1][Offset];
-	return true;
-}
-
 static bool
 Efuse_Write1ByteToFakeContent(u16 Offset, u8 Value)
 {
@@ -158,16 +146,12 @@ u8
 efuse_OneByteRead(
 struct adapter *padapter,
 u16	addr,
-u8	*data,
-bool		bPseudoTest)
+u8	*data)
 {
 	u32 tmpidx = 0;
 	u8 bResult;
 	u8 readbyte;
 
-	if (bPseudoTest)
-		return Efuse_Read1ByteFromFakeContent(addr, data);
-
 	/*  <20130121, Kordan> For SMIC EFUSE specificatoin. */
 	/* 0x34[11]: SW force PGMEN input of efuse to high. (for the bank selected by 0x34[9:8]) */
 	/* PHY_SetMacReg(padapter, 0x34, BIT11, 0); */
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index ab30d2598825..94492743ea34 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -679,7 +679,7 @@ static void hal_ReadEFuse_WiFi(
 	hal_EfuseSwitchToBank(padapter, 0);
 
 	while (AVAILABLE_EFUSE_ADDR(eFuse_Addr)) {
-		efuse_OneByteRead(padapter, eFuse_Addr++, &efuseHeader, false);
+		efuse_OneByteRead(padapter, eFuse_Addr++, &efuseHeader);
 		if (efuseHeader == 0xFF)
 			break;
 
@@ -687,7 +687,7 @@ static void hal_ReadEFuse_WiFi(
 		if (EXT_HEADER(efuseHeader)) { /* extended header */
 			offset = GET_HDR_OFFSET_2_0(efuseHeader);
 
-			efuse_OneByteRead(padapter, eFuse_Addr++, &efuseExtHdr, false);
+			efuse_OneByteRead(padapter, eFuse_Addr++, &efuseExtHdr);
 			if (ALL_WORDS_DISABLED(efuseExtHdr))
 				continue;
 
@@ -706,10 +706,10 @@ static void hal_ReadEFuse_WiFi(
 			for (i = 0; i < EFUSE_MAX_WORD_UNIT; i++) {
 				/*  Check word enable condition in the section */
 				if (!(wden & (0x01<<i))) {
-					efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData, false);
+					efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData);
 					efuseTbl[addr] = efuseData;
 
-					efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData, false);
+					efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData);
 					efuseTbl[addr+1] = efuseData;
 				}
 				addr += 2;
@@ -772,7 +772,7 @@ static void hal_ReadEFuse_BT(
 		eFuse_Addr = 0;
 
 		while (AVAILABLE_EFUSE_ADDR(eFuse_Addr)) {
-			efuse_OneByteRead(padapter, eFuse_Addr++, &efuseHeader, false);
+			efuse_OneByteRead(padapter, eFuse_Addr++, &efuseHeader);
 			if (efuseHeader == 0xFF)
 				break;
 
@@ -780,7 +780,7 @@ static void hal_ReadEFuse_BT(
 			if (EXT_HEADER(efuseHeader)) { /* extended header */
 				offset = GET_HDR_OFFSET_2_0(efuseHeader);
 
-				efuse_OneByteRead(padapter, eFuse_Addr++, &efuseExtHdr, false);
+				efuse_OneByteRead(padapter, eFuse_Addr++, &efuseExtHdr);
 				if (ALL_WORDS_DISABLED(efuseExtHdr))
 					continue;
 
@@ -798,10 +798,10 @@ static void hal_ReadEFuse_BT(
 				for (i = 0; i < EFUSE_MAX_WORD_UNIT; i++) {
 					/*  Check word enable condition in the section */
 					if (!(wden & (0x01<<i))) {
-						efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData, false);
+						efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData);
 						efuseTbl[addr] = efuseData;
 
-						efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData, false);
+						efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData);
 						efuseTbl[addr+1] = efuseData;
 					}
 					addr += 2;
@@ -1475,7 +1475,7 @@ void Hal_EfuseParsePackageType_8723B(
 	u8 efuseContent;
 
 	Efuse_PowerSwitch(padapter, false, true);
-	efuse_OneByteRead(padapter, 0x1FB, &efuseContent, false);
+	efuse_OneByteRead(padapter, 0x1FB, &efuseContent);
 	Efuse_PowerSwitch(padapter, false, false);
 
 	package = efuseContent & 0x7;
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index a5c338c67245..1cee7a8eedf2 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -91,7 +91,7 @@ extern u8 fakeBTEfuseModifiedMap[];
 /*------------------------Export global variable----------------------------*/
 
 u8 Efuse_CalculateWordCnts(u8 word_en);
-u8 efuse_OneByteRead(struct adapter *padapter, u16 addr, u8 *data, bool	 bPseudoTest);
+u8 efuse_OneByteRead(struct adapter *padapter, u16 addr, u8 *data);
 u8 efuse_OneByteWrite(struct adapter *padapter, u16 addr, u8 data, bool	 bPseudoTest);
 
 void Efuse_PowerSwitch(struct adapter *padapter, u8 bWrite, u8  PwrState);
-- 
2.51.0

