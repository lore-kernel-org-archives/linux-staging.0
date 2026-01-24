Received: from cvsmtppost08.nm.naver.com (cvsmtppost08.nm.naver.com [114.111.35.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9F11FDE14
	for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 15:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769269326; cv=none; b=brCSEJR1KFAPXublbsZWjGJX6vtjl8+c7LmPTRjmSXFJOnjKEwR3gpNOPng3fF2IrABYXBPU5RpDFo7rpMjdpxgrm7RYJlYvJphcRAt1/vf19i9Zmw5YDlRmgjSclx6q92omAo2h0MNYaQlB6tjQbDPjjd2Q/YZcfyZtk2WU8Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769269326; c=relaxed/simple;
	bh=Zvx9SfgodA3JR/yVEeLqE5a7+DwZyZjl7MuY6oCMVpE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wa5m9VXJG3QOccWJCyMrFwLZXAEgWk2x7Hmc83YaAhHZ55x3R3Wb5ROKd0cc/3dX9+lotF38nz7eRwPRpqYeE9kwFAWRRxblZNcigty8S+JLeVE+5xDe5JReKvOTT9ZHNOI90IzESRSuI5UcqX84dZ40mWipQuOzfjZ7Xo1UigQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=D8BLhoSo; arc=none smtp.client-ip=114.111.35.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="D8BLhoSo"
Received: from cvsendbo020.nm ([10.112.24.40])
  by cvsmtppost08.nm.naver.com with ESMTP id odXg5SJlSyOqRlkA0Ydyzg
  for <linux-staging@lists.linux.dev>;
  Sat, 24 Jan 2026 15:41:54 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769269314; bh=Zvx9SfgodA3JR/yVEeLqE5a7+DwZyZjl7MuY6oCMVpE=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=D8BLhoSoAzh0Hl7xTdU6g4tCWLNzYM+UL4+urE9ARuD0peJY1/P3KZ7BQL9EwCUFE
	 MEqm/GYHkhzo3RkzihPzfJEd1ZY10yDlTcpfBHnPnZyIWhb4iTQM4k2t0yg9z/mkpf
	 nJkoxTNuwKTK9jLgczaOmWF8zW9QDhQNpnuRk9p8p1/K7RusqCJmpneZ4WCpfhIISm
	 +e4ZqVwf0nYLXOH6MQjjcIfFaf5ocCjXsQKUX8Pa+aEczKnrLdWU8Q4SMxvKE3drfn
	 HJKFf9co/msn+fxUKHkMuers6D4lID9Xa25RcVm0sjHMvq6RT5MULoUCY+0Pq/dg33
	 WNu43y5rqhLuA==
X-Session-ID: RCeI70aKR9GQ1Ia4nv9kVw
X-Works-Send-Opt: 6/Y9jAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: YqYqKovrFqJZ+HmqKxvr+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp012.nm.naver.com with ESMTP id RCeI70aKR9GQ1Ia4nv9kVw
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Sat, 24 Jan 2026 15:41:53 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	andy@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH v2] staging: rtl8723bs: Remove wrapper functions in osdep_service
Date: Sun, 25 Jan 2026 00:41:45 +0900
Message-ID: <20260124154145.541997-1-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary wrapper functions _rtw_malloc, _rtw_zmalloc,
_rtw_skb_alloc, and _rtw_skb_copy from osdep_service.c.

These wrappers were using 'in_interrupt()' to determine allocation flags,
which is unreliable and discouraged.

Callers have been updated to use standard kernel functions directly:
    - _rtw_malloc() -> kmalloc()
    - _rtw_zmalloc() -> kzalloc()
    - _rtw_skb_alloc() -> __dev_alloc_skb()
    - _rtw_skb_copy() -> skb_copy()

All call sites have been manually reviewed and converted to kzalloc, kmalloc.
The GFP flags were chosen based on the calling context:
    - GFP_ATOMIC is used for atomic contexts. (irq handler, holding
      spinlock)
    - GFP_KERNEL is used for initialization, configuration, and command paths.

Signed-off-by: Minu Jin <s9430939@naver.com>
---
Changes in v2:
    - Removed _rtw_malloc, _rtw_zmalloc, _rtw_skb_alloc, and _rtw_skb_copy wrappers.
    - Replaced all call sites with standard kernel functions (kmalloc, kzalloc, etc.).
    - Manually assigned appropriate GFP flags based on the calling context.
    - Verified the context safety using Smatch.

 drivers/staging/rtl8723bs/core/rtw_ap.c       | 12 +--
 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 80 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 12 +--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 40 +++++-----
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  4 +-
 drivers/staging/rtl8723bs/core/rtw_security.c |  2 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  6 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  4 +-
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |  8 +-
 drivers/staging/rtl8723bs/hal/sdio_ops.c      | 18 ++---
 .../staging/rtl8723bs/include/osdep_service.h | 11 ---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 22 +++--
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  2 +-
 .../staging/rtl8723bs/os_dep/osdep_service.c  | 24 +-----
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c |  4 +-
 16 files changed, 108 insertions(+), 143 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 67197c7d4a4d..4a657e548a19 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -115,7 +115,7 @@ static void update_BCNTIM(struct adapter *padapter)
 	}
 
 	if (remainder_ielen > 0) {
-		pbackup_remainder_ie = rtw_malloc(remainder_ielen);
+		pbackup_remainder_ie = kmalloc(remainder_ielen, GFP_KERNEL);
 		if (pbackup_remainder_ie && premainder_ie)
 			memcpy(pbackup_remainder_ie, premainder_ie, remainder_ielen);
 	}
@@ -1230,13 +1230,13 @@ u8 rtw_ap_set_pairwise_key(struct adapter *padapter, struct sta_info *psta)
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
-	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	psetstakey_para = rtw_zmalloc(sizeof(struct set_stakey_parm));
+	psetstakey_para = kzalloc(sizeof(struct set_stakey_parm), GFP_KERNEL);
 	if (!psetstakey_para) {
 		kfree(ph2c);
 		res = _FAIL;
@@ -1270,12 +1270,12 @@ static int rtw_ap_set_key(struct adapter *padapter,
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	int res = _SUCCESS;
 
-	pcmd = rtw_zmalloc(sizeof(struct cmd_obj));
+	pcmd = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 	if (!pcmd) {
 		res = _FAIL;
 		goto exit;
 	}
-	psetkeyparm = rtw_zmalloc(sizeof(struct setkey_parm));
+	psetkeyparm = kzalloc(sizeof(struct setkey_parm), GFP_KERNEL);
 	if (!psetkeyparm) {
 		kfree(pcmd);
 		res = _FAIL;
@@ -1441,7 +1441,7 @@ static void update_bcn_wps_ie(struct adapter *padapter)
 	remainder_ielen = ielen - wps_offset - wps_ielen;
 
 	if (remainder_ielen > 0) {
-		pbackup_remainder_ie = rtw_malloc(remainder_ielen);
+		pbackup_remainder_ie = kmalloc(remainder_ielen, GFP_KERNEL);
 		if (pbackup_remainder_ie)
 			memcpy(pbackup_remainder_ie, premainder_ie, remainder_ielen);
 	}
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index ef2d92b5588a..7cd63bcde88f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -170,14 +170,14 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 
 	pcmdpriv->cmd_seq = 1;
 
-	pcmdpriv->cmd_allocated_buf = rtw_zmalloc(MAX_CMDSZ + CMDBUFF_ALIGN_SZ);
+	pcmdpriv->cmd_allocated_buf = kzalloc(MAX_CMDSZ + CMDBUFF_ALIGN_SZ, GFP_KERNEL);
 
 	if (!pcmdpriv->cmd_allocated_buf)
 		return -ENOMEM;
 
 	pcmdpriv->cmd_buf = pcmdpriv->cmd_allocated_buf  +  CMDBUFF_ALIGN_SZ - ((SIZE_PTR)(pcmdpriv->cmd_allocated_buf) & (CMDBUFF_ALIGN_SZ-1));
 
-	pcmdpriv->rsp_allocated_buf = rtw_zmalloc(MAX_RSPSZ + 4);
+	pcmdpriv->rsp_allocated_buf = kzalloc(MAX_RSPSZ + 4, GFP_KERNEL);
 
 	if (!pcmdpriv->rsp_allocated_buf) {
 		kfree(pcmdpriv->cmd_allocated_buf);
@@ -534,11 +534,11 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 	if (check_fwstate(pmlmepriv, _FW_LINKED))
 		rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_SCAN, 1);
 
-	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 	if (!ph2c)
 		return _FAIL;
 
-	psurveyPara = rtw_zmalloc(sizeof(struct sitesurvey_parm));
+	psurveyPara = kzalloc(sizeof(struct sitesurvey_parm), GFP_KERNEL);
 	if (!psurveyPara) {
 		kfree(ph2c);
 		return _FAIL;
@@ -602,7 +602,7 @@ u8 rtw_createbss_cmd(struct adapter  *padapter)
 	struct wlan_bssid_ex *pdev_network = &padapter->registrypriv.dev_network;
 	u8 res = _SUCCESS;
 
-	pcmd = rtw_zmalloc(sizeof(struct cmd_obj));
+	pcmd = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 	if (!pcmd) {
 		res = _FAIL;
 		goto exit;
@@ -635,7 +635,7 @@ int rtw_startbss_cmd(struct adapter  *padapter, int flags)
 		start_bss_network(padapter);
 	} else {
 		/* need enqueue, prepare cmd_obj and enqueue */
-		pcmd = rtw_zmalloc(sizeof(struct cmd_obj));
+		pcmd = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 		if (!pcmd) {
 			res = _FAIL;
 			goto exit;
@@ -687,7 +687,7 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	u32 tmp_len;
 	u8 *ptmp = NULL;
 
-	pcmd = rtw_zmalloc(sizeof(struct cmd_obj));
+	pcmd = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 	if (!pcmd) {
 		res = _FAIL;
 		goto exit;
@@ -796,7 +796,7 @@ u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueu
 	u8 res = _SUCCESS;
 
 	/* prepare cmd parameter */
-	param = rtw_zmalloc(sizeof(*param));
+	param = kzalloc(sizeof(*param), GFP_KERNEL);
 	if (!param) {
 		res = _FAIL;
 		goto exit;
@@ -805,7 +805,7 @@ u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueu
 
 	if (enqueue) {
 		/* need enqueue, prepare cmd_obj and enqueue */
-		cmdobj = rtw_zmalloc(sizeof(*cmdobj));
+		cmdobj = kzalloc(sizeof(*cmdobj), GFP_KERNEL);
 		if (!cmdobj) {
 			res = _FAIL;
 			kfree(param);
@@ -832,7 +832,7 @@ u8 rtw_setopmode_cmd(struct adapter  *padapter, enum ndis_802_11_network_infrast
 	struct	cmd_priv   *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
-	psetop = rtw_zmalloc(sizeof(struct setopmode_parm));
+	psetop = kzalloc(sizeof(struct setopmode_parm), GFP_KERNEL);
 
 	if (!psetop) {
 		res = _FAIL;
@@ -841,7 +841,7 @@ u8 rtw_setopmode_cmd(struct adapter  *padapter, enum ndis_802_11_network_infrast
 	psetop->mode = (u8)networktype;
 
 	if (enqueue) {
-		ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+		ph2c = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 		if (!ph2c) {
 			kfree(psetop);
 			res = _FAIL;
@@ -868,7 +868,7 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	u8 res = _SUCCESS;
 
-	psetstakey_para = rtw_zmalloc(sizeof(struct set_stakey_parm));
+	psetstakey_para = kzalloc(sizeof(struct set_stakey_parm), GFP_KERNEL);
 	if (!psetstakey_para) {
 		res = _FAIL;
 		goto exit;
@@ -890,14 +890,14 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 	padapter->securitypriv.busetkipkey = true;
 
 	if (enqueue) {
-		ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+		ph2c = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 		if (!ph2c) {
 			kfree(psetstakey_para);
 			res = _FAIL;
 			goto exit;
 		}
 
-		psetstakey_rsp = rtw_zmalloc(sizeof(struct set_stakey_rsp));
+		psetstakey_rsp = kzalloc(sizeof(struct set_stakey_rsp), GFP_KERNEL);
 		if (!psetstakey_rsp) {
 			kfree(ph2c);
 			kfree(psetstakey_para);
@@ -935,20 +935,20 @@ u8 rtw_clearstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 enqueu
 			rtw_camid_free(padapter, cam_id);
 		}
 	} else {
-		ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+		ph2c = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 		if (!ph2c) {
 			res = _FAIL;
 			goto exit;
 		}
 
-		psetstakey_para = rtw_zmalloc(sizeof(struct set_stakey_parm));
+		psetstakey_para = kzalloc(sizeof(struct set_stakey_parm), GFP_KERNEL);
 		if (!psetstakey_para) {
 			kfree(ph2c);
 			res = _FAIL;
 			goto exit;
 		}
 
-		psetstakey_rsp = rtw_zmalloc(sizeof(struct set_stakey_rsp));
+		psetstakey_rsp = kzalloc(sizeof(struct set_stakey_rsp), GFP_KERNEL);
 		if (!psetstakey_rsp) {
 			kfree(ph2c);
 			kfree(psetstakey_para);
@@ -978,13 +978,13 @@ u8 rtw_addbareq_cmd(struct adapter *padapter, u8 tid, u8 *addr)
 
 	u8 res = _SUCCESS;
 
-	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	paddbareq_parm = rtw_zmalloc(sizeof(struct addBaReq_parm));
+	paddbareq_parm = kzalloc(sizeof(struct addBaReq_parm), GFP_KERNEL);
 	if (!paddbareq_parm) {
 		kfree(ph2c);
 		res = _FAIL;
@@ -1010,13 +1010,13 @@ u8 rtw_reset_securitypriv_cmd(struct adapter *padapter)
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
-	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	pdrvextra_cmd_parm = rtw_zmalloc(sizeof(struct drvextra_cmd_parm));
+	pdrvextra_cmd_parm = kzalloc(sizeof(struct drvextra_cmd_parm), GFP_KERNEL);
 	if (!pdrvextra_cmd_parm) {
 		kfree(ph2c);
 		res = _FAIL;
@@ -1043,13 +1043,13 @@ u8 rtw_free_assoc_resources_cmd(struct adapter *padapter)
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
-	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	pdrvextra_cmd_parm = rtw_zmalloc(sizeof(struct drvextra_cmd_parm));
+	pdrvextra_cmd_parm = kzalloc(sizeof(struct drvextra_cmd_parm), GFP_KERNEL);
 	if (!pdrvextra_cmd_parm) {
 		kfree(ph2c);
 		res = _FAIL;
@@ -1077,13 +1077,13 @@ u8 rtw_dynamic_chk_wk_cmd(struct adapter *padapter)
 	u8 res = _SUCCESS;
 
 	/* only  primary padapter does this cmd */
-	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	pdrvextra_cmd_parm = rtw_zmalloc(sizeof(struct drvextra_cmd_parm));
+	pdrvextra_cmd_parm = kzalloc(sizeof(struct drvextra_cmd_parm), GFP_KERNEL);
 	if (!pdrvextra_cmd_parm) {
 		kfree(ph2c);
 		res = _FAIL;
@@ -1318,13 +1318,13 @@ u8 rtw_lps_ctrl_wk_cmd(struct adapter *padapter, u8 lps_ctrl_type, u8 enqueue)
 	u8 res = _SUCCESS;
 
 	if (enqueue) {
-		ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+		ph2c = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 		if (!ph2c) {
 			res = _FAIL;
 			goto exit;
 		}
 
-		pdrvextra_cmd_parm = rtw_zmalloc(sizeof(struct drvextra_cmd_parm));
+		pdrvextra_cmd_parm = kzalloc(sizeof(struct drvextra_cmd_parm), GFP_KERNEL);
 		if (!pdrvextra_cmd_parm) {
 			kfree(ph2c);
 			res = _FAIL;
@@ -1359,13 +1359,13 @@ u8 rtw_dm_in_lps_wk_cmd(struct adapter *padapter)
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
-	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	pdrvextra_cmd_parm = rtw_zmalloc(sizeof(struct drvextra_cmd_parm));
+	pdrvextra_cmd_parm = kzalloc(sizeof(struct drvextra_cmd_parm), GFP_KERNEL);
 	if (!pdrvextra_cmd_parm) {
 		kfree(ph2c);
 		res = _FAIL;
@@ -1421,13 +1421,13 @@ u8 rtw_dm_ra_mask_wk_cmd(struct adapter *padapter, u8 *psta)
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
-	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	pdrvextra_cmd_parm = rtw_zmalloc(sizeof(struct drvextra_cmd_parm));
+	pdrvextra_cmd_parm = kzalloc(sizeof(struct drvextra_cmd_parm), GFP_KERNEL);
 	if (!pdrvextra_cmd_parm) {
 		kfree(ph2c);
 		res = _FAIL;
@@ -1456,13 +1456,13 @@ u8 rtw_ps_cmd(struct adapter *padapter)
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
-	ppscmd = rtw_zmalloc(sizeof(struct cmd_obj));
+	ppscmd = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 	if (!ppscmd) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	pdrvextra_cmd_parm = rtw_zmalloc(sizeof(struct drvextra_cmd_parm));
+	pdrvextra_cmd_parm = kzalloc(sizeof(struct drvextra_cmd_parm), GFP_KERNEL);
 	if (!pdrvextra_cmd_parm) {
 		kfree(ppscmd);
 		res = _FAIL;
@@ -1528,13 +1528,13 @@ u8 rtw_chk_hi_queue_cmd(struct adapter *padapter)
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
-	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	pdrvextra_cmd_parm = rtw_zmalloc(sizeof(struct drvextra_cmd_parm));
+	pdrvextra_cmd_parm = kzalloc(sizeof(struct drvextra_cmd_parm), GFP_KERNEL);
 	if (!pdrvextra_cmd_parm) {
 		kfree(ph2c);
 		res = _FAIL;
@@ -1620,13 +1620,13 @@ u8 rtw_c2h_packet_wk_cmd(struct adapter *padapter, u8 *pbuf, u16 length)
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
-	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	pdrvextra_cmd_parm = rtw_zmalloc(sizeof(struct drvextra_cmd_parm));
+	pdrvextra_cmd_parm = kzalloc(sizeof(struct drvextra_cmd_parm), GFP_KERNEL);
 	if (!pdrvextra_cmd_parm) {
 		kfree(ph2c);
 		res = _FAIL;
@@ -1655,13 +1655,13 @@ u8 rtw_c2h_wk_cmd(struct adapter *padapter, u8 *c2h_evt)
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
-	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	pdrvextra_cmd_parm = rtw_zmalloc(sizeof(struct drvextra_cmd_parm));
+	pdrvextra_cmd_parm = kzalloc(sizeof(struct drvextra_cmd_parm), GFP_KERNEL);
 	if (!pdrvextra_cmd_parm) {
 		kfree(ph2c);
 		res = _FAIL;
@@ -1697,7 +1697,7 @@ static void c2h_wk_callback(struct work_struct *work)
 			/* This C2H event is read, clear it */
 			c2h_evt_clear(adapter);
 		} else {
-			c2h_evt = rtw_malloc(16);
+			c2h_evt = kmalloc(16, GFP_KERNEL);
 			if (c2h_evt) {
 				/* This C2H event is not read, read & clear now */
 				if (c2h_evt_read_88xx(adapter, c2h_evt) != _SUCCESS) {
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 98704179ad35..b9b5f6d17179 100644
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
+	pcmd = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 	if (!pcmd) {
 		res = _FAIL;  /* try again */
 		goto exit;
 	}
 
-	psetauthparm = rtw_zmalloc(sizeof(struct setauth_parm));
+	psetauthparm = kzalloc(sizeof(struct setauth_parm), GFP_KERNEL);
 	if (!psetauthparm) {
 		kfree(pcmd);
 		res = _FAIL;
@@ -1924,7 +1924,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 	struct cmd_priv *pcmdpriv = &adapter->cmdpriv;
 	signed int	res = _SUCCESS;
 
-	psetkeyparm = rtw_zmalloc(sizeof(struct setkey_parm));
+	psetkeyparm = kzalloc(sizeof(struct setkey_parm), GFP_KERNEL);
 	if (!psetkeyparm) {
 		res = _FAIL;
 		goto exit;
@@ -1966,7 +1966,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 	}
 
 	if (enqueue) {
-		pcmd = rtw_zmalloc(sizeof(struct cmd_obj));
+		pcmd = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 		if (!pcmd) {
 			kfree(psetkeyparm);
 			res = _FAIL;  /* try again */
@@ -2073,7 +2073,7 @@ static void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 
 	buff = NULL;
 	if (authmode == WLAN_EID_VENDOR_SPECIFIC) {
-		buff = rtw_zmalloc(IW_CUSTOM_MAX);
+		buff = kzalloc(IW_CUSTOM_MAX, GFP_KERNEL);
 		if (!buff)
 			return;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index ac49bfbaa5bb..1773d70e0d1f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -589,7 +589,7 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 	if (!memcmp(GetAddr3Ptr(pframe), get_my_bssid(&pmlmeinfo->network), ETH_ALEN)) {
 		if (pmlmeinfo->state & WIFI_FW_AUTH_NULL) {
 			/* we should update current network before auth, or some IE is wrong */
-			pbss = rtw_malloc(sizeof(struct wlan_bssid_ex));
+			pbss = kmalloc(sizeof(struct wlan_bssid_ex), GFP_KERNEL);
 			if (pbss) {
 				if (collect_bss_info(padapter, precv_frame, pbss) == _SUCCESS) {
 					update_network(&(pmlmepriv->cur_network.network), pbss, padapter, true);
@@ -1334,7 +1334,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		spin_lock_bh(&pstat->lock);
 		kfree(pstat->passoc_req);
 		pstat->assoc_req_len = 0;
-		pstat->passoc_req =  rtw_zmalloc(pkt_len);
+		pstat->passoc_req =  kzalloc(pkt_len, GFP_ATOMIC);
 		if (pstat->passoc_req) {
 			memcpy(pstat->passoc_req, pframe, pkt_len);
 			pstat->assoc_req_len = pkt_len;
@@ -2348,7 +2348,7 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 			u8 *buf;
 			u8 *ies = pmgntframe->buf_addr+TXDESC_OFFSET+sizeof(struct ieee80211_hdr_3addr);
 
-			buf = rtw_zmalloc(MAX_IE_SZ);
+			buf = kzalloc(MAX_IE_SZ, GFP_KERNEL);
 			if (!buf)
 				return;
 
@@ -4395,12 +4395,12 @@ void report_survey_event(struct adapter *padapter, union recv_frame *precv_frame
 	pmlmeext = &padapter->mlmeextpriv;
 	pcmdpriv = &padapter->cmdpriv;
 
-	pcmd_obj = rtw_zmalloc(sizeof(struct cmd_obj));
+	pcmd_obj = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 	if (!pcmd_obj)
 		return;
 
 	cmdsz = (sizeof(struct survey_event) + sizeof(struct C2HEvent_Header));
-	pevtcmd = rtw_zmalloc(cmdsz);
+	pevtcmd = kzalloc(cmdsz, GFP_KERNEL);
 	if (!pevtcmd) {
 		kfree(pcmd_obj);
 		return;
@@ -4448,12 +4448,12 @@ void report_surveydone_event(struct adapter *padapter)
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
-	pcmd_obj = rtw_zmalloc(sizeof(struct cmd_obj));
+	pcmd_obj = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 	if (!pcmd_obj)
 		return;
 
 	cmdsz = (sizeof(struct surveydone_event) + sizeof(struct C2HEvent_Header));
-	pevtcmd = rtw_zmalloc(cmdsz);
+	pevtcmd = kzalloc(cmdsz, GFP_KERNEL);
 	if (!pevtcmd) {
 		kfree(pcmd_obj);
 		return;
@@ -4493,12 +4493,12 @@ void report_join_res(struct adapter *padapter, int res)
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
-	pcmd_obj = rtw_zmalloc(sizeof(struct cmd_obj));
+	pcmd_obj = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 	if (!pcmd_obj)
 		return;
 
 	cmdsz = (sizeof(struct joinbss_event) + sizeof(struct C2HEvent_Header));
-	pevtcmd = rtw_zmalloc(cmdsz);
+	pevtcmd = kzalloc(cmdsz, GFP_KERNEL);
 	if (!pevtcmd) {
 		kfree(pcmd_obj);
 		return;
@@ -4542,12 +4542,12 @@ void report_wmm_edca_update(struct adapter *padapter)
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
-	pcmd_obj = rtw_zmalloc(sizeof(struct cmd_obj));
+	pcmd_obj = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 	if (!pcmd_obj)
 		return;
 
 	cmdsz = (sizeof(struct wmm_event) + sizeof(struct C2HEvent_Header));
-	pevtcmd = rtw_zmalloc(cmdsz);
+	pevtcmd = kzalloc(cmdsz, GFP_KERNEL);
 	if (!pevtcmd) {
 		kfree(pcmd_obj);
 		return;
@@ -4588,12 +4588,12 @@ void report_del_sta_event(struct adapter *padapter, unsigned char *MacAddr, unsi
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
-	pcmd_obj = rtw_zmalloc(sizeof(struct cmd_obj));
+	pcmd_obj = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 	if (!pcmd_obj)
 		return;
 
 	cmdsz = (sizeof(struct stadel_event) + sizeof(struct C2HEvent_Header));
-	pevtcmd = rtw_zmalloc(cmdsz);
+	pevtcmd = kzalloc(cmdsz, GFP_KERNEL);
 	if (!pevtcmd) {
 		kfree(pcmd_obj);
 		return;
@@ -4639,12 +4639,12 @@ void report_add_sta_event(struct adapter *padapter, unsigned char *MacAddr, int
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
-	pcmd_obj = rtw_zmalloc(sizeof(struct cmd_obj));
+	pcmd_obj = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 	if (!pcmd_obj)
 		return;
 
 	cmdsz = (sizeof(struct stassoc_event) + sizeof(struct C2HEvent_Header));
-	pevtcmd = rtw_zmalloc(cmdsz);
+	pevtcmd = kzalloc(cmdsz, GFP_KERNEL);
 	if (!pevtcmd) {
 		kfree(pcmd_obj);
 		return;
@@ -5085,11 +5085,11 @@ void survey_timer_hdl(struct timer_list *t)
 			pmlmeext->scan_abort = false;/* reset */
 		}
 
-		ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+		ph2c = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
 		if (!ph2c)
 			return;
 
-		psurveyPara = rtw_zmalloc(sizeof(struct sitesurvey_parm));
+		psurveyPara = kzalloc(sizeof(struct sitesurvey_parm), GFP_ATOMIC);
 		if (!psurveyPara) {
 			kfree(ph2c);
 			return;
@@ -5699,7 +5699,7 @@ u8 chk_bmc_sleepq_cmd(struct adapter *padapter)
 	struct cmd_priv *pcmdpriv = &(padapter->cmdpriv);
 	u8 res = _SUCCESS;
 
-	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
@@ -5723,13 +5723,13 @@ u8 set_tx_beacon_cmd(struct adapter *padapter)
 	u8 res = _SUCCESS;
 	int len_diff = 0;
 
-	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
+	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	ptxBeacon_parm = rtw_zmalloc(sizeof(struct Tx_Beacon_param));
+	ptxBeacon_parm = kzalloc(sizeof(struct Tx_Beacon_param), GFP_KERNEL);
 	if (!ptxBeacon_parm) {
 		kfree(ph2c);
 		res = _FAIL;
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index e893cb6fa273..b571a8386b39 100644
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
@@ -1630,7 +1630,7 @@ static struct sk_buff *rtw_alloc_msdu_pkt(union recv_frame *prframe, u16 nSubfra
 
 	pattrib = &prframe->u.hdr.attrib;
 
-	sub_skb = rtw_skb_alloc(nSubframe_Length + 12);
+	sub_skb = __dev_alloc_skb(nSubframe_Length + 12, GFP_ATOMIC);
 	if (!sub_skb)
 		return NULL;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 2f941ffbd465..871c10abdfb9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1316,7 +1316,7 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
 	__le64 le_tmp64;
 
 	ori_len = pattrib->pkt_len - WLAN_HDR_A3_LEN + BIP_AAD_SIZE;
-	BIP_AAD = rtw_zmalloc(ori_len);
+	BIP_AAD = kzalloc(ori_len, GFP_ATOMIC);
 
 	if (!BIP_AAD)
 		return _FAIL;
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 5ffefa50699e..b69d3d4b111c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1132,7 +1132,7 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	if (memcmp(cur_network->network.mac_address, pbssid, 6))
 		return true;
 
-	bssid = rtw_zmalloc(sizeof(struct wlan_bssid_ex));
+	bssid = kzalloc(sizeof(struct wlan_bssid_ex), GFP_KERNEL);
 	if (!bssid)
 		return true;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 21690857fd62..9f8af1f1741e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1159,7 +1159,7 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 	pwlanhdr = (struct ieee80211_hdr *)pframe;
 
 	ori_len = BIP_AAD_SIZE+pattrib->pktlen;
-	tmp_buf = BIP_AAD = rtw_zmalloc(ori_len);
+	tmp_buf = BIP_AAD = kzalloc(ori_len, GFP_KERNEL);
 	subtype = GetFrameSubType(pframe); /* bit(7)~bit(2) */
 
 	if (!BIP_AAD)
@@ -1662,7 +1662,7 @@ struct xmit_frame *rtw_alloc_xmitframe_once(struct xmit_priv *pxmitpriv)
 	struct xmit_frame *pxframe = NULL;
 	u8 *alloc_addr;
 
-	alloc_addr = rtw_zmalloc(sizeof(struct xmit_frame) + 4);
+	alloc_addr = kzalloc(sizeof(struct xmit_frame) + 4, GFP_KERNEL);
 
 	if (!alloc_addr)
 		goto exit;
@@ -1836,7 +1836,7 @@ s32 rtw_alloc_hwxmits(struct adapter *padapter)
 
 	pxmitpriv->hwxmits = NULL;
 
-	pxmitpriv->hwxmits = rtw_zmalloc(sizeof(struct hw_xmit) * pxmitpriv->hwxmit_entry);
+	pxmitpriv->hwxmits = kzalloc(sizeof(struct hw_xmit) * pxmitpriv->hwxmit_entry, GFP_KERNEL);
 
 	if (!pxmitpriv->hwxmits)
 		return _FAIL;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 57c83f332e74..003ab2938a5a 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -642,7 +642,7 @@ static void hal_ReadEFuse_WiFi(
 	if ((_offset + _size_byte) > EFUSE_MAX_MAP_LEN)
 		return;
 
-	efuseTbl = rtw_malloc(EFUSE_MAX_MAP_LEN);
+	efuseTbl = kmalloc(EFUSE_MAX_MAP_LEN, GFP_KERNEL);
 	if (!efuseTbl)
 		return;
 
@@ -730,7 +730,7 @@ static void hal_ReadEFuse_BT(
 	if ((_offset + _size_byte) > EFUSE_BT_MAP_LEN)
 		return;
 
-	efuseTbl = rtw_malloc(EFUSE_BT_MAP_LEN);
+	efuseTbl = kmalloc(EFUSE_BT_MAP_LEN, GFP_KERNEL);
 	if (!efuseTbl)
 		return;
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index 399edfbf8ec6..8811906ccb64 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -159,7 +159,7 @@ static void rtl8723bs_c2h_packet_handler(struct adapter *padapter,
 	if (length == 0)
 		return;
 
-	tmp = rtw_zmalloc(length);
+	tmp = kzalloc(length, GFP_KERNEL);
 	if (!tmp)
 		return;
 
@@ -292,7 +292,7 @@ static void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
 					alloc_sz += 14;
 				}
 
-				pkt_copy = rtw_skb_alloc(alloc_sz);
+				pkt_copy = __dev_alloc_skb(alloc_sz, GFP_ATOMIC);
 				if (!pkt_copy) {
 					rtw_free_recvframe(precvframe, &precvpriv->free_recv_queue);
 					break;
@@ -382,7 +382,7 @@ s32 rtl8723bs_init_recv_priv(struct adapter *padapter)
 	spin_lock_init(&precvpriv->recv_buf_pending_queue.lock);
 
 	n = NR_RECVBUFF * sizeof(struct recv_buf) + 4;
-	precvpriv->pallocated_recv_buf = rtw_zmalloc(n);
+	precvpriv->pallocated_recv_buf = kzalloc(n, GFP_KERNEL);
 	if (!precvpriv->pallocated_recv_buf) {
 		res = _FAIL;
 		goto exit;
@@ -399,7 +399,7 @@ s32 rtl8723bs_init_recv_priv(struct adapter *padapter)
 			SIZE_PTR tmpaddr = 0;
 			SIZE_PTR alignment = 0;
 
-			precvbuf->pskb = rtw_skb_alloc(MAX_RECVBUF_SZ + RECVBUFF_ALIGN_SZ);
+			precvbuf->pskb = __dev_alloc_skb(MAX_RECVBUF_SZ + RECVBUFF_ALIGN_SZ, GFP_KERNEL);
 
 			if (precvbuf->pskb) {
 				precvbuf->pskb->dev = padapter->pnetdev;
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 0ee50b4a1149..5f4db1b9496e 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -180,7 +180,7 @@ static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
 	} else {
 		u8 *tmpbuf;
 
-		tmpbuf = rtw_malloc(8);
+		tmpbuf = kmalloc(8, GFP_KERNEL);
 		if (!tmpbuf)
 			return SDIO_ERR_VAL32;
 
@@ -227,7 +227,7 @@ static s32 sdio_readN(struct intf_hdl *intfhdl, u32 addr, u32 cnt, u8 *buf)
 
 		ftaddr &= ~(u16)0x3;
 		n = cnt + shift;
-		tmpbuf = rtw_malloc(n);
+		tmpbuf = kmalloc(n, GFP_KERNEL);
 		if (!tmpbuf)
 			return -1;
 
@@ -330,7 +330,7 @@ static s32 sdio_writeN(struct intf_hdl *intfhdl, u32 addr, u32 cnt, u8 *buf)
 
 		ftaddr &= ~(u16)0x3;
 		n = cnt + shift;
-		tmpbuf = rtw_malloc(n);
+		tmpbuf = kmalloc(n, GFP_KERNEL);
 		if (!tmpbuf)
 			return -1;
 		err = sd_read(intfhdl, ftaddr, 4, tmpbuf);
@@ -502,7 +502,7 @@ static s32 _sdio_local_read(
 		return _sd_cmd52_read(intfhdl, addr, cnt, buf);
 
 	n = round_up(cnt, 4);
-	tmpbuf = rtw_malloc(n);
+	tmpbuf = kmalloc(n, GFP_KERNEL);
 	if (!tmpbuf)
 		return -1;
 
@@ -543,7 +543,7 @@ s32 sdio_local_read(
 		return sd_cmd52_read(intfhdl, addr, cnt, buf);
 
 	n = round_up(cnt, 4);
-	tmpbuf = rtw_malloc(n);
+	tmpbuf = kmalloc(n, GFP_KERNEL);
 	if (!tmpbuf)
 		return -1;
 
@@ -582,7 +582,7 @@ s32 sdio_local_write(
 	)
 		return sd_cmd52_write(intfhdl, addr, cnt, buf);
 
-	tmpbuf = rtw_malloc(cnt);
+	tmpbuf = kmalloc(cnt, GFP_KERNEL);
 	if (!tmpbuf)
 		return -1;
 
@@ -809,7 +809,7 @@ static struct recv_buf *sd_recv_rxfifo(struct adapter *adapter, u32 size)
 		SIZE_PTR tmpaddr = 0;
 		SIZE_PTR alignment = 0;
 
-		recvbuf->pskb = rtw_skb_alloc(MAX_RECVBUF_SZ + RECVBUFF_ALIGN_SZ);
+		recvbuf->pskb = __dev_alloc_skb(MAX_RECVBUF_SZ + RECVBUFF_ALIGN_SZ, GFP_ATOMIC);
 		if (!recvbuf->pskb)
 			return NULL;
 
@@ -882,7 +882,7 @@ void sd_int_dpc(struct adapter *adapter)
 		u8 *status;
 		u32 addr;
 
-		status = rtw_malloc(4);
+		status = kmalloc(4, GFP_ATOMIC);
 		if (status) {
 			addr = REG_TXDMA_STATUS;
 			hal_sdio_get_cmd_addr_8723b(adapter, WLAN_IOREG_DEVICE_ID, addr, &addr);
@@ -895,7 +895,7 @@ void sd_int_dpc(struct adapter *adapter)
 	if (hal->sdio_hisr & SDIO_HISR_C2HCMD) {
 		struct c2h_evt_hdr_88xx *c2h_evt;
 
-		c2h_evt = rtw_zmalloc(16);
+		c2h_evt = kzalloc(16, GFP_ATOMIC);
 		if (c2h_evt) {
 			if (c2h_evt_read_88xx(adapter, (u8 *)c2h_evt) == _SUCCESS) {
 				if (c2h_id_filter_ccx_8723b((u8 *)c2h_evt)) {
diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index 8b1634f4091e..fec1ab000ecc 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -54,21 +54,10 @@
 
 extern int RTW_STATUS_CODE(int error_code);
 
-void *_rtw_zmalloc(u32 sz);
-void *_rtw_malloc(u32 sz);
 void _kfree(u8 *pbuf, u32 sz);
 
-struct sk_buff *_rtw_skb_alloc(u32 sz);
-struct sk_buff *_rtw_skb_copy(const struct sk_buff *skb);
 int _rtw_netif_rx(struct net_device *ndev, struct sk_buff *skb);
 
-#define rtw_malloc(sz)			_rtw_malloc((sz))
-#define rtw_zmalloc(sz)			_rtw_zmalloc((sz))
-
-#define rtw_skb_alloc(size) _rtw_skb_alloc((size))
-#define rtw_skb_alloc_f(size, mstat_f)	_rtw_skb_alloc((size))
-#define rtw_skb_copy(skb)	_rtw_skb_copy((skb))
-#define rtw_skb_copy_f(skb, mstat_f)	_rtw_skb_copy((skb))
 #define rtw_netif_rx(ndev, skb) _rtw_netif_rx(ndev, skb)
 
 extern void _rtw_init_queue(struct __queue	*pqueue);
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 60edeae1cffe..7d42449a7581 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -119,9 +119,9 @@ static struct ieee80211_supported_band *rtw_spt_band_alloc(
 		goto exit;
 	}
 
-	spt_band = rtw_zmalloc(sizeof(struct ieee80211_supported_band) +
+	spt_band = kzalloc(sizeof(struct ieee80211_supported_band) +
 			       sizeof(struct ieee80211_channel) * n_channels +
-			       sizeof(struct ieee80211_rate) * n_bitrates);
+			       sizeof(struct ieee80211_rate) * n_bitrates, GFP_KERNEL);
 	if (!spt_band)
 		goto exit;
 
@@ -840,12 +840,10 @@ static int cfg80211_rtw_add_key(struct wiphy *wiphy, struct net_device *ndev,
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	param_len = sizeof(struct ieee_param) + params->key_len;
-	param = rtw_malloc(param_len);
+	param = kzalloc(param_len, GFP_KERNEL);
 	if (!param)
 		return -1;
 
-	memset(param, 0, param_len);
-
 	param->cmd = IEEE_CMD_SET_ENCRYPTION;
 	eth_broadcast_addr(param->sta_addr);
 
@@ -1162,7 +1160,7 @@ static int rtw_cfg80211_set_probe_req_wpsp2pie(struct adapter *padapter, char *b
 				pmlmepriv->wps_probe_req_ie = NULL;
 			}
 
-			pmlmepriv->wps_probe_req_ie = rtw_malloc(wps_ielen);
+			pmlmepriv->wps_probe_req_ie = kmalloc(wps_ielen, GFP_KERNEL);
 			if (!pmlmepriv->wps_probe_req_ie)
 				return -EINVAL;
 
@@ -1430,7 +1428,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 		goto exit;
 	}
 
-	buf = rtw_zmalloc(ielen);
+	buf = kzalloc(ielen, GFP_KERNEL);
 	if (!buf) {
 		ret =  -ENOMEM;
 		goto exit;
@@ -1714,14 +1712,12 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 			wep_key_len = wep_key_len <= 5 ? 5 : 13;
 			wep_total_len = wep_key_len +
 				offsetof(struct ndis_802_11_wep, key_material);
-			pwep = rtw_malloc(wep_total_len);
+			pwep = kzalloc(wep_total_len, GFP_KERNEL);
 			if (!pwep) {
 				ret = -ENOMEM;
 				goto exit;
 			}
 
-			memset(pwep, 0, wep_total_len);
-
 			pwep->key_length = wep_key_len;
 			pwep->length = wep_total_len;
 
@@ -2147,7 +2143,7 @@ static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name, str
 	pnpi->sizeof_priv = sizeof(struct adapter);
 
 	/*  wdev */
-	mon_wdev = rtw_zmalloc(sizeof(struct wireless_dev));
+	mon_wdev = kzalloc(sizeof(struct wireless_dev), GFP_KERNEL);
 	if (!mon_wdev) {
 		ret = -ENOMEM;
 		goto out;
@@ -2257,7 +2253,7 @@ static int rtw_add_beacon(struct adapter *adapter, const u8 *head, size_t head_l
 	if (head_len < 24)
 		return -EINVAL;
 
-	pbuf = rtw_zmalloc(head_len + tail_len);
+	pbuf = kzalloc(head_len + tail_len, GFP_KERNEL);
 	if (!pbuf)
 		return -ENOMEM;
 
@@ -2728,7 +2724,7 @@ int rtw_wdev_alloc(struct adapter *padapter, struct device *dev)
 		goto free_wiphy;
 
 	/*  wdev */
-	wdev = rtw_zmalloc(sizeof(struct wireless_dev));
+	wdev = kzalloc(sizeof(struct wireless_dev), GFP_KERNEL);
 	if (!wdev) {
 		ret = -ENOMEM;
 		goto unregister_wiphy;
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 6ca6dc548805..9f7f6b40093c 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -560,7 +560,7 @@ struct dvobj_priv *devobj_init(void)
 {
 	struct dvobj_priv *pdvobj = NULL;
 
-	pdvobj = rtw_zmalloc(sizeof(*pdvobj));
+	pdvobj = kzalloc(sizeof(*pdvobj), GFP_KERNEL);
 	if (!pdvobj)
 		return NULL;
 
diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index be46132a533a..d95fb1afd86a 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -17,26 +17,6 @@ inline int RTW_STATUS_CODE(int error_code)
 	return _FAIL;
 }
 
-void *_rtw_malloc(u32 sz)
-{
-	return kmalloc(sz, in_interrupt() ? GFP_ATOMIC : GFP_KERNEL);
-}
-
-void *_rtw_zmalloc(u32 sz)
-{
-	return kzalloc(sz, in_interrupt() ? GFP_ATOMIC : GFP_KERNEL);
-}
-
-inline struct sk_buff *_rtw_skb_alloc(u32 sz)
-{
-	return __dev_alloc_skb(sz, in_interrupt() ? GFP_ATOMIC : GFP_KERNEL);
-}
-
-inline struct sk_buff *_rtw_skb_copy(const struct sk_buff *skb)
-{
-	return skb_copy(skb, in_interrupt() ? GFP_ATOMIC : GFP_KERNEL);
-}
-
 inline int _rtw_netif_rx(struct net_device *ndev, struct sk_buff *skb)
 {
 	skb->dev = ndev;
@@ -127,7 +107,7 @@ void rtw_buf_update(u8 **buf, u32 *buf_len, u8 *src, u32 src_len)
 		goto keep_ori;
 
 	/* duplicate src */
-	dup = rtw_malloc(src_len);
+	dup = kmalloc(src_len, GFP_KERNEL);
 	if (dup) {
 		dup_len = src_len;
 		memcpy(dup, src, dup_len);
@@ -218,7 +198,7 @@ struct rtw_cbuf *rtw_cbuf_alloc(u32 size)
 {
 	struct rtw_cbuf *cbuf;
 
-	cbuf = rtw_malloc(struct_size(cbuf, bufs, size));
+	cbuf = kmalloc(struct_size(cbuf, bufs, size), GFP_KERNEL);
 
 	if (cbuf) {
 		cbuf->write = cbuf->read = 0;
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 944b9c724b32..8372b72b53b3 100644
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
 
@@ -159,7 +159,7 @@ static int rtw_mlcst2unicst(struct adapter *padapter, struct sk_buff *skb)
 		    !memcmp(psta->hwaddr, bc_addr, 6))
 			continue;
 
-		newskb = rtw_skb_copy(skb);
+		newskb = skb_copy(skb, GFP_ATOMIC);
 
 		if (newskb) {
 			memcpy(newskb->data, psta->hwaddr, 6);
-- 
2.43.0

