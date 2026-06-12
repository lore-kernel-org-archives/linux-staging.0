Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8153390998
	for <linux-staging@lists.linux.dev>; Fri, 12 Jun 2026 10:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781260131; cv=none; b=lbjrpTQBgyPjtqnfSEvDahK+F6RyHXMf5QBLl7p7ikqksm3MngWfg7MYI42IZG4h3HsMQdTAgJpaGnUD4+5itlzWc6HnbHWBmxXUxM8cLWp+MpqR+yv43wDb2w4BhM3w7qMAAgUADMaT8Lkt/XjByU6k6DDxltM9oRbEbwpJ7Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781260131; c=relaxed/simple;
	bh=M45WFqtOp4V+XzfqpV15s8KlXQZtJ3LsqnMOB0jykXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ARvhrYcBRQHWtE3d+Ae2ysmQ/fhhj3GUSgTUxwdqa+5HGSNEfhbLBWGHcGa0UjBWMmtF08ag7wtPsUkP/1OqqzwUjGlu5AiIwpge42+vn8qasG2xOqd6yDn5H+trseoHTz7SPeH6JPXqcwR9nswa1FugfDHSeZQq8eREd5gMSNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGPDmcIw; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGPDmcIw"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490ac357c55so7203395e9.1
        for <linux-staging@lists.linux.dev>; Fri, 12 Jun 2026 03:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781260128; x=1781864928; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wh8+hoaltGU0PiDc7ae1WnDNmxl9Hi7mXlCtM+/pQHo=;
        b=KGPDmcIwhlBcLhz69U3WP6HA7OXyNJOXvN90z9Adrj+j6/EVQMuzZ3Ri21mq9BEKB2
         w1LiaAQWObcAEwPiFPMOTch70a/m2ChCtjSFH1+wHDaM6sv6xLOSfeXQ7ZZSQUGClCV1
         z8tj6r+ZHuvQ4P4qrGV3ZV/gTP5cATu8P0yyga/D08jkRW6lz1n46tpskVr39JUzlsjJ
         48iNFGvnr7dSNs1mT/uGftTK5da5gdt/9zCeTLGs+9khjo5pDWRfyaQZqTTEIhZ63EWI
         LmMw2yC/Y3BDy36jdDiWld//UFnb9rjsD5RtHyji58py0+pG7V2W2n68TAeALGAZ98BD
         x4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781260128; x=1781864928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wh8+hoaltGU0PiDc7ae1WnDNmxl9Hi7mXlCtM+/pQHo=;
        b=ouLA+bxxd5ZK6RPE3xO6qwFyit88A9peZGuWnl4SGbKLtjEqh6goraBm090lzxYwa7
         9hv58lT158qHPwaWb23hOtxlsEfSOKWjlN4lqzqXQT2xSZV68UM3HJNzO+9VW2OyOohw
         1dYKmcEEGgB5JMy6/RSFiePw6nZpdfZipaUNqz7HoMu57Nyj3kMlOjQ3UVVXK2t8pHkC
         ayxE6URdGvnLS2aGHiYezBJFpisnZQrj7aHsoHrzx5GSbGUW1eVLTa1rqfmFU1BQGyNG
         EolxbWqEFcOqU3ng4Cw+gXPhsmsG55WOCsY4MAtH7iVJpCNjiWUILo8SgL8OImWfIxAM
         1z5A==
X-Gm-Message-State: AOJu0YyNIgfIh315d5pLkcPIkMlsnLrchzXZAt2MIY0mlbT65/XA+iMO
	WskTZ+i1Dq8Nx7OkXKDNT1o7UWGPYa7gdp/kVE2qNIyqk/qKqEf49ZJRBM8oaYqH
X-Gm-Gg: Acq92OF3+UqUQEjZS1sxdJQ3szabMZw2H9XByx6rd2WihEl+Mv0WE1SrsieBzOi3MVm
	a2TI4bW1jaZCy964BeToh+3YTif/qfcfZJiiT1rqglOTK2vs5TRzwy33wCOWy3oKLSamdHaG0ig
	mLgvKrJgsdUJusrYS8+Sm/37NnHMQsimoI1elqPp0Bggf1PF7s7ggoC9/WARW3DZkks5qyK7dD9
	wvkqoodesnZ345ncnwtbLxuknH9tX0KNEbfDUH3Iec0YnL5Rmr3d08iC8jxlfP2hZVxIifHSxYV
	1NnbYX2ws/vAMyhuYNzq0B4nFlWXpCN4vvty8Q8kVVa5rNRagmz5Pw70hZz4Fes9nagbBFRcdRt
	h4Kj9DYjLNvk/dTiKPAw2bwnO3pvP78EJ0Re2/z1RFCbMHhoY79hxaqcPr9Bg4+409xqvJdIt8a
	sWUSGhKcEShLmmouf1zZUqHsTMhg==
X-Received: by 2002:a05:600c:3b16:b0:491:e3be:1363 with SMTP id 5b1f17b1804b1-491e3be13b3mr4498515e9.0.1781260127853;
        Fri, 12 Jun 2026 03:28:47 -0700 (PDT)
Received: from home.powerhub ([2a0a:ef40:30:7801:2655:7809:9974:b326])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2637ccsm4358881f8f.6.2026.06.12.03.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 03:28:47 -0700 (PDT)
From: Quentin Strydom <qstrydom0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	qstrydom0@gmail.com
Subject: [PATCH v2 4/7] staging: rtl8723bs: hal: fix space-before-tab warnings in HalPhyRf_8723B.c
Date: Fri, 12 Jun 2026 11:28:31 +0100
Message-ID: <20260612102834.39935-4-qstrydom0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612102834.39935-1-qstrydom0@gmail.com>
References: <20260611162128.57870-1-qstrydom0@gmail.com>
 <20260612102834.39935-1-qstrydom0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove spaces before tabs in comments to match kernel coding style.

Signed-off-by: Quentin Strydom <qstrydom0@gmail.com>
---
v2:
 - Rebased onto staging-next as requested

 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 70b68f473d58..91fffa364ec8 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -354,12 +354,12 @@ static u8 phy_PathA_IQK_8723B(
 	/* leave IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
-	/* 	enable path A PA in TXIQK mode */
+	/*	enable path A PA in TXIQK mode */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x18000);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0003f);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xc7f87);
-	/* 	disable path B PA in TXIQK mode */
+	/*	disable path B PA in TXIQK mode */
 /* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, bRFRegOffsetMask, 0x00020); */
 /* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x40ec1); */
 
@@ -600,7 +600,7 @@ static u8 phy_PathA_RxIQK8723B(
 	regEAC = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
 	regEA4 = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord);
 
-	/* 	PA/PAD controlled by 0x0 */
+	/*	PA/PAD controlled by 0x0 */
 	/* leave IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0x780);
@@ -637,12 +637,12 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapter)
     /* leave IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
-	/* 	in TXIQK mode */
+	/*	in TXIQK mode */
 /* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1); */
 /* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x20000); */
 /* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0003f); */
 /* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xc7f87); */
-	/* 	enable path B PA in TXIQK mode */
+	/*	enable path B PA in TXIQK mode */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x30fc1);
 
@@ -873,7 +873,7 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	regEAC = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
 	regEA4 = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord);
 
-	/* 	PA/PAD controlled by 0x0 */
+	/*	PA/PAD controlled by 0x0 */
 	/* leave IQK mode */
 /* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, 0xffffff00, 0x00000000); */
 /* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_B, 0xdf, bRFRegOffsetMask, 0x180); */
@@ -1322,7 +1322,7 @@ static void phy_IQCalibrate_8723B(
 	const u32 retryCount = 2;
 
 	/*  Note: IQ calibration must be performed after loading */
-	/* 		PHY_REG.txt , and radio_a, radio_b.txt */
+	/*		PHY_REG.txt , and radio_a, radio_b.txt */
 
 	/* u32 bbvalue; */
 
@@ -1554,7 +1554,7 @@ void PHY_IQCalibrate_8723B(
 		rOFDM0_RxIQExtAnta
 	};
 /* 	u32 		Path_SEL_BB = 0; */
-	u32 		GNT_BT_default;
+	u32		GNT_BT_default;
 
 	if (!ODM_CheckPowerStatus(padapter))
 		return;
@@ -1745,7 +1745,7 @@ void PHY_IQCalibrate_8723B(
 void PHY_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm)
 {
 	bool		bSingleTone = false, bCarrierSuppression = false;
-	u32 		timeout = 2000, timecount = 0;
+	u32		timeout = 2000, timecount = 0;
 
 	if (!(pDM_Odm->SupportAbility & ODM_RF_CALIBRATION))
 		return;
-- 
2.43.0

