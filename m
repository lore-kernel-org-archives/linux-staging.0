Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD988346AD6
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364524; cv=none; b=LEEkt8eWyDvO8s+geayzu4Z6tSZKOWgaRaWRIISCedpzBG669d5gN71/ovRUf0s4XcUIm1KYNBcTiOmyLdOAnSVPXW7zX0/hu3DYSDTyPGApsv8Gpw/5UhWk/tTDiaZ7UHpDxvj3EI19BLyYlYohuIrmh4I60sd/XbYg+pNRiMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364524; c=relaxed/simple;
	bh=qKt7+HHdFKYtqAMDH+cJQmPXrhPmuihiasuqZZJ9oUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AQJ4XJ91kvcrp8uMOAJTYHGO/9lSevCfz1Si2P81j4NmbAp/8o0xEprLtHfELQqHozsX9TmFiFOwRHxGRpHyb/rqnacYcrtSK3I3kQ7D0yhcILzU03R/BTyFei8Q8VZBEIlIFvk7Z1iaY7l4CFC0daSX/D06ODdPrDfBdHe6RuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFQZ84ai; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFQZ84ai"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4359a16a400so1767038f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770364522; x=1770969322; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XlsdzNuqwiirzgpOhcS7XFpa8SUmU9c6nas65uv0jOs=;
        b=GFQZ84aiMrvMlfLxeJTlfkQFo/72p5DLNdhifFNICtA9ZYIfQTNvsRuZLFJa5T7gOy
         LrM02xBOQ2guvPZ5muqJKtYS6wYQHaOjQ5S3i7yVJRdmC0SnwVsyBUyA7w3j3fV1xleF
         N1qM6zcM9HrSrg+D7aV7e75HPlG+sK9NpqNvzV998bSVNzeDvP7CMTEZtY0SBWAvEM37
         8g5Bc5EJ7BkXDFN/XLuhksfnBUGp/LRExSWaXF8RvCVt4EtDMXk8Xci+MytLq5IXPgUH
         Ae1YqjgMjincK2EdZfUERsv2ZRLdWYy1TauxbrvcrlugR1i9Hmzn3NqXxTWl2KIP3C7e
         pZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770364522; x=1770969322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XlsdzNuqwiirzgpOhcS7XFpa8SUmU9c6nas65uv0jOs=;
        b=BAi71DnjBqpn6RjG8IGGdgH7QMWbds4QbrlljZC913U6A2SDOJmIfksznOPkjoHX9o
         zr2H+dAaR4dQZ+UDBKWCUnNFGCiIyd9jIRG4A1VQoTd61rUttOxCqyoBXb0HLMaz+nZz
         2WK8LwRCOjQRBWmGDb9ng7xeO2JMT4v3BhWQy5sfd3/HycHvpZ9XqBQqfFMFzkK0xPis
         KhvPnMGqFpgQaRfbX20P5ESmG7O28HugBtE7V6HMlDMhhk/Ziz75RmG9sCQWnXzPY3Lx
         CRc6hx/AAGdxGt5szmq4DQpnm/lLylYtEPljKc5Irka6t7PsgcbsrocVQAtYcefcFQSt
         mU9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXrl0oE+7fQiKRicJ9k2vwYTVtXIEYDEqJ+mtsI+Ls0SoUYGLxr/KuiAIXXxnYh89Qx0wWu1MfIm9p1BXQF@lists.linux.dev
X-Gm-Message-State: AOJu0YwfEt5KuuwgrDOohvnvQ/UvCPI5Sb8lpdPpawaOgiSZ3CBWzNFi
	Yyzwhf5j+pV0a0N9yB9qoT4vyzgCJm0Pe1DRA3W5eNNiUvCLxEF4pJo=
X-Gm-Gg: AZuq6aICfXU3A/sbqHn3EHLUL98mdgR2K6bEH3E33Mb7u+wtbpUNz5G6PatTl4aNMb2
	fLfxXjN75M2VNDn1IMjRJ+aZwokkMDXxT8PMoVdHAQeskmPgWOb4E8psjenQKjUDvCtIHQK//vN
	f9kggdEePIC4NY57NEZsHGZkHHZ08ZUfqxeZuYYUnBQcw5VvRiLMH+cBWsEdUVZECyhsxLuLbg3
	Xfzbfu/IMVlWAqJGwkIeXeQp6UMj9wjWANgXPbx/6tb6L3B/NtAP1+UZzKy3WfuhekSurrmY1lv
	Zr3Sg+zPpW9sQ6ci3oIuhR/7G78BpH/OuXFvgK+gK5OZwwqCp8ClebzYBkApUZPZIyalSBESUYm
	HnegSNLuv7tAbziKNTngOZ04LS7OtFSpvOARg3ud4UlovgTKuq4xMZ9xIkzF21bYLov0rWrQHTj
	PfPSEUs04171+09PMF6ebcxv1tkXftbPGlLkRtWK16aVwbV42M/5/I55Bhl0Q5QXo=
X-Received: by 2002:a05:6000:2384:b0:430:ff8b:fdc2 with SMTP id ffacd0b85a97d-4362938fef6mr2651664f8f.60.1770364522096;
        Thu, 05 Feb 2026 23:55:22 -0800 (PST)
Received: from LGPC ([31.223.131.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd3b8sm3836039f8f.11.2026.02.05.23.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:55:21 -0800 (PST)
From: lukagejak5@gmail.com
X-Google-Original-From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v2 18/26] staging: rtl8723bs: hal: fix line lengths in rtl8723b_phycfg.c
Date: Fri,  6 Feb 2026 08:54:31 +0100
Message-ID: <20260206075439.103287-19-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206075439.103287-1-luka.gejak@linux.dev>
References: <20260206075439.103287-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luka Gejak <luka.gejak@linux.dev>

Break long lines exceeding 100 characters to comply with kernel coding
style.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   | 54 +++++++++++++------
 1 file changed, 37 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 6d5e531505f9..4f171c065155 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -109,18 +109,26 @@ static u32 phy_RFSerialRead_8723B(
 	NewOffset = Offset;
 
 	if (eRFPath == RF_PATH_A) {
-		tmplong2 = PHY_QueryBBReg(Adapter, rFPGA0_XA_HSSIParameter2|MaskforPhySet, bMaskDWord);
+		u32 regA = rFPGA0_XA_HSSIParameter2 | MaskforPhySet;
+
+		tmplong2 = PHY_QueryBBReg(Adapter, regA, bMaskDWord);
 		tmplong2 = (tmplong2 & (~bLSSIReadAddress)) | (NewOffset<<23) | bLSSIReadEdge;	/* T65 RF */
-		PHY_SetBBReg(Adapter, rFPGA0_XA_HSSIParameter2|MaskforPhySet, bMaskDWord, tmplong2&(~bLSSIReadEdge));
+		PHY_SetBBReg(Adapter, regA, bMaskDWord, tmplong2 & (~bLSSIReadEdge));
 	} else {
-		tmplong2 = PHY_QueryBBReg(Adapter, rFPGA0_XB_HSSIParameter2|MaskforPhySet, bMaskDWord);
+		u32 regB = rFPGA0_XB_HSSIParameter2 | MaskforPhySet;
+
+		tmplong2 = PHY_QueryBBReg(Adapter, regB, bMaskDWord);
 		tmplong2 = (tmplong2 & (~bLSSIReadAddress)) | (NewOffset<<23) | bLSSIReadEdge;	/* T65 RF */
-		PHY_SetBBReg(Adapter, rFPGA0_XB_HSSIParameter2|MaskforPhySet, bMaskDWord, tmplong2&(~bLSSIReadEdge));
+		PHY_SetBBReg(Adapter, regB, bMaskDWord, tmplong2 & (~bLSSIReadEdge));
 	}
 
-	tmplong2 = PHY_QueryBBReg(Adapter, rFPGA0_XA_HSSIParameter2|MaskforPhySet, bMaskDWord);
-	PHY_SetBBReg(Adapter, rFPGA0_XA_HSSIParameter2|MaskforPhySet, bMaskDWord, tmplong2 & (~bLSSIReadEdge));
-	PHY_SetBBReg(Adapter, rFPGA0_XA_HSSIParameter2|MaskforPhySet, bMaskDWord, tmplong2 | bLSSIReadEdge);
+	{
+		u32 reg = rFPGA0_XA_HSSIParameter2 | MaskforPhySet;
+
+		tmplong2 = PHY_QueryBBReg(Adapter, reg, bMaskDWord);
+		PHY_SetBBReg(Adapter, reg, bMaskDWord, tmplong2 & (~bLSSIReadEdge));
+		PHY_SetBBReg(Adapter, reg, bMaskDWord, tmplong2 | bLSSIReadEdge);
+	}
 
 	udelay(10);
 
@@ -307,22 +315,29 @@ static void phy_InitBBRFRegisterDefinition(struct adapter *Adapter)
 	struct hal_com_data		*pHalData = GET_HAL_DATA(Adapter);
 
 	/*  RF Interface Sowrtware Control */
-	pHalData->PHYRegDef[RF_PATH_A].rfintfs = rFPGA0_XAB_RFInterfaceSW; /*  16 LSBs if read 32-bit from 0x870 */
-	pHalData->PHYRegDef[RF_PATH_B].rfintfs = rFPGA0_XAB_RFInterfaceSW; /*  16 MSBs if read 32-bit from 0x870 (16-bit for 0x872) */
+	/* 16 LSBs if read 32-bit from 0x870 */
+	pHalData->PHYRegDef[RF_PATH_A].rfintfs = rFPGA0_XAB_RFInterfaceSW;
+	/* 16 MSBs if read 32-bit from 0x870 (16-bit for 0x872) */
+	pHalData->PHYRegDef[RF_PATH_B].rfintfs = rFPGA0_XAB_RFInterfaceSW;
 
 	/*  RF Interface Output (and Enable) */
-	pHalData->PHYRegDef[RF_PATH_A].rfintfo = rFPGA0_XA_RFInterfaceOE; /*  16 LSBs if read 32-bit from 0x860 */
-	pHalData->PHYRegDef[RF_PATH_B].rfintfo = rFPGA0_XB_RFInterfaceOE; /*  16 LSBs if read 32-bit from 0x864 */
+	/* 16 LSBs if read 32-bit from 0x860 */
+	pHalData->PHYRegDef[RF_PATH_A].rfintfo = rFPGA0_XA_RFInterfaceOE;
+	/* 16 LSBs if read 32-bit from 0x864 */
+	pHalData->PHYRegDef[RF_PATH_B].rfintfo = rFPGA0_XB_RFInterfaceOE;
 
 	/*  RF Interface (Output and)  Enable */
-	pHalData->PHYRegDef[RF_PATH_A].rfintfe = rFPGA0_XA_RFInterfaceOE; /*  16 MSBs if read 32-bit from 0x860 (16-bit for 0x862) */
-	pHalData->PHYRegDef[RF_PATH_B].rfintfe = rFPGA0_XB_RFInterfaceOE; /*  16 MSBs if read 32-bit from 0x864 (16-bit for 0x866) */
+	/* 16 MSBs if read 32-bit from 0x860 (16-bit for 0x862) */
+	pHalData->PHYRegDef[RF_PATH_A].rfintfe = rFPGA0_XA_RFInterfaceOE;
+	/* 16 MSBs if read 32-bit from 0x864 (16-bit for 0x866) */
+	pHalData->PHYRegDef[RF_PATH_B].rfintfe = rFPGA0_XB_RFInterfaceOE;
 
 	pHalData->PHYRegDef[RF_PATH_A].rf3wireOffset = rFPGA0_XA_LSSIParameter; /* LSSI Parameter */
 	pHalData->PHYRegDef[RF_PATH_B].rf3wireOffset = rFPGA0_XB_LSSIParameter;
 
-	pHalData->PHYRegDef[RF_PATH_A].rfHSSIPara2 = rFPGA0_XA_HSSIParameter2;  /* wire control parameter2 */
-	pHalData->PHYRegDef[RF_PATH_B].rfHSSIPara2 = rFPGA0_XB_HSSIParameter2;  /* wire control parameter2 */
+	/* wire control parameter2 */
+	pHalData->PHYRegDef[RF_PATH_A].rfHSSIPara2 = rFPGA0_XA_HSSIParameter2;
+	pHalData->PHYRegDef[RF_PATH_B].rfHSSIPara2 = rFPGA0_XB_HSSIParameter2;
 
 	/*  Transceiver Readback LSSI/HSPI mode */
 	pHalData->PHYRegDef[RF_PATH_A].rfLSSIReadBack = rFPGA0_XA_LSSIReadBack;
@@ -643,8 +658,12 @@ static void phy_PostSetBwMode8723B(struct adapter *Adapter)
 		PHY_SetBBReg(Adapter, rCCK0_System, bCCKSideBand, (pHalData->nCur40MhzPrimeSC>>1));
 
 		PHY_SetBBReg(Adapter, rOFDM1_LSTF, 0xC00, pHalData->nCur40MhzPrimeSC);
+		{
+			u32 val;
 
-		PHY_SetBBReg(Adapter, 0x818, (BIT26|BIT27), (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER) ? 2 : 1);
+			val = (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER) ? 2 : 1;
+			PHY_SetBBReg(Adapter, 0x818, (BIT26 | BIT27), val);
+		}
 		break;
 	default:
 		break;
@@ -769,5 +788,6 @@ void PHY_SetSwChnlBWMode8723B(
 	u8 Offset80
 )
 {
-	PHY_HandleSwChnlAndSetBW8723B(Adapter, true, true, channel, Bandwidth, Offset40, Offset80, channel);
+	PHY_HandleSwChnlAndSetBW8723B(Adapter, true, true, channel,
+				      Bandwidth, Offset40, Offset80, channel);
 }
-- 
2.52.0

