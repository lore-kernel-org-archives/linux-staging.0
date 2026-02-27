Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD8D38E5F7
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 05:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772170928; cv=none; b=UHxilVCJ8OXSNTGpn41GKAywAYnGycp06eM5NL3b7xDU+VhfIYlM1kQ1Cz4ZOb/Rycc06rser7gCntgoyLM4wT6pidrFpT5VNlMR5huyuaoISktsmbj6aKZ5c48KrAaUeJCS4QG0BKm7TELdX0aDy2s8TW51Gwpsl9trEITiQyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772170928; c=relaxed/simple;
	bh=zmsupM9VegvhsjdSykGaYxxnPjKeCboE0a5qziv32gs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YEtur9b8ZEta12R+iV0VARn6+RP9WdUGIpcAOsoOXcS+cvNyUuP60AMx3V7WOT+7czd3x5v7VrsgEh5T9wfNGtFmyruWe7wjVccYsZQyO7ukNI2dSa4fzv9qzAP2DHHznZg7eE3WrylNreI6BdrjEnsdSAw8AhBsCOYRAHuLA7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Afexrh2Q; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Afexrh2Q"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-506a297c14bso16152561cf.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 21:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772170926; x=1772775726; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ssq9TpzF8ZsuA3Ephf3zMm3UiGyLwWJ1+YlM8IprLC8=;
        b=Afexrh2QXfVY71hGFdJw3JmXpNPrl/TRRAEBr9tWuB/WLB5ykpQb92x8oxw0vSC5j9
         mJss+UralKHJNmg75KS4T1JA3PNfEX2E2v3YmjnjK8/2b8Qm3Q0dmxPztelUo9P+TwEC
         0mId5hYyVV2lOI3Ukxq7J/5e2USHZLa5mKc9yiwRuOw0QdjAVEsIf6pwP/WKKwZV9QQz
         tuWicgEFZO9aHuyZt0TkTemzXGkCN/So7GkucugtPF6Gu/ZdFarp6DiG4OqgaG8PnflM
         FqdHZIZUBMOrIvOmEM3f3fc4CJqQgCyyhgPmftj4wAwTbR8MWp3pgbqqeVdNFwS2qdBx
         hiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772170926; x=1772775726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ssq9TpzF8ZsuA3Ephf3zMm3UiGyLwWJ1+YlM8IprLC8=;
        b=cFpBCcu20sjClHJPYs2uN546ylWyjNmrcTHlet0DFqY+XfLuSrcimhrrlIced7u/Js
         imonCREyn79IFhMiptquGfFk+gIjzAWc8N/I404sSYDcbWowXzHNKWVkmfk5QiWsbVjv
         J+U6loguRMEHME2TlZUeQ0BV6SbylrbuMohDG6vpqTzNDlgvnQvQT3Rx33PyLhJZCTsy
         RZsf9H20/Jf+9vMTpAJgmf47KkXK59Y7mRGoHOlIoJ3DtgH9QWdaNvoeJDe51fbGOVXw
         JF5gYFST1JCUUfTq/FYBUdgy8G/0IqwwNXH8MZv10uXxwhqnGN2Vb3JdpnWqJ3Oz7VlP
         bOPQ==
X-Gm-Message-State: AOJu0YyPnVbcgMrcZfvWsqv4Q9XYjvxN9zB6tEefNYqFqQp8bfruz2DV
	egIwXKxxBg9QEyv1ZKhKIOaOV+dKsiwbEvwFDTdWiEsAbg6adcwsd8W/V8kBvoj5
X-Gm-Gg: ATEYQzxtTUetekowctQF1huhhXLIVnw+aolChTejGtJ+WT7iLsaIOpuATeNduYKqb7o
	7uN2KUMnZf9a6PBaXcSrGlJVnAPRgvdwyh6+sbHRLmcjoZFj8Dxs8tS1a9B3xIPEUunftZd4+3q
	GFSjzbNMeZ0ZY38agUiy3Ze0VIDpdFilg92sE6e36ivzzY/1YsV+OoEfdxXzqwfi6BnCpu/HY41
	sVPRX2YAOe3Z8PSzqD3H3a8qeBytfmOBpUcBH1WhoW3fBa8idCLmMoXqN6Y2MabLRNf8K7lbMjp
	IzEWHyNAnP6IJmUmujc3K8d4QYur/8UG40Uhrt+SozvWgyAib7GA/qRWaWLSP9tCEE9t8+/hVHS
	mj6cfFlPLhvSHwmOOgwKe6tL3Hu/kdsuUIAHADpfBELuTKwYauvfwKaUUPfx37cuC6fjxUFy0zQ
	c8kgdBuasegEO9iEp8lGBhR2rTZ5eZyHzB4l9wSm1xLwNaB4FWjx58niPxlE7x9hPtv8hktYE71
	XIe
X-Received: by 2002:a05:622a:1445:b0:506:9a89:5f49 with SMTP id d75a77b69052e-507529b830fmr16212931cf.50.1772170925996;
        Thu, 26 Feb 2026 21:42:05 -0800 (PST)
Received: from NIKUNJ.localdomain (pool-96-240-15-29.nwrknj.fios.verizon.net. [96.240.15.29])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744ab3d88sm40345961cf.21.2026.02.26.21.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:42:05 -0800 (PST)
From: techy-Nik <niktechgig@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	techy-Nik <niktechgig@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove RTL8188E references
Date: Fri, 27 Feb 2026 00:41:45 -0500
Message-ID: <20260227054145.2261768-1-niktechgig@gmail.com>
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

