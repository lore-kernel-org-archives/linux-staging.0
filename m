Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E30623E358
	for <linux-staging@lists.linux.dev>; Mon, 26 May 2025 21:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748296468; cv=none; b=QBTGXVuxlfttYthdo2V3CjsczgNvQ+YMI4h9kuB/plvi77RdHj1la33BS0Rgp/okGy75YFHDYsMSzHbtpdYaSUXH/9Fi41F5NQESwMisesA1VG/t3U/cI2CNlGQt4ya7aChSsjGL4M6S//YMzCdewk8X8umvJ2aVnX86z2BnK3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748296468; c=relaxed/simple;
	bh=oDp1QMx3PGZuS68a+69DVS8QpwcEdHxsSnJk3Z/1h/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=azf6buu+eZDO0YBbjivYtEyndcSfQGC9uYcKsqhLzkLUq0cu8dBUAuHppfg+5H0whnUyB1vUM3Zr3twH8vKOu+GY/5rWn4XUjKt+7qXYwS4B9utA7kIfkijBkh2Egi8RnOrcIl4/gxYQip01rr8VjTGuZ5O0g3QfOuVrmQvwCVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqDCsD1r; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqDCsD1r"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-87df4dc0e54so483389241.0
        for <linux-staging@lists.linux.dev>; Mon, 26 May 2025 14:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748296466; x=1748901266; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3sttzwwEBlrOS+cVlPp3FlNUB/dv0rPr1Mn8CQuusnM=;
        b=eqDCsD1rYyyM8Pphr1sdabZhNObwAHwm3pL3WhNGfNGmLM7wQIAPcuN/Zl0QmB9wc1
         MDAs1lDTArV3GTOu4fKI/dd+FEqWusfWeWlU++ociYbGUnauKLCAWaI+Xfn+i4nUNDih
         7vYtr8fynUL1ghd+6WZTmYqeNVQ9W3zLk0rHfwmoVDYqwxKofYOdraqhlPnsaQUBvj60
         medarynxZT9F6pX0PSy1rglb/DBskfXNCL4bIiqH0OfCXA76yJkVOp3XKim3FaRLsJ23
         +TGo38wX132KtE1CM50qScIG+khXxtB2j/AI4iYgm5wBBe221iQBpB/EeCLevI26EhL1
         3ZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748296466; x=1748901266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3sttzwwEBlrOS+cVlPp3FlNUB/dv0rPr1Mn8CQuusnM=;
        b=YNk2BLSs+l3s9KiFNviRCpmmtVXWbzsntnLuh5bI+yDb/gmVHd1FPM0FQfCcyJx3ob
         SFRJYwmN0A8hQSOzb8W2/zCXAlJnLPHaRO1eYm51tE1vQTWOPmr+AO8Zv1xmGY+MbHlp
         9NcYd18E5zEUGuV+P4xuaK9OE71lwEgTOdLTQ5kZINbnxSLrXpdkhNKC8UT+I6K529l8
         vhL7shi+aX4fGuwpEZ0or78bN4VcLINv0nFbRSbjwFQ/m7KMGR2ajfGy7uf0J9nssj40
         F3MtC3yVXj1pC8PKgV2l//1J22ENNiDxbWnTgZzcKV6BTadLKIwNI0PS9yu6U6IQ2PKT
         TrBQ==
X-Gm-Message-State: AOJu0Yxd4RUI8WA977p3quTnZPwVkbr9unhxiUMb2BHvFP2jYtlwpCFp
	PGr/DE1RTfh8ekL0Dpnxwm41g4HBJQs5SR5WMJUNOZssBDGQhNo8onrj
X-Gm-Gg: ASbGncv+npazXbja9AflJ6zb+pYQCkE2730cUNmBO8PWbGM6Ek5ZmqRuFFcFl82GaK6
	q16gkGpZG1l1eyb/secARpR3OPDzKaajaiAD28XigC9Fg4kuvQwqQa/6YD5FgPeYU/zT6gAoRwd
	XR5lLDyAqStfJJdJV/wR2CduS6KeVgL/fCSTpgub7EBNfPyeKPGVmX7ph3Y9MeqDw0rY+m8NLQK
	0eDwaCToUFD243aS10HAYgm8M6V//djIkBLwA114477/ZCywxjcWXxpMB0qJEYxIxZIpansuyKn
	iF/hHYPi/FjJN+iOwPbdmI6XPP1w7aSlTsfsvuU/CgkmvFpTT4Nqwtpyxa4n4/kSn52IToYaaV+
	Xzg==
X-Google-Smtp-Source: AGHT+IHkeA3NCbRJbQVu8vq4MX/aFrWBWA0ps66DhIY8eWLWqzbUgn80oQ6QRQ5fBGOMP2dhnspPlw==
X-Received: by 2002:a05:6102:5126:b0:4e4:5e11:6848 with SMTP id ada2fe7eead31-4e45e116d65mr2584654137.23.1748296465749;
        Mon, 26 May 2025 14:54:25 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([191.156.36.62])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e45beecf4bsm1562462137.2.2025.05.26.14.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 14:54:25 -0700 (PDT)
From: Donny Turizo <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny Turizo <donnyturizo13@gmail.com>
Subject: [PATCH v7] staging: rtl8723bs: rename _Read_EEPROM and other functions to snake_case
Date: Mon, 26 May 2025 21:54:18 +0000
Message-ID: <20250526215419.15057-1-donnyturizo13@gmail.com>
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

