Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B036E3E51F5
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 17:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772559555; cv=none; b=NeL4KBj4rFnwR8nh+R4WgCfFRQG4Xd/OqMwwh1UdYrDtT9P6Ws6+Eb85Fn3TjbMO5ZAfRiglA+/8SR3RUzgG97TQ6wIzM8kOA6lYCl0L69o6TkxBi/e/kxAGBh6SL8HOo67yVO83IM9Sc5lHPwvjGMvkOLx/h+tH0ZTJIdi7qAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772559555; c=relaxed/simple;
	bh=kjYdI/Tih3gzodZdZZ795yiz9fBb71XJCE39STHMAgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q2RbejhgsBGC1p18EG557j6TBX7NggyLxZwQv0crz9TyCPZTjmKKC9dRsZnB3EuH5hKPNT7v+7LP42S1YeR7y5p44WlJDcp1SxWyiTSdfur7uJXgHK0FXyZJ4muVUomTy9o4/Dr/CyaasBRruNRkPtE0IAidf7r7bPsEvfz/o0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIjd+Iwa; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIjd+Iwa"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b7a87fb5so1518072f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 09:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772559552; x=1773164352; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRJ4gt03MYu7civ54bonvVZjQTrmG6JEV8a1/KL/2EI=;
        b=jIjd+IwagQ0FwX0SHwUOsDmvd3IVl8DGZB35iWBTBy6HssS+53QSH87ebH9w9y5vG2
         gz7lz312aMFHxUmN75s8Rjj2lrsFqpAQzBmllh73Af03IbWC+m0OrmZu6vJT7nJKnxve
         v1XbIFTNGdr5YYJcoSlWVxZFndhjV3VMGM+SGtI1PMhDoWgNlVQOzrdztJvgdHj9vXBW
         tbjJfGptwhbwQFChZTmZEdTRfEuvGCIl/dIGGpy8X4oaYYg++tpYSa+JOnpvoyYwZP88
         lUYYudRkIOy4GuWiFL3qxPUQWaLOdZFR7Fey9JycrYwsmCx9PxcDjR5lp4WXzr6f/yQe
         vLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772559552; x=1773164352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BRJ4gt03MYu7civ54bonvVZjQTrmG6JEV8a1/KL/2EI=;
        b=AwjOD6EDGQduX92wuaO6KmOLDY9sd9lYQ9T4k/0WoY9tF1lbbGQsqMlldrxL9YrzMt
         JV9PWCYS4rH1Xp83jQEhaYPHMbsx4fqqA4oGiDlP5OJNLjTsL3boc+j6uJ8oXbfGrHbs
         f+CTtR041jx8gf4utNw0VJXWuoG3fBa+TVPBkHJebhfKgrY6WFEsNN4ExtPNiBYr0LqF
         xeR8kTg+NjiurmvHT3HpB4YW0u7lIMUJAm+9twUreN9xOFG3k5PrmczCjoQCwyyN1tyg
         Yp/FRFLzjhQkVTRP9UfRLhffajJ4zzpGOs7nQF/L+J/3KgQlSjBgCDjgGpyPWhqJhu0b
         2eqQ==
X-Gm-Message-State: AOJu0YyhA3B9h8ZitZG/Kw99pgMZ9N7rTbuYbw2uSpeLbo9QDLrEczX3
	jXnbZzgryEVg6AEwR48YUCQWSkG5iUyxWvwKDEqguYnApc0x8kKvyQs4oVozjUOYUfYG3dwx
X-Gm-Gg: ATEYQzyRRRIKmAhtMeUYWvw5GyNMsMyNjHMEF9a0kijnx8rdc0EbQL0PDJ9Wk4SrOlz
	hdyoxNmDPtGrntUUX95tBWsJgzg78HjhKmXv02P8ks5FECtY51JOdpqsYejcEtvk+4jbc8XiRuy
	DIf3VT8DP7yjMRvf+FQOKPRdHpWeos8dMDjQipnSpmkqPb1wAWDKtFbW+fEib/A14DhmjTQVZIN
	HUyihWxTAU+sohh6VbkC6UfKLz8WF3uv0OLEaPUgGv0e0dRRoYXuX9qoXKasdJfvyFp7FeJ0P7q
	2YIEkV/wsUSrjiaWPY1W7zgS75rZO0SWKRed3Klij0Gkopm5vSPUl5NFt9F5i6a9nVIaxPMBEk/
	fgg+k1HUnibyL/1R6lGXfbozH/Sz2VKXdRGYSQo1hp+yqjzDMGl1mLWHrAXJ594v8LjCWZBeXW+
	hjftvhw7+6xh9LkMXD1CmyvwQSPpG/x+zC0305OnY=
X-Received: by 2002:a05:6000:1886:b0:439:b3ff:9ab9 with SMTP id ffacd0b85a97d-439b3ff9b6dmr16656934f8f.48.1772559551807;
        Tue, 03 Mar 2026 09:39:11 -0800 (PST)
Received: from localhost.localdomain ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b4d06c27sm16701884f8f.17.2026.03.03.09.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 09:39:11 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	=?UTF-8?q?Rog=C3=A9rio=20Fernandes=20Pereira?= <rfp2005@gmail.com>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] staging: rtl8723bs: remove redundant blank lines
Date: Tue,  3 Mar 2026 18:38:27 +0100
Message-ID: <20260303173844.47975-2-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303173844.47975-1-azpijr@gmail.com>
References: <20260303173844.47975-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove multiple blank lines and unnecessary blank lines before closing
braces.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 666e241704d9..7d2af0f1be52 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -29,14 +29,12 @@ void _ips_enter(struct adapter *padapter)
 		pwrpriv->rf_pwrstate = rf_off;
 	}
 	pwrpriv->bips_processing = false;
-
 }

 void ips_enter(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);

-
 	hal_btcoex_IpsNotify(padapter, pwrpriv->ips_mode_req);

 	mutex_lock(&pwrpriv->lock);
@@ -131,7 +129,6 @@ static bool rtw_pwr_unassociated_idle(struct adapter *adapter)
 	return ret;
 }

-
 /*
  * ATTENTION:
  *rtw_ps_processor() doesn't handle LPS.
@@ -184,8 +181,6 @@ void traffic_check_for_leave_lps(struct adapter *padapter, u8 tx, u32 tx_packets
 	u8 bLeaveLPS = false;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;

-
-
 	if (tx) { /* from tx */
 		xmit_cnt += tx_packets;

@@ -240,12 +235,10 @@ void rtw_set_rpwm(struct adapter *padapter, u8 pslv)
 		if (pwrpriv->rpwm == pslv ||
 		    (pwrpriv->rpwm >= PS_STATE_S2 && pslv >= PS_STATE_S2))
 			return;
-
 	}

 	if ((padapter->bSurpriseRemoved) || !(padapter->hw_init_completed)) {
 		pwrpriv->cpwm = PS_STATE_S4;
-
 		return;
 	}

@@ -342,7 +335,6 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_a
 		if (ps_mode == PS_MODE_ACTIVE)
 			return;

-
 	mutex_lock(&pwrpriv->lock);

 	/* if (pwrpriv->pwr_mode == PS_MODE_ACTIVE) */
@@ -404,7 +396,6 @@ s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 	u8 bAwake = false;
 	s32 err = 0;

-
 	start_time = jiffies;
 	while (1) {
 		rtw_hal_get_hwreg(padapter, HW_VAR_FWLPS_RF_ON, &bAwake);
@@ -606,7 +597,6 @@ void cpwm_int_hdl(struct adapter *padapter, struct reportpwrstate_parm *preportp

 exit:
 	mutex_unlock(&pwrpriv->lock);
-
 }

 static void cpwm_event_callback(struct work_struct *work)
@@ -626,7 +616,6 @@ static void rpwmtimeout_workitem_callback(struct work_struct *work)
 	struct dvobj_priv *dvobj;
 	struct pwrctrl_priv *pwrpriv;

-
 	pwrpriv = container_of(work, struct pwrctrl_priv, rpwmtimeoutwi);
 	dvobj = pwrctl_to_dvobj(pwrpriv);
 	padapter = dvobj->if1;
@@ -683,7 +672,6 @@ static inline void unregister_task_alive(struct pwrctrl_priv *pwrctrl, u32 tag)
 	pwrctrl->alives &= ~tag;
 }

-
 /*
  * Description:
  *Check if the fw_pwrstate is okay for I/O.
@@ -1020,7 +1008,6 @@ int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_deffer_ms, const char *cal
 	if (time_before(pwrpriv->ips_deny_time, deny_time))
 		pwrpriv->ips_deny_time = deny_time;

-
 	if (pwrpriv->ps_processing)
 		while (pwrpriv->ps_processing && jiffies_to_msecs(jiffies - start) <= 3000)
 			mdelay(10);
@@ -1068,7 +1055,6 @@ int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_deffer_ms, const char *cal
 	if (time_before(pwrpriv->ips_deny_time, deny_time))
 		pwrpriv->ips_deny_time = deny_time;
 	return ret;
-
 }

 int rtw_pm_set_lps(struct adapter *padapter, u8 mode)
--
2.53.0

