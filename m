Received: from cvsmtppost31.nm.naver.com (cvsmtppost31.nm.naver.com [114.111.35.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E9436A000
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 19:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769888422; cv=none; b=RtI3QUrRw5cJhGhLdoJYw9+tL5+nWbKGi0oZyapjYV2QAkbn/xKWstgqX5NfzWictnQvhQdX30pWj4ssjC4D5GyPSTRc+kDRCHZDoCL0b77ntpy0GNBxP90hrcHOvXFTuvQgvlDqQyj5hy8ROQoN7yJNeMfyWpQV9PC8wRPAUjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769888422; c=relaxed/simple;
	bh=hyY6QEhoifjwb3q3O/Vuz/Hf4gsKB1UUAMlMzFzpYVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xe8rF+WHR+BdDPk9m9HYhX1G7fsROtzgwy1DuJIdUtunAwE4UU/2oAoHUB4e1KyVCWGbR0yttzH0BYRdhBhOKnEB4ikcvGrntmCJ2VeYTUCMlMtSNf5vJbeqTDu9j0ssmamKqU+dbzJ9Y7jt/74SFxS5WNbsz71xR94P//ko/So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=v91wqgGw; arc=none smtp.client-ip=114.111.35.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="v91wqgGw"
Received: from cvsendbo027.nm ([10.112.22.36])
  by cvsmtppost31.nm.naver.com with ESMTP id xWyIODlVTZ2gZk+0Lt+4zw
  for <linux-staging@lists.linux.dev>;
  Sat, 31 Jan 2026 19:30:10 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769887810; bh=hyY6QEhoifjwb3q3O/Vuz/Hf4gsKB1UUAMlMzFzpYVA=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=v91wqgGw4fwWEHbxo9r3ycU4I+q2UaNZujBDP2xPaEEAewA+h61VvoRi6eRdVyppj
	 0Gsy5pQwm1D6YOldO2OikJGH+hUI2Hbhk2DRmcb9qgs1W3FwLlCGCVMsOlrZWnsPIu
	 L6wOHRLXCWtQOHx3DSTo74ZZm0HRwQ6MuZ/jHa+aNdvJADFPV4b3+bBl/frHLfJ9ei
	 XzCyUb10ZbJ8ByIcb+0BE5oUvk+01b9aLzuZJYhQWo065RxryF5ReVkVCDkORgQhJa
	 SByMqe0VZQO0SqcigBHxNLG8IwSiMXZ0+2K0ox5abtJXKTHcwAlpR+hSFZy2/5szbn
	 DmYecvTyEacTw==
X-Session-ID: 61RM0PXeSkOq4Tth+kiO1A
X-Works-Send-Opt: p/Y/jAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: uwn9aAvrFqJZ+HmmKxt9+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp011.nm.naver.com with ESMTP id 61RM0PXeSkOq4Tth+kiO1A
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Sat, 31 Jan 2026 19:30:10 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	trohan2000@gmail.com,
	andy@kernel.org,
	linux-staging@lists.linux.dev,
	straube.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v4 2/4] staging: rtl8723bs: replace rtw_zmalloc() with kzalloc()
Date: Sun,  1 Feb 2026 04:29:59 +0900
Message-ID: <20260131193001.303307-3-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260131193001.303307-1-s9430939@naver.com>
References: <20260131193001.303307-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

replaces the wrapper function rtw_zmalloc() with kzalloc().

I reviewed all the call sites to determine the appropriate GFP flags:
- GFP_KERNEL: Used for initialization and configuration paths.
  init/probe, config/setup

- GFP_ATOMIC: Used for critical real-time paths.
  including interrupts, timer handler, region where spinlocks are held

Replace sizeof(struct val) with sizeof(*ptr).
Use kmemdup() where possible.
Remove blank line after kzalloc().

Use array_size() and size_add().

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Minu Jin <s9430939@naver.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c       |  8 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 81 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 12 +--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 39 +++++----
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  2 +-
 drivers/staging/rtl8723bs/core/rtw_security.c |  3 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  8 +-
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |  4 +-
 drivers/staging/rtl8723bs/hal/sdio_ops.c      |  2 +-
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 16 ++--
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  2 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c |  2 +-
 13 files changed, 88 insertions(+), 93 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index bfe520a7c549..6f465dffb105 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1228,13 +1228,13 @@ u8 rtw_ap_set_pairwise_key(struct adapter *padapter, struct sta_info *psta)
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
-	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+	ph2c = kzalloc(sizeof(*ph2c), GFP_KERNEL);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	psetstakey_para = rtw_zmalloc(sizeof(struct set_stakey_parm));
+	psetstakey_para = kzalloc(sizeof(*psetstakey_para), GFP_KERNEL);
 	if (!psetstakey_para) {
 		kfree(ph2c);
 		res = _FAIL;
@@ -1268,12 +1268,12 @@ static int rtw_ap_set_key(struct adapter *padapter,
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	int res = _SUCCESS;
 
-	pcmd = rtw_zmalloc(sizeof(struct cmd_obj));
+	pcmd = kzalloc(sizeof(*pcmd), GFP_KERNEL);
 	if (!pcmd) {
 		res = _FAIL;
 		goto exit;
 	}
-	psetkeyparm = rtw_zmalloc(sizeof(struct setkey_parm));
+	psetkeyparm = kzalloc(sizeof(*psetkeyparm), GFP_KERNEL);
 	if (!psetkeyparm) {
 		kfree(pcmd);
 		res = _FAIL;
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 0cafa5326129..d0315d08a35b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -171,15 +171,13 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 
 	pcmdpriv->cmd_seq = 1;
 
-	pcmdpriv->cmd_allocated_buf = rtw_zmalloc(MAX_CMDSZ + CMDBUFF_ALIGN_SZ);
-
+	pcmdpriv->cmd_allocated_buf = kzalloc(MAX_CMDSZ + CMDBUFF_ALIGN_SZ, GFP_ATOMIC);
 	if (!pcmdpriv->cmd_allocated_buf)
 		return -ENOMEM;
 
 	pcmdpriv->cmd_buf = PTR_ALIGN(pcmdpriv->cmd_allocated_buf, CMDBUFF_ALIGN_SZ);
 
-	pcmdpriv->rsp_allocated_buf = rtw_zmalloc(MAX_RSPSZ + 4);
-
+	pcmdpriv->rsp_allocated_buf = kzalloc(MAX_RSPSZ + 4, GFP_ATOMIC);
 	if (!pcmdpriv->rsp_allocated_buf) {
 		kfree(pcmdpriv->cmd_allocated_buf);
 		return -ENOMEM;
@@ -535,11 +533,11 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 	if (check_fwstate(pmlmepriv, _FW_LINKED))
 		rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_SCAN, 1);
 
-	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+	ph2c = kzalloc(sizeof(*ph2c), GFP_ATOMIC);
 	if (!ph2c)
 		return _FAIL;
 
-	psurveyPara = rtw_zmalloc(sizeof(struct sitesurvey_parm));
+	psurveyPara = kzalloc(sizeof(*psurveyPara), GFP_ATOMIC);
 	if (!psurveyPara) {
 		kfree(ph2c);
 		return _FAIL;
@@ -603,7 +601,7 @@ u8 rtw_createbss_cmd(struct adapter  *padapter)
 	struct wlan_bssid_ex *pdev_network = &padapter->registrypriv.dev_network;
 	u8 res = _SUCCESS;
 
-	pcmd = rtw_zmalloc(sizeof(struct cmd_obj));
+	pcmd = kzalloc(sizeof(*pcmd), GFP_ATOMIC);
 	if (!pcmd) {
 		res = _FAIL;
 		goto exit;
@@ -636,7 +634,7 @@ int rtw_startbss_cmd(struct adapter  *padapter, int flags)
 		start_bss_network(padapter);
 	} else {
 		/* need enqueue, prepare cmd_obj and enqueue */
-		pcmd = rtw_zmalloc(sizeof(struct cmd_obj));
+		pcmd = kzalloc(sizeof(*pcmd), GFP_KERNEL);
 		if (!pcmd) {
 			res = _FAIL;
 			goto exit;
@@ -688,7 +686,7 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	u32 tmp_len;
 	u8 *ptmp = NULL;
 
-	pcmd = rtw_zmalloc(sizeof(struct cmd_obj));
+	pcmd = kzalloc(sizeof(*pcmd), GFP_ATOMIC);
 	if (!pcmd) {
 		res = _FAIL;
 		goto exit;
@@ -797,7 +795,7 @@ u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueu
 	u8 res = _SUCCESS;
 
 	/* prepare cmd parameter */
-	param = rtw_zmalloc(sizeof(*param));
+	param = kzalloc(sizeof(*param), GFP_KERNEL);
 	if (!param) {
 		res = _FAIL;
 		goto exit;
@@ -806,7 +804,7 @@ u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueu
 
 	if (enqueue) {
 		/* need enqueue, prepare cmd_obj and enqueue */
-		cmdobj = rtw_zmalloc(sizeof(*cmdobj));
+		cmdobj = kzalloc(sizeof(*cmdobj), GFP_KERNEL);
 		if (!cmdobj) {
 			res = _FAIL;
 			kfree(param);
@@ -833,8 +831,7 @@ u8 rtw_setopmode_cmd(struct adapter  *padapter, enum ndis_802_11_network_infrast
 	struct	cmd_priv   *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
-	psetop = rtw_zmalloc(sizeof(struct setopmode_parm));
-
+	psetop = kzalloc(sizeof(*psetop), GFP_KERNEL);
 	if (!psetop) {
 		res = _FAIL;
 		goto exit;
@@ -842,7 +839,7 @@ u8 rtw_setopmode_cmd(struct adapter  *padapter, enum ndis_802_11_network_infrast
 	psetop->mode = (u8)networktype;
 
 	if (enqueue) {
-		ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+		ph2c = kzalloc(sizeof(*ph2c), GFP_KERNEL);
 		if (!ph2c) {
 			kfree(psetop);
 			res = _FAIL;
@@ -869,7 +866,7 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	u8 res = _SUCCESS;
 
-	psetstakey_para = rtw_zmalloc(sizeof(struct set_stakey_parm));
+	psetstakey_para = kzalloc(sizeof(*psetstakey_para), GFP_KERNEL);
 	if (!psetstakey_para) {
 		res = _FAIL;
 		goto exit;
@@ -891,14 +888,14 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 	padapter->securitypriv.busetkipkey = true;
 
 	if (enqueue) {
-		ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+		ph2c = kzalloc(sizeof(*ph2c), GFP_KERNEL);
 		if (!ph2c) {
 			kfree(psetstakey_para);
 			res = _FAIL;
 			goto exit;
 		}
 
-		psetstakey_rsp = rtw_zmalloc(sizeof(struct set_stakey_rsp));
+		psetstakey_rsp = kzalloc(sizeof(*psetstakey_rsp), GFP_KERNEL);
 		if (!psetstakey_rsp) {
 			kfree(ph2c);
 			kfree(psetstakey_para);
@@ -936,20 +933,20 @@ u8 rtw_clearstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 enqueu
 			rtw_camid_free(padapter, cam_id);
 		}
 	} else {
-		ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+		ph2c = kzalloc(sizeof(*ph2c), GFP_KERNEL);
 		if (!ph2c) {
 			res = _FAIL;
 			goto exit;
 		}
 
-		psetstakey_para = rtw_zmalloc(sizeof(struct set_stakey_parm));
+		psetstakey_para = kzalloc(sizeof(*psetstakey_para), GFP_KERNEL);
 		if (!psetstakey_para) {
 			kfree(ph2c);
 			res = _FAIL;
 			goto exit;
 		}
 
-		psetstakey_rsp = rtw_zmalloc(sizeof(struct set_stakey_rsp));
+		psetstakey_rsp = kzalloc(sizeof(*psetstakey_rsp), GFP_KERNEL);
 		if (!psetstakey_rsp) {
 			kfree(ph2c);
 			kfree(psetstakey_para);
@@ -979,13 +976,13 @@ u8 rtw_addbareq_cmd(struct adapter *padapter, u8 tid, u8 *addr)
 
 	u8 res = _SUCCESS;
 
-	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+	ph2c = kzalloc(sizeof(*ph2c), GFP_ATOMIC);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	paddbareq_parm = rtw_zmalloc(sizeof(struct addBaReq_parm));
+	paddbareq_parm = kzalloc(sizeof(*paddbareq_parm), GFP_ATOMIC);
 	if (!paddbareq_parm) {
 		kfree(ph2c);
 		res = _FAIL;
@@ -1012,13 +1009,13 @@ u8 rtw_reset_securitypriv_cmd(struct adapter *padapter)
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
-	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+	ph2c = kzalloc(sizeof(*ph2c), GFP_ATOMIC);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	pdrvextra_cmd_parm = rtw_zmalloc(sizeof(struct drvextra_cmd_parm));
+	pdrvextra_cmd_parm = kzalloc(sizeof(*pdrvextra_cmd_parm), GFP_ATOMIC);
 	if (!pdrvextra_cmd_parm) {
 		kfree(ph2c);
 		res = _FAIL;
@@ -1045,13 +1042,13 @@ u8 rtw_free_assoc_resources_cmd(struct adapter *padapter)
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
-	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+	ph2c = kzalloc(sizeof(*ph2c), GFP_ATOMIC);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	pdrvextra_cmd_parm = rtw_zmalloc(sizeof(struct drvextra_cmd_parm));
+	pdrvextra_cmd_parm = kzalloc(sizeof(*pdrvextra_cmd_parm), GFP_ATOMIC);
 	if (!pdrvextra_cmd_parm) {
 		kfree(ph2c);
 		res = _FAIL;
@@ -1079,13 +1076,13 @@ u8 rtw_dynamic_chk_wk_cmd(struct adapter *padapter)
 	u8 res = _SUCCESS;
 
 	/* only  primary padapter does this cmd */
-	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+	ph2c = kzalloc(sizeof(*ph2c), GFP_ATOMIC);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	pdrvextra_cmd_parm = rtw_zmalloc(sizeof(struct drvextra_cmd_parm));
+	pdrvextra_cmd_parm = kzalloc(sizeof(*pdrvextra_cmd_parm), GFP_ATOMIC);
 	if (!pdrvextra_cmd_parm) {
 		kfree(ph2c);
 		res = _FAIL;
@@ -1319,13 +1316,13 @@ u8 rtw_lps_ctrl_wk_cmd(struct adapter *padapter, u8 lps_ctrl_type, u8 enqueue)
 	u8 res = _SUCCESS;
 
 	if (enqueue) {
-		ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+		ph2c = kzalloc(sizeof(*ph2c), GFP_ATOMIC);
 		if (!ph2c) {
 			res = _FAIL;
 			goto exit;
 		}
 
-		pdrvextra_cmd_parm = rtw_zmalloc(sizeof(struct drvextra_cmd_parm));
+		pdrvextra_cmd_parm = kzalloc(sizeof(*pdrvextra_cmd_parm), GFP_ATOMIC);
 		if (!pdrvextra_cmd_parm) {
 			kfree(ph2c);
 			res = _FAIL;
@@ -1360,13 +1357,13 @@ u8 rtw_dm_in_lps_wk_cmd(struct adapter *padapter)
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
-	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+	ph2c = kzalloc(sizeof(*ph2c), GFP_ATOMIC);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	pdrvextra_cmd_parm = rtw_zmalloc(sizeof(struct drvextra_cmd_parm));
+	pdrvextra_cmd_parm = kzalloc(sizeof(*pdrvextra_cmd_parm), GFP_ATOMIC);
 	if (!pdrvextra_cmd_parm) {
 		kfree(ph2c);
 		res = _FAIL;
@@ -1422,13 +1419,13 @@ u8 rtw_dm_ra_mask_wk_cmd(struct adapter *padapter, u8 *psta)
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
-	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+	ph2c = kzalloc(sizeof(*ph2c), GFP_ATOMIC);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	pdrvextra_cmd_parm = rtw_zmalloc(sizeof(struct drvextra_cmd_parm));
+	pdrvextra_cmd_parm = kzalloc(sizeof(*pdrvextra_cmd_parm), GFP_ATOMIC);
 	if (!pdrvextra_cmd_parm) {
 		kfree(ph2c);
 		res = _FAIL;
@@ -1456,13 +1453,13 @@ u8 rtw_ps_cmd(struct adapter *padapter)
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
-	ppscmd = rtw_zmalloc(sizeof(struct cmd_obj));
+	ppscmd = kzalloc(sizeof(*ppscmd), GFP_ATOMIC);
 	if (!ppscmd) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	pdrvextra_cmd_parm = rtw_zmalloc(sizeof(struct drvextra_cmd_parm));
+	pdrvextra_cmd_parm = kzalloc(sizeof(*pdrvextra_cmd_parm), GFP_ATOMIC);
 	if (!pdrvextra_cmd_parm) {
 		kfree(ppscmd);
 		res = _FAIL;
@@ -1526,13 +1523,13 @@ u8 rtw_chk_hi_queue_cmd(struct adapter *padapter)
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
-	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+	ph2c = kzalloc(sizeof(*ph2c), GFP_ATOMIC);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	pdrvextra_cmd_parm = rtw_zmalloc(sizeof(struct drvextra_cmd_parm));
+	pdrvextra_cmd_parm = kzalloc(sizeof(*pdrvextra_cmd_parm), GFP_ATOMIC);
 	if (!pdrvextra_cmd_parm) {
 		kfree(ph2c);
 		res = _FAIL;
@@ -1618,13 +1615,13 @@ u8 rtw_c2h_packet_wk_cmd(struct adapter *padapter, u8 *pbuf, u16 length)
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
-	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+	ph2c = kzalloc(sizeof(*ph2c), GFP_ATOMIC);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	pdrvextra_cmd_parm = rtw_zmalloc(sizeof(struct drvextra_cmd_parm));
+	pdrvextra_cmd_parm = kzalloc(sizeof(*pdrvextra_cmd_parm), GFP_ATOMIC);
 	if (!pdrvextra_cmd_parm) {
 		kfree(ph2c);
 		res = _FAIL;
@@ -1653,13 +1650,13 @@ u8 rtw_c2h_wk_cmd(struct adapter *padapter, u8 *c2h_evt)
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
-	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+	ph2c = kzalloc(sizeof(*ph2c), GFP_KERNEL);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	pdrvextra_cmd_parm = rtw_zmalloc(sizeof(struct drvextra_cmd_parm));
+	pdrvextra_cmd_parm = kzalloc(sizeof(*pdrvextra_cmd_parm), GFP_KERNEL);
 	if (!pdrvextra_cmd_parm) {
 		kfree(ph2c);
 		res = _FAIL;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index f81a29cd6a78..ab6ed5ad1a22 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1337,7 +1337,7 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 			/* report to upper layer */
 			spin_lock_bh(&psta->lock);
 			if (psta->passoc_req && psta->assoc_req_len > 0) {
-				passoc_req = rtw_zmalloc(psta->assoc_req_len);
+				passoc_req = kzalloc(psta->assoc_req_len, GFP_ATOMIC);
 				if (passoc_req) {
 					assoc_req_len = psta->assoc_req_len;
 					memcpy(passoc_req, psta->passoc_req, assoc_req_len);
@@ -1887,13 +1887,13 @@ signed int rtw_set_auth(struct adapter *adapter, struct security_priv *psecurity
 	struct	cmd_priv *pcmdpriv = &adapter->cmdpriv;
 	signed int		res = _SUCCESS;
 
-	pcmd = rtw_zmalloc(sizeof(struct cmd_obj));
+	pcmd = kzalloc(sizeof(*pcmd), GFP_KERNEL);
 	if (!pcmd) {
 		res = _FAIL;  /* try again */
 		goto exit;
 	}
 
-	psetauthparm = rtw_zmalloc(sizeof(struct setauth_parm));
+	psetauthparm = kzalloc(sizeof(*psetauthparm), GFP_KERNEL);
 	if (!psetauthparm) {
 		kfree(pcmd);
 		res = _FAIL;
@@ -1924,7 +1924,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 	struct cmd_priv *pcmdpriv = &adapter->cmdpriv;
 	signed int	res = _SUCCESS;
 
-	psetkeyparm = rtw_zmalloc(sizeof(struct setkey_parm));
+	psetkeyparm = kzalloc(sizeof(*psetkeyparm), GFP_KERNEL);
 	if (!psetkeyparm) {
 		res = _FAIL;
 		goto exit;
@@ -1966,7 +1966,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 	}
 
 	if (enqueue) {
-		pcmd = rtw_zmalloc(sizeof(struct cmd_obj));
+		pcmd = kzalloc(sizeof(*pcmd), GFP_KERNEL);
 		if (!pcmd) {
 			kfree(psetkeyparm);
 			res = _FAIL;  /* try again */
@@ -2073,7 +2073,7 @@ static void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 
 	buff = NULL;
 	if (authmode == WLAN_EID_VENDOR_SPECIFIC) {
-		buff = rtw_zmalloc(IW_CUSTOM_MAX);
+		buff = kzalloc(IW_CUSTOM_MAX, GFP_ATOMIC);
 		if (!buff)
 			return;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 04542219752c..ec2acb7999bf 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1334,9 +1334,8 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		spin_lock_bh(&pstat->lock);
 		kfree(pstat->passoc_req);
 		pstat->assoc_req_len = 0;
-		pstat->passoc_req =  rtw_zmalloc(pkt_len);
+		pstat->passoc_req = kmemdup(pframe, pkt_len, GFP_ATOMIC);
 		if (pstat->passoc_req) {
-			memcpy(pstat->passoc_req, pframe, pkt_len);
 			pstat->assoc_req_len = pkt_len;
 		}
 		spin_unlock_bh(&pstat->lock);
@@ -2348,7 +2347,7 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 			u8 *buf;
 			u8 *ies = pmgntframe->buf_addr+TXDESC_OFFSET+sizeof(struct ieee80211_hdr_3addr);
 
-			buf = rtw_zmalloc(MAX_IE_SZ);
+			buf = kzalloc(MAX_IE_SZ, GFP_ATOMIC);
 			if (!buf)
 				return;
 
@@ -4395,12 +4394,12 @@ void report_survey_event(struct adapter *padapter, union recv_frame *precv_frame
 	pmlmeext = &padapter->mlmeextpriv;
 	pcmdpriv = &padapter->cmdpriv;
 
-	pcmd_obj = rtw_zmalloc(sizeof(struct cmd_obj));
+	pcmd_obj = kzalloc(sizeof(*pcmd_obj), GFP_ATOMIC);
 	if (!pcmd_obj)
 		return;
 
 	cmdsz = (sizeof(struct survey_event) + sizeof(struct C2HEvent_Header));
-	pevtcmd = rtw_zmalloc(cmdsz);
+	pevtcmd = kzalloc(cmdsz, GFP_ATOMIC);
 	if (!pevtcmd) {
 		kfree(pcmd_obj);
 		return;
@@ -4448,12 +4447,12 @@ void report_surveydone_event(struct adapter *padapter)
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
-	pcmd_obj = rtw_zmalloc(sizeof(struct cmd_obj));
+	pcmd_obj = kzalloc(sizeof(*pcmd_obj), GFP_ATOMIC);
 	if (!pcmd_obj)
 		return;
 
 	cmdsz = (sizeof(struct surveydone_event) + sizeof(struct C2HEvent_Header));
-	pevtcmd = rtw_zmalloc(cmdsz);
+	pevtcmd = kzalloc(cmdsz, GFP_ATOMIC);
 	if (!pevtcmd) {
 		kfree(pcmd_obj);
 		return;
@@ -4493,12 +4492,12 @@ void report_join_res(struct adapter *padapter, int res)
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
-	pcmd_obj = rtw_zmalloc(sizeof(struct cmd_obj));
+	pcmd_obj = kzalloc(sizeof(*pcmd_obj), GFP_ATOMIC);
 	if (!pcmd_obj)
 		return;
 
 	cmdsz = (sizeof(struct joinbss_event) + sizeof(struct C2HEvent_Header));
-	pevtcmd = rtw_zmalloc(cmdsz);
+	pevtcmd = kzalloc(cmdsz, GFP_ATOMIC);
 	if (!pevtcmd) {
 		kfree(pcmd_obj);
 		return;
@@ -4542,12 +4541,12 @@ void report_wmm_edca_update(struct adapter *padapter)
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
-	pcmd_obj = rtw_zmalloc(sizeof(struct cmd_obj));
+	pcmd_obj = kzalloc(sizeof(*pcmd_obj), GFP_ATOMIC);
 	if (!pcmd_obj)
 		return;
 
 	cmdsz = (sizeof(struct wmm_event) + sizeof(struct C2HEvent_Header));
-	pevtcmd = rtw_zmalloc(cmdsz);
+	pevtcmd = kzalloc(cmdsz, GFP_ATOMIC);
 	if (!pevtcmd) {
 		kfree(pcmd_obj);
 		return;
@@ -4588,12 +4587,12 @@ void report_del_sta_event(struct adapter *padapter, unsigned char *MacAddr, unsi
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
-	pcmd_obj = rtw_zmalloc(sizeof(struct cmd_obj));
+	pcmd_obj = kzalloc(sizeof(*pcmd_obj), GFP_ATOMIC);
 	if (!pcmd_obj)
 		return;
 
 	cmdsz = (sizeof(struct stadel_event) + sizeof(struct C2HEvent_Header));
-	pevtcmd = rtw_zmalloc(cmdsz);
+	pevtcmd = kzalloc(cmdsz, GFP_ATOMIC);
 	if (!pevtcmd) {
 		kfree(pcmd_obj);
 		return;
@@ -4639,12 +4638,12 @@ void report_add_sta_event(struct adapter *padapter, unsigned char *MacAddr, int
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
-	pcmd_obj = rtw_zmalloc(sizeof(struct cmd_obj));
+	pcmd_obj = kzalloc(sizeof(*pcmd_obj), GFP_ATOMIC);
 	if (!pcmd_obj)
 		return;
 
 	cmdsz = (sizeof(struct stassoc_event) + sizeof(struct C2HEvent_Header));
-	pevtcmd = rtw_zmalloc(cmdsz);
+	pevtcmd = kzalloc(cmdsz, GFP_ATOMIC);
 	if (!pevtcmd) {
 		kfree(pcmd_obj);
 		return;
@@ -5085,11 +5084,11 @@ void survey_timer_hdl(struct timer_list *t)
 			pmlmeext->scan_abort = false;/* reset */
 		}
 
-		ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+		ph2c = kzalloc(sizeof(*ph2c), GFP_ATOMIC);
 		if (!ph2c)
 			return;
 
-		psurveyPara = rtw_zmalloc(sizeof(struct sitesurvey_parm));
+		psurveyPara = kzalloc(sizeof(*psurveyPara), GFP_ATOMIC);
 		if (!psurveyPara) {
 			kfree(ph2c);
 			return;
@@ -5699,7 +5698,7 @@ u8 chk_bmc_sleepq_cmd(struct adapter *padapter)
 	struct cmd_priv *pcmdpriv = &(padapter->cmdpriv);
 	u8 res = _SUCCESS;
 
-	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+	ph2c = kzalloc(sizeof(*ph2c), GFP_ATOMIC);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
@@ -5723,13 +5722,13 @@ u8 set_tx_beacon_cmd(struct adapter *padapter)
 	u8 res = _SUCCESS;
 	int len_diff = 0;
 
-	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+	ph2c = kzalloc(sizeof(*ph2c), GFP_ATOMIC);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	ptxBeacon_parm = rtw_zmalloc(sizeof(struct Tx_Beacon_param));
+	ptxBeacon_parm = kzalloc(sizeof(*ptxBeacon_parm), GFP_ATOMIC);
 	if (!ptxBeacon_parm) {
 		kfree(ph2c);
 		res = _FAIL;
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 24cc4a9e0445..36798e23a650 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1425,7 +1425,7 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 			memcpy(pattrib->ta, GetAddr2Ptr(ptr), ETH_ALEN);
 			/* actual management data frame body */
 			data_len = pattrib->pkt_len - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
-			mgmt_DATA = rtw_zmalloc(data_len);
+			mgmt_DATA = kzalloc(data_len, GFP_ATOMIC);
 			if (!mgmt_DATA)
 				goto validate_80211w_fail;
 			precv_frame = decryptor(adapter, precv_frame);
diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 86e54454145a..bd179daab35e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1316,8 +1316,7 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
 	__le64 le_tmp64;
 
 	ori_len = pattrib->pkt_len - WLAN_HDR_A3_LEN + BIP_AAD_SIZE;
-	BIP_AAD = rtw_zmalloc(ori_len);
-
+	BIP_AAD = kzalloc(ori_len, GFP_KERNEL);
 	if (!BIP_AAD)
 		return _FAIL;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 9ab9fb25ced4..d7b0bf237e21 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1132,7 +1132,7 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	if (memcmp(cur_network->network.mac_address, pbssid, 6))
 		return true;
 
-	bssid = rtw_zmalloc(sizeof(struct wlan_bssid_ex));
+	bssid = kzalloc(sizeof(*bssid), GFP_KERNEL);
 	if (!bssid)
 		return true;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 9cead1455bfa..b2237576b58a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1170,7 +1170,7 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 	pwlanhdr = (struct ieee80211_hdr *)pframe;
 
 	ori_len = BIP_AAD_SIZE + pattrib->pktlen;
-	tmp_buf = BIP_AAD = rtw_zmalloc(ori_len);
+	tmp_buf = BIP_AAD = kzalloc(ori_len, GFP_ATOMIC);
 	subtype = GetFrameSubType(pframe); /* bit(7)~bit(2) */
 
 	if (!BIP_AAD)
@@ -1674,8 +1674,7 @@ struct xmit_frame *rtw_alloc_xmitframe_once(struct xmit_priv *pxmitpriv)
 	struct xmit_frame *pxframe = NULL;
 	u8 *alloc_addr;
 
-	alloc_addr = rtw_zmalloc(sizeof(struct xmit_frame) + 4);
-
+	alloc_addr = kzalloc(sizeof(*pxframe) + 4, GFP_ATOMIC);
 	if (!alloc_addr)
 		goto exit;
 
@@ -1846,8 +1845,7 @@ s32 rtw_alloc_hwxmits(struct adapter *padapter)
 
 	pxmitpriv->hwxmits = NULL;
 
-	pxmitpriv->hwxmits = rtw_zmalloc(sizeof(struct hw_xmit) * pxmitpriv->hwxmit_entry);
-
+	pxmitpriv->hwxmits = kcalloc(pxmitpriv->hwxmit_entry, sizeof(*hwxmits), GFP_ATOMIC);
 	if (!pxmitpriv->hwxmits)
 		return _FAIL;
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index 399edfbf8ec6..e739f55ba34d 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -159,7 +159,7 @@ static void rtl8723bs_c2h_packet_handler(struct adapter *padapter,
 	if (length == 0)
 		return;
 
-	tmp = rtw_zmalloc(length);
+	tmp = kzalloc(length, GFP_ATOMIC);
 	if (!tmp)
 		return;
 
@@ -382,7 +382,7 @@ s32 rtl8723bs_init_recv_priv(struct adapter *padapter)
 	spin_lock_init(&precvpriv->recv_buf_pending_queue.lock);
 
 	n = NR_RECVBUFF * sizeof(struct recv_buf) + 4;
-	precvpriv->pallocated_recv_buf = rtw_zmalloc(n);
+	precvpriv->pallocated_recv_buf = kzalloc(n, GFP_KERNEL);
 	if (!precvpriv->pallocated_recv_buf) {
 		res = _FAIL;
 		goto exit;
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 7d211464cb2f..ad1f01ffbc87 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -896,7 +896,7 @@ void sd_int_dpc(struct adapter *adapter)
 	if (hal->sdio_hisr & SDIO_HISR_C2HCMD) {
 		struct c2h_evt_hdr_88xx *c2h_evt;
 
-		c2h_evt = rtw_zmalloc(16);
+		c2h_evt = kzalloc(16, GFP_ATOMIC);
 		if (c2h_evt) {
 			if (c2h_evt_read_88xx(adapter, (u8 *)c2h_evt) == _SUCCESS) {
 				if (c2h_id_filter_ccx_8723b((u8 *)c2h_evt)) {
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index b4bc6c345fbe..779ac82a6de7 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -111,6 +111,7 @@ static struct ieee80211_supported_band *rtw_spt_band_alloc(
 {
 	struct ieee80211_supported_band *spt_band = NULL;
 	int n_channels, n_bitrates;
+	size_t alloc_size;
 
 	if (band == NL80211_BAND_2GHZ) {
 		n_channels = RTW_2G_CHANNELS_NUM;
@@ -119,9 +120,10 @@ static struct ieee80211_supported_band *rtw_spt_band_alloc(
 		goto exit;
 	}
 
-	spt_band = rtw_zmalloc(sizeof(struct ieee80211_supported_band) +
-			       sizeof(struct ieee80211_channel) * n_channels +
-			       sizeof(struct ieee80211_rate) * n_bitrates);
+	alloc_size = sizeof(*spt_band);
+	alloc_size = size_add(alloc_size, array_size(n_channels, sizeof(struct ieee80211_channel)));
+	alloc_size = size_add(alloc_size, array_size(n_bitrates, sizeof(struct ieee80211_rate)));
+	spt_band = kzalloc(alloc_size, GFP_KERNEL);
 	if (!spt_band)
 		goto exit;
 
@@ -1430,7 +1432,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 		goto exit;
 	}
 
-	buf = rtw_zmalloc(ielen);
+	buf = kzalloc(ielen, GFP_KERNEL);
 	if (!buf) {
 		ret =  -ENOMEM;
 		goto exit;
@@ -2147,7 +2149,7 @@ static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name, str
 	pnpi->sizeof_priv = sizeof(struct adapter);
 
 	/*  wdev */
-	mon_wdev = rtw_zmalloc(sizeof(struct wireless_dev));
+	mon_wdev = kzalloc(sizeof(*mon_wdev), GFP_KERNEL);
 	if (!mon_wdev) {
 		ret = -ENOMEM;
 		goto out;
@@ -2257,7 +2259,7 @@ static int rtw_add_beacon(struct adapter *adapter, const u8 *head, size_t head_l
 	if (head_len < 24)
 		return -EINVAL;
 
-	pbuf = rtw_zmalloc(head_len + tail_len);
+	pbuf = kzalloc(head_len + tail_len, GFP_KERNEL);
 	if (!pbuf)
 		return -ENOMEM;
 
@@ -2728,7 +2730,7 @@ int rtw_wdev_alloc(struct adapter *padapter, struct device *dev)
 		goto free_wiphy;
 
 	/*  wdev */
-	wdev = rtw_zmalloc(sizeof(struct wireless_dev));
+	wdev = kzalloc(sizeof(*wdev), GFP_KERNEL);
 	if (!wdev) {
 		ret = -ENOMEM;
 		goto unregister_wiphy;
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index bc02db13781c..b45104037d6d 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -559,7 +559,7 @@ struct dvobj_priv *devobj_init(void)
 {
 	struct dvobj_priv *pdvobj = NULL;
 
-	pdvobj = rtw_zmalloc(sizeof(*pdvobj));
+	pdvobj = kzalloc(sizeof(*pdvobj), GFP_KERNEL);
 	if (!pdvobj)
 		return NULL;
 
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 944b9c724b32..20d2926a4480 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -46,7 +46,7 @@ signed int rtw_endofpktfile(struct pkt_file *pfile)
 int rtw_os_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 alloc_sz, u8 flag)
 {
 	if (alloc_sz > 0) {
-		pxmitbuf->pallocated_buf = rtw_zmalloc(alloc_sz);
+		pxmitbuf->pallocated_buf = kzalloc(alloc_sz, GFP_KERNEL);
 		if (!pxmitbuf->pallocated_buf)
 			return _FAIL;
 
-- 
2.43.0

