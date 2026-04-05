Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F226221277
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 11:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775389426; cv=none; b=c5F/gjv3mncZnCnbm0zvpC3e2uZWHG9hJlaunCLj1AG7Y30rEFz00Od6u2OPfQ/EaC5G6PNMq/UgKGERvJCu0oWBPy2/Pq2ZAPK4rwTlP/r064m6/XrNqTKVz0vtK1uf3fNfjGecGshicDojeHWbzOjqCfHfm2+IH/GmN7CgTII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775389426; c=relaxed/simple;
	bh=K65IF01Pfy3lzRZKOtbMTAnIQFJBUCdSDjkspyRS/Go=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RBAsb6elxjBfk3iZxZNxgQ6QLIG8uhBKz7C7ramN+nbo4VxzougdR4E9pNqjqMht61EgXxLLdeA7i8A8XYefFNcl5XpXvtiUrsNdBsnEQ65SVM5NixC90Xfoj06ZBuzkO95dlavKAdoIXDDw9KwUxlwVD7XpqyfsJP0Xm8QJaAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PV9LpP/a; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PV9LpP/a"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c757a9251faso950438a12.1
        for <linux-staging@lists.linux.dev>; Sun, 05 Apr 2026 04:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775389424; x=1775994224; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VG/hUF4vpXeatP942r9BydyjzysF7Iqe+vxk1kg8Zrg=;
        b=PV9LpP/a48VgMOfe3yTrUe/LcMUUp4E74tssdm9/JwL2smYb6E7usj58zG6byexQ6B
         54dKVO+m84M/ZwHQObIRwBRGcCthtThcPuzJ++Doemw69c8IGbTc1uqaFWfbie73JXo6
         WmrDBGwBRqhUW02063fGNitT59TlqE7+V3C81oQs4e4Oe76PEmWETo0o34pBJoBhzy8u
         4CjEysxMe1xyKlivmtp59AkbPG8Oz5fNwWsJOXNibkBWK9Mt589wW91/xdEfSbO9HN+A
         zuLID+23jPRozW1hJ6cuTxA/PQjBNUawjc+YPpq1NghA5FeZxRn3rylnCRR4+Sb3VIIR
         AEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775389424; x=1775994224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VG/hUF4vpXeatP942r9BydyjzysF7Iqe+vxk1kg8Zrg=;
        b=JGjr/Mg62ICPOv+QiV66JzksIOg1sDprVvFHa4Dsag4gPcpj3nZlw//b/RODUW6ol3
         AuhLuhk6ctTuO31U5l5pvUS4aLCPCsEDW8P4H7I13cR3/Mskvg3M7hDGbGHvCWL9Elx5
         2BHX211ufnq6QmV/CWd4MegywZNy1m/+n+L0kY9QiIBGcmKWCINuoeDrQJZnu+5yWt3A
         YzOcTx9QYb0w65s28k+fTiG4B2NpRKIi1J8PVshqz9B7IVnC9/Ju4YS6acz8lsKEqQZm
         rKIIDo9LqtkpTcCr4oPAtbk3zB3phqzh92LuFNSev1TFFLv6Nh0LUH3tD/hoQbwAUUYP
         SzJg==
X-Gm-Message-State: AOJu0YwMWPVkRTkdcdIkuh9V9skssUL8T3bmnY+PoWipqTe9sU3wYJua
	cplHBcWDB7sZ8OZw0S1eyX8GqiUVirsw4x37Qw8F+viwGMT4/FG/8ou/
X-Gm-Gg: AeBDiesrA044FeUs8P7GygwalE57RLb+yeNpvVnkhlOQXzts5Y+QaPwSeLZfH3b+aFk
	hQXsC1wgXp9Zbushv658cYYck7Q3hyqwwV+e6N/OcKR5G4UNHX+5Jii4SViZiw+fneAXamO2gaw
	IIlKjxY4xjVB2BgwRB53Bml7AJvfVYuASIuq0BQy330Ghv3w1xoBSsq9mk4GPS20YJPAt8p7yvg
	2HSf+X3FuSkifE5jzThOAeiBmvRK5jgF05AZQ8D5AXoKl2Of3MtbJblsL1taL+8ZAr5KLBL9DJT
	QPKuP1L3kW4dlY9umDY/7B9CoHae+6cpukzGx+arDvillV5H/6rl+oFhXc3AWzlwfA5vDJjlVI3
	bY51cIkzN3ERHV3LzH7cB+Uyu5tZnFK13pxcAj8mgcIwiaUcw7lx92tAKhhbETwZZxjwjHCYKwE
	s2PhiWf6mkSkyzhWKeWNbVXQeyFhldb0aYgpYXWWg=
X-Received: by 2002:a05:6a00:4397:b0:829:862d:6b46 with SMTP id d2e1a72fcca58-82d0da2f24bmr8822877b3a.6.1775389424340;
        Sun, 05 Apr 2026 04:43:44 -0700 (PDT)
Received: from localhost.localdomain ([111.125.237.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3ccc8sm13938205b3a.19.2026.04.05.04.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 04:43:42 -0700 (PDT)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: gregkh@linuxfoundation.org,
	abrahamadekunle50@gmail.com,
	b9788213@gmail.com,
	straube.linux@gmail.com,
	ethantidmore06@gmail.com,
	andriy.shevchenko@linux.intel.com,
	dan.carpenter@linaro.org,
	weibu@redadmin.org,
	knavaneeth786@gmail.com,
	ignacio.pena87@gmail.com,
	dharanitharan725@gmail.com,
	samasth.norway.ananda@oracle.com,
	lukagejak5@gmail.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	suunj1331@gmail.com,
	ysinghcin@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>
Subject: [RFT PATCH v3 0/5] staging: rtl8723bs: Code cleanup in drivers/staging/rtl8723bs
Date: Sun,  5 Apr 2026 17:11:27 +0530
Message-Id: <20260405114132.310774-1-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series focuses on code cleanup in drivers/staging/rtl8723bs,
majorly focusing on fixing checkpatch warnings of constant being on right
side of test in comparisons, deletion of empty if block ,use of 
read_poll_timeout_atomic(), and other code simplifications.

v2 link: https://lore.kernel.org/linux-staging/20260403094647.fmgop6xh2cjpit3s@inspiron/T/#m3d08fd012119772e>
v1 link: https://lore.kernel.org/linux-staging/20260323145214.ubhshy2gwp52j5zh@inspiron/T/#mc3b693b37c49fbdd>

Note:
1. I found that for this change in v2:

-       if (
-               (false == pHalData->bDisableSWChannelPlan) &&
-               rtw_is_channel_plan_valid(sw_channel_plan)
-       )
+       if (!pHalData->bDisableSWChannelPlan &&
+           rtw_is_channel_plan_valid(sw_channel_plan))

for this code, checkpatch gave the check:

CHECK: Using comparison to false is error prone
#126: FILE: drivers/staging/rtl8723bs/hal/hal_com.c:126:
+               (false == pHalData->bDisableSWChannelPlan) &&

which is a different logical change than the ones covered in this patch series.
Hence, to keep the patch series to a reasonable length and since this is RFT
path series, I did not consider this change right now.

2. This change in v2:

        if (BandWidth == CHANNEL_WIDTH_20) { /*  BW20-1S, BW20-2S */
-               if (MGN_MCS0 <= Rate && Rate <= MGN_MCS7)
+               if (Rate >= MGN_MCS0 && Rate <= MGN_MCS7)
                        txPower += pHalData->BW20_24G_Diff[RFPath][TX_1S];
        } else if (BandWidth == CHANNEL_WIDTH_40) { /*  BW40-1S, BW40-2S */
-               if (MGN_MCS0 <= Rate && Rate <= MGN_MCS7)
+               if (Rate >= MGN_MCS0 && Rate <= MGN_MCS7)
                        txPower += pHalData->BW40_24G_Diff[RFPath][TX_1S];
        }

can be reformatted as:

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index 9e523491a008..efd1c76f2953 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -469,11 +469,10 @@ u8 PHY_GetTxPowerIndexBase(
        if ((Rate >= MGN_6M && Rate <= MGN_54M) && !IS_CCK_RATE(Rate))
                txPower += pHalData->OFDM_24G_Diff[RFPath][TX_1S];
 
-       if (BandWidth == CHANNEL_WIDTH_20) { /*  BW20-1S, BW20-2S */
-               if (MGN_MCS0 <= Rate && Rate <= MGN_MCS7)
+       if (Rate >= MGN_MCS0 && Rate <= MGN_MCS7) {
+               if (BandWidth == CHANNEL_WIDTH_20) /*  BW20-1S, BW20-2S */
                        txPower += pHalData->BW20_24G_Diff[RFPath][TX_1S];
-       } else if (BandWidth == CHANNEL_WIDTH_40) { /*  BW40-1S, BW40-2S */
-               if (MGN_MCS0 <= Rate && Rate <= MGN_MCS7)
+               else if (BandWidth == CHANNEL_WIDTH_40) /*  BW40-1S, BW40-2S */
                        txPower += pHalData->BW40_24G_Diff[RFPath][TX_1S];
for which it is sent as a separate patch - patch 5 in this series.

3. I found, in drivers/staging/rtl8723bs/hal/odm.h:

struct odm_rate_adaptive {
        u8 Type;                                /*  DM_Type_ByFW/DM_Type_ByDriver */
        u8 LdpcThres;                   /*  if RSSI > LdpcThres => switch from LPDC to BCC */
        bool bUseLdpc;
        bool bLowerRtsRate;
        u8 HighRSSIThresh;              /*  if RSSI > HighRSSIThresh    => RATRState is DM_RATR_STA_HIGH */
        u8 LowRSSIThresh;               /*  if RSSI <= LowRSSIThresh    => RATRState is DM_RATR_STA_LOW */
        u8 RATRState;                   /*  Current RSSI level, DM_RATR_STA_HIGH/DM_RATR_STA_MIDDLE/DM_RATR_>

};

and based on the explanation of parameters HighRSSIThresh & LowRSSIThresh 
I thought this change:

diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index 639b6da2302b..ca4495f101fd 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -343,9 +343,9 @@ bool ODM_RAStateCheck(
        }
 
        /*  Decide RATRState by RSSI. */
-       if (RSSI > HighRSSIThreshForRA)
+       if (HighRSSIThreshForRA < RSSI)
                RATRState = DM_RATR_STA_HIGH;
-       else if (RSSI > LowRSSIThreshForRA)
+       else if (LowRSSIThreshForRA < RSSI) 
                RATRState = DM_RATR_STA_MIDDLE;
       else
                RATRState = DM_RATR_STA_LOW;

doesn't seem to be right, thats why I dropped this change as well.

4. This patch series is compile tested using the following commands, which
   include setting the necessary configurations:
        1. make defconfig
        2. scripts/config --enable CONFIG_STAGING
        3. scripts/config --module CONFIG_MMC
        4. scripts/config --module CONFIG_RTL8723BS
        5. make olddefconfig
        6. make -j$(nproc)
        7. git rebase -i --exec "make -j$(nproc) M=drivers/staging/rtl8723bs" HEAD~5 

The final rebase --exec gave a successful output:

Executing: make -j12 M=drivers/staging/rtl8723bs
make[1]: Entering directory '/home/prithvi/linux/drivers/staging/rtl8723bs'
  CC [M]  core/rtw_ap.o
  CC [M]  core/rtw_btcoex.o
  CC [M]  core/rtw_cmd.o
  CC [M]  core/rtw_efuse.o
  CC [M]  core/rtw_io.o
  CC [M]  core/rtw_ioctl_set.o
  CC [M]  core/rtw_ieee80211.o
  CC [M]  core/rtw_mlme.o
  CC [M]  core/rtw_mlme_ext.o
  CC [M]  core/rtw_pwrctrl.o
  CC [M]  core/rtw_recv.o
  CC [M]  core/rtw_security.o
  CC [M]  core/rtw_sta_mgt.o
  CC [M]  core/rtw_wlan_util.o
  CC [M]  core/rtw_xmit.o
  CC [M]  hal/hal_intf.o
  CC [M]  hal/hal_com.o
  CC [M]  hal/hal_com_phycfg.o
  CC [M]  hal/hal_btcoex.o
  CC [M]  hal/hal_sdio.o
  CC [M]  hal/hal_pwr_seq.o
  CC [M]  hal/HalPhyRf.o
  CC [M]  hal/HalPwrSeqCmd.o
  CC [M]  hal/odm_CfoTracking.o
  CC [M]  hal/odm.o
  CC [M]  hal/odm_DIG.o
  CC [M]  hal/odm_DynamicBBPowerSaving.o
  CC [M]  hal/odm_DynamicTxPower.o
  CC [M]  hal/odm_EdcaTurboCheck.o
  CC [M]  hal/odm_HWConfig.o
  CC [M]  hal/odm_RegConfig8723B.o
  CC [M]  hal/rtl8723b_cmd.o
  CC [M]  hal/rtl8723b_dm.o
  CC [M]  hal/rtl8723b_hal_init.o
  CC [M]  hal/rtl8723b_phycfg.o
  CC [M]  hal/rtl8723b_rf6052.o
  CC [M]  hal/rtl8723b_rxdesc.o
  CC [M]  hal/rtl8723bs_recv.o
  CC [M]  hal/rtl8723bs_xmit.o
  CC [M]  hal/sdio_halinit.o
  CC [M]  hal/sdio_ops.o
  CC [M]  hal/HalBtc8723b1Ant.o
  CC [M]  hal/HalBtc8723b2Ant.o
  CC [M]  hal/HalHWImg8723B_BB.o
  CC [M]  hal/HalHWImg8723B_MAC.o
  CC [M]  hal/HalHWImg8723B_RF.o
  CC [M]  hal/HalPhyRf_8723B.o
  CC [M]  os_dep/ioctl_cfg80211.o
  CC [M]  os_dep/osdep_service.o
  CC [M]  os_dep/os_intfs.o
  CC [M]  os_dep/sdio_intf.o
  CC [M]  os_dep/sdio_ops_linux.o
  CC [M]  os_dep/wifi_regd.o
  CC [M]  os_dep/xmit_linux.o
  LD [M]  r8723bs.o
  MODPOST Module.symvers
  CC [M]  r8723bs.mod.o
  CC [M]  .module-common.o
  LD [M]  r8723bs.ko
make[1]: Leaving directory '/home/prithvi/linux/drivers/staging/rtl8723bs'
Executing: make -j12 M=drivers/staging/rtl8723bs
make[1]: Entering directory '/home/prithvi/linux/drivers/staging/rtl8723bs'
  CC [M]  hal/HalPhyRf_8723B.o
  LD [M]  r8723bs.o
  MODPOST Module.symvers
  CC [M]  r8723bs.mod.o
  LD [M]  r8723bs.ko
make[1]: Leaving directory '/home/prithvi/linux/drivers/staging/rtl8723bs'
Executing: make -j12 M=drivers/staging/rtl8723bs
make[1]: Entering directory '/home/prithvi/linux/drivers/staging/rtl8723bs'
  CC [M]  core/rtw_ap.o
  CC [M]  core/rtw_btcoex.o
  CC [M]  core/rtw_cmd.o
  CC [M]  core/rtw_efuse.o
  CC [M]  core/rtw_io.o
  CC [M]  core/rtw_ioctl_set.o
  CC [M]  core/rtw_ieee80211.o
  CC [M]  core/rtw_mlme.o
  CC [M]  core/rtw_mlme_ext.o
  CC [M]  core/rtw_pwrctrl.o
  CC [M]  core/rtw_recv.o
  CC [M]  core/rtw_security.o
  CC [M]  core/rtw_sta_mgt.o
  CC [M]  core/rtw_wlan_util.o
  CC [M]  core/rtw_xmit.o
  CC [M]  hal/hal_intf.o
  CC [M]  hal/hal_com.o
  CC [M]  hal/hal_com_phycfg.o
  CC [M]  hal/hal_btcoex.o
  CC [M]  hal/hal_sdio.o
  CC [M]  hal/hal_pwr_seq.o
  CC [M]  hal/HalPhyRf.o
  CC [M]  hal/HalPwrSeqCmd.o
  CC [M]  hal/odm.o
  CC [M]  hal/odm_CfoTracking.o
  CC [M]  hal/odm_DIG.o
  CC [M]  hal/odm_DynamicBBPowerSaving.o
  CC [M]  hal/odm_DynamicTxPower.o
  CC [M]  hal/odm_EdcaTurboCheck.o
  CC [M]  hal/odm_HWConfig.o
  CC [M]  hal/odm_RegConfig8723B.o
  CC [M]  hal/rtl8723b_cmd.o
  CC [M]  hal/rtl8723b_dm.o
  CC [M]  hal/rtl8723b_hal_init.o
  CC [M]  hal/rtl8723b_phycfg.o
  CC [M]  hal/rtl8723b_rf6052.o
  CC [M]  hal/rtl8723b_rxdesc.o
  CC [M]  hal/rtl8723bs_recv.o
  CC [M]  hal/rtl8723bs_xmit.o
  CC [M]  hal/sdio_halinit.o
  CC [M]  hal/sdio_ops.o
  CC [M]  hal/HalBtc8723b1Ant.o
  CC [M]  hal/HalBtc8723b2Ant.o
  CC [M]  hal/HalHWImg8723B_BB.o
  CC [M]  hal/HalHWImg8723B_MAC.o
  CC [M]  hal/HalHWImg8723B_RF.o
  CC [M]  hal/HalPhyRf_8723B.o
  CC [M]  os_dep/ioctl_cfg80211.o
  CC [M]  os_dep/osdep_service.o
  CC [M]  os_dep/os_intfs.o
  CC [M]  os_dep/sdio_intf.o
  CC [M]  os_dep/sdio_ops_linux.o
  CC [M]  os_dep/wifi_regd.o
  CC [M]  os_dep/xmit_linux.o
  LD [M]  r8723bs.o
  MODPOST Module.symvers
  LD [M]  r8723bs.ko
make[1]: Leaving directory '/home/prithvi/linux/drivers/staging/rtl8723bs'
Executing: make -j12 M=drivers/staging/rtl8723bs
make[1]: Entering directory '/home/prithvi/linux/drivers/staging/rtl8723bs'
  CC [M]  hal/rtl8723b_cmd.o
  LD [M]  r8723bs.o
  MODPOST Module.symvers
  CC [M]  r8723bs.mod.o
  LD [M]  r8723bs.ko
make[1]: Leaving directory '/home/prithvi/linux/drivers/staging/rtl8723bs'
Executing: make -j12 M=drivers/staging/rtl8723bs
make[1]: Entering directory '/home/prithvi/linux/drivers/staging/rtl8723bs'
  CC [M]  hal/hal_com_phycfg.o
  LD [M]  r8723bs.o
  MODPOST Module.symvers
  CC [M]  r8723bs.mod.o
  LD [M]  r8723bs.ko
make[1]: Leaving directory '/home/prithvi/linux/drivers/staging/rtl8723bs'
Successfully rebased and updated refs/heads/staging-realtek-patch-series.

However, since I currently don't have rtl8723bs hardware I am unfortunately
unable to do runtime testing for this patch series.

Prithvi Tambewagh (5):
  staging: rtl8723bs: move constant to right side of test in comparison
  staging: rtl8723bs: remove empty if statement block
  staging: rtl8723bs: simplify boolean return in IsFrameTypeCtrl()
  staging: rtl8723bs: use read_poll_timeout_atomic in
    _is_fw_read_cmd_down
  staging: rtl8723bs: remove duplicate rate checks in
    PHY_GetTxPowerIndexBase()

 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c    |  4 ++--
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c |  5 +----
 drivers/staging/rtl8723bs/hal/hal_com.c        |  2 +-
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 11 +++++------
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c   | 18 +++++++-----------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c  | 18 +++++++++---------
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c |  2 +-
 drivers/staging/rtl8723bs/include/ieee80211.h  |  4 ++--
 drivers/staging/rtl8723bs/include/wifi.h       |  5 +----
 9 files changed, 29 insertions(+), 40 deletions(-)

-- 
2.34.1

