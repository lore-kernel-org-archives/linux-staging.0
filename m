Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03521E5018
	for <linux-staging@lists.linux.dev>; Sat, 24 May 2025 17:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748108273; cv=none; b=lwlWHMGJEvvHHONuJbWtNrY1v6NQmrdpcSTw6mGBjZRbe0ugz8XYaiWfZkUpnphreYdLEw7U9bt8FQUaSHMPUL+BOjK/j5dyI5/8tuC/Q54L9ccXtARJUj3msmcZHhtPikdsyZuRGNJlc2iEbJiz/eZjM1vOUejBQps6ZwajHS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748108273; c=relaxed/simple;
	bh=YvTjvHZRac60HkW2zlfb55VH5bsoVzIkvvxMQ06ioYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YTN+YgG+iAMR+oITfWxfj6wfYRSVHLni5EW28Ks7KHsTiC6SRS1FWNfEAJJ9eDTEmpZpnAfuBF7fvlVXjDlXDhCVWKD7pTyCT0wp48N42a324AWsnlxp86198iTaMB62QRnUV1fgf7bOnDMZuDhQT60HyDm5FRCXtDRq3/hrKzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IODoPNJ3; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IODoPNJ3"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7080dd5fe92so7013057b3.3
        for <linux-staging@lists.linux.dev>; Sat, 24 May 2025 10:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748108271; x=1748713071; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/omOcdeuHUY20QhcLJWkT4wJlAOgV8U3bLr2o0uq3JQ=;
        b=IODoPNJ3aVJr9FLpkwHY1u+TgYnYdqUe1oF+bpzOjWgKqmqGQ5xfng/DOC6Cy17SrP
         /JBsvKnRIjWDtzraDFoihzjjVOvgUTBXIUASEQ+6MsrFbUhkKGbkchY2W4XUWaDxWiio
         xzTYDeK9PWLehhHcj3izXSGq8wGL+pr2b9TSky27SCxCt9ipDJswh1qSy/VelvIeXdAG
         OYg26HUs8do8L0/hiKLMjF5hZLsjPJcvLkwv8g7q6dPhD0yfFrl9aZnxqU8C2K+7Rxk+
         qT/odiSEm4j8ITq0xkNPe3gZlU/BvwGsSvU4f+Ef+m6yFSx6uOqiDcRkr/tbh8/WIdfu
         DFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748108271; x=1748713071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/omOcdeuHUY20QhcLJWkT4wJlAOgV8U3bLr2o0uq3JQ=;
        b=Ypg7YQ2Aq6Uz+whbktdDF40qvBf68VxTS6/a03WvbosSGippVl0U03G+8bi9LZxXaL
         //j5KKvoFVuYxFF0pKCByshqrlS7rlwgYJMYiyP4YMeCe/7Pc8Y2w+TOXMMj0q6cYIdo
         3VZa1tIAx4ctAuOdnEYgDDhx0VmpJaqhbza/K2LWL9RwiL7jopVAU/QYN+wGj1mE/zXA
         RRHmdod8KhvN7h5AlOqI1ODKWMY7xB9RMX/s0dNr0j1JP5LFIumsyVAhfoZuHYb9brOb
         KfD1YVN3zee7gNsPZJmkRdgYyFkt0B5bwBkA29q0rFXhx9IzaFKUhL+VEXkJoq/yUmhQ
         QHqQ==
X-Gm-Message-State: AOJu0YyC5DsdrwIDuXdj1Q4JmKB8hbOjEFqdxnBbNlzSlN6/OtvONXWN
	kvE+g9DsOa9Zs9lvANqEIT12zP6d0zUZZT+6m6/GkDy9BoQ8SArtUjXv
X-Gm-Gg: ASbGncvitWmj6xUVeyYuAp6g53BCyyBNCZkptFKjCDKY6VH/dkfRf9r+JqQn78/TOSS
	HcfEwsHjO7ESkaYObrLaf5PfMKGRxuE7Q+9h5DGabjwj5j50MUERWIxmS0q1lagIy+FlnubmjFC
	wBeYoFoo1M6O8277rtwWt3Sxmh5h6H4Hw/xyRw07LcVDcMAJ+wJOPnEON5ImrYEUArGG0ulyt7T
	vfSR+GAA/x1bsdaqe71hl57omeM9eNjvtgYH6Bk0eJgHCRwq+sOA/5YqjARV4vR7y2CXSZ9PDmS
	8KpYjJ8jbQUORKCgfUgSMNIsK36I/bJG8Y4hdFjpt+oBgy18pA53RB2QNcZmo1/LQ0jybKsJ6i+
	31eM=
X-Google-Smtp-Source: AGHT+IHI+L3Xls1kgCgdwWFwcxdTOzGuD5srEN+8Vk2Zi2eTlBN015UxL3MtE7hhlzAxJCNYK8334g==
X-Received: by 2002:a05:690c:6610:b0:70e:128c:3010 with SMTP id 00721157ae682-70e2d9d5779mr29491557b3.12.1748108270668;
        Sat, 24 May 2025 10:37:50 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([181.68.238.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70e3b07fa04sm1106567b3.3.2025.05.24.10.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 10:37:50 -0700 (PDT)
From: Donny Turizo <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny Turizo <donnyturizo13@gmail.com>
Subject: [PATCH v6] staging: rtl8723bs: rename _Read_EEPROM and other functions to snake_case
Date: Sat, 24 May 2025 17:37:45 +0000
Message-ID: <20250524173745.4907-1-donnyturizo13@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renamed _Read_EEPROM and several other functions in rtw_cmd.c to follow
the kernel coding style (snake_case). This fixes checkpatch warnings
related to naming conventions.

Signed-off-by: Donny Turizo <donnyturizo13@gmail.com>

---
v2: Initial patch rejected by the robot due to naming issues.

v3: Rebased the patch onto GregKH's staging branch for better integration.

v4: Changed the commit author to my name and renamed all remaining functions
    to snake_case following kernel coding style.

v5: Renamed command _set_h2c_Lbk to _set_h2c_lbk to fix CamelCase issue.

v6: Actually fixed the misspelled name that was incorrectly stated as
  fixed in v5.
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 140 +++++++++---------
 drivers/staging/rtl8723bs/include/rtw_cmd.h   |   2 +-
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |   2 +-
 3 files changed, 72 insertions(+), 72 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 49bcefb5e8d2..a73c83f804e4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -11,76 +11,76 @@
 static struct _cmd_callback rtw_cmd_callback[] = {
 	{GEN_CMD_CODE(_read_macreg), NULL}, /*0*/
 	{GEN_CMD_CODE(_write_macreg), NULL},
-	{GEN_CMD_CODE(_Read_BBREG), &rtw_getbbrfreg_cmdrsp_callback},
-	{GEN_CMD_CODE(_Write_BBREG), NULL},
-	{GEN_CMD_CODE(_Read_RFREG), &rtw_getbbrfreg_cmdrsp_callback},
-	{GEN_CMD_CODE(_Write_RFREG), NULL}, /*5*/
-	{GEN_CMD_CODE(_Read_EEPROM), NULL},
-	{GEN_CMD_CODE(_Write_EEPROM), NULL},
-	{GEN_CMD_CODE(_Read_EFUSE), NULL},
-	{GEN_CMD_CODE(_Write_EFUSE), NULL},
-
-	{GEN_CMD_CODE(_Read_CAM),	NULL},	/*10*/
-	{GEN_CMD_CODE(_Write_CAM),	 NULL},
-	{GEN_CMD_CODE(_setBCNITV), NULL},
-	{GEN_CMD_CODE(_setMBIDCFG), NULL},
-	{GEN_CMD_CODE(_JoinBss), &rtw_joinbss_cmd_callback},  /*14*/
-	{GEN_CMD_CODE(_DisConnect), &rtw_disassoc_cmd_callback}, /*15*/
-	{GEN_CMD_CODE(_CreateBss), &rtw_createbss_cmd_callback},
-	{GEN_CMD_CODE(_SetOpMode), NULL},
-	{GEN_CMD_CODE(_SiteSurvey), &rtw_survey_cmd_callback}, /*18*/
-	{GEN_CMD_CODE(_SetAuth), NULL},
-
-	{GEN_CMD_CODE(_SetKey), NULL},	/*20*/
-	{GEN_CMD_CODE(_SetStaKey), &rtw_setstaKey_cmdrsp_callback},
-	{GEN_CMD_CODE(_SetAssocSta), &rtw_setassocsta_cmdrsp_callback},
-	{GEN_CMD_CODE(_DelAssocSta), NULL},
-	{GEN_CMD_CODE(_SetStaPwrState), NULL},
-	{GEN_CMD_CODE(_SetBasicRate), NULL}, /*25*/
-	{GEN_CMD_CODE(_GetBasicRate), NULL},
-	{GEN_CMD_CODE(_SetDataRate), NULL},
-	{GEN_CMD_CODE(_GetDataRate), NULL},
-	{GEN_CMD_CODE(_SetPhyInfo), NULL},
-
-	{GEN_CMD_CODE(_GetPhyInfo), NULL}, /*30*/
-	{GEN_CMD_CODE(_SetPhy), NULL},
-	{GEN_CMD_CODE(_GetPhy), NULL},
-	{GEN_CMD_CODE(_readRssi), NULL},
-	{GEN_CMD_CODE(_readGain), NULL},
-	{GEN_CMD_CODE(_SetAtim), NULL}, /*35*/
-	{GEN_CMD_CODE(_SetPwrMode), NULL},
-	{GEN_CMD_CODE(_JoinbssRpt), NULL},
-	{GEN_CMD_CODE(_SetRaTable), NULL},
-	{GEN_CMD_CODE(_GetRaTable), NULL},
-
-	{GEN_CMD_CODE(_GetCCXReport), NULL}, /*40*/
-	{GEN_CMD_CODE(_GetDTMReport),	NULL},
-	{GEN_CMD_CODE(_GetTXRateStatistics), NULL},
-	{GEN_CMD_CODE(_SetUsbSuspend), NULL},
-	{GEN_CMD_CODE(_SetH2cLbk), NULL},
-	{GEN_CMD_CODE(_AddBAReq), NULL}, /*45*/
-	{GEN_CMD_CODE(_SetChannel), NULL},		/*46*/
-	{GEN_CMD_CODE(_SetTxPower), NULL},
-	{GEN_CMD_CODE(_SwitchAntenna), NULL},
-	{GEN_CMD_CODE(_SetCrystalCap), NULL},
-	{GEN_CMD_CODE(_SetSingleCarrierTx), NULL},	/*50*/
-
-	{GEN_CMD_CODE(_SetSingleToneTx), NULL}, /*51*/
-	{GEN_CMD_CODE(_SetCarrierSuppressionTx), NULL},
-	{GEN_CMD_CODE(_SetContinuousTx), NULL},
-	{GEN_CMD_CODE(_SwitchBandwidth), NULL},		/*54*/
-	{GEN_CMD_CODE(_TX_Beacon), NULL},/*55*/
-
-	{GEN_CMD_CODE(_Set_MLME_EVT), NULL},/*56*/
-	{GEN_CMD_CODE(_Set_Drv_Extra), NULL},/*57*/
-	{GEN_CMD_CODE(_Set_H2C_MSG), NULL},/*58*/
-	{GEN_CMD_CODE(_SetChannelPlan), NULL},/*59*/
-
-	{GEN_CMD_CODE(_SetChannelSwitch), NULL},/*60*/
-	{GEN_CMD_CODE(_TDLS), NULL},/*61*/
-	{GEN_CMD_CODE(_ChkBMCSleepq), NULL}, /*62*/
-
-	{GEN_CMD_CODE(_RunInThreadCMD), NULL},/*63*/
+	{GEN_CMD_CODE(_read_bbreg), &rtw_getbbrfreg_cmdrsp_callback},
+	{GEN_CMD_CODE(_write_bbreg), NULL},
+	{GEN_CMD_CODE(_read_rfreg), &rtw_getbbrfreg_cmdrsp_callback},
+	{GEN_CMD_CODE(_write_rfreg), NULL}, /*5*/
+	{GEN_CMD_CODE(_read_eeprom), NULL},
+	{GEN_CMD_CODE(_write_eeprom), NULL},
+	{GEN_CMD_CODE(_read_efuse), NULL},
+	{GEN_CMD_CODE(_write_efuse), NULL},
+
+	{GEN_CMD_CODE(_read_cam),	NULL},	/*10*/
+	{GEN_CMD_CODE(_write_cam),	 NULL},
+	{GEN_CMD_CODE(_set_bcnitv), NULL},
+	{GEN_CMD_CODE(_set_mbidcfg), NULL},
+	{GEN_CMD_CODE(_join_bss), &rtw_joinbss_cmd_callback},  /*14*/
+	{GEN_CMD_CODE(_disconnect), &rtw_disassoc_cmd_callback}, /*15*/
+	{GEN_CMD_CODE(_create_bss), &rtw_createbss_cmd_callback},
+	{GEN_CMD_CODE(_set_op_mode), NULL},
+	{GEN_CMD_CODE(_site_survey), &rtw_survey_cmd_callback}, /*18*/
+	{GEN_CMD_CODE(_set_auth), NULL},
+
+	{GEN_CMD_CODE(_set_key), NULL},	/*20*/
+	{GEN_CMD_CODE(_set_sta_key), &rtw_setstaKey_cmdrsp_callback},
+	{GEN_CMD_CODE(_set_assoc_sta), &rtw_setassocsta_cmdrsp_callback},
+	{GEN_CMD_CODE(_del_assoc_sta), NULL},
+	{GEN_CMD_CODE(_set_sta_pwr_state), NULL},
+	{GEN_CMD_CODE(_set_basic_rate), NULL}, /*25*/
+	{GEN_CMD_CODE(_get_basic_rate), NULL},
+	{GEN_CMD_CODE(_set_data_rate), NULL},
+	{GEN_CMD_CODE(_get_data_rate), NULL},
+	{GEN_CMD_CODE(_set_phy_info), NULL},
+
+	{GEN_CMD_CODE(_get_phy_info), NULL}, /*30*/
+	{GEN_CMD_CODE(_set_phy), NULL},
+	{GEN_CMD_CODE(_get_phy), NULL},
+	{GEN_CMD_CODE(_read_rssi), NULL},
+	{GEN_CMD_CODE(_read_gain), NULL},
+	{GEN_CMD_CODE(_set_atim), NULL}, /*35*/
+	{GEN_CMD_CODE(_set_pwr_mode), NULL},
+	{GEN_CMD_CODE(_joinbss_rpt), NULL},
+	{GEN_CMD_CODE(_set_ra_table), NULL},
+	{GEN_CMD_CODE(_get_ra_table), NULL},
+
+	{GEN_CMD_CODE(_get_ccx_report), NULL}, /*40*/
+	{GEN_CMD_CODE(_get_dtm_report),	NULL},
+	{GEN_CMD_CODE(_get_tx_rate_statistics), NULL},
+	{GEN_CMD_CODE(_set_usb_suspend), NULL},
+	{GEN_CMD_CODE(_set_h2c_lbk), NULL},
+	{GEN_CMD_CODE(_add_ba_req), NULL}, /*45*/
+	{GEN_CMD_CODE(_set_channel), NULL},		/*46*/
+	{GEN_CMD_CODE(_set_tx_power), NULL},
+	{GEN_CMD_CODE(_switch_antenna), NULL},
+	{GEN_CMD_CODE(_set_crystal_cap), NULL},
+	{GEN_CMD_CODE(_set_single_carrier_tx), NULL},	/*50*/
+
+	{GEN_CMD_CODE(_set_single_tone_tx), NULL}, /*51*/
+	{GEN_CMD_CODE(_set_carrier_suppression_tx), NULL},
+	{GEN_CMD_CODE(_set_continuous_tx), NULL},
+	{GEN_CMD_CODE(_switch_bandwidth), NULL},		/*54*/
+	{GEN_CMD_CODE(_tx_beacon), NULL},/*55*/
+
+	{GEN_CMD_CODE(_set_mlme_evt), NULL},/*56*/
+	{GEN_CMD_CODE(_set_drv_extra), NULL},/*57*/
+	{GEN_CMD_CODE(_set_h2c_msg), NULL},/*58*/
+	{GEN_CMD_CODE(_set_channel_plan), NULL},/*59*/
+
+	{GEN_CMD_CODE(_set_channel_switch), NULL},/*60*/
+	{GEN_CMD_CODE(_tdls), NULL},/*61*/
+	{GEN_CMD_CODE(_chk_bmc_sleepq), NULL}, /*62*/
+
+	{GEN_CMD_CODE(_run_in_thread_cmd), NULL},/*63*/
 };
 
 static struct cmd_hdl wlancmds[] = {
diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
index cb44119ce9a9..e4e7e350d0fc 100644
--- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
@@ -636,7 +636,7 @@ enum {
 	GEN_CMD_CODE(_Write_BBREG),
 	GEN_CMD_CODE(_Read_RFREG),
 	GEN_CMD_CODE(_Write_RFREG), /*5*/
-	GEN_CMD_CODE(_Read_EEPROM),
+	GEN_CMD_CODE(_read_eeprom),
 	GEN_CMD_CODE(_Write_EEPROM),
 	GEN_CMD_CODE(_Read_EFUSE),
 	GEN_CMD_CODE(_Write_EFUSE),
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 2080408743ef..63373d665d4f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -684,7 +684,7 @@ enum {
 	GEN_EVT_CODE(_Read_MACREG) = 0, /*0*/
 	GEN_EVT_CODE(_Read_BBREG),
 	GEN_EVT_CODE(_Read_RFREG),
-	GEN_EVT_CODE(_Read_EEPROM),
+	GEN_EVT_CODE(_read_eeprom),
 	GEN_EVT_CODE(_Read_EFUSE),
 	GEN_EVT_CODE(_Read_CAM),			/*5*/
 	GEN_EVT_CODE(_Get_BasicRate),
-- 
2.43.0

