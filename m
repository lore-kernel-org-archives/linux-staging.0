Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63D135A3B2
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 17:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772213277; cv=none; b=WbVHxrJGT3rUNDaeM0qHGbXv/oiqk1I6qKRaILqbB8ulZoaa7O/CyY6KnEgfDZPotzjdHzecYOs3IExpm5XDfeb85dZWznReqoNHJc53LfMc5hoQzpv5jESBjwmSmdXhZr2yvsvT4Rfu2OBDlmQUhESs8IAYAqo4N3gkIr5CT8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772213277; c=relaxed/simple;
	bh=Uyy0P/50J+zguA2nR0Xrs5bpcIHcz3crpVb1TTNfoYs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s01KHe1V1Y2Pg45PZBqIyzEIpI0IrjJa9ir4/0JOyr40WYDzR55VYVaE5W4G2NekbUjDuNSLmXKQ+Q2GDg6QipXeH78FtpFoLL7tpS+kozdfQPKCvj/Ll8FCFsKzMoGiCmV7Qp3X0X7NmL4kuFS9aqP/+mRNWUX0GOhBSOhBsrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aVdQrhLB; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aVdQrhLB"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-899a5cb04f9so31005756d6.2
        for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 09:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772213275; x=1772818075; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M1m4SRnWdoprPhg5W/7JgXd6LZPxjHGiXySFsGJDyKE=;
        b=aVdQrhLBPDoZ8PdjtfnYPFNlsQzZVGWWDAU7q7VIsbZhc7Tf8QtP9Z+bYKlbzWoI6P
         9NsGyvcFLO3x0zpw7U426DtTee1dTJQayWCWIAsaeWoKCDIfoSjBkjYt4YP1TtFwMFpU
         zox8/9xhXX/j9LYD4mLDRCN2MZleALaV81UkubG7aZc5N0uGJU1i68fOinfxVIJR5aN/
         Zbq9DXbhTQ1EgQMiLaBXqBxOgaFCf2EufbseiRIaSevXSnlvH7SGp7n5G9O4UlEG7//i
         U5FA/C3wKqw1bF5VpE7SLFGlI+m6XiPjmBA4GT0/YfhWxENLZhISBo8Ay7WCzN4gg5p7
         53PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772213275; x=1772818075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1m4SRnWdoprPhg5W/7JgXd6LZPxjHGiXySFsGJDyKE=;
        b=QzohQoYU4wzyT+8wym6Ajkfk06YhVGEyppU8STooj0ASvAfyRfIC2eB57XC5OIFknN
         om12C+HZEHF+CXeoWMTK6iNYmwULupgLJxr4zkoTNyiE6WpJNyaxpLxEciHTfeJ6awe0
         h2Tj7c49n0fmoWoirHP49wpRFrxqkAFMDiY0vhujJDXI1nowQ5HaTrMOLojKiINcwjL7
         th6qb6NIJ8wUbGulUX4Dg7AeRnFg2T3zB0R2+0JSzUeK7WYtd64IcUI3TSfb0Oz5AMvq
         rf6mb0AjfaUMWFzz1vXBdfXmuf8Bir28WuLt+EgGoF/DV1X1cl8JF5KZ7dRFHuVbqT/c
         BQSQ==
X-Gm-Message-State: AOJu0YxElQ1gEHxrYVjX+Et9oXpiCv5M2u3G4rP0Vykw1TCKitThKKBF
	9ePYjh0AWKXooGm/GKoMogyL/SjWkhAYtWW0CeUsbOLSXRRt0v6yisW9fLpJU9pn
X-Gm-Gg: ATEYQzxbBf1yVCmkG2ezje7iIIA7XEWivPtNqspHA8xHmcRTgOJjy3QnsWGAm80vQ4w
	U/Cd2SBhAvUkSGvee4+8KQlP5sXqs7D3pV79AdQp9feOu8r3GXaMrb/Ko7Gk8xlOnam0GXzC/p4
	DHO/5wjHY0DJa0T6ALr9dG573WmQpADtZI+GNa8349ubPCnI/W33HYrGzfja6BxjJF1IuXfuAo4
	bDBwCh2h5V/j7wBHXpg4H9HZLqgxyLpagZjfZoev9HxmvQy0gsP6pRrSssaOsSI1mVDXfahqNqW
	s+qfQZ/8ImFLk531NW+izdhJe+u5gtL4E4zZHjR5Fx/UATT79DWbJaVesbeVFwnXbaysj9X6Ocq
	OR428S0HricCqvfjL5ii1z+AdXACsmAcEhlanChexHZJjbY2Y+YEz75PLnztnjUyqEHolKPx4kf
	Zml2NkdM+w9delmcpS6gbyFUJme/o6bMgDgZNxlUTrc+s4FplivdBgsqSqzURy
X-Received: by 2002:a05:6214:2584:b0:895:498e:e9dd with SMTP id 6a1803df08f44-899d1d72523mr55707746d6.2.1772213274772;
        Fri, 27 Feb 2026 09:27:54 -0800 (PST)
Received: from NIKUNJ.resource.campus.njit.edu ([128.235.159.79])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c7377d7dsm45254076d6.26.2026.02.27.09.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 09:27:54 -0800 (PST)
From: Nikunj Kantaria <niktechgig@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikunj Kantaria <niktechgig@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove RTL8188E references
Date: Fri, 27 Feb 2026 12:27:34 -0500
Message-ID: <20260227172734.2266911-1-niktechgig@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all references to RTL8188E chip from the driver code.
This includes renaming variables, deleting unused macros and
struct members, and updating comments to reflect that this
driver is specifically for RTL8723BS.

This addresses the TODO item to remove leftover code for
other chips.

Signed-off-by: techy-Nik <niktechgig@gmail.com>
Signed-off-by: Nikunj Kantaria <niktechgig@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c   | 16 ++++++++--------
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.h   |  2 +-
 drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c     |  2 +-
 drivers/staging/rtl8723bs/hal/odm.h              |  3 ---
 drivers/staging/rtl8723bs/include/hal_com_reg.h  |  4 ++--
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h |  4 +++-
 6 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 9df3274c1..f2e19e044 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -23,14 +23,14 @@
 
 /*---------------------------Define Local Constant---------------------------*/
 
-/* In the case that we fail to read TxPowerTrack.txt, we use the table for
- * 88E as the default table.
+/* In the case that we fail to read TxPowerTrack.txt, we use the default
+ * delta swing table.
  */
-static u8 DeltaSwingTableIdx_2GA_N_8188E[] = {
+static u8 DeltaSwingTableIdx_2GA_N_8723B[] = {
 	0, 0, 0, 2, 2, 3, 3, 4,  4,  4,  4,  5,  5,  6,  6,
 	7, 7, 7, 7, 8, 8, 9, 9, 10, 10, 10, 11, 11, 11, 11
 };
-static u8 DeltaSwingTableIdx_2GA_P_8188E[] = {
+static u8 DeltaSwingTableIdx_2GA_P_8723B[] = {
 	0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 4, 4, 4,
 	4, 4, 4, 5, 5, 7, 7, 8, 8, 8, 9, 9, 9, 9, 9
 };
@@ -326,10 +326,10 @@ static void GetDeltaSwingTable_8723B(
 			*TemperatureDOWN_B = pRFCalibrateInfo->DeltaSwingTableIdx_2GB_N;
 		}
 	} else {
-		*TemperatureUP_A   = (u8 *)DeltaSwingTableIdx_2GA_P_8188E;
-		*TemperatureDOWN_A = (u8 *)DeltaSwingTableIdx_2GA_N_8188E;
-		*TemperatureUP_B   = (u8 *)DeltaSwingTableIdx_2GA_P_8188E;
-		*TemperatureDOWN_B = (u8 *)DeltaSwingTableIdx_2GA_N_8188E;
+		*TemperatureUP_A   = (u8 *)DeltaSwingTableIdx_2GA_P_8723B;
+		*TemperatureDOWN_A = (u8 *)DeltaSwingTableIdx_2GA_N_8723B;
+		*TemperatureUP_B   = (u8 *)DeltaSwingTableIdx_2GA_P_8723B;
+		*TemperatureDOWN_B = (u8 *)DeltaSwingTableIdx_2GA_N_8723B;
 	}
 }
 
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.h b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.h
index c83442917..a21764adb 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.h
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.h
@@ -65,4 +65,4 @@ void _PHY_MACSettingCalibration_8723B(
 	struct adapter *padapter, u32 *MACReg, u32 *MACBackup
 );
 
-#endif /*  #ifndef __HAL_PHY_RF_8188E_H__ */
+#endif /*  #ifndef __HAL_PHY_RF_8723B_H__ */
diff --git a/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c b/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
index 86404b5e6..7f57ae017 100644
--- a/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
+++ b/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
@@ -26,7 +26,7 @@ Major Change History:
 
 /*  */
 /*  Description: */
-/*  This routine deal with the Power Configuration CMDs parsing for RTL8723/RTL8188E Series IC. */
+/*  This routine deals with the Power Configuration CMDs parsing for RTL8723 Series IC. */
 /*  */
 /*  Assumption: */
 /*  We should follow specific format which was released from HW SD. */
diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index 1c929d88e..c4fce230c 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -203,7 +203,6 @@ struct odm_rate_adaptive {
 /*  Declare for common info */
 /*  */
 #define MAX_PATH_NUM_92CS		2
-#define MAX_PATH_NUM_8188E		1
 #define MAX_PATH_NUM_8192E		2
 #define MAX_PATH_NUM_8723B		1
 #define MAX_PATH_NUM_8812A		2
@@ -538,8 +537,6 @@ struct odm_rf_cal_t { /* ODM_RF_Calibration_Structure */
 	u8 DeltaSwingTableIdx_2GA_N[DELTA_SWINGIDX_SIZE];
 	u8 DeltaSwingTableIdx_2GB_P[DELTA_SWINGIDX_SIZE];
 	u8 DeltaSwingTableIdx_2GB_N[DELTA_SWINGIDX_SIZE];
-	u8 DeltaSwingTableIdx_2GA_P_8188E[DELTA_SWINGIDX_SIZE];
-	u8 DeltaSwingTableIdx_2GA_N_8188E[DELTA_SWINGIDX_SIZE];
 
 	/*  */
 
diff --git a/drivers/staging/rtl8723bs/include/hal_com_reg.h b/drivers/staging/rtl8723bs/include/hal_com_reg.h
index cf5c15dc2..a1cfe2f7d 100644
--- a/drivers/staging/rtl8723bs/include/hal_com_reg.h
+++ b/drivers/staging/rtl8723bs/include/hal_com_reg.h
@@ -202,7 +202,7 @@
 #define WCAMI					REG_CAMWRITE	/*  Software write CAM input content */
 
 /*  */
-/*        8723/8188E Host System Interrupt Status Register (offset 0x5C, 32 byte) */
+/*        8723 Host System Interrupt Status Register (offset 0x5C, 32 byte) */
 /*  */
 #define HSISR_GPIO12_0_INT				BIT0
 #define HSISR_SPS_OCP_INT				BIT5
@@ -539,7 +539,7 @@
 
 #define SDIO_HIMR_DISABLED			0
 
-/*  RTL8723/RTL8188E SDIO Host Interrupt Mask Register */
+/*  RTL8723 SDIO Host Interrupt Mask Register */
 #define SDIO_HIMR_RX_REQUEST_MSK		BIT0
 #define SDIO_HIMR_AVAL_MSK			BIT1
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index afa5631a4..a8ebcb314 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -10,7 +10,9 @@
 
 /* 	Commented by Albert 20101105 */
 /* 	Increase the SURVEY_TO value from 100 to 150  (100ms to 150ms) */
-/* 	The Realtek 8188CE SoftAP will spend around 100ms to send the probe response after receiving the probe request. */
+/*  The Realtek SoftAP will spend around 100ms to send the probe response
+ *  after receiving the probe request.
+ */
 /* 	So, this driver tried to extend the dwell time for each scanning channel. */
 /* 	This will increase the chance to receive the probe response from SoftAP. */
 
-- 
2.43.0

