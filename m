Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEF76D09
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 09:14:28 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id u5-20020a7bcb050000b029010e9316b9d5so3321687wmj.2
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 02:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8gXw9HaOslpcD9hi+0ys594bAsPjkmcQrRqQUMxpklE=;
        b=HOt5J96QOWztwPWFCeVrFqzj86CGZFEPez5xl3wzzXimCMyC1d2IqO23o8mxCc2YR0
         7pofQXk+Hkd0c+3d9V52lgZbKvjkbv9raAPktTjvhd78MBgFodFKcfugTDEiI+HWXGAd
         qMpK2yjLUbOvpNR+x/dvTNZVve0Us5qW2Zdn+pSp0db7K/sRGOWB04tPlVUV7mOs18qm
         1xS2uuS2abln6+P+d0hF4oEtmtg/tnqu+218SBMXUNwopkLdhs4JNDENPbKanE5EInDQ
         pzJ7kw+LmuE+8esLjiolB+mVRhCHZaYb1tpgzBjvbNqSb2BCZWohBjgeHmFNT7Z6j2G9
         pgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8gXw9HaOslpcD9hi+0ys594bAsPjkmcQrRqQUMxpklE=;
        b=D446gumobH2dFz4AGMRnAY5KJprE5VgEyVl/ZRJv5IZf0MrNSO57ySw6F9LSVoCc1Y
         XbkwHwZVSrlMrKMx+w04NQj/3+UtoDCiHfWt9PVrJSEgEaSu1kpPUgAxZzQDnPtKmD1Z
         aBrkNh9VsgaUCy85R3GiArNePtI9myYTDn6oW9jXkKEtRdqGNE6Pmxb7Ai2IzxrGt5Ka
         J8EHAmlUNFX1Vgv8bkY0uyiCQwiPd4UEOAYm7hsg+VNuVNwD5GKDHs2hOygbUxvlQmAH
         X4PM/UZR7FLJ6SgkEZ51IacjvW023XfsSj5nePDNN4OvFnY3IKvCx5oQBuofG9L7zjMe
         1bWQ==
X-Gm-Message-State: AOAM533NUixCHsPOx0i5uXkFCubY3kcU3Yfz8/lLCTo5J7Xwpvog9wP2
	OSNWyfYkV3MZ32rPzNcPuBx41tkE6X8=
X-Google-Smtp-Source: ABdhPJyNtKijwT98FL0JL0JlnrutjkiPRU9lD4wVDsDMDTjz05rzHY2ek1NwSZlxjM/UaTVheQP2SA==
X-Received: by 2002:a05:600c:4f55:: with SMTP id m21mr16277965wmq.11.1617441267058;
        Sat, 03 Apr 2021 02:14:27 -0700 (PDT)
Received: from agape ([5.171.72.64])
        by smtp.gmail.com with ESMTPSA id b12sm18993738wrf.39.2021.04.03.02.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 02:14:26 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v3 08/30] staging: rtl8723bs: remove all RT_TRACE logs in core/rtw_pwrctrl.c
Date: Sat,  3 Apr 2021 11:13:30 +0200
Message-Id: <a842ef8f93c920e52fed1b552968b679ca5e7be6.1617440834.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617440833.git.fabioaiuto83@gmail.com>
References: <cover.1617440833.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all of the RT_TRACE logs in the core/rtw_pwrctrl.c file as they
currently do nothing as they require the code to be modified by
hand in order to be turned on. This obviously has not happened
since the code was merged. Moreover it relies on an unneeded
private log level tracing which overrides the in-kernel public one,
so just remove them as they are unused.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 54 ++------------------
 1 file changed, 4 insertions(+), 50 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 8bf80e6f4a11..cc1b0d1a5a7b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -267,40 +267,26 @@ void rtw_set_rpwm(struct adapter *padapter, u8 pslv)
 		DBG_871X("%s: RPWM timeout, force to set RPWM(0x%02X) again!\n", __func__, pslv);
 	} else {
 		if ((pwrpriv->rpwm == pslv)
-			|| ((pwrpriv->rpwm >= PS_STATE_S2) && (pslv >= PS_STATE_S2))) {
-			RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_err_,
-				("%s: Already set rpwm[0x%02X], new = 0x%02X!\n", __func__, pwrpriv->rpwm, pslv));
+			|| ((pwrpriv->rpwm >= PS_STATE_S2) && (pslv >= PS_STATE_S2)))
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
 
 	if (padapter->bDriverStopped) {
-		RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_err_,
-				 ("%s: change power state(0x%02X) when DriverStopped\n", __func__, pslv));
-
-		if (pslv < PS_STATE_S2) {
-			RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_err_,
-					 ("%s: Reject to enter PS_STATE(0x%02X) lower than S2 when DriverStopped!!\n", __func__, pslv));
+		if (pslv < PS_STATE_S2)
 			return;
-		}
 	}
 
 	rpwm = pslv | pwrpriv->tog;
 	/*  only when from PS_STATE S0/S1 to S2 and higher needs ACK */
 	if ((pwrpriv->cpwm < PS_STATE_S2) && (pslv >= PS_STATE_S2))
 		rpwm |= PS_ACK;
-	RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_notice_,
-			 ("rtw_set_rpwm: rpwm = 0x%02x cpwm = 0x%02x\n", rpwm, pwrpriv->cpwm));
 
 	pwrpriv->rpwm = pslv;
 
@@ -382,14 +368,8 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_a
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
@@ -701,8 +681,6 @@ void cpwm_int_hdl(struct adapter *padapter, struct reportpwrstate_parm *preportp
 exit:
 	mutex_unlock(&pwrpriv->lock);
 
-	RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_notice_,
-			 ("cpwm_int_hdl: cpwm = 0x%02x\n", pwrpriv->cpwm));
 }
 
 static void cpwm_event_callback(struct work_struct *work)
@@ -817,10 +795,6 @@ s32 rtw_register_task_alive(struct adapter *padapter, u32 task)
 	register_task_alive(pwrctrl, task);
 
 	if (pwrctrl->bFwCurrentInPSMode) {
-		RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_notice_,
-				 ("%s: task = 0x%x cpwm = 0x%02x alives = 0x%08x\n",
-				  __func__, task, pwrctrl->cpwm, pwrctrl->alives));
-
 		if (pwrctrl->cpwm < pslv) {
 			if (pwrctrl->cpwm < PS_STATE_S2)
 				res = _FAIL;
@@ -869,10 +843,6 @@ void rtw_unregister_task_alive(struct adapter *padapter, u32 task)
 	unregister_task_alive(pwrctrl, task);
 
 	if ((pwrctrl->pwr_mode != PS_MODE_ACTIVE) && pwrctrl->bFwCurrentInPSMode) {
-		RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_notice_,
-				 ("%s: cpwm = 0x%02x alives = 0x%08x\n",
-				  __func__, pwrctrl->cpwm, pwrctrl->alives));
-
 		if (pwrctrl->cpwm > pslv)
 			if ((pslv >= PS_STATE_S2) || (pwrctrl->alives == 0))
 				rtw_set_rpwm(padapter, pslv);
@@ -910,10 +880,6 @@ s32 rtw_register_tx_alive(struct adapter *padapter)
 	register_task_alive(pwrctrl, XMIT_ALIVE);
 
 	if (pwrctrl->bFwCurrentInPSMode) {
-		RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_notice_,
-				 ("rtw_register_tx_alive: cpwm = 0x%02x alives = 0x%08x\n",
-				  pwrctrl->cpwm, pwrctrl->alives));
-
 		if (pwrctrl->cpwm < pslv) {
 			if (pwrctrl->cpwm < PS_STATE_S2)
 				res = _FAIL;
@@ -959,10 +925,6 @@ s32 rtw_register_cmd_alive(struct adapter *padapter)
 	register_task_alive(pwrctrl, CMD_ALIVE);
 
 	if (pwrctrl->bFwCurrentInPSMode) {
-		RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_info_,
-				 ("rtw_register_cmd_alive: cpwm = 0x%02x alives = 0x%08x\n",
-				  pwrctrl->cpwm, pwrctrl->alives));
-
 		if (pwrctrl->cpwm < pslv) {
 			if (pwrctrl->cpwm < PS_STATE_S2)
 				res = _FAIL;
@@ -1008,10 +970,6 @@ void rtw_unregister_tx_alive(struct adapter *padapter)
 	unregister_task_alive(pwrctrl, XMIT_ALIVE);
 
 	if ((pwrctrl->pwr_mode != PS_MODE_ACTIVE) && pwrctrl->bFwCurrentInPSMode) {
-		RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_notice_,
-				 ("%s: cpwm = 0x%02x alives = 0x%08x\n",
-				  __func__, pwrctrl->cpwm, pwrctrl->alives));
-
 		if (pwrctrl->cpwm > pslv)
 			if ((pslv >= PS_STATE_S2) || (pwrctrl->alives == 0))
 				rtw_set_rpwm(padapter, pslv);
@@ -1048,10 +1006,6 @@ void rtw_unregister_cmd_alive(struct adapter *padapter)
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

