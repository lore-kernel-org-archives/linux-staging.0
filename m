Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D73140BCA4
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 16:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783959698; cv=none; b=cMC1riQRjJjWBUFAcWjNtL+7CDuVXQ7whx+8wNgi2bjwUZm9VANuBUIDHXLfA01/4hZLCrU94h70jKd7/17f91hY4wIEpR9+KsaJWk0FKdVoAhozPtdwVTiFTA58jJhKfv3qONBqz5S1biy1D2QMSP01HG4g8Me97LSXfzwAVp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783959698; c=relaxed/simple;
	bh=IFlCeItj0yNGWtzlSV7S3FYjpIVcnfEnvkMOjfLGM4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PaDdoA+wrNL5xbm7H/LmhNfMtYKpPzE1e2X6tEmh8zmQw+mHCMvdzaAiUu082dMaFjr2fIymBW0tpAf6coc/xY98ZAYjtZsqRcEpiRLTEfhhzypADOJH9S2Wr7VEfVZZOOqgG7u4SI7eXFf81bnuPNsEOVWNwnUdf7I0sTMryXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rp0Op36x; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rp0Op36x"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-381216921aaso3725062a91.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 09:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783959696; x=1784564496; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rryIpsnykFvKiMN2OTGa4hTFgPKiETJXzyHYxeTrdKg=;
        b=Rp0Op36xAgwiMq5YTXJ9IdryqgLscA5zsxqUUlF2GdrdWxuU/kY1VGjgH54TDiAmXs
         TI8f6Ge3LXBYOBG/hzvGO8/rd3qnYvZqDoX2RrangVclPvigG7QbQVSJBdViOHDmMRp1
         QcwTVq313RUxKsNSuz/ByBHl06uXiKHaXuUDb8Deh74lnpwmgiRb0gITlfycPIiu5VF9
         b/cWI41qOiztPkzJaQo93yhxhZ066cnY1kqV7dFXFt7r6YDkqmmdCT0doKwTpOyJ+BVV
         biiLzD9ImNDgxych/man3PLM+P7ugBgcpzlTpJQqDkudisQaA2UeLktb0oWloL3lKKoB
         0Xng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783959696; x=1784564496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rryIpsnykFvKiMN2OTGa4hTFgPKiETJXzyHYxeTrdKg=;
        b=UtwECb63y7AeIVKFz9rchbxOlN4isGFhRCzYWbixqeSB1eNWJEauDxef8o2N9BLy0W
         5FvY3h54c6SY/OV+KOGqUAGrtQFrisoLdILBLSTP3MXvOxBq1aku8MpiExjGJPzJHsOj
         LMKnaLnn9kMGKtpT7iQqn6hIniPihKQH8cSDdcFtGJgrmDW68wdktM/oe2LK0g8CMGyR
         IH8pI18MAc3kzBwUxh7FFBZqSNV/8fWKupuaEiH4zLICeBWG4FmrQqiBtzoHrTda9AJY
         /Hlo8x3po7cenQdK+Zs88oZ865GyhGK7D3MOQDBoL0Iwll1ofpVCtABME7ad90lzeqC+
         sKVQ==
X-Gm-Message-State: AOJu0YxedAYeiHTooFCJCFr1PH/aQjTg0BwdUdHN2Bk2VgEe5j5oRrWw
	TRdMCCqPrOvjzze/59Ew5A4HRtyDrQKNHuNTWfkL91Mclri6VQ+xVxZYuqoKvOTGEhU=
X-Gm-Gg: AfdE7cnY4fYbepoOSyQAtXCt909TViLzONzkbkAPIuce317QOB/Q8KWPjo9x/Rh+2gz
	5/a0LGUdpKv1kwNAatWBWbHg0DVwMrADvxXfKOP2ruBvijWt1ChlXnKuyvWXRCmkvxFz47rEMq4
	7IQ6ijRKMd+n0each+1pESCWU4lzxKS9SUUUUXXrnIOZd5rDCgT9VXIols+LlCMc3z6cUJf5D7G
	Obdnb1DLHWMdfeyUdrWztb2VUeb3qgY8xxWJT5FsnkBQrkNLqMQr2kiR1CwGBefC12ek8pXcsmL
	E1Rud57HR2rObuDRfAABHpWOMOwHbY6dUpJ8uegrwjP6Y7ahgiOvNSJ+hfflYNosEtpppK2Hjez
	GFFeZI3f2CsWkWv0mY1FnhwqpJd2uKz4P0lrD59t490x1yBrjw1QIfDPa9rvGqzQcXXwUlo4KXI
	cftCzk0377OcGzKF5errSrzldg
X-Received: by 2002:a17:90b:5343:b0:37f:ad36:8fc5 with SMTP id 98e67ed59e1d1-38dc7759428mr9976431a91.23.1783959695737;
        Mon, 13 Jul 2026 09:21:35 -0700 (PDT)
Received: from omarchy ([110.235.219.201])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118389d9bcsm60907491eec.20.2026.07.13.09.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 09:21:34 -0700 (PDT)
From: Yash Pratap Kulshrestha <pratapyashkulshrestha@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yash Pratap Kulshrestha <pratapyashkulshrestha@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix space before tab in HalPhyRf_8723B.c
Date: Mon, 13 Jul 2026 21:50:20 +0530
Message-ID: <20260713162020.2478175-1-pratapyashkulshrestha@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove stray spaces before tabs throughout HalPhyRf_8723B.c,
fixing checkpatch.pl warnings. Most of them were comments but
some of them were variable declarations with unusual indents
having mixed space/tab alignments.

Signed-off-by: Yash Pratap Kulshrestha <pratapyashkulshrestha@gmail.com>
---
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 116 +++++++++---------
 1 file changed, 58 insertions(+), 58 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 70b68f473d58..ebebc202971c 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -354,14 +354,14 @@ static u8 phy_PathA_IQK_8723B(
 	/* leave IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
-	/* 	enable path A PA in TXIQK mode */
+	/* enable path A PA in TXIQK mode */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x18000);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0003f);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xc7f87);
-	/* 	disable path B PA in TXIQK mode */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, bRFRegOffsetMask, 0x00020); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x40ec1); */
+	/* disable path B PA in TXIQK mode */
+/* PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, bRFRegOffsetMask, 0x00020); */
+/* PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x40ec1); */
 
 	/* 1 Tx IQK */
 	/* IQK setting */
@@ -372,7 +372,7 @@ static u8 phy_PathA_IQK_8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_A, bMaskDWord, 0x38008c1c);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x8214010a); */
+/* PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x8214010a); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x821303ea);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
@@ -458,7 +458,7 @@ static u8 phy_PathA_RxIQK8723B(
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0001f);
 	/* LNA2 off, PA on for Dcut */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xf7fb7);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
+/* PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x808000);
 
 	/* IQK setting */
@@ -471,7 +471,7 @@ static u8 phy_PathA_RxIQK8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82160c1f); */
+/* PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82160c1f); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82130ff0);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
@@ -542,7 +542,7 @@ static u8 phy_PathA_RxIQK8723B(
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0001f);
 	/* LAN2 on, PA off for Dcut */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xf7d77);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
+/* PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
 
 	/* PA, PAD setting */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0xf80);
@@ -558,7 +558,7 @@ static u8 phy_PathA_RxIQK8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82110000);
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x281604c2); */
+/* PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x281604c2); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x2813001f);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_B, bMaskDWord, 0x28110000);
@@ -600,7 +600,7 @@ static u8 phy_PathA_RxIQK8723B(
 	regEAC = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
 	regEA4 = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord);
 
-	/* 	PA/PAD controlled by 0x0 */
+	/* PA/PAD controlled by 0x0 */
 	/* leave IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0x780);
@@ -637,12 +637,12 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapter)
     /* leave IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
-	/* 	in TXIQK mode */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x20000); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0003f); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xc7f87); */
-	/* 	enable path B PA in TXIQK mode */
+	/* in TXIQK mode */
+/* PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1); */
+/* PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x20000); */
+/* PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0003f); */
+/* PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xc7f87); */
+	/* enable path B PA in TXIQK mode */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x30fc1);
 
@@ -656,7 +656,7 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapter)
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82140114); */
+/* PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82140114); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x821303ea);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
@@ -670,7 +670,7 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapter)
 
 	/* switch to path B */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
+/* PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
 
 	/* GNT_BT = 0 */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00000800);
@@ -748,7 +748,7 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82160c1f); */
+/* PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82160c1f); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82130ff0);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
@@ -762,7 +762,7 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 
 	/* switch to path B */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
+/* PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
 
 	/* GNT_BT = 0 */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00000800);
@@ -815,15 +815,15 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x18000);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0001f);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xf7d77);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
+/* PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
 
 	/* open PA S1 & close SMIXER */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x30ebd);
 
 	/* PA, PAD setting */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0xf80); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x56, bRFRegOffsetMask, 0x51000); */
+/* PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0xf80); */
+/* PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x56, bRFRegOffsetMask, 0x51000); */
 
 	/* IQK setting */
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK, bMaskDWord, 0x01004800);
@@ -835,7 +835,7 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82110000);
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x281604c2); */
+/* PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x281604c2); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x2813001f);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_B, bMaskDWord, 0x28110000);
@@ -848,7 +848,7 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 
 	/* switch to path B */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
+/* PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
 
 	/* GNT_BT = 0 */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00000800);
@@ -873,10 +873,10 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	regEAC = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
 	regEA4 = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord);
 
-	/* 	PA/PAD controlled by 0x0 */
+	/* PA/PAD controlled by 0x0 */
 	/* leave IQK mode */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, 0xffffff00, 0x00000000); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_B, 0xdf, bRFRegOffsetMask, 0x180); */
+/* PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, 0xffffff00, 0x00000000); */
+/* PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_B, 0xdf, bRFRegOffsetMask, 0x180); */
 
 	/* Allen 20131125 */
 	tmp = (regEAC & 0x03FF0000)>>16;
@@ -948,7 +948,7 @@ static void _PHY_PathAFillIQKMatrix8723B(
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL] = 0xfffffff & PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
-/* 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord); */
+/* pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord); */
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] = 0x40000100;
 			return;
 		}
@@ -1008,8 +1008,8 @@ static void _PHY_PathBFillIQKMatrix8723B(
 
 		/* 2 Tx IQC */
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, 0xF0000000, ((TX1_C&0x3C0)>>6));
-/* 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC9C][KEY] = rOFDM0_XDTxAFE; */
-/* 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC9C][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord); */
+/* pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC9C][KEY] = rOFDM0_XDTxAFE; */
+/* pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC9C][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord); */
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][KEY] = rOFDM0_XCTxAFE;
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord);
 
@@ -1023,7 +1023,7 @@ static void _PHY_PathBFillIQKMatrix8723B(
 
 		if (bTxOnly) {
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
-/* 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord); */
+/* pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord); */
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = 0x40000100;
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] = 0x0fffffff & PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
@@ -1039,7 +1039,7 @@ static void _PHY_PathBFillIQKMatrix8723B(
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XBRxIQImbalance, bMaskDWord);
 
 		reg = (result[final_candidate][7] >> 6) & 0xF;
-/* 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_AGCRSSITable, 0x0000F000, reg); */
+/* PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_AGCRSSITable, 0x0000F000, reg); */
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] = (reg << 28)|(PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord)&0x0fffffff);
 	}
@@ -1322,7 +1322,7 @@ static void phy_IQCalibrate_8723B(
 	const u32 retryCount = 2;
 
 	/*  Note: IQ calibration must be performed after loading */
-	/* 		PHY_REG.txt , and radio_a, radio_b.txt */
+	/* PHY_REG.txt , and radio_a, radio_b.txt */
 
 	/* u32 bbvalue; */
 
@@ -1339,8 +1339,8 @@ static void phy_IQCalibrate_8723B(
 /* no serial mode */
 
 	/* save RF path for 8723B */
-/* 	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord); */
-/* 	Path_SEL_RF = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff); */
+/* Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord); */
+/* Path_SEL_RF = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff); */
 
 	/* MAC settings */
 	_PHY_MACSettingCalibration8723B(padapter, IQK_MAC_REG, pDM_Odm->RFCalibrateInfo.IQK_MAC_backup);
@@ -1352,10 +1352,10 @@ static void phy_IQCalibrate_8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_TRMuxPar, bMaskDWord, 0x000800e4);
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XCD_RFInterfaceSW, bMaskDWord, 0x22204000);
 
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XAB_RFInterfaceSW, BIT10, 0x01); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XAB_RFInterfaceSW, BIT26, 0x01); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XA_RFInterfaceOE, BIT10, 0x00); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XB_RFInterfaceOE, BIT10, 0x00); */
+/* PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XAB_RFInterfaceSW, BIT10, 0x01); */
+/* PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XAB_RFInterfaceSW, BIT26, 0x01); */
+/* PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XA_RFInterfaceOE, BIT10, 0x00); */
+/* PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XB_RFInterfaceOE, BIT10, 0x00); */
 
 /* RX IQ calibration setting for 8723B D cut large current issue when leaving IPS */
 
@@ -1370,7 +1370,7 @@ static void phy_IQCalibrate_8723B(
 /* path A TX IQK */
 	for (i = 0 ; i < retryCount ; i++) {
 		PathAOK = phy_PathA_IQK_8723B(padapter, is2T, RF_Path);
-/* 		if (PathAOK == 0x03) { */
+/* if (PathAOK == 0x03) { */
 		if (PathAOK == 0x01) {
 			/*  Path A Tx IQK Success */
 			PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
@@ -1388,8 +1388,8 @@ static void phy_IQCalibrate_8723B(
 	for (i = 0 ; i < retryCount ; i++) {
 		PathAOK = phy_PathA_RxIQK8723B(padapter, is2T, RF_Path);
 		if (PathAOK == 0x03) {
-/* 				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
-/* 				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
+/* result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
+/* result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
 				result[t][2] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
 				result[t][3] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
 			break;
@@ -1417,8 +1417,8 @@ static void phy_IQCalibrate_8723B(
 		for (i = 0 ; i < retryCount ; i++) {
 			PathBOK = phy_PathB_RxIQK8723B(padapter, is2T);
 			if (PathBOK == 0x03) {
-/* 				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
-/* 				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
+/* result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
+/* result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
 				result[t][6] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
 				result[t][7] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
 				break;
@@ -1441,8 +1441,8 @@ static void phy_IQCalibrate_8723B(
 		_PHY_ReloadADDARegisters8723B(padapter, IQK_BB_REG_92C, pDM_Odm->RFCalibrateInfo.IQK_BB_backup, IQK_BB_REG_NUM);
 
 		/* Reload RF path */
-/* 		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB); */
-/* 		PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff, Path_SEL_RF); */
+/* PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB); */
+/* PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff, Path_SEL_RF); */
 
 		/* Allen initial gain 0xc50 */
 		/*  Restore RX initial gain */
@@ -1553,8 +1553,8 @@ void PHY_IQCalibrate_8723B(
 		rOFDM0_XDTxAFE,
 		rOFDM0_RxIQExtAnta
 	};
-/* 	u32 		Path_SEL_BB = 0; */
-	u32 		GNT_BT_default;
+/* u32 Path_SEL_BB = 0; */
+	u32 GNT_BT_default;
 
 	if (!ODM_CheckPowerStatus(padapter))
 		return;
@@ -1619,12 +1619,12 @@ void PHY_IQCalibrate_8723B(
 	/* save default GNT_BT */
 	GNT_BT_default = PHY_QueryBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord);
 	/*  Save RF Path */
-/* 	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord); */
-/* 	Path_SEL_RF = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff); */
+/* Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord); */
+/* Path_SEL_RF = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff); */
 
     /* set GNT_BT = 0, pause BT traffic */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT12, 0x0); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT11, 0x1); */
+/* PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT12, 0x0); */
+/* PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT11, 0x1); */
 
 	for (i = 0; i < 8; i++) {
 		result[0][i] = 0;
@@ -1717,8 +1717,8 @@ void PHY_IQCalibrate_8723B(
 	/* restore GNT_BT */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, GNT_BT_default);
 	/*  Restore RF Path */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff, Path_SEL_RF); */
+/* PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB); */
+/* PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff, Path_SEL_RF); */
 
 	/* Resotr RX mode table parameter */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
@@ -1729,8 +1729,8 @@ void PHY_IQCalibrate_8723B(
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x300bd);
 
 	/* set GNT_BT = HW control */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT12, 0x0); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT11, 0x0); */
+/* PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT12, 0x0); */
+/* PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT11, 0x0); */
 
 	if (Is2ant) {
 		if (RF_Path == 0x0)	/* S1 */
@@ -1745,7 +1745,7 @@ void PHY_IQCalibrate_8723B(
 void PHY_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm)
 {
 	bool		bSingleTone = false, bCarrierSuppression = false;
-	u32 		timeout = 2000, timecount = 0;
+	u32 timeout = 2000, timecount = 0;
 
 	if (!(pDM_Odm->SupportAbility & ODM_RF_CALIBRATION))
 		return;
-- 
2.54.0

