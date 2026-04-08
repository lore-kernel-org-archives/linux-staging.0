Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7D923504B
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 06:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775630796; cv=none; b=patP2GPHHcrZ5dKuPJ6npMw9zlhV6YgVPOSmBmylEwDud0cQ8LCVkzLKR8uEelOcZvGHK7qxSBab9J3COfQZx29LBDniN3ENqLIZZ8dMPmSOkitUvg46JBuIhug1n3YU011J3DGaZn8EpETgH0uCM2CpgG94Z8BRUky/kWy8Fpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775630796; c=relaxed/simple;
	bh=ZGycORcp/4zQvwz7HcW+a7XuCNyMuYK84T8DtJM6/Ig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XNl6S4hSyCBKz495yGIlC1WABcJhCmJ8CFdE+UaehguBvsVuIZYyONnvgvNC2JvtSNaxWCktlo7UNII9QhkRU4TqsRVwVftaxn3ghKw83aziQI10jlbXjjJ+wAMqrvASOfElaLy5ANU7zRM+E5EuhN2kcza+jwGL5XQXpxLB1OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oaOw0Jvw; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oaOw0Jvw"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35d99bae2ebso5032986a91.3
        for <linux-staging@lists.linux.dev>; Tue, 07 Apr 2026 23:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775630794; x=1776235594; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OD6jmx1qKq30IJLMqBWcOoDlu8bbTmQk6D7NNJfJoMw=;
        b=oaOw0JvwIfVZc9Wu6D0rEJiwBY4pu31WKdDYPYqoK5b8JMeXWvlnvR13MoGYSF+B9N
         0WH1juGzTF58OJMuAFlQ5u2NHIt/DHbKnoNNNHtYfnG2AFwRsIWZGw+Z7aPyThm+d5aq
         PuF0RJIFM1/PsYsi43pvkZv2+5Y2b713zc2P0aYHgIlZGz1Xs0D3FFXNcXZCoP7bkK51
         XOGZKtlMIcSbUxamYUVzvehb/q50DT2DyFJ5cSvpBtTT1+nRfOGng45Kj51n/uEqvTTW
         eucPfenhhYygzY41oeqZjGu3MFEKlniiIVEVHKoOBaIOWghTiCW045UsVBRi0e+pUwdG
         LFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775630794; x=1776235594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OD6jmx1qKq30IJLMqBWcOoDlu8bbTmQk6D7NNJfJoMw=;
        b=WxogzfnkuSzaP26E8VPtJ5pOB3mPuj8y1nzcNZ4JcsHYuALpRPrbkNIHnxCUSk5neS
         2B9O4asIorDeJ5l6l42klvbr2+WQPPipulY98RzZvzBuK/xfsXa2CtJ6NUQLQhXC1aFv
         20GOlNXn5Pk1ujCPKXGy14pWEXA+Cp8o+EIQzsBRTjgAJnnjA9Dcz9t5LlD4hCujbe3N
         5lrZYVLGQKXRclKUhtnyrsawO4BC2bXQQdKlSBNgs61lC/ATU7eFpDaMKU0aowKYOkE3
         JKK36E05cty0yRFKfanb9oioWqWMr2qLrZuBuPAUbVSUAV/Rsju5JWWuVDwtGYfO70hv
         2Vwg==
X-Gm-Message-State: AOJu0YxyprO9wRmrn/+mqk0u7A6uLFdbnbtlUL7YVyC7J4pLlZScT8ho
	1vL3mSmkB0RO5bDwL+Ap2/TnSYP5EPC2mxIubFOrXr6nd5ClZ3Dsn6jD
X-Gm-Gg: AeBDievSBQtU22BKEHI19au2L7y481aGvnnp3TH3DiIl7IA8tABO5rERrOpgpKxkBg9
	z3Wks9L3F+lBoM7mw3q9CuWQ7pDhkqxKnyuOhUL5TuH/bbZqA0+Xat0mSEBgy9xKFeBFlTbaPl9
	P0u6r5eSVzy7i9rwpSJz8/9X9kqFkGCBjSXTwYbgfohnQ/o8R/NEXyKU1nH6Q1LWEkAkaa8OZHk
	MnhPvpMC1fONHEcmzg6symZuQ9C2D9WTD92lj3PYvJ8vP0gsBiNwoAxR7P39Vn9A53m51aEIJxO
	TB5e9tQByEWmClGDcqq8YOuvKqdMsV2l5sw4nZzJ19C1CKoZfJCj8LT0rKfj4SqIdac+4zc1DmT
	a4yEz8jC+KyVtoVCh61vHttZh6+s/6By+02LiqcT1XRPMTJurht8E1Sz9jWeopuZLeAZPrx6YpB
	1kuAaQ9r1KiSyZcng5XDGSmEvs7ki/wSQ+LH1Y98Ss
X-Received: by 2002:a17:903:4b28:b0:2b0:52b7:e82 with SMTP id d9443c01a7336-2b281867dc8mr181197985ad.16.1775630793945;
        Tue, 07 Apr 2026 23:46:33 -0700 (PDT)
Received: from host.gitam.edu ([103.103.208.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274979500sm260498765ad.44.2026.04.07.23.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 23:46:33 -0700 (PDT)
From: PranavDesai-Git <contact.pranavdesai@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	straube.linux@gmail.com,
	b9788213@gmail.com,
	PranavDesai-Git <contact.pranavdesai@gmail.com>
Subject: [PATCH] staging: rtl8723bs: style cleanups in HalPhyRf_8723B.c
Date: Wed,  8 Apr 2026 12:15:57 +0530
Message-ID: <20260408064557.40928-1-contact.pranavdesai@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch cleans up several checkpatch.pl warnings in the
rtl8723bs driver. It removes unnecessary braces from
single-statement blocks, fixes space-before-tab formatting,
and removes commented-out dead code blocks.

Signed-off-by: PranavDesai-Git <contact.pranavdesai@gmail.com>
---
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 132 ++++++++----------
 1 file changed, 58 insertions(+), 74 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 9df3274c1048..fd273eea6b90 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -368,14 +368,14 @@ static u8 phy_PathA_IQK_8723B(
 	/* leave IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
-	/* 	enable path A PA in TXIQK mode */
+	/*	enable path A PA in TXIQK mode */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x18000);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0003f);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xc7f87);
-	/* 	disable path B PA in TXIQK mode */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, bRFRegOffsetMask, 0x00020); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x40ec1); */
+	/*	disable path B PA in TXIQK mode */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, bRFRegOffsetMask, 0x00020); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x40ec1); */
 
 	/* 1 Tx IQK */
 	/* IQK setting */
@@ -386,7 +386,7 @@ static u8 phy_PathA_IQK_8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_A, bMaskDWord, 0x38008c1c);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x8214010a); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x8214010a); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x821303ea);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
@@ -474,7 +474,7 @@ static u8 phy_PathA_RxIQK8723B(
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0001f);
 	/* LNA2 off, PA on for Dcut */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xf7fb7);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x808000);
 
 	/* IQK setting */
@@ -487,7 +487,7 @@ static u8 phy_PathA_RxIQK8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82160c1f); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82160c1f); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82130ff0);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
@@ -558,7 +558,7 @@ static u8 phy_PathA_RxIQK8723B(
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0001f);
 	/* LAN2 on, PA off for Dcut */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xf7d77);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
 
 	/* PA, PAD setting */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0xf80);
@@ -575,7 +575,7 @@ static u8 phy_PathA_RxIQK8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82110000);
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x281604c2); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x281604c2); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x2813001f);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_B, bMaskDWord, 0x28110000);
@@ -617,7 +617,7 @@ static u8 phy_PathA_RxIQK8723B(
 	regEAC = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
 	regEA4 = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord);
 
-	/* 	PA/PAD controlled by 0x0 */
+	/*	PA/PAD controlled by 0x0 */
 	/* leave IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0x780);
@@ -654,12 +654,12 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapter)
     /* leave IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
-	/* 	in TXIQK mode */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x20000); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0003f); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xc7f87); */
-	/* 	enable path B PA in TXIQK mode */
+	/*	in TXIQK mode */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x20000); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0003f); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xc7f87); */
+	/*	enable path B PA in TXIQK mode */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x30fc1);
 
@@ -675,7 +675,7 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapter)
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82140114); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82140114); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x821303ea);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
@@ -689,7 +689,7 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapter)
 
 	/* switch to path B */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
 
 	/* GNT_BT = 0 */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00000800);
@@ -769,7 +769,7 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82160c1f); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82160c1f); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82130ff0);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
@@ -783,7 +783,7 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 
 	/* switch to path B */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
 
 	/* GNT_BT = 0 */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00000800);
@@ -837,15 +837,15 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x18000);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0001f);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xf7d77);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
 
 	/* open PA S1 & close SMIXER */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x30ebd);
 
 	/* PA, PAD setting */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0xf80); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x56, bRFRegOffsetMask, 0x51000); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0xf80); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x56, bRFRegOffsetMask, 0x51000); */
 
 	/* IQK setting */
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK, bMaskDWord, 0x01004800);
@@ -857,7 +857,7 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82110000);
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x281604c2); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x281604c2); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x2813001f);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_B, bMaskDWord, 0x28110000);
@@ -870,7 +870,7 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 
 	/* switch to path B */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
 
 	/* GNT_BT = 0 */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00000800);
@@ -895,10 +895,10 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	regEAC = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
 	regEA4 = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord);
 
-	/* 	PA/PAD controlled by 0x0 */
+	/*	PA/PAD controlled by 0x0 */
 	/* leave IQK mode */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, 0xffffff00, 0x00000000); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_B, 0xdf, bRFRegOffsetMask, 0x180); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, 0xffffff00, 0x00000000); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_B, 0xdf, bRFRegOffsetMask, 0x180); */
 
 
 
@@ -972,7 +972,6 @@ static void _PHY_PathAFillIQKMatrix8723B(
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL] = 0xfffffff & PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
-/* 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord); */
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] = 0x40000100;
 			return;
 		}
@@ -1032,8 +1031,6 @@ static void _PHY_PathBFillIQKMatrix8723B(
 
 		/* 2 Tx IQC */
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, 0xF0000000, ((TX1_C&0x3C0)>>6));
-/* 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC9C][KEY] = rOFDM0_XDTxAFE; */
-/* 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC9C][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord); */
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][KEY] = rOFDM0_XCTxAFE;
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord);
 
@@ -1047,7 +1044,6 @@ static void _PHY_PathBFillIQKMatrix8723B(
 
 		if (bTxOnly) {
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
-/* 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord); */
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = 0x40000100;
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] = 0x0fffffff & PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
@@ -1063,7 +1059,7 @@ static void _PHY_PathBFillIQKMatrix8723B(
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XBRxIQImbalance, bMaskDWord);
 
 		reg = (result[final_candidate][7] >> 6) & 0xF;
-/* 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_AGCRSSITable, 0x0000F000, reg); */
+/*		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_AGCRSSITable, 0x0000F000, reg); */
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] = (reg << 28)|(PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord)&0x0fffffff);
 	}
@@ -1120,9 +1116,8 @@ static void _PHY_SaveADDARegisters8723B(
 	if (!ODM_CheckPowerStatus(padapter))
 		return;
 
-	for (i = 0 ; i < RegisterNum ; i++) {
+	for (i = 0 ; i < RegisterNum ; i++)
 		ADDABackup[i] = PHY_QueryBBReg(pDM_Odm->Adapter, ADDAReg[i], bMaskDWord);
-	}
 }
 
 
@@ -1134,9 +1129,8 @@ static void _PHY_SaveMACRegisters8723B(
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
 
-	for (i = 0 ; i < (IQK_MAC_REG_NUM - 1); i++) {
+	for (i = 0 ; i < (IQK_MAC_REG_NUM - 1); i++)
 		MACBackup[i] = rtw_read8(pDM_Odm->Adapter, MACReg[i]);
-	}
 	MACBackup[i] = rtw_read32(pDM_Odm->Adapter, MACReg[i]);
 
 }
@@ -1153,9 +1147,8 @@ static void _PHY_ReloadADDARegisters8723B(
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
 
-	for (i = 0 ; i < RegiesterNum; i++) {
+	for (i = 0 ; i < RegiesterNum; i++)
 		PHY_SetBBReg(pDM_Odm->Adapter, ADDAReg[i], bMaskDWord, ADDABackup[i]);
-	}
 }
 
 static void _PHY_ReloadMACRegisters8723B(
@@ -1164,9 +1157,8 @@ static void _PHY_ReloadMACRegisters8723B(
 {
 	u32 i;
 
-	for (i = 0 ; i < (IQK_MAC_REG_NUM - 1); i++) {
+	for (i = 0 ; i < (IQK_MAC_REG_NUM - 1); i++)
 		rtw_write8(padapter, MACReg[i], (u8)MACBackup[i]);
-	}
 	rtw_write32(padapter, MACReg[i], MACBackup[i]);
 }
 
@@ -1190,9 +1182,8 @@ static void _PHY_PathADDAOn8723B(
 		PHY_SetBBReg(pDM_Odm->Adapter, ADDAReg[0], bMaskDWord, pathOn);
 	}
 
-	for (i = 1 ; i < IQK_ADDA_REG_NUM ; i++) {
+	for (i = 1 ; i < IQK_ADDA_REG_NUM ; i++)
 		PHY_SetBBReg(pDM_Odm->Adapter, ADDAReg[i], bMaskDWord, pathOn);
-	}
 
 }
 
@@ -1206,9 +1197,8 @@ static void _PHY_MACSettingCalibration8723B(
 
 	rtw_write8(pDM_Odm->Adapter, MACReg[i], 0x3F);
 
-	for (i = 1 ; i < (IQK_MAC_REG_NUM - 1); i++) {
+	for (i = 1 ; i < (IQK_MAC_REG_NUM - 1); i++)
 		rtw_write8(pDM_Odm->Adapter, MACReg[i], (u8)(MACBackup[i]&(~BIT3)));
-	}
 	rtw_write8(pDM_Odm->Adapter, MACReg[i], (u8)(MACBackup[i]&(~BIT5)));
 
 }
@@ -1351,7 +1341,7 @@ static void phy_IQCalibrate_8723B(
 	const u32 retryCount = 2;
 
 	/*  Note: IQ calibration must be performed after loading */
-	/* 		PHY_REG.txt , and radio_a, radio_b.txt */
+	/*		PHY_REG.txt , and radio_a, radio_b.txt */
 
 	/* u32 bbvalue; */
 
@@ -1368,8 +1358,8 @@ static void phy_IQCalibrate_8723B(
 /* no serial mode */
 
 	/* save RF path for 8723B */
-/* 	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord); */
-/* 	Path_SEL_RF = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff); */
+/*	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord); */
+/*	Path_SEL_RF = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff); */
 
 	/* MAC settings */
 	_PHY_MACSettingCalibration8723B(padapter, IQK_MAC_REG, pDM_Odm->RFCalibrateInfo.IQK_MAC_backup);
@@ -1382,10 +1372,10 @@ static void phy_IQCalibrate_8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XCD_RFInterfaceSW, bMaskDWord, 0x22204000);
 
 
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XAB_RFInterfaceSW, BIT10, 0x01); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XAB_RFInterfaceSW, BIT26, 0x01); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XA_RFInterfaceOE, BIT10, 0x00); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XB_RFInterfaceOE, BIT10, 0x00); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XAB_RFInterfaceSW, BIT10, 0x01); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XAB_RFInterfaceSW, BIT26, 0x01); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XA_RFInterfaceOE, BIT10, 0x00); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XB_RFInterfaceOE, BIT10, 0x00); */
 
 
 /* RX IQ calibration setting for 8723B D cut large current issue when leaving IPS */
@@ -1401,7 +1391,7 @@ static void phy_IQCalibrate_8723B(
 /* path A TX IQK */
 	for (i = 0 ; i < retryCount ; i++) {
 		PathAOK = phy_PathA_IQK_8723B(padapter, is2T, RF_Path);
-/* 		if (PathAOK == 0x03) { */
+/*		if (PathAOK == 0x03) { */
 		if (PathAOK == 0x01) {
 			/*  Path A Tx IQK Success */
 			PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
@@ -1417,17 +1407,14 @@ static void phy_IQCalibrate_8723B(
 	for (i = 0 ; i < retryCount ; i++) {
 		PathAOK = phy_PathA_RxIQK8723B(padapter, is2T, RF_Path);
 		if (PathAOK == 0x03) {
-/* 				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
-/* 				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
 				result[t][2] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
 				result[t][3] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
 			break;
 		}
 	}
 
-	if (0x00 == PathAOK) {
+	if (PathAOK == 0x00) {
 	}
-
 /* path B IQK */
 	if (is2T) {
 
@@ -1449,8 +1436,6 @@ static void phy_IQCalibrate_8723B(
 		for (i = 0 ; i < retryCount ; i++) {
 			PathBOK = phy_PathB_RxIQK8723B(padapter, is2T);
 			if (PathBOK == 0x03) {
-/* 				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
-/* 				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
 				result[t][6] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
 				result[t][7] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
 				break;
@@ -1473,8 +1458,8 @@ static void phy_IQCalibrate_8723B(
 		_PHY_ReloadADDARegisters8723B(padapter, IQK_BB_REG_92C, pDM_Odm->RFCalibrateInfo.IQK_BB_backup, IQK_BB_REG_NUM);
 
 		/* Reload RF path */
-/* 		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB); */
-/* 		PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff, Path_SEL_RF); */
+/*		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB); */
+/*		PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff, Path_SEL_RF); */
 
 		/* Allen initial gain 0xc50 */
 		/*  Restore RX initial gain */
@@ -1538,9 +1523,8 @@ static void phy_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm, bool is2T)
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xB0, bRFRegOffsetMask, 0xDFFE0); /*  LDO OFF */
 
 	/*  Channel 10 LC calibration issue for 8723bs with 26M xtal */
-	if (pDM_Odm->SupportInterface == ODM_ITRF_SDIO && pDM_Odm->PackageType >= 0x2) {
+	if (pDM_Odm->SupportInterface == ODM_ITRF_SDIO && pDM_Odm->PackageType >= 0x2)
 		PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_CHNLBW, bMask12Bits, LC_Cal);
-	}
 
 	/* Restore original situation */
 	if ((tmpReg&0x70) != 0) { /* Deal with contisuous TX case */
@@ -1586,8 +1570,8 @@ void PHY_IQCalibrate_8723B(
 		rOFDM0_XDTxAFE,
 		rOFDM0_RxIQExtAnta
 	};
-/* 	u32 		Path_SEL_BB = 0; */
-	u32 		GNT_BT_default;
+/*	u32		Path_SEL_BB = 0; */
+	u32		GNT_BT_default;
 
 	if (!ODM_CheckPowerStatus(padapter))
 		return;
@@ -1653,12 +1637,12 @@ void PHY_IQCalibrate_8723B(
 	/* save default GNT_BT */
 	GNT_BT_default = PHY_QueryBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord);
 	/*  Save RF Path */
-/* 	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord); */
-/* 	Path_SEL_RF = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff); */
+/*	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord); */
+/*	Path_SEL_RF = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff); */
 
     /* set GNT_BT = 0, pause BT traffic */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT12, 0x0); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT11, 0x1); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT12, 0x0); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT11, 0x1); */
 
 
 	for (i = 0; i < 8; i++) {
@@ -1753,8 +1737,8 @@ void PHY_IQCalibrate_8723B(
 	/* restore GNT_BT */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, GNT_BT_default);
 	/*  Restore RF Path */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff, Path_SEL_RF); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff, Path_SEL_RF); */
 
 	/* Resotr RX mode table parameter */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
@@ -1765,8 +1749,8 @@ void PHY_IQCalibrate_8723B(
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x300bd);
 
 	/* set GNT_BT = HW control */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT12, 0x0); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT11, 0x0); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT12, 0x0); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT11, 0x0); */
 
 	if (Is2ant) {
 		if (RF_Path == 0x0)	/* S1 */
@@ -1782,7 +1766,7 @@ void PHY_IQCalibrate_8723B(
 void PHY_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm)
 {
 	bool		bSingleTone = false, bCarrierSuppression = false;
-	u32 		timeout = 2000, timecount = 0;
+	u32		timeout = 2000, timecount = 0;
 
 	if (!(pDM_Odm->SupportAbility & ODM_RF_CALIBRATION))
 		return;
-- 
2.53.0

