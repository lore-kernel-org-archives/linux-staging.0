Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116977081A
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 00:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775177568; cv=none; b=KjLsR3zdAWtMraQUuH7L7DEJ+tMxxJCTOsxlG+1v9r8o20BZ2z+7FVMgLVZJ31S8VhPocDPbUEH9slgI/cC0T/nQ/nu5ThGFHoHw0Jaw7i9883lM8V6n5tVfWYRzdnkI9nvhB04kl2kQB2AcuWhThLqpTOY3lPY3lrrNpUyczxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775177568; c=relaxed/simple;
	bh=hrg5ZlJ5RLtezn2q1eBg5Z3j2cgD4aiuFUiM4+Pd6yU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j351d+0onX5Xje+ewOu4BJHHOL5Cj7CzYKGnIDUpau2SCmbeZbMDwuufVVafNXOd/yD+fo8srgOjboijNzKIhx+AgymuwWLpmyoRrOYF/9R+jmmI6jnRkGkDOXzHJLVQ0Lfoe4p5TBG3VTbaX0VxgSPsLqKZg0dwinnpJX9INuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJ6f12b+; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJ6f12b+"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8cfc1aced74so235242885a.2
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 17:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775177565; x=1775782365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6HIxvU2Y/Ym2MCdnSrZ+l1NSNxHY/SGbRptQm7qkjqU=;
        b=CJ6f12b+0kcgPgDy/MH8t3axOt81QH2H9DweJzjsHvPpEiW/EVbfxHntI8jQ4/cQIt
         wE6vj+zaXkz1a4yQOpOFlWaLeW046ZATOdSPYmKCT8D/ERm0SbT7+klyjz0QDnrdSnYn
         rAb4JRk683C2aTeLU41j8/4BYlOQq10nKkRnrMwR8TFUxKRpFyja3UwERpnCVP9hNuxS
         5KWD/NATE2RkFC8/flrja2kKrayjynnaVzxbjla9txsi5lh1qV9EbKmnzA/GCy4UiEM9
         PCAvp5wGA6MJ/zvoWANciYrROmDycvMmNn1Ks3uxxSrGgpBdTukzdjPDgYyvqEGk33No
         uppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775177565; x=1775782365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6HIxvU2Y/Ym2MCdnSrZ+l1NSNxHY/SGbRptQm7qkjqU=;
        b=XWCoiGykA9R7Ilp5WahYCnBoFWwyh19+i9m8UXM0ky2n4tZrBiAVLnWeNcbJSuABgO
         w7lQJshItyr1HNMCU0+Us+tPyzrdBCRN99laegrjc0K3/aI0JfBEGT0NhCx7sBEE3mm+
         35ZOU+HMVhYUiAz1Yn0rLBxlOkM38UIeMNGrW/eBgfM0QNKd8kXWhGn/KJ7d74aBs1kW
         sEt7y3S+gFeZXhLsLW2shbZ2Is4TfVx5Ok6BRfLVg9vSUo/dlftfgxNOJ/UEACUbpYUh
         g400yY4wUT+9J+1+oLijbkAacfbYyHMqeXCud1moZam1NHlA5OzOJBsVBxCS3vkqxO+h
         jgGw==
X-Gm-Message-State: AOJu0YyzXp3jGFZhCO1/dLGRVU+rZWjPSMF/7oXjh4H7EJ/zZ3oLxIzt
	u/oEISDZ6v5R+1895fINYs91/bfhG8/YoKYxjvkhVuYaXanp9L634bb6
X-Gm-Gg: ATEYQzxr4ETCc7S2EEgACfZpy2mraggURpndjBInbxJIKIkQ9rZZ9DM3oz82F5dU6jC
	+lq15p3MNX7w6C1KZj8X3QedcnPZnfMFNlwul8gf1KQZyfxVnzOb3Lfkj660XdhR1CIaUnFWQMD
	hXC5C80SYUapElVhDljrugbTUr4ySvhu1EIe+BhVijN4mXkyzMN0luFoiBsnLL0BUlQXfF1kLTe
	kNY3xnjul5mSbYu4l+8frmucw67lk5F3EqauFK2HP3tn/WXSTj4kZhVf5nFg25wBrzyOo0l+sgM
	ORxUyHX0OOXFpPjRzAwDEczFgj5V/vK7EFe0Ij2PLSC9PQ35aS9blAQHtmmwmy8pq1uc8k9+nkD
	bHH+c/AlWeVVJYsYcMYDSOszc77RTkWVJ7b8uRJOm4WUCHhOObiUvFov6cI2hUgsrI1QsVga6
X-Received: by 2002:a05:620a:6cc2:b0:8cf:e208:eea6 with SMTP id af79cd13be357-8d41c0ca87cmr216491185a.65.1775177564753;
        Thu, 02 Apr 2026 17:52:44 -0700 (PDT)
Received: from r9 ([2601:5c2:100:2f60::418e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a864b516sm357126285a.37.2026.04.02.17.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 17:52:44 -0700 (PDT)
From: Xiyuan Guo <tommyguo039@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	b9788213@gmail.com,
	Xiyuan Guo <tommyguo039@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: remove GEN_CMD_CODE macro and callback array
Date: Thu,  2 Apr 2026 20:51:58 -0400
Message-ID: <20260403005218.300096-1-tommyguo039@gmail.com>
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
follow. Remove the GEN_CMD_CODE macro and replace the function pointer
array dispatcher in rtw_cmd_thread() with a direct switch statement.

Additionally, rename the associated command enums from CamelCase to
UPPERCASE_SNAKE_CASE to comply with the standard Linux kernel coding
style.

Signed-off-by: Xiyuan Guo <tommyguo039@gmail.com>
---
Change in v3:
- Dropped unrelated whitespace cleanup on the #endif comment.

Changes in v2:
- Fixed compilation error caused by missed CamelCase conversions.
- Restored accidentally deleted todo comment in rtw_cmd_thread().
- Renamed command enums from CamelCase to UPPERCASE_SNAKE_CASE.

 drivers/staging/rtl8723bs/core/rtw_ap.c       |   4 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 157 ++++++-----------
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |   4 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  20 +--
 drivers/staging/rtl8723bs/include/rtw_cmd.h   | 162 +++++++++---------
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  14 +-
 6 files changed, 147 insertions(+), 214 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 4cdcdddf6b33..b9586b339095 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1237,7 +1237,7 @@ u8 rtw_ap_set_pairwise_key(struct adapter *padapter, struct sta_info *psta)
 		goto exit;
 	}
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, _SetStaKey_CMD_);
+	init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, SET_STA_KEY);
 
 	psetstakey_para->algorithm = (u8)psta->dot118021XPrivacy;
 
@@ -1300,7 +1300,7 @@ static int rtw_ap_set_key(struct adapter *padapter,
 
 	memcpy(&psetkeyparm->key[0], key, keylen);
 
-	pcmd->cmdcode = _SetKey_CMD_;
+	pcmd->cmdcode = SET_KEY;
 	pcmd->parmbuf = (u8 *)psetkeyparm;
 	pcmd->cmdsz =  (sizeof(struct setkey_parm));
 	pcmd->rsp = NULL;
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index c1185c25ed36..d1e290daae0d 100644
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
+	if (cmd_obj->cmdcode == SET_CHANNEL_PLAN)
 		bAllow = true;
 
 	if ((!pcmdpriv->padapter->hw_init_completed && !bAllow) ||
@@ -343,8 +268,8 @@ struct	cmd_obj	*rtw_dequeue_cmd(struct cmd_priv *pcmdpriv)
 
 void rtw_free_cmd_obj(struct cmd_obj *pcmd)
 {
-	if ((pcmd->cmdcode != _JoinBss_CMD_) &&
-	    (pcmd->cmdcode != _CreateBss_CMD_)) {
+	if ((pcmd->cmdcode != JOIN_BSS) &&
+	    (pcmd->cmdcode != CREATE_BSS)) {
 		/* free parmbuf in cmd_obj */
 		kfree(pcmd->parmbuf);
 	}
@@ -377,7 +302,6 @@ int rtw_cmd_thread(void *context)
 	struct cmd_obj *pcmd;
 	u8 *pcmdbuf;
 	u8 (*cmd_hdl)(struct adapter *padapter, u8 *pbuf);
-	void (*pcmd_callback)(struct adapter *dev, struct cmd_obj *pcmd);
 	struct adapter *padapter = context;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	struct drvextra_cmd_parm *extra_parm = NULL;
@@ -478,16 +402,33 @@ int rtw_cmd_thread(void *context)
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
+		/* todo: !!! fill rsp_buf to pcmd->rsp if (pcmd->rsp != NULL) */
+		switch (pcmd->cmdcode) {
+		case READ_BBREG:
+		case READ_RFREG:
+			rtw_getbbrfreg_cmdrsp_callback(padapter, pcmd);
+			break;
+		case JOIN_BSS:
+			rtw_joinbss_cmd_callback(padapter, pcmd);
+			break;
+		case DISCONNECT:
+			rtw_disassoc_cmd_callback(padapter, pcmd);
+			break;
+		case CREATE_BSS:
+			rtw_createbss_cmd_callback(padapter, pcmd);
+			break;
+		case SITE_SURVEY:
+			rtw_survey_cmd_callback(padapter, pcmd);
+			break;
+		case SET_STA_KEY:
+			rtw_setstaKey_cmdrsp_callback(padapter, pcmd);
+			break;
+		case SET_ASSOC_STA:
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
+		if (pcmd->cmdcode == SET_DRV_EXTRA) {
 			extra_parm = (struct drvextra_cmd_parm *)pcmd->parmbuf;
 			if (extra_parm->pbuf && extra_parm->size > 0)
 				kfree(extra_parm->pbuf);
@@ -546,7 +487,7 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 
 	rtw_free_network_queue(padapter, false);
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, psurveyPara, GEN_CMD_CODE(_SiteSurvey));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, psurveyPara, SITE_SURVEY);
 
 	/* psurveyPara->bsslimit = 48; */
 	psurveyPara->scan_mode = pmlmepriv->scan_mode;
@@ -609,7 +550,7 @@ u8 rtw_createbss_cmd(struct adapter  *padapter)
 	}
 
 	INIT_LIST_HEAD(&pcmd->list);
-	pcmd->cmdcode = _CreateBss_CMD_;
+	pcmd->cmdcode = CREATE_BSS;
 	pcmd->parmbuf = (unsigned char *)pdev_network;
 	pcmd->cmdsz = get_wlan_bssid_ex_sz((struct wlan_bssid_ex *)pdev_network);
 	pcmd->rsp = NULL;
@@ -642,7 +583,7 @@ int rtw_startbss_cmd(struct adapter  *padapter, int flags)
 		}
 
 		INIT_LIST_HEAD(&pcmd->list);
-		pcmd->cmdcode = GEN_CMD_CODE(_CreateBss);
+		pcmd->cmdcode = CREATE_BSS;
 		pcmd->parmbuf = NULL;
 		pcmd->cmdsz =  0;
 		pcmd->rsp = NULL;
@@ -777,7 +718,7 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	pcmd->cmdsz = get_wlan_bssid_ex_sz(psecnetwork);/* get cmdsz before endian conversion */
 
 	INIT_LIST_HEAD(&pcmd->list);
-	pcmd->cmdcode = _JoinBss_CMD_;/* GEN_CMD_CODE(_JoinBss) */
+	pcmd->cmdcode = JOIN_BSS;
 	pcmd->parmbuf = (unsigned char *)psecnetwork;
 	pcmd->rsp = NULL;
 	pcmd->rspsz = 0;
@@ -811,7 +752,7 @@ u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueu
 			kfree(param);
 			goto exit;
 		}
-		init_h2fwcmd_w_parm_no_rsp(cmdobj, param, _DisConnect_CMD_);
+		init_h2fwcmd_w_parm_no_rsp(cmdobj, param, DISCONNECT);
 		res = rtw_enqueue_cmd(cmdpriv, cmdobj);
 	} else {
 		/* no need to enqueue, do the cmd hdl directly and free cmd parameter */
@@ -847,7 +788,7 @@ u8 rtw_setopmode_cmd(struct adapter  *padapter, enum ndis_802_11_network_infrast
 			goto exit;
 		}
 
-		init_h2fwcmd_w_parm_no_rsp(ph2c, psetop, _SetOpMode_CMD_);
+		init_h2fwcmd_w_parm_no_rsp(ph2c, psetop, SET_OP_MODE);
 		res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 	} else {
 		setopmode_hdl(padapter, (u8 *)psetop);
@@ -904,7 +845,7 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 			goto exit;
 		}
 
-		init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, _SetStaKey_CMD_);
+		init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, SET_STA_KEY);
 		ph2c->rsp = (u8 *)psetstakey_rsp;
 		ph2c->rspsz = sizeof(struct set_stakey_rsp);
 		res = rtw_enqueue_cmd(pcmdpriv, ph2c);
@@ -955,7 +896,7 @@ u8 rtw_clearstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 enqueu
 			goto exit;
 		}
 
-		init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, _SetStaKey_CMD_);
+		init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, SET_STA_KEY);
 		ph2c->rsp = (u8 *)psetstakey_rsp;
 		ph2c->rspsz = sizeof(struct set_stakey_rsp);
 
@@ -993,7 +934,7 @@ u8 rtw_addbareq_cmd(struct adapter *padapter, u8 tid, u8 *addr)
 	paddbareq_parm->tid = tid;
 	memcpy(paddbareq_parm->addr, addr, ETH_ALEN);
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, paddbareq_parm, GEN_CMD_CODE(_AddBAReq));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, paddbareq_parm, ADD_BA_REQ);
 
 	/* rtw_enqueue_cmd(pcmdpriv, ph2c); */
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
@@ -1028,7 +969,7 @@ u8 rtw_reset_securitypriv_cmd(struct adapter *padapter)
 	pdrvextra_cmd_parm->size = 0;
 	pdrvextra_cmd_parm->pbuf = NULL;
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, SET_DRV_EXTRA);
 
 	/* rtw_enqueue_cmd(pcmdpriv, ph2c); */
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
@@ -1061,7 +1002,7 @@ u8 rtw_free_assoc_resources_cmd(struct adapter *padapter)
 	pdrvextra_cmd_parm->size = 0;
 	pdrvextra_cmd_parm->pbuf = NULL;
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, SET_DRV_EXTRA);
 
 	/* rtw_enqueue_cmd(pcmdpriv, ph2c); */
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
@@ -1094,7 +1035,7 @@ u8 rtw_dynamic_chk_wk_cmd(struct adapter *padapter)
 	pdrvextra_cmd_parm->type = 0;
 	pdrvextra_cmd_parm->size = 0;
 	pdrvextra_cmd_parm->pbuf = NULL;
-	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, SET_DRV_EXTRA);
 
 	/* rtw_enqueue_cmd(pcmdpriv, ph2c); */
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
@@ -1343,7 +1284,7 @@ u8 rtw_lps_ctrl_wk_cmd(struct adapter *padapter, u8 lps_ctrl_type, u8 enqueue)
 		pdrvextra_cmd_parm->size = 0;
 		pdrvextra_cmd_parm->pbuf = NULL;
 
-		init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+		init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, SET_DRV_EXTRA);
 
 		res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 	} else {
@@ -1384,7 +1325,7 @@ u8 rtw_dm_in_lps_wk_cmd(struct adapter *padapter)
 	pdrvextra_cmd_parm->size = 0;
 	pdrvextra_cmd_parm->pbuf = NULL;
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, SET_DRV_EXTRA);
 
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 
@@ -1446,7 +1387,7 @@ u8 rtw_dm_ra_mask_wk_cmd(struct adapter *padapter, u8 *psta)
 	pdrvextra_cmd_parm->size = 0;
 	pdrvextra_cmd_parm->pbuf = psta;
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, SET_DRV_EXTRA);
 
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 
@@ -1479,7 +1420,7 @@ u8 rtw_ps_cmd(struct adapter *padapter)
 	pdrvextra_cmd_parm->type = 0;
 	pdrvextra_cmd_parm->size = 0;
 	pdrvextra_cmd_parm->pbuf = NULL;
-	init_h2fwcmd_w_parm_no_rsp(ppscmd, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+	init_h2fwcmd_w_parm_no_rsp(ppscmd, pdrvextra_cmd_parm, SET_DRV_EXTRA);
 
 	res = rtw_enqueue_cmd(pcmdpriv, ppscmd);
 
@@ -1550,7 +1491,7 @@ u8 rtw_chk_hi_queue_cmd(struct adapter *padapter)
 	pdrvextra_cmd_parm->size = 0;
 	pdrvextra_cmd_parm->pbuf = NULL;
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, SET_DRV_EXTRA);
 
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 
@@ -1642,7 +1583,7 @@ u8 rtw_c2h_packet_wk_cmd(struct adapter *padapter, u8 *pbuf, u16 length)
 	pdrvextra_cmd_parm->size = length;
 	pdrvextra_cmd_parm->pbuf = pbuf;
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, SET_DRV_EXTRA);
 
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 
@@ -1677,7 +1618,7 @@ u8 rtw_c2h_wk_cmd(struct adapter *padapter, u8 *c2h_evt)
 	pdrvextra_cmd_parm->size =  c2h_evt ? 16 : 0;
 	pdrvextra_cmd_parm->pbuf = c2h_evt;
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, SET_DRV_EXTRA);
 
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 5516593bc8ab..6e2b4fc2f096 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1881,7 +1881,7 @@ signed int rtw_set_auth(struct adapter *adapter, struct security_priv *psecurity
 
 	psetauthparm->mode = (unsigned char)psecuritypriv->dot11AuthAlgrthm;
 
-	pcmd->cmdcode = _SetAuth_CMD_;
+	pcmd->cmdcode = SET_AUTH;
 	pcmd->parmbuf = (unsigned char *)psetauthparm;
 	pcmd->cmdsz =  (sizeof(struct setauth_parm));
 	pcmd->rsp = NULL;
@@ -1952,7 +1952,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 			goto exit;
 		}
 
-		pcmd->cmdcode = _SetKey_CMD_;
+		pcmd->cmdcode = SET_KEY;
 		pcmd->parmbuf = (u8 *)psetkeyparm;
 		pcmd->cmdsz =  (sizeof(struct setkey_parm));
 		pcmd->rsp = NULL;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 5f00fe282d1b..3e71021bb8c8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4391,7 +4391,7 @@ void report_survey_event(struct adapter *padapter, union recv_frame *precv_frame
 
 	INIT_LIST_HEAD(&pcmd_obj->list);
 
-	pcmd_obj->cmdcode = GEN_CMD_CODE(_Set_MLME_EVT);
+	pcmd_obj->cmdcode = SET_MLME_EVT;
 	pcmd_obj->cmdsz = cmdsz;
 	pcmd_obj->parmbuf = pevtcmd;
 
@@ -4444,7 +4444,7 @@ void report_surveydone_event(struct adapter *padapter)
 
 	INIT_LIST_HEAD(&pcmd_obj->list);
 
-	pcmd_obj->cmdcode = GEN_CMD_CODE(_Set_MLME_EVT);
+	pcmd_obj->cmdcode = SET_MLME_EVT;
 	pcmd_obj->cmdsz = cmdsz;
 	pcmd_obj->parmbuf = pevtcmd;
 
@@ -4489,7 +4489,7 @@ void report_join_res(struct adapter *padapter, int res)
 
 	INIT_LIST_HEAD(&pcmd_obj->list);
 
-	pcmd_obj->cmdcode = GEN_CMD_CODE(_Set_MLME_EVT);
+	pcmd_obj->cmdcode = SET_MLME_EVT;
 	pcmd_obj->cmdsz = cmdsz;
 	pcmd_obj->parmbuf = pevtcmd;
 
@@ -4498,7 +4498,7 @@ void report_join_res(struct adapter *padapter, int res)
 
 	pc2h_evt_hdr = (struct C2HEvent_Header *)(pevtcmd);
 	pc2h_evt_hdr->len = sizeof(struct joinbss_event);
-	pc2h_evt_hdr->ID = GEN_EVT_CODE(_JoinBss);
+	pc2h_evt_hdr->ID = GEN_EVT_CODE(JOIN_BSS);
 	pc2h_evt_hdr->seq = atomic_inc_return(&pmlmeext->event_seq);
 
 	pjoinbss_evt = (struct joinbss_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
@@ -4538,7 +4538,7 @@ void report_wmm_edca_update(struct adapter *padapter)
 
 	INIT_LIST_HEAD(&pcmd_obj->list);
 
-	pcmd_obj->cmdcode = GEN_CMD_CODE(_Set_MLME_EVT);
+	pcmd_obj->cmdcode = SET_MLME_EVT;
 	pcmd_obj->cmdsz = cmdsz;
 	pcmd_obj->parmbuf = pevtcmd;
 
@@ -4584,7 +4584,7 @@ void report_del_sta_event(struct adapter *padapter, unsigned char *MacAddr, unsi
 
 	INIT_LIST_HEAD(&pcmd_obj->list);
 
-	pcmd_obj->cmdcode = GEN_CMD_CODE(_Set_MLME_EVT);
+	pcmd_obj->cmdcode = SET_MLME_EVT;
 	pcmd_obj->cmdsz = cmdsz;
 	pcmd_obj->parmbuf = pevtcmd;
 
@@ -4635,7 +4635,7 @@ void report_add_sta_event(struct adapter *padapter, unsigned char *MacAddr, int
 
 	INIT_LIST_HEAD(&pcmd_obj->list);
 
-	pcmd_obj->cmdcode = GEN_CMD_CODE(_Set_MLME_EVT);
+	pcmd_obj->cmdcode = SET_MLME_EVT;
 	pcmd_obj->cmdsz = cmdsz;
 	pcmd_obj->parmbuf = pevtcmd;
 
@@ -5085,7 +5085,7 @@ void survey_timer_hdl(struct timer_list *t)
 			return;
 		}
 
-		init_h2fwcmd_w_parm_no_rsp(ph2c, psurveyPara, GEN_CMD_CODE(_SiteSurvey));
+		init_h2fwcmd_w_parm_no_rsp(ph2c, psurveyPara, SITE_SURVEY);
 		rtw_enqueue_cmd(pcmdpriv, ph2c);
 	}
 }
@@ -5696,7 +5696,7 @@ u8 chk_bmc_sleepq_cmd(struct adapter *padapter)
 		goto exit;
 	}
 
-	init_h2fwcmd_w_parm_no_parm_rsp(ph2c, GEN_CMD_CODE(_ChkBMCSleepq));
+	init_h2fwcmd_w_parm_no_parm_rsp(ph2c, CHK_BMC_SLEEPQ);
 
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 
@@ -5734,7 +5734,7 @@ u8 set_tx_beacon_cmd(struct adapter *padapter)
 				      pmlmeinfo->hidden_ssid_mode);
 	ptxBeacon_parm->network.ie_length += len_diff;
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, ptxBeacon_parm, GEN_CMD_CODE(_TX_Beacon));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, ptxBeacon_parm, TX_BEACON);
 
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
index c4c3edee809d..332616ec6e96 100644
--- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
@@ -551,9 +551,6 @@ struct RunInThread_param {
 };
 
 
-#define GEN_CMD_CODE(cmd)	cmd ## _CMD_
-
-
 /*
 
 Result:
@@ -624,92 +621,87 @@ extern void rtw_setassocsta_cmdrsp_callback(struct adapter  *padapter,  struct c
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
+	READ_MACREG,
+	WRITE_MACREG,
+	READ_BBREG,
+	WRITE_BBREG,
+	READ_RFREG,
+	WRITE_RFREG,
+	READ_EEPROM,
+	WRITE_EEPROM,
+	READ_EFUSE,
+	WRITE_EFUSE,
+
+	READ_CAM,
+	WRITE_CAM,
+	SET_BCNITV,
+	SET_MBIDCFG,
+	JOIN_BSS,
+	DISCONNECT,
+	CREATE_BSS,
+	SET_OP_MODE,
+	SITE_SURVEY,
+	SET_AUTH,
+
+	SET_KEY,
+	SET_STA_KEY,
+	SET_ASSOC_STA,
+	DEL_ASSOC_STA,
+	SET_STA_PWR_STATE,
+	SET_BASIC_RATE,
+	GET_BASIC_RATE,
+	SET_DATA_RATE,
+	GET_DATA_RATE,
+	SET_PHY_INFO,
+
+	GET_PHY_INFO,
+	SET_PHY,
+	GET_PHY,
+	READ_RSSI,
+	READ_GAIN,
+	SET_ATIM,
+	SET_PWR_MODE,
+	JOIN_BSS_RPT,
+	SET_RA_TABLE,
+	GET_RA_TABLE,
+
+	GET_CCX_REPORT,
+	GET_DTM_REPORT,
+	GET_TX_RATE_STATISTICS,
+	SET_USB_SUSPEND,
+	SET_H2C_LBK,
+	ADD_BA_REQ,
+	SET_CHANNEL,
+	SET_TX_POWER,
+	SWITCH_ANTENNA,
+	SET_CRYSTAL_CAP,
+	SET_SINGLE_CARRIER_TX,
+
+	SET_SINGLE_TONE_TX,
+	SET_CARRIER_SUPPRESSION_TX,
+	SET_CONTINUOUS_TX,
+	SWITCH_BANDWIDTH,
+	TX_BEACON,
+
+	SET_MLME_EVT,
+	SET_DRV_EXTRA,
+	SET_H2C_MSG,
+
+	SET_CHANNEL_PLAN,
+
+	SET_CHANNEL_SWITCH,
+	TDLS,
+	CHK_BMC_SLEEPQ,
+
+	RUN_IN_THREAD_CMD,
 
 	MAX_H2CCMD
 };
 
-#define _GetBBReg_CMD_		_Read_BBREG_CMD_
-#define _SetBBReg_CMD_		_Write_BBREG_CMD_
-#define _GetRFReg_CMD_		_Read_RFREG_CMD_
-#define _SetRFReg_CMD_		_Write_RFREG_CMD_
+#define GET_BB_REG READ_BBREG
+#define SET_BB_REG WRITE_BBREG
+#define GET_RF_REG READ_RFREG
+#define SET_RF_REG WRITE_RFREG
 
 #endif /*  _CMD_H_ */
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 95769f90d196..4f508c91cecd 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -679,18 +679,18 @@ void rtw_dummy_event_callback(struct adapter *adapter, u8 *pbuf);
 void rtw_fwdbg_event_callback(struct adapter *adapter, u8 *pbuf);
 
 enum {
-	GEN_EVT_CODE(_Read_MACREG) = 0, /*0*/
-	GEN_EVT_CODE(_Read_BBREG),
-	GEN_EVT_CODE(_Read_RFREG),
-	GEN_EVT_CODE(_Read_EEPROM),
-	GEN_EVT_CODE(_Read_EFUSE),
-	GEN_EVT_CODE(_Read_CAM),			/*5*/
+	GEN_EVT_CODE(READ_MACREG) = 0, /*0*/
+	GEN_EVT_CODE(READ_BBREG),
+	GEN_EVT_CODE(READ_RFREG),
+	GEN_EVT_CODE(READ_EEPROM),
+	GEN_EVT_CODE(READ_EFUSE),
+	GEN_EVT_CODE(READ_CAM),			/*5*/
 	GEN_EVT_CODE(_Get_BasicRate),
 	GEN_EVT_CODE(_Get_DataRate),
 	GEN_EVT_CODE(_Survey),	 /*8*/
 	GEN_EVT_CODE(_SurveyDone),	 /*9*/
 
-	GEN_EVT_CODE(_JoinBss), /*10*/
+	GEN_EVT_CODE(JOIN_BSS), /*10*/
 	GEN_EVT_CODE(_AddSTA),
 	GEN_EVT_CODE(_DelSTA),
 	GEN_EVT_CODE(_AtimDone),
-- 
2.53.0

