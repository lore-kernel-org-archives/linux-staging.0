Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9EA4A23
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 05:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775711117; cv=none; b=CcyDc2vsu5oFfJx8UdDpL/QSxT/bNwClqZwgtmWm0bgBDFB2SySZxf1hEuUfWdN88bFBOOU/TF7ESWCNj8d1Jis2tsDWJnSQtl7h/Xx+eBgRgnhAtGZOBKMDaklRG66SqWRNIkxVEA3mPKaWFydzNDRbNt9wZUg/zB+XnrAY/6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775711117; c=relaxed/simple;
	bh=annGl22vFOZOXryQXSU/FF+34KB6wi5iW2Ym7lBkIjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qcAQYr5ikFBtBvlJ0g8HFyaAC6opaasiG5HuWAGUoN9ucb3RUSij09z1XRtlNtv2ozAHr/deXX5lNDGFrUt57A5W51XipmCNr32or99H0WvPqymh+j63N4fnUXSb3keKHOHoeEfrcHUHLN1SXnjPJx63cOLvYk1SAZYwM1hQHbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPe+L855; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPe+L855"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35d932cc948so396995a91.2
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 22:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775711115; x=1776315915; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfjkkath6l6jnzMysZ75mtqAFvV8Lu5hwVyhifLJIOQ=;
        b=HPe+L855VVRdeMuHejSAkr3eaUrdBFAyI4o2cd/Ez5Kf2D9iamKP9FNpN9JPNrXoog
         s6fqinoAhcTe6j6itM8EY8NTOHrPz9x662bTKYh+MDkFNE2wZX4kAamTpX1M7v0iAaQR
         +Bs0EKEJQN3dJXlgcbOlXNM2fHk5hP/t+xZzE/RlzYygLKqIBKlXaE5qa5mtHw049Jdi
         OVJimypXTVSQkEHCzyCZY/ysPKs6k19XDRj80gk7IbbtJs+4WvCSngFp+IMs2E1CDGQ0
         Yi+4cNOVoLgGJ21PD7HygSOkFYxXorHejsptiBElj1/RktgVHGKfnRAZnvkD4V6dBXZY
         oaow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775711115; x=1776315915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zfjkkath6l6jnzMysZ75mtqAFvV8Lu5hwVyhifLJIOQ=;
        b=WXbr1HaxtyOFJ9TXr/KMHUQWt39wzLgYBqhWiB76CTdXjtVxiJ9HaE/sOpgMu3IWDH
         MhdUnZ8h4I02DjeEKQemudiQX1RLgBO9gZJNbSMDSUpchjPb+UArhzTSPToH4pHDbb6T
         5gG5kVH6OMtSLrhRfWw+KkDqQ7Zs88ybOnur7T496dsZic+3fZYQFK6pKLc560gbe62j
         Ccp0z/SUvmjZGFkPsRPIR3XoS6udCNxPyaNj8Dr4+jO5KtmsesO4R7fNjjyrg3GGL0sX
         zVNR9afvmVqWMQRQWsCzqN0fFx6mEuDrdIwzIey1cy2Gf0QK/mECIR2FSgfu05HR0adu
         d+kg==
X-Gm-Message-State: AOJu0YyRHpXsf4PQ2yiE2LNyDuJ6OsnzP/NizHW2Ht0XMWN+fM3oBbwq
	4lTLhRhqWfDj0nbVxKGTdOXDn+tIUlKwF6xVnArGgJmFv929ql7OO4nh
X-Gm-Gg: AeBDietLA+P+YfqWWm9Pl2bfiKhTSKDHftxEzSnOAsOR25Qd7onBxynjMafQKTNGtqR
	a5USdb9Fe7MJN7b7gCEwRMfkj2FNiwoUyZSfLBdEo/IU+E0Q+qhHA0Hg56WT1fHec7A7gQsE6lr
	atWEKFpC96KDSyvtQCmsWbRI6oufA8Nfe/Gir2atq7mFD3WeCCgpFHwL5a020UaQXK3W61t4081
	78VfNcrSSv5xytV3ep6xKpXSplxIMEWZt4UR58T9WC418sE3im+aZEznLuBy16kooNr9rS+IHPl
	3VaHr7gdwztINCL27gn2fYGTixjtZaw2Qz2/PydZqUQOebT/29boiefiT4w2+Jhz1yonq5cASku
	je+iAMhXbozZqdkhC2Rg3YtRqRcpV1kAGzRt7iZ+WRLij0hpzsnyDNzdWN6y4DSEZ5jzwuTFqSy
	Z9HKr6/94ZJRtsPQLdcq4oy9dIJqZofBl1P9gRdnFiVtbzlK5nunHFvg==
X-Received: by 2002:a17:90b:3a0f:b0:35d:9c32:6219 with SMTP id 98e67ed59e1d1-35de68632f5mr22180355a91.9.1775711115497;
        Wed, 08 Apr 2026 22:05:15 -0700 (PDT)
Received: from localhost (as040201.dynamic.ppp.asahi-net.or.jp. [150.9.40.201])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-35e34fdc4bcsm1499905a91.7.2026.04.08.22.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 22:05:15 -0700 (PDT)
From: osjin83@gmail.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	osjin83@gmail.com
Subject: [PATCH v2 4/4] staging: rtl8723bs: remove unnecessary blank lines in rtl8723b_phycfg.c
Date: Thu,  9 Apr 2026 14:04:52 +0900
Message-ID: <20260409050452.97774-5-osjin83@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409050452.97774-1-osjin83@gmail.com>
References: <20260409050452.97774-1-osjin83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jinemon Tama <osjin83@gmail.com>

Remove unnecessary blank lines throughout rtl8723b_phycfg.c to clean
up the code and adhere to the Linux kernel coding style.

Signed-off-by: Jinemon Tama <osjin83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 498f7b25a2b5..10eb96105f83 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -25,7 +25,6 @@ static	u32 phy_CalculateBitShift(u32 BitMask)
 	return i;
 }
 
-
 /**
  * PHY_QueryBBReg_8723B - Read "specific bits" from BB register.
  * @Adapter:
@@ -46,10 +45,8 @@ u32 PHY_QueryBBReg_8723B(struct adapter *Adapter, u32 RegAddr, u32 BitMask)
 	BitShift = phy_CalculateBitShift(BitMask);
 
 	return (OriginalValue & BitMask) >> BitShift;
-
 }
 
-
 /**
  * PHY_SetBBReg_8723B - Write "Specific bits" to BB register (page 8~).
  * @Adapter:
@@ -80,10 +77,8 @@ void PHY_SetBBReg_8723B(
 	}
 
 	rtw_write32(Adapter, RegAddr, Data);
-
 }
 
-
 /*  */
 /*  2. RF register R/W API */
 /*  */
@@ -141,7 +136,6 @@ static u32 phy_RFSerialRead_8723B(
 		retValue = PHY_QueryBBReg(Adapter, pPhyReg->rfLSSIReadBack | MaskforPhySet, bLSSIReadBackData);
 	}
 	return retValue;
-
 }
 
 /**
@@ -210,7 +204,6 @@ static void phy_RFSerialWrite_8723B(
 	PHY_SetBBReg(Adapter, pPhyReg->rf3wireOffset, bMaskDWord, DataAndAddr);
 }
 
-
 /**
  * PHY_QueryRFReg_8723B - Query "Specific bits" to RF register (page 8~).
  * @Adapter:
@@ -272,12 +265,10 @@ void PHY_SetRFReg_8723B(
 	phy_RFSerialWrite_8723B(Adapter, eRFPath, RegAddr, Data);
 }
 
-
 /*  */
 /*  3. Initial MAC/BB/RF config by reading MAC/BB/RF txt. */
 /*  */
 
-
 /*-----------------------------------------------------------------------------
  * PHY_MACConfig8192C - Config MAC by header file or parameter file.
  *
@@ -329,7 +320,6 @@ static void phy_InitBBRFRegisterDefinition(struct adapter *Adapter)
 	pHalData->PHYRegDef[RF_PATH_B].rfLSSIReadBack = rFPGA0_XB_LSSIReadBack;
 	pHalData->PHYRegDef[RF_PATH_A].rfLSSIReadBackPi = TransceiverA_HSPI_Readback;
 	pHalData->PHYRegDef[RF_PATH_B].rfLSSIReadBackPi = TransceiverB_HSPI_Readback;
-
 }
 
 static int phy_BB8723b_Config_ParaFile(struct adapter *Adapter)
@@ -373,7 +363,6 @@ static int phy_BB8723b_Config_ParaFile(struct adapter *Adapter)
 	return _SUCCESS;
 }
 
-
 int PHY_BBConfig8723B(struct adapter *Adapter)
 {
 	int	rtStatus = _SUCCESS;
@@ -614,7 +603,6 @@ static void phy_PostSetBwMode8723B(struct adapter *Adapter)
 	u8 SubChnlNum = 0;
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 
-
 	/* 3 Set Reg668 Reg440 BW */
 	phy_SetRegBW_8723B(Adapter, pHalData->CurrentChannelBW);
 
@@ -725,13 +713,11 @@ static void PHY_HandleSwChnlAndSetBW8723B(
 	if (!pHalData->bSetChnlBW && !pHalData->bSwChnl)
 		return;
 
-
 	if (pHalData->bSwChnl) {
 		pHalData->CurrentChannel = ChannelNum;
 		pHalData->CurrentCenterFrequencyIndex1 = ChannelNum;
 	}
 
-
 	if (pHalData->bSetChnlBW) {
 		pHalData->CurrentChannelBW = ChnlWidth;
 		pHalData->nCur40MhzPrimeSC = ExtChnlOffsetOf40MHz;
-- 
2.53.0

