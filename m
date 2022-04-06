Received: from mail-oa1-f67.google.com (mail-oa1-f67.google.com [209.85.160.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E140C17FB;
	Wed,  6 Apr 2022 08:31:29 +0000 (UTC)
Received: by mail-oa1-f67.google.com with SMTP id 586e51a60fabf-d6e29fb3d7so2153463fac.7;
        Wed, 06 Apr 2022 01:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qrs+CFWmrW8BeESnOm/6cRIphI8Wl9VDHYuHbUM3OO4=;
        b=RORbisXWSMCQFYIFBfrpeCMwr6DsmVVdhLIStqeO9ldOQf3FAVH/P4CO0SqUK3kdQ2
         PkArFpxrsdtjhuq1anbVuTAWRea9iDs3/ppC53RrfoBoryg66DS2jVwfpa9PjuktWnAq
         4K9W76QM3hxCIV4IHeMZmOOD2uIJhuWxjWPA6wX56DhsyFg0Dp3Wva++8BHgP5SpyPlT
         rlA1P+HLOfNgO3rI26tNIp1l2GyamMnMguQP/29HLP/k+V4mDt4mOXu1IGOuQklWx2cq
         pQVx4ow2vtfm32r45vSAIGJtfMCq9ElNmlElf8Abkx+H51LQMXZdZuyQZ0fyptR0IcP9
         SudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qrs+CFWmrW8BeESnOm/6cRIphI8Wl9VDHYuHbUM3OO4=;
        b=f4wUtJ5avrGb0yNalCayG6AACZewSnpdbj1x2zvfNSXlaRLIQB+kljv0aVdEs2r2zl
         YdQ5utFqD/Brku3/sv4atpjTv22NEK/zmi/WTMLMJAs8wyH5wSLwEfpx1rag9Idxces8
         Lx/8h1mTaxqCbcu8+WiHfdbJI6AsjJlSTTsvXVqnXDItageHrMTwdo/4wPugOwCcWcpw
         ZXx/dYB+sYt9X8SzSFb1ttspFlfleWlL7fxi3IEvpj89Pk4mAgxkK3CN6OAFjO7GZR3e
         HF+N5NYWnwKeQS/SIwxRl9vwJPs/lmGEY/ARCfcSXTmhkk6Hwfr/duoYnjN3A4UMcOku
         Nghg==
X-Gm-Message-State: AOAM532GzneKeGkqGvCYS0tlQ8/uioOJvMDqXEP8VzFAAPK3FBFfSQV6
	xSgtaZZue0XXB6l1Hqv+bXM=
X-Google-Smtp-Source: ABdhPJybWLBDvyaNTwqZZZ4PT6DF2PcM3Vg7gZhU9/SelxXcndU8UVYVwmUzYaZZX78gRgHAIO9+og==
X-Received: by 2002:a05:6870:b6a6:b0:dd:999f:6596 with SMTP id cy38-20020a056870b6a600b000dd999f6596mr3384235oab.106.1649233889106;
        Wed, 06 Apr 2022 01:31:29 -0700 (PDT)
Received: from bertie ([172.58.102.145])
        by smtp.gmail.com with ESMTPSA id 190-20020a4a0dc7000000b003244ae0bbd5sm5835478oob.7.2022.04.06.01.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 01:31:28 -0700 (PDT)
From: Rebecca Mckeever <remckee0@gmail.com>
To: outreachy@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rebecca Mckeever <remckee0@gmail.com>
Subject: [PATCH 4/4] staging: r8188eu: use sizeof(*pvar) for allocating structs
Date: Wed,  6 Apr 2022 03:31:00 -0500
Message-Id: <5b526d8c178d89328de935ff4ff57651bdd8379b.1649233201.git.remckee0@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1649233201.git.remckee0@gmail.com>
References: <cover.1649233201.git.remckee0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use sizeof(*pvar) instead of sizeof(struct var) when allocating memory.
This conforms to Linux kernel coding style, improves readability,
and decreases the opportunity for bugs if the pointer variable type is
changed. Issue found by checkpatch messages of the following format:

CHECK: Prefer kzalloc(sizeof(*pvar)...) over kzalloc(sizeof(struct var)...)

Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 68 +++++++++++++-------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index f4a277e6b654..110959148648 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -334,11 +334,11 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 	if (check_fwstate(pmlmepriv, _FW_LINKED))
 		p2p_ps_wk_cmd(padapter, P2P_PS_SCAN, 1);
 
-	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
+	ph2c = kzalloc(sizeof(*ph2c), GFP_ATOMIC);
 	if (!ph2c)
 		return _FAIL;
 
-	psurveyPara = kzalloc(sizeof(struct sitesurvey_parm), GFP_ATOMIC);
+	psurveyPara = kzalloc(sizeof(*psurveyPara), GFP_ATOMIC);
 	if (!psurveyPara) {
 		kfree(ph2c);
 		return _FAIL;
@@ -399,13 +399,13 @@ u8 rtw_setdatarate_cmd(struct adapter *padapter, u8 *rateset)
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8	res = _SUCCESS;
 
-	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
+	ph2c = kzalloc(sizeof(*ph2c), GFP_ATOMIC);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	pbsetdataratepara = kzalloc(sizeof(struct setdatarate_parm), GFP_ATOMIC);
+	pbsetdataratepara = kzalloc(sizeof(*pbsetdataratepara), GFP_ATOMIC);
 	if (!pbsetdataratepara) {
 		kfree(ph2c);
 		res = _FAIL;
@@ -438,7 +438,7 @@ u8 rtw_createbss_cmd(struct adapter  *padapter)
 
 	rtw_led_control(padapter, LED_CTL_START_TO_LINK);
 
-	pcmd = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
+	pcmd = kzalloc(sizeof(*pcmd), GFP_ATOMIC);
 	if (!pcmd) {
 		res = _FAIL;
 		goto exit;
@@ -475,7 +475,7 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 
 	rtw_led_control(padapter, LED_CTL_START_TO_LINK);
 
-	pcmd = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
+	pcmd = kzalloc(sizeof(*pcmd), GFP_ATOMIC);
 	if (!pcmd) {
 		res = _FAIL;
 		goto exit;
@@ -624,12 +624,12 @@ u8 rtw_setopmode_cmd(struct adapter  *padapter, enum ndis_802_11_network_infra n
 	struct	cmd_priv   *pcmdpriv = &padapter->cmdpriv;
 	u8	res = _SUCCESS;
 
-	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
+	ph2c = kzalloc(sizeof(*ph2c), GFP_KERNEL);
 	if (!ph2c) {
 		res = false;
 		goto exit;
 	}
-	psetop = kzalloc(sizeof(struct setopmode_parm), GFP_KERNEL);
+	psetop = kzalloc(sizeof(*psetop), GFP_KERNEL);
 
 	if (!psetop) {
 		kfree(ph2c);
@@ -659,20 +659,20 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, u8 *psta, u8 unicast_key)
 	struct sta_info *sta = (struct sta_info *)psta;
 	u8	res = _SUCCESS;
 
-	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
+	ph2c = kzalloc(sizeof(*ph2c), GFP_KERNEL);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	psetstakey_para = kzalloc(sizeof(struct set_stakey_parm), GFP_KERNEL);
+	psetstakey_para = kzalloc(sizeof(*psetstakey_para), GFP_KERNEL);
 	if (!psetstakey_para) {
 		kfree(ph2c);
 		res = _FAIL;
 		goto exit;
 	}
 
-	psetstakey_rsp = kzalloc(sizeof(struct set_stakey_rsp), GFP_KERNEL);
+	psetstakey_rsp = kzalloc(sizeof(*psetstakey_rsp), GFP_KERNEL);
 	if (!psetstakey_rsp) {
 		kfree(ph2c);
 		kfree(psetstakey_para);
@@ -718,13 +718,13 @@ u8 rtw_clearstakey_cmd(struct adapter *padapter, u8 *psta, u8 entry, u8 enqueue)
 	if (!enqueue) {
 		clear_cam_entry(padapter, entry);
 	} else {
-		ph2c = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
+		ph2c = kzalloc(sizeof(*ph2c), GFP_ATOMIC);
 		if (!ph2c) {
 			res = _FAIL;
 			goto exit;
 		}
 
-		psetstakey_para = kzalloc(sizeof(struct set_stakey_parm),
+		psetstakey_para = kzalloc(sizeof(*psetstakey_para),
 					  GFP_ATOMIC);
 		if (!psetstakey_para) {
 			kfree(ph2c);
@@ -732,7 +732,7 @@ u8 rtw_clearstakey_cmd(struct adapter *padapter, u8 *psta, u8 entry, u8 enqueue)
 			goto exit;
 		}
 
-		psetstakey_rsp = kzalloc(sizeof(struct set_stakey_rsp),
+		psetstakey_rsp = kzalloc(sizeof(*psetstakey_rsp),
 					 GFP_ATOMIC);
 		if (!psetstakey_rsp) {
 			kfree(ph2c);
@@ -765,13 +765,13 @@ u8 rtw_addbareq_cmd(struct adapter *padapter, u8 tid, u8 *addr)
 	struct addBaReq_parm *paddbareq_parm;
 	u8	res = _SUCCESS;
 
-	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
+	ph2c = kzalloc(sizeof(*ph2c), GFP_ATOMIC);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	paddbareq_parm = kzalloc(sizeof(struct addBaReq_parm), GFP_ATOMIC);
+	paddbareq_parm = kzalloc(sizeof(*paddbareq_parm), GFP_ATOMIC);
 	if (!paddbareq_parm) {
 		kfree(ph2c);
 		res = _FAIL;
@@ -798,13 +798,13 @@ u8 rtw_dynamic_chk_wk_cmd(struct adapter *padapter)
 	struct cmd_priv	*pcmdpriv = &padapter->cmdpriv;
 	u8	res = _SUCCESS;
 
-	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
+	ph2c = kzalloc(sizeof(*ph2c), GFP_ATOMIC);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	pdrvextra_cmd_parm = kzalloc(sizeof(struct drvextra_cmd_parm), GFP_ATOMIC);
+	pdrvextra_cmd_parm = kzalloc(sizeof(*pdrvextra_cmd_parm), GFP_ATOMIC);
 	if (!pdrvextra_cmd_parm) {
 		kfree(ph2c);
 		res = _FAIL;
@@ -839,7 +839,7 @@ u8 rtw_set_chplan_cmd(struct adapter *padapter, u8 chplan)
 	}
 
 	/* prepare cmd parameter */
-	setChannelPlan_param = kzalloc(sizeof(struct SetChannelPlan_param),
+	setChannelPlan_param = kzalloc(sizeof(*setChannelPlan_param),
 				       GFP_KERNEL);
 	if (!setChannelPlan_param) {
 		res = _FAIL;
@@ -848,7 +848,7 @@ u8 rtw_set_chplan_cmd(struct adapter *padapter, u8 chplan)
 	setChannelPlan_param->channel_plan = chplan;
 
 	/* need enqueue, prepare cmd_obj and enqueue */
-	pcmdobj = kzalloc(sizeof(struct	cmd_obj), GFP_KERNEL);
+	pcmdobj = kzalloc(sizeof(*pcmdobj), GFP_KERNEL);
 	if (!pcmdobj) {
 		kfree(setChannelPlan_param);
 		res = _FAIL;
@@ -1010,13 +1010,13 @@ u8 rtw_lps_ctrl_wk_cmd(struct adapter *padapter, u8 lps_ctrl_type, u8 enqueue)
 	/*	return res; */
 
 	if (enqueue) {
-		ph2c = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
+		ph2c = kzalloc(sizeof(*ph2c), GFP_ATOMIC);
 		if (!ph2c) {
 			res = _FAIL;
 			goto exit;
 		}
 
-		pdrvextra_cmd_parm = kzalloc(sizeof(struct drvextra_cmd_parm),
+		pdrvextra_cmd_parm = kzalloc(sizeof(*pdrvextra_cmd_parm),
 					     GFP_ATOMIC);
 		if (!pdrvextra_cmd_parm) {
 			kfree(ph2c);
@@ -1056,13 +1056,13 @@ u8 rtw_rpt_timer_cfg_cmd(struct adapter *padapter, u16 min_time)
 
 	u8	res = _SUCCESS;
 
-	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
+	ph2c = kzalloc(sizeof(*ph2c), GFP_ATOMIC);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	pdrvextra_cmd_parm = kzalloc(sizeof(struct drvextra_cmd_parm),
+	pdrvextra_cmd_parm = kzalloc(sizeof(*pdrvextra_cmd_parm),
 				     GFP_ATOMIC);
 	if (!pdrvextra_cmd_parm) {
 		kfree(ph2c);
@@ -1109,13 +1109,13 @@ u8 rtw_antenna_select_cmd(struct adapter *padapter, u8 antenna, u8 enqueue)
 		return res;
 
 	if (enqueue) {
-		ph2c = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
+		ph2c = kzalloc(sizeof(*ph2c), GFP_KERNEL);
 		if (!ph2c) {
 			res = _FAIL;
 			goto exit;
 		}
 
-		pdrvextra_cmd_parm = kzalloc(sizeof(struct drvextra_cmd_parm),
+		pdrvextra_cmd_parm = kzalloc(sizeof(*pdrvextra_cmd_parm),
 					     GFP_KERNEL);
 		if (!pdrvextra_cmd_parm) {
 			kfree(ph2c);
@@ -1148,13 +1148,13 @@ u8 p2p_protocol_wk_cmd(struct adapter *padapter, int intCmdType)
 	if (rtw_p2p_chk_state(pwdinfo, P2P_STATE_NONE))
 		return res;
 
-	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
+	ph2c = kzalloc(sizeof(*ph2c), GFP_ATOMIC);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	pdrvextra_cmd_parm = kzalloc(sizeof(struct drvextra_cmd_parm), GFP_ATOMIC);
+	pdrvextra_cmd_parm = kzalloc(sizeof(*pdrvextra_cmd_parm), GFP_ATOMIC);
 	if (!pdrvextra_cmd_parm) {
 		kfree(ph2c);
 		res = _FAIL;
@@ -1182,13 +1182,13 @@ u8 rtw_ps_cmd(struct adapter *padapter)
 
 	u8	res = _SUCCESS;
 
-	ppscmd = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
+	ppscmd = kzalloc(sizeof(*ppscmd), GFP_ATOMIC);
 	if (!ppscmd) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	pdrvextra_cmd_parm = kzalloc(sizeof(struct drvextra_cmd_parm), GFP_ATOMIC);
+	pdrvextra_cmd_parm = kzalloc(sizeof(*pdrvextra_cmd_parm), GFP_ATOMIC);
 	if (!pdrvextra_cmd_parm) {
 		kfree(ppscmd);
 		res = _FAIL;
@@ -1253,13 +1253,13 @@ u8 rtw_chk_hi_queue_cmd(struct adapter *padapter)
 	struct cmd_priv	*pcmdpriv = &padapter->cmdpriv;
 	u8	res = _SUCCESS;
 
-	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
+	ph2c = kzalloc(sizeof(*ph2c), GFP_ATOMIC);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	pdrvextra_cmd_parm = kzalloc(sizeof(struct drvextra_cmd_parm), GFP_ATOMIC);
+	pdrvextra_cmd_parm = kzalloc(sizeof(*pdrvextra_cmd_parm), GFP_ATOMIC);
 	if (!pdrvextra_cmd_parm) {
 		kfree(ph2c);
 		res = _FAIL;
@@ -1284,13 +1284,13 @@ u8 rtw_c2h_wk_cmd(struct adapter *padapter, u8 *c2h_evt)
 	struct cmd_priv	*pcmdpriv = &padapter->cmdpriv;
 	u8	res = _SUCCESS;
 
-	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
+	ph2c = kzalloc(sizeof(*ph2c), GFP_ATOMIC);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	pdrvextra_cmd_parm = kzalloc(sizeof(struct drvextra_cmd_parm), GFP_ATOMIC);
+	pdrvextra_cmd_parm = kzalloc(sizeof(*pdrvextra_cmd_parm), GFP_ATOMIC);
 	if (!pdrvextra_cmd_parm) {
 		kfree(ph2c);
 		res = _FAIL;
-- 
2.32.0

