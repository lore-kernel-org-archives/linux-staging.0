Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4B66D00
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 10:01:54 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id u5so6759046ejn.8
        for <linux-staging@lists.linux.dev>; Fri, 02 Apr 2021 03:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OUO9JNZeZiEcMuWnDvHXtbUZDg6fifPASZ5lLJXcld4=;
        b=EeR6v2q2tX+EIykQG/zVehUpXHCcjcHVgb015fJj+ne111yGRR3Dn6ONxH8abAYNHO
         u2sN620ngtKR8TPmIv+/1RcZ6W37ZAX0cv6jJRnTaIm2J5gysPAiwKWPYVnsFSAFveDy
         gcMBVRxxn7aiuvFEbF8sm0VPpliXZcpr96YOprNzTtHQ+dMDXzxxEgvjX6TXzzHK1jyo
         WaURjaxDsLc89OVyhmLuZy0NNOYYRor6R15vvqfGY2b9cV83isJaGqNwx8A6Cqf0kEtL
         U5c/yJLPFEFHijI3g23taO1zC2WCjl4THYeUojK+eRoptSOMdReg6rtVMMLMkqFkvgEl
         D5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OUO9JNZeZiEcMuWnDvHXtbUZDg6fifPASZ5lLJXcld4=;
        b=Yz5xd41E7SimK+I8K8rHvnakYoEXHwk5lbhLWREVtkYYviOwCZDNRInCCvI8heqcxx
         S+u6+UqlEMs98m0nTVzqFdsPVfA4uQBMnfFDEDmnRWegkl7vFPB4pWsc9/2tqWWbDKzd
         Vkq5HLPAwf5KkO8F4hU9Wi9KzejJEPMTWPeClsqrHbIMr9bXkV+vRdqBv0olbpKIVadO
         y/YCh68Zw9LTE1ksqcrZ9oT3Fc2dwUR86MBnA43ePk1Q+vxr61EZIzJ0VinOSMFxRwa/
         jd1iMsVBF1GxXntmwpBYfjwy+bpYKk9a23EY+iyJfv03f02aBZmPo/AdHbET+5wy9U8W
         ZIXg==
X-Gm-Message-State: AOAM5304ybDOLf30sZFNsuTdx/OhgsoS72VMDexxao+CBgW85/WqxJaw
	ItSPp4fXJWZzB38z68k1iOY=
X-Google-Smtp-Source: ABdhPJxz6EMfsQqnGdh8hacdJPUdCs7wQqbtCeuel2J8EqjeOWSrhpR/s9DH0vvFWA39Go5QkvMgtQ==
X-Received: by 2002:a17:907:3f96:: with SMTP id hr22mr13045054ejc.427.1617357713319;
        Fri, 02 Apr 2021 03:01:53 -0700 (PDT)
Received: from agape ([5.171.72.128])
        by smtp.gmail.com with ESMTPSA id x17sm3952481ejd.68.2021.04.02.03.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:01:52 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 04/16] staging: rtl8723bs: remove all RT_TRACE logs in core/rtw_pwrctrl.c
Date: Fri,  2 Apr 2021 12:01:24 +0200
Message-Id: <d5e51ff73a21fffdc2f6f3f42ac7fe05374ad9e7.1617356821.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617356821.git.fabioaiuto83@gmail.com>
References: <cover.1617356821.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove all RT_TRACE logs

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 60 ++------------------
 1 file changed, 6 insertions(+), 54 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 8bf80e6f4a11..a3751d80704c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -266,41 +266,25 @@ void rtw_set_rpwm(struct adapter *padapter, u8 pslv)
 	if (pwrpriv->brpwmtimeout) {
 		DBG_871X("%s: RPWM timeout, force to set RPWM(0x%02X) again!\n", __func__, pslv);
 	} else {
-		if ((pwrpriv->rpwm == pslv)
-			|| ((pwrpriv->rpwm >= PS_STATE_S2) && (pslv >= PS_STATE_S2))) {
-			RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_err_,
-				("%s: Already set rpwm[0x%02X], new = 0x%02X!\n", __func__, pwrpriv->rpwm, pslv));
+		if (pwrpriv->rpwm == pslv ||
+		    (pwrpriv->rpwm >= PS_STATE_S2 && pslv >= PS_STATE_S2))
 			return;
-		}
+
 	}
 
 	if ((padapter->bSurpriseRemoved) || !(padapter->hw_init_completed)) {
-		RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_err_,
-				 ("%s: SurpriseRemoved(%d) hw_init_completed(%d)\n",
-				  __func__, padapter->bSurpriseRemoved, padapter->hw_init_completed));
-
 		pwrpriv->cpwm = PS_STATE_S4;
 
 		return;
 	}
 
-	if (padapter->bDriverStopped) {
-		RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_err_,
-				 ("%s: change power state(0x%02X) when DriverStopped\n", __func__, pslv));
-
-		if (pslv < PS_STATE_S2) {
-			RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_err_,
-					 ("%s: Reject to enter PS_STATE(0x%02X) lower than S2 when DriverStopped!!\n", __func__, pslv));
-			return;
-		}
-	}
+	if (padapter->bDriverStopped && pslv < PS_STATE_S2)
+		return;
 
 	rpwm = pslv | pwrpriv->tog;
 	/*  only when from PS_STATE S0/S1 to S2 and higher needs ACK */
 	if ((pwrpriv->cpwm < PS_STATE_S2) && (pslv >= PS_STATE_S2))
 		rpwm |= PS_ACK;
-	RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_notice_,
-			 ("rtw_set_rpwm: rpwm = 0x%02x cpwm = 0x%02x\n", rpwm, pwrpriv->cpwm));
 
 	pwrpriv->rpwm = pslv;
 
@@ -382,14 +366,8 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_a
 {
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
 
-	RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_notice_,
-			 ("%s: PowerMode =%d Smart_PS =%d\n",
-			  __func__, ps_mode, smart_ps));
-
-	if (ps_mode > PM_Card_Disable) {
-		RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_err_, ("ps_mode:%d error\n", ps_mode));
+	if (ps_mode > PM_Card_Disable)
 		return;
-	}
 
 	if (pwrpriv->pwr_mode == ps_mode)
 		if (PS_MODE_ACTIVE == ps_mode)
@@ -701,8 +679,6 @@ void cpwm_int_hdl(struct adapter *padapter, struct reportpwrstate_parm *preportp
 exit:
 	mutex_unlock(&pwrpriv->lock);
 
-	RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_notice_,
-			 ("cpwm_int_hdl: cpwm = 0x%02x\n", pwrpriv->cpwm));
 }
 
 static void cpwm_event_callback(struct work_struct *work)
@@ -817,10 +793,6 @@ s32 rtw_register_task_alive(struct adapter *padapter, u32 task)
 	register_task_alive(pwrctrl, task);
 
 	if (pwrctrl->bFwCurrentInPSMode) {
-		RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_notice_,
-				 ("%s: task = 0x%x cpwm = 0x%02x alives = 0x%08x\n",
-				  __func__, task, pwrctrl->cpwm, pwrctrl->alives));
-
 		if (pwrctrl->cpwm < pslv) {
 			if (pwrctrl->cpwm < PS_STATE_S2)
 				res = _FAIL;
@@ -869,10 +841,6 @@ void rtw_unregister_task_alive(struct adapter *padapter, u32 task)
 	unregister_task_alive(pwrctrl, task);
 
 	if ((pwrctrl->pwr_mode != PS_MODE_ACTIVE) && pwrctrl->bFwCurrentInPSMode) {
-		RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_notice_,
-				 ("%s: cpwm = 0x%02x alives = 0x%08x\n",
-				  __func__, pwrctrl->cpwm, pwrctrl->alives));
-
 		if (pwrctrl->cpwm > pslv)
 			if ((pslv >= PS_STATE_S2) || (pwrctrl->alives == 0))
 				rtw_set_rpwm(padapter, pslv);
@@ -910,10 +878,6 @@ s32 rtw_register_tx_alive(struct adapter *padapter)
 	register_task_alive(pwrctrl, XMIT_ALIVE);
 
 	if (pwrctrl->bFwCurrentInPSMode) {
-		RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_notice_,
-				 ("rtw_register_tx_alive: cpwm = 0x%02x alives = 0x%08x\n",
-				  pwrctrl->cpwm, pwrctrl->alives));
-
 		if (pwrctrl->cpwm < pslv) {
 			if (pwrctrl->cpwm < PS_STATE_S2)
 				res = _FAIL;
@@ -959,10 +923,6 @@ s32 rtw_register_cmd_alive(struct adapter *padapter)
 	register_task_alive(pwrctrl, CMD_ALIVE);
 
 	if (pwrctrl->bFwCurrentInPSMode) {
-		RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_info_,
-				 ("rtw_register_cmd_alive: cpwm = 0x%02x alives = 0x%08x\n",
-				  pwrctrl->cpwm, pwrctrl->alives));
-
 		if (pwrctrl->cpwm < pslv) {
 			if (pwrctrl->cpwm < PS_STATE_S2)
 				res = _FAIL;
@@ -1008,10 +968,6 @@ void rtw_unregister_tx_alive(struct adapter *padapter)
 	unregister_task_alive(pwrctrl, XMIT_ALIVE);
 
 	if ((pwrctrl->pwr_mode != PS_MODE_ACTIVE) && pwrctrl->bFwCurrentInPSMode) {
-		RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_notice_,
-				 ("%s: cpwm = 0x%02x alives = 0x%08x\n",
-				  __func__, pwrctrl->cpwm, pwrctrl->alives));
-
 		if (pwrctrl->cpwm > pslv)
 			if ((pslv >= PS_STATE_S2) || (pwrctrl->alives == 0))
 				rtw_set_rpwm(padapter, pslv);
@@ -1048,10 +1004,6 @@ void rtw_unregister_cmd_alive(struct adapter *padapter)
 	unregister_task_alive(pwrctrl, CMD_ALIVE);
 
 	if ((pwrctrl->pwr_mode != PS_MODE_ACTIVE) && pwrctrl->bFwCurrentInPSMode) {
-		RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_info_,
-				 ("%s: cpwm = 0x%02x alives = 0x%08x\n",
-				  __func__, pwrctrl->cpwm, pwrctrl->alives));
-
 		if (pwrctrl->cpwm > pslv) {
 			if ((pslv >= PS_STATE_S2) || (pwrctrl->alives == 0))
 				rtw_set_rpwm(padapter, pslv);
-- 
2.20.1

