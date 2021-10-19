Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8485872
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 17:24:42 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id t184so7011984pgd.8
        for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 10:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5kvyUu/ou5/zjB+qAPejgXQ9ckRr2OTQAJI3Yt7aNfk=;
        b=Bb6h49qMbdOzJlZS1zXLlVZp/5Q7KCs1ve2qL9ZJ5qIjpR2IhPxwyHH64KNcZQjlEk
         0sCI99712I7mmpie62XQINyMfM1rh4+ztTivnOke2FaDEvOUmxKdI0K+Ib/vVjrgC+2g
         ZLrluHFki65ByTgu49Q5gn6X81xi4CeHfopPJjYrcbCVOwebj0EOg5crA+lVBxbH31YG
         cCUd2VeAm/3Y7DIe+mt19/ET0tC8xEB9gnS270I05Qwmhp+xiCbGS0iftpzp4t3+eMTC
         8c6nju39PzeUEyweBCgInixov1gNok/KXiqakoJakZxf+XOjwM4Y3vZKPxz6kc1IfsaX
         kkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5kvyUu/ou5/zjB+qAPejgXQ9ckRr2OTQAJI3Yt7aNfk=;
        b=DID0D8kSnEc6BcDsXGRpWtkdU9GRVp/uqLjHdpUbp2VlSn2lv5BFK650TCov5xwJrR
         5B8SiQm9iL6yN5aTSPxC8EguFoastzfdyV72WZhE9Zh8r+99Gz4GnMIVd7Oe2fVtbuUj
         04qzqP1XV4UVmX12Upl0zeeY1dMt+H4hdD0vQfzc52NmSx85j0RdxMFMTCkNbel9MSGY
         6//dltipYNwDF2VAFYrkI4H4u+93FlAGp45aAlbTKXybTj047kVy3YoQc9bL8HCfS+YZ
         wmW2fVv5l6goxxIU+knLCD1rSYRZdDl5fxnQTZltcpt2R0PtGfXvwdEBpyUC+ezLmIo/
         Qgrw==
X-Gm-Message-State: AOAM5326Q8aYhibExK6hAbCaFP+JDrMVXsrEmdDvRYjg+mDv74hu7v8C
	hyHWpMtAp110WDylELnSRKQ=
X-Google-Smtp-Source: ABdhPJz3X39Tz5/B5FgZiomUPTOJigkTxJNs00vWzKkRwkOBkFZoBklrQmI+x4VYDok+CadYouO1mA==
X-Received: by 2002:a65:62c4:: with SMTP id m4mr30125512pgv.453.1634664281808;
        Tue, 19 Oct 2021 10:24:41 -0700 (PDT)
Received: from localhost.localdomain ([115.96.219.100])
        by smtp.googlemail.com with ESMTPSA id q8sm3132468pfu.167.2021.10.19.10.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 10:24:41 -0700 (PDT)
From: Kushal Kothari <kushalkothari285@gmail.com>
To: gregkh@linuxfoundation.org,
	fabioaiuto83@gmail.com,
	marcocesati@gmail.com,
	dan.carpenter@oracle.com,
	ross.schm.dev@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com,
	mike.rapoport@gmail.com
Cc: Kushal Kothari <kushalkothari285@gmail.com>
Subject: [PATCH] staging: rtl8723bs: core:  Remove true and false comparison
Date: Tue, 19 Oct 2021 22:53:59 +0530
Message-Id: <20211019172359.63583-1-kushalkothari285@gmail.com>
X-Mailer: git-send-email 2.25.1
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
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index efc9b1974e38..b473f1d1ce08 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -309,8 +309,8 @@ int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
 	if (cmd_obj->cmdcode == GEN_CMD_CODE(_SetChannelPlan))
 		bAllow = true;
 
-	if ((pcmdpriv->padapter->hw_init_completed == false && bAllow == false)
-		|| atomic_read(&(pcmdpriv->cmdthd_running)) == false	/* com_thread not running */
+	if ((!pcmdpriv->padapter->hw_init_completed && !bAllow)
+		|| !atomic_read(&(pcmdpriv->cmdthd_running))	/* com_thread not running */
 	)
 		return _FAIL;
 
@@ -407,7 +407,7 @@ int rtw_cmd_thread(void *context)
 			break;
 		}
 
-		if ((padapter->bDriverStopped == true) || (padapter->bSurpriseRemoved == true)) {
+		if ((padapter->bDriverStopped) || (padapter->bSurpriseRemoved)) {
 			netdev_dbg(padapter->pnetdev,
 				   "%s: DriverStopped(%d) SurpriseRemoved(%d) break at line %d\n",
 				   __func__, padapter->bDriverStopped,
@@ -430,7 +430,7 @@ int rtw_cmd_thread(void *context)
 			continue;
 
 _next:
-		if ((padapter->bDriverStopped == true) || (padapter->bSurpriseRemoved == true)) {
+		if ((padapter->bDriverStopped) || (padapter->bSurpriseRemoved)) {
 			netdev_dbg(padapter->pnetdev,
 				   "%s: DriverStopped(%d) SurpriseRemoved(%d) break at line %d\n",
 				   __func__, padapter->bDriverStopped,
@@ -927,7 +927,7 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 	else
 		GET_ENCRY_ALGO(psecuritypriv, sta, psetstakey_para->algorithm, false);
 
-	if (unicast_key == true)
+	if (unicast_key)
 		memcpy(&psetstakey_para->key, &sta->dot118021x_UncstKey, 16);
 	else
 		memcpy(&psetstakey_para->key, &psecuritypriv->dot118021XGrpKey[psecuritypriv->dot118021XGrpKeyid].skey, 16);
@@ -1283,7 +1283,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 			(pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod > 2)) {
 			bEnterPS = false;
 
-			if (bBusyTraffic == true) {
+			if (bBusyTraffic) {
 				if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount <= 4)
 					pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 4;
 
@@ -1619,7 +1619,7 @@ static void rtw_chk_hi_queue_hdl(struct adapter *padapter)
 
 	rtw_hal_get_hwreg(padapter, HW_VAR_CHK_HI_QUEUE_EMPTY, &empty);
 
-	while (false == empty && jiffies_to_msecs(jiffies - start) < g_wait_hiq_empty) {
+	while (!empty && jiffies_to_msecs(jiffies - start) < g_wait_hiq_empty) {
 		msleep(100);
 		rtw_hal_get_hwreg(padapter, HW_VAR_CHK_HI_QUEUE_EMPTY, &empty);
 	}
@@ -2054,7 +2054,7 @@ void rtw_setassocsta_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *
 
 	spin_lock_bh(&pmlmepriv->lock);
 
-	if ((check_fwstate(pmlmepriv, WIFI_MP_STATE) == true) && (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true))
+	if ((check_fwstate(pmlmepriv, WIFI_MP_STATE)) && (check_fwstate(pmlmepriv, _FW_UNDER_LINKING)))
 		_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 
 	set_fwstate(pmlmepriv, _FW_LINKED);
-- 
2.25.1

