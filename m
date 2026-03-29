Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722D822F77B
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 04:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774760098; cv=none; b=FGeQdjhcP6gWnI2mysbC8dJtNwuv1dsUSjwh5VRT9ai85KEPxRCNOuJoCwXoiWPo5xVr1VvrJ4DQp3Tqsri1Z/Slh545FlsAt2iA3x19HbUBsLBLfUg9T/Ag9GoDeDsVieOuwjHUC2iW7GufL+Rq4plRCkDWGLlCaWaRc/kaf/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774760098; c=relaxed/simple;
	bh=DJQON9L7V+0XaXva4PzTwMy/Z8s2kOR2NSWZj3fKXZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tza6eT+p/LfXUmssA3Qd70meBt0lZdrwjxJZtNpwsnd3mo6JtME7lqyWwuq/9KiZio+JYAnYXkCbaF3YeAfznWG8idc1tr/MRBufYMVFD+zQf4EEK4KydhnKimScMMYt2GkFAPmn3EfOJaZGfH3zEhY8VEfwm551Kc1sh24zH+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pbLBYDPc; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pbLBYDPc"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-89c68b0763aso37789066d6.0
        for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 21:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774760092; x=1775364892; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T9m1VTcQ9iAiNDXTykf+/ubS1jbRU5Sl7OXKpnf1D5s=;
        b=pbLBYDPchOWkJN1hlsk5gMahd1rmY5r4tzf4MIBpM9QLoPekn48gwNyCbxgAyydlzL
         5lpAGHGCZOSEbmprnHDsP/6929RAD74tlziVbnJABi9NsrMe16+gOxMqCCIYFJi3hWdW
         lGlz7DhTnrsrJMryIxI/VM8tnYmj7xJ7LljILhcQTRjzOACWkeXzar3U6F9UGw9FC6gi
         Wv8REGFJ/R28PFPDQ5JsCcs50z1BO+W3w2srEr7J7VTNKwv55ZI1oHdUxYshQI4ZvQQl
         RcczkqWhNP+m9jDnPzVs+NYTRMo97M/tjdMFhdSBXAn7JLAekyFcE5ZlUmDXgKtF5RM9
         DZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774760092; x=1775364892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9m1VTcQ9iAiNDXTykf+/ubS1jbRU5Sl7OXKpnf1D5s=;
        b=XV98YLAQnDd9Gbsq3FLE7oz4bWdJsJcze1zsI6762of3mOaLc5l1jovLXlCLx+5e5Q
         uNQ7JfAP2KLCDzX3B51cWpsGp1sNkutwW8fAPn3in4iW6SK5L6yhfoPjX7NcTEgLqEym
         CcOi8F+kX5ygAqk9a1gqevf1FameOAKROTydHlKH1exgYdzovGGc/I9oOKwTb6x+A3MT
         uaDZdjn8sP49cbUulau1m0vKoStui0PGOoeFDnJ7+iH//oXf01PLyZkbV6XeC1bijHv+
         eWWd3CYZ5MNeeT4jW1O9IDjiKSpIDABN3h6Im7sPfrDdRqOemoqHpyauhl71Vc5X5hZK
         Ockg==
X-Gm-Message-State: AOJu0YzvWlFkV74vUisGBhReYsxNI3m+seOM9VQH3AeMNFKb3GAUBBmG
	zKIvl5a2ZgDI56VvqOnMis98HOmsmiXLC+UjbdXMwJc9y4x3pWsvtC9j
X-Gm-Gg: ATEYQzzWA1PRNd0l2y3pg6iFAmFJdaSUcAj24jDAugltsgOu0ma8AsDFAr0Cj8K3Sx7
	8D7axnXE4OuZ/E+XIOYO1EiN/pT1tEya+nTi9+QlrSIfXJMvwW+VWP793UBRnpmRygeUF4cYBsN
	UAAhhNLMt15XTKyX6Uml+XZxVZYkDLlw49nyT48drUGsy/8A4rUstZ7iNoFJuWL3Auqvuo9I+zG
	c6uCKfW33PX41cWcxUh8wjzlYuZbJlho+GNBFbaatTxeF7zSSacO6IKp1wyCec74+jUiCgumKsi
	hcUTQAJMSi1VGm59XBV7t6IFKHGqMcqBujq3damTD2zLlMUkAtPXNUDC8BZ2ES+/h9FfrGqLKM5
	8V6rmUOId+VNP7RM/vdhoFqHH2ih+kdb1w++FZANOCGcQp8aNjUIR6qR1wwztavb8L4HWVCH1nE
	JoTtGT+HdFION4got7qHOqZsy6tu7sHug8Ssbu
X-Received: by 2002:a05:6214:8088:b0:89f:e674:1f13 with SMTP id 6a1803df08f44-89fe6742ad1mr24564716d6.16.1774760091824;
        Sat, 28 Mar 2026 21:54:51 -0700 (PDT)
Received: from m2 ([2601:5c2:100:2f60:11f8:78ef:721f:37c8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecb5ce4a8sm31394966d6.5.2026.03.28.21.54.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Mar 2026 21:54:51 -0700 (PDT)
From: Xiyuan Guo <tommyguo039@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiyuan Guo <tommyguo039@gmail.com>,
	Xiyuan Guo <tommyguo024@outlook.com>
Subject: [PATCH] staging: rtl8723bs: fix CamelCase warning for READ_MACREG
Date: Sun, 29 Mar 2026 00:54:47 -0400
Message-ID: <20260329045447.49789-1-tommyguo039@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the _Read_MACREG macro to READ_MACREG to resolve the
checkpatch.pl "Avoid CamelCase" warning.

Signed-off-by: Xiyuan Guo <tommyguo024@outlook.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 762 ++++++++++--------
 drivers/staging/rtl8723bs/include/rtw_cmd.h   | 295 +++----
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  | 413 +++++-----
 3 files changed, 830 insertions(+), 640 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index abb84f8aecbe..d81a931c75ce 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -10,148 +10,159 @@
 #include <linux/align.h>
 
 static struct _cmd_callback rtw_cmd_callback[] = {
-	{GEN_CMD_CODE(_Read_MACREG), NULL}, /*0*/
-	{GEN_CMD_CODE(_Write_MACREG), NULL},
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
+	{ GEN_CMD_CODE(READ_MACREG), NULL }, /*0*/
+	{ GEN_CMD_CODE(_Write_MACREG), NULL },
+	{ GEN_CMD_CODE(_Read_BBREG), &rtw_getbbrfreg_cmdrsp_callback },
+	{ GEN_CMD_CODE(_Write_BBREG), NULL },
+	{ GEN_CMD_CODE(_Read_RFREG), &rtw_getbbrfreg_cmdrsp_callback },
+	{ GEN_CMD_CODE(_Write_RFREG), NULL }, /*5*/
+	{ GEN_CMD_CODE(_Read_EEPROM), NULL },
+	{ GEN_CMD_CODE(_Write_EEPROM), NULL },
+	{ GEN_CMD_CODE(_Read_EFUSE), NULL },
+	{ GEN_CMD_CODE(_Write_EFUSE), NULL },
+
+	{ GEN_CMD_CODE(_Read_CAM), NULL }, /*10*/
+	{ GEN_CMD_CODE(_Write_CAM), NULL },
+	{ GEN_CMD_CODE(_setBCNITV), NULL },
+	{ GEN_CMD_CODE(_setMBIDCFG), NULL },
+	{ GEN_CMD_CODE(_JoinBss), &rtw_joinbss_cmd_callback }, /*14*/
+	{ GEN_CMD_CODE(_DisConnect), &rtw_disassoc_cmd_callback }, /*15*/
+	{ GEN_CMD_CODE(_CreateBss), &rtw_createbss_cmd_callback },
+	{ GEN_CMD_CODE(_SetOpMode), NULL },
+	{ GEN_CMD_CODE(_SiteSurvey), &rtw_survey_cmd_callback }, /*18*/
+	{ GEN_CMD_CODE(_SetAuth), NULL },
+
+	{ GEN_CMD_CODE(_SetKey), NULL }, /*20*/
+	{ GEN_CMD_CODE(_SetStaKey), &rtw_setstaKey_cmdrsp_callback },
+	{ GEN_CMD_CODE(_SetAssocSta), &rtw_setassocsta_cmdrsp_callback },
+	{ GEN_CMD_CODE(_DelAssocSta), NULL },
+	{ GEN_CMD_CODE(_SetStaPwrState), NULL },
+	{ GEN_CMD_CODE(_SetBasicRate), NULL }, /*25*/
+	{ GEN_CMD_CODE(_GetBasicRate), NULL },
+	{ GEN_CMD_CODE(_SetDataRate), NULL },
+	{ GEN_CMD_CODE(_GetDataRate), NULL },
+	{ GEN_CMD_CODE(_SetPhyInfo), NULL },
+
+	{ GEN_CMD_CODE(_GetPhyInfo), NULL }, /*30*/
+	{ GEN_CMD_CODE(_SetPhy), NULL },
+	{ GEN_CMD_CODE(_GetPhy), NULL },
+	{ GEN_CMD_CODE(_readRssi), NULL },
+	{ GEN_CMD_CODE(_readGain), NULL },
+	{ GEN_CMD_CODE(_SetAtim), NULL }, /*35*/
+	{ GEN_CMD_CODE(_SetPwrMode), NULL },
+	{ GEN_CMD_CODE(_JoinbssRpt), NULL },
+	{ GEN_CMD_CODE(_SetRaTable), NULL },
+	{ GEN_CMD_CODE(_GetRaTable), NULL },
+
+	{ GEN_CMD_CODE(_GetCCXReport), NULL }, /*40*/
+	{ GEN_CMD_CODE(_GetDTMReport), NULL },
+	{ GEN_CMD_CODE(_GetTXRateStatistics), NULL },
+	{ GEN_CMD_CODE(_SetUsbSuspend), NULL },
+	{ GEN_CMD_CODE(_SetH2cLbk), NULL },
+	{ GEN_CMD_CODE(_AddBAReq), NULL }, /*45*/
+	{ GEN_CMD_CODE(_SetChannel), NULL }, /*46*/
+	{ GEN_CMD_CODE(_SetTxPower), NULL },
+	{ GEN_CMD_CODE(_SwitchAntenna), NULL },
+	{ GEN_CMD_CODE(_SetCrystalCap), NULL },
+	{ GEN_CMD_CODE(_SetSingleCarrierTx), NULL }, /*50*/
+
+	{ GEN_CMD_CODE(_SetSingleToneTx), NULL }, /*51*/
+	{ GEN_CMD_CODE(_SetCarrierSuppressionTx), NULL },
+	{ GEN_CMD_CODE(_SetContinuousTx), NULL },
+	{ GEN_CMD_CODE(_SwitchBandwidth), NULL }, /*54*/
+	{ GEN_CMD_CODE(_TX_Beacon), NULL }, /*55*/
+
+	{ GEN_CMD_CODE(_Set_MLME_EVT), NULL }, /*56*/
+	{ GEN_CMD_CODE(_Set_Drv_Extra), NULL }, /*57*/
+	{ GEN_CMD_CODE(_Set_H2C_MSG), NULL }, /*58*/
+	{ GEN_CMD_CODE(_SetChannelPlan), NULL }, /*59*/
+
+	{ GEN_CMD_CODE(_SetChannelSwitch), NULL }, /*60*/
+	{ GEN_CMD_CODE(_TDLS), NULL }, /*61*/
+	{ GEN_CMD_CODE(_ChkBMCSleepq), NULL }, /*62*/
+
+	{ GEN_CMD_CODE(_RunInThreadCMD), NULL }, /*63*/
 };
 
 static struct cmd_hdl wlancmds[] = {
 	GEN_DRV_CMD_HANDLER(0, NULL) /*0*/
-	GEN_DRV_CMD_HANDLER(0, NULL)
-	GEN_DRV_CMD_HANDLER(0, NULL)
-	GEN_DRV_CMD_HANDLER(0, NULL)
-	GEN_DRV_CMD_HANDLER(0, NULL)
-	GEN_DRV_CMD_HANDLER(0, NULL)
-	GEN_MLME_EXT_HANDLER(0, NULL)
-	GEN_MLME_EXT_HANDLER(0, NULL)
-	GEN_MLME_EXT_HANDLER(0, NULL)
-	GEN_MLME_EXT_HANDLER(0, NULL)
-	GEN_MLME_EXT_HANDLER(0, NULL) /*10*/
-	GEN_MLME_EXT_HANDLER(0, NULL)
-	GEN_MLME_EXT_HANDLER(0, NULL)
-	GEN_MLME_EXT_HANDLER(0, NULL)
-	GEN_MLME_EXT_HANDLER(sizeof(struct joinbss_parm), join_cmd_hdl) /*14*/
+	GEN_DRV_CMD_HANDLER(0, NULL) GEN_DRV_CMD_HANDLER(0, NULL)
+		GEN_DRV_CMD_HANDLER(0, NULL) GEN_DRV_CMD_HANDLER(
+			0, NULL) GEN_DRV_CMD_HANDLER(0, NULL)
+			GEN_MLME_EXT_HANDLER(0, NULL) GEN_MLME_EXT_HANDLER(
+				0, NULL) GEN_MLME_EXT_HANDLER(0, NULL)
+				GEN_MLME_EXT_HANDLER(0, NULL)
+					GEN_MLME_EXT_HANDLER(0, NULL) /*10*/
+	GEN_MLME_EXT_HANDLER(0, NULL) GEN_MLME_EXT_HANDLER(0, NULL)
+		GEN_MLME_EXT_HANDLER(0, NULL) GEN_MLME_EXT_HANDLER(
+			sizeof(struct joinbss_parm), join_cmd_hdl) /*14*/
 	GEN_MLME_EXT_HANDLER(sizeof(struct disconnect_parm), disconnect_hdl)
-	GEN_MLME_EXT_HANDLER(sizeof(struct createbss_parm), createbss_hdl)
-	GEN_MLME_EXT_HANDLER(sizeof(struct setopmode_parm), setopmode_hdl)
-	GEN_MLME_EXT_HANDLER(sizeof(struct sitesurvey_parm), sitesurvey_cmd_hdl) /*18*/
+		GEN_MLME_EXT_HANDLER(sizeof(struct createbss_parm),
+				     createbss_hdl)
+			GEN_MLME_EXT_HANDLER(sizeof(struct setopmode_parm),
+					     setopmode_hdl)
+				GEN_MLME_EXT_HANDLER(
+					sizeof(struct sitesurvey_parm),
+					sitesurvey_cmd_hdl) /*18*/
 	GEN_MLME_EXT_HANDLER(sizeof(struct setauth_parm), setauth_hdl)
-	GEN_MLME_EXT_HANDLER(sizeof(struct setkey_parm), setkey_hdl) /*20*/
-	GEN_MLME_EXT_HANDLER(sizeof(struct set_stakey_parm), set_stakey_hdl)
-	GEN_MLME_EXT_HANDLER(sizeof(struct set_assocsta_parm), NULL)
-	GEN_MLME_EXT_HANDLER(sizeof(struct del_assocsta_parm), NULL)
-	GEN_MLME_EXT_HANDLER(sizeof(struct setstapwrstate_parm), NULL)
-	GEN_MLME_EXT_HANDLER(sizeof(struct setbasicrate_parm), NULL)
-	GEN_MLME_EXT_HANDLER(sizeof(struct getbasicrate_parm), NULL)
-	GEN_MLME_EXT_HANDLER(sizeof(struct setdatarate_parm), NULL)
-	GEN_MLME_EXT_HANDLER(sizeof(struct getdatarate_parm), NULL)
-	GEN_MLME_EXT_HANDLER(sizeof(struct setphyinfo_parm), NULL)
-	GEN_MLME_EXT_HANDLER(sizeof(struct getphyinfo_parm), NULL)  /*30*/
-	GEN_MLME_EXT_HANDLER(sizeof(struct setphy_parm), NULL)
-	GEN_MLME_EXT_HANDLER(sizeof(struct getphy_parm), NULL)
-	GEN_MLME_EXT_HANDLER(0, NULL)
-	GEN_MLME_EXT_HANDLER(0, NULL)
-	GEN_MLME_EXT_HANDLER(0, NULL)
-	GEN_MLME_EXT_HANDLER(0, NULL)
-	GEN_MLME_EXT_HANDLER(0, NULL)
-	GEN_MLME_EXT_HANDLER(0, NULL)
-	GEN_MLME_EXT_HANDLER(0, NULL)
-	GEN_MLME_EXT_HANDLER(0, NULL)	/*40*/
-	GEN_MLME_EXT_HANDLER(0, NULL)
-	GEN_MLME_EXT_HANDLER(0, NULL)
-	GEN_MLME_EXT_HANDLER(0, NULL)
-	GEN_MLME_EXT_HANDLER(0, NULL)
-	GEN_MLME_EXT_HANDLER(sizeof(struct addBaReq_parm), add_ba_hdl)
-	GEN_MLME_EXT_HANDLER(sizeof(struct set_ch_parm), set_ch_hdl) /* 46 */
-	GEN_MLME_EXT_HANDLER(0, NULL)
-	GEN_MLME_EXT_HANDLER(0, NULL)
-	GEN_MLME_EXT_HANDLER(0, NULL)
-	GEN_MLME_EXT_HANDLER(0, NULL) /*50*/
-	GEN_MLME_EXT_HANDLER(0, NULL)
-	GEN_MLME_EXT_HANDLER(0, NULL)
-	GEN_MLME_EXT_HANDLER(0, NULL)
-	GEN_MLME_EXT_HANDLER(0, NULL)
-	GEN_MLME_EXT_HANDLER(sizeof(struct Tx_Beacon_param), tx_beacon_hdl) /*55*/
+		GEN_MLME_EXT_HANDLER(sizeof(struct setkey_parm),
+				     setkey_hdl) /*20*/
+	GEN_MLME_EXT_HANDLER(sizeof(struct set_stakey_parm), set_stakey_hdl) GEN_MLME_EXT_HANDLER(
+		sizeof(struct set_assocsta_parm),
+		NULL) GEN_MLME_EXT_HANDLER(sizeof(struct del_assocsta_parm),
+					   NULL)
+		GEN_MLME_EXT_HANDLER(
+			sizeof(struct setstapwrstate_parm),
+			NULL) GEN_MLME_EXT_HANDLER(sizeof(struct setbasicrate_parm),
+						   NULL)
+			GEN_MLME_EXT_HANDLER(
+				sizeof(struct getbasicrate_parm),
+				NULL) GEN_MLME_EXT_HANDLER(sizeof(struct setdatarate_parm),
+							   NULL)
+				GEN_MLME_EXT_HANDLER(
+					sizeof(struct getdatarate_parm), NULL)
+					GEN_MLME_EXT_HANDLER(
+						sizeof(struct setphyinfo_parm),
+						NULL)
+						GEN_MLME_EXT_HANDLER(
+							sizeof(struct getphyinfo_parm),
+							NULL) /*30*/
+	GEN_MLME_EXT_HANDLER(
+		sizeof(struct setphy_parm),
+		NULL) GEN_MLME_EXT_HANDLER(sizeof(struct getphy_parm),
+					   NULL) GEN_MLME_EXT_HANDLER(0, NULL)
+		GEN_MLME_EXT_HANDLER(0, NULL) GEN_MLME_EXT_HANDLER(0, NULL)
+			GEN_MLME_EXT_HANDLER(0, NULL) GEN_MLME_EXT_HANDLER(
+				0, NULL) GEN_MLME_EXT_HANDLER(0, NULL)
+				GEN_MLME_EXT_HANDLER(0, NULL)
+					GEN_MLME_EXT_HANDLER(0, NULL) /*40*/
+	GEN_MLME_EXT_HANDLER(0, NULL) GEN_MLME_EXT_HANDLER(0, NULL)
+		GEN_MLME_EXT_HANDLER(0, NULL) GEN_MLME_EXT_HANDLER(0, NULL)
+			GEN_MLME_EXT_HANDLER(sizeof(struct addBaReq_parm),
+					     add_ba_hdl)
+				GEN_MLME_EXT_HANDLER(sizeof(struct set_ch_parm),
+						     set_ch_hdl) /* 46 */
+	GEN_MLME_EXT_HANDLER(0, NULL) GEN_MLME_EXT_HANDLER(0, NULL)
+		GEN_MLME_EXT_HANDLER(0, NULL)
+			GEN_MLME_EXT_HANDLER(0, NULL) /*50*/
+	GEN_MLME_EXT_HANDLER(0, NULL) GEN_MLME_EXT_HANDLER(0, NULL)
+		GEN_MLME_EXT_HANDLER(0, NULL) GEN_MLME_EXT_HANDLER(0, NULL)
+			GEN_MLME_EXT_HANDLER(sizeof(struct Tx_Beacon_param),
+					     tx_beacon_hdl) /*55*/
 
 	GEN_MLME_EXT_HANDLER(0, mlme_evt_hdl) /*56*/
 	GEN_MLME_EXT_HANDLER(0, rtw_drvextra_cmd_hdl) /*57*/
 
 	GEN_MLME_EXT_HANDLER(0, h2c_msg_hdl) /*58*/
-	GEN_MLME_EXT_HANDLER(sizeof(struct SetChannelPlan_param), set_chplan_hdl) /*59*/
+	GEN_MLME_EXT_HANDLER(sizeof(struct SetChannelPlan_param),
+			     set_chplan_hdl) /*59*/
 
-	GEN_MLME_EXT_HANDLER(sizeof(struct SetChannelSwitch_param), set_csa_hdl) /*60*/
+	GEN_MLME_EXT_HANDLER(sizeof(struct SetChannelSwitch_param),
+			     set_csa_hdl) /*60*/
 	GEN_MLME_EXT_HANDLER(sizeof(struct TDLSoption_param), tdls_hdl) /*61*/
 	GEN_MLME_EXT_HANDLER(0, chk_bmc_sleepq_hdl) /*62*/
-	GEN_MLME_EXT_HANDLER(sizeof(struct RunInThread_param), run_in_thread_hdl) /*63*/
+	GEN_MLME_EXT_HANDLER(sizeof(struct RunInThread_param),
+			     run_in_thread_hdl) /*63*/
 };
 
 /*
@@ -159,7 +170,7 @@ static struct cmd_hdl wlancmds[] = {
  * No irqsave is necessary.
  */
 
-int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
+int rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 {
 	init_completion(&pcmdpriv->cmd_queue_comp);
 	init_completion(&pcmdpriv->terminate_cmdthread_comp);
@@ -171,11 +182,13 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 
 	pcmdpriv->cmd_seq = 1;
 
-	pcmdpriv->cmd_allocated_buf = kzalloc(MAX_CMDSZ + CMDBUFF_ALIGN_SZ, GFP_ATOMIC);
+	pcmdpriv->cmd_allocated_buf =
+		kzalloc(MAX_CMDSZ + CMDBUFF_ALIGN_SZ, GFP_ATOMIC);
 	if (!pcmdpriv->cmd_allocated_buf)
 		return -ENOMEM;
 
-	pcmdpriv->cmd_buf = PTR_ALIGN(pcmdpriv->cmd_allocated_buf, CMDBUFF_ALIGN_SZ);
+	pcmdpriv->cmd_buf =
+		PTR_ALIGN(pcmdpriv->cmd_allocated_buf, CMDBUFF_ALIGN_SZ);
 
 	pcmdpriv->rsp_allocated_buf = kzalloc(MAX_RSPSZ + 4, GFP_ATOMIC);
 	if (!pcmdpriv->rsp_allocated_buf) {
@@ -183,7 +196,8 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 		return -ENOMEM;
 	}
 
-	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 - ((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
+	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 -
+			    ((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
 
 	pcmdpriv->cmd_issued_cnt = 0;
 	pcmdpriv->cmd_done_cnt = 0;
@@ -210,7 +224,7 @@ int rtw_init_evt_priv(struct evt_priv *pevtpriv)
 	return 0;
 }
 
-void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
+void _rtw_free_evt_priv(struct evt_priv *pevtpriv)
 {
 	_cancel_workitem_sync(&pevtpriv->c2h_wk);
 	while (pevtpriv->c2h_wk_alive)
@@ -225,7 +239,7 @@ void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 	kfree(pevtpriv->c2h_queue);
 }
 
-void _rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
+void _rtw_free_cmd_priv(struct cmd_priv *pcmdpriv)
 {
 	if (pcmdpriv) {
 		kfree(pcmdpriv->cmd_allocated_buf);
@@ -265,7 +279,7 @@ int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj)
 	return _SUCCESS;
 }
 
-struct	cmd_obj	*_rtw_dequeue_cmd(struct __queue *queue)
+struct cmd_obj *_rtw_dequeue_cmd(struct __queue *queue)
 {
 	unsigned long irqL;
 	struct cmd_obj *obj;
@@ -275,7 +289,8 @@ struct	cmd_obj	*_rtw_dequeue_cmd(struct __queue *queue)
 	if (list_empty(&queue->queue)) {
 		obj = NULL;
 	} else {
-		obj = container_of(get_next(&queue->queue), struct cmd_obj, list);
+		obj = container_of(get_next(&queue->queue), struct cmd_obj,
+				   list);
 		list_del_init(&obj->list);
 	}
 
@@ -285,12 +300,12 @@ struct	cmd_obj	*_rtw_dequeue_cmd(struct __queue *queue)
 	return obj;
 }
 
-void rtw_free_evt_priv(struct	evt_priv *pevtpriv)
+void rtw_free_evt_priv(struct evt_priv *pevtpriv)
 {
 	_rtw_free_evt_priv(pevtpriv);
 }
 
-void rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
+void rtw_free_cmd_priv(struct cmd_priv *pcmdpriv)
 {
 	_rtw_free_cmd_priv(pcmdpriv);
 }
@@ -298,13 +313,15 @@ void rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
 int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj);
 int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
 {
-	u8 bAllow = false; /* set to true to allow enqueuing cmd when hw_init_completed is false */
+	u8 bAllow =
+		false; /* set to true to allow enqueuing cmd when hw_init_completed is false */
 
 	if (cmd_obj->cmdcode == GEN_CMD_CODE(_SetChannelPlan))
 		bAllow = true;
 
 	if ((!pcmdpriv->padapter->hw_init_completed && !bAllow) ||
-	    !atomic_read(&pcmdpriv->cmdthd_running))	/* com_thread not running */
+	    !atomic_read(
+		    &pcmdpriv->cmdthd_running)) /* com_thread not running */
 		return _FAIL;
 
 	return _SUCCESS;
@@ -335,7 +352,7 @@ int rtw_enqueue_cmd(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
 	return res;
 }
 
-struct	cmd_obj	*rtw_dequeue_cmd(struct cmd_priv *pcmdpriv)
+struct cmd_obj *rtw_dequeue_cmd(struct cmd_priv *pcmdpriv)
 {
 	return _rtw_dequeue_cmd(&pcmdpriv->cmd_queue);
 }
@@ -363,7 +380,7 @@ void rtw_stop_cmd_thread(struct adapter *adapter)
 {
 	if (adapter->cmdThread &&
 	    atomic_read(&adapter->cmdpriv.cmdthd_running) &&
-		adapter->cmdpriv.stop_req == 0) {
+	    adapter->cmdpriv.stop_req == 0) {
 		adapter->cmdpriv.stop_req = 1;
 		complete(&adapter->cmdpriv.cmd_queue_comp);
 		wait_for_completion(&adapter->cmdpriv.terminate_cmdthread_comp);
@@ -390,26 +407,29 @@ int rtw_cmd_thread(void *context)
 	complete(&pcmdpriv->terminate_cmdthread_comp);
 
 	while (1) {
-		if (wait_for_completion_interruptible(&pcmdpriv->cmd_queue_comp)) {
-			netdev_dbg(padapter->pnetdev,
-				   FUNC_ADPT_FMT " wait_for_completion_interruptible(&pcmdpriv->cmd_queue_comp) return != 0, break\n",
-				   FUNC_ADPT_ARG(padapter));
+		if (wait_for_completion_interruptible(
+			    &pcmdpriv->cmd_queue_comp)) {
+			netdev_dbg(
+				padapter->pnetdev,
+				FUNC_ADPT_FMT
+				" wait_for_completion_interruptible(&pcmdpriv->cmd_queue_comp) return != 0, break\n",
+				FUNC_ADPT_ARG(padapter));
 			break;
 		}
 
 		if (padapter->bDriverStopped || padapter->bSurpriseRemoved) {
-			netdev_dbg(padapter->pnetdev,
-				   "%s: DriverStopped(%d) SurpriseRemoved(%d) break at line %d\n",
-				   __func__, padapter->bDriverStopped,
-				   padapter->bSurpriseRemoved, __LINE__);
+			netdev_dbg(
+				padapter->pnetdev,
+				"%s: DriverStopped(%d) SurpriseRemoved(%d) break at line %d\n",
+				__func__, padapter->bDriverStopped,
+				padapter->bSurpriseRemoved, __LINE__);
 			break;
 		}
 
 		if (pcmdpriv->stop_req) {
 			netdev_dbg(padapter->pnetdev,
 				   FUNC_ADPT_FMT " stop_req:%u, break\n",
-				   FUNC_ADPT_ARG(padapter),
-				   pcmdpriv->stop_req);
+				   FUNC_ADPT_ARG(padapter), pcmdpriv->stop_req);
 			break;
 		}
 
@@ -421,10 +441,11 @@ int rtw_cmd_thread(void *context)
 
 _next:
 		if (padapter->bDriverStopped || padapter->bSurpriseRemoved) {
-			netdev_dbg(padapter->pnetdev,
-				   "%s: DriverStopped(%d) SurpriseRemoved(%d) break at line %d\n",
-				   __func__, padapter->bDriverStopped,
-				   padapter->bSurpriseRemoved, __LINE__);
+			netdev_dbg(
+				padapter->pnetdev,
+				"%s: DriverStopped(%d) SurpriseRemoved(%d) break at line %d\n",
+				__func__, padapter->bDriverStopped,
+				padapter->bSurpriseRemoved, __LINE__);
 			break;
 		}
 
@@ -462,7 +483,8 @@ int rtw_cmd_thread(void *context)
 
 post_process:
 
-		if (mutex_lock_interruptible(&pcmd->padapter->cmdpriv.sctx_mutex) == 0) {
+		if (mutex_lock_interruptible(
+			    &pcmd->padapter->cmdpriv.sctx_mutex) == 0) {
 			if (pcmd->sctx) {
 				netdev_dbg(padapter->pnetdev,
 					   FUNC_ADPT_FMT " pcmd->sctx\n",
@@ -471,19 +493,24 @@ int rtw_cmd_thread(void *context)
 				if (pcmd->res == H2C_SUCCESS)
 					rtw_sctx_done(&pcmd->sctx);
 				else
-					rtw_sctx_done_err(&pcmd->sctx, RTW_SCTX_DONE_CMD_ERROR);
+					rtw_sctx_done_err(
+						&pcmd->sctx,
+						RTW_SCTX_DONE_CMD_ERROR);
 			}
 			mutex_unlock(&pcmd->padapter->cmdpriv.sctx_mutex);
 		}
 
 		/* call callback function for post-processed */
 		if (pcmd->cmdcode < ARRAY_SIZE(rtw_cmd_callback)) {
-			pcmd_callback = rtw_cmd_callback[pcmd->cmdcode].callback;
+			pcmd_callback =
+				rtw_cmd_callback[pcmd->cmdcode].callback;
 			if (!pcmd_callback) {
 				rtw_free_cmd_obj(pcmd);
 			} else {
 				/* todo: !!! fill rsp_buf to pcmd->rsp if (pcmd->rsp!= NULL) */
-				pcmd_callback(pcmd->padapter, pcmd);/* need consider that free cmd_obj in rtw_cmd_callback */
+				pcmd_callback(
+					pcmd->padapter,
+					pcmd); /* need consider that free cmd_obj in rtw_cmd_callback */
 			}
 		} else {
 			rtw_free_cmd_obj(pcmd);
@@ -521,8 +548,9 @@ int rtw_cmd_thread(void *context)
  *	MUST TAKE CARE THAT BEFORE CALLING THIS FUNC, YOU SHOULD HAVE LOCKED pmlmepriv->lock
  */
 
-u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid, int ssid_num,
-		      struct rtw_ieee80211_channel *ch, int ch_num)
+u8 rtw_sitesurvey_cmd(struct adapter *padapter, struct ndis_802_11_ssid *ssid,
+		      int ssid_num, struct rtw_ieee80211_channel *ch,
+		      int ch_num)
 {
 	u8 res = _FAIL;
 	struct cmd_obj *ph2c;
@@ -545,7 +573,8 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 
 	rtw_free_network_queue(padapter, false);
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, psurveyPara, GEN_CMD_CODE(_SiteSurvey));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, psurveyPara,
+				   GEN_CMD_CODE(_SiteSurvey));
 
 	/* psurveyPara->bsslimit = 48; */
 	psurveyPara->scan_mode = pmlmepriv->scan_mode;
@@ -556,7 +585,8 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 
 		for (i = 0; i < ssid_num && i < RTW_SSID_SCAN_AMOUNT; i++) {
 			if (ssid[i].ssid_length) {
-				memcpy(&psurveyPara->ssid[i], &ssid[i], sizeof(struct ndis_802_11_ssid));
+				memcpy(&psurveyPara->ssid[i], &ssid[i],
+				       sizeof(struct ndis_802_11_ssid));
 				psurveyPara->ssid_num++;
 			}
 		}
@@ -567,8 +597,10 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 		int i;
 
 		for (i = 0; i < ch_num && i < RTW_CHANNEL_SCAN_AMOUNT; i++) {
-			if (ch[i].hw_value && !(ch[i].flags & RTW_IEEE80211_CHAN_DISABLED)) {
-				memcpy(&psurveyPara->ch[i], &ch[i], sizeof(struct rtw_ieee80211_channel));
+			if (ch[i].hw_value &&
+			    !(ch[i].flags & RTW_IEEE80211_CHAN_DISABLED)) {
+				memcpy(&psurveyPara->ch[i], &ch[i],
+				       sizeof(struct rtw_ieee80211_channel));
 				psurveyPara->ch_num++;
 			}
 		}
@@ -587,18 +619,20 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 	return res;
 }
 
-void rtw_getbbrfreg_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
+void rtw_getbbrfreg_cmdrsp_callback(struct adapter *padapter,
+				    struct cmd_obj *pcmd)
 {
 	/* rtw_free_cmd_obj(pcmd); */
 	kfree(pcmd->parmbuf);
 	kfree(pcmd);
 }
 
-u8 rtw_createbss_cmd(struct adapter  *padapter)
+u8 rtw_createbss_cmd(struct adapter *padapter)
 {
 	struct cmd_obj *pcmd;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
-	struct wlan_bssid_ex *pdev_network = &padapter->registrypriv.dev_network;
+	struct wlan_bssid_ex *pdev_network =
+		&padapter->registrypriv.dev_network;
 	u8 res = _SUCCESS;
 
 	pcmd = kzalloc_obj(*pcmd, GFP_ATOMIC);
@@ -610,7 +644,8 @@ u8 rtw_createbss_cmd(struct adapter  *padapter)
 	INIT_LIST_HEAD(&pcmd->list);
 	pcmd->cmdcode = _CreateBss_CMD_;
 	pcmd->parmbuf = (unsigned char *)pdev_network;
-	pcmd->cmdsz = get_wlan_bssid_ex_sz((struct wlan_bssid_ex *)pdev_network);
+	pcmd->cmdsz =
+		get_wlan_bssid_ex_sz((struct wlan_bssid_ex *)pdev_network);
 	pcmd->rsp = NULL;
 	pcmd->rspsz = 0;
 
@@ -622,10 +657,10 @@ u8 rtw_createbss_cmd(struct adapter  *padapter)
 	return res;
 }
 
-int rtw_startbss_cmd(struct adapter  *padapter, int flags)
+int rtw_startbss_cmd(struct adapter *padapter, int flags)
 {
 	struct cmd_obj *pcmd;
-	struct cmd_priv  *pcmdpriv = &padapter->cmdpriv;
+	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	struct submit_ctx sctx;
 	int res = _SUCCESS;
 
@@ -643,7 +678,7 @@ int rtw_startbss_cmd(struct adapter  *padapter, int flags)
 		INIT_LIST_HEAD(&pcmd->list);
 		pcmd->cmdcode = GEN_CMD_CODE(_CreateBss);
 		pcmd->parmbuf = NULL;
-		pcmd->cmdsz =  0;
+		pcmd->cmdsz = 0;
 		pcmd->rsp = NULL;
 		pcmd->rspsz = 0;
 
@@ -656,7 +691,8 @@ int rtw_startbss_cmd(struct adapter  *padapter, int flags)
 
 		if (res == _SUCCESS && (flags & RTW_CMDF_WAIT_ACK)) {
 			rtw_sctx_wait(&sctx);
-			if (mutex_lock_interruptible(&pcmdpriv->sctx_mutex) == 0) {
+			if (mutex_lock_interruptible(&pcmdpriv->sctx_mutex) ==
+			    0) {
 				if (sctx.status == RTW_SCTX_SUBMITTED)
 					pcmd->sctx = NULL;
 				mutex_unlock(&pcmdpriv->sctx_mutex);
@@ -668,10 +704,10 @@ int rtw_startbss_cmd(struct adapter  *padapter, int flags)
 	return res;
 }
 
-u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
+u8 rtw_joinbss_cmd(struct adapter *padapter, struct wlan_network *pnetwork)
 {
 	u8 res = _SUCCESS;
-	uint	t_len = 0;
+	uint t_len = 0;
 	struct wlan_bssid_ex *psecnetwork;
 	struct cmd_obj *pcmd;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
@@ -680,7 +716,8 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
 	struct ht_priv *phtpriv = &pmlmepriv->htpriv;
-	enum ndis_802_11_network_infrastructure ndis_network_mode = pnetwork->network.infrastructure_mode;
+	enum ndis_802_11_network_infrastructure ndis_network_mode =
+		pnetwork->network.infrastructure_mode;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u32 tmp_len;
@@ -695,7 +732,8 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	t_len = sizeof(struct wlan_bssid_ex);
 
 	/* for hidden ap to set fw_state here */
-	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE | WIFI_ADHOC_STATE) != true) {
+	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE | WIFI_ADHOC_STATE) !=
+	    true) {
 		switch (ndis_network_mode) {
 		case Ndis802_11IBSS:
 			set_fwstate(pmlmepriv, WIFI_ADHOC_STATE);
@@ -716,14 +754,18 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 
 	memset(psecnetwork, 0, t_len);
 
-	memcpy(psecnetwork, &pnetwork->network, get_wlan_bssid_ex_sz(&pnetwork->network));
+	memcpy(psecnetwork, &pnetwork->network,
+	       get_wlan_bssid_ex_sz(&pnetwork->network));
 
-	psecuritypriv->authenticator_ie[0] = (unsigned char)psecnetwork->ie_length;
+	psecuritypriv->authenticator_ie[0] =
+		(unsigned char)psecnetwork->ie_length;
 
 	if ((psecnetwork->ie_length - 12) < (256 - 1))
-		memcpy(&psecuritypriv->authenticator_ie[1], &psecnetwork->ies[12], psecnetwork->ie_length - 12);
+		memcpy(&psecuritypriv->authenticator_ie[1],
+		       &psecnetwork->ies[12], psecnetwork->ie_length - 12);
 	else
-		memcpy(&psecuritypriv->authenticator_ie[1], &psecnetwork->ies[12], (256 - 1));
+		memcpy(&psecuritypriv->authenticator_ie[1],
+		       &psecnetwork->ies[12], (256 - 1));
 
 	psecnetwork->ie_length = 0;
 	/*  Added by Albert 2009/02/18 */
@@ -732,25 +774,35 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	/*  the driver just has the bssid information for PMKIDList searching. */
 
 	if (!pmlmepriv->assoc_by_bssid)
-		memcpy(&pmlmepriv->assoc_bssid[0], &pnetwork->network.mac_address[0], ETH_ALEN);
+		memcpy(&pmlmepriv->assoc_bssid[0],
+		       &pnetwork->network.mac_address[0], ETH_ALEN);
 
-	psecnetwork->ie_length = rtw_restruct_sec_ie(padapter, &pnetwork->network.ies[0], &psecnetwork->ies[0], pnetwork->network.ie_length);
+	psecnetwork->ie_length = rtw_restruct_sec_ie(
+		padapter, &pnetwork->network.ies[0], &psecnetwork->ies[0],
+		pnetwork->network.ie_length);
 
 	pqospriv->qos_option = 0;
 
 	if (pregistrypriv->wmm_enable) {
-		tmp_len = rtw_restruct_wmm_ie(padapter, &pnetwork->network.ies[0], &psecnetwork->ies[0], pnetwork->network.ie_length, psecnetwork->ie_length);
+		tmp_len = rtw_restruct_wmm_ie(padapter,
+					      &pnetwork->network.ies[0],
+					      &psecnetwork->ies[0],
+					      pnetwork->network.ie_length,
+					      psecnetwork->ie_length);
 
 		if (psecnetwork->ie_length != tmp_len) {
 			psecnetwork->ie_length = tmp_len;
-			pqospriv->qos_option = 1; /* There is WMM IE in this corresp. beacon */
+			pqospriv->qos_option =
+				1; /* There is WMM IE in this corresp. beacon */
 		} else {
-			pqospriv->qos_option = 0;/* There is no WMM IE in this corresp. beacon */
+			pqospriv->qos_option =
+				0; /* There is no WMM IE in this corresp. beacon */
 		}
 	}
 
 	phtpriv->ht_option = false;
-	ptmp = rtw_get_ie(&pnetwork->network.ies[12], WLAN_EID_HT_CAPABILITY, &tmp_len, pnetwork->network.ie_length - 12);
+	ptmp = rtw_get_ie(&pnetwork->network.ies[12], WLAN_EID_HT_CAPABILITY,
+			  &tmp_len, pnetwork->network.ie_length - 12);
 	if (pregistrypriv->ht_enable && ptmp && tmp_len > 0) {
 		/* Added by Albert 2010/06/23 */
 		/* For the WEP mode, we will use the bg mode to do the connection to avoid some IOT issue. */
@@ -760,23 +812,30 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 		    (padapter->securitypriv.dot11PrivacyAlgrthm != _TKIP_)) {
 			rtw_ht_use_default_setting(padapter);
 
-			rtw_build_wmm_ie_ht(padapter, &psecnetwork->ies[12], &psecnetwork->ie_length);
+			rtw_build_wmm_ie_ht(padapter, &psecnetwork->ies[12],
+					    &psecnetwork->ie_length);
 
 			/* rtw_restructure_ht_ie */
-			rtw_restructure_ht_ie(padapter, &pnetwork->network.ies[12], &psecnetwork->ies[0],
-					      pnetwork->network.ie_length - 12, &psecnetwork->ie_length,
-					      pnetwork->network.configuration.ds_config);
+			rtw_restructure_ht_ie(
+				padapter, &pnetwork->network.ies[12],
+				&psecnetwork->ies[0],
+				pnetwork->network.ie_length - 12,
+				&psecnetwork->ie_length,
+				pnetwork->network.configuration.ds_config);
 		}
 	}
 
-	rtw_append_exented_cap(padapter, &psecnetwork->ies[0], &psecnetwork->ie_length);
+	rtw_append_exented_cap(padapter, &psecnetwork->ies[0],
+			       &psecnetwork->ie_length);
 
-	pmlmeinfo->assoc_AP_vendor = check_assoc_AP(pnetwork->network.ies, pnetwork->network.ie_length);
+	pmlmeinfo->assoc_AP_vendor = check_assoc_AP(
+		pnetwork->network.ies, pnetwork->network.ie_length);
 
-	pcmd->cmdsz = get_wlan_bssid_ex_sz(psecnetwork);/* get cmdsz before endian conversion */
+	pcmd->cmdsz = get_wlan_bssid_ex_sz(
+		psecnetwork); /* get cmdsz before endian conversion */
 
 	INIT_LIST_HEAD(&pcmd->list);
-	pcmd->cmdcode = _JoinBss_CMD_;/* GEN_CMD_CODE(_JoinBss) */
+	pcmd->cmdcode = _JoinBss_CMD_; /* GEN_CMD_CODE(_JoinBss) */
 	pcmd->parmbuf = (unsigned char *)psecnetwork;
 	pcmd->rsp = NULL;
 	pcmd->rspsz = 0;
@@ -787,7 +846,8 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	return res;
 }
 
-u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueue) /* for sta_mode */
+u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms,
+		    bool enqueue) /* for sta_mode */
 {
 	struct cmd_obj *cmdobj = NULL;
 	struct disconnect_parm *param = NULL;
@@ -823,12 +883,14 @@ u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueu
 	return res;
 }
 
-u8 rtw_setopmode_cmd(struct adapter  *padapter, enum ndis_802_11_network_infrastructure networktype, bool enqueue)
+u8 rtw_setopmode_cmd(struct adapter *padapter,
+		     enum ndis_802_11_network_infrastructure networktype,
+		     bool enqueue)
 {
-	struct	cmd_obj *ph2c;
-	struct	setopmode_parm *psetop;
+	struct cmd_obj *ph2c;
+	struct setopmode_parm *psetop;
 
-	struct	cmd_priv   *pcmdpriv = &padapter->cmdpriv;
+	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
 	psetop = kzalloc_obj(*psetop);
@@ -856,7 +918,8 @@ u8 rtw_setopmode_cmd(struct adapter  *padapter, enum ndis_802_11_network_infrast
 	return res;
 }
 
-u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_key, bool enqueue)
+u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta,
+		     u8 unicast_key, bool enqueue)
 {
 	struct cmd_obj *ph2c;
 	struct set_stakey_parm *psetstakey_para;
@@ -875,14 +938,21 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 	memcpy(psetstakey_para->addr, sta->hwaddr, ETH_ALEN);
 
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE))
-		psetstakey_para->algorithm = (unsigned char)psecuritypriv->dot11PrivacyAlgrthm;
+		psetstakey_para->algorithm =
+			(unsigned char)psecuritypriv->dot11PrivacyAlgrthm;
 	else
-		GET_ENCRY_ALGO(psecuritypriv, sta, psetstakey_para->algorithm, false);
+		GET_ENCRY_ALGO(psecuritypriv, sta, psetstakey_para->algorithm,
+			       false);
 
 	if (unicast_key)
 		memcpy(&psetstakey_para->key, &sta->dot118021x_UncstKey, 16);
 	else
-		memcpy(&psetstakey_para->key, &psecuritypriv->dot118021XGrpKey[psecuritypriv->dot118021XGrpKeyid].skey, 16);
+		memcpy(&psetstakey_para->key,
+		       &psecuritypriv
+				->dot118021XGrpKey[psecuritypriv
+							   ->dot118021XGrpKeyid]
+				.skey,
+		       16);
 
 	/* jeff: set this because at least sw key is ready */
 	padapter->securitypriv.busetkipkey = true;
@@ -903,7 +973,8 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 			goto exit;
 		}
 
-		init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, _SetStaKey_CMD_);
+		init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para,
+					   _SetStaKey_CMD_);
 		ph2c->rsp = (u8 *)psetstakey_rsp;
 		ph2c->rspsz = sizeof(struct set_stakey_rsp);
 		res = rtw_enqueue_cmd(pcmdpriv, ph2c);
@@ -915,7 +986,8 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 	return res;
 }
 
-u8 rtw_clearstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 enqueue)
+u8 rtw_clearstakey_cmd(struct adapter *padapter, struct sta_info *sta,
+		       u8 enqueue)
 {
 	struct cmd_obj *ph2c;
 	struct set_stakey_parm *psetstakey_para;
@@ -925,7 +997,8 @@ u8 rtw_clearstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 enqueu
 	u8 res = _SUCCESS;
 
 	if (!enqueue) {
-		while ((cam_id = rtw_camid_search(padapter, sta->hwaddr, -1)) >= 0) {
+		while ((cam_id = rtw_camid_search(padapter, sta->hwaddr, -1)) >=
+		       0) {
 			netdev_dbg(padapter->pnetdev,
 				   "clear key for addr:%pM, camid:%d\n",
 				   sta->hwaddr, cam_id);
@@ -954,7 +1027,8 @@ u8 rtw_clearstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 enqueu
 			goto exit;
 		}
 
-		init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, _SetStaKey_CMD_);
+		init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para,
+					   _SetStaKey_CMD_);
 		ph2c->rsp = (u8 *)psetstakey_rsp;
 		ph2c->rspsz = sizeof(struct set_stakey_rsp);
 
@@ -992,7 +1066,8 @@ u8 rtw_addbareq_cmd(struct adapter *padapter, u8 tid, u8 *addr)
 	paddbareq_parm->tid = tid;
 	memcpy(paddbareq_parm->addr, addr, ETH_ALEN);
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, paddbareq_parm, GEN_CMD_CODE(_AddBAReq));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, paddbareq_parm,
+				   GEN_CMD_CODE(_AddBAReq));
 
 	/* rtw_enqueue_cmd(pcmdpriv, ph2c); */
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
@@ -1005,7 +1080,7 @@ u8 rtw_addbareq_cmd(struct adapter *padapter, u8 tid, u8 *addr)
 u8 rtw_reset_securitypriv_cmd(struct adapter *padapter)
 {
 	struct cmd_obj *ph2c;
-	struct drvextra_cmd_parm  *pdrvextra_cmd_parm;
+	struct drvextra_cmd_parm *pdrvextra_cmd_parm;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
@@ -1027,7 +1102,8 @@ u8 rtw_reset_securitypriv_cmd(struct adapter *padapter)
 	pdrvextra_cmd_parm->size = 0;
 	pdrvextra_cmd_parm->pbuf = NULL;
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm,
+				   GEN_CMD_CODE(_Set_Drv_Extra));
 
 	/* rtw_enqueue_cmd(pcmdpriv, ph2c); */
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
@@ -1038,7 +1114,7 @@ u8 rtw_reset_securitypriv_cmd(struct adapter *padapter)
 u8 rtw_free_assoc_resources_cmd(struct adapter *padapter)
 {
 	struct cmd_obj *ph2c;
-	struct drvextra_cmd_parm  *pdrvextra_cmd_parm;
+	struct drvextra_cmd_parm *pdrvextra_cmd_parm;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
@@ -1060,7 +1136,8 @@ u8 rtw_free_assoc_resources_cmd(struct adapter *padapter)
 	pdrvextra_cmd_parm->size = 0;
 	pdrvextra_cmd_parm->pbuf = NULL;
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm,
+				   GEN_CMD_CODE(_Set_Drv_Extra));
 
 	/* rtw_enqueue_cmd(pcmdpriv, ph2c); */
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
@@ -1071,7 +1148,7 @@ u8 rtw_free_assoc_resources_cmd(struct adapter *padapter)
 u8 rtw_dynamic_chk_wk_cmd(struct adapter *padapter)
 {
 	struct cmd_obj *ph2c;
-	struct drvextra_cmd_parm  *pdrvextra_cmd_parm;
+	struct drvextra_cmd_parm *pdrvextra_cmd_parm;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
@@ -1093,7 +1170,8 @@ u8 rtw_dynamic_chk_wk_cmd(struct adapter *padapter)
 	pdrvextra_cmd_parm->type = 0;
 	pdrvextra_cmd_parm->size = 0;
 	pdrvextra_cmd_parm->pbuf = NULL;
-	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm,
+				   GEN_CMD_CODE(_Set_Drv_Extra));
 
 	/* rtw_enqueue_cmd(pcmdpriv, ph2c); */
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
@@ -1116,13 +1194,23 @@ static void collect_traffic_statistics(struct adapter *padapter)
 	pdvobjpriv->traffic_stat.rx_drop = padapter->recvpriv.rx_drop;
 
 	/*  Calculate throughput in last interval */
-	pdvobjpriv->traffic_stat.cur_tx_bytes = pdvobjpriv->traffic_stat.tx_bytes - pdvobjpriv->traffic_stat.last_tx_bytes;
-	pdvobjpriv->traffic_stat.cur_rx_bytes = pdvobjpriv->traffic_stat.rx_bytes - pdvobjpriv->traffic_stat.last_rx_bytes;
-	pdvobjpriv->traffic_stat.last_tx_bytes = pdvobjpriv->traffic_stat.tx_bytes;
-	pdvobjpriv->traffic_stat.last_rx_bytes = pdvobjpriv->traffic_stat.rx_bytes;
-
-	pdvobjpriv->traffic_stat.cur_tx_tp = (u32)(pdvobjpriv->traffic_stat.cur_tx_bytes * 8 / 2 / 1024 / 1024);
-	pdvobjpriv->traffic_stat.cur_rx_tp = (u32)(pdvobjpriv->traffic_stat.cur_rx_bytes * 8 / 2 / 1024 / 1024);
+	pdvobjpriv->traffic_stat.cur_tx_bytes =
+		pdvobjpriv->traffic_stat.tx_bytes -
+		pdvobjpriv->traffic_stat.last_tx_bytes;
+	pdvobjpriv->traffic_stat.cur_rx_bytes =
+		pdvobjpriv->traffic_stat.rx_bytes -
+		pdvobjpriv->traffic_stat.last_rx_bytes;
+	pdvobjpriv->traffic_stat.last_tx_bytes =
+		pdvobjpriv->traffic_stat.tx_bytes;
+	pdvobjpriv->traffic_stat.last_rx_bytes =
+		pdvobjpriv->traffic_stat.rx_bytes;
+
+	pdvobjpriv->traffic_stat.cur_tx_tp =
+		(u32)(pdvobjpriv->traffic_stat.cur_tx_bytes * 8 / 2 / 1024 /
+		      1024);
+	pdvobjpriv->traffic_stat.cur_rx_tp =
+		(u32)(pdvobjpriv->traffic_stat.cur_rx_bytes * 8 / 2 / 1024 /
+		      1024);
 }
 
 u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
@@ -1132,7 +1220,8 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 	u16 BusyThresholdLow = 10;
 	u16 BusyThreshold = BusyThresholdHigh;
 	u8 bBusyTraffic = false, bTxBusyTraffic = false, bRxBusyTraffic = false;
-	u8 bHigherBusyTraffic = false, bHigherBusyRxTraffic = false, bHigherBusyTxTraffic = false;
+	u8 bHigherBusyTraffic = false, bHigherBusyRxTraffic = false,
+	   bHigherBusyTxTraffic = false;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	collect_traffic_statistics(padapter);
@@ -1141,7 +1230,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 	/*  Determine if our traffic is busy now */
 	/*  */
 	if ((check_fwstate(pmlmepriv, _FW_LINKED))
-		/*&& !MgntInitAdapterInProgress(pMgntInfo)*/) {
+	    /*&& !MgntInitAdapterInProgress(pMgntInfo)*/) {
 		/*  if we raise bBusyTraffic in last watchdog, using lower threshold. */
 		if (pmlmepriv->LinkDetectInfo.bBusyTraffic)
 			BusyThreshold = BusyThresholdLow;
@@ -1150,7 +1239,8 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 		    pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > BusyThreshold) {
 			bBusyTraffic = true;
 
-			if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > pmlmepriv->LinkDetectInfo.NumTxOkInPeriod)
+			if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod >
+			    pmlmepriv->LinkDetectInfo.NumTxOkInPeriod)
 				bRxBusyTraffic = true;
 			else
 				bTxBusyTraffic = true;
@@ -1161,33 +1251,45 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 		    pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > 4000) {
 			bHigherBusyTraffic = true;
 
-			if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > pmlmepriv->LinkDetectInfo.NumTxOkInPeriod)
+			if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod >
+			    pmlmepriv->LinkDetectInfo.NumTxOkInPeriod)
 				bHigherBusyRxTraffic = true;
 			else
 				bHigherBusyTxTraffic = true;
 		}
 
 		/*  check traffic for  powersaving. */
-		if (((pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod + pmlmepriv->LinkDetectInfo.NumTxOkInPeriod) > 8) ||
+		if (((pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod +
+		      pmlmepriv->LinkDetectInfo.NumTxOkInPeriod) > 8) ||
 		    (pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod > 2)) {
 			bEnterPS = false;
 
 			if (bBusyTraffic) {
-				if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount <= 4)
-					pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 4;
-
-				pmlmepriv->LinkDetectInfo.TrafficTransitionCount++;
-
-				if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount > 30/*TrafficTransitionLevel*/)
-					pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 30;
+				if (pmlmepriv->LinkDetectInfo
+					    .TrafficTransitionCount <= 4)
+					pmlmepriv->LinkDetectInfo
+						.TrafficTransitionCount = 4;
+
+				pmlmepriv->LinkDetectInfo
+					.TrafficTransitionCount++;
+
+				if (pmlmepriv->LinkDetectInfo
+					    .TrafficTransitionCount >
+				    30 /*TrafficTransitionLevel*/)
+					pmlmepriv->LinkDetectInfo
+						.TrafficTransitionCount = 30;
 			}
 		} else {
-			if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount >= 2)
-				pmlmepriv->LinkDetectInfo.TrafficTransitionCount -= 2;
+			if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount >=
+			    2)
+				pmlmepriv->LinkDetectInfo
+					.TrafficTransitionCount -= 2;
 			else
-				pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 0;
+				pmlmepriv->LinkDetectInfo
+					.TrafficTransitionCount = 0;
 
-			if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount == 0)
+			if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount ==
+			    0)
 				bEnterPS = true;
 		}
 
@@ -1199,7 +1301,8 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 			if (!from_timer)
 				LPS_Leave(padapter, "TRAFFIC_BUSY");
 			else
-				rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_TRAFFIC_BUSY, 1);
+				rtw_lps_ctrl_wk_cmd(padapter,
+						    LPS_CTRL_TRAFFIC_BUSY, 1);
 		}
 	} else {
 		struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
@@ -1279,17 +1382,19 @@ void lps_ctrl_wk_hdl(struct adapter *padapter, u8 lps_ctrl_type)
 		LPS_Leave(padapter, "LPS_CTRL_JOINBSS");
 		break;
 	case LPS_CTRL_CONNECT:
-		mstatus = 1;/* connect */
+		mstatus = 1; /* connect */
 		/*  Reset LPS Setting */
 		pwrpriv->LpsIdleCount = 0;
-		rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_JOINBSSRPT, (u8 *)(&mstatus));
+		rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_JOINBSSRPT,
+				  (u8 *)(&mstatus));
 		rtw_btcoex_MediaStatusNotify(padapter, mstatus);
 		break;
 	case LPS_CTRL_DISCONNECT:
-		mstatus = 0;/* disconnect */
+		mstatus = 0; /* disconnect */
 		rtw_btcoex_MediaStatusNotify(padapter, mstatus);
 		LPS_Leave(padapter, "LPS_CTRL_DISCONNECT");
-		rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_JOINBSSRPT, (u8 *)(&mstatus));
+		rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_JOINBSSRPT,
+				  (u8 *)(&mstatus));
 		break;
 	case LPS_CTRL_SPECIAL_PACKET:
 		pwrpriv->DelayLPSLastTimeStamp = jiffies;
@@ -1309,7 +1414,7 @@ void lps_ctrl_wk_hdl(struct adapter *padapter, u8 lps_ctrl_type)
 
 u8 rtw_lps_ctrl_wk_cmd(struct adapter *padapter, u8 lps_ctrl_type, u8 enqueue)
 {
-	struct cmd_obj	*ph2c;
+	struct cmd_obj *ph2c;
 	struct drvextra_cmd_parm *pdrvextra_cmd_parm;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	/* struct pwrctrl_priv *pwrctrlpriv = adapter_to_pwrctl(padapter); */
@@ -1322,8 +1427,8 @@ u8 rtw_lps_ctrl_wk_cmd(struct adapter *padapter, u8 lps_ctrl_type, u8 enqueue)
 			goto exit;
 		}
 
-		pdrvextra_cmd_parm = kzalloc_obj(*pdrvextra_cmd_parm,
-						 GFP_ATOMIC);
+		pdrvextra_cmd_parm =
+			kzalloc_obj(*pdrvextra_cmd_parm, GFP_ATOMIC);
 		if (!pdrvextra_cmd_parm) {
 			kfree(ph2c);
 			res = _FAIL;
@@ -1335,7 +1440,8 @@ u8 rtw_lps_ctrl_wk_cmd(struct adapter *padapter, u8 lps_ctrl_type, u8 enqueue)
 		pdrvextra_cmd_parm->size = 0;
 		pdrvextra_cmd_parm->pbuf = NULL;
 
-		init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+		init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm,
+					   GEN_CMD_CODE(_Set_Drv_Extra));
 
 		res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 	} else {
@@ -1353,8 +1459,8 @@ static void rtw_dm_in_lps_hdl(struct adapter *padapter)
 
 u8 rtw_dm_in_lps_wk_cmd(struct adapter *padapter)
 {
-	struct cmd_obj	*ph2c;
-	struct drvextra_cmd_parm	*pdrvextra_cmd_parm;
+	struct cmd_obj *ph2c;
+	struct drvextra_cmd_parm *pdrvextra_cmd_parm;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
@@ -1376,7 +1482,8 @@ u8 rtw_dm_in_lps_wk_cmd(struct adapter *padapter)
 	pdrvextra_cmd_parm->size = 0;
 	pdrvextra_cmd_parm->pbuf = NULL;
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm,
+				   GEN_CMD_CODE(_Set_Drv_Extra));
 
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 
@@ -1398,10 +1505,12 @@ static void rtw_lps_change_dtim_hdl(struct adapter *padapter, u8 dtim)
 
 	pwrpriv->dtim = dtim;
 
-	if (pwrpriv->fw_current_in_ps_mode && (pwrpriv->pwr_mode > PS_MODE_ACTIVE)) {
+	if (pwrpriv->fw_current_in_ps_mode &&
+	    (pwrpriv->pwr_mode > PS_MODE_ACTIVE)) {
 		u8 ps_mode = pwrpriv->pwr_mode;
 
-		rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_PWRMODE, (u8 *)(&ps_mode));
+		rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_PWRMODE,
+				  (u8 *)(&ps_mode));
 	}
 
 	mutex_unlock(&pwrpriv->lock);
@@ -1415,8 +1524,8 @@ static void rtw_dm_ra_mask_hdl(struct adapter *padapter, struct sta_info *psta)
 
 u8 rtw_dm_ra_mask_wk_cmd(struct adapter *padapter, u8 *psta)
 {
-	struct cmd_obj	*ph2c;
-	struct drvextra_cmd_parm	*pdrvextra_cmd_parm;
+	struct cmd_obj *ph2c;
+	struct drvextra_cmd_parm *pdrvextra_cmd_parm;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
@@ -1438,7 +1547,8 @@ u8 rtw_dm_ra_mask_wk_cmd(struct adapter *padapter, u8 *psta)
 	pdrvextra_cmd_parm->size = 0;
 	pdrvextra_cmd_parm->pbuf = psta;
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm,
+				   GEN_CMD_CODE(_Set_Drv_Extra));
 
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 
@@ -1449,8 +1559,8 @@ u8 rtw_dm_ra_mask_wk_cmd(struct adapter *padapter, u8 *psta)
 
 u8 rtw_ps_cmd(struct adapter *padapter)
 {
-	struct cmd_obj		*ppscmd;
-	struct drvextra_cmd_parm	*pdrvextra_cmd_parm;
+	struct cmd_obj *ppscmd;
+	struct drvextra_cmd_parm *pdrvextra_cmd_parm;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
@@ -1471,7 +1581,8 @@ u8 rtw_ps_cmd(struct adapter *padapter)
 	pdrvextra_cmd_parm->type = 0;
 	pdrvextra_cmd_parm->size = 0;
 	pdrvextra_cmd_parm->pbuf = NULL;
-	init_h2fwcmd_w_parm_no_rsp(ppscmd, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+	init_h2fwcmd_w_parm_no_rsp(ppscmd, pdrvextra_cmd_parm,
+				   GEN_CMD_CODE(_Set_Drv_Extra));
 
 	res = rtw_enqueue_cmd(pcmdpriv, ppscmd);
 
@@ -1510,8 +1621,9 @@ static void rtw_chk_hi_queue_hdl(struct adapter *padapter)
 			pstapriv->sta_dz_bitmap &= ~BIT(0);
 
 			if (update_tim)
-				update_beacon(padapter, WLAN_EID_TIM, NULL, true);
-		} else {/* re check again */
+				update_beacon(padapter, WLAN_EID_TIM, NULL,
+					      true);
+		} else { /* re check again */
 			rtw_chk_hi_queue_cmd(padapter);
 		}
 	}
@@ -1519,8 +1631,8 @@ static void rtw_chk_hi_queue_hdl(struct adapter *padapter)
 
 u8 rtw_chk_hi_queue_cmd(struct adapter *padapter)
 {
-	struct cmd_obj	*ph2c;
-	struct drvextra_cmd_parm	*pdrvextra_cmd_parm;
+	struct cmd_obj *ph2c;
+	struct drvextra_cmd_parm *pdrvextra_cmd_parm;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
@@ -1542,7 +1654,8 @@ u8 rtw_chk_hi_queue_cmd(struct adapter *padapter)
 	pdrvextra_cmd_parm->size = 0;
 	pdrvextra_cmd_parm->pbuf = NULL;
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm,
+				   GEN_CMD_CODE(_Set_Drv_Extra));
 
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 
@@ -1554,31 +1667,31 @@ struct btinfo {
 	u8 cid;
 	u8 len;
 
-	u8 bConnection:1;
-	u8 bSCOeSCO:1;
-	u8 bInQPage:1;
-	u8 bACLBusy:1;
-	u8 bSCOBusy:1;
-	u8 bHID:1;
-	u8 bA2DP:1;
-	u8 bFTP:1;
-
-	u8 retry_cnt:4;
-	u8 rsvd_34:1;
-	u8 rsvd_35:1;
-	u8 rsvd_36:1;
-	u8 rsvd_37:1;
+	u8 bConnection : 1;
+	u8 bSCOeSCO : 1;
+	u8 bInQPage : 1;
+	u8 bACLBusy : 1;
+	u8 bSCOBusy : 1;
+	u8 bHID : 1;
+	u8 bA2DP : 1;
+	u8 bFTP : 1;
+
+	u8 retry_cnt : 4;
+	u8 rsvd_34 : 1;
+	u8 rsvd_35 : 1;
+	u8 rsvd_36 : 1;
+	u8 rsvd_37 : 1;
 
 	u8 rssi;
 
-	u8 rsvd_50:1;
-	u8 rsvd_51:1;
-	u8 rsvd_52:1;
-	u8 rsvd_53:1;
-	u8 rsvd_54:1;
-	u8 rsvd_55:1;
-	u8 eSCO_SCO:1;
-	u8 Master_Slave:1;
+	u8 rsvd_50 : 1;
+	u8 rsvd_51 : 1;
+	u8 rsvd_52 : 1;
+	u8 rsvd_53 : 1;
+	u8 rsvd_54 : 1;
+	u8 rsvd_55 : 1;
+	u8 eSCO_SCO : 1;
+	u8 Master_Slave : 1;
 
 	u8 rsvd_6;
 	u8 rsvd_7;
@@ -1586,8 +1699,8 @@ struct btinfo {
 
 static void rtw_btinfo_hdl(struct adapter *adapter, u8 *buf, u16 buf_len)
 {
-	#define BTINFO_WIFI_FETCH 0x23
-	#define BTINFO_BT_AUTO_RPT 0x27
+#define BTINFO_WIFI_FETCH 0x23
+#define BTINFO_BT_AUTO_RPT 0x27
 	struct btinfo *info = (struct btinfo *)buf;
 	u8 cmd_idx;
 	u8 len;
@@ -1634,7 +1747,8 @@ u8 rtw_c2h_packet_wk_cmd(struct adapter *padapter, u8 *pbuf, u16 length)
 	pdrvextra_cmd_parm->size = length;
 	pdrvextra_cmd_parm->pbuf = pbuf;
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm,
+				   GEN_CMD_CODE(_Set_Drv_Extra));
 
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 
@@ -1666,10 +1780,11 @@ u8 rtw_c2h_wk_cmd(struct adapter *padapter, u8 *c2h_evt)
 
 	pdrvextra_cmd_parm->ec_id = C2H_WK_CID;
 	pdrvextra_cmd_parm->type = 0;
-	pdrvextra_cmd_parm->size =  c2h_evt ? 16 : 0;
+	pdrvextra_cmd_parm->size = c2h_evt ? 16 : 0;
 	pdrvextra_cmd_parm->pbuf = c2h_evt;
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm,
+				   GEN_CMD_CODE(_Set_Drv_Extra));
 
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 
@@ -1681,7 +1796,8 @@ u8 rtw_c2h_wk_cmd(struct adapter *padapter, u8 *c2h_evt)
 static void c2h_wk_callback(struct work_struct *work)
 {
 	struct evt_priv *evtpriv = container_of(work, struct evt_priv, c2h_wk);
-	struct adapter *adapter = container_of(evtpriv, struct adapter, evtpriv);
+	struct adapter *adapter =
+		container_of(evtpriv, struct adapter, evtpriv);
 	u8 *c2h_evt;
 	c2h_id_filter ccx_id_filter = rtw_hal_c2h_id_filter_ccx(adapter);
 
@@ -1696,7 +1812,8 @@ static void c2h_wk_callback(struct work_struct *work)
 			c2h_evt = kmalloc(16, GFP_ATOMIC);
 			if (c2h_evt) {
 				/* This C2H event is not read, read & clear now */
-				if (c2h_evt_read_88xx(adapter, c2h_evt) != _SUCCESS) {
+				if (c2h_evt_read_88xx(adapter, c2h_evt) !=
+				    _SUCCESS) {
 					kfree(c2h_evt);
 					continue;
 				}
@@ -1735,7 +1852,7 @@ u8 rtw_drvextra_cmd_hdl(struct adapter *padapter, unsigned char *pbuf)
 	pdrvextra_cmd = (struct drvextra_cmd_parm *)pbuf;
 
 	switch (pdrvextra_cmd->ec_id) {
-	case DYNAMIC_CHK_WK_CID:/* only  primary padapter go to this cmd, but execute dynamic_chk_wk_hdl() for two interfaces */
+	case DYNAMIC_CHK_WK_CID: /* only  primary padapter go to this cmd, but execute dynamic_chk_wk_hdl() for two interfaces */
 		dynamic_chk_wk_hdl(padapter);
 		break;
 	case POWER_SAVING_CTRL_WK_CID:
@@ -1761,13 +1878,17 @@ u8 rtw_drvextra_cmd_hdl(struct adapter *padapter, unsigned char *pbuf)
 		rtw_free_assoc_resources(padapter, 1);
 		break;
 	case C2H_WK_CID:
-		rtw_hal_set_hwreg_with_buf(padapter, HW_VAR_C2H_HANDLE, pdrvextra_cmd->pbuf, pdrvextra_cmd->size);
+		rtw_hal_set_hwreg_with_buf(padapter, HW_VAR_C2H_HANDLE,
+					   pdrvextra_cmd->pbuf,
+					   pdrvextra_cmd->size);
 		break;
 	case DM_RA_MSK_WK_CID:
-		rtw_dm_ra_mask_hdl(padapter, (struct sta_info *)pdrvextra_cmd->pbuf);
+		rtw_dm_ra_mask_hdl(padapter,
+				   (struct sta_info *)pdrvextra_cmd->pbuf);
 		break;
 	case BTINFO_WK_CID:
-		rtw_btinfo_hdl(padapter, pdrvextra_cmd->pbuf, pdrvextra_cmd->size);
+		rtw_btinfo_hdl(padapter, pdrvextra_cmd->pbuf,
+			       pdrvextra_cmd->size);
 		break;
 	default:
 		break;
@@ -1779,9 +1900,9 @@ u8 rtw_drvextra_cmd_hdl(struct adapter *padapter, unsigned char *pbuf)
 	return H2C_SUCCESS;
 }
 
-void rtw_survey_cmd_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
+void rtw_survey_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 {
-	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	if (pcmd->res != H2C_SUCCESS) {
 		/* TODO: cancel timer and do timeout handler directly... */
@@ -1792,9 +1913,9 @@ void rtw_survey_cmd_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
 	rtw_free_cmd_obj(pcmd);
 }
 
-void rtw_disassoc_cmd_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
+void rtw_disassoc_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 {
-	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	if (pcmd->res != H2C_SUCCESS) {
 		spin_lock_bh(&pmlmepriv->lock);
@@ -1807,9 +1928,9 @@ void rtw_disassoc_cmd_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
 	rtw_free_cmd_obj(pcmd);
 }
 
-void rtw_joinbss_cmd_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
+void rtw_joinbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 {
-	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	if (pcmd->res != H2C_SUCCESS) {
 		/* TODO: cancel timer and do timeout handler directly... */
@@ -1823,7 +1944,7 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 {
 	struct sta_info *psta = NULL;
 	struct wlan_network *pwlan = NULL;
-	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_bssid_ex *pnetwork = (struct wlan_bssid_ex *)pcmd->parmbuf;
 	struct wlan_network *tgt_network = &pmlmepriv->cur_network;
 
@@ -1838,9 +1959,11 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 	spin_lock_bh(&pmlmepriv->lock);
 
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
-		psta = rtw_get_stainfo(&padapter->stapriv, pnetwork->mac_address);
+		psta = rtw_get_stainfo(&padapter->stapriv,
+				       pnetwork->mac_address);
 		if (!psta) {
-			psta = rtw_alloc_stainfo(&padapter->stapriv, pnetwork->mac_address);
+			psta = rtw_alloc_stainfo(&padapter->stapriv,
+						 pnetwork->mac_address);
 			if (!psta)
 				goto createbss_cmd_fail;
 		}
@@ -1850,14 +1973,16 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 		pwlan = rtw_alloc_network(pmlmepriv);
 		spin_lock_bh(&pmlmepriv->scanned_queue.lock);
 		if (!pwlan) {
-			pwlan = rtw_get_oldest_wlan_network(&pmlmepriv->scanned_queue);
+			pwlan = rtw_get_oldest_wlan_network(
+				&pmlmepriv->scanned_queue);
 			if (!pwlan) {
 				spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
 				goto createbss_cmd_fail;
 			}
 			pwlan->last_scanned = jiffies;
 		} else {
-			list_add_tail(&pwlan->list, &pmlmepriv->scanned_queue.queue);
+			list_add_tail(&pwlan->list,
+				      &pmlmepriv->scanned_queue.queue);
 		}
 
 		pnetwork->length = get_wlan_bssid_ex_sz(pnetwork);
@@ -1867,7 +1992,8 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 		/* list_add_tail(&(pwlan->list), &pmlmepriv->scanned_queue.queue); */
 
 		/*  copy pdev_network information to	pmlmepriv->cur_network */
-		memcpy(&tgt_network->network, pnetwork, (get_wlan_bssid_ex_sz(pnetwork)));
+		memcpy(&tgt_network->network, pnetwork,
+		       (get_wlan_bssid_ex_sz(pnetwork)));
 
 		_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 
@@ -1882,10 +2008,12 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 	rtw_free_cmd_obj(pcmd);
 }
 
-void rtw_setstaKey_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
+void rtw_setstaKey_cmdrsp_callback(struct adapter *padapter,
+				   struct cmd_obj *pcmd)
 {
 	struct sta_priv *pstapriv = &padapter->stapriv;
-	struct set_stakey_rsp *psetstakey_rsp = (struct set_stakey_rsp *)(pcmd->rsp);
+	struct set_stakey_rsp *psetstakey_rsp =
+		(struct set_stakey_rsp *)(pcmd->rsp);
 	struct sta_info *psta = rtw_get_stainfo(pstapriv, psetstakey_rsp->addr);
 
 	if (!psta)
@@ -1895,12 +2023,15 @@ void rtw_setstaKey_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *pc
 	rtw_free_cmd_obj(pcmd);
 }
 
-void rtw_setassocsta_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
+void rtw_setassocsta_cmdrsp_callback(struct adapter *padapter,
+				     struct cmd_obj *pcmd)
 {
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct set_assocsta_parm *passocsta_parm = (struct set_assocsta_parm *)(pcmd->parmbuf);
-	struct set_assocsta_rsp *passocsta_rsp = (struct set_assocsta_rsp *)(pcmd->rsp);
+	struct set_assocsta_parm *passocsta_parm =
+		(struct set_assocsta_parm *)(pcmd->parmbuf);
+	struct set_assocsta_rsp *passocsta_rsp =
+		(struct set_assocsta_rsp *)(pcmd->rsp);
 	struct sta_info *psta = rtw_get_stainfo(pstapriv, passocsta_parm->addr);
 
 	if (!psta)
@@ -1911,7 +2042,8 @@ void rtw_setassocsta_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *
 
 	spin_lock_bh(&pmlmepriv->lock);
 
-	if (check_fwstate(pmlmepriv, WIFI_MP_STATE) && check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
+	if (check_fwstate(pmlmepriv, WIFI_MP_STATE) &&
+	    check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
 		_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 
 	set_fwstate(pmlmepriv, _FW_LINKED);
diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
index cb44119ce9a9..9a56128fca16 100644
--- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
@@ -9,90 +9,90 @@
 
 #include <linux/completion.h>
 
-#define C2H_MEM_SZ (16*1024)
-
-	#define FREE_CMDOBJ_SZ	128
-
-	#define MAX_CMDSZ	1024
-	#define MAX_RSPSZ	512
-	#define MAX_EVTSZ	1024
-
-	#define CMDBUFF_ALIGN_SZ 512
-
-	struct cmd_obj {
-		struct adapter *padapter;
-		u16 cmdcode;
-		u8 res;
-		u8 *parmbuf;
-		u32 cmdsz;
-		u8 *rsp;
-		u32 rspsz;
-		struct submit_ctx *sctx;
-		struct list_head	list;
-	};
-
-	/* cmd flags */
-	enum {
-		RTW_CMDF_DIRECTLY = BIT0,
-		RTW_CMDF_WAIT_ACK = BIT1,
-	};
-
-	struct cmd_priv {
-		struct completion cmd_queue_comp;
-		struct completion terminate_cmdthread_comp;
-		struct __queue	cmd_queue;
-		u8 cmd_seq;
-		u8 *cmd_buf;	/* shall be non-paged, and 4 bytes aligned */
-		u8 *cmd_allocated_buf;
-		u8 *rsp_buf;	/* shall be non-paged, and 4 bytes aligned */
-		u8 *rsp_allocated_buf;
-		u32 cmd_issued_cnt;
-		u32 cmd_done_cnt;
-		u32 rsp_cnt;
-		atomic_t cmdthd_running;
-		/* u8 cmdthd_running; */
-		u8 stop_req;
-		struct adapter *padapter;
-		struct mutex sctx_mutex;
-	};
-
-	struct	evt_priv {
-		struct work_struct c2h_wk;
-		bool c2h_wk_alive;
-		struct rtw_cbuf *c2h_queue;
-		#define C2H_QUEUE_MAX_LEN 10
-
-		atomic_t event_seq;
-		u8 *evt_buf;	/* shall be non-paged, and 4 bytes aligned */
-		u8 *evt_allocated_buf;
-		u32 evt_done_cnt;
-		u8 *c2h_mem;
-		u8 *allocated_c2h_mem;
-	};
+#define C2H_MEM_SZ (16 * 1024)
+
+#define FREE_CMDOBJ_SZ 128
+
+#define MAX_CMDSZ 1024
+#define MAX_RSPSZ 512
+#define MAX_EVTSZ 1024
+
+#define CMDBUFF_ALIGN_SZ 512
+
+struct cmd_obj {
+	struct adapter *padapter;
+	u16 cmdcode;
+	u8 res;
+	u8 *parmbuf;
+	u32 cmdsz;
+	u8 *rsp;
+	u32 rspsz;
+	struct submit_ctx *sctx;
+	struct list_head list;
+};
+
+/* cmd flags */
+enum {
+	RTW_CMDF_DIRECTLY = BIT0,
+	RTW_CMDF_WAIT_ACK = BIT1,
+};
+
+struct cmd_priv {
+	struct completion cmd_queue_comp;
+	struct completion terminate_cmdthread_comp;
+	struct __queue cmd_queue;
+	u8 cmd_seq;
+	u8 *cmd_buf; /* shall be non-paged, and 4 bytes aligned */
+	u8 *cmd_allocated_buf;
+	u8 *rsp_buf; /* shall be non-paged, and 4 bytes aligned */
+	u8 *rsp_allocated_buf;
+	u32 cmd_issued_cnt;
+	u32 cmd_done_cnt;
+	u32 rsp_cnt;
+	atomic_t cmdthd_running;
+	/* u8 cmdthd_running; */
+	u8 stop_req;
+	struct adapter *padapter;
+	struct mutex sctx_mutex;
+};
+
+struct evt_priv {
+	struct work_struct c2h_wk;
+	bool c2h_wk_alive;
+	struct rtw_cbuf *c2h_queue;
+#define C2H_QUEUE_MAX_LEN 10
+
+	atomic_t event_seq;
+	u8 *evt_buf; /* shall be non-paged, and 4 bytes aligned */
+	u8 *evt_allocated_buf;
+	u32 evt_done_cnt;
+	u8 *c2h_mem;
+	u8 *allocated_c2h_mem;
+};
 
 #define init_h2fwcmd_w_parm_no_rsp(pcmd, pparm, code) \
-do {\
-	INIT_LIST_HEAD(&pcmd->list);\
-	pcmd->cmdcode = code;\
-	pcmd->parmbuf = (u8 *)(pparm);\
-	pcmd->cmdsz = sizeof(*pparm);\
-	pcmd->rsp = NULL;\
-	pcmd->rspsz = 0;\
-} while (0)
+	do {                                          \
+		INIT_LIST_HEAD(&pcmd->list);          \
+		pcmd->cmdcode = code;                 \
+		pcmd->parmbuf = (u8 *)(pparm);        \
+		pcmd->cmdsz = sizeof(*pparm);         \
+		pcmd->rsp = NULL;                     \
+		pcmd->rspsz = 0;                      \
+	} while (0)
 
 #define init_h2fwcmd_w_parm_no_parm_rsp(pcmd, code) \
-do {\
-	INIT_LIST_HEAD(&pcmd->list);\
-	pcmd->cmdcode = code;\
-	pcmd->parmbuf = NULL;\
-	pcmd->cmdsz = 0;\
-	pcmd->rsp = NULL;\
-	pcmd->rspsz = 0;\
-} while (0)
+	do {                                        \
+		INIT_LIST_HEAD(&pcmd->list);        \
+		pcmd->cmdcode = code;               \
+		pcmd->parmbuf = NULL;               \
+		pcmd->cmdsz = 0;                    \
+		pcmd->rsp = NULL;                   \
+		pcmd->rspsz = 0;                    \
+	} while (0)
 
 struct c2h_evt_hdr {
-	u8 id:4;
-	u8 plen:4;
+	u8 id : 4;
+	u8 plen : 4;
 	u8 seq;
 	u8 payload[];
 };
@@ -124,12 +124,12 @@ enum {
 	DYNAMIC_CHK_WK_CID,
 	DM_CTRL_WK_CID,
 	PBC_POLLING_WK_CID,
-	POWER_SAVING_CTRL_WK_CID,/* IPS, AUTOSuspend */
+	POWER_SAVING_CTRL_WK_CID, /* IPS, AUTOSuspend */
 	LPS_CTRL_WK_CID,
 	ANT_SELECT_WK_CID,
 	P2P_PS_WK_CID,
 	P2P_PROTO_WK_CID,
-	CHECK_HIQ_WK_CID,/* for softap mode, check hi queue if empty */
+	CHECK_HIQ_WK_CID, /* for softap mode, check hi queue if empty */
 	INTEl_WIDI_WK_CID,
 	C2H_WK_CID,
 	RTP_TIMER_CFG_WK_CID,
@@ -221,7 +221,7 @@ The definition of mode:
 #define IW_MODE_MONITOR	6	 Passive monitor (listen only)
 
 */
-struct	setopmode_parm {
+struct setopmode_parm {
 	u8 mode;
 	u8 rsvd[3];
 };
@@ -236,9 +236,9 @@ Command-Event Mode
 */
 
 #define RTW_SSID_SCAN_AMOUNT 9 /*  for WEXT_CSCAN_AMOUNT 9 */
-#define RTW_CHANNEL_SCAN_AMOUNT (14+37)
+#define RTW_CHANNEL_SCAN_AMOUNT (14 + 37)
 struct sitesurvey_parm {
-	signed int scan_mode;	/* active: 1, passive: 0 */
+	signed int scan_mode; /* active: 1, passive: 0 */
 	u8 ssid_num;
 	u8 ch_num;
 	struct ndis_802_11_ssid ssid[RTW_SSID_SCAN_AMOUNT];
@@ -254,8 +254,8 @@ Command Mode
 
 */
 struct setauth_parm {
-	u8 mode;  /* 0: legacy open, 1: legacy shared 2: 802.1x */
-	u8 _1x;   /* 0: PSK, 1: TLS */
+	u8 mode; /* 0: legacy open, 1: legacy shared 2: 802.1x */
+	u8 _1x; /* 0: PSK, 1: TLS */
 	u8 rsvd[2];
 };
 
@@ -272,11 +272,11 @@ when 802.1x ==> keyid > 2 ==> unicast key
 
 */
 struct setkey_parm {
-	u8 algorithm;	/*  encryption algorithm, could be none, wep40, TKIP, CCMP, wep104 */
+	u8 algorithm; /*  encryption algorithm, could be none, wep40, TKIP, CCMP, wep104 */
 	u8 keyid;
-	u8 grpkey;		/*  1: this is the grpkey for 802.1x. 0: this is the unicast key for 802.1x */
-	u8 set_tx;		/*  1: main tx key for wep. 0: other key. */
-	u8 key[16];	/*  this could be 40 or 104 */
+	u8 grpkey; /*  1: this is the grpkey for 802.1x. 0: this is the unicast key for 802.1x */
+	u8 set_tx; /*  1: main tx key for wep. 0: other key. */
+	u8 key[16]; /*  this could be 40 or 104 */
 };
 
 /*
@@ -356,7 +356,7 @@ Notes: To setup the basic rate of RTL8711
 Command Mode
 
 */
-struct	setbasicrate_parm {
+struct setbasicrate_parm {
 	u8 basicrates[NumRates];
 };
 
@@ -395,7 +395,6 @@ Command-Rsp Mode
 */
 struct getdatarate_parm {
 	u32 rsvd;
-
 };
 
 /*
@@ -412,12 +411,12 @@ Command Mode
 
 */
 
-struct	setphyinfo_parm {
+struct setphyinfo_parm {
 	struct regulatory_class class_sets[NUM_REGULATORYS];
 	u8 status;
 };
 
-struct	getphyinfo_parm {
+struct getphyinfo_parm {
 	u32 rsvd;
 };
 
@@ -430,7 +429,7 @@ This command will be used when channel/modem/band is changed.
 Command Mode
 
 */
-struct	setphy_parm {
+struct setphy_parm {
 	u8 rfchannel;
 	u8 modem;
 };
@@ -443,9 +442,8 @@ Notes: To get the current setting of channel/modem/band
 Command-Rsp Mode
 
 */
-struct	getphy_parm {
+struct getphy_parm {
 	u32 rsvd;
-
 };
 
 struct Tx_Beacon_param {
@@ -550,9 +548,7 @@ struct RunInThread_param {
 	void *context;
 };
 
-
-#define GEN_CMD_CODE(cmd)	cmd ## _CMD_
-
+#define GEN_CMD_CODE(cmd) cmd##_CMD_
 
 /*
 
@@ -565,31 +561,39 @@ struct RunInThread_param {
 
 */
 
-#define H2C_RSP_OFFSET			512
+#define H2C_RSP_OFFSET 512
 
-#define H2C_SUCCESS			0x00
-#define H2C_SUCCESS_RSP			0x01
-#define H2C_DUPLICATED			0x02
-#define H2C_DROPPED			0x03
-#define H2C_PARAMETERS_ERROR		0x04
-#define H2C_REJECTED			0x05
-#define H2C_CMD_OVERFLOW		0x06
-#define H2C_RESERVED			0x07
+#define H2C_SUCCESS 0x00
+#define H2C_SUCCESS_RSP 0x01
+#define H2C_DUPLICATED 0x02
+#define H2C_DROPPED 0x03
+#define H2C_PARAMETERS_ERROR 0x04
+#define H2C_REJECTED 0x05
+#define H2C_CMD_OVERFLOW 0x06
+#define H2C_RESERVED 0x07
 
-u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid, int ssid_num, struct rtw_ieee80211_channel *ch, int ch_num);
-extern u8 rtw_createbss_cmd(struct adapter  *padapter);
-int rtw_startbss_cmd(struct adapter  *padapter, int flags);
+u8 rtw_sitesurvey_cmd(struct adapter *padapter, struct ndis_802_11_ssid *ssid,
+		      int ssid_num, struct rtw_ieee80211_channel *ch,
+		      int ch_num);
+extern u8 rtw_createbss_cmd(struct adapter *padapter);
+int rtw_startbss_cmd(struct adapter *padapter, int flags);
 
 struct sta_info;
-extern u8 rtw_setstakey_cmd(struct adapter  *padapter, struct sta_info *sta, u8 unicast_key, bool enqueue);
-extern u8 rtw_clearstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 enqueue);
-
-extern u8 rtw_joinbss_cmd(struct adapter *padapter, struct wlan_network *pnetwork);
-u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueue);
-extern u8 rtw_setopmode_cmd(struct adapter  *padapter, enum ndis_802_11_network_infrastructure networktype, bool enqueue);
-extern u8 rtw_setrfintfs_cmd(struct adapter  *padapter, u8 mode);
-
-extern u8 rtw_gettssi_cmd(struct adapter  *padapter, u8 offset, u8 *pval);
+extern u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta,
+			    u8 unicast_key, bool enqueue);
+extern u8 rtw_clearstakey_cmd(struct adapter *padapter, struct sta_info *sta,
+			      u8 enqueue);
+
+extern u8 rtw_joinbss_cmd(struct adapter *padapter,
+			  struct wlan_network *pnetwork);
+u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms,
+		    bool enqueue);
+extern u8 rtw_setopmode_cmd(struct adapter *padapter,
+			    enum ndis_802_11_network_infrastructure networktype,
+			    bool enqueue);
+extern u8 rtw_setrfintfs_cmd(struct adapter *padapter, u8 mode);
+
+extern u8 rtw_gettssi_cmd(struct adapter *padapter, u8 offset, u8 *pval);
 extern u8 rtw_setfwdig_cmd(struct adapter *padapter, u8 type);
 extern u8 rtw_setfwra_cmd(struct adapter *padapter, u8 type);
 
@@ -613,24 +617,31 @@ extern u8 rtw_c2h_wk_cmd(struct adapter *padapter, u8 *c2h_evt);
 
 u8 rtw_drvextra_cmd_hdl(struct adapter *padapter, unsigned char *pbuf);
 
-extern void rtw_survey_cmd_callback(struct adapter  *padapter, struct cmd_obj *pcmd);
-extern void rtw_disassoc_cmd_callback(struct adapter  *padapter, struct cmd_obj *pcmd);
-extern void rtw_joinbss_cmd_callback(struct adapter  *padapter, struct cmd_obj *pcmd);
-extern void rtw_createbss_cmd_callback(struct adapter  *padapter, struct cmd_obj *pcmd);
-extern void rtw_getbbrfreg_cmdrsp_callback(struct adapter  *padapter, struct cmd_obj *pcmd);
-
-extern void rtw_setstaKey_cmdrsp_callback(struct adapter  *padapter,  struct cmd_obj *pcmd);
-extern void rtw_setassocsta_cmdrsp_callback(struct adapter  *padapter,  struct cmd_obj *pcmd);
-extern void rtw_getrttbl_cmdrsp_callback(struct adapter  *padapter,  struct cmd_obj *pcmd);
-
+extern void rtw_survey_cmd_callback(struct adapter *padapter,
+				    struct cmd_obj *pcmd);
+extern void rtw_disassoc_cmd_callback(struct adapter *padapter,
+				      struct cmd_obj *pcmd);
+extern void rtw_joinbss_cmd_callback(struct adapter *padapter,
+				     struct cmd_obj *pcmd);
+extern void rtw_createbss_cmd_callback(struct adapter *padapter,
+				       struct cmd_obj *pcmd);
+extern void rtw_getbbrfreg_cmdrsp_callback(struct adapter *padapter,
+					   struct cmd_obj *pcmd);
+
+extern void rtw_setstaKey_cmdrsp_callback(struct adapter *padapter,
+					  struct cmd_obj *pcmd);
+extern void rtw_setassocsta_cmdrsp_callback(struct adapter *padapter,
+					    struct cmd_obj *pcmd);
+extern void rtw_getrttbl_cmdrsp_callback(struct adapter *padapter,
+					 struct cmd_obj *pcmd);
 
 struct _cmd_callback {
 	u32 cmd_code;
-	void (*callback)(struct adapter  *padapter, struct cmd_obj *cmd);
+	void (*callback)(struct adapter *padapter, struct cmd_obj *cmd);
 };
 
 enum {
-	GEN_CMD_CODE(_Read_MACREG),	/*0*/
+	GEN_CMD_CODE(READ_MACREG), /*0*/
 	GEN_CMD_CODE(_Write_MACREG),
 	GEN_CMD_CODE(_Read_BBREG),
 	GEN_CMD_CODE(_Write_BBREG),
@@ -641,18 +652,18 @@ enum {
 	GEN_CMD_CODE(_Read_EFUSE),
 	GEN_CMD_CODE(_Write_EFUSE),
 
-	GEN_CMD_CODE(_Read_CAM),	/*10*/
+	GEN_CMD_CODE(_Read_CAM), /*10*/
 	GEN_CMD_CODE(_Write_CAM),
 	GEN_CMD_CODE(_setBCNITV),
 	GEN_CMD_CODE(_setMBIDCFG),
-	GEN_CMD_CODE(_JoinBss),   /*14*/
+	GEN_CMD_CODE(_JoinBss), /*14*/
 	GEN_CMD_CODE(_DisConnect), /*15*/
 	GEN_CMD_CODE(_CreateBss),
 	GEN_CMD_CODE(_SetOpMode),
-	GEN_CMD_CODE(_SiteSurvey),  /*18*/
+	GEN_CMD_CODE(_SiteSurvey), /*18*/
 	GEN_CMD_CODE(_SetAuth),
 
-	GEN_CMD_CODE(_SetKey),	/*20*/
+	GEN_CMD_CODE(_SetKey), /*20*/
 	GEN_CMD_CODE(_SetStaKey),
 	GEN_CMD_CODE(_SetAssocSta),
 	GEN_CMD_CODE(_DelAssocSta),
@@ -663,7 +674,7 @@ enum {
 	GEN_CMD_CODE(_GetDataRate),
 	GEN_CMD_CODE(_SetPhyInfo),
 
-	GEN_CMD_CODE(_GetPhyInfo),	/*30*/
+	GEN_CMD_CODE(_GetPhyInfo), /*30*/
 	GEN_CMD_CODE(_SetPhy),
 	GEN_CMD_CODE(_GetPhy),
 	GEN_CMD_CODE(_readRssi),
@@ -686,7 +697,7 @@ enum {
 	GEN_CMD_CODE(_SetCrystalCap),
 	GEN_CMD_CODE(_SetSingleCarrierTx), /*50*/
 
-	GEN_CMD_CODE(_SetSingleToneTx),/*51*/
+	GEN_CMD_CODE(_SetSingleToneTx), /*51*/
 	GEN_CMD_CODE(_SetCarrierSuppressionTx),
 	GEN_CMD_CODE(_SetContinuousTx),
 	GEN_CMD_CODE(_SwitchBandwidth), /*54*/
@@ -707,9 +718,9 @@ enum {
 	MAX_H2CCMD
 };
 
-#define _GetBBReg_CMD_		_Read_BBREG_CMD_
-#define _SetBBReg_CMD_		_Write_BBREG_CMD_
-#define _GetRFReg_CMD_		_Read_RFREG_CMD_
-#define _SetRFReg_CMD_		_Write_RFREG_CMD_
+#define _GetBBReg_CMD_ _Read_BBREG_CMD_
+#define _SetBBReg_CMD_ _Write_BBREG_CMD_
+#define _GetRFReg_CMD_ _Read_RFREG_CMD_
+#define _SetRFReg_CMD_ _Write_RFREG_CMD_
 
 #endif /*  _CMD_H_ */
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index afa5631a441a..0a665fd11be5 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -7,58 +7,56 @@
 #ifndef __RTW_MLME_EXT_H_
 #define __RTW_MLME_EXT_H_
 
-
 /* 	Commented by Albert 20101105 */
 /* 	Increase the SURVEY_TO value from 100 to 150  (100ms to 150ms) */
 /* 	The Realtek 8188CE SoftAP will spend around 100ms to send the probe response after receiving the probe request. */
 /* 	So, this driver tried to extend the dwell time for each scanning channel. */
 /* 	This will increase the chance to receive the probe response from SoftAP. */
 
-#define SURVEY_TO		(100)
-#define REAUTH_TO		(300) /* 50) */
-#define REASSOC_TO		(300) /* 50) */
+#define SURVEY_TO (100)
+#define REAUTH_TO (300) /* 50) */
+#define REASSOC_TO (300) /* 50) */
 /* define DISCONNECT_TO	(3000) */
-#define ADDBA_TO			(2000)
+#define ADDBA_TO (2000)
 
-#define REAUTH_LIMIT	(4)
-#define REASSOC_LIMIT	(4)
+#define REAUTH_LIMIT (4)
+#define REASSOC_LIMIT (4)
 
-#define DYNAMIC_FUNC_DISABLE		(0x0)
+#define DYNAMIC_FUNC_DISABLE (0x0)
 
 /*  ====== ODM_ABILITY_E ======== */
 /*  BB ODM section BIT 0-15 */
-#define DYNAMIC_BB_DIG				BIT0 /* ODM_BB_DIG */
-#define DYNAMIC_BB_DYNAMIC_TXPWR	BIT2 /* ODM_BB_DYNAMIC_TXPWR */
-#define DYNAMIC_BB_ANT_DIV			BIT6 /* ODM_BB_ANT_DIV */
+#define DYNAMIC_BB_DIG BIT0 /* ODM_BB_DIG */
+#define DYNAMIC_BB_DYNAMIC_TXPWR BIT2 /* ODM_BB_DYNAMIC_TXPWR */
+#define DYNAMIC_BB_ANT_DIV BIT6 /* ODM_BB_ANT_DIV */
 
 /*  RF ODM section BIT 24-31 */
-#define DYNAMIC_RF_CALIBRATION		BIT26/* ODM_RF_CALIBRATION */
-
-#define DYNAMIC_ALL_FUNC_ENABLE		0xFFFFFFF
-
-#define _HW_STATE_NOLINK_		0x00
-#define _HW_STATE_ADHOC_		0x01
-#define _HW_STATE_STATION_	0x02
-#define _HW_STATE_AP_			0x03
-
-
-#define		_1M_RATE_	0
-#define		_2M_RATE_	1
-#define		_5M_RATE_	2
-#define		_11M_RATE_	3
-#define		_6M_RATE_	4
-#define		_9M_RATE_	5
-#define		_12M_RATE_	6
-#define		_18M_RATE_	7
-#define		_24M_RATE_	8
-#define		_36M_RATE_	9
-#define		_48M_RATE_	10
-#define		_54M_RATE_	11
+#define DYNAMIC_RF_CALIBRATION BIT26 /* ODM_RF_CALIBRATION */
+
+#define DYNAMIC_ALL_FUNC_ENABLE 0xFFFFFFF
+
+#define _HW_STATE_NOLINK_ 0x00
+#define _HW_STATE_ADHOC_ 0x01
+#define _HW_STATE_STATION_ 0x02
+#define _HW_STATE_AP_ 0x03
+
+#define _1M_RATE_ 0
+#define _2M_RATE_ 1
+#define _5M_RATE_ 2
+#define _11M_RATE_ 3
+#define _6M_RATE_ 4
+#define _9M_RATE_ 5
+#define _12M_RATE_ 6
+#define _18M_RATE_ 7
+#define _24M_RATE_ 8
+#define _36M_RATE_ 9
+#define _48M_RATE_ 10
+#define _54M_RATE_ 11
 
 /********************************************************
 MCS rate definitions
 *********************************************************/
-#define MCS_RATE_1R	(0x000000ff)
+#define MCS_RATE_1R (0x000000ff)
 
 extern unsigned char RTW_WPA_OUI[];
 extern unsigned char WMM_OUI[];
@@ -69,7 +67,6 @@ extern unsigned char P2P_OUI[];
 extern unsigned char WMM_INFO_OUI[];
 extern unsigned char WMM_PARA_OUI[];
 
-
 /*  */
 /*  Channel Plan Type. */
 /*  Note: */
@@ -147,18 +144,20 @@ enum {
 };
 
 enum {
-	RT_CHANNEL_DOMAIN_2G_WORLD = 0x00,		/* Worldwird 13 */
-	RT_CHANNEL_DOMAIN_2G_ETSI1 = 0x01,		/* Europe */
-	RT_CHANNEL_DOMAIN_2G_FCC1 = 0x02,		/* US */
-	RT_CHANNEL_DOMAIN_2G_MKK1 = 0x03,		/* Japan */
-	RT_CHANNEL_DOMAIN_2G_ETSI2 = 0x04,		/* France */
-	RT_CHANNEL_DOMAIN_2G_GLOBAL = 0x05,		/* Global domain */
+	RT_CHANNEL_DOMAIN_2G_WORLD = 0x00, /* Worldwird 13 */
+	RT_CHANNEL_DOMAIN_2G_ETSI1 = 0x01, /* Europe */
+	RT_CHANNEL_DOMAIN_2G_FCC1 = 0x02, /* US */
+	RT_CHANNEL_DOMAIN_2G_MKK1 = 0x03, /* Japan */
+	RT_CHANNEL_DOMAIN_2G_ETSI2 = 0x04, /* France */
+	RT_CHANNEL_DOMAIN_2G_GLOBAL = 0x05, /* Global domain */
 	RT_CHANNEL_DOMAIN_2G_NULL = 0x06,
 	/*  Add new channel plan above this line =============== */
 	RT_CHANNEL_DOMAIN_2G_MAX,
 };
 
-#define rtw_is_channel_plan_valid(chplan) (chplan < RT_CHANNEL_DOMAIN_MAX || chplan == RT_CHANNEL_DOMAIN_REALTEK_DEFINE)
+#define rtw_is_channel_plan_valid(chplan)  \
+	(chplan < RT_CHANNEL_DOMAIN_MAX || \
+	 chplan == RT_CHANNEL_DOMAIN_REALTEK_DEFINE)
 
 struct rt_channel_plan {
 	unsigned char Channel[MAX_CHANNEL_NUM];
@@ -175,28 +174,28 @@ struct rt_channel_plan_map {
 };
 
 enum {
-	HT_IOT_PEER_UNKNOWN			= 0,
-	HT_IOT_PEER_REALTEK			= 1,
-	HT_IOT_PEER_REALTEK_92SE		= 2,
-	HT_IOT_PEER_BROADCOM		= 3,
-	HT_IOT_PEER_RALINK			= 4,
-	HT_IOT_PEER_ATHEROS			= 5,
-	HT_IOT_PEER_CISCO				= 6,
-	HT_IOT_PEER_MERU				= 7,
-	HT_IOT_PEER_MARVELL			= 8,
-	HT_IOT_PEER_REALTEK_SOFTAP	= 9,/*  peer is RealTek SOFT_AP, by Bohn, 2009.12.17 */
-	HT_IOT_PEER_SELF_SOFTAP			= 10, /*  Self is SoftAP */
-	HT_IOT_PEER_AIRGO				= 11,
-	HT_IOT_PEER_INTEL				= 12,
-	HT_IOT_PEER_RTK_APCLIENT		= 13,
-	HT_IOT_PEER_REALTEK_81XX		= 14,
-	HT_IOT_PEER_REALTEK_WOW			= 15,
+	HT_IOT_PEER_UNKNOWN = 0,
+	HT_IOT_PEER_REALTEK = 1,
+	HT_IOT_PEER_REALTEK_92SE = 2,
+	HT_IOT_PEER_BROADCOM = 3,
+	HT_IOT_PEER_RALINK = 4,
+	HT_IOT_PEER_ATHEROS = 5,
+	HT_IOT_PEER_CISCO = 6,
+	HT_IOT_PEER_MERU = 7,
+	HT_IOT_PEER_MARVELL = 8,
+	HT_IOT_PEER_REALTEK_SOFTAP =
+		9, /*  peer is RealTek SOFT_AP, by Bohn, 2009.12.17 */
+	HT_IOT_PEER_SELF_SOFTAP = 10, /*  Self is SoftAP */
+	HT_IOT_PEER_AIRGO = 11,
+	HT_IOT_PEER_INTEL = 12,
+	HT_IOT_PEER_RTK_APCLIENT = 13,
+	HT_IOT_PEER_REALTEK_81XX = 14,
+	HT_IOT_PEER_REALTEK_WOW = 15,
 	HT_IOT_PEER_REALTEK_JAGUAR_BCUTAP = 16,
 	HT_IOT_PEER_REALTEK_JAGUAR_CCUTAP = 17,
-	HT_IOT_PEER_MAX					= 18
+	HT_IOT_PEER_MAX = 18
 };
 
-
 enum {
 	SCAN_DISABLE = 0,
 	SCAN_START = 1,
@@ -207,22 +206,24 @@ enum {
 };
 
 struct mlme_handler {
-	unsigned int   num;
+	unsigned int num;
 	char *str;
-	unsigned int (*func)(struct adapter *padapter, union recv_frame *precv_frame);
+	unsigned int (*func)(struct adapter *padapter,
+			     union recv_frame *precv_frame);
 };
 
 struct action_handler {
-	unsigned int   num;
+	unsigned int num;
 	char *str;
-	unsigned int (*func)(struct adapter *padapter, union recv_frame *precv_frame);
+	unsigned int (*func)(struct adapter *padapter,
+			     union recv_frame *precv_frame);
 };
 
-struct	ss_res {
-	int	state;
-	int	bss_cnt;
-	int	channel_idx;
-	int	scan_mode;
+struct ss_res {
+	int state;
+	int bss_cnt;
+	int channel_idx;
+	int scan_mode;
 	u8 ssid_num;
 	u8 ch_num;
 	struct ndis_802_11_ssid ssid[RTW_SSID_SCAN_AMOUNT];
@@ -234,26 +235,28 @@ struct	ss_res {
 /* define AD_HOC_MODE		0x04 */
 /* define NO_LINK_MODE	0x00 */
 
-#define		WIFI_FW_NULL_STATE			_HW_STATE_NOLINK_
-#define	WIFI_FW_STATION_STATE		_HW_STATE_STATION_
-#define	WIFI_FW_AP_STATE				_HW_STATE_AP_
-#define	WIFI_FW_ADHOC_STATE			_HW_STATE_ADHOC_
+#define WIFI_FW_NULL_STATE _HW_STATE_NOLINK_
+#define WIFI_FW_STATION_STATE _HW_STATE_STATION_
+#define WIFI_FW_AP_STATE _HW_STATE_AP_
+#define WIFI_FW_ADHOC_STATE _HW_STATE_ADHOC_
 
-#define	WIFI_FW_AUTH_NULL			0x00000100
-#define	WIFI_FW_AUTH_STATE			0x00000200
-#define	WIFI_FW_AUTH_SUCCESS			0x00000400
+#define WIFI_FW_AUTH_NULL 0x00000100
+#define WIFI_FW_AUTH_STATE 0x00000200
+#define WIFI_FW_AUTH_SUCCESS 0x00000400
 
-#define	WIFI_FW_ASSOC_STATE			0x00002000
-#define	WIFI_FW_ASSOC_SUCCESS		0x00004000
+#define WIFI_FW_ASSOC_STATE 0x00002000
+#define WIFI_FW_ASSOC_SUCCESS 0x00004000
 
-#define	WIFI_FW_LINKING_STATE		(WIFI_FW_AUTH_NULL | WIFI_FW_AUTH_STATE | WIFI_FW_AUTH_SUCCESS | WIFI_FW_ASSOC_STATE)
+#define WIFI_FW_LINKING_STATE                                            \
+	(WIFI_FW_AUTH_NULL | WIFI_FW_AUTH_STATE | WIFI_FW_AUTH_SUCCESS | \
+	 WIFI_FW_ASSOC_STATE)
 
 struct FW_Sta_Info {
 	struct sta_info *psta;
 	u32 status;
 	u32 rx_pkt;
 	u32 retry;
-	NDIS_802_11_RATES_EX  SupportedRates;
+	NDIS_802_11_RATES_EX SupportedRates;
 };
 
 /*
@@ -280,10 +283,10 @@ struct mlme_ext_info {
 	u32 reassoc_count;
 	u32 link_count;
 	u32 auth_seq;
-	u32 auth_algo;	/*  802.11 auth, could be open, shared, auto */
+	u32 auth_algo; /*  802.11 auth, could be open, shared, auto */
 	u32 authModeToggle;
-	u32 enc_algo;/* encrypt algorithm; */
-	u32 key_index;	/*  this is only valid for legendary wep, 0~3 for key id. */
+	u32 enc_algo; /* encrypt algorithm; */
+	u32 key_index; /*  this is only valid for legendary wep, 0~3 for key id. */
 	u32 iv;
 	u8 chg_txt[128];
 	u16 aid;
@@ -312,18 +315,20 @@ struct mlme_ext_info {
 	u8 hidden_ssid_mode;
 	u8 VHT_enable;
 
-	struct ADDBA_request		ADDBA_req;
-	struct WMM_para_element	WMM_param;
-	struct HT_caps_element	HT_caps;
-	struct HT_info_element		HT_info;
-	struct wlan_bssid_ex			network;/* join network or bss_network, if in ap mode, it is the same to cur_network.network */
-	struct FW_Sta_Info		FW_sta_info[NUM_STA];
+	struct ADDBA_request ADDBA_req;
+	struct WMM_para_element WMM_param;
+	struct HT_caps_element HT_caps;
+	struct HT_info_element HT_info;
+	struct wlan_bssid_ex
+		network; /* join network or bss_network, if in ap mode, it is the same to cur_network.network */
+	struct FW_Sta_Info FW_sta_info[NUM_STA];
 };
 
 /*  The channel information about this channel including joining, scanning, and power constraints. */
 struct rt_channel_info {
-	u8 		ChannelNum;		/*  The channel number. */
-	enum rt_scan_type	ScanType;		/*  Scan type such as passive or active scan. */
+	u8 ChannelNum; /*  The channel number. */
+	enum rt_scan_type
+		ScanType; /*  Scan type such as passive or active scan. */
 };
 
 int rtw_ch_set_search_ch(struct rt_channel_info *ch_set, const u32 ch);
@@ -353,7 +358,7 @@ struct p2p_channels {
 };
 
 struct p2p_oper_class_map {
-	enum hw_mode {IEEE80211G, IEEE80211A} mode;
+	enum hw_mode { IEEE80211G, IEEE80211A } mode;
 	u8 op_class;
 	u8 min_chan;
 	u8 max_chan;
@@ -362,9 +367,9 @@ struct p2p_oper_class_map {
 };
 
 struct mlme_ext_priv {
-	struct adapter	*padapter;
+	struct adapter *padapter;
 	u8 mlmeext_init;
-	atomic_t		event_seq;
+	atomic_t event_seq;
 	u16 mgnt_seq;
 	u16 sa_query_seq;
 	u64 mgnt_80211w_IPN;
@@ -373,24 +378,25 @@ struct mlme_ext_priv {
 
 	unsigned char cur_channel;
 	unsigned char cur_bwmode;
-	unsigned char cur_ch_offset;/* PRIME_CHNL_OFFSET */
-	unsigned char cur_wireless_mode;	/*  NETWORK_TYPE */
+	unsigned char cur_ch_offset; /* PRIME_CHNL_OFFSET */
+	unsigned char cur_wireless_mode; /*  NETWORK_TYPE */
 
 	unsigned char max_chan_nums;
-	struct rt_channel_info		channel_set[MAX_CHANNEL_NUM];
+	struct rt_channel_info channel_set[MAX_CHANNEL_NUM];
 	struct p2p_channels channel_list;
 	unsigned char basicrate[NumRates];
 	unsigned char datarate[NumRates];
 	unsigned char default_supported_mcs_set[16];
 
-	struct ss_res		sitesurvey_res;
-	struct mlme_ext_info mlmext_info;	/* for sta/adhoc mode, including current scanning/connecting/connected related info. */
-						/* for ap mode, network includes ap's cap_info */
-	struct timer_list		survey_timer;
-	struct timer_list		link_timer;
-	struct timer_list		sa_query_timer;
+	struct ss_res sitesurvey_res;
+	struct mlme_ext_info
+		mlmext_info; /* for sta/adhoc mode, including current scanning/connecting/connected related info. */
+	/* for ap mode, network includes ap's cap_info */
+	struct timer_list survey_timer;
+	struct timer_list link_timer;
+	struct timer_list sa_query_timer;
 	/* struct timer_list		ADDBA_timer; */
-	u16 		chan_scan_time;
+	u16 chan_scan_time;
 	unsigned long last_scan_time;
 	u8 scan_abort;
 	u8 tx_rate; /*  TXRATE when USERATE is set. */
@@ -413,13 +419,12 @@ struct mlme_ext_priv {
 
 	/* recv_decache check for Action_public frame */
 	u8 action_public_dialog_token;
-	u16  action_public_rxseq;
+	u16 action_public_rxseq;
 
 	u8 active_keep_alive_check;
 #ifdef DBG_FIXED_CHAN
 	u8 fixed_chan;
 #endif
-
 };
 
 void init_mlme_default_rate_set(struct adapter *padapter);
@@ -432,7 +437,8 @@ extern struct xmit_frame *alloc_mgtxmitframe(struct xmit_priv *pxmitpriv);
 
 u8 networktype_to_raid_ex(struct adapter *adapter, struct sta_info *psta);
 
-void get_rate_set(struct adapter *padapter, unsigned char *pbssrate, int *bssrate_len);
+void get_rate_set(struct adapter *padapter, unsigned char *pbssrate,
+		  int *bssrate_len);
 void set_mcs_rate_by_mask(u8 *mcs_set, u32 mask);
 void update_basic_rate_table(struct adapter *padapter, u8 *mBratesOS);
 void update_basic_rate_table_soft_ap(u8 *bssrateset, u32 bssratelen);
@@ -450,7 +456,8 @@ void rtw_set_oper_choffset(struct adapter *adapter, u8 offset);
 u8 rtw_get_center_ch(u8 channel, u8 chnl_bw, u8 chnl_offset);
 unsigned long rtw_get_on_cur_ch_time(struct adapter *adapter);
 
-void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigned char channel_offset, unsigned short bwmode);
+void set_channel_bwmode(struct adapter *padapter, unsigned char channel,
+			unsigned char channel_offset, unsigned short bwmode);
 void r8723bs_select_channel(struct adapter *padapter, unsigned char channel);
 
 unsigned int decide_wait_for_beacon_timeout(unsigned int bcn_interval);
@@ -464,18 +471,20 @@ void write_cam(struct adapter *padapter, u8 id, u16 ctrl, u8 *mac, u8 *key);
 void clear_cam_entry(struct adapter *padapter, u8 id);
 
 /* modify cache only */
-void write_cam_cache(struct adapter *adapter, u8 id, u16 ctrl, u8 *mac, u8 *key);
+void write_cam_cache(struct adapter *adapter, u8 id, u16 ctrl, u8 *mac,
+		     u8 *key);
 void clear_cam_cache(struct adapter *adapter, u8 id);
 
 void invalidate_cam_all(struct adapter *padapter);
 
-
 int allocate_fw_sta_entry(struct adapter *padapter);
 void flush_all_cam_entry(struct adapter *padapter);
 
 void site_survey(struct adapter *padapter);
-u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, struct wlan_bssid_ex *bssid);
-void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src, struct adapter *padapter, bool update_ie);
+u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame,
+		    struct wlan_bssid_ex *bssid);
+void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
+		    struct adapter *padapter, bool update_ie);
 
 u8 *get_my_bssid(struct wlan_bssid_ex *pnetwork);
 u16 get_beacon_interval(struct wlan_bssid_ex *bss);
@@ -497,23 +506,27 @@ void ERP_IE_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE);
 void VCS_update(struct adapter *padapter, struct sta_info *psta);
 void update_ldpc_stbc_cap(struct sta_info *psta);
 
-void update_beacon_info(struct adapter *padapter, u8 *pframe, uint len, struct sta_info *psta);
+void update_beacon_info(struct adapter *padapter, u8 *pframe, uint len,
+			struct sta_info *psta);
 int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len);
 void update_IOT_info(struct adapter *padapter);
 void update_capinfo(struct adapter *Adapter, u16 updateCap);
 void update_wireless_mode(struct adapter *padapter);
 void update_sta_basic_rate(struct sta_info *psta, u8 wireless_mode);
-int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, uint var_ie_len, int cam_idx);
+int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie,
+			    uint var_ie_len, int cam_idx);
 
 /* for sta/adhoc mode */
 void update_sta_info(struct adapter *padapter, struct sta_info *psta);
 void Update_RA_Entry(struct adapter *padapter, struct sta_info *psta);
 void set_sta_rate(struct adapter *padapter, struct sta_info *psta);
 
-unsigned int receive_disconnect(struct adapter *padapter, unsigned char *MacAddr, unsigned short reason);
+unsigned int receive_disconnect(struct adapter *padapter,
+				unsigned char *MacAddr, unsigned short reason);
 
 unsigned char get_highest_rate_idx(u32 mask);
-int support_short_GI(struct adapter *padapter, struct HT_caps_element *pHT_caps, u8 bwmode);
+int support_short_GI(struct adapter *padapter, struct HT_caps_element *pHT_caps,
+		     u8 bwmode);
 unsigned int is_ap_in_tkip(struct adapter *padapter);
 
 s16 rtw_camid_search(struct adapter *adapter, u8 *addr, s16 kid);
@@ -524,36 +537,55 @@ extern void rtw_alloc_macid(struct adapter *padapter, struct sta_info *psta);
 extern void rtw_release_macid(struct adapter *padapter, struct sta_info *psta);
 
 void report_join_res(struct adapter *padapter, int res);
-void report_survey_event(struct adapter *padapter, union recv_frame *precv_frame);
+void report_survey_event(struct adapter *padapter,
+			 union recv_frame *precv_frame);
 void report_surveydone_event(struct adapter *padapter);
-void report_del_sta_event(struct adapter *padapter, unsigned char *MacAddr, unsigned short reason);
-void report_add_sta_event(struct adapter *padapter, unsigned char *MacAddr, int cam_idx);
+void report_del_sta_event(struct adapter *padapter, unsigned char *MacAddr,
+			  unsigned short reason);
+void report_add_sta_event(struct adapter *padapter, unsigned char *MacAddr,
+			  int cam_idx);
 void report_wmm_edca_update(struct adapter *padapter);
 
 u8 chk_bmc_sleepq_cmd(struct adapter *padapter);
 extern u8 set_tx_beacon_cmd(struct adapter *padapter);
-unsigned int setup_beacon_frame(struct adapter *padapter, unsigned char *beacon_frame);
+unsigned int setup_beacon_frame(struct adapter *padapter,
+				unsigned char *beacon_frame);
 void update_mgnt_tx_rate(struct adapter *padapter, u8 rate);
-void update_mgntframe_attrib(struct adapter *padapter, struct pkt_attrib *pattrib);
-void update_mgntframe_attrib_addr(struct adapter *padapter, struct xmit_frame *pmgntframe);
+void update_mgntframe_attrib(struct adapter *padapter,
+			     struct pkt_attrib *pattrib);
+void update_mgntframe_attrib_addr(struct adapter *padapter,
+				  struct xmit_frame *pmgntframe);
 void dump_mgntframe(struct adapter *padapter, struct xmit_frame *pmgntframe);
-s32 dump_mgntframe_and_wait(struct adapter *padapter, struct xmit_frame *pmgntframe, int timeout_ms);
-s32 dump_mgntframe_and_wait_ack(struct adapter *padapter, struct xmit_frame *pmgntframe);
+s32 dump_mgntframe_and_wait(struct adapter *padapter,
+			    struct xmit_frame *pmgntframe, int timeout_ms);
+s32 dump_mgntframe_and_wait_ack(struct adapter *padapter,
+				struct xmit_frame *pmgntframe);
 
 void issue_beacon(struct adapter *padapter, int timeout_ms);
-void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p_probereq);
+void issue_probersp(struct adapter *padapter, unsigned char *da,
+		    u8 is_valid_p2p_probereq);
 void issue_assocreq(struct adapter *padapter);
-void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_info *pstat, int pkt_type);
-void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short status);
-void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da);
-s32 issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da, u8 ch, bool append_wps, int try_cnt, int wait_ms);
-int issue_nulldata(struct adapter *padapter, unsigned char *da, unsigned int power_mode, int try_cnt, int wait_ms);
+void issue_asocrsp(struct adapter *padapter, unsigned short status,
+		   struct sta_info *pstat, int pkt_type);
+void issue_auth(struct adapter *padapter, struct sta_info *psta,
+		unsigned short status);
+void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *pssid,
+		    u8 *da);
+s32 issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid,
+		      u8 *da, u8 ch, bool append_wps, int try_cnt, int wait_ms);
+int issue_nulldata(struct adapter *padapter, unsigned char *da,
+		   unsigned int power_mode, int try_cnt, int wait_ms);
 s32 issue_nulldata_in_interrupt(struct adapter *padapter, u8 *da);
-int issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16 tid, int try_cnt, int wait_ms);
-int issue_deauth(struct adapter *padapter, unsigned char *da, unsigned short reason);
-int issue_deauth_ex(struct adapter *padapter, u8 *da, unsigned short reason, int try_cnt, int wait_ms);
-void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned char action, unsigned short status);
-void issue_action_SA_Query(struct adapter *padapter, unsigned char *raddr, unsigned char action, unsigned short tid);
+int issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16 tid,
+		       int try_cnt, int wait_ms);
+int issue_deauth(struct adapter *padapter, unsigned char *da,
+		 unsigned short reason);
+int issue_deauth_ex(struct adapter *padapter, u8 *da, unsigned short reason,
+		    int try_cnt, int wait_ms);
+void issue_action_BA(struct adapter *padapter, unsigned char *raddr,
+		     unsigned char action, unsigned short status);
+void issue_action_SA_Query(struct adapter *padapter, unsigned char *raddr,
+			   unsigned char action, unsigned short tid);
 unsigned int send_delba(struct adapter *padapter, u8 initiator, u8 *addr);
 unsigned int send_beacon(struct adapter *padapter);
 
@@ -562,28 +594,41 @@ void start_clnt_auth(struct adapter *padapter);
 void start_clnt_join(struct adapter *padapter);
 void start_create_ibss(struct adapter *padapter);
 
-unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame);
-unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame);
-unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame);
-unsigned int OnProbeRsp(struct adapter *padapter, union recv_frame *precv_frame);
-unsigned int DoReserved(struct adapter *padapter, union recv_frame *precv_frame);
+unsigned int OnAssocReq(struct adapter *padapter,
+			union recv_frame *precv_frame);
+unsigned int OnAssocRsp(struct adapter *padapter,
+			union recv_frame *precv_frame);
+unsigned int OnProbeReq(struct adapter *padapter,
+			union recv_frame *precv_frame);
+unsigned int OnProbeRsp(struct adapter *padapter,
+			union recv_frame *precv_frame);
+unsigned int DoReserved(struct adapter *padapter,
+			union recv_frame *precv_frame);
 unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame);
 unsigned int OnAtim(struct adapter *padapter, union recv_frame *precv_frame);
-unsigned int OnDisassoc(struct adapter *padapter, union recv_frame *precv_frame);
+unsigned int OnDisassoc(struct adapter *padapter,
+			union recv_frame *precv_frame);
 unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame);
-unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_frame);
+unsigned int OnAuthClient(struct adapter *padapter,
+			  union recv_frame *precv_frame);
 unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame);
 unsigned int OnAction(struct adapter *padapter, union recv_frame *precv_frame);
 
-unsigned int on_action_spct(struct adapter *padapter, union recv_frame *precv_frame);
-unsigned int OnAction_back(struct adapter *padapter, union recv_frame *precv_frame);
-unsigned int on_action_public(struct adapter *padapter, union recv_frame *precv_frame);
-unsigned int OnAction_ht(struct adapter *padapter, union recv_frame *precv_frame);
-unsigned int OnAction_sa_query(struct adapter *padapter, union recv_frame *precv_frame);
+unsigned int on_action_spct(struct adapter *padapter,
+			    union recv_frame *precv_frame);
+unsigned int OnAction_back(struct adapter *padapter,
+			   union recv_frame *precv_frame);
+unsigned int on_action_public(struct adapter *padapter,
+			      union recv_frame *precv_frame);
+unsigned int OnAction_ht(struct adapter *padapter,
+			 union recv_frame *precv_frame);
+unsigned int OnAction_sa_query(struct adapter *padapter,
+			       union recv_frame *precv_frame);
 
 void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res);
 void mlmeext_sta_del_event_callback(struct adapter *padapter);
-void mlmeext_sta_add_event_callback(struct adapter *padapter, struct sta_info *psta);
+void mlmeext_sta_add_event_callback(struct adapter *padapter,
+				    struct sta_info *psta);
 
 void linked_status_chk(struct adapter *padapter);
 
@@ -596,35 +641,38 @@ void sa_query_timer_hdl(struct timer_list *t);
 /* void reauth_timer_hdl(struct adapter *padapter); */
 /* void reassoc_timer_hdl(struct adapter *padapter); */
 
-#define set_survey_timer(mlmeext, ms) \
-	do { \
+#define set_survey_timer(mlmeext, ms)                       \
+	do {                                                \
 		_set_timer(&(mlmeext)->survey_timer, (ms)); \
 	} while (0)
 
-#define set_link_timer(mlmeext, ms) \
-	do { \
+#define set_link_timer(mlmeext, ms)                       \
+	do {                                              \
 		_set_timer(&(mlmeext)->link_timer, (ms)); \
 	} while (0)
-#define set_sa_query_timer(mlmeext, ms) \
-	do { \
+#define set_sa_query_timer(mlmeext, ms)                       \
+	do {                                                  \
 		_set_timer(&(mlmeext)->sa_query_timer, (ms)); \
 	} while (0)
 
-extern void process_addba_req(struct adapter *padapter, u8 *paddba_req, u8 *addr);
+extern void process_addba_req(struct adapter *padapter, u8 *paddba_req,
+			      u8 *addr);
 
 extern void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len);
-extern void correct_TSF(struct adapter *padapter, struct mlme_ext_priv *pmlmeext);
-extern void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len);
+extern void correct_TSF(struct adapter *padapter,
+			struct mlme_ext_priv *pmlmeext);
+extern void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe,
+			       uint len);
 extern u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer);
 
-int rtw_chk_start_clnt_join(struct adapter *padapter, u8 *ch, u8 *bw, u8 *offset);
+int rtw_chk_start_clnt_join(struct adapter *padapter, u8 *ch, u8 *bw,
+			    u8 *offset);
 
 struct cmd_hdl {
-	uint	parmsize;
+	uint parmsize;
 	u8 (*h2cfuns)(struct adapter *padapter, u8 *pbuf);
 };
 
-
 u8 read_macreg_hdl(struct adapter *padapter, u8 *pbuf);
 u8 write_macreg_hdl(struct adapter *padapter, u8 *pbuf);
 u8 read_bbreg_hdl(struct adapter *padapter, u8 *pbuf);
@@ -632,7 +680,6 @@ u8 write_bbreg_hdl(struct adapter *padapter, u8 *pbuf);
 u8 read_rfreg_hdl(struct adapter *padapter, u8 *pbuf);
 u8 write_rfreg_hdl(struct adapter *padapter, u8 *pbuf);
 
-
 u8 NULL_hdl(struct adapter *padapter, u8 *pbuf);
 u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf);
 u8 disconnect_hdl(struct adapter *padapter, u8 *pbuf);
@@ -652,25 +699,26 @@ u8 chk_bmc_sleepq_hdl(struct adapter *padapter, unsigned char *pbuf);
 u8 tx_beacon_hdl(struct adapter *padapter, unsigned char *pbuf);
 u8 set_ch_hdl(struct adapter *padapter, u8 *pbuf);
 u8 set_chplan_hdl(struct adapter *padapter, unsigned char *pbuf);
-u8 set_csa_hdl(struct adapter *padapter, unsigned char *pbuf);	/* Kurt: Handling DFS channel switch announcement ie. */
+u8 set_csa_hdl(
+	struct adapter *padapter,
+	unsigned char
+		*pbuf); /* Kurt: Handling DFS channel switch announcement ie. */
 u8 tdls_hdl(struct adapter *padapter, unsigned char *pbuf);
 u8 run_in_thread_hdl(struct adapter *padapter, u8 *pbuf);
 
-
-#define GEN_DRV_CMD_HANDLER(size, cmd)	{size, &cmd ## _hdl},
-#define GEN_MLME_EXT_HANDLER(size, cmd)	{size, cmd},
+#define GEN_DRV_CMD_HANDLER(size, cmd) { size, &cmd##_hdl },
+#define GEN_MLME_EXT_HANDLER(size, cmd) { size, cmd },
 
 struct C2HEvent_Header {
-
 #ifdef __LITTLE_ENDIAN
 
-	unsigned int len:16;
-	unsigned int ID:8;
-	unsigned int seq:8;
+	unsigned int len : 16;
+	unsigned int ID : 8;
+	unsigned int seq : 8;
 #else
-	unsigned int seq:8;
-	unsigned int ID:8;
-	unsigned int len:16;
+	unsigned int seq : 8;
+	unsigned int ID : 8;
+	unsigned int len : 16;
 #endif
 	unsigned int rsvd;
 };
@@ -679,39 +727,38 @@ void rtw_dummy_event_callback(struct adapter *adapter, u8 *pbuf);
 void rtw_fwdbg_event_callback(struct adapter *adapter, u8 *pbuf);
 
 enum {
-	GEN_EVT_CODE(_Read_MACREG) = 0, /*0*/
+	GEN_EVT_CODE(READ_MACREG) = 0, /*0*/
 	GEN_EVT_CODE(_Read_BBREG),
 	GEN_EVT_CODE(_Read_RFREG),
 	GEN_EVT_CODE(_Read_EEPROM),
 	GEN_EVT_CODE(_Read_EFUSE),
-	GEN_EVT_CODE(_Read_CAM),			/*5*/
+	GEN_EVT_CODE(_Read_CAM), /*5*/
 	GEN_EVT_CODE(_Get_BasicRate),
 	GEN_EVT_CODE(_Get_DataRate),
-	GEN_EVT_CODE(_Survey),	 /*8*/
-	GEN_EVT_CODE(_SurveyDone),	 /*9*/
+	GEN_EVT_CODE(_Survey), /*8*/
+	GEN_EVT_CODE(_SurveyDone), /*9*/
 
 	GEN_EVT_CODE(_JoinBss), /*10*/
 	GEN_EVT_CODE(_AddSTA),
 	GEN_EVT_CODE(_DelSTA),
 	GEN_EVT_CODE(_AtimDone),
 	GEN_EVT_CODE(_TX_Report),
-	GEN_EVT_CODE(_CCX_Report),			/*15*/
+	GEN_EVT_CODE(_CCX_Report), /*15*/
 	GEN_EVT_CODE(_DTM_Report),
 	GEN_EVT_CODE(_TX_Rate_Statistics),
 	GEN_EVT_CODE(_C2HLBK),
 	GEN_EVT_CODE(_FWDBG),
-	GEN_EVT_CODE(_C2HFEEDBACK),               /*20*/
+	GEN_EVT_CODE(_C2HFEEDBACK), /*20*/
 	GEN_EVT_CODE(_ADDBA),
 	GEN_EVT_CODE(_C2HBCN),
-	GEN_EVT_CODE(_ReportPwrState),		/* filen: only for PCIE, USB */
-	GEN_EVT_CODE(_CloseRF),				/* filen: only for PCIE, work around ASPM */
-	GEN_EVT_CODE(_WMM),					/*25*/
+	GEN_EVT_CODE(_ReportPwrState), /* filen: only for PCIE, USB */
+	GEN_EVT_CODE(_CloseRF), /* filen: only for PCIE, work around ASPM */
+	GEN_EVT_CODE(_WMM), /*25*/
 	MAX_C2HEVT
 };
 
-
 #ifdef _RTW_MLME_EXT_C_
 
-#endif/* _RTL8192C_CMD_C_ */
+#endif /* _RTL8192C_CMD_C_ */
 
 #endif
-- 
2.53.0

