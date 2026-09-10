Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B0A373BEC
	for <linux-staging@lists.linux.dev>; Thu, 10 Sep 2026 22:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789077857; cv=none; b=VgITgDng8R1yt4KOpYQS5WXY75TWHkr0uAVhMvq/ZFtkdQ94ZWgQII11/3ygxLfOp2oTentK5p40MHvEcSk4G7P+GX4EYH/sZUelsq4Z7UWI+mKikiRR+1YW7zFdLNxwYTGAr+U4pM/VrA2qOZaHNw9o2QI8zTubwyvdoIGo98o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789077857; c=relaxed/simple;
	bh=4FqLIuzPCUJHLa7U9P39YyFwiO8mAamMdNyBeAXrZdQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sUYBOeyxy9vi+LpqEJhaAfHaOkePjD23jSaTBgV/dNV+1coT/+6lvIOOZRIK8pwUsImt+rHWP+/eA5fN+WiCHLGFCERRussXGKithT2PBjl9VU45yx1BCwE6oN69c/KIh8NNDvNnG3WtmSZ3GsxLeTiBGLRCEIvLqODMHOHXuNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXDU7bS3; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXDU7bS3"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc1c9879395so240433a12.1
        for <linux-staging@lists.linux.dev>; Thu, 10 Sep 2026 15:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789077856; x=1789682656; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=haAUYv0adF2bWSJGhF0QNxV5fMREB6yRDDR4DGCp+IQ=;
        b=YXDU7bS36cNvTs/iM6jSI5okJqXrKDgyIfJkg4PGx5rRgsFGHRDLaGAvkjfXg/xG28
         sa9kwQzhE1NdLoXwNb/kfLuxsXORwyWq/2yl2BV3j8v951ubmZJPAPKsoILJlHRpZ4xG
         iIc9aYEuVYnhRyD7cubxrIatzIfTz1NKKnub+W2BTKyKHYnFvCxQ1IAYp7akVxpHOBOc
         QxR64qYHEq+wbUMc7diBA5+SaYxsv6feU4a3q89KC1P1UWHMvGE9rt2YMzu/EeOj0LER
         L4VxrX1JB2ogDDdz0dhZFwnsWP7BUCVv2441g4hgeACIUpaxxNPXeyGhbl9D54+splAp
         ZZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789077856; x=1789682656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=haAUYv0adF2bWSJGhF0QNxV5fMREB6yRDDR4DGCp+IQ=;
        b=LJIKiTUVzSNIwWMoXuXu/jQTqwFCQhNuLc+/Mbu8rfss6dbDnh3aOBdF6PqGCbUHdF
         p4B2Ok8WnWdiCiRu2YwItcbM/8h3RvgowABz5TCXSdF+2q4INB+QYIKgGC5NZ5ZL40wJ
         mjhl0CGwaSR+PzPTF4pxmG0HSP6xPP+FZhnVQIL6jNl0/K1SrhcxPz+Eg49MwlSzQtQk
         TE17ruqiYzFiIP408YBJwN/laMUlQivUXhV1QPCCLKLXKLRbPcN9v7gmDLJfvgPCMv2w
         sT7CQm87ThsET/7MYXVsNGOMW3+vmUr8zprJezJvwwROLnY/sLcY+iS2tWLCquJVDgDw
         wJgA==
X-Gm-Message-State: AFuF++lO3ZwuUQPFqYlaTKDirI+jmg/CxmK5LgHVL7WK1ZoGo8/EkoMX
	ssUCmad9seSH8mN0AP6zIK62LYYTuPDO8F0TquQfaxECAvefVjzuj8tSsR2DwQ==
X-Gm-Gg: AYBFou24F47D+dmxn7A82dCP8jd093DotyLb3A6Qadmhn6YdNNmRrBS46PGg+6zVTgh
	ekvMrfkG7822m3SKseD971/KLW0FtUPLdFVIiYvi3KJz7rMDv08FmKxvlwbDwJwvOvBwaz5oZXR
	gs0+3Boog46yCdFr3gbQn6eYOoisPDVl4ZoqcoNPe8SWguEwFsow4d2niPNL/bSoZ2ABCBm/eZq
	UMonLvny7HisXqwBUTBIHWG5hF7OoVbLpgJbmOC+OdkvYZRm5MGTMgiu0+h9V/7EkIjhZnamCgw
	Jj/VLw/ol9/VqbmpOzpFIjhlD3Mw6Tdpgz76TexDlxR+Q9z8uP3GwiPo07lI1GtteBMFTI9A/WU
	k/IJ8cIgaWQDG6gkcqMvb6uo0w5ZoTZNVSUkUQYTxW6VRApas5W/KsFKBpJd8HKW+pJ2XNVev4L
	Gu2Cplr4BbyaW9aVeeCZnsM4xSKjtnpxlE6bbD+0tIeK2DheSRtmrJ1Metv3UTJ4w81U0B4Qm8B
	UMUDq/LEw==
X-Received: by 2002:a17:90b:4b0c:b0:398:dc16:3c29 with SMTP id 98e67ed59e1d1-39d9bc35bbbmr1334592a91.7.1789077855686;
        Thu, 10 Sep 2026 15:04:15 -0700 (PDT)
Received: from TestUbuntu22.. ([67.169.161.65])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33ba4ed64fcsm997755eec.16.2026.09.10.15.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 15:04:15 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guojy.bj@gmail.com
Subject: [PATCH 2/3] staging: rtl8723bs: delete empty comment lines in rtl8723b_*.h files
Date: Thu, 10 Sep 2026 15:03:58 -0700
Message-Id: <20260910220359.6683-3-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910220359.6683-1-guojy.bj@gmail.com>
References: <20260910220359.6683-1-guojy.bj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delete all empty comment lines /*  */  in
include/rtl8723b_*.h header files as they are not serving any purpose.
Add back a newline if needed for spacing, while avoiding multiple blank
lines.

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 .../staging/rtl8723bs/include/rtl8723b_cmd.h  |  8 +--
 .../staging/rtl8723bs/include/rtl8723b_dm.h   | 10 +--
 .../staging/rtl8723bs/include/rtl8723b_hal.h  |  4 --
 .../staging/rtl8723bs/include/rtl8723b_spec.h | 72 +------------------
 .../staging/rtl8723bs/include/rtl8723b_xmit.h | 10 +--
 5 files changed, 7 insertions(+), 97 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_cmd.h b/drivers/staging/rtl8723bs/include/rtl8723b_cmd.h
index 6b2d79e19088..fb874971a2d4 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_cmd.h
@@ -7,9 +7,7 @@
 #ifndef __RTL8723B_CMD_H__
 #define __RTL8723B_CMD_H__
 
-/*  */
 /*     H2C CMD DEFINITION    ------------------------------------------------ */
-/*  */
 
 enum {
 	/* Common Class: 000 */
@@ -71,9 +69,9 @@ enum {
 	H2C_8723B_RESET_TSF = 0xC0,
 	H2C_8723B_MAXID,
 };
-/*  */
+
 /*     H2C CMD CONTENT    -------------------------------------------------- */
-/*  */
+
 /* _RSVDPAGE_LOC_CMD_0x00 */
 #define SET_8723B_H2CCMD_RSVDPAGE_LOC_PROBE_RSP(__pH2CCmd, __Value)			SET_BITS_TO_LE_1BYTE_8BIT(__pH2CCmd, 0, 8, __Value)
 #define SET_8723B_H2CCMD_RSVDPAGE_LOC_PSPOLL(__pH2CCmd, __Value)				SET_BITS_TO_LE_1BYTE_8BIT((__pH2CCmd)+1, 0, 8, __Value)
@@ -158,9 +156,7 @@ enum {
 #define SET_8723B_H2CCMD_BT_FW_PATCH_ADDR2(__pH2CCmd, __Value)					SET_BITS_TO_LE_1BYTE((__pH2CCmd)+4, 0, 8, __Value)
 #define SET_8723B_H2CCMD_BT_FW_PATCH_ADDR3(__pH2CCmd, __Value)					SET_BITS_TO_LE_1BYTE((__pH2CCmd)+5, 0, 8, __Value)
 
-/*  */
 /*     Function Statement     -------------------------------------------------- */
-/*  */
 
 /*  host message to firmware cmd */
 void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 Mode);
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_dm.h b/drivers/staging/rtl8723bs/include/rtl8723b_dm.h
index 50ab7aed079e..cc94edcaeb3c 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_dm.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_dm.h
@@ -6,21 +6,13 @@
  ******************************************************************************/
 #ifndef __RTL8723B_DM_H__
 #define __RTL8723B_DM_H__
-/*  */
+
 /*  Description: */
-/*  */
 /*  This file is for 8723B dynamic mechanism only */
-/*  */
-/*  */
-/*  */
 
-/*  */
 /*  structure and define */
-/*  */
 
-/*  */
 /*  function prototype */
-/*  */
 
 void rtl8723b_init_dm_priv(struct adapter *padapter);
 
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index 497b1cbc54c8..8d1d721a6d72 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -19,9 +19,7 @@
 #include "Hal8192CPhyReg.h"
 #include "hal_phy_cfg.h"
 
-/*  */
 /* RTL8723B From header */
-/*  */
 
 #define FW_8723B_SIZE          0x8000
 #define FW_8723B_START_ADDRESS 0x1000
@@ -150,9 +148,7 @@ struct rt_firmware_hdr {
 #define EFUSE_ACCESS_ON  0x69 /* For RTL8723 only. */
 #define EFUSE_ACCESS_OFF 0x00 /* For RTL8723 only. */
 
-/*  */
 /* EFUSE for BT definition */
-/*  */
 #define EFUSE_BT_REAL_BANK_CONTENT_LEN 512
 #define EFUSE_BT_REAL_CONTENT_LEN      1536 /* 512*3 */
 #define EFUSE_BT_MAP_LEN               1024 /* 1k bytes */
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_spec.h b/drivers/staging/rtl8723bs/include/rtl8723b_spec.h
index 7f749e32a5b9..a5ca5ae1a934 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_spec.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_spec.h
@@ -9,11 +9,7 @@
 
 #define HAL_NAV_UPPER_UNIT_8723B		128		/*  micro-second */
 
-/*  */
-/*  */
 /*	0x0000h ~ 0x00FFh	System Configuration */
-/*  */
-/*  */
 #define REG_RSV_CTRL_8723B				0x001C	/*  3 Byte */
 #define REG_BT_WIFI_ANTENNA_SWITCH_8723B	0x0038
 #define REG_HSISR_8723B					0x005c
@@ -29,11 +25,7 @@
 #define REG_HISR1_8723B					0x00BC
 #define REG_PMC_DBG_CTRL2_8723B			0x00CC
 
-/*  */
-/*  */
 /*	0x0100h ~ 0x01FFh	MACTOP General Configuration */
-/*  */
-/*  */
 #define REG_C2HEVT_CMD_ID_8723B	0x01A0
 #define REG_C2HEVT_CMD_LEN_8723B	0x01AE
 #define REG_WOWLAN_WAKE_REASON 0x01C7
@@ -45,25 +37,14 @@
 #define REG_HMEBOX_EXT2_8723B			0x01F8
 #define REG_HMEBOX_EXT3_8723B			0x01FC
 
-/*  */
-/*  */
 /*	0x0200h ~ 0x027Fh	TXDMA Configuration */
-/*  */
-/*  */
 
-/*  */
-/*  */
 /*	0x0280h ~ 0x02FFh	RXDMA Configuration */
-/*  */
-/*  */
+
 #define REG_RXDMA_CONTROL_8723B		0x0286 /*  Control the RX DMA. */
 #define REG_RXDMA_MODE_CTRL_8723B		0x0290
 
-/*  */
-/*  */
 /*	0x0300h ~ 0x03FFh	PCIe */
-/*  */
-/*  */
 #define	REG_PCIE_CTRL_REG_8723B		0x0300
 #define	REG_INT_MIG_8723B				0x0304	/*  Interrupt Migration */
 #define	REG_BCNQ_DESA_8723B			0x0308	/*  TX Beacon Descriptor Address */
@@ -86,49 +67,27 @@
 #define	REG_PCIE_HCPWM_8723B			0x0363	/* PCIe CPWM */
 #define	REG_PCIE_MULTIFET_CTRL_8723B	0x036A	/* PCIE Multi-Fethc Control */
 
-/*  */
-/*  */
 /*	0x0400h ~ 0x047Fh	Protocol Configuration */
-/*  */
-/*  */
 #define REG_TXPKTBUF_BCNQ_BDNY_8723B	0x0424
 #define REG_TXPKTBUF_MGQ_BDNY_8723B	0x0425
 #define REG_TXPKTBUF_WMAC_LBK_BF_HD_8723B	0x045D
 #define REG_AMPDU_BURST_MODE_8723B	0x04BC
 
-/*  */
-/*  */
 /*	0x0500h ~ 0x05FFh	EDCA Configuration */
-/*  */
-/*  */
 #define REG_SECONDARY_CCA_CTRL_8723B	0x0577
 
-/*  */
-/*  */
 /*	0x0600h ~ 0x07FFh	WMAC Configuration */
-/*  */
-/*  */
 
-/*  */
 /*  SDIO Bus Specification */
-/*  */
 
-/*  */
 /*  SDIO CMD Address Mapping */
-/*  */
 
-/*  */
 /*  I/O bus domain (Host) */
-/*  */
 
-/*  */
 /*  SDIO register */
-/*  */
 #define SDIO_REG_HCPWM1_8723B	0x025 /*  HCI Current Power Mode 1 */
 
-/*  */
 /*	8723 Register Bit and Content definition */
-/*  */
 
 /* 2 HSISR */
 /*  interrupt mask which needs to clear */
@@ -138,54 +97,27 @@
 								HSISR_PDNINT |\
 								HSISR_GPIO9_INT)
 
-/*  */
-/*  */
 /*	0x0100h ~ 0x01FFh	MACTOP General Configuration */
-/*  */
-/*  */
 
-/*  */
-/*  */
 /*	0x0200h ~ 0x027Fh	TXDMA Configuration */
-/*  */
-/*  */
 
-/*  */
-/*  */
 /*	0x0280h ~ 0x02FFh	RXDMA Configuration */
-/*  */
-/*  */
 #define BIT_USB_RXDMA_AGG_EN	BIT(31)
 #define RXDMA_AGG_MODE_EN		BIT(1)
 
-/*  */
-/*  */
 /*	0x0400h ~ 0x047Fh	Protocol Configuration */
-/*  */
-/*  */
 
-/*  */
 /*        8723B REG_CCK_CHECK						(offset 0x454) */
-/*  */
+
 #define BIT_BCN_PORT_SEL		BIT(5)
 
-/*  */
-/*  */
 /*	0x0500h ~ 0x05FFh	EDCA Configuration */
-/*  */
-/*  */
 
-/*  */
-/*  */
 /*	0x0600h ~ 0x07FFh	WMAC Configuration */
-/*  */
-/*  */
 #define EEPROM_RF_GAIN_OFFSET			0xC1
 #define EEPROM_RF_GAIN_VAL			0x1F6
 
-/*  */
 /*        8195 IMR/ISR bits						(offset 0xB0,  8bits) */
-/*  */
 #define	IMR_DISABLED_8723B					0
 /*  IMR DW0(0x00B0-00B3) Bit 0-31 */
 #define	IMR_TIMER2_8723B					BIT(31)		/*  Timeout interrupt 2 */
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h b/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
index ddf868c7899b..d02ead67777a 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
@@ -7,9 +7,7 @@
 #ifndef __RTL8723B_XMIT_H__
 #define __RTL8723B_XMIT_H__
 
-/*  */
 /*  Queue Select Value in TxDesc */
-/*  */
 #define QSLT_BK							0x2/* 0x01 */
 #define QSLT_BE							0x0
 #define QSLT_VI							0x5/* 0x4 */
@@ -56,9 +54,7 @@
 /* OFFSET 20 */
 #define SGI		BIT(6)
 
-/*  */
 /* defined for TX DESC Operation */
-/*  */
 struct txdesc_8723b {
 	/*  Offset 0 */
 	u32 pktlen:16;
@@ -364,11 +360,9 @@ struct txdesc_8723b {
 #define SET_EARLYMODE_LEN3_8723B(__pAddr, __Value)					SET_BITS_TO_LE_4BYTE(__pAddr+4, 17, 15, __Value)
 
 #endif
-/*  */
-/*  */
+
 /* 	Rate */
-/*  */
-/*  */
+
 /*  CCK Rates, TxHT = 0 */
 #define DESC8723B_RATE1M				0x00
 #define DESC8723B_RATE2M				0x01
-- 
2.34.1

