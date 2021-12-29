Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4192CA1
	for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 20:51:30 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id t26so46571219wrb.4
        for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 12:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7OxXY+ZqgjLpika47wdXhBbBZdzHjTmR8etjcUZ564g=;
        b=IVWUIHhGJ3Yib/m1T8Kwt+phY1UuZ/649FJHklnxj/BSw53f0UCuu50rKNCcx6MsL/
         90chKN3wIr8eMYrFFUrX5QW9Vh1z+OK9kDvYzkIooSP4jJgNLukxnKMHws68m2Pq4vbE
         XLIH7sDI+ZfuMYQr8UKXWc7zpXREYaEAKI4jbDRRhuYI1Ns8ggs4CaDD8H8KeYyDPMfg
         otHPdQjTSQwcgr1NIO3HH65u7q4cYaMxigwRfrlgtdxGsH7vh3jlfN3XqmCniCGOWjyE
         bZzCKEqZmLNYdpj2xOeK4AGa5jMNhkXb49giiqkphEScf4AmsLjWcOTDKhYfsmGyMHZm
         kCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7OxXY+ZqgjLpika47wdXhBbBZdzHjTmR8etjcUZ564g=;
        b=ZBTQTmxS+oZt38uu1ninp9CO9oDwdNFihQnGMb37VPwkajPIJK3YhE02/3auii+dCu
         6DM4O/l7Gzz1EOwkuYz0bxKVG1ct0LYqPBMRM8Yz1ock6nqEmf4HO1c3aIy8dp79AVWw
         QF2CIWm5cPrV+hRIXDDh3eEmiGtWzKAzJ2J11mfYr5N40mZ3QzR8BmkldWPu370fQBwj
         4/6BEtVeDM2MVo0Tty3VPs1jpq3OHP4Z+Y5oI7ihH31/xML7heG+IqdLQtD7vMAx1mm8
         eOMAjuMSzAFq237LlzpY0gcNcNAvf/18330ig7vtkXx4oOHHx/oJ9uCPuP+JLLayw+W2
         J4Aw==
X-Gm-Message-State: AOAM530QbdF5sax3G+r3+0wrFxL7EgglfE/WaqFUXV4nIpdzGBUbd+uP
	YCsmRqtKeGJBIoobF+kNeZU=
X-Google-Smtp-Source: ABdhPJw30pvdWAGAclxqwM6knVSs12phm4xW+nJx6KUjns5q/EyoH5fuM15QO5ia0cZESa7ThhNpHQ==
X-Received: by 2002:a5d:484f:: with SMTP id n15mr22269008wrs.219.1640811089274;
        Wed, 29 Dec 2021 12:51:29 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id l12sm27421989wmq.2.2021.12.29.12.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 12:51:28 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 04/32] staging: r8188eu: remove ODM_SetRFReg()
Date: Wed, 29 Dec 2021 21:50:40 +0100
Message-Id: <20211229205108.26373-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211229205108.26373-1-straube.linux@gmail.com>
References: <20211229205108.26373-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ODM_SetRFReg() is just a wrapper around rtl8188e_PHY_SetRFReg().
Remove ODM_SetRFReg() and call rtl8188e_PHY_SetRFReg() directly.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c  | 34 +++++++++----------
 .../staging/r8188eu/hal/odm_RegConfig8188E.c  |  2 +-
 drivers/staging/r8188eu/hal/odm_interface.c   |  6 ----
 .../staging/r8188eu/include/odm_interface.h   |  3 --
 4 files changed, 17 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
index f6f99b2acc01..8eec8ea95162 100644
--- a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
+++ b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
@@ -409,14 +409,14 @@ phy_PathA_RxIQK(struct adapter *adapt)
 	/* 1 Get TXIMR setting */
 	/* modify RXIQK mode table */
 	ODM_SetBBReg(dm_odm, rFPGA0_IQK, bMaskDWord, 0x00000000);
-	ODM_SetRFReg(dm_odm, RF_PATH_A, RF_WE_LUT, bRFRegOffsetMask, 0x800a0);
-	ODM_SetRFReg(dm_odm, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x30000);
-	ODM_SetRFReg(dm_odm, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0000f);
-	ODM_SetRFReg(dm_odm, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xf117B);
+	rtl8188e_PHY_SetRFReg(adapt, RF_PATH_A, RF_WE_LUT, bRFRegOffsetMask, 0x800a0);
+	rtl8188e_PHY_SetRFReg(adapt, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x30000);
+	rtl8188e_PHY_SetRFReg(adapt, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0000f);
+	rtl8188e_PHY_SetRFReg(adapt, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xf117B);
 
 	/* PA,PAD off */
-	ODM_SetRFReg(dm_odm, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0x980);
-	ODM_SetRFReg(dm_odm, RF_PATH_A, 0x56, bRFRegOffsetMask, 0x51000);
+	rtl8188e_PHY_SetRFReg(adapt, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0x980);
+	rtl8188e_PHY_SetRFReg(adapt, RF_PATH_A, 0x56, bRFRegOffsetMask, 0x51000);
 
 	ODM_SetBBReg(dm_odm, rFPGA0_IQK, bMaskDWord, 0x80800000);
 
@@ -458,10 +458,10 @@ phy_PathA_RxIQK(struct adapter *adapt)
 	/* 1 RX IQK */
 	/* modify RXIQK mode table */
 	ODM_SetBBReg(dm_odm, rFPGA0_IQK, bMaskDWord, 0x00000000);
-	ODM_SetRFReg(dm_odm, RF_PATH_A, RF_WE_LUT, bRFRegOffsetMask, 0x800a0);
-	ODM_SetRFReg(dm_odm, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x30000);
-	ODM_SetRFReg(dm_odm, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0000f);
-	ODM_SetRFReg(dm_odm, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xf7ffa);
+	rtl8188e_PHY_SetRFReg(adapt, RF_PATH_A, RF_WE_LUT, bRFRegOffsetMask, 0x800a0);
+	rtl8188e_PHY_SetRFReg(adapt, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x30000);
+	rtl8188e_PHY_SetRFReg(adapt, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0000f);
+	rtl8188e_PHY_SetRFReg(adapt, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xf7ffa);
 	ODM_SetBBReg(dm_odm, rFPGA0_IQK, bMaskDWord, 0x80800000);
 
 	/* IQK setting */
@@ -492,7 +492,7 @@ phy_PathA_RxIQK(struct adapter *adapt)
 
 	/* reload RF 0xdf */
 	ODM_SetBBReg(dm_odm, rFPGA0_IQK, bMaskDWord, 0x00000000);
-	ODM_SetRFReg(dm_odm, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0x180);
+	rtl8188e_PHY_SetRFReg(adapt, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0x180);
 
 	if (!(regeac & BIT(27)) &&		/* if Tx is OK, check whether Rx is OK */
 	    (((regEA4 & 0x03FF0000) >> 16) != 0x132) &&
@@ -839,8 +839,6 @@ static void phy_LCCalibrate_8188E(struct adapter *adapt, bool is2t)
 {
 	u8 tmpreg;
 	u32 RF_Amode = 0, RF_Bmode = 0, LC_Cal;
-	struct hal_data_8188e *pHalData = &adapt->haldata;
-	struct odm_dm_struct *dm_odm = &pHalData->odmpriv;
 
 	/* Check continuous TX and Packet TX */
 	tmpreg = rtw_read8(adapt, 0xd03);
@@ -861,18 +859,18 @@ static void phy_LCCalibrate_8188E(struct adapter *adapt, bool is2t)
 
 		/* 2. Set RF mode = standby mode */
 		/* Path-A */
-		ODM_SetRFReg(dm_odm, RF_PATH_A, RF_AC, bMask12Bits, (RF_Amode & 0x8FFFF) | 0x10000);
+		rtl8188e_PHY_SetRFReg(adapt, RF_PATH_A, RF_AC, bMask12Bits, (RF_Amode & 0x8FFFF) | 0x10000);
 
 		/* Path-B */
 		if (is2t)
-			ODM_SetRFReg(dm_odm, RF_PATH_B, RF_AC, bMask12Bits, (RF_Bmode & 0x8FFFF) | 0x10000);
+			rtl8188e_PHY_SetRFReg(adapt, RF_PATH_B, RF_AC, bMask12Bits, (RF_Bmode & 0x8FFFF) | 0x10000);
 	}
 
 	/* 3. Read RF reg18 */
 	LC_Cal = rtl8188e_PHY_QueryRFReg(adapt, RF_PATH_A, RF_CHNLBW, bMask12Bits);
 
 	/* 4. Set LC calibration begin	bit15 */
-	ODM_SetRFReg(dm_odm, RF_PATH_A, RF_CHNLBW, bMask12Bits, LC_Cal | 0x08000);
+	rtl8188e_PHY_SetRFReg(adapt, RF_PATH_A, RF_CHNLBW, bMask12Bits, LC_Cal | 0x08000);
 
 	ODM_sleep_ms(100);
 
@@ -881,11 +879,11 @@ static void phy_LCCalibrate_8188E(struct adapter *adapt, bool is2t)
 		/* Deal with continuous TX case */
 		/* Path-A */
 		rtw_write8(adapt, 0xd03, tmpreg);
-		ODM_SetRFReg(dm_odm, RF_PATH_A, RF_AC, bMask12Bits, RF_Amode);
+		rtl8188e_PHY_SetRFReg(adapt, RF_PATH_A, RF_AC, bMask12Bits, RF_Amode);
 
 		/* Path-B */
 		if (is2t)
-			ODM_SetRFReg(dm_odm, RF_PATH_B, RF_AC, bMask12Bits, RF_Bmode);
+			rtl8188e_PHY_SetRFReg(adapt, RF_PATH_B, RF_AC, bMask12Bits, RF_Bmode);
 	} else {
 		/*  Deal with Packet TX case */
 		rtw_write8(adapt, REG_TXPAUSE, 0x00);
diff --git a/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c b/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c
index f75086d7c569..c5f424c89e36 100644
--- a/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c
+++ b/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c
@@ -20,7 +20,7 @@ void odm_ConfigRFReg_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr,
 	} else if (Addr == 0xf9) {
 		ODM_delay_us(1);
 	} else {
-		ODM_SetRFReg(pDM_Odm, RF_PATH, RegAddr, bRFRegOffsetMask, Data);
+		rtl8188e_PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH, RegAddr, bRFRegOffsetMask, Data);
 		/*  Add 1us delay between BB/RF register setting. */
 		ODM_delay_us(1);
 	}
diff --git a/drivers/staging/r8188eu/hal/odm_interface.c b/drivers/staging/r8188eu/hal/odm_interface.c
index bf82f40cca24..42d6485758c0 100644
--- a/drivers/staging/r8188eu/hal/odm_interface.c
+++ b/drivers/staging/r8188eu/hal/odm_interface.c
@@ -16,12 +16,6 @@ u32 ODM_GetBBReg(struct odm_dm_struct *pDM_Odm, u32 RegAddr, u32 BitMask)
 	return rtl8188e_PHY_QueryBBReg(Adapter, RegAddr, BitMask);
 }
 
-void ODM_SetRFReg(struct odm_dm_struct *pDM_Odm, enum rf_radio_path	eRFPath, u32 RegAddr, u32 BitMask, u32 Data)
-{
-	struct adapter *Adapter = pDM_Odm->Adapter;
-	rtl8188e_PHY_SetRFReg(Adapter, (enum rf_radio_path)eRFPath, RegAddr, BitMask, Data);
-}
-
 /*  ODM Memory relative API. */
 s32 ODM_CompareMemory(struct odm_dm_struct *pDM_Odm, void *pBuf1, void *pBuf2, u32 length)
 {
diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index aabc33927a30..29bf5ae468da 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -17,9 +17,6 @@ void ODM_SetBBReg(struct odm_dm_struct *pDM_Odm, u32 RegAddr,
 
 u32 ODM_GetBBReg(struct odm_dm_struct *pDM_Odm, u32 RegAddr, u32 BitMask);
 
-void ODM_SetRFReg(struct odm_dm_struct *pDM_Odm, enum rf_radio_path eRFPath,
-		  u32 RegAddr, u32 BitMask, u32 Data);
-
 /*  Memory Relative Function. */
 s32 ODM_CompareMemory(struct odm_dm_struct *pDM_Odm, void *pBuf1, void *pBuf2,
 		      u32 length);
-- 
2.34.1

