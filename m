Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1241862A
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 00:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775002169; cv=none; b=tr2FAHTLwyP0WwDeSO9nxPo8iwGguO1iZQQ1M12gkBXUx/A/IuYiLJRyMWgICGB0WHfk3xlH+lpH/LitGv5tlnkbPg/X2XLKVkBRL2o2p2E/x3ZJRyEXIK1loLpgli1DEBa3LUAt9GjfBf5+QW1EYz/H4ijJjA7L0r5MOQHDT7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775002169; c=relaxed/simple;
	bh=eOeXIKUH9fCvAiVOmGpKlAllxlXTrlykjcwSAkTmXpY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cu67PykQ4K+K3QUxt/113WfzQy1EpiHgTkq6G2cWrwzfG/dJ2TC2GG6zl4cJ6zlS9dtJ88SaQXA77VdMENNEFtBvbmxJ0xe3wv/7FJnNUhgnLM+1lx799i8klPIYXDMxGwImwQRoEQV0ePzmv6gIaoLC1DXSTH7IZ5tkSASZqTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mNftUlfu; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNftUlfu"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8cfc2d1fdbfso534891885a.3
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 17:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775002166; x=1775606966; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vyMAvldIKlGr5P9iR852ZGqxGZPnzPhwb3E0JZOrwv8=;
        b=mNftUlfu5+iORE8miAnOtMsqq8VBXyvv9CalGye8zczzLirYqNr4eFl9VDBIBY64ir
         Ys/hEtT1hFCFNZnfC37ioo4Sx+EJ7aKbpinZRqJrzgWUN4mk/OKY34vsXEb5ZHPT2aEv
         pSrmz81hN46ixpgfwyN4mYeAapl7DpdRCofg9dwQo7y1WmKj/wah58GbRvNX5csMfr0d
         va27m4b/MfNsV5lI4D2P2aJIhpSM3epgE2o+96BearygzqkGLXlNJNDEi05Cinx8I7Gu
         PZmFIvG7H6Of7REK6sNVrcrMuxnUkNlJGbYv4eEceBGSscfWhInyIZsPaKFCx3NoCJ4t
         gLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775002166; x=1775606966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vyMAvldIKlGr5P9iR852ZGqxGZPnzPhwb3E0JZOrwv8=;
        b=DBEa9NnYFrNRoAifWkMIB3MkBOMLK6qWoay5IovDzfXetAcHsvgB1Uylcem4pmJpdZ
         QnP3AuKeTIqLZjupa9g8mCRmpgkpFnM7/1iW0ye7QgqaYssee7wHSNoJm8Mj68hY0+AF
         62kbqVyOWHy94KGt3j9PNsCXtfwbJc3BTk6uqfAhM05p3d15n7UHteaipGUeHotInPs6
         OxibEnZVXxT6xUwjgjOvuLPtLvdklb3ARmYmPdJTqbe4mGr3TZuHZKhu4I9BHe/BurXZ
         NOA9RzgA+ZC4No03XCpIramKAbwC2dz+gjID0RkrfwZOONC/5ite5+4ZCuVooMaW7Apb
         Hn3A==
X-Gm-Message-State: AOJu0YzidljpaX7BshQrGWMu4Gk7PfUW09e6ysh/jFtZuzA/mRtcR/L/
	j7fAYDqfflYDRc6DGQ7mnx2fRS9GbUkiFjHblAVmttSo+yrbi9N+GO/g
X-Gm-Gg: ATEYQzzTEh81Y1OTdNvebdPa7kMqIUtg6tbF24jKqlAkmpnHpNu2gXobu0mtIAkOjve
	kZ9a4W6sQNg7bSrER+Rodz0l+ceVHRDjM5VjG2qPFAxRnCQjWXyC65xvsZo3w3uCjePDIPaAVUj
	AsA49rlWi+Gu2D08TFkmqma6E9Rx/No/0PVQkNeg50H2RTlmIK/dKShKGpr5Y+nI6RPYvxRcsrZ
	BxQA1xEExVWfJjYv6XcXzblgksaRDCI1/ika5GOCCKfH5mW6CXWs3C5C+7e+3U586MgTbONmyr7
	xUXIiGGrV8DdwuHTuZxDVoPL+J7oahTfg5lxi94uxU7BGD84/tfmnOdQZekhoZPq8F34DRfHj4E
	7Eh1gfsp8jEMJiBlZioVdf9+8jTOuLyKvEucSXn4N3wy0vdtM+d9Rx2n0SI7LS8MgmmWlkX2V
X-Received: by 2002:a05:6214:328f:b0:89c:43a5:45ab with SMTP id 6a1803df08f44-8a436a18989mr26818156d6.7.1775002166049;
        Tue, 31 Mar 2026 17:09:26 -0700 (PDT)
Received: from r9 ([2601:5c2:100:2f60::418e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecb5ce7f0sm101814026d6.8.2026.03.31.17.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 17:09:25 -0700 (PDT)
From: Xiyuan Guo <tommyguo039@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiyuan Guo <tommyguo039@gmail.com>
Subject: [PATCH v1] staging: rtl8723bs: remove GEN_CMD_CODE macro and callback array
Date: Tue, 31 Mar 2026 20:08:18 -0400
Message-ID: <20260401000818.51141-1-tommyguo039@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GEN_CMD_CODE macro and the rtw_cmd_callback function pointer array
add unnecessary layers of indirection and make the code difficult to
follow.

Remove the GEN_CMD_CODE macro and replace the function pointer array
dispatcher in rtw_cmd_thread() with a switch statement.

Signed-off-by: Xiyuan Guo <tommyguo039@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c       |   4 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 155 ++++++------------
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |   4 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  18 +-
 drivers/staging/rtl8723bs/include/rtw_cmd.h   | 154 +++++++++--------
 5 files changed, 134 insertions(+), 201 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 4cdcdddf6b33..9a451fe0cce3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1237,7 +1237,7 @@ u8 rtw_ap_set_pairwise_key(struct adapter *padapter, struct sta_info *psta)
 		goto exit;
 	}
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, _SetStaKey_CMD_);
+	init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, _SetStaKey);
 
 	psetstakey_para->algorithm = (u8)psta->dot118021XPrivacy;
 
@@ -1300,7 +1300,7 @@ static int rtw_ap_set_key(struct adapter *padapter,
 
 	memcpy(&psetkeyparm->key[0], key, keylen);
 
-	pcmd->cmdcode = _SetKey_CMD_;
+	pcmd->cmdcode = _SetKey;
 	pcmd->parmbuf = (u8 *)psetkeyparm;
 	pcmd->cmdsz =  (sizeof(struct setkey_parm));
 	pcmd->rsp = NULL;
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index c1185c25ed36..d35b91cbdeaa 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -10,81 +10,6 @@
 #include <linux/align.h>
 #include <linux/delay.h>
 
-static struct _cmd_callback rtw_cmd_callback[] = {
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
-};
-
 static struct cmd_hdl wlancmds[] = {
 	GEN_DRV_CMD_HANDLER(0, NULL) /*0*/
 	GEN_DRV_CMD_HANDLER(0, NULL)
@@ -301,7 +226,7 @@ int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
 {
 	u8 bAllow = false; /* set to true to allow enqueuing cmd when hw_init_completed is false */
 
-	if (cmd_obj->cmdcode == GEN_CMD_CODE(_SetChannelPlan))
+	if (cmd_obj->cmdcode == _SetChannelPlan)
 		bAllow = true;
 
 	if ((!pcmdpriv->padapter->hw_init_completed && !bAllow) ||
@@ -343,8 +268,8 @@ struct	cmd_obj	*rtw_dequeue_cmd(struct cmd_priv *pcmdpriv)
 
 void rtw_free_cmd_obj(struct cmd_obj *pcmd)
 {
-	if ((pcmd->cmdcode != _JoinBss_CMD_) &&
-	    (pcmd->cmdcode != _CreateBss_CMD_)) {
+	if ((pcmd->cmdcode != _JoinBss) &&
+	    (pcmd->cmdcode != _CreateBss)) {
 		/* free parmbuf in cmd_obj */
 		kfree(pcmd->parmbuf);
 	}
@@ -478,16 +403,32 @@ int rtw_cmd_thread(void *context)
 		}
 
 		/* call callback function for post-processed */
-		if (pcmd->cmdcode < ARRAY_SIZE(rtw_cmd_callback)) {
-			pcmd_callback = rtw_cmd_callback[pcmd->cmdcode].callback;
-			if (!pcmd_callback) {
-				rtw_free_cmd_obj(pcmd);
-			} else {
-				/* todo: !!! fill rsp_buf to pcmd->rsp if (pcmd->rsp!= NULL) */
-				pcmd_callback(pcmd->padapter, pcmd);/* need consider that free cmd_obj in rtw_cmd_callback */
-			}
-		} else {
+		switch (pcmd->cmdcode) {
+		case _Read_BBREG:
+		case _Read_RFREG:
+			rtw_getbbrfreg_cmdrsp_callback(padapter, pcmd);
+			break;
+		case _JoinBss:
+			rtw_joinbss_cmd_callback(padapter, pcmd);
+			break;
+		case _DisConnect:
+			rtw_disassoc_cmd_callback(padapter, pcmd);
+			break;
+		case _CreateBss:
+			rtw_createbss_cmd_callback(padapter, pcmd);
+			break;
+		case _SiteSurvey:
+			rtw_survey_cmd_callback(padapter, pcmd);
+			break;
+		case _SetStaKey:
+			rtw_setstaKey_cmdrsp_callback(padapter, pcmd);
+			break;
+		case _SetAssocSta:
+			rtw_setassocsta_cmdrsp_callback(padapter, pcmd);
+			break;
+		default:
 			rtw_free_cmd_obj(pcmd);
+			break;
 		}
 		flush_signals_thread();
 		goto _next;
@@ -501,7 +442,7 @@ int rtw_cmd_thread(void *context)
 			break;
 		}
 
-		if (pcmd->cmdcode == GEN_CMD_CODE(_Set_Drv_Extra)) {
+		if (pcmd->cmdcode == _Set_Drv_Extra) {
 			extra_parm = (struct drvextra_cmd_parm *)pcmd->parmbuf;
 			if (extra_parm->pbuf && extra_parm->size > 0)
 				kfree(extra_parm->pbuf);
@@ -546,7 +487,7 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 
 	rtw_free_network_queue(padapter, false);
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, psurveyPara, GEN_CMD_CODE(_SiteSurvey));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, psurveyPara, _SiteSurvey);
 
 	/* psurveyPara->bsslimit = 48; */
 	psurveyPara->scan_mode = pmlmepriv->scan_mode;
@@ -609,7 +550,7 @@ u8 rtw_createbss_cmd(struct adapter  *padapter)
 	}
 
 	INIT_LIST_HEAD(&pcmd->list);
-	pcmd->cmdcode = _CreateBss_CMD_;
+	pcmd->cmdcode = _CreateBss;
 	pcmd->parmbuf = (unsigned char *)pdev_network;
 	pcmd->cmdsz = get_wlan_bssid_ex_sz((struct wlan_bssid_ex *)pdev_network);
 	pcmd->rsp = NULL;
@@ -642,7 +583,7 @@ int rtw_startbss_cmd(struct adapter  *padapter, int flags)
 		}
 
 		INIT_LIST_HEAD(&pcmd->list);
-		pcmd->cmdcode = GEN_CMD_CODE(_CreateBss);
+		pcmd->cmdcode = _CreateBss;
 		pcmd->parmbuf = NULL;
 		pcmd->cmdsz =  0;
 		pcmd->rsp = NULL;
@@ -777,7 +718,7 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	pcmd->cmdsz = get_wlan_bssid_ex_sz(psecnetwork);/* get cmdsz before endian conversion */
 
 	INIT_LIST_HEAD(&pcmd->list);
-	pcmd->cmdcode = _JoinBss_CMD_;/* GEN_CMD_CODE(_JoinBss) */
+	pcmd->cmdcode = _JoinBss;
 	pcmd->parmbuf = (unsigned char *)psecnetwork;
 	pcmd->rsp = NULL;
 	pcmd->rspsz = 0;
@@ -811,7 +752,7 @@ u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueu
 			kfree(param);
 			goto exit;
 		}
-		init_h2fwcmd_w_parm_no_rsp(cmdobj, param, _DisConnect_CMD_);
+		init_h2fwcmd_w_parm_no_rsp(cmdobj, param, _DisConnect);
 		res = rtw_enqueue_cmd(cmdpriv, cmdobj);
 	} else {
 		/* no need to enqueue, do the cmd hdl directly and free cmd parameter */
@@ -847,7 +788,7 @@ u8 rtw_setopmode_cmd(struct adapter  *padapter, enum ndis_802_11_network_infrast
 			goto exit;
 		}
 
-		init_h2fwcmd_w_parm_no_rsp(ph2c, psetop, _SetOpMode_CMD_);
+		init_h2fwcmd_w_parm_no_rsp(ph2c, psetop, _SetOpMode);
 		res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 	} else {
 		setopmode_hdl(padapter, (u8 *)psetop);
@@ -904,7 +845,7 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 			goto exit;
 		}
 
-		init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, _SetStaKey_CMD_);
+		init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, _SetStaKey);
 		ph2c->rsp = (u8 *)psetstakey_rsp;
 		ph2c->rspsz = sizeof(struct set_stakey_rsp);
 		res = rtw_enqueue_cmd(pcmdpriv, ph2c);
@@ -955,7 +896,7 @@ u8 rtw_clearstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 enqueu
 			goto exit;
 		}
 
-		init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, _SetStaKey_CMD_);
+		init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, _SetStaKey);
 		ph2c->rsp = (u8 *)psetstakey_rsp;
 		ph2c->rspsz = sizeof(struct set_stakey_rsp);
 
@@ -993,7 +934,7 @@ u8 rtw_addbareq_cmd(struct adapter *padapter, u8 tid, u8 *addr)
 	paddbareq_parm->tid = tid;
 	memcpy(paddbareq_parm->addr, addr, ETH_ALEN);
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, paddbareq_parm, GEN_CMD_CODE(_AddBAReq));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, paddbareq_parm, _AddBAReq);
 
 	/* rtw_enqueue_cmd(pcmdpriv, ph2c); */
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
@@ -1028,7 +969,7 @@ u8 rtw_reset_securitypriv_cmd(struct adapter *padapter)
 	pdrvextra_cmd_parm->size = 0;
 	pdrvextra_cmd_parm->pbuf = NULL;
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, _Set_Drv_Extra);
 
 	/* rtw_enqueue_cmd(pcmdpriv, ph2c); */
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
@@ -1061,7 +1002,7 @@ u8 rtw_free_assoc_resources_cmd(struct adapter *padapter)
 	pdrvextra_cmd_parm->size = 0;
 	pdrvextra_cmd_parm->pbuf = NULL;
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, _Set_Drv_Extra);
 
 	/* rtw_enqueue_cmd(pcmdpriv, ph2c); */
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
@@ -1094,7 +1035,7 @@ u8 rtw_dynamic_chk_wk_cmd(struct adapter *padapter)
 	pdrvextra_cmd_parm->type = 0;
 	pdrvextra_cmd_parm->size = 0;
 	pdrvextra_cmd_parm->pbuf = NULL;
-	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, _Set_Drv_Extra);
 
 	/* rtw_enqueue_cmd(pcmdpriv, ph2c); */
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
@@ -1343,7 +1284,7 @@ u8 rtw_lps_ctrl_wk_cmd(struct adapter *padapter, u8 lps_ctrl_type, u8 enqueue)
 		pdrvextra_cmd_parm->size = 0;
 		pdrvextra_cmd_parm->pbuf = NULL;
 
-		init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+		init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, _Set_Drv_Extra);
 
 		res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 	} else {
@@ -1384,7 +1325,7 @@ u8 rtw_dm_in_lps_wk_cmd(struct adapter *padapter)
 	pdrvextra_cmd_parm->size = 0;
 	pdrvextra_cmd_parm->pbuf = NULL;
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, _Set_Drv_Extra);
 
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 
@@ -1446,7 +1387,7 @@ u8 rtw_dm_ra_mask_wk_cmd(struct adapter *padapter, u8 *psta)
 	pdrvextra_cmd_parm->size = 0;
 	pdrvextra_cmd_parm->pbuf = psta;
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, _Set_Drv_Extra);
 
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 
@@ -1479,7 +1420,7 @@ u8 rtw_ps_cmd(struct adapter *padapter)
 	pdrvextra_cmd_parm->type = 0;
 	pdrvextra_cmd_parm->size = 0;
 	pdrvextra_cmd_parm->pbuf = NULL;
-	init_h2fwcmd_w_parm_no_rsp(ppscmd, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+	init_h2fwcmd_w_parm_no_rsp(ppscmd, pdrvextra_cmd_parm, _Set_Drv_Extra);
 
 	res = rtw_enqueue_cmd(pcmdpriv, ppscmd);
 
@@ -1550,7 +1491,7 @@ u8 rtw_chk_hi_queue_cmd(struct adapter *padapter)
 	pdrvextra_cmd_parm->size = 0;
 	pdrvextra_cmd_parm->pbuf = NULL;
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, _Set_Drv_Extra);
 
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 
@@ -1642,7 +1583,7 @@ u8 rtw_c2h_packet_wk_cmd(struct adapter *padapter, u8 *pbuf, u16 length)
 	pdrvextra_cmd_parm->size = length;
 	pdrvextra_cmd_parm->pbuf = pbuf;
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, _Set_Drv_Extra);
 
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 
@@ -1677,7 +1618,7 @@ u8 rtw_c2h_wk_cmd(struct adapter *padapter, u8 *c2h_evt)
 	pdrvextra_cmd_parm->size =  c2h_evt ? 16 : 0;
 	pdrvextra_cmd_parm->pbuf = c2h_evt;
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, _Set_Drv_Extra);
 
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 5516593bc8ab..c10d93904437 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1881,7 +1881,7 @@ signed int rtw_set_auth(struct adapter *adapter, struct security_priv *psecurity
 
 	psetauthparm->mode = (unsigned char)psecuritypriv->dot11AuthAlgrthm;
 
-	pcmd->cmdcode = _SetAuth_CMD_;
+	pcmd->cmdcode = _SetAuth;
 	pcmd->parmbuf = (unsigned char *)psetauthparm;
 	pcmd->cmdsz =  (sizeof(struct setauth_parm));
 	pcmd->rsp = NULL;
@@ -1952,7 +1952,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 			goto exit;
 		}
 
-		pcmd->cmdcode = _SetKey_CMD_;
+		pcmd->cmdcode = _SetKey;
 		pcmd->parmbuf = (u8 *)psetkeyparm;
 		pcmd->cmdsz =  (sizeof(struct setkey_parm));
 		pcmd->rsp = NULL;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 5f00fe282d1b..573ec37e5554 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4391,7 +4391,7 @@ void report_survey_event(struct adapter *padapter, union recv_frame *precv_frame
 
 	INIT_LIST_HEAD(&pcmd_obj->list);
 
-	pcmd_obj->cmdcode = GEN_CMD_CODE(_Set_MLME_EVT);
+	pcmd_obj->cmdcode = _Set_MLME_EVT;
 	pcmd_obj->cmdsz = cmdsz;
 	pcmd_obj->parmbuf = pevtcmd;
 
@@ -4444,7 +4444,7 @@ void report_surveydone_event(struct adapter *padapter)
 
 	INIT_LIST_HEAD(&pcmd_obj->list);
 
-	pcmd_obj->cmdcode = GEN_CMD_CODE(_Set_MLME_EVT);
+	pcmd_obj->cmdcode = _Set_MLME_EVT;
 	pcmd_obj->cmdsz = cmdsz;
 	pcmd_obj->parmbuf = pevtcmd;
 
@@ -4489,7 +4489,7 @@ void report_join_res(struct adapter *padapter, int res)
 
 	INIT_LIST_HEAD(&pcmd_obj->list);
 
-	pcmd_obj->cmdcode = GEN_CMD_CODE(_Set_MLME_EVT);
+	pcmd_obj->cmdcode = _Set_MLME_EVT;
 	pcmd_obj->cmdsz = cmdsz;
 	pcmd_obj->parmbuf = pevtcmd;
 
@@ -4538,7 +4538,7 @@ void report_wmm_edca_update(struct adapter *padapter)
 
 	INIT_LIST_HEAD(&pcmd_obj->list);
 
-	pcmd_obj->cmdcode = GEN_CMD_CODE(_Set_MLME_EVT);
+	pcmd_obj->cmdcode = _Set_MLME_EVT;
 	pcmd_obj->cmdsz = cmdsz;
 	pcmd_obj->parmbuf = pevtcmd;
 
@@ -4584,7 +4584,7 @@ void report_del_sta_event(struct adapter *padapter, unsigned char *MacAddr, unsi
 
 	INIT_LIST_HEAD(&pcmd_obj->list);
 
-	pcmd_obj->cmdcode = GEN_CMD_CODE(_Set_MLME_EVT);
+	pcmd_obj->cmdcode = _Set_MLME_EVT;
 	pcmd_obj->cmdsz = cmdsz;
 	pcmd_obj->parmbuf = pevtcmd;
 
@@ -4635,7 +4635,7 @@ void report_add_sta_event(struct adapter *padapter, unsigned char *MacAddr, int
 
 	INIT_LIST_HEAD(&pcmd_obj->list);
 
-	pcmd_obj->cmdcode = GEN_CMD_CODE(_Set_MLME_EVT);
+	pcmd_obj->cmdcode = _Set_MLME_EVT;
 	pcmd_obj->cmdsz = cmdsz;
 	pcmd_obj->parmbuf = pevtcmd;
 
@@ -5085,7 +5085,7 @@ void survey_timer_hdl(struct timer_list *t)
 			return;
 		}
 
-		init_h2fwcmd_w_parm_no_rsp(ph2c, psurveyPara, GEN_CMD_CODE(_SiteSurvey));
+		init_h2fwcmd_w_parm_no_rsp(ph2c, psurveyPara, _SiteSurvey);
 		rtw_enqueue_cmd(pcmdpriv, ph2c);
 	}
 }
@@ -5696,7 +5696,7 @@ u8 chk_bmc_sleepq_cmd(struct adapter *padapter)
 		goto exit;
 	}
 
-	init_h2fwcmd_w_parm_no_parm_rsp(ph2c, GEN_CMD_CODE(_ChkBMCSleepq));
+	init_h2fwcmd_w_parm_no_parm_rsp(ph2c, _ChkBMCSleepq);
 
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 
@@ -5734,7 +5734,7 @@ u8 set_tx_beacon_cmd(struct adapter *padapter)
 				      pmlmeinfo->hidden_ssid_mode);
 	ptxBeacon_parm->network.ie_length += len_diff;
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, ptxBeacon_parm, GEN_CMD_CODE(_TX_Beacon));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, ptxBeacon_parm, _TX_Beacon);
 
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
index c4c3edee809d..6dea504cf70e 100644
--- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
@@ -551,9 +551,6 @@ struct RunInThread_param {
 };
 
 
-#define GEN_CMD_CODE(cmd)	cmd ## _CMD_
-
-
 /*
 
 Result:
@@ -624,85 +621,80 @@ extern void rtw_setassocsta_cmdrsp_callback(struct adapter  *padapter,  struct c
 extern void rtw_getrttbl_cmdrsp_callback(struct adapter  *padapter,  struct cmd_obj *pcmd);
 
 
-struct _cmd_callback {
-	u32 cmd_code;
-	void (*callback)(struct adapter  *padapter, struct cmd_obj *cmd);
-};
-
 enum {
-	GEN_CMD_CODE(_Read_MACREG),	/*0*/
-	GEN_CMD_CODE(_Write_MACREG),
-	GEN_CMD_CODE(_Read_BBREG),
-	GEN_CMD_CODE(_Write_BBREG),
-	GEN_CMD_CODE(_Read_RFREG),
-	GEN_CMD_CODE(_Write_RFREG), /*5*/
-	GEN_CMD_CODE(_Read_EEPROM),
-	GEN_CMD_CODE(_Write_EEPROM),
-	GEN_CMD_CODE(_Read_EFUSE),
-	GEN_CMD_CODE(_Write_EFUSE),
-
-	GEN_CMD_CODE(_Read_CAM),	/*10*/
-	GEN_CMD_CODE(_Write_CAM),
-	GEN_CMD_CODE(_setBCNITV),
-	GEN_CMD_CODE(_setMBIDCFG),
-	GEN_CMD_CODE(_JoinBss),   /*14*/
-	GEN_CMD_CODE(_DisConnect), /*15*/
-	GEN_CMD_CODE(_CreateBss),
-	GEN_CMD_CODE(_SetOpMode),
-	GEN_CMD_CODE(_SiteSurvey),  /*18*/
-	GEN_CMD_CODE(_SetAuth),
-
-	GEN_CMD_CODE(_SetKey),	/*20*/
-	GEN_CMD_CODE(_SetStaKey),
-	GEN_CMD_CODE(_SetAssocSta),
-	GEN_CMD_CODE(_DelAssocSta),
-	GEN_CMD_CODE(_SetStaPwrState),
-	GEN_CMD_CODE(_SetBasicRate), /*25*/
-	GEN_CMD_CODE(_GetBasicRate),
-	GEN_CMD_CODE(_SetDataRate),
-	GEN_CMD_CODE(_GetDataRate),
-	GEN_CMD_CODE(_SetPhyInfo),
-
-	GEN_CMD_CODE(_GetPhyInfo),	/*30*/
-	GEN_CMD_CODE(_SetPhy),
-	GEN_CMD_CODE(_GetPhy),
-	GEN_CMD_CODE(_readRssi),
-	GEN_CMD_CODE(_readGain),
-	GEN_CMD_CODE(_SetAtim), /*35*/
-	GEN_CMD_CODE(_SetPwrMode),
-	GEN_CMD_CODE(_JoinbssRpt),
-	GEN_CMD_CODE(_SetRaTable),
-	GEN_CMD_CODE(_GetRaTable),
-
-	GEN_CMD_CODE(_GetCCXReport), /*40*/
-	GEN_CMD_CODE(_GetDTMReport),
-	GEN_CMD_CODE(_GetTXRateStatistics),
-	GEN_CMD_CODE(_SetUsbSuspend),
-	GEN_CMD_CODE(_SetH2cLbk),
-	GEN_CMD_CODE(_AddBAReq), /*45*/
-	GEN_CMD_CODE(_SetChannel), /*46*/
-	GEN_CMD_CODE(_SetTxPower),
-	GEN_CMD_CODE(_SwitchAntenna),
-	GEN_CMD_CODE(_SetCrystalCap),
-	GEN_CMD_CODE(_SetSingleCarrierTx), /*50*/
-
-	GEN_CMD_CODE(_SetSingleToneTx),/*51*/
-	GEN_CMD_CODE(_SetCarrierSuppressionTx),
-	GEN_CMD_CODE(_SetContinuousTx),
-	GEN_CMD_CODE(_SwitchBandwidth), /*54*/
-	GEN_CMD_CODE(_TX_Beacon), /*55*/
-
-	GEN_CMD_CODE(_Set_MLME_EVT), /*56*/
-	GEN_CMD_CODE(_Set_Drv_Extra), /*57*/
-	GEN_CMD_CODE(_Set_H2C_MSG), /*58*/
-
-	GEN_CMD_CODE(_SetChannelPlan), /*59*/
-
-	GEN_CMD_CODE(_SetChannelSwitch), /*60*/
-	GEN_CMD_CODE(_TDLS), /*61*/
-	GEN_CMD_CODE(_ChkBMCSleepq), /*62*/
-
-	GEN_CMD_CODE(_RunInThreadCMD), /*63*/
+	_Read_MACREG,	/*0*/
+	_Write_MACREG,
+	_Read_BBREG,
+	_Write_BBREG,
+	_Read_RFREG,
+	_Write_RFREG, /*5*/
+	_Read_EEPROM,
+	_Write_EEPROM,
+	_Read_EFUSE,
+	_Write_EFUSE,
+
+	_Read_CAM,	/*10*/
+	_Write_CAM,
+	_setBCNITV,
+	_setMBIDCFG,
+	_JoinBss,   /*14*/
+	_DisConnect, /*15*/
+	_CreateBss,
+	_SetOpMode,
+	_SiteSurvey,  /*18*/
+	_SetAuth,
+
+	_SetKey,	/*20*/
+	_SetStaKey,
+	_SetAssocSta,
+	_DelAssocSta,
+	_SetStaPwrState,
+	_SetBasicRate, /*25*/
+	_GetBasicRate,
+	_SetDataRate,
+	_GetDataRate,
+	_SetPhyInfo,
+
+	_GetPhyInfo,	/*30*/
+	_SetPhy,
+	_GetPhy,
+	_readRssi,
+	_readGain,
+	_SetAtim, /*35*/
+	_SetPwrMode,
+	_JoinbssRpt,
+	_SetRaTable,
+	_GetRaTable,
+
+	_GetCCXReport, /*40*/
+	_GetDTMReport,
+	_GetTXRateStatistics,
+	_SetUsbSuspend,
+	_SetH2cLbk,
+	_AddBAReq, /*45*/
+	_SetChannel, /*46*/
+	_SetTxPower,
+	_SwitchAntenna,
+	_SetCrystalCap,
+	_SetSingleCarrierTx, /*50*/
+
+	_SetSingleToneTx,/*51*/
+	_SetCarrierSuppressionTx,
+	_SetContinuousTx,
+	_SwitchBandwidth, /*54*/
+	_TX_Beacon, /*55*/
+
+	_Set_MLME_EVT, /*56*/
+	_Set_Drv_Extra, /*57*/
+	_Set_H2C_MSG, /*58*/
+
+	_SetChannelPlan, /*59*/
+
+	_SetChannelSwitch, /*60*/
+	_TDLS, /*61*/
+	_ChkBMCSleepq, /*62*/
+
+	_RunInThreadCMD, /*63*/
 
 	MAX_H2CCMD
 };
-- 
2.53.0

