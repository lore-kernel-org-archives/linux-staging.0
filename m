Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF4A3290B8
	for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 01:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775785358; cv=none; b=U53GfWOU+LSLYE/JsWckhCMimUxPs+X3sCiXTro99IkYIdg0Nlu4m3t3vC9b79KANeRWfPwK4ExfJPqrr245Or3Y1ETPgLUoXZl+5vZXa7cMFP1J2SCP8ynZg4VphqDRQEge2qjsl9GE20JdVESdjyobR7P2/e25Af5OS6VCGA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775785358; c=relaxed/simple;
	bh=XCXv78S94szg7ToWY+05aqdVbCYMnYFWTs8aOdqwx70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LwYpYkTL93g7zp+BQmtrYN16Pk8W9J8uPVjlQ9ZM+qGYYbMyffO+sTNjH0JYPlveVs2QLWRpk+RRoSzXRmOGM1cxtoB8ylPq+5axFS3nIWtkN4L/L1jnYzkV1lXn8xaZOirsQpxmUMrQq/s//G3Ym/95yDCqY960ASbOV1nrN0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIdLhpBT; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIdLhpBT"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35c1a131946so947801a91.0
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 18:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775785355; x=1776390155; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7SP+QNcyWegZrOYDkboGyn5n2QSUIUUxI5kdV7UisE=;
        b=VIdLhpBTGVeKN5okWrtxUVqaRkMq8yl+iWbpHVxlkFATD+kvONhgOIEzMfW5yN8Aed
         w83NL5vgZCkoV0TVekdY/fM78l9gct/fY76MmNA51Fjv2wT82+2UZ5PsP71EgOH5RQQz
         T8O2xPNZm+wEDYhVzRMkB9Pzy0Fw7nSUMhYZP5E/X+oBqJB7vxW53MK7YPhn/HBGnI6k
         G5+g61wXUE/p0Gea88FVBdn6ON+gkeHbAj2faiO/FpW1EIN4jW6q0AdnK5IQK1Ig3SRm
         J8j6mSRDLKA1TWx8iMEil+iC1TgwzKtKDlaXevlIQ2agpzl5BKaTAVwwuX/nDRiAyie1
         PkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775785355; x=1776390155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u7SP+QNcyWegZrOYDkboGyn5n2QSUIUUxI5kdV7UisE=;
        b=aCndneEHQK+Ndeyh9Hj1+kASBX3f2994+JbhRaXNA3XAoQxo0g4/CTGkcwbrFRXm20
         o/OhXsQHqEN/AlwSexcYFmsnMmXwwwBYA+LIPA3YNH49tz/DdSpjZOYMxxe7/v0GDu/F
         lPFAx0U5BeBZMp3FZFzwwRtVS8NFfIidSjuBCBZFU7nIIp3z3dXQrO5CSa0N5i6rSGNa
         t6tcgi0cByVrpN+PBVBe6l3JmIq7nXZ6Q34RkbqhE/4UgGRbLN8Pj0ojV28hTFjVQ/+C
         tml0GxdeaV6FKmtTq6FqCP3wWiJK9ATTmXU+KTDhN2MCaZln83Uvt94W34CuBanjvBeR
         F5nQ==
X-Gm-Message-State: AOJu0YwUYyCGenOQNrziOl3lg+2iziCoiNGpcnN41xdZnrwqT7mdw8yd
	858Ol3CchdoDte1+36sApO4huqMHaUDETFGuVX7EAfxtgGOMwxXzlZRW
X-Gm-Gg: AeBDievyLdyDCfhTIrZK8rH9AwQV3rWz6dgYF0D88OsqXdp7WKyvsf0pATD8DcsRf2N
	bcPz+ezcuS94zBCkL6myZXkRjkwIJ0vzYqovJB7EyOW4NAxG2q3OjaHJ4zJbT/VB/b1uuIkzpBU
	HHe8dSc/N15sX0szKLDX0fYg1wavaNAyPzohQ3/5pH3Iq84oMdf9rw3SGYFxR1Yq4KCU+IwWsxm
	2mRAKxAttg9LVhU6156JWYeVclOoFwCJZgpLwjYLE5TlmQhplzsvkvyFZJbAhHqlKm8h8ZKraiJ
	CynNbBTBffi/fwwUVqJwgEN7IxtY/xsyIh77PqLXCFWk6EJLw0Fq+oUt53tyxMsbzbpTKKZCD0f
	Bq1KOClqAgraryzkEwqA5CDDH8XGX6bdLwgZsM2w3JUlIoqZdKP/RK31TG8hIUvltvGxCmh00Bf
	/WRDRyZawqKBEYfDu+0PMRONgg6Odwa4jCx0QgEBSDoUvfkDaPhbrBRg==
X-Received: by 2002:a17:90b:3f84:b0:35b:d795:cf5d with SMTP id 98e67ed59e1d1-35e4300f03fmr826368a91.5.1775785354813;
        Thu, 09 Apr 2026 18:42:34 -0700 (PDT)
Received: from localhost (as040201.dynamic.ppp.asahi-net.or.jp. [150.9.40.201])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-35e34ff7a64sm4728090a91.8.2026.04.09.18.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 18:42:34 -0700 (PDT)
From: osjin83@gmail.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	osjin83@gmail.com
Subject: [PATCH v3 4/4] staging: rtl8723bs: remove unnecessary blank lines in rtl8723b_phycfg.c
Date: Fri, 10 Apr 2026 10:42:14 +0900
Message-ID: <20260410014214.10684-5-osjin83@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410014214.10684-1-osjin83@gmail.com>
References: <20260410014214.10684-1-osjin83@gmail.com>
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
index 52007dfc70b9..eb66d382f342 100644
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

