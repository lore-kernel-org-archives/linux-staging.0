Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB73B2F58
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 18:00:35 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id u15so5522101ejt.6
        for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 11:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=jmGCfK1PpP8C14WpA4xMyU1skN/b8h3qkvgiLCfaJxg=;
        b=Ss4DgofXziulFot6U4W+9d2Bb6dLumMr2GKIi4B0nb/w7R1kmQgPiK1IjH0A5vg2/M
         mXEV/ywFeY2X0Wyuiv+iid/sTotobrJHI5SqkaoomfiLQuJdIPoPPIx7Ml7MsfB8xXoE
         kWfBzh7mLi+PoLIXCoW10myc8PZ6wnYPvkaS6tcJEYlEfPEvN84aX/c6E9XFaRSUIzDY
         vUJZn1pAtrseW1xmqIODwWEkjt4qQw/qJ6JajqGounVVyBtv52wiLDsEUms/pKs9I1sa
         i8G93UqIyLk/kw7os9BlmGBdyDIot0B5FrGi2efdMHNCTlYMtWO5ZpULCqEyADHaZ582
         z2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=jmGCfK1PpP8C14WpA4xMyU1skN/b8h3qkvgiLCfaJxg=;
        b=Dx17YRyyVSfIB8Mg9TqgmUxHa8WRYG4MG7BA1YTZaMDyWN+0c8TKoAOo16/pQKlQce
         3+ZucTo28TMwIGqG1hDJvVI3sB/xYKkuqGtlNDmC/TAu3RcFBJLx9BaXR4jZgFI+NJm0
         Y/kom2cmLSE62a8IRNNYRBx0Z6dan1rz8ZUVMhKR2/aLerAzCVxlYL/ZEeqfNzP8kvim
         WYXqqwmRxgvFmzsSDYKfS3bN/furR6J+w8Ll5aKQhbznOycVOiSOwKTNMpdBUqEt51xE
         pLvtU5TiqHr+xj2koKEcWumgBjHO/ZGZqodt02CI2Tz6OZCJ+eCZ4MTVuJcKbUWYrxyU
         1h7g==
X-Gm-Message-State: ACgBeo0iVSrzsZvkFl7v0uVsYL0eKIZBZAS4WOUPt6PfvHFIU5IUV0A3
	dVLK9tE07Ssjft9HkdbjbJqmirAO6P5L7g==
X-Google-Smtp-Source: AA6agR6KANvjTn/GsgxjiowhFzRpn+qkYHxlp7h0wMYivXxDglRk1g3/ifs5q10JeMIHA87+R8XW2A==
X-Received: by 2002:a17:907:7da8:b0:730:fdad:4af8 with SMTP id oz40-20020a1709077da800b00730fdad4af8mr8483773ejc.401.1661018434088;
        Sat, 20 Aug 2022 11:00:34 -0700 (PDT)
Received: from nam-dell.vm.stuba.sk ([147.175.88.220])
        by smtp.gmail.com with ESMTPSA id x19-20020aa7d6d3000000b00445e037345csm4938841edr.14.2022.08.20.11.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 11:00:33 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: hdegoede@redhat.com
Cc: Larry.Finger@lwfinger.net,
	gregkh@linuxfoundation.org,
	kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	lkp@intel.com,
	namcaov@gmail.com
Subject: [PATCH v3 1/3] staging: rtl8723bs: remove unused function ODM_InbandNoise_Monitor
Date: Sat, 20 Aug 2022 20:00:02 +0200
Message-Id: <46d73e331bae2192a328f6691763f39ea6c18b08.1661018051.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661018051.git.namcaov@gmail.com>
References: <cover.1661018051.git.namcaov@gmail.com>
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

