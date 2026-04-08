Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D42F3B3C01
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 10:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775644342; cv=none; b=qgRWCDdvNGZbXE4BIEQhjyOlXvOnTEhfbN20vu2SUpOdsUH9azqFpRFDmyHf3OwRI6ReRNuiyAWffgMBBqkN8b69zVz7wjoJrozoiW19STO/lDKOUDdRIzRY5rS8hSTJodnHrIerGJPA4kZbQ7qcWztdILnNkFlYIjnULhzg0rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775644342; c=relaxed/simple;
	bh=tAjPPiO10Kl8yMUytQ/0qYQxxxf69CmPbJj2mrMDtko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RCKW8IhpnBY7UuM71SOrm2tpTy1rS5b+gCxCY86x614Fa6hDrZ0RbdmDJLCTTw2d7X5G/vMZM3TRPcQKAT5wmuTMpGVRIqiUebgM70+JBKKVEiAEQhWzLVWcxcUNhRwypd+0OMylgUzknRfSKVjuCDoKkafos3hwCMP33cF3J/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GdRuWmwA; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdRuWmwA"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c70f91776fcso2417558a12.0
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 03:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775644338; x=1776249138; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QFJnUf/mHItKKnIrUSiEX/ABxt8Jb+0dlWZPlqfky7s=;
        b=GdRuWmwAVoKfIHIvS4OQUVMGUZIpd1kMODTptNCQJxH/uF8ZoNb8f5Ozl78G2cH1qJ
         J/wbNkmEFoi3uok82HHxq0THn663MwKhmmxu9fmJvnEQLY1NEmcUCLyu5EgzrbRoL9sc
         aHylKKVObg37hlLGeBuL+l/Sl+xY1MXYUmi1mh3xsdLEr/9YZNR+soUgAtsRDdO+6nvO
         4CS6xiFSMYS1TaPCf5IIgxrY/LKbb4YAEZ4Eg88kkNKkEPoton5mXi9Xqs7oK4mI5UP8
         e+dGZk/QhrRHSsQYfDAnPawGkLHHWBDJ9pY91Unc8bg8T2FT7iSdqnnVRvBZlDyvrv1T
         8A7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775644338; x=1776249138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QFJnUf/mHItKKnIrUSiEX/ABxt8Jb+0dlWZPlqfky7s=;
        b=QGvA3xMFODaVAVomurjIje0xNtKP4wgQKeNilOv71w7X26ItpymiRTo/w9vN/ujnkn
         xJiuPIylsV04nnKd2ke7/LDktwG9Tnj19bbr4/rQPuVLBixdL8e1s/ZWGavDlxhvWcLO
         2gmKQ0nsfVV+B3cTehwibA8RdKCT3LacbLj9b/zI0VSpagNBIfML6o9wHCvv3njW6X1a
         5NcPsBo9l/lpzS9b1sTHQ+2BcHZ5DL2W/kw2SJTr+NkLCM9uAq7bFYNsFVRpu/uFGMgX
         IyPNNSX/wtpzqtPsVWIDRXw8IVaHAlM4c4VJyfm8Nh/SkKMpVz+4g0b0XgnlsTh+ZBR6
         z3Ow==
X-Gm-Message-State: AOJu0YwFSuzifCDCoXZ3siBG6GlKQ8QDhAUgpQ6lXVEpwSGuGDybAhMv
	lCOAJnwGCiYwI3CGsRgwXB15wSDmRwJndBzZnTe82vCJVec9lqKycC6I
X-Gm-Gg: AeBDiesLz7iEnvpI/z2OJKSNy2WX99P/Ji4dy1Zal1bYQP4Bxmtw78vuCqLe8Fszem4
	IAb4UbqG3ReCMN7QcTBETtjUkGXuFeulg2gRrvoMax/wK8Zi+PU6SKWTWdhp2V6sQ+kAhVD0HrH
	xCj1zPd/BZf+bjcv9a2238yKROH0e0aqpJXAUKNNUOZVlxcL/1cFmUEe7m5kj9jtdHQqK3qEx1l
	YqqAO7Cq4awSUph/JoCpWRW4xyNgnon/zMwrSRTO592oP7I424jQDG0I1Pj+6+rjOd1jPZN8kLv
	ChvgcfKm+y/rUwlU+8imZ4eXbN5Hv1PCN/oPkmR1ZFbTLO7FyGHB4me0C/FF4MblNCwuaJwWlXS
	lomeKP93phsnJjPCzeeoOiYv83msI36X1m+4FDkXxwpy76dodfnnucHTixvuQB6JNUEzCNr20mR
	F0MIJpbwMyeXm14VPN/n5q2xvZO1r4OO8Wh4XA3sBrxP8UXj6CJhXNw8XhoEfnK8NT
X-Received: by 2002:a17:902:d585:b0:2b0:ccad:de1a with SMTP id d9443c01a7336-2b28178a71fmr210178395ad.30.1775644337975;
        Wed, 08 Apr 2026 03:32:17 -0700 (PDT)
Received: from localhost (as040201.dynamic.ppp.asahi-net.or.jp. [150.9.40.201])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2b2749ce29esm214934555ad.81.2026.04.08.03.32.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 03:32:17 -0700 (PDT)
From: osjin83@gmail.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	osjin83@gmail.com
Subject: [PATCH 3/3] staging: rtl8723bs: remove unnecessary blank lines in rtl8723b_phycfg.c
Date: Wed,  8 Apr 2026 19:32:08 +0900
Message-ID: <20260408103208.7682-4-osjin83@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260408103208.7682-1-osjin83@gmail.com>
References: <20260408103208.7682-1-osjin83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: tas0dev <osjin83@gmail.com>

Remove unnecessary blank lines throughout rtl8723b_phycfg.c to clean
up the code and adhere to the Linux kernel coding style.

Signed-off-by: tas0dev <osjin83@gmail.com>
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

