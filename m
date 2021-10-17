Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A362D2C83
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 11:17:22 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id g25so35429927wrb.2
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 04:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5OV9zhqnOuhJ534TRu2O1fH+ldY6khbL3peOBGv1il4=;
        b=gYOUEUMuCHyXCzkkwkCZTjqXPUEJU37Ifx+W1TcM02TMw08D1NOd324gZvpi7j2Zyb
         7eWL55aBXZbaAJks6ou/dASMpDSSNUXqkkt56RaoVl3fR81PjqiS9gdAjJ7VktFcJGSx
         m4yjZluqYBo/u41azP+dh0CastyFJRpcwjQFgbVkfFuI0zXmONXQM5kPcnYLX2g9g1A4
         ZVlPjBATxPvYALUnwk3fkPX9ksn/Cl7+oZ50b+TsC3VUYlYu69O0bpO4Urk7WV5E36IZ
         znJ+wp6K94OvHcLCPvv7z+stekXQ/jFFCqS6yQSSlI9KWtebswH3l49Vv2Orub4mijDP
         zZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5OV9zhqnOuhJ534TRu2O1fH+ldY6khbL3peOBGv1il4=;
        b=EMlQrOVRuAuxFdzeSWR9Qy/meElV19lFYbI0ua4Ev3Dhqxr/YnUeWh9jx2HRwdgMuM
         tVliZEXrFpLDyBwjfZHMlquODo1MfCGby85Bog/k82efwDK0+1TXX6eCzdkAzCl6A62w
         oKPDvyR5xgHMOUesQSDfYyLByS84DcMLpFJNMB2T5E5M1/osseZCr9edQ3g9rDsZ7DxY
         fikClOIISj+mTGHr2BaA2vYchaYFDEsYkMrijeiLcMjeu0PLO92BpZNDZTDieqtOy4lg
         +ZqQ7TwQLl+y6OCcv+KvWK8jrP7zIgp3K5Q1Cy/YONh/VvP+U2YY7rTxhsxQm0K2cNSx
         1L6g==
X-Gm-Message-State: AOAM5309LPTm2YPNB5oeNq/+y/ryGGrdGB9j/m0nar8L8S/pjq+LEEeV
	GNzbWKD7rRvumZsTE/rQUTk5B7hEtDI=
X-Google-Smtp-Source: ABdhPJz2qpq4AZcZaTZPiRYTkCPPZ28td0I5xfFWNlf7VmKmSeoGHPYEllftlFHp1kHVkvSYbG4NXg==
X-Received: by 2002:adf:8b45:: with SMTP id v5mr28129728wra.211.1634469440963;
        Sun, 17 Oct 2021 04:17:20 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::d7f0])
        by smtp.gmail.com with ESMTPSA id p12sm6661551wrr.67.2021.10.17.04.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 04:17:20 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] staging: r8188eu: remove unused constants and variables
Date: Sun, 17 Oct 2021 13:17:05 +0200
Message-Id: <20211017111705.18989-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove some unused constants and variables that are left over from
previous cleanup patches.

Suggested-by: Martin Kaiser <martin@kaiser.cx>
Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c          |  8 --------
 drivers/staging/r8188eu/hal/odm_HWConfig.c |  3 ---
 drivers/staging/r8188eu/include/odm.h      | 17 -----------------
 3 files changed, 28 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 0987ff3e382a..fc425d359b15 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -979,14 +979,6 @@ void ODM_TXPowerTrackingCheck(struct odm_dm_struct *pDM_Odm)
 	}
 }
 
-/* antenna mapping info */
-/*  1: right-side antenna */
-/*  2/0: left-side antenna */
-/* PDM_SWAT_Table->CCK_Ant1_Cnt /OFDM_Ant1_Cnt:  for right-side antenna:   Ant:1    RxDefaultAnt1 */
-/* PDM_SWAT_Table->CCK_Ant2_Cnt /OFDM_Ant2_Cnt:  for left-side antenna:     Ant:0    RxDefaultAnt2 */
-/*  We select left antenna as default antenna in initial process, modify it as needed */
-/*  */
-
 void odm_InitHybridAntDiv(struct odm_dm_struct *pDM_Odm)
 {
 	if (!(pDM_Odm->SupportAbility & ODM_BB_ANT_DIV))
diff --git a/drivers/staging/r8188eu/hal/odm_HWConfig.c b/drivers/staging/r8188eu/hal/odm_HWConfig.c
index 3d639b2720b2..af28af6f66d7 100644
--- a/drivers/staging/r8188eu/hal/odm_HWConfig.c
+++ b/drivers/staging/r8188eu/hal/odm_HWConfig.c
@@ -58,7 +58,6 @@ static void odm_RxPhyStatus92CSeries_Parsing(struct odm_dm_struct *dm_odm,
 			struct odm_per_pkt_info *pPktinfo,
 			struct adapter *adapt)
 {
-	struct sw_ant_switch *pDM_SWAT_Table = &dm_odm->DM_SWAT_Table;
 	u8 i, Max_spatial_stream;
 	s8 rx_pwr[4], rx_pwr_all = 0;
 	u8 EVM, PWDB_ALL = 0, PWDB_ALL_BT;
@@ -224,8 +223,6 @@ static void odm_RxPhyStatus92CSeries_Parsing(struct odm_dm_struct *dm_odm,
 			pPhyInfo->SignalStrength = (u8)(odm_SignalScaleMapping(dm_odm, total_rssi /= rf_rx_num));
 	}
 
-	/* For 92C/92D HW (Hybrid) Antenna Diversity */
-	pDM_SWAT_Table->antsel = pPhyStaRpt->ant_sel;
 	/* For 88E HW Antenna Diversity */
 	dm_odm->DM_FatTable.antsel_rx_keep_0 = pPhyStaRpt->ant_sel;
 	dm_odm->DM_FatTable.antsel_rx_keep_1 = pPhyStaRpt->ant_sel_b;
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 841603b341bd..f1ea9fa89a26 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -111,12 +111,6 @@ struct rx_hpc {
 
 #define ODM_ASSOCIATE_ENTRY_NUM	32 /*  Max size of AsocEntry[]. */
 
-/*  This indicates two different steps. */
-/*  Using SWAW_STEP_PEAK, driver needs to switch antenna and listen to
- *  the signal on the air. */
-
-#define SWAW_STEP_PEAK		0
-
 struct sw_ant_switch {
 	u8	try_flag;
 	s32	PreRSSI;
@@ -131,8 +125,6 @@ struct sw_ant_switch {
 	/*  Before link Antenna Switch check */
 	u8	SWAS_NoLink_State;
 	u32	SWAS_NoLink_BK_Reg860;
-	bool	ANTA_ON;	/* To indicate Ant A is or not */
-	bool	ANTB_ON;	/* To indicate Ant B is on or not */
 
 	s32	RSSI_sum_A;
 	s32	RSSI_sum_B;
@@ -146,16 +138,8 @@ struct sw_ant_switch {
 	u64	RXByteCnt_B;
 	u8	TrafficLoad;
 	struct timer_list SwAntennaSwitchTimer;
-	/* Hybrid Antenna Diversity */
-	u32	CCK_Ant1_Cnt[ODM_ASSOCIATE_ENTRY_NUM];
-	u32	CCK_Ant2_Cnt[ODM_ASSOCIATE_ENTRY_NUM];
-	u32	OFDM_Ant1_Cnt[ODM_ASSOCIATE_ENTRY_NUM];
-	u32	OFDM_Ant2_Cnt[ODM_ASSOCIATE_ENTRY_NUM];
-	u32	RSSI_Ant1_Sum[ODM_ASSOCIATE_ENTRY_NUM];
-	u32	RSSI_Ant2_Sum[ODM_ASSOCIATE_ENTRY_NUM];
 	u8	TxAnt[ODM_ASSOCIATE_ENTRY_NUM];
 	u8	TargetSTA;
-	u8	antsel;
 	u8	RxIdleAnt;
 };
 
@@ -574,7 +558,6 @@ enum ant_div_type {
 	CGCS_RX_HW_ANTDIV		= 0x02,
 	FIXED_HW_ANTDIV			= 0x03,
 	CG_TRX_SMART_ANTDIV		= 0x04,
-	CGCS_RX_SW_ANTDIV		= 0x05,
 };
 
 /* Copy from SD4 defined structure. We use to support PHY DM integration. */
-- 
2.33.0

