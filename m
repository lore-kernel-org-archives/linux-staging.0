Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA77528468E
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 05:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774935532; cv=none; b=DVuPK96T7LPo6vZMfvEjor3+MSBvSn7/4icKfUEuurXiCFNLKTQUnZuyTaH0jLe+UbwfFwfNkpPuuaGnn+UBzTsg8mVM2Ggr/LyfQ9Al+D/OeoDn1ekp1lsQYV8M44R+oP7W6uNaslL35YM+Yi43Zyk/oD/TsGpXvuaCmACzjvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774935532; c=relaxed/simple;
	bh=fDe3zjgnwsmmDewfyD3Meyke4sc8NXa/vXWyXDzJo74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Isv6Z16WPKr7uFnyTYOvq50JICN6iQpSh1fnwDBeb1fMiJgGrNA+JDe+N9qopPKLFLFA+tdpdBF2ZK1BJ/eTZVJlgKDUf7KUiAvDoYpOi9vjQTjdkNfz3y/lirpdvZ9YE91Emt1BWTo5HoLMtNcjxCo11khi2sYChqmDk1BlDYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9eZrsak; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9eZrsak"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so3502208e87.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 22:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774935528; x=1775540328; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AezgbC0Qrj1u9PhVo92Z8QeplyyzSn8lLI5DuISvvc=;
        b=F9eZrsakjmH1FRANtOdwVdPaHnJPhUgHalyvaJRKH8hMWFpl4kcP9qYUsMXnM3Hz6u
         03S35RhQLwU6dmVrQrubJvURAfefqCLcJJDaj63QreIdKvT7f7ZAs1ajZSKIpsGhMBOp
         2rlz9c3YodZXtynBJsroGs0yg5xsEV4pNMgEXLGPJ/GpqcgiRAQrrNsM0/G4EglvW8y5
         L5Ac5ed8KKjvp22IwIF7Xp1aCQ58fuCGIuYLRI3bVevGmhB7gPEmfuujGMvAKjbp40Gf
         Ybule1AM9MoUgVZvJIQzxZUFCaUBG6LrnHCFwpFfiXeHRqWmCSQJCIuggEUo7K55KtsA
         cjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774935528; x=1775540328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3AezgbC0Qrj1u9PhVo92Z8QeplyyzSn8lLI5DuISvvc=;
        b=ULc/bk7II3zmBgYvAfhb3601R3mVIyp8e1kEADs0JwUz0O8hA5WnIZX8DneUEWqX/d
         zmKy/1Fr6Y9fQ/4V4wQyAWnfH8gn1pDOQOb9c+KjgpCmh5NQw97yTGclf6GZAG/WNH3B
         efFOogMFwicTXYombvVpnUPq5JCPVVra6XPo6hhWsWJgpWUkoMrhvqDt144UhKJBOd6Q
         i53InHv/Gc8DbhOf9R4zv5aUNwH6Hrihp52y2TckynjGtEs3lC5DrgWwBrhlFWJ+JX3V
         iPYt7kseNWqTnsKUB2c4/B1AEWRz5X2fZ6XiFDwF/lDsO73Tb9d26PBBlPbjwcwq/mOx
         sWdQ==
X-Gm-Message-State: AOJu0Yz7G+FstUQA1OqeQZCalUrEwDU0prMGcQJy9DpNIh/d9B7TYzyt
	WZBMyfvdLLRyxu2l48HXoAMHB9up/NHY/VxLooaDnruWlsMjIMS7l/5e
X-Gm-Gg: ATEYQzzAqzT17QfHzYalTx4IfaY43zgrn/YFLMMGXve95pu/4Po2bcOZUOI25V6997I
	WcAejppageuKqlbXcvRj244rU+HExuNJ6po73AtCQL2ZjQN7WqY/74ydP2KBQhpXKGnhKKnwoMv
	CSM2nbO5H+7lIuCnvs5qrsBVepcrCtzzfJyhAiEpBHfyGryXoTytLN0+pvIlSg2K+gGiNW7rw0e
	I5rw0Pp2zJOUS6NA6paNHD2fO7CzmPu6+xaRCvPrWeV0Wv2+mxkUIrJb22MaFHktOi4wtSVxqnN
	QYIgf40wKT+VcEKTkzAfpEQuI6VRJOgjhcMppRFE7edbsMwjdBZFwjGUvgh6ApLwzD0HmXEEeWQ
	ygDwfQ15plGCOGxBrEjTVc0LncEGyHTwhpO1Ceoaln3vxGlDJBOiAWe/hiMuo/WeL34ic4zjIhm
	TznYF1LfyAwfh2jC8tDTNDaIPRO8BGrTZtTiXPo0N5SapmejsmyQnTEOVZO/FEMA==
X-Received: by 2002:ac2:5147:0:b0:5a2:afe8:78c4 with SMTP id 2adb3069b0e04-5a2afe87a15mr2585282e87.24.1774935527804;
        Mon, 30 Mar 2026 22:38:47 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838931a1sm19811531fa.26.2026.03.30.22.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 22:38:47 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v2 1/2] staging: rtl8723bs: rename global functions
Date: Tue, 31 Mar 2026 07:38:42 +0200
Message-ID: <20260331053843.108678-2-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331053843.108678-1-linus.probert@gmail.com>
References: <20260331053843.108678-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renames functions in rtw_efuse.h to conform to kernel coding style.

Problem was found using checkpath.pl tool.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 34 +++++++++----------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 33 ++++++++++--------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  2 +-
 drivers/staging/rtl8723bs/include/rtw_efuse.h | 12 +++----
 4 files changed, 43 insertions(+), 38 deletions(-)

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
index 191ffdf593d4..9da34606e5c6 100644
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
@@ -68,12 +68,12 @@ struct efuse_hal {
 	u8 fakeBTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN];
 };
 
-u8 Efuse_CalculateWordCnts(u8 word_en);
-u8 efuse_OneByteRead(struct adapter *padapter, u16 addr, u8 *data);
+u8 rtw_efuse_calculate_word_counts(u8 word_en);
+u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data);
 
-u8 EFUSE_Read1Byte(struct adapter *padapter, u16 Address);
-void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType);
-void EFUSE_ShadowRead(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value);
+u8 rtw_efuse_read_1_byte(struct adapter *padapter, u16 Address);
+void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType);
+void rtw_efuse_shadow_read(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value);
 void Rtw_Hal_ReadMACAddrFromFile(struct adapter *padapter);
 u32 Rtw_Hal_readPGDataFromConfigFile(struct adapter *padapter);
 
-- 
2.53.0

