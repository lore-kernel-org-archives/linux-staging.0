Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B355270
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 09:40:20 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id r12so29088201ejr.5
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 02:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7Kayl37R590Nbl+PA5xng9aOBR4stGcCDHvahiUk9YU=;
        b=NLUcGcasA6GNNobggHhgwBt5dCfKkYFlh9UOSbeWnyTtsx3jzD/PPtPXkjRHp7wn/0
         xd3UWuw0i32G/IA1lzpVib1nPw3qvAfC49EyFD8l/3aM+NAXoM/8XIYeX39fXKPXstpK
         yEvQKWHDRyDA/OzcVDTmnXnXgjMxXK6vb6ZLtV+IFllFiPReBLf+oGIlJJx3VZRV2vjm
         JT7gwhnzeo5NVMPr1jsiBlXiGlt56IVcJo0sJXTXRCOs3/h5NTTFjC0CBG0HadNUdD69
         ZeKBauun02LhNnHC1HEFhD/WxEfNX04rG8RopD+V7K6x94G9PZIhs3wdiL5hwgfjpIr2
         TtDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7Kayl37R590Nbl+PA5xng9aOBR4stGcCDHvahiUk9YU=;
        b=kzP/JQwaBvOmRY2e0A01r+8fXzRPd844ddJmE52B8kS1405DAwgq6XQUQ4lQ1DJJnb
         Xb/idKvuN/2t18QbSy90zCIUXD88iqJNINNOF4uKq1W8bMmi1Hhx+6icc4Vblx4db8VN
         pUISieI8LpQZlBc77C4KGD3DWaDnaqWNwC8ZeqChYx6jOhEbgnBhlL2YywltccCml3tl
         8W7Alf4GDuAHwhpj/nNKNyhc01O0ENZBUSBxqhBWXFyty3pU0lHvvWJYecYLKNMsLEOl
         LsCdGkXxo00OfRLBFM5hHpQiZdzBuVItnaabDWrIrdUUSrTg230FISU6WbKTu4brpgy4
         8Spw==
X-Gm-Message-State: AOAM531rYJ1gDxxK/hKAlo4wazfV8NKO9iTrXvAOggnVKlf4z92gyZni
	LJ9kEs4kbkGZVc3oZusvVO0=
X-Google-Smtp-Source: ABdhPJyyyQ1ldbZkIw8v6diZ5t7qtaQucfm/xcQSAhKZ7Ztv7XkDdT4w884Q66YEjW60a4yOYkEtTw==
X-Received: by 2002:a17:907:7745:: with SMTP id kx5mr2519497ejc.3.1617183619309;
        Wed, 31 Mar 2021 02:40:19 -0700 (PDT)
Received: from agape ([5.171.73.44])
        by smtp.gmail.com with ESMTPSA id i10sm821168ejv.106.2021.03.31.02.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 02:40:19 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 04/40] staging: rtl8723bs: replace RT_TRACE with public printk wrappers in core/rtw_pwrctrl.c
Date: Wed, 31 Mar 2021 11:39:32 +0200
Message-Id: <e452bbaa8b6af6c0e48f90f4e73052768dbe9845.1617183374.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617183374.git.fabioaiuto83@gmail.com>
References: <cover.1617183374.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

replace private macro RT_TRACE for tracing with in-kernel
pr_* printk wrappers

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 62 +++++++++-----------
 1 file changed, 27 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 8bf80e6f4a11..da967e819fcf 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -268,16 +268,16 @@ void rtw_set_rpwm(struct adapter *padapter, u8 pslv)
 	} else {
 		if ((pwrpriv->rpwm == pslv)
 			|| ((pwrpriv->rpwm >= PS_STATE_S2) && (pslv >= PS_STATE_S2))) {
-			RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_err_,
-				("%s: Already set rpwm[0x%02X], new = 0x%02X!\n", __func__, pwrpriv->rpwm, pslv));
+			pr_err("%s %s: Already set rpwm[0x%02X], new = 0x%02X!\n",
+			       DRIVER_PREFIX, __func__, pwrpriv->rpwm, pslv);
 			return;
 		}
 	}
 
 	if ((padapter->bSurpriseRemoved) || !(padapter->hw_init_completed)) {
-		RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_err_,
-				 ("%s: SurpriseRemoved(%d) hw_init_completed(%d)\n",
-				  __func__, padapter->bSurpriseRemoved, padapter->hw_init_completed));
+		pr_err("%s %s: SurpriseRemoved(%d) hw_init_completed(%d)\n",
+		       DRIVER_PREFIX, __func__, padapter->bSurpriseRemoved,
+		       padapter->hw_init_completed);
 
 		pwrpriv->cpwm = PS_STATE_S4;
 
@@ -285,12 +285,12 @@ void rtw_set_rpwm(struct adapter *padapter, u8 pslv)
 	}
 
 	if (padapter->bDriverStopped) {
-		RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_err_,
-				 ("%s: change power state(0x%02X) when DriverStopped\n", __func__, pslv));
+		pr_err("%s %s: change power state(0x%02X) when DriverStopped\n",
+		       DRIVER_PREFIX, __func__, pslv);
 
 		if (pslv < PS_STATE_S2) {
-			RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_err_,
-					 ("%s: Reject to enter PS_STATE(0x%02X) lower than S2 when DriverStopped!!\n", __func__, pslv));
+			pr_err("%s %s: Reject to enter PS_STATE(0x%02X) lower than S2 when DriverStopped!!\n",
+			       DRIVER_PREFIX, __func__, pslv);
 			return;
 		}
 	}
@@ -299,8 +299,8 @@ void rtw_set_rpwm(struct adapter *padapter, u8 pslv)
 	/*  only when from PS_STATE S0/S1 to S2 and higher needs ACK */
 	if ((pwrpriv->cpwm < PS_STATE_S2) && (pslv >= PS_STATE_S2))
 		rpwm |= PS_ACK;
-	RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_notice_,
-			 ("rtw_set_rpwm: rpwm = 0x%02x cpwm = 0x%02x\n", rpwm, pwrpriv->cpwm));
+	pr_notice("%s %s: rpwm = 0x%02x cpwm = 0x%02x\n", DRIVER_PREFIX,
+		  __func__, rpwm, pwrpriv->cpwm);
 
 	pwrpriv->rpwm = pslv;
 
@@ -382,12 +382,11 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_a
 {
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
 
-	RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_notice_,
-			 ("%s: PowerMode =%d Smart_PS =%d\n",
-			  __func__, ps_mode, smart_ps));
+	pr_notice("%s %s: PowerMode =%d Smart_PS =%d\n", DRIVER_PREFIX,
+		  __func__, ps_mode, smart_ps);
 
 	if (ps_mode > PM_Card_Disable) {
-		RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_err_, ("ps_mode:%d error\n", ps_mode));
+		pr_err("%s ps_mode:%d error\n", DRIVER_PREFIX, ps_mode);
 		return;
 	}
 
@@ -701,8 +700,7 @@ void cpwm_int_hdl(struct adapter *padapter, struct reportpwrstate_parm *preportp
 exit:
 	mutex_unlock(&pwrpriv->lock);
 
-	RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_notice_,
-			 ("cpwm_int_hdl: cpwm = 0x%02x\n", pwrpriv->cpwm));
+	pr_notice("%s %s: cpwm = 0x%02x\n", DRIVER_PREFIX, __func__, pwrpriv->cpwm);
 }
 
 static void cpwm_event_callback(struct work_struct *work)
@@ -817,9 +815,8 @@ s32 rtw_register_task_alive(struct adapter *padapter, u32 task)
 	register_task_alive(pwrctrl, task);
 
 	if (pwrctrl->bFwCurrentInPSMode) {
-		RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_notice_,
-				 ("%s: task = 0x%x cpwm = 0x%02x alives = 0x%08x\n",
-				  __func__, task, pwrctrl->cpwm, pwrctrl->alives));
+		pr_notice("%s %s: task = 0x%x cpwm = 0x%02x alives = 0x%08x\n",
+			  DRIVER_PREFIX, __func__, task, pwrctrl->cpwm, pwrctrl->alives);
 
 		if (pwrctrl->cpwm < pslv) {
 			if (pwrctrl->cpwm < PS_STATE_S2)
@@ -869,9 +866,8 @@ void rtw_unregister_task_alive(struct adapter *padapter, u32 task)
 	unregister_task_alive(pwrctrl, task);
 
 	if ((pwrctrl->pwr_mode != PS_MODE_ACTIVE) && pwrctrl->bFwCurrentInPSMode) {
-		RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_notice_,
-				 ("%s: cpwm = 0x%02x alives = 0x%08x\n",
-				  __func__, pwrctrl->cpwm, pwrctrl->alives));
+		pr_notice("%s %s: cpwm = 0x%02x alives = 0x%08x\n", DRIVER_PREFIX,
+			  __func__, pwrctrl->cpwm, pwrctrl->alives);
 
 		if (pwrctrl->cpwm > pslv)
 			if ((pslv >= PS_STATE_S2) || (pwrctrl->alives == 0))
@@ -910,9 +906,8 @@ s32 rtw_register_tx_alive(struct adapter *padapter)
 	register_task_alive(pwrctrl, XMIT_ALIVE);
 
 	if (pwrctrl->bFwCurrentInPSMode) {
-		RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_notice_,
-				 ("rtw_register_tx_alive: cpwm = 0x%02x alives = 0x%08x\n",
-				  pwrctrl->cpwm, pwrctrl->alives));
+		pr_notice("%s %s: cpwm = 0x%02x alives = 0x%08x\n",
+			  DRIVER_PREFIX, __func__, pwrctrl->cpwm, pwrctrl->alives);
 
 		if (pwrctrl->cpwm < pslv) {
 			if (pwrctrl->cpwm < PS_STATE_S2)
@@ -959,9 +954,8 @@ s32 rtw_register_cmd_alive(struct adapter *padapter)
 	register_task_alive(pwrctrl, CMD_ALIVE);
 
 	if (pwrctrl->bFwCurrentInPSMode) {
-		RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_info_,
-				 ("rtw_register_cmd_alive: cpwm = 0x%02x alives = 0x%08x\n",
-				  pwrctrl->cpwm, pwrctrl->alives));
+		pr_info("%s %s: cpwm = 0x%02x alives = 0x%08x\n",
+			DRIVER_PREFIX, __func__, pwrctrl->cpwm, pwrctrl->alives);
 
 		if (pwrctrl->cpwm < pslv) {
 			if (pwrctrl->cpwm < PS_STATE_S2)
@@ -1008,9 +1002,8 @@ void rtw_unregister_tx_alive(struct adapter *padapter)
 	unregister_task_alive(pwrctrl, XMIT_ALIVE);
 
 	if ((pwrctrl->pwr_mode != PS_MODE_ACTIVE) && pwrctrl->bFwCurrentInPSMode) {
-		RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_notice_,
-				 ("%s: cpwm = 0x%02x alives = 0x%08x\n",
-				  __func__, pwrctrl->cpwm, pwrctrl->alives));
+		pr_notice("%s %s: cpwm = 0x%02x alives = 0x%08x\n",
+			  DRIVER_PREFIX, __func__, pwrctrl->cpwm, pwrctrl->alives);
 
 		if (pwrctrl->cpwm > pslv)
 			if ((pslv >= PS_STATE_S2) || (pwrctrl->alives == 0))
@@ -1048,9 +1041,8 @@ void rtw_unregister_cmd_alive(struct adapter *padapter)
 	unregister_task_alive(pwrctrl, CMD_ALIVE);
 
 	if ((pwrctrl->pwr_mode != PS_MODE_ACTIVE) && pwrctrl->bFwCurrentInPSMode) {
-		RT_TRACE(_module_rtl871x_pwrctrl_c_, _drv_info_,
-				 ("%s: cpwm = 0x%02x alives = 0x%08x\n",
-				  __func__, pwrctrl->cpwm, pwrctrl->alives));
+		pr_info("%s %s: cpwm = 0x%02x alives = 0x%08x\n",
+			DRIVER_PREFIX, __func__, pwrctrl->cpwm, pwrctrl->alives);
 
 		if (pwrctrl->cpwm > pslv) {
 			if ((pslv >= PS_STATE_S2) || (pwrctrl->alives == 0))
-- 
2.20.1

