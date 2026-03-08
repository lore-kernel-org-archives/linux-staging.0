Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EDE347FE3
	for <linux-staging@lists.linux.dev>; Sun,  8 Mar 2026 19:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772998099; cv=none; b=fcvfoxhlFCEVXkd1BsTHGtEm1etSgNo265u2SOpWzNK94SnXnjtkzNW9FcRYirHtPzE8+Z1oT9kB3QCDyOA4N8PhREf0Enxn5flUAJRFO2em3BJkbwlxfit2sD0YANtBuZemunm8hCrXchlQWwmFAaw1IhBnGql7QJ4HgR7LwL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772998099; c=relaxed/simple;
	bh=I1YpBw4JPeTKIeGMFJJQlxbkLtklh6NOwXyix2YFeZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TQPQAGw/d+WvW3V+S8pxtoY/QktsXm19Nl0AecGEqAbOcgDhcKcfJQ7euICKzll/zYcPt5knyhAy8FGWyXHmmz+e/TVaH4oTF4kULkR0Xv+7fM4PiJjR3RNCiHNZccmZp5TjpczTURQn3wd5rVOZvuoymiuNvnGERLOaI226g64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fD3qABkm; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fD3qABkm"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso88669005e9.1
        for <linux-staging@lists.linux.dev>; Sun, 08 Mar 2026 12:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772998095; x=1773602895; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wBhaToH0PeYMXAy2q3p04XJ0u9+WkFkxbsLJesPCG4=;
        b=fD3qABkm8LHCGuF3t4vhkNTnSkwltlpBQT+eqKtqAdr1Ou5bYVh8F8ZYC8Wfm/HKlX
         qVsqKoB95osUwPSHyutnSy3rCE7UyUjOpUQru/j43djGSYywi/3G/v5XzNCwargoXBND
         0MnDwyVaCTlDbGmVE+j0A+7qlV6DFGCvhgIfujjGE06796/Fr6w6l/yVamGJ5mnN4g+K
         ALoGP+5twgVQYQuucumysYnEA9+suIp48n4E+Q+X/KXSMkm6ZQbHnPGK9J4sSH7ww6LE
         SS6E1eh9lfJP+3mHb7bo2FLnTu6+hPBtpoHKVJEVEl5UMoX50I2QDGNO+fKNXeQVccjk
         10HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772998095; x=1773602895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8wBhaToH0PeYMXAy2q3p04XJ0u9+WkFkxbsLJesPCG4=;
        b=gitmHb9I4HYsCpAQcxDetchUA7Y8nhMaYbiBV+3/u13q049Qj0u2tOGXArYIr6Y/gw
         jHhiDMjoH2rJlnFRNpD+1BvI6fnMKuR3ntyzULRlqsRgKgZeMEJ6qqcbuCiymfYI+DBT
         L27oHQbDMDKIeQfk3bpSrRmxjHs6iXYoV1eSxJSJIIfePeepOs8j2Wa6YN9VT6hcYe3d
         B614772nj+Axs7+IbXuWs4KU2EW/rXRmOsioH5ggwAQVrRE1J+0l1gvH7bSZOxFXCXZ8
         /smoXK39LkY7hIZo8Gd/hk9PVIsSxvGU+i79CCzsvBbVTMkN1GMYMsgxKnVmAEOC+okX
         GKoA==
X-Gm-Message-State: AOJu0YwSVLIDNRyLMqhOuQ1G2NqjjVJgArKrXzbHzYesMM9bmfyCWgX0
	FAifNfBvCzuO7DJcVOz6FdOxV7WafY0WfjJ8Xk+sLf6NJ1bnTc4to8kv4Ihc0A==
X-Gm-Gg: ATEYQzz/BSzLkOUM7goNaUVK1f1ZOXdUkDqkqgWJzs0Epu/vQtPWbG772iMVcB8cKqo
	6eOEnZvL+9xGc2Z9jg3KCIR4rTFq2VPYnCc5119ubKXBqqfAyeZ2OlJNYtfCRqDOZf0YR6z2tnW
	5JA70rrw1SBWEXMIt206VI2X5Eu7onVvLGqVVX18etKuwqg64CdLOtcGTeUf5e4OuhIUkWSlJRw
	lrNKdpTyaX/tOzZELlEI51CY5bzgASvKLHBAuWt/4ZYoXfa0INwfw6Wn2/BepzkC2mENjcdXQvg
	SLOW6e1lcFcKsrnvEDDC3sSOl0Ja84wyIL6e1VULG6rnxcBSio3E3KH/8xR4oTWVHJwLCxL6fRB
	KtbUaKkVMMlEHv1P+N3qiTQKPyIXZq3HQ8tluc4n+HnkWl7T+uFSImdduJ/Su0rQ+xaruKMekri
	lxIXyN/aIv8mKUGdTUP0zvIM+R74A9Tf1/Ky/fr/9n1A==
X-Received: by 2002:a05:600c:34d3:b0:483:bf23:1915 with SMTP id 5b1f17b1804b1-4852690f5afmr153744395e9.2.1772998094952;
        Sun, 08 Mar 2026 12:28:14 -0700 (PDT)
Received: from localhost.localdomain ([84.78.248.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852378e700sm119168485e9.0.2026.03.08.12.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 12:28:13 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] staging: rtl8723bs: rename hal_btcoex functions to snake_case
Date: Sun,  8 Mar 2026 20:27:17 +0100
Message-ID: <20260308192734.186757-3-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260308192734.186757-1-azpijr@gmail.com>
References: <20260308192734.186757-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename hal_btcoex functions from CamelCase to snake_case to improve
readability.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  2 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  2 +-
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 42 +++++++++----------
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    | 12 +++---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  4 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   |  2 +-
 .../staging/rtl8723bs/include/hal_btcoex.h    | 12 +++---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  2 +-
 9 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index cb13a39daa68..e1f062e58e91 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -58,7 +58,7 @@ void rtw_btcoex_LPS_Enter(struct adapter *padapter)
 	pwrpriv = adapter_to_pwrctl(padapter);
 
 	pwrpriv->bpower_saving = true;
-	lps_val = hal_btcoex_LpsVal(padapter);
+	lps_val = hal_btcoex_lps_val(padapter);
 	rtw_set_ps_mode(padapter, PS_MODE_MIN, 0, lps_val, "BTCOEX");
 }
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 10cec81de25d..2a6479ef4499 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1398,7 +1398,7 @@ static void rtw_lps_change_dtim_hdl(struct adapter *padapter, u8 dtim)
 	if (dtim <= 0 || dtim > 16)
 		return;
 
-	if (hal_btcoex_IsBtControlLps(padapter))
+	if (hal_btcoex_is_bt_control_lps(padapter))
 		return;
 
 	mutex_lock(&pwrpriv->lock);
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 0eac7e13a387..d8779db6a96d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1641,7 +1641,7 @@ void rtw_dynamic_check_timer_handler(struct adapter *adapter)
 		return;
 
 	if ((adapter_to_pwrctl(adapter)->fw_current_in_ps_mode)
-		&& !(hal_btcoex_IsBtControlLps(adapter))
+		&& !(hal_btcoex_is_bt_control_lps(adapter))
 		) {
 		bool should_enter_ps;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index ae931d2d15ed..88888de9e903 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -37,7 +37,7 @@ void ips_enter(struct adapter *padapter)
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
 
 
-	hal_btcoex_IpsNotify(padapter, pwrpriv->ips_mode_req);
+	hal_btcoex_ips_notify(padapter, pwrpriv->ips_mode_req);
 
 	mutex_lock(&pwrpriv->lock);
 	_ips_enter(padapter);
@@ -76,7 +76,7 @@ int ips_leave(struct adapter *padapter)
 	mutex_unlock(&pwrpriv->lock);
 
 	if (ret == _SUCCESS)
-		hal_btcoex_IpsNotify(padapter, IPS_NONE);
+		hal_btcoex_ips_notify(padapter, IPS_NONE);
 
 	return ret;
 }
@@ -196,7 +196,7 @@ void traffic_check_for_leave_lps(struct adapter *padapter, u8 tx, u32 tx_packets
 			if (xmit_cnt > 8) {
 				if (adapter_to_pwrctl(padapter)->leisure_ps
 				    && (adapter_to_pwrctl(padapter)->pwr_mode != PS_MODE_ACTIVE)
-				    && !(hal_btcoex_IsBtControlLps(padapter))) {
+				    && !(hal_btcoex_is_bt_control_lps(padapter))) {
 					leave_lps = true;
 				}
 			}
@@ -209,7 +209,7 @@ void traffic_check_for_leave_lps(struct adapter *padapter, u8 tx, u32 tx_packets
 		if (pmlmepriv->link_detect_info.num_rx_unicast_ok_in_period > 4) {
 			if (adapter_to_pwrctl(padapter)->leisure_ps
 			    && (adapter_to_pwrctl(padapter)->pwr_mode != PS_MODE_ACTIVE)
-			    && !(hal_btcoex_IsBtControlLps(padapter)))
+			    && !(hal_btcoex_is_bt_control_lps(padapter)))
 				leave_lps = true;
 		}
 	}
@@ -347,24 +347,24 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_a
 
 	/* if (pwrpriv->pwr_mode == PS_MODE_ACTIVE) */
 	if (ps_mode == PS_MODE_ACTIVE) {
-		if (!(hal_btcoex_IsBtControlLps(padapter))
-				|| (hal_btcoex_IsBtControlLps(padapter)
-					&& !(hal_btcoex_IsLpsOn(padapter)))) {
+		if (!(hal_btcoex_is_bt_control_lps(padapter))
+				|| (hal_btcoex_is_bt_control_lps(padapter)
+					&& !(hal_btcoex_is_lps_on(padapter)))) {
 			pwrpriv->pwr_mode = ps_mode;
 			rtw_set_rpwm(padapter, PS_STATE_S4);
 
 			rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_PWRMODE, (u8 *)(&ps_mode));
 			pwrpriv->fw_current_in_ps_mode = false;
 
-			hal_btcoex_LpsNotify(padapter, ps_mode);
+			hal_btcoex_lps_notify(padapter, ps_mode);
 		}
 	} else {
 		if ((PS_RDY_CHECK(padapter) && check_fwstate(&padapter->mlmepriv, WIFI_ASOC_STATE)) ||
-		    ((hal_btcoex_IsBtControlLps(padapter)) && (hal_btcoex_IsLpsOn(padapter)))
+		    ((hal_btcoex_is_bt_control_lps(padapter)) && (hal_btcoex_is_lps_on(padapter)))
 			) {
 			u8 pslv;
 
-			hal_btcoex_LpsNotify(padapter, ps_mode);
+			hal_btcoex_lps_notify(padapter, ps_mode);
 
 			pwrpriv->fw_current_in_ps_mode = true;
 			pwrpriv->pwr_mode = ps_mode;
@@ -376,11 +376,11 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_a
 			if (pwrpriv->alives == 0)
 				pslv = PS_STATE_S0;
 
-			if (!(hal_btcoex_IsBtDisabled(padapter)) &&
-			    (hal_btcoex_IsBtControlLps(padapter))) {
+			if (!(hal_btcoex_is_bt_disabled(padapter)) &&
+			    (hal_btcoex_is_bt_control_lps(padapter))) {
 				u8 val8;
 
-				val8 = hal_btcoex_LpsVal(padapter);
+				val8 = hal_btcoex_lps_val(padapter);
 				if (val8 & BIT(4))
 					pslv = PS_STATE_S2;
 			}
@@ -434,7 +434,7 @@ void LPS_Enter(struct adapter *padapter, const char *msg)
 	int n_assoc_iface = 0;
 	char buf[32] = {0};
 
-	if (hal_btcoex_IsBtControlLps(padapter))
+	if (hal_btcoex_is_bt_control_lps(padapter))
 		return;
 
 	/* Skip lps enter request if number of associated adapters is not 1 */
@@ -468,7 +468,7 @@ void LPS_Leave(struct adapter *padapter, const char *msg)
 	struct pwrctrl_priv *pwrpriv = dvobj_to_pwrctl(dvobj);
 	char buf[32] = {0};
 
-	if (hal_btcoex_IsBtControlLps(padapter))
+	if (hal_btcoex_is_bt_control_lps(padapter))
 		return;
 
 	if (pwrpriv->leisure_ps) {
@@ -749,10 +749,10 @@ void rtw_unregister_task_alive(struct adapter *padapter, u32 task)
 	pwrctrl = adapter_to_pwrctl(padapter);
 	pslv = PS_STATE_S0;
 
-	if (!(hal_btcoex_IsBtDisabled(padapter)) && hal_btcoex_IsBtControlLps(padapter)) {
+	if (!(hal_btcoex_is_bt_disabled(padapter)) && hal_btcoex_is_bt_control_lps(padapter)) {
 		u8 val8;
 
-		val8 = hal_btcoex_LpsVal(padapter);
+		val8 = hal_btcoex_lps_val(padapter);
 		if (val8 & BIT(4))
 			pslv = PS_STATE_S2;
 	}
@@ -876,10 +876,10 @@ void rtw_unregister_tx_alive(struct adapter *padapter)
 	pwrctrl = adapter_to_pwrctl(padapter);
 	pslv = PS_STATE_S0;
 
-	if (!(hal_btcoex_IsBtDisabled(padapter)) && hal_btcoex_IsBtControlLps(padapter)) {
+	if (!(hal_btcoex_is_bt_disabled(padapter)) && hal_btcoex_is_bt_control_lps(padapter)) {
 		u8 val8;
 
-		val8 = hal_btcoex_LpsVal(padapter);
+		val8 = hal_btcoex_lps_val(padapter);
 		if (val8 & BIT(4))
 			pslv = PS_STATE_S2;
 	}
@@ -912,10 +912,10 @@ void rtw_unregister_cmd_alive(struct adapter *padapter)
 	pwrctrl = adapter_to_pwrctl(padapter);
 	pslv = PS_STATE_S0;
 
-	if (!(hal_btcoex_IsBtDisabled(padapter)) && hal_btcoex_IsBtControlLps(padapter)) {
+	if (!(hal_btcoex_is_bt_disabled(padapter)) && hal_btcoex_is_bt_control_lps(padapter)) {
 		u8 val8;
 
-		val8 = hal_btcoex_LpsVal(padapter);
+		val8 = hal_btcoex_lps_val(padapter);
 		if (val8 & BIT(4))
 			pslv = PS_STATE_S2;
 	}
diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 9c84f4cf1dda..ba400035b8b2 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -1165,7 +1165,7 @@ bool hal_btcoex_IsBtExist(struct adapter *padapter)
 	return pHalData->bt_coexist.bBtExist;
 }
 
-bool hal_btcoex_IsBtDisabled(struct adapter *padapter)
+bool hal_btcoex_is_bt_disabled(struct adapter *padapter)
 {
 	if (!hal_btcoex_IsBtExist(padapter))
 		return true;
@@ -1206,12 +1206,12 @@ void hal_btcoex_InitHwConfig(struct adapter *padapter, u8 bWifiOnly)
 	EXhalbtcoutsrc_InitCoexDm(&GLBtCoexist);
 }
 
-void hal_btcoex_IpsNotify(struct adapter *padapter, u8 type)
+void hal_btcoex_ips_notify(struct adapter *padapter, u8 type)
 {
 	EXhalbtcoutsrc_IpsNotify(&GLBtCoexist, type);
 }
 
-void hal_btcoex_LpsNotify(struct adapter *padapter, u8 type)
+void hal_btcoex_lps_notify(struct adapter *padapter, u8 type)
 {
 	EXhalbtcoutsrc_LpsNotify(&GLBtCoexist, type);
 }
@@ -1274,7 +1274,7 @@ s32 hal_btcoex_IsBTCoexCtrlAMPDUSize(struct adapter *padapter)
 	return (s32)GLBtCoexist.btInfo.bBtCtrlAggBufSize;
 }
 
-bool hal_btcoex_IsBtControlLps(struct adapter *padapter)
+bool hal_btcoex_is_bt_control_lps(struct adapter *padapter)
 {
 	if (!hal_btcoex_IsBtExist(padapter))
 		return false;
@@ -1288,7 +1288,7 @@ bool hal_btcoex_IsBtControlLps(struct adapter *padapter)
 	return false;
 }
 
-bool hal_btcoex_IsLpsOn(struct adapter *padapter)
+bool hal_btcoex_is_lps_on(struct adapter *padapter)
 {
 	if (!hal_btcoex_IsBtExist(padapter))
 		return false;
@@ -1307,7 +1307,7 @@ u8 hal_btcoex_RpwmVal(struct adapter *padapter)
 	return GLBtCoexist.btInfo.rpwmVal;
 }
 
-u8 hal_btcoex_LpsVal(struct adapter *padapter)
+u8 hal_btcoex_lps_val(struct adapter *padapter)
 {
 	return GLBtCoexist.btInfo.lpsVal;
 }
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 705b706f30af..04509bb49950 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -363,9 +363,9 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 	}
 
 	if (psmode > 0) {
-		if (hal_btcoex_IsBtControlLps(padapter) == true) {
+		if (hal_btcoex_is_bt_control_lps(padapter) == true) {
 			PowerState = hal_btcoex_RpwmVal(padapter);
-			byte5 = hal_btcoex_LpsVal(padapter);
+			byte5 = hal_btcoex_lps_val(padapter);
 
 			if ((rlbm == 2) && (byte5 & BIT(4))) {
 				/*  Keep awake interval to 1 to prevent from */
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
index 928226679ab4..b9d785ecd19a 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
@@ -161,7 +161,7 @@ void rtl8723b_HalDmWatchDog(struct adapter *Adapter)
 
 		/* ODM_CmnInfoUpdate(&pHalData->odmpriv , ODM_CMNINFO_RSSI_MIN, pdmpriv->MinUndecoratedPWDBForDM); */
 
-		bBtDisabled = hal_btcoex_IsBtDisabled(Adapter);
+		bBtDisabled = hal_btcoex_is_bt_disabled(Adapter);
 
 		ODM_CmnInfoUpdate(&pHalData->odmpriv, ODM_CMNINFO_BT_ENABLED,
 				  !bBtDisabled);
diff --git a/drivers/staging/rtl8723bs/include/hal_btcoex.h b/drivers/staging/rtl8723bs/include/hal_btcoex.h
index 525cce3574fe..f5c1b13ea1e7 100644
--- a/drivers/staging/rtl8723bs/include/hal_btcoex.h
+++ b/drivers/staging/rtl8723bs/include/hal_btcoex.h
@@ -22,7 +22,7 @@ struct bt_coexist {
 
 void hal_btcoex_SetBTCoexist(struct adapter *padapter, u8 bBtExist);
 bool hal_btcoex_IsBtExist(struct adapter *padapter);
-bool hal_btcoex_IsBtDisabled(struct adapter *);
+bool hal_btcoex_is_bt_disabled(struct adapter *);
 void hal_btcoex_SetPgAntNum(struct adapter *padapter, u8 antNum);
 void hal_btcoex_SetSingleAntPath(struct adapter *padapter, u8 singleAntPath);
 
@@ -30,8 +30,8 @@ void hal_btcoex_Initialize(void *padapter);
 void hal_btcoex_PowerOnSetting(struct adapter *padapter);
 void hal_btcoex_InitHwConfig(struct adapter *padapter, u8 bWifiOnly);
 
-void hal_btcoex_IpsNotify(struct adapter *padapter, u8 type);
-void hal_btcoex_LpsNotify(struct adapter *padapter, u8 type);
+void hal_btcoex_ips_notify(struct adapter *padapter, u8 type);
+void hal_btcoex_lps_notify(struct adapter *padapter, u8 type);
 void hal_btcoex_ScanNotify(struct adapter *padapter, u8 type);
 void hal_btcoex_ConnectNotify(struct adapter *padapter, u8 action);
 void hal_btcoex_MediaStatusNotify(struct adapter *padapter, u8 mediaStatus);
@@ -44,10 +44,10 @@ void hal_btcoex_HaltNotify(struct adapter *padapter);
 void hal_btcoex_Handler(struct adapter *padapter);
 
 s32 hal_btcoex_IsBTCoexCtrlAMPDUSize(struct adapter *padapter);
-bool hal_btcoex_IsBtControlLps(struct adapter *padapter);
-bool hal_btcoex_IsLpsOn(struct adapter *padapter);
+bool hal_btcoex_is_bt_control_lps(struct adapter *padapter);
+bool hal_btcoex_is_lps_on(struct adapter *padapter);
 u8 hal_btcoex_RpwmVal(struct adapter *);
-u8 hal_btcoex_LpsVal(struct adapter *);
+u8 hal_btcoex_lps_val(struct adapter *);
 u32 hal_btcoex_GetRaMask(struct adapter *);
 void hal_btcoex_RecordPwrMode(struct adapter *padapter, u8 *pCmdBuf, u8 cmdLen);
 
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index c6d22d097af0..3b5ef0c7a403 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -1006,7 +1006,7 @@ void rtw_dev_unload(struct adapter *padapter)
 		}
 
 		if (!padapter->surprise_removed) {
-			hal_btcoex_IpsNotify(padapter, pwrctl->ips_mode_req);
+			hal_btcoex_ips_notify(padapter, pwrctl->ips_mode_req);
 
 			/* amy modify 20120221 for power seq is different between driver open and ips */
 			rtw_hal_deinit(padapter);
-- 
2.53.0

