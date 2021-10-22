Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAFF29CA
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 11:38:19 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id e5-20020a17090a804500b001a116ad95caso2835555pjw.2
        for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 04:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5gmoLFk4n1jtdQMycoy/0qBfbW+iXOZK7CnuhDsqeK8=;
        b=qh+sEeiHgK2IzhM+mJbWR94BHxnfFA/aDIoc7DuG/5eT+xXKKuDicEmeG3zXOypUr6
         SxGxiEUVn70747PR4TO+3FtHmK468+ktkNZXxOnwp74EOK5IGV6kok4yH4M7LUtgHSeD
         H1vcQpui2sTCfkTXWGblhnLpTxeldhRNu6J0u8L9eFAg8V8hUpjmAzT51e69cm5pjcsC
         70ukYoHj2XX44/GLGkp1pWMk43pdIvS1Vpnr7tyQLDytk7SjfgJJG5GpfgieXW9+nnfi
         9/qvii21BcYGkVJVqJioYjJ0N6uwmrLH+lTnuobJwCxPFz1vIeqI49RulijWpF4z65EA
         KEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5gmoLFk4n1jtdQMycoy/0qBfbW+iXOZK7CnuhDsqeK8=;
        b=0lYsLnf0FaI8bzVdLBIvlZ+x/DPQn/5RBGywNzCHyk34wOLwDOtTcK8C1wSgVREl75
         vlRBrKUxFtouetmwv65zj9mPsLlr0BpIi0mVdixNdlsBbOy/SlPbGbYk9El7i3rUQ4wh
         7+8mupojz4O9y+tYDh1yoAMaZ+onNON0zsp5EBy5fgdjs3x9uBXoq8C8oEAkeM1wTSDQ
         7+jWUIHLtH+3qObntXYpDetxqYcpu2Uib1AQUqoBUSNf7PXRSqmz/5v9VMRJyDXhv46P
         4xJBAo6OM9ie23Ciia+Un1tDgxygV8tsYFN0O+/z/ShtJt1Z6+MG8vCk4thjTU9KI+is
         J6gg==
X-Gm-Message-State: AOAM5323RqGFi5LOp+y/sArEsTvk5uH7lHDdeUTcycqIgLkb5uZsj33x
	+jR0JSGQm/xR4M7Qn18yxgk=
X-Google-Smtp-Source: ABdhPJw5fiTwBGXvDm6KBWtmPU+ryVa4iWIMwPBSPvNh89Z0ZhHzD2/NDL5Ya5yk8UjW+NKNzTBIyA==
X-Received: by 2002:a17:90b:4f4c:: with SMTP id pj12mr13624202pjb.231.1634902698800;
        Fri, 22 Oct 2021 04:38:18 -0700 (PDT)
Received: from localhost.localdomain ([115.96.219.100])
        by smtp.googlemail.com with ESMTPSA id t22sm10946224pfg.148.2021.10.22.04.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 04:38:18 -0700 (PDT)
From: Kushal Kothari <kushalkothari285@gmail.com>
To: gregkh@linuxfoundation.org
Cc: kushalkothari285@gmail.com,
	kush19992810@gmail.com,
	outreachy-kernel@googlegroups.com,
	fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com,
	fmdefrancesco@gmail.com,
	marcocesati@gmail.com,
	straube.linux@gmail.com,
	philippesdixon@gmail.com,
	manuelpalenzuelamerino@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mike.rapoport@gmail.com,
	kushalkotharitest@googlegroups.com
Subject: [PATCH 1/4] v2 staging: rtl8723bs: core: Remove true and false comparison
Date: Fri, 22 Oct 2021 17:07:35 +0530
Message-Id: <9440a92ea8eee178319ccdb651e2aea65948dbc9.1634899405.git.kushalkothari285@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634899405.git.kushalkothari285@gmail.com>
References: <cover.1634899405.git.kushalkothari285@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove comparison to true and false in if statement.
Issue found with checkpatch.pl.
CHECK: Using comparison to true is error prone
CHECK: Using comparison to false is error prone

Signed-off-by: Kushal Kothari <kushalkothari285@gmail.com>

Changes in v2: Unnecessary parantheses handled in *v2 staging: rtl8723bs: core: Remove unnecessary parentheses*
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 2624e994513f..acd4e8b1fad5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -371,7 +371,7 @@ void rtw_free_cmd_obj(struct cmd_obj *pcmd)
 void rtw_stop_cmd_thread(struct adapter *adapter)
 {
 	if (adapter->cmdThread &&
-		atomic_read(&(adapter->cmdpriv.cmdthd_running)) == true &&
+		atomic_read(&(adapter->cmdpriv.cmdthd_running)) &&
 		adapter->cmdpriv.stop_req == 0) {
 		adapter->cmdpriv.stop_req = 1;
 		complete(&adapter->cmdpriv.cmd_queue_comp);
@@ -542,7 +542,7 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 	struct cmd_priv 	*pcmdpriv = &padapter->cmdpriv;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
-	if (check_fwstate(pmlmepriv, _FW_LINKED) == true)
+	if (check_fwstate(pmlmepriv, _FW_LINKED))
 		rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_SCAN, 1);
 
 	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
@@ -775,7 +775,7 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	/*  If not,  we have to copy the connecting AP's MAC address to it so that */
 	/*  the driver just has the bssid information for PMKIDList searching. */
 
-	if (pmlmepriv->assoc_by_bssid == false)
+	if (!pmlmepriv->assoc_by_bssid)
 		memcpy(&pmlmepriv->assoc_bssid[0], &pnetwork->network.mac_address[0], ETH_ALEN);
 
 	psecnetwork->ie_length = rtw_restruct_sec_ie(padapter, &pnetwork->network.ies[0], &psecnetwork->ies[0], pnetwork->network.ie_length);
@@ -1164,7 +1164,7 @@ u8 rtw_set_chplan_cmd(struct adapter *padapter, u8 chplan, u8 enqueue, u8 swconf
 	u8 res = _SUCCESS;
 
 	/*  check if allow software config */
-	if (swconfig && rtw_hal_is_disable_sw_channel_plan(padapter) == true) {
+	if (swconfig && rtw_hal_is_disable_sw_channel_plan(padapter)) {
 		res = _FAIL;
 		goto exit;
 	}
@@ -1250,7 +1250,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 	/*  */
 	/*  Determine if our traffic is busy now */
 	/*  */
-	if ((check_fwstate(pmlmepriv, _FW_LINKED) == true)
+	if ((check_fwstate(pmlmepriv, _FW_LINKED))
 		/*&& !MgntInitAdapterInProgress(pMgntInfo)*/) {
 		/*  if we raise bBusyTraffic in last watchdog, using lower threshold. */
 		if (pmlmepriv->LinkDetectInfo.bBusyTraffic)
@@ -1342,7 +1342,7 @@ static void dynamic_chk_wk_hdl(struct adapter *padapter)
 
 	pmlmepriv = &(padapter->mlmepriv);
 
-	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true)
+	if (check_fwstate(pmlmepriv, WIFI_AP_STATE))
 		expire_timeout_chk(padapter);
 
 	/* for debug purpose */
@@ -1377,8 +1377,8 @@ void lps_ctrl_wk_hdl(struct adapter *padapter, u8 lps_ctrl_type)
 	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
 	u8 mstatus;
 
-	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)
-		|| (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
+	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) ||
+		(check_fwstate(pmlmepriv, WIFI_ADHOC_STATE))) {
 		return;
 	}
 
@@ -1386,7 +1386,7 @@ void lps_ctrl_wk_hdl(struct adapter *padapter, u8 lps_ctrl_type)
 	case LPS_CTRL_SCAN:
 		hal_btcoex_ScanNotify(padapter, true);
 
-		if (check_fwstate(pmlmepriv, _FW_LINKED) == true) {
+		if (check_fwstate(pmlmepriv, _FW_LINKED)) {
 			/*  connect */
 			LPS_Leave(padapter, "LPS_CTRL_SCAN");
 		}
@@ -1512,7 +1512,7 @@ static void rtw_lps_change_dtim_hdl(struct adapter *padapter, u8 dtim)
 	if (dtim <= 0 || dtim > 16)
 		return;
 
-	if (hal_btcoex_IsBtControlLps(padapter) == true)
+	if (hal_btcoex_IsBtControlLps(padapter))
 		return;
 
 	mutex_lock(&pwrpriv->lock);
@@ -1840,7 +1840,7 @@ static void c2h_wk_callback(struct work_struct *work)
 			continue;
 		}
 
-		if (ccx_id_filter(c2h_evt) == true) {
+		if (ccx_id_filter(c2h_evt)) {
 			/* Handle CCX report here */
 			rtw_hal_c2h_handler(adapter, c2h_evt);
 			kfree(c2h_evt);
-- 
2.25.1

