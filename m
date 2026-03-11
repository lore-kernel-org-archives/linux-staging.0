Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4B52DF3F2
	for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 22:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773268459; cv=none; b=E8DqEmptG/on4J5h/vH8BBgJPE5VMI8JaGPg2Q443TeECCoBm0ZoW2uTASCnNT45Mvr3BP1k8mq56R2dMu/lGqdeOGgHQm11fRYs2vrYYBeDi+NA9Akfq38qDkUP4strAt6F/OazGksGZSPQ3MXFYEDD7lUB4BE7fX1q6F+j6U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773268459; c=relaxed/simple;
	bh=RayDBj+UCSPC3pmWEUHM1uIB7V+knomfo2Qr9C21No8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XVlKWhwBuk/bCK61Z3fHGa58h2bEu+G2dl9JWiym/alaIktyVrAdM/tAownlPb50/iuuZ4SPxdwV5h/KeIUp3kW7aVNkjKEWd+ukWvh8zgQDJgp1XEKUnA3fP0NI8xiboJWCW4Ouh7VjFiVHEAsvUrYZibDlnDalXBFoUTqfh0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PiMoxcuf; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PiMoxcuf"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-662fc12ac5bso616714a12.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 15:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773268456; x=1773873256; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PVJWzWoozZiyigEjSeA5sTMjd0ZwaFnZfV8WkeSswUQ=;
        b=PiMoxcufe1lbneVtL1HU60w41E6wGpl2pOeu221Q/24sgCymVv+pekVNuPkf+tkj0o
         Jpdvhfw0xbh2KIh7bbV/TCHuOi7sfdlNx+a2A6D1MqwP9lnSLHWOObZPhH3njgYE094f
         1Ydqc3COFzNlEPZvQjVeIoB0J/kbcnWbyWGBQrSL8Ta+3WaCtutba9870xgU+ivIXeOR
         89jXPlcf3d5Hw0rRZmVdzSQ9Fqfp9zvg/kApMFGdI0gv+/TfAevdYC5YOK9DNHfc2+1h
         K4ElFpF6fzMIUF4OQrnMKvdBEdtZVaexFr6WTWTX0udRhBOMeYvvEsFzNWvGj/O/4j/2
         zJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773268456; x=1773873256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVJWzWoozZiyigEjSeA5sTMjd0ZwaFnZfV8WkeSswUQ=;
        b=M4xeDebgUU2wo2tyZYY7mmavdeU06T4JAjB8Ty10xxZ/MJ9sDaiIvfP1vjhFxEUwuN
         UX8GWh3QVakAdYhEU/tMCGHrHEE+vFhlCXt/cKbi8HPw/lEuw4Smp/7pSgTbXlP1rYJK
         eMN7KeCqUrvFlH4kKVzCcg0jc/ZfXZARpwX2S7VXouUIO52WojE0iZy0s6cvj4mbWw0k
         xUHO7MSGDQSCuDkXvKAFIS0pcPkbAXRF3epQi39CZgN8R5NNBbvqK7IvVUJqtT8N847Y
         JxG5Gu6lZApqdrBj4O3rTgwXcjQY3ORjulz/P1kLnOI/+ga+6R4pGT6+innJrL6RPx0O
         eWEw==
X-Forwarded-Encrypted: i=1; AJvYcCUBH9KDHin/2omNubtSoHcBN9rP9ZQ2lC1KTE5LqWxAX738vLlim6Y76FINQQy6av7ELlQ1kA2LvzPT+WR9@lists.linux.dev
X-Gm-Message-State: AOJu0YyiM7p627BGgAjy1EV7ARV+WpPI1bDvJnmFeowDqP/hF3Eb2yrn
	X0Rqjf38emSvJfH/+CwUaSlnh0A71qb7METaGjiyF2TowCStDMZF/Idq
X-Gm-Gg: ATEYQzzY0EyexlhfNdRhMOafnA6fujpkW2gVN0T0HOsvtx93yq9Ii8iDIkk/4LDs9kG
	umkinomsg3mdXKA7jfhKAGlkbt3lLAKlC4pE6ni1U2g4j+TPr7H2ttKuLw1stXHz9xwMNMqXdDC
	QEH4huqMSnxvsKU00S2SmDBojLATRsGNZj71oHpGG4uUlyUQSLPPgK33ZEQb92tLN4WTjK8B5mI
	O0Lbra++tV5bPMe0ywX/6PKe8Aglxmv9H+9seTGMUiylVq+VYgc3kkmsO/NGUgk6qBeTa2gS98O
	FiLs4gY7vykhdf7Yx2CG2U4JvH+tEWnhj3PnIEzmNSRcdKUT06YpWfl1hB5CjAu347DJmr2tWRr
	i56L1CrRqAcbOE1QWTGM0G9NfSgdK5tbGmXoW10l9JMLaJL28xzM7HA5cAi7tgS6zMasxswvWvN
	bUyXhT0d9BmFkQTVyI3qhJvtoHUqQ97VkwtVo29kSEmDOoWL08iFoHOwIGfz6Uig==
X-Received: by 2002:a17:907:5c9:b0:b8e:4790:d7cf with SMTP id a640c23a62f3a-b972e590342mr209169866b.53.1773268455993;
        Wed, 11 Mar 2026 15:34:15 -0700 (PDT)
Received: from X570.shire (p54a776f7.dip0.t-ipconnect.de. [84.167.118.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972e1c0633sm82362266b.67.2026.03.11.15.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 15:34:15 -0700 (PDT)
From: Lukas Kraft <rebootrequired42@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Lukas Kraft <rebootrequired42@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Changes udelay to usleep_range in rtl8723bs files and resolves checkpatch warnings.
Date: Wed, 11 Mar 2026 23:33:44 +0100
Message-ID: <20260311223403.218519-1-rebootrequired42@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Lukas Kraft <rebootrequired42@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c  | 36 +++++++++----------
 .../rtl8723bs/hal/odm_RegConfig8723B.c        | 28 +++++++--------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  2 +-
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  8 ++---
 .../staging/rtl8723bs/hal/rtl8723b_rf6052.c   | 14 ++++----
 5 files changed, 39 insertions(+), 49 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c b/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
index 86404b5e6c52..f66057a39ff6 100644
--- a/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
+++ b/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
@@ -4,26 +4,22 @@
  * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
-/*++
-Copyright (c) Realtek Semiconductor Corp. All rights reserved.
-
-Module Name:
-	HalPwrSeqCmd.c
-
-Abstract:
-	Implement HW Power sequence configuration CMD handling routine for Realtek devices.
-
-Major Change History:
-	When       Who               What
-	---------- ---------------   -------------------------------
-	2011-10-26 Lucas            Modify to be compatible with SD4-CE driver.
-	2011-07-07 Roger            Create.
-
---*/
+/**
+ * Copyright (c) Realtek Semiconductor Corp. All rights reserved.
+ *
+ * Module Name: HalPwrSeqCmd.c
+ *
+ * Implement HW Power sequence configuration CMD handling routine for Realtek devices.
+ *
+ * Major Change History:
+ *  When       Who               What
+ *  ---------- ---------------   -------------------------------
+ *  2011-10-26 Lucas            Modify to be compatible with SD4-CE driver.
+ *  2011-07-07 Roger            Create.
+ */
 #include <drv_types.h>
 #include <HalPwrSeqCmd.h>
 
-
 /*  */
 /*  Description: */
 /*  This routine deal with the Power Configuration CMDs parsing for RTL8723/RTL8188E Series IC. */
@@ -113,7 +109,7 @@ u8 HalPwrSeqCmdParsing(
 					)
 						bPollingBit = true;
 					else
-						udelay(10);
+						usleep_range(10, 20);
 
 					if (pollingCount++ > maxPollingCnt)
 						return false;
@@ -124,9 +120,9 @@ u8 HalPwrSeqCmdParsing(
 
 			case PWR_CMD_DELAY:
 				if (GET_PWR_CFG_VALUE(PwrCfgCmd) == PWRSEQ_DELAY_US)
-					udelay(GET_PWR_CFG_OFFSET(PwrCfgCmd));
+					usleep_range(GET_PWR_CFG_OFFSET(PwrCfgCmd), GET_PWR_CFG_OFFSET(PwrCfgCmd) + 10);
 				else
-					udelay(GET_PWR_CFG_OFFSET(PwrCfgCmd)*1000);
+					usleep_range(GET_PWR_CFG_OFFSET(PwrCfgCmd) * 1000, GET_PWR_CFG_OFFSET(PwrCfgCmd) 1000 + 10);
 				break;
 
 			case PWR_CMD_END:
diff --git a/drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.c b/drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.c
index 1df42069bd5c..734f58dc420d 100644
--- a/drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.c
+++ b/drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.c
@@ -20,7 +20,7 @@ void odm_ConfigRFReg_8723B(
 	else {
 		PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH, RegAddr, bRFRegOffsetMask, Data);
 		/*  Add 1us delay between BB/RF register setting. */
-		udelay(1);
+		usleep_range(1, 2);
 
 		/* For disable/enable test in high temperature, the B6 value will fail to fill. Suggestion by BB Stanley, 2013.06.25. */
 		if (Addr == 0xb6) {
@@ -31,12 +31,12 @@ void odm_ConfigRFReg_8723B(
 				pDM_Odm->Adapter, RF_PATH, Addr, bMaskDWord
 			);
 
-			udelay(1);
+			usleep_range(1, 2);
 
 			while ((getvalue>>8) != (Data>>8)) {
 				count++;
 				PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH, RegAddr, bRFRegOffsetMask, Data);
-				udelay(1);
+				usleep_range(1, 2);
 				getvalue = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH, Addr, bMaskDWord);
 				if (count > 5)
 					break;
@@ -51,7 +51,7 @@ void odm_ConfigRFReg_8723B(
 				pDM_Odm->Adapter, RF_PATH, Addr, bMaskDWord
 			);
 
-			udelay(1);
+			usleep_range(1, 2);
 
 			while (getvalue != Data) {
 				count++;
@@ -62,7 +62,7 @@ void odm_ConfigRFReg_8723B(
 					bRFRegOffsetMask,
 					Data
 				);
-				udelay(1);
+				usleep_range(1, 2);
 				/* Do LCK againg */
 				PHY_SetRFReg(
 					pDM_Odm->Adapter,
@@ -71,7 +71,7 @@ void odm_ConfigRFReg_8723B(
 					bRFRegOffsetMask,
 					0x0fc07
 				);
-				udelay(1);
+				usleep_range(1, 2);
 				getvalue = PHY_QueryRFReg(
 					pDM_Odm->Adapter, RF_PATH, Addr, bMaskDWord
 				);
@@ -112,7 +112,7 @@ void odm_ConfigBB_AGC_8723B(
 {
 	PHY_SetBBReg(pDM_Odm->Adapter, Addr, Bitmask, Data);
 	/*  Add 1us delay between BB/RF register setting. */
-	udelay(1);
+	usleep_range(1, 2);
 }
 
 void odm_ConfigBB_PHY_REG_PG_8723B(
@@ -125,9 +125,8 @@ void odm_ConfigBB_PHY_REG_PG_8723B(
 {
 	if (Addr == 0xfe || Addr == 0xffe)
 		msleep(50);
-	else {
+	else
 		PHY_StoreTxPowerByRate(pDM_Odm->Adapter, RfPath, Addr, Bitmask, Data);
-	}
 }
 
 void odm_ConfigBB_PHY_8723B(
@@ -144,17 +143,16 @@ void odm_ConfigBB_PHY_8723B(
 	else if (Addr == 0xfc)
 		mdelay(1);
 	else if (Addr == 0xfb)
-		udelay(50);
+		usleep_range(50, 60);
 	else if (Addr == 0xfa)
-		udelay(5);
+		usleep_range(5, 10);
 	else if (Addr == 0xf9)
-		udelay(1);
-	else {
+		usleep_range(1, 2);
+	else
 		PHY_SetBBReg(pDM_Odm->Adapter, Addr, Bitmask, Data);
-	}
 
 	/*  Add 1us delay between BB/RF register setting. */
-	udelay(1);
+	usleep_range(1, 2);
 }
 
 void odm_ConfigBB_TXPWR_LMT_8723B(
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 8d259820f103..1c013c78a2d1 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -273,7 +273,7 @@ void rtl8723b_FirmwareSelfReset(struct adapter *padapter)
 			Delay--;
 			if (Delay == 0)
 				break;
-			udelay(50);
+			usleep_range(50, 60);
 			val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
 		}
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 6d5e531505f9..6416093037ec 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -122,11 +122,7 @@ static u32 phy_RFSerialRead_8723B(
 	PHY_SetBBReg(Adapter, rFPGA0_XA_HSSIParameter2|MaskforPhySet, bMaskDWord, tmplong2 & (~bLSSIReadEdge));
 	PHY_SetBBReg(Adapter, rFPGA0_XA_HSSIParameter2|MaskforPhySet, bMaskDWord, tmplong2 | bLSSIReadEdge);
 
-	udelay(10);
-
-	for (i = 0; i < 2; i++)
-		udelay(MAX_STALL_TIME);
-	udelay(10);
+	usleep_range((MAX_STALL_TIME * 2) + 10, MAX_STALL_TIME * 3);
 
 	if (eRFPath == RF_PATH_A)
 		RfPiEnable = (u8)PHY_QueryBBReg(Adapter, rFPGA0_XA_HSSIParameter1|MaskforPhySet, BIT8);
@@ -391,7 +387,7 @@ int PHY_BBConfig8723B(struct adapter *Adapter)
 
 	rtw_write8(Adapter, REG_RF_CTRL, RF_EN|RF_RSTB|RF_SDMRSTB);
 
-	msleep(1);
+	usleep_range(1000, 1100);
 
 	PHY_SetRFReg(Adapter, RF_PATH_A, 0x1, 0xfffff, 0x780);
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
index ffb35e1ace62..92aca9116824 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
@@ -24,7 +24,7 @@
  * 11/05/2008	MHC		Add API for tw power setting.
  *
  *
-******************************************************************************/
+ *****************************************************************************/
 
 #include <rtl8723b_hal.h>
 
@@ -40,7 +40,7 @@
 /*  2008/11/20 MH For Debug only, RF */
 /*------------------------Define local variable------------------------------*/
 
-/*-----------------------------------------------------------------------------
+/**
  * Function:    PHY_RF6052SetBandwidth()
  *
  * Overview:    This function is called by SetBWModeCallback8190Pci() only
@@ -53,7 +53,7 @@
  * Return:      NONE
  *
  * Note:		For RF type 0222D
- *---------------------------------------------------------------------------*/
+ */
 void PHY_RF6052SetBandwidth8723B(
 	struct adapter *Adapter, enum channel_width Bandwidth
 ) /* 20M or 40M */
@@ -106,18 +106,18 @@ static int phy_RF6052_Config_ParaFile(struct adapter *Adapter)
 
 		/*----Set RF_ENV enable----*/
 		PHY_SetBBReg(Adapter, pPhyReg->rfintfe, bRFSI_RFENV << 16, 0x1);
-		udelay(1);/* PlatformStallExecution(1); */
+		usleep_range(1, 2);/* PlatformStallExecution(1); */
 
 		/*----Set RF_ENV output high----*/
 		PHY_SetBBReg(Adapter, pPhyReg->rfintfo, bRFSI_RFENV, 0x1);
-		udelay(1);/* PlatformStallExecution(1); */
+		usleep_range(1, 2);/* PlatformStallExecution(1); */
 
 		/* Set bit number of Address and Data for RF register */
 		PHY_SetBBReg(Adapter, pPhyReg->rfHSSIPara2, b3WireAddressLength, 0x0);	/*  Set 1 to 4 bits for 8255 */
-		udelay(1);/* PlatformStallExecution(1); */
+		usleep_range(1, 2);/* PlatformStallExecution(1); */
 
 		PHY_SetBBReg(Adapter, pPhyReg->rfHSSIPara2, b3WireDataLength, 0x0);	/*  Set 0 to 12  bits for 8255 */
-		udelay(1);/* PlatformStallExecution(1); */
+		usleep_range(1, 2);/* PlatformStallExecution(1); */
 
 		/*----Initialize RF fom connfiguration file----*/
 		switch (eRFPath) {
-- 
2.51.0

