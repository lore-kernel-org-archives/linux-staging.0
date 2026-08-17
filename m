Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F19E442FDE
	for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 15:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786981578; cv=none; b=j8jhsjN4+HHoX1rS2ROZSgYlKTUmAld0fjGnDrpkrtx2y7cyZ38pHcgcCnSzwD+Hf/O9RRZsZ8RDbBcszvhSmZrj81D+3N/i5NyGsHotjLpcCSZxW5AWbEIGKvX6Td+d6lyvH4mz74PWCStpx+dt39sHcoaTE6Oq4mfpviA2Eec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786981578; c=relaxed/simple;
	bh=fct7YRnWgARxx1I/WreV389DDBHqu5eSjVTb1oamc3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=koVW4iNIHPIEd5WrPT3ho0CseuwAuATYrWv4BjvHp1lWCPzBcTcpOHrqpD6iXtHOHj8JpiCgUi678lN7IbHbdb5W6s9KpMg3xpVkarvSwOrDvOC/vGD3kptekYl/MfWBgC9uzL+owWKkHdfRsVBRVkNHFp2nBI1GWpj0tSKi5l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDtYOR9k; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDtYOR9k"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so3083949e87.2
        for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 08:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786981571; x=1787586371; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ss03K2Y3OPmIpRMBLQFW3Gbod8A3222sw4hXM/Va27Q=;
        b=NDtYOR9kIBQhNUoyCq2x45Y3MCMr1+SM0GQsrAweyPckCoqUOBGytlV9pDefIuPRb1
         KtprLb/c4GMrd7R/kEdp7rnuBcuS3Yg4Zw8+5Vo20SazW/YgD7H/H0gvpsEQAeszUzl3
         V2f/jXR7GdWxPUeqKxgNuN87CkJPtEaw/+Dxb5JEv+8MeakxG4+WQDBu8URfkmX0M4Gi
         g/F5i+9Lm6PqQ4aOrszX9FBIdgA7iAmFaogDBtZQSeWIsD6oSaH+YSvHIHcTVTAAyKfL
         dqO3qB+Rp8gl7Ea0P5lkqkhwkufzzzNy9ZLfKeHdV09wEQlsKKYIDAGlGoqvBfSpww6j
         Vxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786981571; x=1787586371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ss03K2Y3OPmIpRMBLQFW3Gbod8A3222sw4hXM/Va27Q=;
        b=Z99Z1qSKgivc/qj954apKP82Ak5ogMkVaCPDqX4tQ6MUmSF0A5z2z0DhHgmFd2sAOg
         LcS1OaudHw5ZAmiDvA2Cq3Ta/uXC2qBfGK6wNej+q2Qnd/cCo0isIl0yV3IQmT2sgqFQ
         wsWiu/fW6cmKciCx+6FNfvUuNC38Lx1j7ObXkp1eo9feakbhwM0a2mx6W1RYrJWxA+fB
         ZUK+h6IM8oiekCqJVGXS1ETXQP35GUuUkaaERajVz7ucvGOz7XrMlHsyE28OPO0U4I+8
         KAosqOZJhdZPxHrX+ixUDT9gXtDMwzO6DChzkBTZBTpXDukbuGp6DoM991VzWHzvcOYc
         iqIw==
X-Gm-Message-State: AOJu0YxpPyYIewLhLFrSUqGbLlC22QyMq1Cg/ATWD6TOWQdjsdKDTL/T
	6oWiwQs48kdXN/EGXwt7uBK3fla1oXUWbb/TXPMKuk1Y0poIYAn9MvWc
X-Gm-Gg: AR+sD11DUlUuiXOt48d7e+kvpfByiqP8zN0icOMZsvDtQyLFhcRGtlgCynHZzlzUjMe
	nQjOblK8A87LubqomprDsS+CemsFx/Z3SaPj3sJmeCgW6TJyiJEQAw3JF80r5caTpY1SxVIXB/u
	EieAql7lnxf5xlyYeiSZNh7kF9HH8zXTo5o5jRUqSavn+iwc9W1pLBEYuLLGWzXjpwi2J5BZvec
	Fyc7nGvQc9YFV0hirSZ4Jdw9dLE9IN2EWpxWeI7GEopBosyFGwTVVdKULA/VucLuY2HsMT1wPzf
	uDAYU1BgUkqkJF9ScrY8xgMEUs7xhxoTcN5NwcodD/A2NxLBXSOwkTdXgSDr8mt8pNOixUdtk8w
	L7rAXGhekBkXfrMDo593mGft3jW+aTO2Ig4RYh3JGnpWbSm/qnBODUcoIYK/cijdH/ETVdJ/nhK
	FFrpCKZmESLo5hsrb0aHW0GfCnawePXNy4er0gphIbn158O7+n1ctiG960ZFnq/ney0LJVqlDTr
	a74cGK09J15K+GjTiUhOOysjDVvcRM=
X-Received: by 2002:a05:6512:2341:b0:5b2:f453:1073 with SMTP id 2adb3069b0e04-5b45915e5c8mr4945718e87.2.1786981570425;
        Mon, 17 Aug 2026 08:46:10 -0700 (PDT)
Received: from burk (46-162-75-122.cust.bredband2.com. [46.162.75.122])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b0de90fsm5666791fa.11.2026.08.17.08.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 08:46:07 -0700 (PDT)
From: Philip Nielsen <philipnielsen64@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Philip Nielsen <philipnielsen64@gmail.com>
Subject: [PATCH] staging: rtl8723bs: avoid CamelCase in rtw_efuse
Date: Mon, 17 Aug 2026 17:45:55 +0200
Message-ID: <20260817154555.81451-1-philipnielsen64@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid CamelCase naming for local variables, function parameters,
and static helper functions in rtw_efuse.c as well as associated
prototypes in rtw_efuse.h to adhere to the Linux
kernel coding style and clear checkpatch.pl checks.

Signed-off-by: Philip Nielsen <philipnielsen64@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 120 +++++++++---------
 drivers/staging/rtl8723bs/include/rtw_efuse.h |   6 +-
 2 files changed, 63 insertions(+), 63 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 168ecb7a998f..8e795f23899f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -41,48 +41,48 @@ rtw_efuse_calculate_word_counts(u8 word_en)
  * 09/23/2008	MHC		Copy from WMAC.
  *
  */
-u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
+u8 rtw_efuse_read_1_byte(struct adapter *adapter, u16 address)
 {
-	u8 Bytetemp = {0x00};
+	u8 byte_temp = {0x00};
 	u8 temp = {0x00};
 	u32 k = 0;
-	u16 contentLen = 0;
+	u16 content_len = 0;
 
-	Hal_GetEfuseDefinition(Adapter, EFUSE_WIFI, TYPE_EFUSE_REAL_CONTENT_LEN, &contentLen);
+	Hal_GetEfuseDefinition(adapter, EFUSE_WIFI, TYPE_EFUSE_REAL_CONTENT_LEN, &content_len);
 
-	if (Address < contentLen) {/* E-fuse 512Byte */
+	if (address < content_len) {/* E-fuse 512Byte */
 		/* Write E-fuse Register address bit0~7 */
-		temp = Address & 0xFF;
-		rtw_write8(Adapter, EFUSE_CTRL + 1, temp);
-		Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 2);
+		temp = address & 0xFF;
+		rtw_write8(adapter, EFUSE_CTRL + 1, temp);
+		byte_temp = rtw_read8(adapter, EFUSE_CTRL + 2);
 		/* Write E-fuse Register address bit8~9 */
-		temp = ((Address >> 8) & 0x03) | (Bytetemp & 0xFC);
-		rtw_write8(Adapter, EFUSE_CTRL + 2, temp);
+		temp = ((address >> 8) & 0x03) | (byte_temp & 0xFC);
+		rtw_write8(adapter, EFUSE_CTRL + 2, temp);
 
 		/* Write 0x30[31]= 0 */
-		Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 3);
-		temp = Bytetemp & 0x7F;
-		rtw_write8(Adapter, EFUSE_CTRL + 3, temp);
+		byte_temp = rtw_read8(adapter, EFUSE_CTRL + 3);
+		temp = byte_temp & 0x7F;
+		rtw_write8(adapter, EFUSE_CTRL + 3, temp);
 
 		/* Wait Write-ready (0x30[31]= 1) */
-		Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 3);
-		while (!(Bytetemp & 0x80)) {
-			Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 3);
+		byte_temp = rtw_read8(adapter, EFUSE_CTRL + 3);
+		while (!(byte_temp & 0x80)) {
+			byte_temp = rtw_read8(adapter, EFUSE_CTRL + 3);
 			k++;
 			if (k == 1000)
 				break;
 		}
-		return rtw_read8(Adapter, EFUSE_CTRL);
+		return rtw_read8(adapter, EFUSE_CTRL);
 	} else {
 		return 0xFF;
 	}
 } /* rtw_efuse_read_1_byte */
 
-/*  11/16/2008 MH Read one byte from real Efuse. */
+/*  11/16/2008 MH Read one byte from real efuse. */
 u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data)
 {
 	u32 tmpidx = 0;
-	u8 bResult;
+	u8 b_result;
 	u8 readbyte;
 
 	/*  <20130121, Kordan> For SMIC EFUSE specificatoin. */
@@ -107,19 +107,19 @@ u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data)
 	}
 	if (tmpidx < 100) {
 		*data = rtw_read8(padapter, EFUSE_CTRL);
-		bResult = true;
+		b_result = true;
 	} else {
 		*data = 0xff;
-		bResult = false;
+		b_result = false;
 	}
 
-	return bResult;
+	return b_result;
 }
 
 /*-----------------------------------------------------------------------------
- * Function:	Efuse_ReadAllMap
+ * Function:	efuse_read_all_map
  *
- * Overview:	Read All Efuse content
+ * Overview:	Read All efuse content
  *
  * Input:       NONE
  *
@@ -132,23 +132,23 @@ u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data)
  * 11/11/2008	MHC		Create Version 0.
  *
  */
-static void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse)
+static void efuse_read_all_map(struct adapter *padapter, u8 efuse_type, u8 *efuse)
 {
-	u16 mapLen = 0;
+	u16 map_len = 0;
 
 	Hal_EfusePowerSwitch(padapter, true);
 
-	Hal_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, &mapLen);
+	Hal_GetEfuseDefinition(padapter, efuse_type, TYPE_EFUSE_MAP_LEN, &map_len);
 
-	Hal_ReadEFuse(padapter, efuseType, 0, mapLen, Efuse);
+	Hal_ReadEFuse(padapter, efuse_type, 0, map_len, efuse);
 
 	Hal_EfusePowerSwitch(padapter, false);
 }
 
 /*-----------------------------------------------------------------------------
- * Function:	efuse_ShadowRead1Byte
- *		efuse_ShadowRead2Byte
- *		efuse_ShadowRead4Byte
+ * Function:	efuse_shadow_read_1byte
+ *		efuse_shadow_read_2byte
+ *		efuse_shadow_read_4byte
  *
  * Overview:	Read from efuse init map by one/two/four bytes !!!!!
  *
@@ -163,35 +163,35 @@ static void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse)
  * 11/12/2008	MHC		Create Version 0.
  *
  */
-static void efuse_ShadowRead1Byte(struct adapter *padapter, u16 Offset, u8 *Value)
+static void efuse_shadow_read_1byte(struct adapter *padapter, u16 offset, u8 *value)
 {
-	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
+	struct eeprom_priv *eeprom = GET_EEPROM_EFUSE_PRIV(padapter);
 
-	*Value = pEEPROM->efuse_eeprom_data[Offset];
+	*value = eeprom->efuse_eeprom_data[offset];
 
 }	/*  EFUSE_ShadowRead1Byte */
 
 /* Read Two Bytes */
-static void efuse_ShadowRead2Byte(struct adapter *padapter, u16 Offset, u16 *Value)
+static void efuse_shadow_read_2byte(struct adapter *padapter, u16 offset, u16 *value)
 {
-	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
+	struct eeprom_priv *eeprom = GET_EEPROM_EFUSE_PRIV(padapter);
 
-	*Value = pEEPROM->efuse_eeprom_data[Offset];
-	*Value |= pEEPROM->efuse_eeprom_data[Offset + 1] << 8;
+	*value = eeprom->efuse_eeprom_data[offset];
+	*value |= eeprom->efuse_eeprom_data[offset + 1] << 8;
 
 }	/*  EFUSE_ShadowRead2Byte */
 
 /* Read Four Bytes */
-static void efuse_ShadowRead4Byte(struct adapter *padapter, u16 Offset, u32 *Value)
+static void efuse_shadow_read_4byte(struct adapter *padapter, u16 offset, u32 *value)
 {
-	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
+	struct eeprom_priv *eeprom = GET_EEPROM_EFUSE_PRIV(padapter);
 
-	*Value = pEEPROM->efuse_eeprom_data[Offset];
-	*Value |= pEEPROM->efuse_eeprom_data[Offset + 1] << 8;
-	*Value |= pEEPROM->efuse_eeprom_data[Offset + 2] << 16;
-	*Value |= pEEPROM->efuse_eeprom_data[Offset + 3] << 24;
+	*value = eeprom->efuse_eeprom_data[offset];
+	*value |= eeprom->efuse_eeprom_data[offset + 1] << 8;
+	*value |= eeprom->efuse_eeprom_data[offset + 2] << 16;
+	*value |= eeprom->efuse_eeprom_data[offset + 3] << 24;
 
-}	/*  efuse_ShadowRead4Byte */
+}	/*  efuse_shadow_read_4byte */
 
 /*-----------------------------------------------------------------------------
  * Function:	rtw_efuse_shadow_map_update
@@ -209,20 +209,20 @@ static void efuse_ShadowRead4Byte(struct adapter *padapter, u16 Offset, u32 *Val
  * 11/13/2008	MHC		Create Version 0.
  *
  */
-void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType)
+void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuse_type)
 {
-	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
-	u16 mapLen = 0;
+	struct eeprom_priv *eeprom = GET_EEPROM_EFUSE_PRIV(padapter);
+	u16 map_len = 0;
 
-	Hal_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, &mapLen);
+	Hal_GetEfuseDefinition(padapter, efuse_type, TYPE_EFUSE_MAP_LEN, &map_len);
 
-	if (pEEPROM->bautoload_fail_flag)
-		memset(pEEPROM->efuse_eeprom_data, 0xFF, mapLen);
+	if (eeprom->bautoload_fail_flag)
+		memset(eeprom->efuse_eeprom_data, 0xFF, map_len);
 	else
-		Efuse_ReadAllMap(padapter, efuseType, pEEPROM->efuse_eeprom_data);
+		efuse_read_all_map(padapter, efuse_type, eeprom->efuse_eeprom_data);
 
 	/* PlatformMoveMemory((void *)&pHalData->EfuseMap[EFUSE_MODIFY_MAP][0], */
-	/* void *)&pHalData->EfuseMap[EFUSE_INIT_MAP][0], mapLen); */
+	/* void *)&pHalData->EfuseMap[EFUSE_INIT_MAP][0], map_len); */
 } /*  rtw_efuse_shadow_map_update */
 
 /*-----------------------------------------------------------------------------
@@ -241,13 +241,13 @@ void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType)
  * 11/12/2008	MHC		Create Version 0.
  *
  */
-void rtw_efuse_shadow_read(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value)
+void rtw_efuse_shadow_read(struct adapter *padapter, u8 type, u16 offset, u32 *value)
 {
-	if (Type == 1)
-		efuse_ShadowRead1Byte(padapter, Offset, (u8 *)Value);
-	else if (Type == 2)
-		efuse_ShadowRead2Byte(padapter, Offset, (u16 *)Value);
-	else if (Type == 4)
-		efuse_ShadowRead4Byte(padapter, Offset, (u32 *)Value);
+	if (type == 1)
+		efuse_shadow_read_1byte(padapter, offset, (u8 *)value);
+	else if (type == 2)
+		efuse_shadow_read_2byte(padapter, offset, (u16 *)value);
+	else if (type == 4)
+		efuse_shadow_read_4byte(padapter, offset, (u32 *)value);
 
 } /* rtw_efuse_shadow_read*/
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 808ba94a5998..d1b518be3b7d 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -71,8 +71,8 @@ struct efuse_hal {
 u8 rtw_efuse_calculate_word_counts(u8 word_en);
 u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data);
 
-u8 rtw_efuse_read_1_byte(struct adapter *padapter, u16 Address);
-void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType);
-void rtw_efuse_shadow_read(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value);
+u8 rtw_efuse_read_1_byte(struct adapter *padapter, u16 address);
+void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuse_type);
+void rtw_efuse_shadow_read(struct adapter *padapter, u8 type, u16 offset, u32 *value);
 
 #endif
-- 
2.55.0

