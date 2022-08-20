Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9779E17E
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 18:35:50 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id t5so9165923edc.11
        for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 11:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=jmGCfK1PpP8C14WpA4xMyU1skN/b8h3qkvgiLCfaJxg=;
        b=oCzffgSUq/V+2wzclsKZMci/F6E/M5ip/NAOVcIKBkaiZVVlFihle9ZJrlRNyLasxd
         VSMa3dIimPrgts/sbV7SBqLgauXCIaQ3AN8UjMVrwJ6ITqyVL1rmrApdSZk7O5fqGWF4
         eCsv+RV/5gpphdGTfZ8Hpf0rPAm2pt9ANjRX4I4Cu9lNb1eyRhSNTX8jccqiUPwPz2XF
         uTB6sjQ7iXWsHtVudgTacsdP2N5EILfEh8BJV70U9BZKiCx1YBHuKyS5sG1sFJahnCTb
         /GNyl1vEZLa23cNc5y+kxoWYBet87CliNURHknE/QTHdcCgqKU134Ypp/lmsbD3mVFBQ
         Lq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=jmGCfK1PpP8C14WpA4xMyU1skN/b8h3qkvgiLCfaJxg=;
        b=TmpaDOul0AiUHAZSOI+/QiiMF5LPIRnEzWnDMerZALEFYvN0hIQ2fG/KtocN4BGKoZ
         FYAPkBovw4i5WseP+MFhXbCVIVXic5DbNLiDnGIM5uNuNbH4+zD3NNUQe2UNILbb/06K
         +vWbhkcBllOWP8O1tSNvyF8Xk1CWFfnXJydd6f1z0gaFgXXCrEZNC9IOvHZklweSyTjR
         ZLD4vA/n7wspen1cqSdMehcQcg+OQT1WnHjVWKe0QsZH32pwXkekNvmgn+tuwd36L0bc
         fd1M6og0jivZFB3iKYI5iy9D6mfwMbdF8AX+/uLpYOL0qTeFzxjkxTsauGBA4tx3pHOd
         x7ww==
X-Gm-Message-State: ACgBeo2g8hKIDJI0ic23RGOkb+o1qY2suzkwAasL8eTg/OhWGbZc2PDi
	4r8uagotkfK/LrS/j6MoVC8=
X-Google-Smtp-Source: AA6agR6NnD9LXopDiNYbMY1Ku12eeVCi4szTFy1ZE7IM6L6mdSxz73MveTdRluA088Id7R82dR7Ijg==
X-Received: by 2002:a05:6402:90d:b0:443:ef4c:480f with SMTP id g13-20020a056402090d00b00443ef4c480fmr10258249edz.128.1661020548790;
        Sat, 20 Aug 2022 11:35:48 -0700 (PDT)
Received: from nam-dell.vm.stuba.sk ([147.175.88.220])
        by smtp.gmail.com with ESMTPSA id b15-20020a1709063f8f00b007336c3f05bdsm3956796ejj.178.2022.08.20.11.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 11:35:48 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: namcaov@gmail.com
Cc: Larry.Finger@lwfinger.net,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	lkp@intel.com
Subject: [PATCH v3 1/3] staging: rtl8723bs: remove unused function ODM_InbandNoise_Monitor
Date: Sat, 20 Aug 2022 20:34:49 +0200
Message-Id: <46d73e331bae2192a328f6691763f39ea6c18b08.1661020250.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661017377.git.namcaov@gmail.com>
References: <cover.1661017377.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

because this function is not used. Also remove function
odm_InbandNoise_Monitor_NSeries because it is a static function
which is only called from ODM_InbandNoise_Monitor.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 .../staging/rtl8723bs/hal/odm_NoiseMonitor.c  | 111 ------------------
 .../staging/rtl8723bs/hal/odm_NoiseMonitor.h  |   7 --
 2 files changed, 118 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c b/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c
index 392cc8a398f5..b85b323cf5bd 100644
--- a/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c
+++ b/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c
@@ -17,114 +17,3 @@
 #define Valid_Min				-35
 #define Valid_Max			10
 #define ValidCnt				5
-
-static s16 odm_InbandNoise_Monitor_NSeries(
-	struct dm_odm_t *pDM_Odm,
-	u8 bPauseDIG,
-	u8 IGIValue,
-	u32 max_time
-)
-{
-	u32 tmp4b;
-	u8 max_rf_path = 0, rf_path;
-	u8 reg_c50, reg_c58, valid_done = 0;
-	struct noise_level noise_data;
-	u32 start  = 0;
-
-	pDM_Odm->noise_level.noise_all = 0;
-
-	max_rf_path = 1;
-
-	memset(&noise_data, 0, sizeof(struct noise_level));
-
-	/*  */
-	/*  Step 1. Disable DIG && Set initial gain. */
-	/*  */
-
-	if (bPauseDIG)
-		odm_PauseDIG(pDM_Odm, ODM_PAUSE_DIG, IGIValue);
-	/*  */
-	/*  Step 2. Disable all power save for read registers */
-	/*  */
-	/* dcmd_DebugControlPowerSave(padapter, PSDisable); */
-
-	/*  */
-	/*  Step 3. Get noise power level */
-	/*  */
-	start = jiffies;
-	while (1) {
-
-		/* Stop updating idle time pwer report (for driver read) */
-		PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_TxGainStage, BIT25, 1);
-
-		/* Read Noise Floor Report */
-		tmp4b = PHY_QueryBBReg(pDM_Odm->Adapter, 0x8f8, bMaskDWord);
-
-		/* PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XAAGCCore1, bMaskByte0, TestInitialGain); */
-		/* if (max_rf_path == 2) */
-		/* PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XBAGCCore1, bMaskByte0, TestInitialGain); */
-
-		/* update idle time pwer report per 5us */
-		PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_TxGainStage, BIT25, 0);
-
-		noise_data.value[RF_PATH_A] = (u8)(tmp4b&0xff);
-		noise_data.value[RF_PATH_B]  = (u8)((tmp4b&0xff00)>>8);
-
-		for (rf_path = RF_PATH_A; rf_path < max_rf_path; rf_path++) {
-			noise_data.sval[rf_path] = (s8)noise_data.value[rf_path];
-			noise_data.sval[rf_path] /= 2;
-		}
-		/* mdelay(10); */
-		/* msleep(10); */
-
-		for (rf_path = RF_PATH_A; rf_path < max_rf_path; rf_path++) {
-			if ((noise_data.valid_cnt[rf_path] < ValidCnt) && (noise_data.sval[rf_path] < Valid_Max && noise_data.sval[rf_path] >= Valid_Min)) {
-				noise_data.valid_cnt[rf_path]++;
-				noise_data.sum[rf_path] += noise_data.sval[rf_path];
-				if (noise_data.valid_cnt[rf_path] == ValidCnt) {
-					valid_done++;
-				}
-
-			}
-
-		}
-
-		/* printk("####### valid_done:%d #############\n", valid_done); */
-		if ((valid_done == max_rf_path) || (jiffies_to_msecs(jiffies - start) > max_time)) {
-			for (rf_path = RF_PATH_A; rf_path < max_rf_path; rf_path++) {
-				/* printk("%s PATH_%d - sum = %d, valid_cnt = %d\n", __func__, rf_path, noise_data.sum[rf_path], noise_data.valid_cnt[rf_path]); */
-				if (noise_data.valid_cnt[rf_path])
-					noise_data.sum[rf_path] /= noise_data.valid_cnt[rf_path];
-				else
-					noise_data.sum[rf_path]  = 0;
-			}
-			break;
-		}
-	}
-	reg_c50 = (s32)PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XAAGCCore1, bMaskByte0);
-	reg_c50 &= ~BIT7;
-	pDM_Odm->noise_level.noise[RF_PATH_A] = -110 + reg_c50 + noise_data.sum[RF_PATH_A];
-	pDM_Odm->noise_level.noise_all += pDM_Odm->noise_level.noise[RF_PATH_A];
-
-	if (max_rf_path == 2) {
-		reg_c58 = (s32)PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XBAGCCore1, bMaskByte0);
-		reg_c58 &= ~BIT7;
-		pDM_Odm->noise_level.noise[RF_PATH_B] = -110 + reg_c58 + noise_data.sum[RF_PATH_B];
-		pDM_Odm->noise_level.noise_all += pDM_Odm->noise_level.noise[RF_PATH_B];
-	}
-	pDM_Odm->noise_level.noise_all /= max_rf_path;
-
-	/*  */
-	/*  Step 4. Recover the Dig */
-	/*  */
-	if (bPauseDIG)
-		odm_PauseDIG(pDM_Odm, ODM_RESUME_DIG, IGIValue);
-
-	return pDM_Odm->noise_level.noise_all;
-
-}
-
-s16 ODM_InbandNoise_Monitor(void *pDM_VOID, u8 bPauseDIG, u8 IGIValue, u32 max_time)
-{
-	return odm_InbandNoise_Monitor_NSeries(pDM_VOID, bPauseDIG, IGIValue, max_time);
-}
diff --git a/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.h b/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.h
index ab114543f39c..01c5c524d4e0 100644
--- a/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.h
+++ b/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.h
@@ -29,11 +29,4 @@ struct odm_noise_monitor {
 	s16 noise_all;
 };
 
-s16 ODM_InbandNoise_Monitor(
-	void *pDM_VOID,
-	u8 bPauseDIG,
-	u8 IGIValue,
-	u32 max_time
-);
-
 #endif
-- 
2.25.1

