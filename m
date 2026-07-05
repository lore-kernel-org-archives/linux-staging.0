Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9135211A14
	for <linux-staging@lists.linux.dev>; Sun,  5 Jul 2026 15:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783265588; cv=none; b=HPBKwKuUue2/Q83w77j78tvgdvYawjzCvkrSvTXK1LgPTUay4WrEd8IkOzd9gsI078uoHRlRbrezi5WdbuIPQxt+Q9d1x6DDCV2LlJzQ4sfoFJnbo9WYD22ALvRaJXtXO+/UFdxeLMBsJc4CqHRbB5N+fDLfBqVhlMOqvEiyMPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783265588; c=relaxed/simple;
	bh=ATGU/8rGhnZEEvjZ93WYF/PdZbGhfRaZTJn31f/M9es=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V/5olqYP5jjsAF6HIepD9p0IG5vrAESm5ACxTk8K0usaWW6Ie7Zrswhlo/4hFzTovt3ZbOuBcXccwVmo781IpvYOK0Utq5CAw30vIr7HY1UZMqxLIPXp0IOQ8Auj7V0hn/MNuk3t0fIVK08PLGJ03RsOS3GMSOX1ip6Ni483/5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UxekoRbC; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxekoRbC"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so15341975e9.1
        for <linux-staging@lists.linux.dev>; Sun, 05 Jul 2026 08:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783265585; x=1783870385; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XMgii/iVxVB8xnoV5Xg9sOp0V7wf0u21y3U4TcuHcW8=;
        b=UxekoRbCuq+epA65MIPd022PIioLsOcntwN3n76pCyy5mBSdDoV9afeeGBQ3RbOSLZ
         JNttfLq2razCoOAMLWjr7JRjVu4cDVqRr997V6e85pJ5NcI1jH3f4G01OqnJLtt0qsqd
         TmC8t5Xj9F24nUo0NMgPPiH3G96SrCPKHRZjMTly3htL68vR5x/Hyf+IY5eMTBYWcH/a
         8FCYf1yHn0kHSm8JItQ1Je8fA61PM10pFEPLveSqvPW6BQJTwAamL+s2kLxGEIIT4jwt
         w5TEy1Sl/OSLRKY1KK9/ZwXG84i4b6TbT70udhyvFtkgqi0anIp9iJjCwsDpR0H84ZoE
         aXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783265585; x=1783870385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XMgii/iVxVB8xnoV5Xg9sOp0V7wf0u21y3U4TcuHcW8=;
        b=ER7q5dPSMkBSHL/IbBrro90oNkW1b9+QQaLporENgc1YXE9cHrNQGDCoBhls7FLQVd
         1FXcyDgEdIy7Xn+8pAszFffErB1V+o4sI43LKZOfWUUCqggjla2TNNbRHhj76L9/NFqs
         Iroi5LpURujogYwszEpsTRhZ8mZZ4Hyxb1oAV1reaKjDyZ1PzO33kNFnPSt0dYIRyJxG
         ZYuUkKl5VHWIpVCGqyzdemI2F7hc+LEftPCnFEENickOViEDqArzulCC8IVkfK81D7IK
         WbQrk3KmeDx3hxnC20AbeCMfF4rplIE5VZQWRSrT08an1OQ6TyABFSqvWtUTnrMYcy0v
         MzCg==
X-Gm-Message-State: AOJu0YxByot+jGSk4HvuvZm3kkjsx0cljC5D/X7FEjO6r0apViWh7Jtn
	LrxLhgYakTKkCPWyJtgVFanInt70aEDjEgq0jk9ESHvD0fbnkZMlidKm
X-Gm-Gg: AfdE7clQBNFjILCdjnLrxJKrxDd4QenDkYfY8fr5/qXVdd/bZI8299Qp9qSnyPTwPK2
	5unqqTvxOPkLtZM2zUy1qx6yOZV8fUCZujovm6ckaXyKJ8IxYxpq6Nv4Y61HHn4WXnqcwo1vnlq
	179U16hnqDiBPEKulrQkzu/oCs8Y3wQCTHK6cwCB5PTA3HnJolM5NtVme9HRFkjr2OUlQChTk4Q
	T3x0RECMrgNk2Fqvpo2yk17Vdl7OSgqdGasbXmxWVh4yN4379S5F+rXE4C5P2J0h42v+6xiJXWI
	5Ug1YGvB0CwdRw+l2V1is1Oh5dMnG62JNeb4NIsRBhLZ0wq3MIIY0kOeLBp1YTHKlvii/M9ipgd
	UTCMHhvjqT63Tmfklihgrxu+0dDnGVt5+4zVZN+RCygUcc12x/roRyjJSkEDCPenz4AZpgU4C1H
	NMz/lKEwU2DHRIXBXXXfu3PAbQv0iQB3waqzj3C/3QjgR+g+Gp+Pg=
X-Received: by 2002:a05:600c:8716:b0:493:c337:db19 with SMTP id 5b1f17b1804b1-493d11dc92amr73371625e9.17.1783265584777;
        Sun, 05 Jul 2026 08:33:04 -0700 (PDT)
Received: from fedora ([2a02:1388:a04:2d27:27e1:ef30:40f0:19b6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637bc21sm525059075e9.7.2026.07.05.08.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 08:33:04 -0700 (PDT)
From: Panagiotis Petrakopoulos <npetrakopoulos2003@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Panagiotis Petrakopoulos <npetrakopoulos2003@gmail.com>
Subject: [PATCH] staging: rtl8723bs: use rS0S1_PathSwitch define instead of 0x948 magic number
Date: Sun,  5 Jul 2026 18:32:43 +0300
Message-ID: <20260705153243.32484-1-npetrakopoulos2003@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using magic numbers is error prone. The address
0x948 already has a define, rS0S1_PathSwitch,
in Hal8192CPhyReg.h. Replace the occurrences of
the magic number 0x948 with the rS0S1_PathSwitch
define for more clarity and readability.

No functional change intended.

Signed-off-by: Panagiotis Petrakopoulos <npetrakopoulos2003@gmail.com>
---
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 40 +++++++++----------
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  2 +-
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 70b68f473d58..8eb59d7e089f 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -349,7 +349,7 @@ static u8 phy_PathA_IQK_8723B(
 	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
 
 	/*  Save RF Path */
-	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord);
+	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskDWord);
 
 	/* leave IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
@@ -387,10 +387,10 @@ static u8 phy_PathA_IQK_8723B(
 	/* Ant switch */
 	if (configPathB || (RF_Path == 0))
 		/*  wifi switch to S1 */
-		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000000);
+		PHY_SetBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskDWord, 0x00000000);
 	else
 		/*  wifi switch to S0 */
-		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
+		PHY_SetBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskDWord, 0x00000280);
 
 	/* GNT_BT = 0 */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00000800);
@@ -404,7 +404,7 @@ static u8 phy_PathA_IQK_8723B(
 	mdelay(IQK_DELAY_TIME_8723B);
 
 	/* restore Ant Path */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB);
+	PHY_SetBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskDWord, Path_SEL_BB);
 	/* GNT_BT = 1 */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00001800);
 
@@ -447,7 +447,7 @@ static u8 phy_PathA_RxIQK8723B(
 	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
 
 	/*  Save RF Path */
-	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord);
+	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskDWord);
 
 	/* leave IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
@@ -486,10 +486,10 @@ static u8 phy_PathA_RxIQK8723B(
 	/* Ant switch */
 	if (configPathB || (RF_Path == 0))
 		/*  wifi switch to S1 */
-		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000000);
+		PHY_SetBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskDWord, 0x00000000);
 	else
 		/*  wifi switch to S0 */
-		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
+		PHY_SetBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskDWord, 0x00000280);
 
 	/* GNT_BT = 0 */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00000800);
@@ -503,7 +503,7 @@ static u8 phy_PathA_RxIQK8723B(
 	mdelay(IQK_DELAY_TIME_8723B);
 
 	/* restore Ant Path */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB);
+	PHY_SetBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskDWord, Path_SEL_BB);
 	/* GNT_BT = 1 */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00001800);
 
@@ -572,10 +572,10 @@ static u8 phy_PathA_RxIQK8723B(
 	/* Ant switch */
 	if (configPathB || (RF_Path == 0))
 		/*  wifi switch to S1 */
-		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000000);
+		PHY_SetBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskDWord, 0x00000000);
 	else
 		/*  wifi switch to S0 */
-		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
+		PHY_SetBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskDWord, 0x00000280);
 
 	/* GNT_BT = 0 */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00000800);
@@ -589,7 +589,7 @@ static u8 phy_PathA_RxIQK8723B(
 	mdelay(IQK_DELAY_TIME_8723B);
 
 	/* restore Ant Path */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB);
+	PHY_SetBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskDWord, Path_SEL_BB);
 	/* GNT_BT = 1 */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00001800);
 
@@ -632,7 +632,7 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapter)
 	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
 
 	/*  Save RF Path */
-	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord);
+	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskDWord);
 
     /* leave IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
@@ -669,7 +669,7 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapter)
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x808000);
 
 	/* switch to path B */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
+	PHY_SetBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskDWord, 0x00000280);
 /* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
 
 	/* GNT_BT = 0 */
@@ -684,7 +684,7 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapter)
 	mdelay(IQK_DELAY_TIME_8723B);
 
 	/* restore Ant Path */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB);
+	PHY_SetBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskDWord, Path_SEL_BB);
 	/* GNT_BT = 1 */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00001800);
 
@@ -723,12 +723,12 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
 
 	/*  Save RF Path */
-	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord);
+	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskDWord);
     /* leave IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
 	/* switch to path B */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
+	PHY_SetBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskDWord, 0x00000280);
 	/* modify RXIQK mode table */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x18000);
@@ -761,7 +761,7 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x808000);
 
 	/* switch to path B */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
+	PHY_SetBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskDWord, 0x00000280);
 /* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
 
 	/* GNT_BT = 0 */
@@ -776,7 +776,7 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	mdelay(IQK_DELAY_TIME_8723B);
 
 	/* restore Ant Path */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB);
+	PHY_SetBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskDWord, Path_SEL_BB);
 	/* GNT_BT = 1 */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00001800);
 
@@ -847,7 +847,7 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x808000);
 
 	/* switch to path B */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
+	PHY_SetBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskDWord, 0x00000280);
 /* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
 
 	/* GNT_BT = 0 */
@@ -862,7 +862,7 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	mdelay(IQK_DELAY_TIME_8723B);
 
 	/* restore Ant Path */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB);
+	PHY_SetBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskDWord, Path_SEL_BB);
 	/* GNT_BT = 1 */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00001800);
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index d6369eb7b570..78fa99115751 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -376,7 +376,7 @@ int PHY_BBConfig8723B(struct adapter *Adapter)
 	RegVal = rtw_read16(Adapter, REG_SYS_FUNC_EN);
 	rtw_write16(Adapter, REG_SYS_FUNC_EN, (u16)(RegVal | BIT(13) | BIT(0) | BIT(1)));
 
-	rtw_write32(Adapter, 0x948, 0x280);	/*  Others use Antenna S1 */
+	rtw_write32(Adapter, rS0S1_PathSwitch, 0x280);	/*  Others use Antenna S1 */
 
 	rtw_write8(Adapter, REG_RF_CTRL, RF_EN | RF_RSTB | RF_SDMRSTB);
 
-- 
2.55.0

