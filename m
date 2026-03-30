Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D632D2E285C
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 21:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774905867; cv=none; b=LKFhiRna9VKXvmU+8BKGWTevBtT94sH4sGJlfv8Q7b9ndj4sodSsGUgy7gqNNjic9rU6K/9JGqFZEISQit0gibrgJYTpKmLAFH3xd///znZZQjCPZwHMAp0bAGWlLnP77kZEvEm3u6los6PJhfxx+rrXuyoDI6VFaO0K7IuVYFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774905867; c=relaxed/simple;
	bh=NC1dDUDHwEvDYMc464MBEttGhB+u9I2Wuw0gcp9Luls=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BQ/0czvmIwaWuHkjCDWexDU3p3n2TYIki5vnj5Igb0oziXka1PocyJ+EJxTafX4gJgWaEJhJB+sh6fJ8vawP0+nyBYRzdaXy0t1aDUwZ5ubk0rmYqnGzuvXPGmPoSSYmcMPDom7TXvzs0xg2qZq/W+/vhOuT+di9s6cxwNKJN50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClmxyFkE; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClmxyFkE"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a2b636b944so1178349e87.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 14:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774905864; x=1775510664; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ygFLLyOp6SIhFrThJg/jYbhK7mG8/wkyRqBEku4dv60=;
        b=ClmxyFkEX8+OwpA958WApVTJwGftTL0MkqO3TZURfKBvyyrfB8x/fKtfRaKfsmoX5P
         bjsqhQ7k6Pka96ZGZyzIX3zcjs4sbNnPiKRVpfnrsunKjrcBNf9nDAsvZ7bWCD7+2Zdo
         ftYyhcv44LEqhoPPPLJli+qADXLQADUsOZwYdB7XNkqx9zMH6sGJpF3+CeJLSNJn9pbF
         5kGI1wX6fRz5/N8wW96fxpPSt+Xnro8TrYsq2rsK7O7yWdjOI7XKw1HPCc0tRIhpN483
         kxA2V7y/X2AxSrcUEHNgxXVVh/eDYhaukigeoLXv6t/qDeqQCsv3WrWyxRJUCILU1Us2
         g24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774905864; x=1775510664;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ygFLLyOp6SIhFrThJg/jYbhK7mG8/wkyRqBEku4dv60=;
        b=AWwPk9xGsy7xq8H/u2zRSqwzzMbsqcCWWVam7OKTmP4XR7hfBwhLp5R4XQYwZQbbbA
         l8AQwylCZM6akBCf11VOKpPiwvCdAeB27QM5O1I8ORbCMKtE1PkOSRfXOgbyIPSs/CZt
         3DQtatUE+Rl7BNab1KHseS2XXCgNn2T8EX58N90YOV05UARDOW8ky0BwRk2eWW8ySxBm
         0jqo4ao5sqkBLpbrqxFPof1mbsDWmm7XMsqBouF0dOjvMwXJ1rldyFC/cyhMQwOSsTOn
         pk1lr+bx+HV6RbwgtBgH89VrP80ZfxoRrWvGjPZAlnjYuI+QepJDTPfoTbTuR4FSicAp
         UiuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlfJM/C/DpFhocXcw2Olq0I6QdmGDQH0DKYTmLy6d0rh+FE2Gy4+dQzvRAfhwXVfF8etNy9bvP8VTyfQUz@lists.linux.dev
X-Gm-Message-State: AOJu0Yypwq09j3m8CiTNCwbCxRaGhbj6+4K8V7VF/7lqiP/EocTjVQHn
	b3LFfkBTbAdK+VENMSlu1lcvE7LiZ30Wg7KKjGu8sH/T2dhXwKkqk070
X-Gm-Gg: ATEYQzwDRJkMG6LQeHZhRsuKqzcg4q9/RRfjRZOfRaMZ7RyPL/Gm7o4PBwa5y5+eF+9
	MuJ2TnCDy/D7yG1kAmguohfZsrBHEzHzi0WV3J/G81ekr8msnqa4w7Bc2b5ZERj2EStsCxLGA58
	Lki7/anyvfHcH3z/EpkmRUgnlczMzl1aQnr7gduS0XbDgpxgWehjpTQVwNuS9aNRbgyS9rlevsB
	bYW3Q/O73AXzLxH/S7p8rn7bp+R6IYwcr5ZUJdPnW5rOjuGpPnP7RDax8/wkpxJkAITV5cbQ6Ti
	IX1wZWQqAJthIrOzDNXKJSBImqeljLCxMCsKkYwSCT9JFNYHvkW+nIh2/VxJCqAjZwmf4F6zIyf
	3XgAS+kM/xIuvOdeIh9x+wWVlBJCGacVSH2OFPNY72MTBmW8ROPHyyPxvI//kI0LFi4nRirS/4e
	l1bG1dKaprwX9zGhR67BvHtDzPyGlTho+i7wStV4xNIjS8PxvWA+kM0ROujqCkbA==
X-Received: by 2002:a05:6512:b99:b0:5a2:7a31:9199 with SMTP id 2adb3069b0e04-5a2ab7fa6e1mr6019850e87.14.1774905863751;
        Mon, 30 Mar 2026 14:24:23 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2bce53835sm164e87.63.2026.03.30.14.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 14:24:23 -0700 (PDT)
Date: Mon, 30 Mar 2026 23:24:22 +0200
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: clean up function names
Message-ID: <acrpggSYn1iwvUwN@mosquito>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Renames camel case functions in rtw_efuse.h and also removes two
function declarations that were never implemented nor called in the
source.

Naming problems found using checkpatch.pl tool. The unused functions
were discovered while applying the changes.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 34 +++++++++----------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 33 ++++++++++--------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  2 +-
 drivers/staging/rtl8723bs/include/rtw_efuse.h | 14 ++++----
 4 files changed, 43 insertions(+), 40 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 099320e4eb50..7b72b05da489 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -10,7 +10,7 @@
 
 /*  11/16/2008 MH Add description. Get current efuse area enabled word!!. */
 u8
-Efuse_CalculateWordCnts(u8 word_en)
+rtw_efuse_calculate_word_counts(u8 word_en)
 {
 	u8 word_cnts = 0;
 
@@ -26,7 +26,7 @@ Efuse_CalculateWordCnts(u8 word_en)
 }
 
 /*-----------------------------------------------------------------------------
- * Function:	EFUSE_Read1Byte
+ * Function:	efuse_read_1_byte
  *
  * Overview:	Copy from WMAC fot EFUSE read 1 byte.
  *
@@ -42,7 +42,7 @@ Efuse_CalculateWordCnts(u8 word_en)
  *
  */
 u8
-EFUSE_Read1Byte(
+rtw_efuse_read_1_byte(
 struct adapter *Adapter,
 u16		Address)
 {
@@ -79,11 +79,11 @@ u16		Address)
 	} else
 		return 0xFF;
 
-} /* EFUSE_Read1Byte */
+} /* efuse_read_1_byte */
 
 /*  11/16/2008 MH Read one byte from real Efuse. */
 u8
-efuse_OneByteRead(
+rtw_efuse_one_byte_read(
 struct adapter *padapter,
 u16	addr,
 u8	*data)
@@ -170,7 +170,7 @@ static void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse)
  * 11/12/2008	MHC		Create Version 0.
  *
  */
-static void efuse_ShadowRead1Byte(struct adapter *padapter, u16 Offset, u8 *Value)
+static void efuse_shadow_read_1_byte(struct adapter *padapter, u16 Offset, u8 *Value)
 {
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
 
@@ -179,7 +179,7 @@ static void efuse_ShadowRead1Byte(struct adapter *padapter, u16 Offset, u8 *Valu
 }	/*  EFUSE_ShadowRead1Byte */
 
 /* Read Two Bytes */
-static void efuse_ShadowRead2Byte(struct adapter *padapter, u16 Offset, u16 *Value)
+static void efuse_shadow_read_2_byte(struct adapter *padapter, u16 Offset, u16 *Value)
 {
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
 
@@ -189,7 +189,7 @@ static void efuse_ShadowRead2Byte(struct adapter *padapter, u16 Offset, u16 *Val
 }	/*  EFUSE_ShadowRead2Byte */
 
 /* Read Four Bytes */
-static void efuse_ShadowRead4Byte(struct adapter *padapter, u16 Offset, u32 *Value)
+static void efuse_shadow_read_4_byte(struct adapter *padapter, u16 Offset, u32 *Value)
 {
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
 
@@ -201,7 +201,7 @@ static void efuse_ShadowRead4Byte(struct adapter *padapter, u16 Offset, u32 *Val
 }	/*  efuse_ShadowRead4Byte */
 
 /*-----------------------------------------------------------------------------
- * Function:	EFUSE_ShadowMapUpdate
+ * Function:	efuse_shadow_map_update
  *
  * Overview:	Transfer current EFUSE content to shadow init and modify map.
  *
@@ -216,7 +216,7 @@ static void efuse_ShadowRead4Byte(struct adapter *padapter, u16 Offset, u32 *Val
  * 11/13/2008	MHC		Create Version 0.
  *
  */
-void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType)
+void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType)
 {
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
 	u16 mapLen = 0;
@@ -230,11 +230,11 @@ void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType)
 
 	/* PlatformMoveMemory((void *)&pHalData->EfuseMap[EFUSE_MODIFY_MAP][0], */
 	/* void *)&pHalData->EfuseMap[EFUSE_INIT_MAP][0], mapLen); */
-} /*  EFUSE_ShadowMapUpdate */
+} /*  efuse_shadow_map_update */
 
 
 /*-----------------------------------------------------------------------------
- * Function:	EFUSE_ShadowRead
+ * Function:	efuse_shadow_read
  *
  * Overview:	Read from efuse init map !!!!!
  *
@@ -249,13 +249,13 @@ void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType)
  * 11/12/2008	MHC		Create Version 0.
  *
  */
-void EFUSE_ShadowRead(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value)
+void rtw_efuse_shadow_read(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value)
 {
 	if (Type == 1)
-		efuse_ShadowRead1Byte(padapter, Offset, (u8 *)Value);
+		efuse_shadow_read_1_byte(padapter, Offset, (u8 *)Value);
 	else if (Type == 2)
-		efuse_ShadowRead2Byte(padapter, Offset, (u16 *)Value);
+		efuse_shadow_read_2_byte(padapter, Offset, (u16 *)Value);
 	else if (Type == 4)
-		efuse_ShadowRead4Byte(padapter, Offset, (u32 *)Value);
+		efuse_shadow_read_4_byte(padapter, Offset, (u32 *)Value);
 
-}	/* EFUSE_ShadowRead*/
+}	/* efuse_shadow_read*/
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index e794fe3caf9d..3dff8aa2badb 100644
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
 
@@ -678,16 +678,18 @@ static void hal_ReadEFuse_WiFi(
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
 			}
 		} else {
-			eFuse_Addr += Efuse_CalculateWordCnts(wden)*2;
+			eFuse_Addr += rtw_efuse_calculate_word_counts(wden)*2;
 		}
 	}
 
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
 
@@ -770,16 +772,18 @@ static void hal_ReadEFuse_BT(
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
 				}
 			} else {
-				eFuse_Addr += Efuse_CalculateWordCnts(wden)*2;
+				eFuse_Addr += rtw_efuse_calculate_word_counts(wden)*2;
 			}
 		}
 
@@ -1184,12 +1188,12 @@ void Hal_InitPGData(struct adapter *padapter, u8 *PROMContent)
 	if (!pEEPROM->bautoload_fail_flag) { /*  autoload OK. */
 		if (!pEEPROM->EepromOrEfuse) {
 			/*  Read EFUSE real map to shadow. */
-			EFUSE_ShadowMapUpdate(padapter, EFUSE_WIFI);
+			rtw_efuse_shadow_map_update(padapter, EFUSE_WIFI);
 			memcpy(PROMContent, pEEPROM->efuse_eeprom_data, HWSET_MAX_SIZE_8723B);
 		}
 	} else {/* autoload fail */
 		if (!pEEPROM->EepromOrEfuse)
-			EFUSE_ShadowMapUpdate(padapter, EFUSE_WIFI);
+			rtw_efuse_shadow_map_update(padapter, EFUSE_WIFI);
 		memcpy(PROMContent, pEEPROM->efuse_eeprom_data, HWSET_MAX_SIZE_8723B);
 	}
 }
@@ -1447,7 +1451,7 @@ void Hal_EfuseParsePackageType_8723B(
 	u8 efuseContent;
 
 	Hal_EfusePowerSwitch(padapter, true);
-	efuse_OneByteRead(padapter, 0x1FB, &efuseContent);
+	rtw_efuse_one_byte_read(padapter, 0x1FB, &efuseContent);
 	Hal_EfusePowerSwitch(padapter, false);
 
 	package = efuseContent & 0x7;
@@ -1555,7 +1559,8 @@ void Hal_ReadRFGainOffset(
 
 	if (!AutoloadFail) {
 		Adapter->eeprompriv.EEPROMRFGainOffset = PROMContent[EEPROM_RF_GAIN_OFFSET];
-		Adapter->eeprompriv.EEPROMRFGainVal = EFUSE_Read1Byte(Adapter, EEPROM_RF_GAIN_VAL);
+		Adapter->eeprompriv.EEPROMRFGainVal = rtw_efuse_read_1_byte(Adapter,
+									    EEPROM_RF_GAIN_VAL);
 	} else {
 		Adapter->eeprompriv.EEPROMRFGainOffset = 0;
 		Adapter->eeprompriv.EEPROMRFGainVal = 0xFF;
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index f2f73c65a636..3b3fac981a27 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -574,7 +574,7 @@ static bool HalDetectPwrDownMode(struct adapter *Adapter)
 	struct pwrctrl_priv *pwrctrlpriv = adapter_to_pwrctl(Adapter);
 
 
-	EFUSE_ShadowRead(Adapter, 1, 0x7B/*EEPROM_RF_OPT3_92C*/, (u32 *)&tmpvalue);
+	rtw_efuse_shadow_read(Adapter, 1, 0x7B/*EEPROM_RF_OPT3_92C*/, (u32 *)&tmpvalue);
 
 	/*  2010/08/25 MH INF priority > PDN Efuse value. */
 	if (tmpvalue & BIT4 && pwrctrlpriv->reg_pdnmode)
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 191ffdf593d4..808ba94a5998 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -31,7 +31,7 @@ enum {
 #define		EFUSE_REPEAT_THRESHOLD_			3
 
 /*  */
-/* 	The following is for BT Efuse definition */
+/*	The following is for BT Efuse definition */
 /*  */
 #define		EFUSE_BT_MAX_MAP_LEN		1024
 #define		EFUSE_MAX_BANK			4
@@ -68,13 +68,11 @@ struct efuse_hal {
 	u8 fakeBTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN];
 };
 
-u8 Efuse_CalculateWordCnts(u8 word_en);
-u8 efuse_OneByteRead(struct adapter *padapter, u16 addr, u8 *data);
+u8 rtw_efuse_calculate_word_counts(u8 word_en);
+u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data);
 
-u8 EFUSE_Read1Byte(struct adapter *padapter, u16 Address);
-void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType);
-void EFUSE_ShadowRead(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value);
-void Rtw_Hal_ReadMACAddrFromFile(struct adapter *padapter);
-u32 Rtw_Hal_readPGDataFromConfigFile(struct adapter *padapter);
+u8 rtw_efuse_read_1_byte(struct adapter *padapter, u16 Address);
+void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType);
+void rtw_efuse_shadow_read(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value);
 
 #endif
-- 
2.53.0

