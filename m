Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD2227FB3C
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 03:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775706560; cv=none; b=tD2/TEtiVU1oyUeGJFCS2UA93L2ImJaYalIHU22PKjCnrTdHemPRtQugQ61J5nBcj781EyzABoGIa90M+gfwRWrcmFQBgHIieduxHQGcNEVoabqX/fhHroB+STyQZ0VZZFG3nmd3x77L5rx8Vr0ZEkkPreZC5nArRKiMh3JPRu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775706560; c=relaxed/simple;
	bh=4AjhCXKv4KaP5rSFQ+an2piUJE9cxCmlFonmUIssdDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YzwyC4EV7steEWB9AVdmNNFqupVoQVDK2APOuQSg6KMGeKFWoE42y3q9WRpKfxmwwMwWC1rWTc7fwjMO+y5Iri/v38X+2vo5WqSG38M0UAn8DaV10C8RRV0b3pubhKeez7N1uFGD3FEYGBzLE/8ffFo7KrfKoXInHKatcK08s20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YDXMrQFv; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YDXMrQFv"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3591cc98871so275283a91.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 20:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775706558; x=1776311358; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V4OkuRDSHvfEkyFezLkR8RNc0xO6dB7bRT9JwCuSHUM=;
        b=YDXMrQFvdt/4i4WHuRDnOvLLrYRaVvM0Xm50mvEBa92rBHiQNRoCljnzzPWaTQ0p7Z
         WNdEHDoiHY3zvV3zJOTueZsIXhdOcL3y6EKOsWzQ3VjKqVZ/87MfNHIZjlmE2B3ugdpn
         Z/QOBe6pg2QxTFlH+5/VhvJekMvbWNjc2BslrFnxHUNi5ZXfh+yl7jBeC7DaqKZqj+kj
         dMytlnV9HHhEIZWtWo9iFr9nMqVI71gH+4ChIRODVWmFKCIKnoBjdh5ZavvNzxtqNzVQ
         0+WpyMlI7m/0nxwMGDY7fbjSFrLSAHgRkXuLJ2UFUJp4dYWBCWfZnL9/j9uFqWyXm3hI
         D9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775706558; x=1776311358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4OkuRDSHvfEkyFezLkR8RNc0xO6dB7bRT9JwCuSHUM=;
        b=nv3hP488zUaeLcM5dFGKBaYYx5V3Kk/orLZ91ZKJZSQ4NkIvGFoKOJh47yLXI0LAkH
         THu82+oC3fmzg+aXpXGjMDGxP25vvzRFwsww2pP0+MKR8xHz5ryiVSq5v7+XanRA5Bp/
         jlyoeBpEIx1OOaFwZgRVFCjkdLar7xOon6pIZcrY11MIPNupZgY7hfB51gWgSFTradj8
         pe4Lng4WAENgAVeCFCSbaP52JZQsAWiOnsU6LzxAKg+E8rvrkOseAah7+ISkZPrkv+i+
         qNeKRTmBmm0TChwiQmOHR6JG2m4+ii7+W1a4KJAYha062FU37fLyF2JhZnObsMEcaZIb
         /EaQ==
X-Gm-Message-State: AOJu0YxiADGuwFaHBGDxi+8pDOTU+VxO5BIxX0Ft8WCAtYI0S7i1lwv/
	OuHAJryxrp3bGvF+JMqTIasATaYyFbkZ/SGdZZQnUxs0ZEU6MyB5jjR2
X-Gm-Gg: AeBDiestKxD5FE//t6R9gz3GzDIIzacWT1u0+j6ZNH+evBq6NDZxGw9gg4YvkbprfHX
	4IK9rfJs7RrTfAIw3gEtWVIhbm7fJJtqmDTQGr0BJ7m/dzhsv8RsOgxyf98v8BT/srgSvSPW7QK
	z8vWbFQfyzhLvBZhWJnIVnEepUcHkdbntfVP06SdW7DWSjUBSxItVLyQcPqtStYGLmkw7Kgly+D
	noDO2ab4mh5tKyFszZM5yct3TFVbCGsVg+RXw38n5Jv7UrpBdPF/RBw9SlDkgiFV8MViWDCBK/i
	1yEgjmUBzvfPec8EuVQNooSkRdNlO+DmGAgXtXmD4PEbhsg65aYjDikMWQ9iBbt5C/LWTEoR5XL
	vOzCsuCIatzqI6kYGJ/v2oXzATp/FrpqKXPcyRRQQvsLOaADaBmZhoLOMeUIzLcQyeZRgGYD6ia
	KH9VaF7NtStqnZvI7VBzW0bmnF+BEkyfBqsbfiRBiNLJfs58y8S3g=
X-Received: by 2002:a17:90b:510d:b0:35b:a3be:f1b6 with SMTP id 98e67ed59e1d1-35de68f7c0amr22567375a91.16.1775706557398;
        Wed, 08 Apr 2026 20:49:17 -0700 (PDT)
Received: from host.gitam.edu ([103.103.208.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e3503b278sm1600766a91.16.2026.04.08.20.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 20:49:16 -0700 (PDT)
From: Pranav Desai <contact.pranavdesai@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	straube.linux@gmail.com,
	b9788213@gmail.com,
	bera@yuzu.li,
	Pranav Desai <contact.pranavdesai@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: remove commented-out dead code in HalPhyRf_8723B.c
Date: Thu,  9 Apr 2026 09:18:58 +0530
Message-ID: <20260409034859.42356-1-contact.pranavdesai@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove commented-out code blocks

Signed-off-by: Pranav Desai <contact.pranavdesai@gmail.com>
---
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 85 -------------------
 1 file changed, 85 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 8f6849f2277e..63c848ebd661 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -361,9 +361,6 @@ static u8 phy_PathA_IQK_8723B(
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x18000);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0003f);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xc7f87);
-	/* 	disable path B PA in TXIQK mode */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, bRFRegOffsetMask, 0x00020); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x40ec1); */
 
 	/* 1 Tx IQK */
 	/* IQK setting */
@@ -374,7 +371,6 @@ static u8 phy_PathA_IQK_8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_A, bMaskDWord, 0x38008c1c);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x8214010a); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x821303ea);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
@@ -401,8 +397,6 @@ static u8 phy_PathA_IQK_8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf9000000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
 
-	/*  delay x ms */
-	/* PlatformStallExecution(IQK_DELAY_TIME_8723B*1000); */
 	mdelay(IQK_DELAY_TIME_8723B);
 
 	/* restore Ant Path */
@@ -462,7 +456,6 @@ static u8 phy_PathA_RxIQK8723B(
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0001f);
 	/* LNA2 off, PA on for Dcut */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xf7fb7);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x808000);
 
 	/* IQK setting */
@@ -475,7 +468,6 @@ static u8 phy_PathA_RxIQK8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82160c1f); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82130ff0);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
@@ -502,8 +494,6 @@ static u8 phy_PathA_RxIQK8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf9000000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
 
-	/*  delay x ms */
-	/* PlatformStallExecution(IQK_DELAY_TIME_8723B*1000); */
 	mdelay(IQK_DELAY_TIME_8723B);
 
 	/* restore Ant Path */
@@ -546,7 +536,6 @@ static u8 phy_PathA_RxIQK8723B(
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0001f);
 	/* LAN2 on, PA off for Dcut */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xf7d77);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
 
 	/* PA, PAD setting */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0xf80);
@@ -563,7 +552,6 @@ static u8 phy_PathA_RxIQK8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82110000);
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x281604c2); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x2813001f);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_B, bMaskDWord, 0x28110000);
@@ -589,8 +577,6 @@ static u8 phy_PathA_RxIQK8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf9000000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
 
-	/*  delay x ms */
-	/* PlatformStallExecution(IQK_DELAY_TIME_8723B*1000); */
 	mdelay(IQK_DELAY_TIME_8723B);
 
 	/* restore Ant Path */
@@ -642,12 +628,6 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapter)
     /* leave IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
-	/* 	in TXIQK mode */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x20000); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0003f); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xc7f87); */
-	/* 	enable path B PA in TXIQK mode */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x30fc1);
 
@@ -663,7 +643,6 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapter)
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82140114); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x821303ea);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
@@ -677,7 +656,6 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapter)
 
 	/* switch to path B */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
 
 	/* GNT_BT = 0 */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00000800);
@@ -686,8 +664,6 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapter)
 	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf9000000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
 
-	/*  delay x ms */
-	/* PlatformStallExecution(IQK_DELAY_TIME_88E*1000); */
 	mdelay(IQK_DELAY_TIME_8723B);
 
 	/* restore Ant Path */
@@ -757,7 +733,6 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82160c1f); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82130ff0);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
@@ -771,7 +746,6 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 
 	/* switch to path B */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
 
 	/* GNT_BT = 0 */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00000800);
@@ -781,8 +755,6 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
 
 
-	/*  delay x ms */
-	/* PlatformStallExecution(IQK_DELAY_TIME_88E*1000); */
 	mdelay(IQK_DELAY_TIME_8723B);
 
 	/* restore Ant Path */
@@ -825,16 +797,11 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
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
 
@@ -845,7 +812,6 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82110000);
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x281604c2); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x2813001f);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_B, bMaskDWord, 0x28110000);
@@ -858,7 +824,6 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 
 	/* switch to path B */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
 
 	/* GNT_BT = 0 */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00000800);
@@ -867,8 +832,6 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf9000000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
 
-	/*  delay x ms */
-	/* PlatformStallExecution(IQK_DELAY_TIME_88E*1000); */
 	mdelay(IQK_DELAY_TIME_8723B);
 
 	/* restore Ant Path */
@@ -883,12 +846,6 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	regEAC = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
 	regEA4 = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord);
 
-	/* 	PA/PAD controlled by 0x0 */
-	/* leave IQK mode */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, 0xffffff00, 0x00000000); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_B, 0xdf, bRFRegOffsetMask, 0x180); */
-
-
 
 	/* Allen 20131125 */
 	tmp = (regEAC & 0x03FF0000)>>16;
@@ -960,7 +917,6 @@ static void _PHY_PathAFillIQKMatrix8723B(
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL] = 0xfffffff & PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
-/* 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord); */
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] = 0x40000100;
 			return;
 		}
@@ -1020,8 +976,6 @@ static void _PHY_PathBFillIQKMatrix8723B(
 
 		/* 2 Tx IQC */
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, 0xF0000000, ((TX1_C&0x3C0)>>6));
-/* 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC9C][KEY] = rOFDM0_XDTxAFE; */
-/* 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC9C][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord); */
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][KEY] = rOFDM0_XCTxAFE;
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord);
 
@@ -1035,7 +989,6 @@ static void _PHY_PathBFillIQKMatrix8723B(
 
 		if (bTxOnly) {
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
-/* 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord); */
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = 0x40000100;
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] = 0x0fffffff & PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
@@ -1051,7 +1004,6 @@ static void _PHY_PathBFillIQKMatrix8723B(
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XBRxIQImbalance, bMaskDWord);
 
 		reg = (result[final_candidate][7] >> 6) & 0xF;
-/* 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_AGCRSSITable, 0x0000F000, reg); */
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] = (reg << 28)|(PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord)&0x0fffffff);
 	}
@@ -1353,11 +1305,6 @@ static void phy_IQCalibrate_8723B(
 
 	_PHY_PathADDAOn8723B(padapter, ADDA_REG, is2T);
 
-/* no serial mode */
-
-	/* save RF path for 8723B */
-/* 	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord); */
-/* 	Path_SEL_RF = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff); */
 
 	/* MAC settings */
 	_PHY_MACSettingCalibration8723B(padapter, IQK_MAC_REG, pDM_Odm->RFCalibrateInfo.IQK_MAC_backup);
@@ -1370,14 +1317,6 @@ static void phy_IQCalibrate_8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XCD_RFInterfaceSW, bMaskDWord, 0x22204000);
 
 
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XAB_RFInterfaceSW, BIT10, 0x01); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XAB_RFInterfaceSW, BIT26, 0x01); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XA_RFInterfaceOE, BIT10, 0x00); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XB_RFInterfaceOE, BIT10, 0x00); */
-
-
-/* RX IQ calibration setting for 8723B D cut large current issue when leaving IPS */
-
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x30000);
@@ -1389,7 +1328,6 @@ static void phy_IQCalibrate_8723B(
 /* path A TX IQK */
 	for (i = 0 ; i < retryCount ; i++) {
 		PathAOK = phy_PathA_IQK_8723B(padapter, is2T, RF_Path);
-/* 		if (PathAOK == 0x03) { */
 		if (PathAOK == 0x01) {
 			/*  Path A Tx IQK Success */
 			PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
@@ -1407,8 +1345,6 @@ static void phy_IQCalibrate_8723B(
 	for (i = 0 ; i < retryCount ; i++) {
 		PathAOK = phy_PathA_RxIQK8723B(padapter, is2T, RF_Path);
 		if (PathAOK == 0x03) {
-/* 				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
-/* 				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
 				result[t][2] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
 				result[t][3] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
 			break;
@@ -1439,8 +1375,6 @@ static void phy_IQCalibrate_8723B(
 		for (i = 0 ; i < retryCount ; i++) {
 			PathBOK = phy_PathB_RxIQK8723B(padapter, is2T);
 			if (PathBOK == 0x03) {
-/* 				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
-/* 				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
 				result[t][6] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
 				result[t][7] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
 				break;
@@ -1462,9 +1396,6 @@ static void phy_IQCalibrate_8723B(
 
 		_PHY_ReloadADDARegisters8723B(padapter, IQK_BB_REG_92C, pDM_Odm->RFCalibrateInfo.IQK_BB_backup, IQK_BB_REG_NUM);
 
-		/* Reload RF path */
-/* 		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB); */
-/* 		PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff, Path_SEL_RF); */
 
 		/* Allen initial gain 0xc50 */
 		/*  Restore RX initial gain */
@@ -1642,14 +1573,6 @@ void PHY_IQCalibrate_8723B(
 
 	/* save default GNT_BT */
 	GNT_BT_default = PHY_QueryBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord);
-	/*  Save RF Path */
-/* 	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord); */
-/* 	Path_SEL_RF = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff); */
-
-    /* set GNT_BT = 0, pause BT traffic */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT12, 0x0); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT11, 0x1); */
-
 
 	for (i = 0; i < 8; i++) {
 		result[0][i] = 0;
@@ -1742,10 +1665,6 @@ void PHY_IQCalibrate_8723B(
 
 	/* restore GNT_BT */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, GNT_BT_default);
-	/*  Restore RF Path */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff, Path_SEL_RF); */
-
 	/* Resotr RX mode table parameter */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x18000);
@@ -1754,10 +1673,6 @@ void PHY_IQCalibrate_8723B(
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
2.53.0

