Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1D46D09
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 17:30:31 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id k8so5307022wrc.3
        for <linux-staging@lists.linux.dev>; Fri, 02 Apr 2021 10:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JiEqs6MSc8Nm4Buf8jFUPSNvcz+vqEUG20tk1qyaE1s=;
        b=s0fmAqFyHJVEiQwmL/AVo+F/3dZq/ho4Bsb7ziymW612Nhof8yULjVsdTVkaujEeTa
         6rT2jwwoUyALpRlqJUHefkYrjlXr+XY8JZDpN4UHPZJpzWR8rukEbfekS3KuluwKo7Uy
         DUbmjg/OokVsm4DP5Afs+maEsb/Ky85Yg4UlI0g4mIM2wm56ip/i6BU6rP8ARE46T9yJ
         iloJ9qffFQ2n/f2FvqHgbNy4e6+bcjOWB6YhxySfSh2GjjWHGqeZ7P/vMjoJsayZ2dOk
         +6chhfEhC9byGUcPjVHZ39JJjnD6mjiSyNWY61pCOvf/F50pDDMKoHwaLG8BUGUVyahN
         2klQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JiEqs6MSc8Nm4Buf8jFUPSNvcz+vqEUG20tk1qyaE1s=;
        b=Lg41Orrr6YJEHvtr/hO7tX5rp+szVdgiVZwdHQWjsr86X/cvuVBZTdcD0B2tG5oG5a
         ChjqKC81Euq0wlNcACBrxn1qM3Bkg2O1+IuNhKIl7fRlF6aL2dOItB+3jWAtaw1qKpwN
         o/7BuQreE6lfkz8ZWytjiRkSly/axIUbD5FPxylFsOO58RNhH/0gXYTA6JWX5Cdv5v18
         DPaGcpYtte5upWxIayONnmZ8AY5KpS/VDQ/ZkDAFxhYH+WA4lpKdvnjJ2FFdwCyGWv9l
         7gqKqhvKkErwHNSU5QdVrap9UccR8Kxs9p49ADtu3jp8PMb7o+L/y/ezk4wkJPAgmImj
         EONw==
X-Gm-Message-State: AOAM532T+ce3OzBOCYsQhAhrschSoUsCKGuepMLhRBXzNuhsWA2TPOVb
	y0o5/TUN1NsADDIts0RNDM0=
X-Google-Smtp-Source: ABdhPJw+1iisZeaHW5iY2ZW02hJI4K20gX10vomTTje+AGQIkTGvqoyO8SdoRlu+tuCn0tus5iCwAQ==
X-Received: by 2002:a5d:67c8:: with SMTP id n8mr16419514wrw.351.1617384630234;
        Fri, 02 Apr 2021 10:30:30 -0700 (PDT)
Received: from agape ([5.171.81.4])
        by smtp.gmail.com with ESMTPSA id c9sm14832154wrr.78.2021.04.02.10.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 10:30:29 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 08/30] staging: rtl8723bs: remove all RT_TRACE logs in core/rtw_pwrctrl.c
Date: Fri,  2 Apr 2021 19:29:50 +0200
Message-Id: <ae63934a50e7205625458fe4d3bc8dfb9ae2b5a0.1617384172.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617384172.git.fabioaiuto83@gmail.com>
References: <cover.1617384172.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove all RT_TRACE logs

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

