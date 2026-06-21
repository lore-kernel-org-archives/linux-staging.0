Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2D6266581
	for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 16:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782058586; cv=none; b=Iq8oP5FrzyDVqlcmjbXSMfvdjEVP4ruajxebDByF6Gvn8PrjXXPAGHl0dvpnyP5qnSG6hDDI+XspR9gpQDH+d3xADNQZ3TxZZTz1fVr7cbNQN7QNsGzt7oKfVDfGerSOa78THQPFnM88df5towOo4E0yS5XeXo4gaeP4ReTQ8W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782058586; c=relaxed/simple;
	bh=aJsAVQCsfP+W4T1Gvw0JXCh8IKGtxpWXv1k8oA1iEvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B6EzgrknUlL5TlLwfV0XE1vWZDO0FgLTwTkXVnjLehEa/qW+j566FmYLVqj255mHCgf1iKwumumv4wsfkKms07s1/et9/M/XqfViWQHmUuEL5UnyHizAdHRnBpeCXM3WeuAIZtdazoi/vNfHxhUBMjk1stFq0GfjuPDHjPrTBJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nul+C0uW; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nul+C0uW"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c0c2cd63abcso207637466b.2
        for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 09:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782058583; x=1782663383; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35ULwy1tefNPcXQllfCWq/KMlUpTcKJPqa/oyscYyx4=;
        b=nul+C0uW2Xuqa+HbSdqbUomXOgEFg48jCDaEVyqzBFFPckplDSRsiZHhNO4MTOrV+4
         VqaOj49IXj1RlZD6IZkf0QKPrkOdQuuSEYQeRA0ZXpj3B6DQ+57bZ7iorqxQ1tbQTBLQ
         0KuEcLAX71mBTzI35fF9ksjMN4jXUgWbRRvpP6LgvoOHeuk0M4U507Pz0IeH0aBcxhiM
         GQGFpjHbnuhSYv4+29VGql+EA0ro5+H3idaD3JowlmO4e+hwczEGQ6RKTPHDqp9QXGK6
         J+YLSCaVXTzj5fh6gD8ARMiU90M25JsVs06rvhroXHHiNwkRr6/ujRQ/0/0UEwdVjvQ3
         frng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782058583; x=1782663383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=35ULwy1tefNPcXQllfCWq/KMlUpTcKJPqa/oyscYyx4=;
        b=rL/DnlvAZsI10tovSwu+MGVIkEsKmMbY6dlPs+1BYzSVOSa9RAoc2rV1PKL6QgVGFu
         2Pn/PKnkSUqLPZ51wVbfkE4IkBUasjQnlmi3MeRf4e5pLERolalD5iuZxUxUS89U4m2a
         h+Xs/0ZRkWBU1CHZUVV6LNAhiA8hSWQ8t9HJKWQ0WHML9+4Tdnhxh6io12iVvE9lPmyq
         VvHSI/RidOGPk+I2Hh8JLu3zusPNAFYMXQr8FWj0myIa0UQWqch5w3WvrdcMktmMOEmg
         +CUR9sytJEdSPsT/ksjFsV3F+ymIvYukD0e8r/px/ixXbSDDMYuCjCEG+ly8eiH2ps95
         k/ig==
X-Gm-Message-State: AOJu0Ywkcy4PVxrIphaHQWErfVNl0p5SVgPPL6XzOKuD+Lp4CWL6lo8y
	ogXOTwEW+AZETWC/FSLY7XdFvIBWaLh47ItcL7LO1FIVHPbqhBmzZZlyJ0Wbkg==
X-Gm-Gg: AfdE7cnh/2PG1xGqmbKy/h7yuCKOf/yD4FBDiSCocDO4UPh2EQoQupCiwqJvHr7QhDu
	qO8rsDJFo67m2Zh86iRcpp/FH5d5RlvTMiJw76yf+RslW67SLUZxzSTUY0uJrKIKe/O5NxFv50u
	hjcdoHQY1T67/3F+HMHr4aJRiMm8hAgyUAttNwFAZiomHeJihjsXVoNmfw2kUn9vPYxi3aBRA4t
	BHizcYpAoqs+lkyhDyoRU+bPiWP2AM5WhphN/3EZ3E2iLlBH1HZkkvdXk7XRAEEj4ECtiWA/0TO
	/f1zoA/nabrx1Uoq/Pxf5qk6flftePI5QXG0ADyldyN+Ang7Q8uCD4rpBJNrOQTI0tORrP2UTvE
	OYWUpFF0XZGUp6klAVS3Klkrj6qQ2xxkbaHoPG3isVoGeu5bFBbeutX+GBWvr88Y3V16oqCd89C
	w/Raht9L01
X-Received: by 2002:a17:906:9fca:b0:bea:4a9b:27e6 with SMTP id a640c23a62f3a-c097ae06f21mr664177466b.3.1782058582849;
        Sun, 21 Jun 2026 09:16:22 -0700 (PDT)
Received: from archlinux ([93.186.96.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60ac92d1sm212968666b.32.2026.06.21.09.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 09:16:22 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: remove 'NumTotalRFPath' from 'struct hal_com_data'
Date: Sun, 21 Jun 2026 19:12:28 +0300
Message-ID: <20260621161611.111461-2-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260621161611.111461-1-nikolayof23@gmail.com>
References: <20260621161611.111461-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This variable is assigned the value 1, after which it is used as a loop
delimiter. Since it always stores 1, only one loop iteration is
performed. We can remove the 'NumTotalRFPath' field and remove the loop
by calling its body directly to simplify the code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_rf6052.c   | 102 ++++++++----------
 drivers/staging/rtl8723bs/include/hal_data.h  |   2 -
 2 files changed, 46 insertions(+), 58 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
index da4cb28276b2..86759516838b 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
@@ -81,61 +81,58 @@ void PHY_RF6052SetBandwidth8723B(
 static int phy_RF6052_Config_ParaFile(struct adapter *Adapter)
 {
 	u32 u4RegValue = 0;
-	u8 eRFPath;
+	u8 eRFPath = 0;
 	struct bb_register_def *pPhyReg;
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 
 	/* 3----------------------------------------------------------------- */
 	/* 3 <2> Initialize RF */
 	/* 3----------------------------------------------------------------- */
-	/* for (eRFPath = RF_PATH_A; eRFPath <pHalData->NumTotalRFPath; eRFPath++) */
-	for (eRFPath = 0; eRFPath < pHalData->NumTotalRFPath; eRFPath++) {
-
-		pPhyReg = &pHalData->PHYRegDef[eRFPath];
-
-		/*----Store original RFENV control type----*/
-		switch (eRFPath) {
-		case RF_PATH_A:
-			u4RegValue = PHY_QueryBBReg(Adapter, pPhyReg->rfintfs, bRFSI_RFENV);
-			break;
-		case RF_PATH_B:
-			u4RegValue = PHY_QueryBBReg(Adapter, pPhyReg->rfintfs, bRFSI_RFENV << 16);
-			break;
-		}
-
-		/*----Set RF_ENV enable----*/
-		PHY_SetBBReg(Adapter, pPhyReg->rfintfe, bRFSI_RFENV << 16, 0x1);
-		udelay(1);/* PlatformStallExecution(1); */
-
-		/*----Set RF_ENV output high----*/
-		PHY_SetBBReg(Adapter, pPhyReg->rfintfo, bRFSI_RFENV, 0x1);
-		udelay(1);/* PlatformStallExecution(1); */
-
-		/* Set bit number of Address and Data for RF register */
-		PHY_SetBBReg(Adapter, pPhyReg->rfHSSIPara2, b3WireAddressLength, 0x0);	/*  Set 1 to 4 bits for 8255 */
-		udelay(1);/* PlatformStallExecution(1); */
-
-		PHY_SetBBReg(Adapter, pPhyReg->rfHSSIPara2, b3WireDataLength, 0x0);	/*  Set 0 to 12  bits for 8255 */
-		udelay(1);/* PlatformStallExecution(1); */
-
-		/*----Initialize RF fom connfiguration file----*/
-		switch (eRFPath) {
-		case RF_PATH_A:
-		case RF_PATH_B:
-			ODM_ConfigRFWithHeaderFile(&pHalData->odmpriv,
-						   CONFIG_RF_RADIO, eRFPath);
-			break;
-		}
-
-		/*----Restore RFENV control type----*/
-		switch (eRFPath) {
-		case RF_PATH_A:
-			PHY_SetBBReg(Adapter, pPhyReg->rfintfs, bRFSI_RFENV, u4RegValue);
-			break;
-		case RF_PATH_B:
-			PHY_SetBBReg(Adapter, pPhyReg->rfintfs, bRFSI_RFENV << 16, u4RegValue);
-			break;
-		}
+
+	pPhyReg = &pHalData->PHYRegDef[eRFPath];
+
+	/*----Store original RFENV control type----*/
+	switch (eRFPath) {
+	case RF_PATH_A:
+		u4RegValue = PHY_QueryBBReg(Adapter, pPhyReg->rfintfs, bRFSI_RFENV);
+		break;
+	case RF_PATH_B:
+		u4RegValue = PHY_QueryBBReg(Adapter, pPhyReg->rfintfs, bRFSI_RFENV << 16);
+		break;
+	}
+
+	/*----Set RF_ENV enable----*/
+	PHY_SetBBReg(Adapter, pPhyReg->rfintfe, bRFSI_RFENV << 16, 0x1);
+	udelay(1);/* PlatformStallExecution(1); */
+
+	/*----Set RF_ENV output high----*/
+	PHY_SetBBReg(Adapter, pPhyReg->rfintfo, bRFSI_RFENV, 0x1);
+	udelay(1);/* PlatformStallExecution(1); */
+
+	/* Set bit number of Address and Data for RF register */
+	PHY_SetBBReg(Adapter, pPhyReg->rfHSSIPara2, b3WireAddressLength, 0x0);	/*  Set 1 to 4 bits for 8255 */
+	udelay(1);/* PlatformStallExecution(1); */
+
+	PHY_SetBBReg(Adapter, pPhyReg->rfHSSIPara2, b3WireDataLength, 0x0);	/*  Set 0 to 12  bits for 8255 */
+	udelay(1);/* PlatformStallExecution(1); */
+
+	/*----Initialize RF fom connfiguration file----*/
+	switch (eRFPath) {
+	case RF_PATH_A:
+	case RF_PATH_B:
+		ODM_ConfigRFWithHeaderFile(&pHalData->odmpriv,
+					   CONFIG_RF_RADIO, eRFPath);
+		break;
+	}
+
+	/*----Restore RFENV control type----*/
+	switch (eRFPath) {
+	case RF_PATH_A:
+		PHY_SetBBReg(Adapter, pPhyReg->rfintfs, bRFSI_RFENV, u4RegValue);
+		break;
+	case RF_PATH_B:
+		PHY_SetBBReg(Adapter, pPhyReg->rfintfs, bRFSI_RFENV << 16, u4RegValue);
+		break;
 	}
 
 	/* 3 ----------------------------------------------------------------- */
@@ -149,13 +146,6 @@ static int phy_RF6052_Config_ParaFile(struct adapter *Adapter)
 
 int PHY_RF6052_Config8723B(struct adapter *Adapter)
 {
-	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
-
-	/*  */
-	/*  Initialize general global value */
-	/*  */
-	pHalData->NumTotalRFPath = 1;
-
 	/*  */
 	/*  Config BB and RF */
 	/*  */
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index 3a93ac312ded..5796e477dcb5 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -187,7 +187,6 @@ struct hal_com_data {
 	/* rf_ctrl */
 	u8 rf_chip;
 	u8 PackageType;
-	u8 NumTotalRFPath;
 
 	u8 InterfaceSel;
 	u8 framesync;
@@ -392,7 +391,6 @@ struct hal_com_data {
 };
 
 #define GET_HAL_DATA(__padapter)	((struct hal_com_data *)((__padapter)->HalData))
-#define GET_HAL_RFPATH_NUM(__padapter) (((struct hal_com_data *)((__padapter)->HalData))->NumTotalRFPath)
 #define RT_GetInterfaceSelection(_Adapter)	(GET_HAL_DATA(_Adapter)->InterfaceSel)
 
 #endif /* __HAL_DATA_H__ */
-- 
2.54.0

