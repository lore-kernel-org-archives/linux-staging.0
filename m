Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444A5292905
	for <linux-staging@lists.linux.dev>; Thu, 24 Apr 2025 19:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745524609; cv=none; b=NYjF62GqmS7WkO30fFKzHSqLG3cdpcyIRiA4OxjtLyaEGVeEKp27obHqFtYIZEB2jeH6MmJFROdxZyNM7LDrs4OuJV1Ne5GNN6UL2Z6c0i4nUdFhdfUjo8n5bIOWQQ5hztybcx6h56ca1FaHfsAPVU1QM6MJE6Hnv+9gcg/TZco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745524609; c=relaxed/simple;
	bh=h2xLWijHqsJh9aCM5jzbFrl2+AYQJ6rdD8ZscR+zgn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TWB5/2cFOhgAp4EtlLP3+g8JazJ7eFunQS4oHUTWWgqPUwVIO81ZoPwYC090pA8f15U0Ye71TR6GNrrRrd914wbF6/etuxMBM77JMC5c0BivMFHofgKbGLdZEXYdTGaz8dIbCxo9GLYU+T4GsCe+ekzRR2y+jQQqoCIkd5tqtpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQRRWOKj; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQRRWOKj"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso10227455e9.1
        for <linux-staging@lists.linux.dev>; Thu, 24 Apr 2025 12:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745524606; x=1746129406; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3iqalMRN1Too28MdqO5MJFFqCooDYv/cQAN3f6XGglg=;
        b=ZQRRWOKj8wwzlWWroRjZ3xU6d7fD3uFlsYOCNP5pxy4RWrbYOCNXrAmi0SoB4zHlUD
         GCnqno5GZtyKiOl5OsuVr48Z+RGwDVIal24cZm2RlruzXfzmRSNryudv/UPGJ/+uNh12
         IfwguFJJiCbIKgXPL6UI4umlsZit97EBjtf2kbnAVM714aPBEXHLc1OY+wUFxtKRTVII
         86HjK8hZpNeUsVRB0UI/qW8wwen++lm8tw08KayrMFwtO+cRmXfnPXnuDQmzBfvNI0vt
         NBfri9xt5On9iDhANOSZiRpBTVDDDHssE3rv/+R9YzFiRdWfUNPkQJgI8eWj23fpsUUB
         P/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745524606; x=1746129406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3iqalMRN1Too28MdqO5MJFFqCooDYv/cQAN3f6XGglg=;
        b=PeYIUb8EVisWbPFNUl05O2r21ROvKzZ1QQMTtNhfqSuWNWkb6b99dEUR2zUzF5pOLn
         5T6Xdq3nitNhtnOqBlhR0PwAh/HZeDeUDT9n83+T4PiKzfPa+VDpeyc8DCDTIJYNqCoV
         ez/gK8EQb3yc1c4vSiJRfzQLNgdacT5XOdBuK7BBSkOrGMoIkBWS8upEFsWjIKMquqrC
         qNwFt5EEYxomnU2Pd+5SdmS2fZs1xh+rg45SB5N+bXgsZAewrG8+i+7bkKXRWvzugpy9
         g/oEpvrjNDUbJ9EglDglYCHDQZci2OJ8b7HlyNcTbdYXOOlYZjA9I1YUAIfqdiedoXNw
         uQAA==
X-Forwarded-Encrypted: i=1; AJvYcCXuiXY97J5pLkpjIFtcJdvxN7beOVXBp93i/ALkYfHlMxzfep2LWQMPC/d6sW1UxxY6TNSEjm8+019OBdua@lists.linux.dev
X-Gm-Message-State: AOJu0YwfKETNdBi1OKKt1zAv2/WH8LTwZJ/72W9Pq+3UlOt2MXJDBpdt
	6Jfa/fcSADhReAW4z2aYpmbWQxfQ6LO8Rly1LARD5AVOl5Zztxbb
X-Gm-Gg: ASbGncv+tpakw3e3b7knGjxliyraD2OHDWlfidYDE6+SKCPJjUEDP0z2r8Li42zby69
	CggbKp/N+/LBd/txo+5z14ppoD0sevC1iWMVRwIS/6of4b2K28a5kkHDl/yj/nvr1+ger6gfGAn
	fujCzS7FpUHoJHAZ1ffQnxtejU/XhqKVrX4NuBSwZ5FRUob4PIl+SMz2zKkkza/F66jYKbSTEhj
	i33d4KuCM6aMhRG2Dw0am3akJSDayKoXI3teQxBsjZLSXgZWK2q+PZqc5kPYNUFZmPXTD0AA92u
	I10dI6maLFH0S84jUbbQvTKVdwyYk7BJv0j/hg==
X-Google-Smtp-Source: AGHT+IExC2q4mO+fw159QN/Yjr1iCoX4oGeYYkxFXi5fVEEy/XwZMeNXuIoCI4cNamXLAMNHvmb9pQ==
X-Received: by 2002:a05:600c:1912:b0:43c:eea9:f45d with SMTP id 5b1f17b1804b1-440a310e4cemr7584505e9.18.1745524605429;
        Thu, 24 Apr 2025 12:56:45 -0700 (PDT)
Received: from pc.. ([196.96.160.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8842sm32385865e9.31.2025.04.24.12.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 12:56:45 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org
Cc: julia.lawall@inria.fr,
	karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: rtl8723bs: Switch mutexes to scoped_guard
Date: Thu, 24 Apr 2025 22:56:26 +0300
Message-ID: <b9ad5048b70a5555c0921278349f07e77729a1d7.1745523325.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745523325.git.karanja99erick@gmail.com>
References: <cover.1745523325.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace manual mutex_lock/mutex_unlock and goto-based cleanup
with a scoped_guard block. This ensures the mutex is always
released safely, even on early returns,
and removes the need for error-prone goto labels

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 281 +++++++++----------
 1 file changed, 126 insertions(+), 155 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 74a8fcf18e84..a38db840ab47 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -40,9 +40,8 @@ void ips_enter(struct adapter *padapter)
 
 	hal_btcoex_IpsNotify(padapter, pwrpriv->ips_mode_req);
 
-	mutex_lock(&pwrpriv->lock);
-	_ips_enter(padapter);
-	mutex_unlock(&pwrpriv->lock);
+	scoped_guard(mutex, &pwrpriv->lock)
+		_ips_enter(padapter);
 }
 
 int _ips_leave(struct adapter *padapter)
@@ -72,9 +71,8 @@ int ips_leave(struct adapter *padapter)
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
 	int ret;
 
-	mutex_lock(&pwrpriv->lock);
-	ret = _ips_leave(padapter);
-	mutex_unlock(&pwrpriv->lock);
+	scope_guard(mutex, &pwrpriv->lock)
+		ret = _ips_leave(padapter);
 
 	if (ret == _SUCCESS)
 		hal_btcoex_IpsNotify(padapter, IPS_NONE);
@@ -144,9 +142,8 @@ void rtw_ps_processor(struct adapter *padapter)
 	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
 	u32 ps_deny = 0;
 
-	mutex_lock(&adapter_to_pwrctl(padapter)->lock);
-	ps_deny = rtw_ps_deny_get(padapter);
-	mutex_unlock(&adapter_to_pwrctl(padapter)->lock);
+	scoped_guard(mutex, &adapter_to_pwrctl(padapter)->lock)
+		ps_deny = rtw_ps_deny_get(padapter);
 	if (ps_deny != 0)
 		goto exit;
 
@@ -348,53 +345,51 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_a
 			return;
 
 
-	mutex_lock(&pwrpriv->lock);
-
+	scoped_guard(mutex, &pwrpriv->lock) {
 	/* if (pwrpriv->pwr_mode == PS_MODE_ACTIVE) */
-	if (ps_mode == PS_MODE_ACTIVE) {
-		if (!(hal_btcoex_IsBtControlLps(padapter))
+		if (ps_mode == PS_MODE_ACTIVE) {
+			if (!(hal_btcoex_IsBtControlLps(padapter))
 				|| (hal_btcoex_IsBtControlLps(padapter)
 					&& !(hal_btcoex_IsLpsOn(padapter)))) {
-			pwrpriv->pwr_mode = ps_mode;
-			rtw_set_rpwm(padapter, PS_STATE_S4);
-
-			rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_PWRMODE, (u8 *)(&ps_mode));
-			pwrpriv->fw_current_in_ps_mode = false;
-
-			hal_btcoex_LpsNotify(padapter, ps_mode);
-		}
-	} else {
-		if ((PS_RDY_CHECK(padapter) && check_fwstate(&padapter->mlmepriv, WIFI_ASOC_STATE)) ||
-		    ((hal_btcoex_IsBtControlLps(padapter)) && (hal_btcoex_IsLpsOn(padapter)))
-			) {
-			u8 pslv;
-
-			hal_btcoex_LpsNotify(padapter, ps_mode);
-
-			pwrpriv->fw_current_in_ps_mode = true;
-			pwrpriv->pwr_mode = ps_mode;
-			pwrpriv->smart_ps = smart_ps;
-			pwrpriv->bcn_ant_mode = bcn_ant_mode;
-			rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_PWRMODE, (u8 *)(&ps_mode));
-
-			pslv = PS_STATE_S2;
-			if (pwrpriv->alives == 0)
-				pslv = PS_STATE_S0;
+				pwrpriv->pwr_mode = ps_mode;
+				rtw_set_rpwm(padapter, PS_STATE_S4);
 
-			if (!(hal_btcoex_IsBtDisabled(padapter)) &&
-			    (hal_btcoex_IsBtControlLps(padapter))) {
-				u8 val8;
+				rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_PWRMODE, (u8 *)(&ps_mode));
+				pwrpriv->fw_current_in_ps_mode = false;
 
-				val8 = hal_btcoex_LpsVal(padapter);
-				if (val8 & BIT(4))
-					pslv = PS_STATE_S2;
+				hal_btcoex_LpsNotify(padapter, ps_mode);
 			}
+		} else {
+			if ((PS_RDY_CHECK(padapter) && check_fwstate(&padapter->mlmepriv, WIFI_ASOC_STATE)) ||
+			((hal_btcoex_IsBtControlLps(padapter)) && (hal_btcoex_IsLpsOn(padapter)))
+				) {
+				u8 pslv;
+
+				hal_btcoex_LpsNotify(padapter, ps_mode);
+
+				pwrpriv->fw_current_in_ps_mode = true;
+				pwrpriv->pwr_mode = ps_mode;
+				pwrpriv->smart_ps = smart_ps;
+				pwrpriv->bcn_ant_mode = bcn_ant_mode;
+				rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_PWRMODE, (u8 *)(&ps_mode));
+
+				pslv = PS_STATE_S2;
+				if (pwrpriv->alives == 0)
+					pslv = PS_STATE_S0;
+
+				if (!(hal_btcoex_IsBtDisabled(padapter)) &&
+				(hal_btcoex_IsBtControlLps(padapter))) {
+					u8 val8;
+
+					val8 = hal_btcoex_LpsVal(padapter);
+					if (val8 & BIT(4))
+						pslv = PS_STATE_S2;
+				}
 
-			rtw_set_rpwm(padapter, pslv);
+				rtw_set_rpwm(padapter, pslv);
+			}
 		}
 	}
-
-	mutex_unlock(&pwrpriv->lock);
 }
 
 /*
@@ -509,11 +504,8 @@ void LeaveAllPowerSaveModeDirect(struct adapter *Adapter)
 		if (pwrpriv->pwr_mode == PS_MODE_ACTIVE)
 			return;
 
-		mutex_lock(&pwrpriv->lock);
-
-		rtw_set_rpwm(Adapter, PS_STATE_S4);
-
-		mutex_unlock(&pwrpriv->lock);
+		scoped_guard(mutex, &pwrpriv->lock)
+			rtw_set_rpwm(Adapter, PS_STATE_S4);
 
 		rtw_lps_ctrl_wk_cmd(pri_padapter, LPS_CTRL_LEAVE, 0);
 	} else {
@@ -567,14 +559,12 @@ void LPS_Leave_check(struct adapter *padapter)
 	cond_resched();
 
 	while (1) {
-		mutex_lock(&pwrpriv->lock);
-
-		if (padapter->bSurpriseRemoved ||
-		    !(padapter->hw_init_completed) ||
-		    (pwrpriv->pwr_mode == PS_MODE_ACTIVE))
-			bReady = true;
-
-		mutex_unlock(&pwrpriv->lock);
+		scoped_guard(mutex, &pwrpriv->lock) {
+			if (padapter->bSurpriseRemoved ||
+			    !(padapter->hw_init_completed) ||
+			    (pwrpriv->pwr_mode == PS_MODE_ACTIVE))
+				bReady = true;
+		}
 
 		if (bReady)
 			break;
@@ -599,25 +589,22 @@ void cpwm_int_hdl(struct adapter *padapter, struct reportpwrstate_parm *preportp
 
 	pwrpriv = adapter_to_pwrctl(padapter);
 
-	mutex_lock(&pwrpriv->lock);
-
-	if (pwrpriv->rpwm < PS_STATE_S2)
-		goto exit;
+	scoped_guard(mutex, &pwrpriv->lock) {
+		if (pwrpriv->rpwm < PS_STATE_S2)
+			return;
 
-	pwrpriv->cpwm = PS_STATE(preportpwrstate->state);
-	pwrpriv->cpwm_tog = preportpwrstate->state & PS_TOGGLE;
+		pwrpriv->cpwm = PS_STATE(preportpwrstate->state);
+		pwrpriv->cpwm_tog = preportpwrstate->state & PS_TOGGLE;
 
-	if (pwrpriv->cpwm >= PS_STATE_S2) {
-		if (pwrpriv->alives & CMD_ALIVE)
-			complete(&padapter->cmdpriv.cmd_queue_comp);
+		if (pwrpriv->cpwm >= PS_STATE_S2) {
+			if (pwrpriv->alives & CMD_ALIVE)
+				complete(&padapter->cmdpriv.cmd_queue_comp);
 
-		if (pwrpriv->alives & XMIT_ALIVE)
-			complete(&padapter->xmitpriv.xmit_comp);
+			if (pwrpriv->alives & XMIT_ALIVE)
+				complete(&padapter->xmitpriv.xmit_comp);
+		}
 	}
 
-exit:
-	mutex_unlock(&pwrpriv->lock);
-
 }
 
 static void cpwm_event_callback(struct work_struct *work)
@@ -642,11 +629,10 @@ static void rpwmtimeout_workitem_callback(struct work_struct *work)
 	dvobj = pwrctl_to_dvobj(pwrpriv);
 	padapter = dvobj->if1;
 
-	mutex_lock(&pwrpriv->lock);
-	if ((pwrpriv->rpwm == pwrpriv->cpwm) || (pwrpriv->cpwm >= PS_STATE_S2))
-		goto exit;
-
-	mutex_unlock(&pwrpriv->lock);
+	scoped_guard(mutex, &pwrpriv->lock) {
+		if ((pwrpriv->rpwm == pwrpriv->cpwm) || (pwrpriv->cpwm >= PS_STATE_S2))
+			return;
+	}
 
 	if (rtw_read8(padapter, 0x100) != 0xEA) {
 		struct reportpwrstate_parm report;
@@ -657,17 +643,14 @@ static void rpwmtimeout_workitem_callback(struct work_struct *work)
 		return;
 	}
 
-	mutex_lock(&pwrpriv->lock);
-
-	if ((pwrpriv->rpwm == pwrpriv->cpwm) || (pwrpriv->cpwm >= PS_STATE_S2))
-		goto exit;
-
-	pwrpriv->brpwmtimeout = true;
-	rtw_set_rpwm(padapter, pwrpriv->rpwm);
-	pwrpriv->brpwmtimeout = false;
+	scoped_guard(mutex, &pwrpriv->lock) {
+		if ((pwrpriv->rpwm == pwrpriv->cpwm) || (pwrpriv->cpwm >= PS_STATE_S2))
+			return;
 
-exit:
-	mutex_unlock(&pwrpriv->lock);
+		pwrpriv->brpwmtimeout = true;
+		rtw_set_rpwm(padapter, pwrpriv->rpwm);
+		pwrpriv->brpwmtimeout = false;
+	}
 }
 
 /*
@@ -719,21 +702,19 @@ s32 rtw_register_task_alive(struct adapter *padapter, u32 task)
 	pwrctrl = adapter_to_pwrctl(padapter);
 	pslv = PS_STATE_S2;
 
-	mutex_lock(&pwrctrl->lock);
-
-	register_task_alive(pwrctrl, task);
+	scoped_guard(mutex, &pwrctrl->lock) {
+		register_task_alive(pwrctrl, task);
 
-	if (pwrctrl->fw_current_in_ps_mode) {
-		if (pwrctrl->cpwm < pslv) {
-			if (pwrctrl->cpwm < PS_STATE_S2)
-				res = _FAIL;
-			if (pwrctrl->rpwm < pslv)
-				rtw_set_rpwm(padapter, pslv);
+		if (pwrctrl->fw_current_in_ps_mode) {
+			if (pwrctrl->cpwm < pslv) {
+				if (pwrctrl->cpwm < PS_STATE_S2)
+					res = _FAIL;
+				if (pwrctrl->rpwm < pslv)
+					rtw_set_rpwm(padapter, pslv);
+			}
 		}
 	}
 
-	mutex_unlock(&pwrctrl->lock);
-
 	if (res == _FAIL)
 		if (pwrctrl->cpwm >= PS_STATE_S2)
 			res = _SUCCESS;
@@ -767,18 +748,16 @@ void rtw_unregister_task_alive(struct adapter *padapter, u32 task)
 			pslv = PS_STATE_S2;
 	}
 
-	mutex_lock(&pwrctrl->lock);
-
-	unregister_task_alive(pwrctrl, task);
+	scoped_guard(mutex, &pwrctrl->lock) {
+		unregister_task_alive(pwrctrl, task);
 
-	if ((pwrctrl->pwr_mode != PS_MODE_ACTIVE) && pwrctrl->fw_current_in_ps_mode) {
-		if (pwrctrl->cpwm > pslv)
-			if ((pslv >= PS_STATE_S2) || (pwrctrl->alives == 0))
-				rtw_set_rpwm(padapter, pslv);
+		if ((pwrctrl->pwr_mode != PS_MODE_ACTIVE) && pwrctrl->fw_current_in_ps_mode) {
+			if (pwrctrl->cpwm > pslv)
+				if ((pslv >= PS_STATE_S2) || (pwrctrl->alives == 0))
+					rtw_set_rpwm(padapter, pslv);
 
+		}
 	}
-
-	mutex_unlock(&pwrctrl->lock);
 }
 
 /*
@@ -804,21 +783,19 @@ s32 rtw_register_tx_alive(struct adapter *padapter)
 	pwrctrl = adapter_to_pwrctl(padapter);
 	pslv = PS_STATE_S2;
 
-	mutex_lock(&pwrctrl->lock);
-
-	register_task_alive(pwrctrl, XMIT_ALIVE);
+	scope_guard(mutex, &pwrctrl->lock) {
+		register_task_alive(pwrctrl, XMIT_ALIVE);
 
-	if (pwrctrl->fw_current_in_ps_mode) {
-		if (pwrctrl->cpwm < pslv) {
-			if (pwrctrl->cpwm < PS_STATE_S2)
-				res = _FAIL;
-			if (pwrctrl->rpwm < pslv)
-				rtw_set_rpwm(padapter, pslv);
+		if (pwrctrl->fw_current_in_ps_mode) {
+			if (pwrctrl->cpwm < pslv) {
+				if (pwrctrl->cpwm < PS_STATE_S2)
+					res = _FAIL;
+				if (pwrctrl->rpwm < pslv)
+					rtw_set_rpwm(padapter, pslv);
+			}
 		}
 	}
 
-	mutex_unlock(&pwrctrl->lock);
-
 	if (res == _FAIL)
 		if (pwrctrl->cpwm >= PS_STATE_S2)
 			res = _SUCCESS;
@@ -849,21 +826,19 @@ s32 rtw_register_cmd_alive(struct adapter *padapter)
 	pwrctrl = adapter_to_pwrctl(padapter);
 	pslv = PS_STATE_S2;
 
-	mutex_lock(&pwrctrl->lock);
-
-	register_task_alive(pwrctrl, CMD_ALIVE);
+	scoped_guard(mutex, &pwrctrl->lock) {
+		register_task_alive(pwrctrl, CMD_ALIVE);
 
-	if (pwrctrl->fw_current_in_ps_mode) {
-		if (pwrctrl->cpwm < pslv) {
-			if (pwrctrl->cpwm < PS_STATE_S2)
-				res = _FAIL;
-			if (pwrctrl->rpwm < pslv)
-				rtw_set_rpwm(padapter, pslv);
+		if (pwrctrl->fw_current_in_ps_mode) {
+			if (pwrctrl->cpwm < pslv) {
+				if (pwrctrl->cpwm < PS_STATE_S2)
+					res = _FAIL;
+				if (pwrctrl->rpwm < pslv)
+					rtw_set_rpwm(padapter, pslv);
+			}
 		}
 	}
 
-	mutex_unlock(&pwrctrl->lock);
-
 	if (res == _FAIL)
 		if (pwrctrl->cpwm >= PS_STATE_S2)
 			res = _SUCCESS;
@@ -894,17 +869,15 @@ void rtw_unregister_tx_alive(struct adapter *padapter)
 			pslv = PS_STATE_S2;
 	}
 
-	mutex_lock(&pwrctrl->lock);
-
-	unregister_task_alive(pwrctrl, XMIT_ALIVE);
+	scoped_guard(mutex, &pwrctrl->lock) {
+		unregister_task_alive(pwrctrl, XMIT_ALIVE);
 
-	if ((pwrctrl->pwr_mode != PS_MODE_ACTIVE) && pwrctrl->fw_current_in_ps_mode) {
-		if (pwrctrl->cpwm > pslv)
-			if ((pslv >= PS_STATE_S2) || (pwrctrl->alives == 0))
-				rtw_set_rpwm(padapter, pslv);
+		if ((pwrctrl->pwr_mode != PS_MODE_ACTIVE) && pwrctrl->fw_current_in_ps_mode) {
+			if (pwrctrl->cpwm > pslv)
+				if ((pslv >= PS_STATE_S2) || (pwrctrl->alives == 0))
+					rtw_set_rpwm(padapter, pslv);
+		}
 	}
-
-	mutex_unlock(&pwrctrl->lock);
 }
 
 /*
@@ -930,18 +903,16 @@ void rtw_unregister_cmd_alive(struct adapter *padapter)
 			pslv = PS_STATE_S2;
 	}
 
-	mutex_lock(&pwrctrl->lock);
-
-	unregister_task_alive(pwrctrl, CMD_ALIVE);
+	scoped_guard(mutex, &pwrctrl->lock) {
+		unregister_task_alive(pwrctrl, CMD_ALIVE);
 
-	if ((pwrctrl->pwr_mode != PS_MODE_ACTIVE) && pwrctrl->fw_current_in_ps_mode) {
-		if (pwrctrl->cpwm > pslv) {
-			if ((pslv >= PS_STATE_S2) || (pwrctrl->alives == 0))
-				rtw_set_rpwm(padapter, pslv);
+		if ((pwrctrl->pwr_mode != PS_MODE_ACTIVE) && pwrctrl->fw_current_in_ps_mode) {
+			if (pwrctrl->cpwm > pslv) {
+				if ((pslv >= PS_STATE_S2) || (pwrctrl->alives == 0))
+					rtw_set_rpwm(padapter, pslv);
+			}
 		}
 	}
-
-	mutex_unlock(&pwrctrl->lock);
 }
 
 void rtw_init_pwrctrl_priv(struct adapter *padapter)
@@ -1131,9 +1102,9 @@ void rtw_ps_deny(struct adapter *padapter, enum ps_deny_reason reason)
 
 	pwrpriv = adapter_to_pwrctl(padapter);
 
-	mutex_lock(&pwrpriv->lock);
-	pwrpriv->ps_deny |= BIT(reason);
-	mutex_unlock(&pwrpriv->lock);
+	scope_guard(mutex, &pwrpriv->lock) {
+		pwrpriv->ps_deny |= BIT(reason);
+	}
 }
 
 /*
@@ -1146,9 +1117,9 @@ void rtw_ps_deny_cancel(struct adapter *padapter, enum ps_deny_reason reason)
 
 	pwrpriv = adapter_to_pwrctl(padapter);
 
-	mutex_lock(&pwrpriv->lock);
-	pwrpriv->ps_deny &= ~BIT(reason);
-	mutex_unlock(&pwrpriv->lock);
+	scoped_guard(mutex, &pwrpriv->lock) {
+		pwrpriv->ps_deny &= ~BIT(reason);
+	}
 }
 
 /*
-- 
2.43.0

