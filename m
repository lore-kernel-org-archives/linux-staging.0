Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903198F66;
	Sat,  5 Apr 2025 03:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743822934; cv=none; b=CoGH/HMoq7XAN1zDSkrsrS4ocxTH6tj+KumATeHNiNGExuh8se3QgCp5JwZ5XJKn3pUMu6KKjVjttNcHyW3tJFoI9GE4jNbPrDtT2Z4299JGYLFL0DQTKkfKfjQJvSbSZZwBmm8AhBFI3nq5Yd22M+FwzYJ4XPUlFOvA803bL0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743822934; c=relaxed/simple;
	bh=DqkfnTvGY3dikIK5RXyBzB0lRrPjLMI23G+Tn5C5GA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VPae27Mq5Pv+sJCtiaoU8052Fw5hz7wpAs/UOaSQ9hRVSMpn8LR0m5kC5JtAXXNoBKqeRpbuyozfeIEaZ8PuEydW6Fj7v7drxRvngYwCTsiF7gbK5nA+Nnt5tfns0QR55fLOInq3y/vwlTPL0k0khNyTKvpvf6MRpE1rKzP4yZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TFEFQVGT; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFEFQVGT"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so2322337f8f.1;
        Fri, 04 Apr 2025 20:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743822930; x=1744427730; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FkfZ0gGwuC9nrH0UyIrZgSM/LrDfC8j2fxcG7p/eqyM=;
        b=TFEFQVGTBwKNcomrwH1Cl7/c1m5zsrKXNyCZAJo3MBG7nvLecaC8wXVK2uSBJS5+/O
         LAUFjUoAFV751rZ2MFMwoO67jsOAIgNY4NwsHHNskAcETxj2pLoS9e5XvEX+QpHFKg50
         bRnrv7GUFHDnlhZ95kYKRv5UFNw3ILEhzD/3aIuY9G/UG4Cs5E1QwITbrJsGlEbdk2xX
         QVqkuINhymvJJSmU1FPmkGKj5R9uhM+0nFxoa9V02PRkhg8QCjMqRO7K49dUOJFj+lOb
         zHHhGXUIPsxJ6EfJFqK919CWRFiVxGHFTUn/oxsyoxagGbZe/JNzoaEDbTVWwDy7iRnt
         96Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743822930; x=1744427730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FkfZ0gGwuC9nrH0UyIrZgSM/LrDfC8j2fxcG7p/eqyM=;
        b=E1NGA08RhATPuXFYrVIvfHPM0VQYkziXk4zUNCG8Al6du2fO1cEkBDYwcitreRq1bF
         gC5iz43JeOD3QuLYfu30kt2r/JAt9zlFAV0sRmrTaOZiuZqreXCyM04mlF8IIyhdSlLo
         dw+r4KWwh+0T4WOB4ppyifxh6JrN923TJ71XDMo+DhfEldcyAYltgcDt7rZhtzbbOkGf
         dHvVgJQk5uRSsx4beoKPwW4hXmyA8tfvtU+8T2r+hQi33A+Y4SE0pZZwq8+R+5/J8eAR
         uXpkohFmC1ILdSsNT0obUv+Mmd3vlGjewRNTL22SSf3tHHOFpQLP4FrDh91irDES4U7W
         yKQw==
X-Forwarded-Encrypted: i=1; AJvYcCW2UDVnX7ruamiYKYQAcbQxeZpdd45NjkCool7CGVD7V5Qfrh7XN61/DmQhcUM1/86zWJcutYpltqs9@lists.linux.dev, AJvYcCWyG4sM7dCaGbJA55QOBekmPmdJ4sT9ubxFNBFxBQjipbhovTBbPm6y5G1cn3T/WZOswGNkp58nuBOYaeU+@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6PFe4n6byToboT3e9XPqX0KPomJ6hnsSXpeBgIU5bFb7iem7H
	cwdcSxzEQlAZgCwNmbK7rXHhD0J3FoaVqyLYX0BVzXv5PRbTPFn6
X-Gm-Gg: ASbGnctxGd28p2Z1luIFv9f9AMsXWIupJMvIxcwGJc+XfOlfRnZBBfhIf73RV+6XWL6
	OHqdEuTNgf6r3id6p8YFhyMPDlthvnW+fRuoBYHccHFLYWxwoaMR7bzN7T/DnLThXkjxk6xPKEL
	C3ucQaBKRWsWr0EvGSszRQNiMi6N7t1BzsK2iBBxHnauGd7yoTBteBtbbDdUf73zHZVusJ4J4Ru
	w4Ex4Zmd2s+Gttoswf5kRH17GOy6aQM/kHhFw3h66s18ax4rZhnrqGhezIQzRvmX/ytgUPa6S7Z
	oEOqQdq14pNncEjgCSQv+y8zxg1+px8uj0z7LMP2LB3wDgg+fEUb
X-Google-Smtp-Source: AGHT+IGYaJeqkHE71ISzt7wJyM7edL7dK9X0c2f4W4Zz+pR/RA7K/xFBMwyGm+IBnQlGXrpqSpFQgg==
X-Received: by 2002:a5d:584a:0:b0:39c:dcc:fa29 with SMTP id ffacd0b85a97d-39cba932a65mr4847133f8f.17.1743822929566;
        Fri, 04 Apr 2025 20:15:29 -0700 (PDT)
Received: from pc.. ([197.232.62.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d6b1sm5832250f8f.62.2025.04.04.20.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 20:15:28 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] staging: rtl8723bs: Optimize variable initialization in rtl8723b_hal_init.c
Date: Sat,  5 Apr 2025 06:14:48 +0300
Message-ID: <f7b63d834b98aedfe2ce277d8008d7e398ea29ba.1743820815.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743820815.git.karanja99erick@gmail.com>
References: <cover.1743820815.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Optimize variable initialization by integrating the initialization
directly into the variable declaration in cases where the initialization
is simple and doesn't depend on other variables or complex expressions.
This makes the code more concise and readable.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 155 +++++-------------
 1 file changed, 41 insertions(+), 114 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index e15ec6452fd0..1e980b291e90 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -152,13 +152,12 @@ static int _WriteFW(struct adapter *padapter, void *buffer, u32 size)
 void _8051Reset8723(struct adapter *padapter)
 {
 	u8 cpu_rst;
-	u8 io_rst;
+	u8 io_rst = rtw_read8(padapter, REG_RSV_CTRL + 1);
 
 
 	/*  Reset 8051(WLMCU) IO wrapper */
 	/*  0x1c[8] = 0 */
 	/*  Suggested by Isaac@SD1 and Gimmy@SD1, coding by Lucas@20130624 */
-	io_rst = rtw_read8(padapter, REG_RSV_CTRL+1);
 	io_rst &= ~BIT(0);
 	rtw_write8(padapter, REG_RSV_CTRL+1, io_rst);
 
@@ -218,11 +217,10 @@ u8 g_fwdl_wintint_rdy_fail;
 static s32 _FWFreeToGo(struct adapter *adapter, u32 min_cnt, u32 timeout_ms)
 {
 	s32 ret = _FAIL;
-	u32 value32;
+	u32 value32 = rtw_read32(adapter, REG_MCUFWDL);
 	unsigned long start = jiffies;
 	u32 cnt = 0;
 
-	value32 = rtw_read32(adapter, REG_MCUFWDL);
 	value32 |= MCUFWDL_RDY;
 	value32 &= ~WINTINI_RDY;
 	rtw_write32(adapter, REG_MCUFWDL, value32);
@@ -501,8 +499,7 @@ void Hal_GetEfuseDefinition(
 	switch (type) {
 	case TYPE_EFUSE_MAX_SECTION:
 		{
-			u8 *pMax_section;
-			pMax_section = pOut;
+			u8 *pMax_section = pOut;
 
 			if (efuseType == EFUSE_WIFI)
 				*pMax_section = EFUSE_MAX_SECTION_8723B;
@@ -513,8 +510,7 @@ void Hal_GetEfuseDefinition(
 
 	case TYPE_EFUSE_REAL_CONTENT_LEN:
 		{
-			u16 *pu2Tmp;
-			pu2Tmp = pOut;
+			u16 *pu2Tmp = pOut;
 
 			if (efuseType == EFUSE_WIFI)
 				*pu2Tmp = EFUSE_REAL_CONTENT_LEN_8723B;
@@ -525,8 +521,7 @@ void Hal_GetEfuseDefinition(
 
 	case TYPE_AVAILABLE_EFUSE_BYTES_BANK:
 		{
-			u16 *pu2Tmp;
-			pu2Tmp = pOut;
+			u16 *pu2Tmp = pOut;
 
 			if (efuseType == EFUSE_WIFI)
 				*pu2Tmp = (EFUSE_REAL_CONTENT_LEN_8723B-EFUSE_OOB_PROTECT_BYTES);
@@ -537,8 +532,7 @@ void Hal_GetEfuseDefinition(
 
 	case TYPE_AVAILABLE_EFUSE_BYTES_TOTAL:
 		{
-			u16 *pu2Tmp;
-			pu2Tmp = pOut;
+			u16 *pu2Tmp = pOut;
 
 			if (efuseType == EFUSE_WIFI)
 				*pu2Tmp = (EFUSE_REAL_CONTENT_LEN_8723B-EFUSE_OOB_PROTECT_BYTES);
@@ -549,8 +543,7 @@ void Hal_GetEfuseDefinition(
 
 	case TYPE_EFUSE_MAP_LEN:
 		{
-			u16 *pu2Tmp;
-			pu2Tmp = pOut;
+			u16 *pu2Tmp = pOut;
 
 			if (efuseType == EFUSE_WIFI)
 				*pu2Tmp = EFUSE_MAX_MAP_LEN;
@@ -561,8 +554,7 @@ void Hal_GetEfuseDefinition(
 
 	case TYPE_EFUSE_PROTECT_BYTES_BANK:
 		{
-			u8 *pu1Tmp;
-			pu1Tmp = pOut;
+			u8 *pu1Tmp = pOut;
 
 			if (efuseType == EFUSE_WIFI)
 				*pu1Tmp = EFUSE_OOB_PROTECT_BYTES;
@@ -573,8 +565,7 @@ void Hal_GetEfuseDefinition(
 
 	case TYPE_EFUSE_CONTENT_LEN_BANK:
 		{
-			u16 *pu2Tmp;
-			pu2Tmp = pOut;
+			u16 *pu2Tmp = pOut;
 
 			if (efuseType == EFUSE_WIFI)
 				*pu2Tmp = EFUSE_REAL_CONTENT_LEN_8723B;
@@ -585,8 +576,7 @@ void Hal_GetEfuseDefinition(
 
 	default:
 		{
-			u8 *pu1Tmp;
-			pu1Tmp = pOut;
+			u8 *pu1Tmp = pOut;
 			*pu1Tmp = 0;
 		}
 		break;
@@ -729,10 +719,9 @@ static void hal_ReadEFuse_WiFi(
 		}
 
 		if (offset < EFUSE_MAX_SECTION_8723B) {
-			u16 addr;
+			u16 addr = offset * PGPKT_DATA_SIZE;
 			/*  Get word enable value from PG header */
 
-			addr = offset * PGPKT_DATA_SIZE;
 			for (i = 0; i < EFUSE_MAX_WORD_UNIT; i++) {
 				/*  Check word enable condition in the section */
 				if (!(wden & (0x01<<i))) {
@@ -835,9 +824,8 @@ static void hal_ReadEFuse_BT(
 			}
 
 			if (offset < EFUSE_BT_MAX_SECTION) {
-				u16 addr;
+				u16 addr = offset * PGPKT_DATA_SIZE;
 
-				addr = offset * PGPKT_DATA_SIZE;
 				for (i = 0; i < EFUSE_MAX_WORD_UNIT; i++) {
 					/*  Check word enable condition in the section */
 					if (!(wden & (0x01<<i))) {
@@ -1153,14 +1141,10 @@ static u8 Hal_EfuseWordEnableDataWrite(
 
 static struct hal_version ReadChipVersion8723B(struct adapter *padapter)
 {
-	u32 value32;
+	u32 value32 = rtw_read32(padapter, REG_SYS_CFG);
 	struct hal_version ChipVersion;
-	struct hal_com_data *pHalData;
-
-/* YJ, TODO, move read chip type here */
-	pHalData = GET_HAL_DATA(padapter);
+	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 
-	value32 = rtw_read32(padapter, REG_SYS_CFG);
 	ChipVersion.ICType = CHIP_8723B;
 	ChipVersion.ChipType = ((value32 & RTL_ID) ? TEST_CHIP : NORMAL_CHIP);
 	ChipVersion.VendorType = ((value32 & VENDOR_ID) ? CHIP_VENDOR_UMC : CHIP_VENDOR_TSMC);
@@ -1196,10 +1180,9 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 	u16 val16;
-	u8 val8;
+	u8 val8 = DIS_TSF_UDT;
 
 
-	val8 = DIS_TSF_UDT;
 	val16 = val8 | (val8 << 8); /*  port0 and port1 */
 
 	/*  Enable prot0 beacon function for PSTDMA */
@@ -1287,22 +1270,7 @@ void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
 	u32 value32;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
-	u32 bcn_ctrl_reg;
-
-	/* reset TSF, enable update TSF, correcting TSF On Beacon */
-
-	/* REG_BCN_INTERVAL */
-	/* REG_BCNDMATIM */
-	/* REG_ATIMWND */
-	/* REG_TBTT_PROHIBIT */
-	/* REG_DRVERLYINT */
-	/* REG_BCN_MAX_ERR */
-	/* REG_BCNTCFG (0x510) */
-	/* REG_DUAL_TSF_RST */
-	/* REG_BCN_CTRL (0x550) */
-
-
-	bcn_ctrl_reg = REG_BCN_CTRL;
+	u32 bcn_ctrl_reg = REG_BCN_CTRL;
 
 	/*  */
 	/*  ATIM window */
@@ -1416,9 +1384,7 @@ void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 
 void rtl8723b_InitAntenna_Selection(struct adapter *padapter)
 {
-	u8 val;
-
-	val = rtw_read8(padapter, REG_LEDCFG2);
+	u8 val = rtw_read8(padapter, REG_LEDCFG2);
 	/*  Let 8051 take control antenna setting */
 	val |= BIT(7); /*  DPDT_SEL_EN, 0x4C[23] */
 	rtw_write8(padapter, REG_LEDCFG2, val);
@@ -1426,14 +1392,10 @@ void rtl8723b_InitAntenna_Selection(struct adapter *padapter)
 
 void rtl8723b_init_default_value(struct adapter *padapter)
 {
-	struct hal_com_data *pHalData;
-	struct dm_priv *pdmpriv;
+	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
+	struct dm_priv *pdmpriv = &pHalData->dmpriv;
 	u8 i;
 
-
-	pHalData = GET_HAL_DATA(padapter);
-	pdmpriv = &pHalData->dmpriv;
-
 	padapter->registrypriv.wireless_mode = WIRELESS_11BG_24N;
 
 	/*  init default value */
@@ -1478,9 +1440,7 @@ void rtl8723b_init_default_value(struct adapter *padapter)
 u8 GetEEPROMSize8723B(struct adapter *padapter)
 {
 	u8 size = 0;
-	u32 cr;
-
-	cr = rtw_read16(padapter, REG_9346CR);
+	u32 cr = rtw_read16(padapter, REG_9346CR);
 	/*  6: EEPROM used is 93C46, 4: boot from E-Fuse. */
 	size = (cr & BOOT_FROM_EEPROM) ? 6 : 4;
 
@@ -1495,13 +1455,9 @@ u8 GetEEPROMSize8723B(struct adapter *padapter)
 s32 rtl8723b_InitLLTTable(struct adapter *padapter)
 {
 	unsigned long start, passing_time;
-	u32 val32;
-	s32 ret;
-
-
-	ret = _FAIL;
+	u32 val32 = rtw_read32(padapter, REG_AUTO_LLT);
+	s32 ret = _FAIL;
 
-	val32 = rtw_read32(padapter, REG_AUTO_LLT);
 	val32 |= BIT_AUTO_INIT_LLT;
 	rtw_write32(padapter, REG_AUTO_LLT, val32);
 
@@ -1559,11 +1515,10 @@ void Hal_EfuseParseIDCode(struct adapter *padapter, u8 *hwinfo)
 {
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
 /* 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter); */
-	u16 EEPROMId;
+	u16 EEPROMId = le16_to_cpu(*((__le16 *)hwinfo));
 
 
 	/*  Check 0x8129 again for making sure autoload status!! */
-	EEPROMId = le16_to_cpu(*((__le16 *)hwinfo));
 	if (EEPROMId != RTL_EEPROM_ID) {
 		pEEPROM->bautoload_fail_flag = true;
 	} else
@@ -2273,9 +2228,8 @@ void rtl8723b_fill_fake_txdesc(
 	/*  Encrypt the data frame if under security mode excepct null data. Suggested by CCW. */
 	/*  */
 	if (bDataFrame) {
-		u32 EncAlg;
+		u32 EncAlg = padapter->securitypriv.dot11PrivacyAlgrthm;
 
-		EncAlg = padapter->securitypriv.dot11PrivacyAlgrthm;
 		switch (EncAlg) {
 		case _NO_PRIVACY_:
 			SET_TX_DESC_SEC_TYPE_8723B(pDesc, 0x0);
@@ -2378,9 +2332,7 @@ static void hw_var_set_opmode(struct adapter *padapter, u8 variable, u8 *val)
 static void hw_var_set_macaddr(struct adapter *padapter, u8 variable, u8 *val)
 {
 	u8 idx = 0;
-	u32 reg_macid;
-
-	reg_macid = REG_MACID;
+	u32 reg_macid = REG_MACID;
 
 	for (idx = 0 ; idx < 6; idx++)
 		rtw_write8(GET_PRIMARY_ADAPTER(padapter), (reg_macid+idx), val[idx]);
@@ -2389,9 +2341,7 @@ static void hw_var_set_macaddr(struct adapter *padapter, u8 variable, u8 *val)
 static void hw_var_set_bssid(struct adapter *padapter, u8 variable, u8 *val)
 {
 	u8 idx = 0;
-	u32 reg_bssid;
-
-	reg_bssid = REG_BSSID;
+	u32 reg_bssid = REG_BSSID;
 
 	for (idx = 0 ; idx < 6; idx++)
 		rtw_write8(padapter, (reg_bssid+idx), val[idx]);
@@ -2399,15 +2349,12 @@ static void hw_var_set_bssid(struct adapter *padapter, u8 variable, u8 *val)
 
 static void hw_var_set_bcn_func(struct adapter *padapter, u8 variable, u8 *val)
 {
-	u32 bcn_ctrl_reg;
-
-	bcn_ctrl_reg = REG_BCN_CTRL;
+	u32 bcn_ctrl_reg = REG_BCN_CTRL;
 
 	if (*(u8 *)val)
 		rtw_write8(padapter, bcn_ctrl_reg, (EN_BCN_FUNCTION | EN_TXBCN_RPT));
 	else {
-		u8 val8;
-		val8 = rtw_read8(padapter, bcn_ctrl_reg);
+		u8 val8 = rtw_read8(padapter, bcn_ctrl_reg);
 		val8 &= ~(EN_BCN_FUNCTION | EN_TXBCN_RPT);
 
 		/*  Always enable port0 beacon function for PSTDMA */
@@ -2422,12 +2369,8 @@ static void hw_var_set_correct_tsf(struct adapter *padapter, u8 variable, u8 *va
 {
 	u8 val8;
 	u64 tsf;
-	struct mlme_ext_priv *pmlmeext;
-	struct mlme_ext_info *pmlmeinfo;
-
-
-	pmlmeext = &padapter->mlmeextpriv;
-	pmlmeinfo = &pmlmeext->mlmext_info;
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	tsf = pmlmeext->TSFValue-do_div(pmlmeext->TSFValue, (pmlmeinfo->bcn_interval*1024))-1024; /* us */
 
@@ -2479,17 +2422,11 @@ static void hw_var_set_mlme_disconnect(struct adapter *padapter, u8 variable, u8
 
 static void hw_var_set_mlme_sitesurvey(struct adapter *padapter, u8 variable, u8 *val)
 {
-	u32 value_rcr, rcr_clear_bit, reg_bcn_ctl;
+	u32 value_rcr, rcr_clear_bit, reg_bcn_ctl = REG_BCN_CTRL;
 	u16 value_rxfltmap2;
 	u8 val8;
-	struct hal_com_data *pHalData;
-	struct mlme_priv *pmlmepriv;
-
-
-	pHalData = GET_HAL_DATA(padapter);
-	pmlmepriv = &padapter->mlmepriv;
-
-	reg_bcn_ctl = REG_BCN_CTRL;
+	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	rcr_clear_bit = RCR_CBSSID_BCN;
 
@@ -2543,15 +2480,12 @@ static void hw_var_set_mlme_join(struct adapter *padapter, u8 variable, u8 *val)
 	u8 val8;
 	u16 val16;
 	u32 val32;
-	u8 RetryLimit;
-	u8 type;
-	struct mlme_priv *pmlmepriv;
+	u8 RetryLimit = 0x30;
+	u8 type = *(u8 *)val;
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct eeprom_priv *pEEPROM;
 
 
-	RetryLimit = 0x30;
-	type = *(u8 *)val;
-	pmlmepriv = &padapter->mlmepriv;
 	pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
 
 	if (type == 0) { /*  prepare to join */
@@ -2779,8 +2713,7 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 
 	case HW_VAR_CHECK_BSSID:
 		{
-			u32 val32;
-			val32 = rtw_read32(padapter, REG_RCR);
+			u32 val32 = rtw_read32(padapter, REG_RCR);
 			if (*val)
 				val32 |= RCR_CBSSID_DATA|RCR_CBSSID_BCN;
 			else
@@ -2850,12 +2783,11 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 
 	case HW_VAR_ACK_PREAMBLE:
 		{
-			u8 regTmp;
+			u8 regTmp = 0;
 			u8 bShortPreamble = *val;
 
 			/*  Joseph marked out for Netgear 3500 TKIP channel 7 issue.(Temporarily) */
 			/* regTmp = (pHalData->nCur40MhzPrimeSC)<<5; */
-			regTmp = 0;
 			if (bShortPreamble)
 				regTmp |= 0x80;
 			rtw_write8(padapter, REG_RRSR+2, regTmp);
@@ -3226,9 +3158,7 @@ void GetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
  */
 u8 SetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, void *pval)
 {
-	u8 bResult;
-
-	bResult = _SUCCESS;
+	u8 bResult = _SUCCESS;
 
 	switch (variable) {
 	default:
@@ -3244,9 +3174,7 @@ u8 SetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, v
  */
 u8 GetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, void *pval)
 {
-	u8 bResult;
-
-	bResult = _SUCCESS;
+	u8 bResult = _SUCCESS;
 
 	switch (variable) {
 	case HAL_DEF_MAX_RECVBUF_SZ:
@@ -3281,9 +3209,8 @@ u8 GetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, v
 	case HW_DEF_RA_INFO_DUMP:
 		{
 			u8 mac_id = *(u8 *)pval;
-			u32 cmd;
+			u32 cmd = 0x40000100 | mac_id;
 
-			cmd = 0x40000100 | mac_id;
 			rtw_write32(padapter, REG_HMEBOX_DBG_2_8723B, cmd);
 			msleep(10);
 			rtw_read32(padapter, 0x2F0);	// info 1
-- 
2.43.0

