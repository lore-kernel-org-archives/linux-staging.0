Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DB92F43
	for <linux-staging@lists.linux.dev>; Tue, 27 May 2025 00:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748306618; cv=none; b=tvlbo2jeF9lfBwNLm1krYKrZ3BVExGKvDa1fMm4lhma9Wkl4ggYMZyi3N1doLFDn/EJJjV8ftX+pg4u5VaEE2Nf9nRLbEGDnybK8VuoPJ7bxi7Q30T7qrxQPWAywN8L1bvgAMNV97R9hhlo8NUIZHBaBd5pRLksvCsYOgODUUKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748306618; c=relaxed/simple;
	bh=e18nQhjQ5mWydJQ+WlNRDsnNlv/fqKTV25n04i2rimA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YcZO5VSH2vbuJDL8Iudh59f5lQ6LIrzpe9BemtQf0qjvbLs/r8bYW18l1OOwU7GSyikvr250zSTxmcHWvOBVoYyvcH6YjU9fJVJg8IbvAMpsUDtUyPEPJd/UchT3ATgG72g2wPVKflfE57VKUTw06KBbPXSE1WGHlLB5LO69GNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+iE9mQH; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+iE9mQH"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-70e2dda56ceso17285787b3.2
        for <linux-staging@lists.linux.dev>; Mon, 26 May 2025 17:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748306615; x=1748911415; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pqf85rQWUyB/B3dGBuKvFUilBrqwvgnwh3WZdpEEFOU=;
        b=V+iE9mQH+iEQpAGG4R63H0ysPot6zekL6+s1BaIA7HNC482udmccfMIdkfOLmK2D44
         Yvy+OLw8x1KnBau9SBupx7LV6zy88h9BmxIVWmn6+Q8ScHmaMjvCHmB6gMNnjDWX1r1k
         U3skX3PakpX/4RLbtFgw6f5TTwyMXB5zzqKH9Teyb3mr5wLEg4+yDgIkWIOmQLXJxjl0
         dvhPq/XyXW1XPJx/5Iavfnd/BnE4kFfpP8k9PrQkVk09+hdvY7OUnB/HzzRcbW8khecq
         /pWnb61NousgbsrwyeG/640V5kgWBPwGdbq/IyGbxfSovAT5zQNbl9YjLnJZgdSvrKd4
         Y8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748306615; x=1748911415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pqf85rQWUyB/B3dGBuKvFUilBrqwvgnwh3WZdpEEFOU=;
        b=M8b0gQAeTHcOjXd5pnaNBem5TMZ+bhw3uL6liU0yQNkBQbWLMNcUgJK72Gt7aHLIQx
         L7q2myseDIVH7HIBzFgOgSF5h7M9/12jYeMv48a51T+6yscvEdXJP0knLZar/dustA2W
         B2MmfFe3Ggl98tywVKtZAtu2vAI19K3bu3+cZiWbqfASmlcRDZQDPdE1teRgqf+B6MCl
         4KwWGlYC6NlhhmhypYvKIO7Hgngt+VIwvzlpB2aT7AuZkut4rW6AxunVMKfBmhhN/d3g
         q3BbDvlQu2UWCRhFn44iUnfyFcx6URjKHJlhdzvXyLL4yJIXRKY7F3dQMrAstTk15aCz
         FqgQ==
X-Gm-Message-State: AOJu0YyV/oZ2T8K2F/HznhmEg8ryP0fkkC8JKCXtRqXYHMPdqGRAYJdV
	GwCHmnVXP8c1EtwpwgMeAogHou0CfkzF7OCAidAQ5u+X9iHosWiP67Qr
X-Gm-Gg: ASbGnctrz2REZr19xjKgIKFZTcoBPLbAoUIKp1pThKpnzAfjNC1HyqlQcOJtqr39JVE
	9JJ+CX8gOlnDgz1ZZAW65M6HL8HKL75EOH0TvS1fnDgJYVc2k9HGlz/ga4ljTUTRbkPl/W7aeF/
	vDACXnTq+fjqlRhYh8p+9nV2zSUDNZFYIPmVlY64TkQcR6u/N/U6zKhlccYnsFDlbRG8mD5tp4W
	yYBy70++tl61whKTUA2iTH966nknGYXQIjzT/zcVYZeaBbnZMfWXqyfGyustMR6T+TdpcLZzZYS
	noswPiA9ep0JTRxH0wuo/KQwceZAhAtpK5czZLalLdvZqnd/0+eM8dMpcSiuUdUr+SjTlSUL7mB
	7gw==
X-Google-Smtp-Source: AGHT+IEHNeqz4IMhHtj5nSwQVukC7KYSf8ENCQ01VvaYnC29cCgop9j/Ge6TumDIF89lfo4S+OvukA==
X-Received: by 2002:a05:690c:6505:b0:70e:1474:63f2 with SMTP id 00721157ae682-70e2d985e70mr124041727b3.7.1748306615250;
        Mon, 26 May 2025 17:43:35 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([191.156.46.41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70e78506e06sm503907b3.7.2025.05.26.17.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 17:43:34 -0700 (PDT)
From: Donny Turizo <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny Turizo <donnyturizo13@gmail.com>
Subject: [PATCH v8] staging: rtl8723bs: rename _Read_EEPROM and other functions to snake_case
Date: Tue, 27 May 2025 00:43:27 +0000
Message-ID: <20250527004327.3627-1-donnyturizo13@gmail.com>
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

v7: This is v7 of the patch, now rebased onto gregkh's staging-testing
branch to avoid merge conflicts and stay in sync with the latest changes
in the staging tree.

v8:
Actually rebased on top of the latest gregkh/staging-testing.
In v7 I mentioned a rebase, but I had forgotten to run
`git fetch gregkh`, so the patch was not properly rebased.
No code changes from v7. Only the base of the patch is updated.
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

