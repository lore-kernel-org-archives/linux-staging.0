Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D581F37F754
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 19:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775070504; cv=none; b=c4LVn7SYIvtV760ggtmfhvqDgGOO0VIzxBznQVLCC/KC2z4rKOpHKEpTpb873vEYtq4BBGeB7D6g1FFagoOAILXYQSvy5VNICsl+SxZMnDlDcoxJ0vXKTE27xAs8GornciXx8CVCOqLU8Tjpgv2E3a9GQAxXpz6PAE6PKbWVmr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775070504; c=relaxed/simple;
	bh=n3MBmUVIsQZ1KVGuSiCIWgKPEDv0NSwoVvlo9zMg274=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Amv3pMjEBXIC+4iS3XMULSSncSfc4kERaFAjs5KGR9tikIjuSwAZeyi6YkjQ3Efe0NnRLjaMqOcFofbAkB6w45GzobHsj1bG9aooHcrs0ogEus/Iw/ducAkI1pbFdTxhjOrvX1vU9xxV/3WZ3mAWncBUn2uyBMYU09qWJ/a1UyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWX5UPBk; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWX5UPBk"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a0faa0d15cso180051e87.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 12:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775070501; x=1775675301; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVJejmaY5MQzN+r1Qm4GEZ53tY7uOCwGoQ2R5MHIplw=;
        b=IWX5UPBkgKRllD3QaVl55l+BMRuFvpbkJnqDOxVmQE7rdnkdyuknQcLNswevJvl4Jg
         LQoyVlMWUILhu8XD/CHIk4dPIoPX5zlkW37sXpOc+Veq0g4E8gd6fe1ZYV0QqpxDTrDk
         PWf/M0keLvmf0fL93qG0P2NQirXqJ6AkTMi9ypeLWxNomxl3s3PitTQgmibnSoJfJcD2
         sEP55ZNeosqNvI3glI8y6M4Rfo7sPxg9F5NBIjB9QpwJkfw3UUoDkW0q+W81ydA9CyS2
         M0Z1ED41hbuzR2Bf4renRit07L9/JryJdHTfx5u9mh2MePsOgJ3Kcypv7duRE+dvEnBc
         OYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775070501; x=1775675301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gVJejmaY5MQzN+r1Qm4GEZ53tY7uOCwGoQ2R5MHIplw=;
        b=sQPKtkGrRhMMUPBQzhlM19Q1AbOdkvWcytOw/weH9h6lYn3yhNCyAKPSTxZ/bbvhXq
         kgCj0yPIl5CNXIFIce84g8JNUHv+OveoJXzoHJzC+I1bO448RkaEqYN0tO7m0Izn6Dfh
         wd+mcJVMsnGtY0aSL91Y3aXtYFATPYdc6g8nmZSCN0Anp5B5h/AJBWlgGSBLE4t80f4K
         K+htuRS2TvHwwVSl974IxeMak/70M/bwRl9bDpOm7AsUFqDOW2Hi/TkUMX2wP2lkKJWj
         e/xIix0ZGWuyv/P/OgTmgNUJSZDwm3bV4VLpoCAg1RHe82uKpiNy2lhIriNapAhmn6TM
         DVIA==
X-Gm-Message-State: AOJu0YwqC1f2nYmUOp7IMvG5JYqM6wXwfkm/2TOYSoaeTgDs6BU/AQ4u
	DKihFZuyOmnOBoUFr9XSN6sIqFeFPRuj5uefCzionEhE4owwcIijgj3N
X-Gm-Gg: ATEYQzyxvIzvdy90oOBbTo2HFCL5cALVui639yd9xwb5/podDgoys3XiZpma7RjqeJe
	wBDl7+fctuGQPNtw8PBKRAEIo+QCu5FCN3MeEaKiQcVFIkScUkMgaLr+D/JJ4URePsCmwPKGSFW
	xaWY+NGgoilV2QaZUuRTE06FBQQrJOzmalalJpq8e3J690YYuNGvHXqonRCmyt11LkjOf0zAW6n
	oqE0ikWi7bRwgCOgPWyyVxgHBX4/hVVzMhwCvEwFRcGcHyn6zMcolhLKXJJlWhAo/NSOZ/8GR0m
	O1lPYssuURrQEZbUgSiz8Lv/rHgNpxCgXNptODxEbpeFWA1YXDjPaaop1zKj799l7r2Asvbwu92
	3hi23z70HIuwvb45SVUkmQzV80Vk+V27YG9083PuJDaHbWjBcWg800bbVIoYemA/1cixtRS1XPt
	/IsEzOIMVTzYm7MmSt0WdiDNJ/vVmr
X-Received: by 2002:a05:6512:684:b0:5a2:bac1:97bc with SMTP id 2adb3069b0e04-5a2c1f3d470mr2190319e87.44.1775070500917;
        Wed, 01 Apr 2026 12:08:20 -0700 (PDT)
Received: from localhost ([2a02:aa1:115f:85c8:99af:b9fd:7f92:d8b4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9cd5bsm149302e87.30.2026.04.01.12.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 12:08:20 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v4 2/7] staging: rtl8723bs: efuse_OneByteRead() -> rtw_efuse_one_byte_read()
Date: Wed,  1 Apr 2026 21:08:09 +0200
Message-ID: <20260401190814.216333-3-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401190814.216333-1-linus.probert@gmail.com>
References: <20260401190814.216333-1-linus.probert@gmail.com>
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
v4: More descriptive subject

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

