Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AE42FB8
	for <linux-staging@lists.linux.dev>; Sat,  7 Aug 2021 10:12:20 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id ec13so16897287edb.0
        for <linux-staging@lists.linux.dev>; Sat, 07 Aug 2021 03:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ExSrr5SI9KDAzqSJNaQAZGsel1NgSurddXZixkgQ1QU=;
        b=D1SYwLcdC3vPbqJqHVS/1vs435yZJOxDDMeZu58EBmcuYcERTfDLhAeu4lXeoYn6E0
         nMDU5S/Qns85PkNIigLrDdJq/+uoJYEnyK04U8WkPBEm9ZVFRPISPgE8i8+jDpV6cGjd
         CfMocFYoguMXfoAPoYs9YNRhBFOWTHACK4PbwTy9CL2g4mkvc1KBCVEWLgbUN8dCiji4
         5N6adFMgajReXAq4Y11n+z3cGYnLUw5fhPAbcbDPS/soefAJLzngoloJg30MEaCq0e5S
         QEQXUcxEsAL58v4nwv0r+ePY7eXQHqlPIgYLiFaQmTWCgFkomrgMEBegp9e67d9c3aBR
         k+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ExSrr5SI9KDAzqSJNaQAZGsel1NgSurddXZixkgQ1QU=;
        b=Wcqesfal7/ootuuITsjRxus/nTzJL5L0+uqy9Ope1vWIaIFYfUNGziahlhZz8SKfNG
         /gbYaSWHeiwW8MDI0kj9AAkEKBB69I0pchQeDWxlC8ybHTO1UzxhO/o2i8Kslq8g5i9a
         bcK5525UL/bpMgcjl3sXZtUAsa0jJAWjr6aeILYTu/YR5mOwNIEqBFpjOuqCF0XJhz9o
         x+eopTEAHpbu4QR++fm8FD18eLyh2stolJIv2aTJNmGALLH8f1EyhRMIqF6iiOSi7KXH
         jK+noS4VrYcCZ6t30465HNKCVsjvhTfkdwLzdbmYoV+QqAtikaA1Q6ub7ny+jugBFL5y
         Z8DQ==
X-Gm-Message-State: AOAM531REXvIP+YGtJQRFY6Wcan/EwGiUhCxemcoU39iYlz0RyfHGvjY
	m0PhnAcHRzOisjpfI09tY8M=
X-Google-Smtp-Source: ABdhPJywxziwUZDOxw+vzBdhPjsK5WuhUaeKOvIbkK+XVrrcZD2WwWIkLSvfSIq8fS47mx8gVVF89Q==
X-Received: by 2002:aa7:cd71:: with SMTP id ca17mr17927655edb.58.1628331139221;
        Sat, 07 Aug 2021 03:12:19 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::a83e])
        by smtp.gmail.com with ESMTPSA id u4sm3662514eje.81.2021.08.07.03.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 03:12:18 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 16/17] staging: r8188eu: remove unnecessary parentheses in core/rtw_cmd.c
Date: Sat,  7 Aug 2021 12:11:18 +0200
Message-Id: <20210807101119.16085-17-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807101119.16085-1-straube.linux@gmail.com>
References: <20210807101119.16085-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary parentheses in core/rtw_cmd.c reported by
checkpatch.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 36 +++++++++++++-------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index c3a9051ca10c..a0cae2bad9af 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -20,11 +20,11 @@ int	_rtw_init_cmd_priv (struct	cmd_priv *pcmdpriv)
 {
 	int res = _SUCCESS;
 
-	sema_init(&(pcmdpriv->cmd_queue_sema), 0);
+	sema_init(&pcmdpriv->cmd_queue_sema, 0);
 	/* sema_init(&(pcmdpriv->cmd_done_sema), 0); */
-	sema_init(&(pcmdpriv->terminate_cmdthread_sema), 0);
+	sema_init(&pcmdpriv->terminate_cmdthread_sema, 0);
 
-	_rtw_init_queue(&(pcmdpriv->cmd_queue));
+	_rtw_init_queue(&pcmdpriv->cmd_queue);
 
 	/* allocate DMA-able/Non-Page memory for cmd_buf and rsp_buf */
 
@@ -133,10 +133,10 @@ struct	cmd_obj	*_rtw_dequeue_cmd(struct __queue *queue)
 	unsigned long flags;
 
 	spin_lock_irqsave(&queue->lock, flags);
-	if (list_empty(&(queue->queue))) {
+	if (list_empty(&queue->queue)) {
 		obj = NULL;
 	} else {
-		obj = container_of((&(queue->queue))->next, struct cmd_obj, list);
+		obj = container_of((&queue->queue)->next, struct cmd_obj, list);
 		rtw_list_delete(&obj->list);
 	}
 
@@ -262,7 +262,7 @@ int rtw_cmd_thread(void *context)
 	u8 (*cmd_hdl)(struct adapter *padapter, u8 *pbuf);
 	void (*pcmd_callback)(struct adapter *dev, struct cmd_obj *pcmd);
 	struct adapter *padapter = (struct adapter *)context;
-	struct cmd_priv *pcmdpriv = &(padapter->cmdpriv);
+	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
 	thread_enter("RTW_CMD_THREAD");
 
@@ -794,7 +794,7 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	struct ht_priv		*phtpriv = &pmlmepriv->htpriv;
 	enum ndis_802_11_network_infra ndis_network_mode = pnetwork->network.InfrastructureMode;
 	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info	*pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
 
 	rtw_led_control(padapter, LED_CTL_START_TO_LINK);
 
@@ -1439,7 +1439,7 @@ static void traffic_status_watchdog(struct adapter *padapter)
 	u8	bEnterPS;
 	u8	bBusyTraffic = false, bTxBusyTraffic = false, bRxBusyTraffic = false;
 	u8	bHigherBusyTraffic = false, bHigherBusyRxTraffic = false, bHigherBusyTxTraffic = false;
-	struct mlme_priv		*pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv		*pmlmepriv = &padapter->mlmepriv;
 
 	/*  */
 	/*  Determine if our traffic is busy now */
@@ -1498,7 +1498,7 @@ static void dynamic_chk_wk_hdl(struct adapter *padapter, u8 *pbuf, int sz)
 	struct mlme_priv *pmlmepriv;
 
 	padapter = (struct adapter *)pbuf;
-	pmlmepriv = &(padapter->mlmepriv);
+	pmlmepriv = &padapter->mlmepriv;
 
 #ifdef CONFIG_88EU_AP_MODE
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true)
@@ -1516,7 +1516,7 @@ static void dynamic_chk_wk_hdl(struct adapter *padapter, u8 *pbuf, int sz)
 static void lps_ctrl_wk_hdl(struct adapter *padapter, u8 lps_ctrl_type)
 {
 	struct pwrctrl_priv *pwrpriv = &padapter->pwrctrlpriv;
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	u8	mstatus;
 
 	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true) ||
@@ -1693,7 +1693,7 @@ u8 p2p_protocol_wk_cmd(struct adapter *padapter, int intCmdType)
 {
 	struct cmd_obj	*ph2c;
 	struct drvextra_cmd_parm	*pdrvextra_cmd_parm;
-	struct wifidirect_info	*pwdinfo = &(padapter->wdinfo);
+	struct wifidirect_info	*pwdinfo = &padapter->wdinfo;
 	struct cmd_priv	*pcmdpriv = &padapter->cmdpriv;
 	u8	res = _SUCCESS;
 
@@ -2045,9 +2045,9 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 	struct wlan_network *pwlan = NULL;
 	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_bssid_ex *pnetwork = (struct wlan_bssid_ex *)pcmd->parmbuf;
-	struct wlan_network *tgt_network = &(pmlmepriv->cur_network);
+	struct wlan_network *tgt_network = &pmlmepriv->cur_network;
 
-	if ((pcmd->res != H2C_SUCCESS))
+	if (pcmd->res != H2C_SUCCESS)
 		_set_timer(&pmlmepriv->assoc_timer, 1);
 
 	_cancel_timer(&pmlmepriv->assoc_timer, &timer_cancelled);
@@ -2066,26 +2066,26 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 	} else {
 
 		pwlan = _rtw_alloc_network(pmlmepriv);
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
 
 		pnetwork->Length = get_wlan_bssid_ex_sz(pnetwork);
-		memcpy(&(pwlan->network), pnetwork, pnetwork->Length);
+		memcpy(&pwlan->network, pnetwork, pnetwork->Length);
 
 		memcpy(&tgt_network->network, pnetwork, (get_wlan_bssid_ex_sz(pnetwork)));
 
 		_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 
-		spin_unlock_bh(&(pmlmepriv->scanned_queue.lock));
+		spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
 		/*  we will set _FW_LINKED when there is one more sat to join us (rtw_stassoc_event_callback) */
 	}
 
-- 
2.32.0

