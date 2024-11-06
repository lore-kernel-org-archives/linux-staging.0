Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9379A208231
	for <linux-staging@lists.linux.dev>; Wed,  6 Nov 2024 18:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730918043; cv=none; b=ECCMXIjW+QVgnoYzGD5MBcDRcpb7QZ7P3y9bFeI1SyCgwB6bYEBBXvOFzSK3Dx8zIdItSnMVGWHEZVZQ/R84taHQKHSmqKe6QRJFO3LUtTrVSw1/iYZqZobFhfHcWCtzyNy9Q0eU5r5P2Z8AHOFnq3CCFKs7ecd/UXVZh+IfJ8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730918043; c=relaxed/simple;
	bh=z9YLI3XeypD2JkVURDsXmKAMCA0CwILrHqs40+Csj8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JMPDdMLjxhztwuj9D8e44rpWxv0f90Xek81h+bkXl564FdkwtKwvLa/lOj8cEcx5ALDDxCeCkYHVJ6zQ98PuWwOgnp6hJuGzIUj6Yfgjw1Ni1+dN7FgHzurq88elus3BklNdYPaw7IRamg1/iSg/ifEWsvxc+izVekog9jBLh/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JSpLrcYt; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSpLrcYt"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso11044866b.1
        for <linux-staging@lists.linux.dev>; Wed, 06 Nov 2024 10:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730918038; x=1731522838; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPcfkzQzzHYPVnMWaHpmyomuW/J2G/s5mhha7Kyk8zQ=;
        b=JSpLrcYtQEtUYclX0sYNjWiPj6h/bN1A6fyLnvBwgozrHP+AwgnRzfstHoiJ3tWK+2
         e2khJeOTSjsQFBo5T5ex/a1b5hP4cPM03mfiuDW+0WG3zL0w/cN3jBQl4U1GmvA6sSmZ
         jyNs5+MLsS7DXDg1s6+zMgAMifkSztJluPWGrZ/5Zd3amrwFS3FGKfbiZcKsgelbxgcJ
         04IN/BUR6vcVrRhiKlaMdYvLxIX9kFVunEO28ilI+nOocs1MGATJw+4/RUuO3skWURmS
         ibTvautJYk94/+bsWHuHaKtIBT8Bu10YiCyVtuulSU7BUKUiQVw9ZDyRzW+BN8tPLts3
         SQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730918038; x=1731522838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iPcfkzQzzHYPVnMWaHpmyomuW/J2G/s5mhha7Kyk8zQ=;
        b=QRqcpj3TOA+fqPKo3S9TCSwIaZSwvb/iQCqEW5uFaET7qXt/sr0TXtyVqpSmiDwjSh
         PlWbnp/axP5LDEJey2zdjTOesfPtLypEcBorTvJ9eVxHdugx6x0NMDl7wQp5tR+Aix3a
         7M8k+MnoMya5mNbxSXhSenfH6F+2TPshKvuJV5HnJyXG85Q93OXt1QCsZpn4mVFnLYru
         BBIrl3Z2657DB/uBhJy12pCGntM3+EpeXi7c2sIgx0bVYtrAai5DIgNRwIoh5WrqVa6s
         rayzNqsBtGUWcpSugMmUDDz/pbWPyyEvnpffDU731AFTn1dF4vNYjSj/2wMO6VkdpvZQ
         HBlg==
X-Forwarded-Encrypted: i=1; AJvYcCXy4vVqTjhCCLSMwyQunp2TeoXpnGTQyxPOWdoScw7nZvzyQ0NmoOeL3hA4pyL178dkF5B+cFLcKJz8CN4P@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0gGyNCBUr92bkmGYciafZaoVxAnFO+x14GSzrTmccKfjPuq20
	3R202BOp69MIL64Xk2xe9jX/E7zddwq9ZWX3OZq47wP0kKRfjyEf
X-Google-Smtp-Source: AGHT+IGeq+rxg4ogSXDYO599VyNKOGALtpa4ihVmhkyLPUdzPJvsEp1uvL0ovpW4CuTtBB+Y2OLq7g==
X-Received: by 2002:a17:907:7f07:b0:a9a:17f5:79a8 with SMTP id a640c23a62f3a-a9de5d6fad3mr4081888666b.13.1730918037785;
        Wed, 06 Nov 2024 10:33:57 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb1813a07sm315298966b.190.2024.11.06.10.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 10:33:57 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 06/16] staging: rtl8723bs: Remove unused function Hal_EfusePgPacketWrite
Date: Wed,  6 Nov 2024 19:33:35 +0100
Message-ID: <e2d4cfd440651ed08952afccbb3e927c26927c77.1730916582.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730916582.git.philipp.g.hortmann@gmail.com>
References: <cover.1730916582.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function pointer Efuse_PgPacketWrite and unused function
Hal_EfusePgPacketWrite.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 30 -------------------
 drivers/staging/rtl8723bs/include/hal_intf.h  |  1 -
 2 files changed, 31 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 13fe77f84cc9..432c2c0aa259 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1365,35 +1365,6 @@ static u8 hal_EfusePgPacketWriteData(
 	return true;
 }
 
-static s32 Hal_EfusePgPacketWrite(
-	struct adapter *padapter,
-	u8 offset,
-	u8 word_en,
-	u8 *pData,
-	bool bPseudoTest
-)
-{
-	struct pgpkt_struct targetPkt;
-	u16 startAddr = 0;
-	u8 efuseType = EFUSE_WIFI;
-
-	if (!hal_EfusePgCheckAvailableAddr(padapter, efuseType, bPseudoTest))
-		return false;
-
-	hal_EfuseConstructPGPkt(offset, word_en, pData, &targetPkt);
-
-	if (!hal_EfusePartialWriteCheck(padapter, efuseType, &startAddr, &targetPkt, bPseudoTest))
-		return false;
-
-	if (!hal_EfusePgPacketWriteHeader(padapter, efuseType, &startAddr, &targetPkt, bPseudoTest))
-		return false;
-
-	if (!hal_EfusePgPacketWriteData(padapter, efuseType, &startAddr, &targetPkt, bPseudoTest))
-		return false;
-
-	return true;
-}
-
 static bool Hal_EfusePgPacketWrite_BT(
 	struct adapter *padapter,
 	u8 offset,
@@ -1673,7 +1644,6 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
 	/*  Efuse related function */
-	pHalFunc->Efuse_PgPacketWrite = &Hal_EfusePgPacketWrite;
 	pHalFunc->Efuse_WordEnableDataWrite = &Hal_EfuseWordEnableDataWrite;
 	pHalFunc->Efuse_PgPacketWrite_BT = &Hal_EfusePgPacketWrite_BT;
 
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index c320795f3fd4..34cd13e49d8f 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -164,7 +164,6 @@ typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 struct hal_ops {
 	void (*SetHalODMVarHandler)(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
 
-	int	(*Efuse_PgPacketWrite)(struct adapter *padapter, u8 offset, u8 word_en, u8 *data, bool bPseudoTest);
 	u8 (*Efuse_WordEnableDataWrite)(struct adapter *padapter, u16 efuse_addr, u8 word_en, u8 *data, bool bPseudoTest);
 	bool	(*Efuse_PgPacketWrite_BT)(struct adapter *padapter, u8 offset, u8 word_en, u8 *data, bool bPseudoTest);
 
-- 
2.43.0

