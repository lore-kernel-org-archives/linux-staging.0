Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461D93859EE
	for <linux-staging@lists.linux.dev>; Sun,  6 Sep 2026 05:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788673572; cv=none; b=LlrGI23BEWdHv95NGP7ACkEljHz9Q+8kn3zu8cuNdYpdBj7Cs6yfunSle/tQK6gbPc/5RhwM8FYFw9OWuxsKgRyraiiLlaQG6USCnqEJi7aWpx91y53yITUoYwNqfzllGDfZlrPy7RZ0cW1tDhuudg7knoUeyZ0DTj8XFiirfps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788673572; c=relaxed/simple;
	bh=jaYMCYumwLtZsd12GUGTSUHTBJ++rMlUJrcKS5DyISw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K/QOPiR957jH6tUaAA1bNysaJDMSsICUCSs68Zrx0jCjBf13ZDu+tKeXjpzqki/1eu0CyIyBIu/johk8MMEUm3jVFrp4g4ZQbbmtAWZQt8GVndPb6h6KHWOgeqNmsmCuxgz7/Gsp+gAcSpG0Dn3j0hnRj4ZMeRJAkHbY57W16UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKVg6aAW; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKVg6aAW"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso2897153a91.3
        for <linux-staging@lists.linux.dev>; Sat, 05 Sep 2026 22:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788673568; x=1789278368; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H0d5sf0HBzfXGg6tLhDHkLbXswt+NURI+auUpkjdlAc=;
        b=ZKVg6aAW9w+0PMPTfxmTHCaqsF0S5/NYNLDAVhUl9TZ25H6KDz1JoMjYC6AvvX2ncV
         6SsjDFnMEc6pg7q14Vz4tIKxLbXmiJ1GPHQmf2ZcmoDwNicYFw974U8RBPocuxEgYQFE
         SiL1n8VBBemaW9hJmmMXJ1/dVqNa42EzKQ+mrr0E1qEqufQTmmgskiy7ejAa4TuzIeNO
         RjR9qdzI5PzH5tqZ26gMPhuMqPl4kCJAHhtnwW08ZzDhdfJCKPZuHiOxbznTFArcgT8Z
         6sB9ihWYjM9TaEuoZKagbK5mr08s+9vpnbzC8kFOmWFibvp6Chp9hmbAy9troSOQtQ1Q
         /7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788673568; x=1789278368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H0d5sf0HBzfXGg6tLhDHkLbXswt+NURI+auUpkjdlAc=;
        b=TM2LVjD6byk6PlzkaeC5yZsw5DY66oDZVcHmrcSL8m//56MOhSvW/jWE/lmTJGIBAj
         XIAl3qMVSX1kr9/6BuvK+DheV4Y0a4Juwj56XN0ExTJU2TsTBBrlkT9Egksl0S3hCw9E
         n1ZiEY39kvu9qiundy1ZOe7o8FBCeGP7CDaEtI0wuvu8DpPDqAhMvFbR1yv+bpSZ5nYF
         bmFfgxiT9HolrYFFRisxBVXbv5DRzCd747eQw6vD70cZr5bE4IuBuHNTyctrAh1mRLvs
         ZGVshRz2xlMy2iFLVkSufunOXM72kgMo3Rx+5myocUt4kKxLbYuQWU2Bqvn8DrAAg+tx
         NFYQ==
X-Gm-Message-State: AFuF++mYtQ4k/E5sOPdPHhbspYeoImbW5cGyt9xNnXLB2RJWN/oyhdE2
	uIBbS87wWIRDehT4wCfFw2ccuXg7O+O+83RJWZKa+qEx2mlJanffU7qOAXfMHg==
X-Gm-Gg: AYBFou0sA9ZMeQN/8ezlNzxdMFrmMPwjcxR6KWYsiB4KpCsS7PMtIk0+6f4/MmfOnxA
	s3xtoWTtme8xpT6cN/OaNgF9hPXz4Jq9lQmMU4KFz1561oOqTXArhRx7dmgEi7pSPG8HdAUrnt3
	0EWZXhqQ7Z5DP+TwpCLtLRwgq0QtU9EKNdoemjeQYeTgQJE1AdrL22l5yKVaTWnTDMDDlFYljYe
	O0UzeThZAIgxb+N/GcGKrmnS2uV6OeJSI0/Dt1zRt/9f+/J8HqEKBB/f2VcHoxzC20A46VcrKgB
	Q5FKXtgiyLh7pkEsU23RGiFnCxrWxq+wBEEGRpxwLKG/RSBwcDpadFuPrM0R1fAK5Qq2FFqaR+y
	MgALORq/avWGrs2kWDvUMrYyI8urLz5+i8xkX72n2T+FFkBCBO/NpKyLnhpYvkBInXZY93UTWnj
	KHxDCZ1KiSY2RD+a61wHwmodjQXxEOnaDVrWqr8zt0z5ZbzGfCMtxjMCUT/0lKblVMGVfhoOw=
X-Received: by 2002:a17:90b:224c:b0:398:9bd4:d15 with SMTP id 98e67ed59e1d1-39b26245d08mr22046378a91.20.1788673568156;
        Sat, 05 Sep 2026 22:46:08 -0700 (PDT)
Received: from TestUbuntu22.. ([67.169.161.65])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-143243908a9sm16495708c88.9.2026.09.05.22.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 22:46:07 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guojy.bj@gmail.com
Subject: [PATCH] staging: rtl8723bs: remove commented-out code in HalPhyRf_8723B.c
Date: Sat,  5 Sep 2026 22:46:01 -0700
Message-Id: <20260906054601.6602-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all commented-out code in this file.
Remove adjacent comment where applicable.

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 75 -------------------
 1 file changed, 75 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 6c5f56d5a1f4..ae01560dc8dd 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -359,9 +359,6 @@ static u8 phy_PathA_IQK_8723B(
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x18000);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0003f);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xc7f87);
-	/*	disable path B PA in TXIQK mode */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, bRFRegOffsetMask, 0x00020); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x40ec1); */
 
 	/* 1 Tx IQK */
 	/* IQK setting */
@@ -372,7 +369,6 @@ static u8 phy_PathA_IQK_8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_A, bMaskDWord, 0x38008c1c);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x8214010a); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x821303ea);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
@@ -400,7 +396,6 @@ static u8 phy_PathA_IQK_8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
 
 	/*  delay x ms */
-	/* PlatformStallExecution(IQK_DELAY_TIME_8723B*1000); */
 	mdelay(IQK_DELAY_TIME_8723B);
 
 	/* restore Ant Path */
@@ -458,7 +453,6 @@ static u8 phy_PathA_RxIQK8723B(
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0001f);
 	/* LNA2 off, PA on for Dcut */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xf7fb7);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x808000);
 
 	/* IQK setting */
@@ -471,7 +465,6 @@ static u8 phy_PathA_RxIQK8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82160c1f); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82130ff0);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
@@ -499,7 +492,6 @@ static u8 phy_PathA_RxIQK8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
 
 	/*  delay x ms */
-	/* PlatformStallExecution(IQK_DELAY_TIME_8723B*1000); */
 	mdelay(IQK_DELAY_TIME_8723B);
 
 	/* restore Ant Path */
@@ -542,7 +534,6 @@ static u8 phy_PathA_RxIQK8723B(
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0001f);
 	/* LAN2 on, PA off for Dcut */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xf7d77);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
 
 	/* PA, PAD setting */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0xf80);
@@ -558,7 +549,6 @@ static u8 phy_PathA_RxIQK8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82110000);
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x281604c2); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x2813001f);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_B, bMaskDWord, 0x28110000);
@@ -585,7 +575,6 @@ static u8 phy_PathA_RxIQK8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
 
 	/*  delay x ms */
-	/* PlatformStallExecution(IQK_DELAY_TIME_8723B*1000); */
 	mdelay(IQK_DELAY_TIME_8723B);
 
 	/* restore Ant Path */
@@ -637,11 +626,6 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapter)
     /* leave IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
-	/*	in TXIQK mode */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x20000); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0003f); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xc7f87); */
 	/*	enable path B PA in TXIQK mode */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x30fc1);
@@ -656,7 +640,6 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapter)
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82140114); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x821303ea);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
@@ -670,7 +653,6 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapter)
 
 	/* switch to path B */
 	PHY_SetBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskDWord, 0x00000280);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
 
 	/* GNT_BT = 0 */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00000800);
@@ -680,7 +662,6 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapter)
 	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
 
 	/*  delay x ms */
-	/* PlatformStallExecution(IQK_DELAY_TIME_88E*1000); */
 	mdelay(IQK_DELAY_TIME_8723B);
 
 	/* restore Ant Path */
@@ -748,7 +729,6 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82160c1f); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82130ff0);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
@@ -762,7 +742,6 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 
 	/* switch to path B */
 	PHY_SetBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskDWord, 0x00000280);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
 
 	/* GNT_BT = 0 */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00000800);
@@ -772,7 +751,6 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
 
 	/*  delay x ms */
-	/* PlatformStallExecution(IQK_DELAY_TIME_88E*1000); */
 	mdelay(IQK_DELAY_TIME_8723B);
 
 	/* restore Ant Path */
@@ -815,16 +793,11 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x18000);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0001f);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xf7d77);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
 
 	/* open PA S1 & close SMIXER */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x30ebd);
 
-	/* PA, PAD setting */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0xf80); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x56, bRFRegOffsetMask, 0x51000); */
-
 	/* IQK setting */
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK, bMaskDWord, 0x01004800);
 
@@ -835,7 +808,6 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82110000);
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x281604c2); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x2813001f);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_B, bMaskDWord, 0x28110000);
@@ -848,7 +820,6 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 
 	/* switch to path B */
 	PHY_SetBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskDWord, 0x00000280);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
 
 	/* GNT_BT = 0 */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00000800);
@@ -858,7 +829,6 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
 
 	/*  delay x ms */
-	/* PlatformStallExecution(IQK_DELAY_TIME_88E*1000); */
 	mdelay(IQK_DELAY_TIME_8723B);
 
 	/* restore Ant Path */
@@ -873,11 +843,6 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	regEAC = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
 	regEA4 = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord);
 
-	/*	PA/PAD controlled by 0x0 */
-	/* leave IQK mode */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, 0xffffff00, 0x00000000); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_B, 0xdf, bRFRegOffsetMask, 0x180); */
-
 	/* Allen 20131125 */
 	tmp = (regEAC & 0x03FF0000)>>16;
 	if ((tmp & 0x200) > 0)
@@ -948,7 +913,6 @@ static void _PHY_PathAFillIQKMatrix8723B(
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL] = 0xfffffff & PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
-/* 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord); */
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] = 0x40000100;
 			return;
 		}
@@ -1008,8 +972,6 @@ static void _PHY_PathBFillIQKMatrix8723B(
 
 		/* 2 Tx IQC */
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, 0xF0000000, ((TX1_C&0x3C0)>>6));
-/* 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC9C][KEY] = rOFDM0_XDTxAFE; */
-/* 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC9C][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord); */
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][KEY] = rOFDM0_XCTxAFE;
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord);
 
@@ -1023,7 +985,6 @@ static void _PHY_PathBFillIQKMatrix8723B(
 
 		if (bTxOnly) {
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
-/* 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord); */
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = 0x40000100;
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] = 0x0fffffff & PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
@@ -1039,7 +1000,6 @@ static void _PHY_PathBFillIQKMatrix8723B(
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XBRxIQImbalance, bMaskDWord);
 
 		reg = (result[final_candidate][7] >> 6) & 0xF;
-/* 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_AGCRSSITable, 0x0000F000, reg); */
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] = (reg << 28)|(PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord)&0x0fffffff);
 	}
@@ -1324,8 +1284,6 @@ static void phy_IQCalibrate_8723B(
 	/*  Note: IQ calibration must be performed after loading */
 	/*		PHY_REG.txt , and radio_a, radio_b.txt */
 
-	/* u32 bbvalue; */
-
 	if (t == 0) {
 
 		/*  Save ADDA parameters, turn Path A ADDA on */
@@ -1338,25 +1296,15 @@ static void phy_IQCalibrate_8723B(
 
 /* no serial mode */
 
-	/* save RF path for 8723B */
-/* 	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord); */
-/* 	Path_SEL_RF = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff); */
-
 	/* MAC settings */
 	_PHY_MACSettingCalibration8723B(padapter, IQK_MAC_REG, pDM_Odm->RFCalibrateInfo.IQK_MAC_backup);
 
 	/* BB setting */
-	/* PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_RFMOD, BIT24, 0x00); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rCCK0_AFESetting, 0x0f000000, 0xf);
 	PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_TRxPathEnable, bMaskDWord, 0x03a05600);
 	PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_TRMuxPar, bMaskDWord, 0x000800e4);
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XCD_RFInterfaceSW, bMaskDWord, 0x22204000);
 
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XAB_RFInterfaceSW, BIT10, 0x01); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XAB_RFInterfaceSW, BIT26, 0x01); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XA_RFInterfaceOE, BIT10, 0x00); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XB_RFInterfaceOE, BIT10, 0x00); */
-
 /* RX IQ calibration setting for 8723B D cut large current issue when leaving IPS */
 
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
@@ -1388,8 +1336,6 @@ static void phy_IQCalibrate_8723B(
 	for (i = 0 ; i < retryCount ; i++) {
 		PathAOK = phy_PathA_RxIQK8723B(padapter, is2T, RF_Path);
 		if (PathAOK == 0x03) {
-/* 				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
-/* 				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
 				result[t][2] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
 				result[t][3] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
 			break;
@@ -1417,8 +1363,6 @@ static void phy_IQCalibrate_8723B(
 		for (i = 0 ; i < retryCount ; i++) {
 			PathBOK = phy_PathB_RxIQK8723B(padapter, is2T);
 			if (PathBOK == 0x03) {
-/* 				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
-/* 				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
 				result[t][6] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
 				result[t][7] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
 				break;
@@ -1440,10 +1384,6 @@ static void phy_IQCalibrate_8723B(
 
 		_PHY_ReloadADDARegisters8723B(padapter, IQK_BB_REG_92C, pDM_Odm->RFCalibrateInfo.IQK_BB_backup, IQK_BB_REG_NUM);
 
-		/* Reload RF path */
-/* 		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB); */
-/* 		PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff, Path_SEL_RF); */
-
 		/* Allen initial gain 0xc50 */
 		/*  Restore RX initial gain */
 		PHY_SetBBReg(pDM_Odm->Adapter, 0xc50, bMaskByte0, 0x50);
@@ -1553,7 +1493,6 @@ void PHY_IQCalibrate_8723B(
 		rOFDM0_XDTxAFE,
 		rOFDM0_RxIQExtAnta
 	};
-/* 	u32 		Path_SEL_BB = 0; */
 	u32		GNT_BT_default;
 
 	if (!ODM_CheckPowerStatus(padapter))
@@ -1618,13 +1557,6 @@ void PHY_IQCalibrate_8723B(
 
 	/* save default GNT_BT */
 	GNT_BT_default = PHY_QueryBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord);
-	/*  Save RF Path */
-/* 	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord); */
-/* 	Path_SEL_RF = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff); */
-
-    /* set GNT_BT = 0, pause BT traffic */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT12, 0x0); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT11, 0x1); */
 
 	for (i = 0; i < 8; i++) {
 		result[0][i] = 0;
@@ -1716,9 +1648,6 @@ void PHY_IQCalibrate_8723B(
 
 	/* restore GNT_BT */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, GNT_BT_default);
-	/*  Restore RF Path */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff, Path_SEL_RF); */
 
 	/* Resotr RX mode table parameter */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
@@ -1728,10 +1657,6 @@ void PHY_IQCalibrate_8723B(
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x300bd);
 
-	/* set GNT_BT = HW control */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT12, 0x0); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT11, 0x0); */
-
 	if (Is2ant) {
 		if (RF_Path == 0x0)	/* S1 */
 			ODM_SetIQCbyRFpath(pDM_Odm, 0);
-- 
2.34.1

