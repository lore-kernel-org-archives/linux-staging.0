Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C526B2C98
	for <linux-staging@lists.linux.dev>; Sat, 23 Oct 2021 07:37:30 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id x1-20020a17090a530100b001a1efa4ebe6so2166925pjh.0
        for <linux-staging@lists.linux.dev>; Sat, 23 Oct 2021 00:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ds3LbLaJdUd6kQMcYQHd6Hdtn065Nv5rs5RBxzcMONU=;
        b=EAKgK+Zyv93E9EDZAnRt1eQdfCmmkU8KmnQ6aL8Xw+Rr9eWMSnOqDRp+UlvLCad4sO
         Hh53ySySrJAtovUuo3Lm8isCv5STTsgy2icWfVZ+APieswYDqvHY1x6rWD+WepLzV0op
         a5sjyHsLI3C0FxqUYSBkAasGwDPyMH1LJqml6WTR/kkL1kudlFW2aZ4nk6j4uHTyzkAS
         LKJ9hFILwYrtxQdHIxQon54n7JfRoSMm3FoKbHTq+uCsqipjWGjF1TnzExh2sq5GAffJ
         jUIY2DIMUOiwu6SMoLzZuIasm/QrZitjk/Pbivnv2p7PJMOoD5WA+NzzuVP0N5wvYsy4
         reJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ds3LbLaJdUd6kQMcYQHd6Hdtn065Nv5rs5RBxzcMONU=;
        b=V+wqBey/JiSf2RwtZMmhhf8SmBii2F9aJdmVYQILztqq1qPkKkNA7iVMX4qKl/cPds
         Ed1L0HzDg0T1uf3Erl4iCKkXo9lfYHICHTvWkopVx195jXyKfNIZXg/SdxBcbqHtHEdu
         vAiJI36uTq5DHjIzGThdN9JMZuM2IJTH6+SIDYWh7eh2lWUJeDPQM34BHWGB4D+pYBGW
         lZHssWyEaG7qA/2GCksXxzzjo8VQKdEYiMagYxMYAJb/gneiJHekcEuif6qwvs7J5+ie
         zf5rcMgw2aJHKtCMaj1errFHmdxjIZsc3N4DQ8FMvxHcLVqsK787sOY6G4Xy572mQIlh
         qwLA==
X-Gm-Message-State: AOAM532Ek49mSjhed5zZHYkUrUodOeJPRgY3WrSJDQ/mJ/KxcP6Wu+Qm
	D1l80CMbyRIz265vPtjf+NTuRuj1IYOkzQ==
X-Google-Smtp-Source: ABdhPJypVzsXtr2dFHbVTBfVds+sqdJzRd+vsAoqFrREkKB3ljRVY2btePyp9yVjKn9frPZmQQaEpA==
X-Received: by 2002:a17:90b:1bcc:: with SMTP id oa12mr5284616pjb.212.1634974650302;
        Sat, 23 Oct 2021 00:37:30 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:5173:67c9:d8e4:2819:8ee8:8de4])
        by smtp.googlemail.com with ESMTPSA id c4sm13949791pfv.144.2021.10.23.00.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 00:37:29 -0700 (PDT)
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
Subject: [PATCH v4 2/4] staging: rtl8723bs: core: Remove unnecessary parentheses
Date: Sat, 23 Oct 2021 13:05:48 +0530
Message-Id: <f4df671b9bf23f9e8995dd03472a520d40377d7a.1634967010.git.kushalkothari285@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634967010.git.kushalkothari285@gmail.com>
References: <cover.1634967010.git.kushalkothari285@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Issue found with checkpatch.pl.
CHECK: Remove unnecessary parentheses

Signed-off-by: Kushal Kothari <kushalkothari285@gmail.com>
---

Changes in v4: Move the version notes
Changes in v3: Enclose the version number inside the square bracket.
Changes in v2: Handled all previous parentheses in this patch

 drivers/staging/rtl8723bs/core/rtw_cmd.c | 42 ++++++++++++------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index acd4e8b1fad5..88f6b7405106 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -278,10 +278,10 @@ struct	cmd_obj	*_rtw_dequeue_cmd(struct __queue *queue)
 
 	/* spin_lock_bh(&(queue->lock)); */
 	spin_lock_irqsave(&queue->lock, irqL);
-	if (list_empty(&(queue->queue)))
+	if (list_empty(&queue->queue))
 		obj = NULL;
 	else {
-		obj = container_of(get_next(&(queue->queue)), struct cmd_obj, list);
+		obj = container_of(get_next(&queue->queue), struct cmd_obj, list);
 		list_del_init(&obj->list);
 	}
 
@@ -371,7 +371,7 @@ void rtw_free_cmd_obj(struct cmd_obj *pcmd)
 void rtw_stop_cmd_thread(struct adapter *adapter)
 {
 	if (adapter->cmdThread &&
-		atomic_read(&(adapter->cmdpriv.cmdthd_running)) &&
+		atomic_read(&adapter->cmdpriv.cmdthd_running) &&
 		adapter->cmdpriv.stop_req == 0) {
 		adapter->cmdpriv.stop_req = 1;
 		complete(&adapter->cmdpriv.cmd_queue_comp);
@@ -387,7 +387,7 @@ int rtw_cmd_thread(void *context)
 	u8 (*cmd_hdl)(struct adapter *padapter, u8 *pbuf);
 	void (*pcmd_callback)(struct adapter *dev, struct cmd_obj *pcmd);
 	struct adapter *padapter = context;
-	struct cmd_priv *pcmdpriv = &(padapter->cmdpriv);
+	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	struct drvextra_cmd_parm *extra_parm = NULL;
 
 	thread_enter("RTW_CMD_THREAD");
@@ -395,7 +395,7 @@ int rtw_cmd_thread(void *context)
 	pcmdbuf = pcmdpriv->cmd_buf;
 
 	pcmdpriv->stop_req = 0;
-	atomic_set(&(pcmdpriv->cmdthd_running), true);
+	atomic_set(&pcmdpriv->cmdthd_running, true);
 	complete(&pcmdpriv->terminate_cmdthread_comp);
 
 	while (1) {
@@ -471,7 +471,7 @@ int rtw_cmd_thread(void *context)
 
 post_process:
 
-		if (mutex_lock_interruptible(&(pcmd->padapter->cmdpriv.sctx_mutex)) == 0) {
+		if (mutex_lock_interruptible(&pcmd->padapter->cmdpriv.sctx_mutex) == 0) {
 			if (pcmd->sctx) {
 				netdev_dbg(padapter->pnetdev,
 					   FUNC_ADPT_FMT " pcmd->sctx\n",
@@ -482,7 +482,7 @@ int rtw_cmd_thread(void *context)
 				else
 					rtw_sctx_done_err(&pcmd->sctx, RTW_SCTX_DONE_CMD_ERROR);
 			}
-			mutex_unlock(&(pcmd->padapter->cmdpriv.sctx_mutex));
+			mutex_unlock(&pcmd->padapter->cmdpriv.sctx_mutex);
 		}
 
 		/* call callback function for post-processed */
@@ -522,7 +522,7 @@ int rtw_cmd_thread(void *context)
 	} while (1);
 
 	complete(&pcmdpriv->terminate_cmdthread_comp);
-	atomic_set(&(pcmdpriv->cmdthd_running), false);
+	atomic_set(&pcmdpriv->cmdthd_running, false);
 
 	thread_exit();
 }
@@ -724,7 +724,7 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	struct ht_priv 		*phtpriv = &pmlmepriv->htpriv;
 	enum ndis_802_11_network_infrastructure ndis_network_mode = pnetwork->network.infrastructure_mode;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u32 tmp_len;
 	u8 *ptmp = NULL;
 
@@ -1243,7 +1243,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 	u8 bBusyTraffic = false, bTxBusyTraffic = false, bRxBusyTraffic = false;
 	u8 bHigherBusyTraffic = false, bHigherBusyRxTraffic = false, bHigherBusyTxTraffic = false;
 
-	struct mlme_priv 	*pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv 	*pmlmepriv = &padapter->mlmepriv;
 
 	collect_traffic_statistics(padapter);
 
@@ -1315,7 +1315,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 		struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 		int n_assoc_iface = 0;
 
-		if (check_fwstate(&(dvobj->padapters->mlmepriv), WIFI_ASOC_STATE))
+		if (check_fwstate(&dvobj->padapters->mlmepriv, WIFI_ASOC_STATE))
 			n_assoc_iface++;
 
 		if (!from_timer && n_assoc_iface == 0)
@@ -1340,7 +1340,7 @@ static void dynamic_chk_wk_hdl(struct adapter *padapter)
 {
 	struct mlme_priv *pmlmepriv;
 
-	pmlmepriv = &(padapter->mlmepriv);
+	pmlmepriv = &padapter->mlmepriv;
 
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE))
 		expire_timeout_chk(padapter);
@@ -1374,11 +1374,11 @@ void lps_ctrl_wk_hdl(struct adapter *padapter, u8 lps_ctrl_type);
 void lps_ctrl_wk_hdl(struct adapter *padapter, u8 lps_ctrl_type)
 {
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	u8 mstatus;
 
-	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_STATE))) {
+	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
+		check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
 		return;
 	}
 
@@ -1959,7 +1959,7 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 	struct wlan_network *pwlan = NULL;
 	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_bssid_ex *pnetwork = (struct wlan_bssid_ex *)pcmd->parmbuf;
-	struct wlan_network *tgt_network = &(pmlmepriv->cur_network);
+	struct wlan_network *tgt_network = &pmlmepriv->cur_network;
 
 	if (!pcmd->parmbuf)
 		goto exit;
@@ -1983,20 +1983,20 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 		rtw_indicate_connect(padapter);
 	} else {
 		pwlan = rtw_alloc_network(pmlmepriv);
-		spin_lock_bh(&(pmlmepriv->scanned_queue.lock));
+		spin_lock_bh(&pmlmepriv->scanned_queue.lock);
 		if (!pwlan) {
 			pwlan = rtw_get_oldest_wlan_network(&pmlmepriv->scanned_queue);
 			if (!pwlan) {
-				spin_unlock_bh(&(pmlmepriv->scanned_queue.lock));
+				spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
 				goto createbss_cmd_fail;
 			}
 			pwlan->last_scanned = jiffies;
 		} else {
-			list_add_tail(&(pwlan->list), &pmlmepriv->scanned_queue.queue);
+			list_add_tail(&pwlan->list, &pmlmepriv->scanned_queue.queue);
 		}
 
 		pnetwork->length = get_wlan_bssid_ex_sz(pnetwork);
-		memcpy(&(pwlan->network), pnetwork, pnetwork->length);
+		memcpy(&pwlan->network, pnetwork, pnetwork->length);
 		/* pwlan->fixed = true; */
 
 		/* list_add_tail(&(pwlan->list), &pmlmepriv->scanned_queue.queue); */
@@ -2009,7 +2009,7 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 
 		_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 
-		spin_unlock_bh(&(pmlmepriv->scanned_queue.lock));
+		spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
 		/*  we will set _FW_LINKED when there is one more sat to join us (rtw_stassoc_event_callback) */
 
 	}
-- 
2.25.1

