Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87B536C5B4
	for <linux-staging@lists.linux.dev>; Sun,  8 Mar 2026 19:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772998102; cv=none; b=ZRj2d+oJ8JAUPXH4zwRkQiFWselGPe0rsg+NmTCbPED4PAunZtvg3vYdiFOteFlqcQZa51NQn6CZ/4wrFNYcm/PKmA8kjrIFMyntfkyQ8xUQxonHKow5DMZ5E3ewQHcdIe97KgeTpP2Za50Dcg8WLdh3ayItnZVqHAqWZcfByig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772998102; c=relaxed/simple;
	bh=tjasAzrdcsiRwqk6tEzHvkIiMQyiH8Y7O1b74WZ/6ZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bekYh7WghryU6Yyp+kH00jghGA63q2u8qKFjA/hgb3Zh9J1R4b5HVlQMzR1sBHT+2bftEgy0ggcZ70QXXSjyXpce+TCFNk18jQqmepjBzypUTMSSBPcVjpXPaCZUIzrIjh0KmpzaWV0T6WTgYPTJGHqpGRcgQceDVTNUGyhMjJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPxLobPS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPxLobPS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso100343615e9.3
        for <linux-staging@lists.linux.dev>; Sun, 08 Mar 2026 12:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772998099; x=1773602899; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AA82bhttQEtU2PqOpBtgd1xZg/0YMTH37cevn5zbIA=;
        b=bPxLobPS+XqSdJUFnVuoaZkdW3+9UaJaWkfHC2Bm3teGFck8OZKIyP9tGD/szljBfn
         FClAo0WpFl0xJzFMuMLJFPbPZMGj11VXYk2QMe/VfG6F97f3Qmq350P7zd59fax9xqiY
         Ync9oifmrfxi1wWDHHlr5MZSev9pt2JmGuMYIjQ7WKs8wkR1jjtwibvyGZAviBIKkZ0z
         muR1XghlIgxrybUS+cyZzwTrcJ27VwZcaqw70XSDZEhZaYMNSwZ+TFmYH18Rcoo5tEiQ
         Pmf419BYXWi31QWk9lUcaGkNeJyKQ0Q3Sf9oLjiMsKj2VMd/rmcdyAudp1H/IRRYKkuw
         7Nng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772998099; x=1773602899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5AA82bhttQEtU2PqOpBtgd1xZg/0YMTH37cevn5zbIA=;
        b=KrHuKQoUxhqXErgLEWW9f43e1mQikPpO6jpDCxe5ffftq50NCIvdWTpwkvC2kZSr96
         4bM+2PO437xTn7XRxlZ48Wx0bx8T9Jpeb0pIdW8OjGBaszWSC1sFgCqz2Z0M+kIRnRKK
         N5ScOZzBKdOIYIuYYv/lDwgb57QO/hLpCAXoo6cJz9ZzJLxH5IWlTwoEN+81IsbHwkbH
         FQz24QHmXUndKqSNumvHXSy4UELm2ZoLrxyXFqsNflta0ryrhst/2ElYNyr8Hqx665U9
         NTnT6/vhcIWHtQ4JDVY5uKjNBMOm3i3+nezy0h1y2gC7eXOW79osdaCyDB3O7JWGM8K0
         UNFg==
X-Gm-Message-State: AOJu0YxeuhEj2btFZtavjnkBlj+aEeWW/sBJQ7h63LONxfdR/RyBRe69
	e2wJUZDOQqvpXwrUdyrRiaLYhneQQlLnFugG0scApcOClrRRmxHRIlu4iIgQoA==
X-Gm-Gg: ATEYQzwkBEcXnAFBFoxGRlh1vPOJlmHnU+zqmx+vTpu9n1YCt/jhp6QZWbZLRarY8xD
	mkikaZDBX5LjQc9DN+B0SB+owRP/DXu86b+2owi6evbfSmxPPdLqGkz2Gj7zJeIrP/tkdpaPKJX
	SB9E5upczI4aEAXxuBY2JJWaSvkfHr3jQP7uO5YTrb9PBHgYJkyByXM6bg2bQmq8vOhU6LdwyS8
	TyU19GGUQlPPcarsZKyZML+Bxy8Rq+E+yb7yru0LL63TyK4gSpAYCfSkfUDIWC9megn6FhK+DYs
	rmzO+4oqNPkbbUwLlPeovQf0/3G5d+4BHbDrrfanojLTZXSM2rQp+JeMeOwwuRT0lS/hsWIz/hN
	2ONTYRBzPfu5zrZMeHsfnS02ClkeHayqqp8rYzrs3DsHOaXTtiudlCunhuKNxUwduGKT5VxQOTN
	S5P6k3pFbL7ag+CHhI6Ol9BbQAbAe8KOiqfHCNS4xxjA==
X-Received: by 2002:a05:600c:5250:b0:485:3025:162 with SMTP id 5b1f17b1804b1-48530250228mr85702575e9.35.1772998098773;
        Sun, 08 Mar 2026 12:28:18 -0700 (PDT)
Received: from localhost.localdomain ([84.78.248.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852378e700sm119168485e9.0.2026.03.08.12.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 12:28:18 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] staging: rtl8723bs: fix CamelCase in power management logic
Date: Sun,  8 Mar 2026 20:27:18 +0100
Message-ID: <20260308192734.186757-4-azpijr@gmail.com>
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

Clean up CamelCase variables and functions specifically related to
LPS and general power management.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c       |  4 ++--
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c   | 18 +++++++++---------
 .../staging/rtl8723bs/include/rtw_pwrctrl.h    |  8 ++++----
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c  |  4 ++--
 drivers/staging/rtl8723bs/os_dep/os_intfs.c    |  6 +++---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c   |  2 +-
 6 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 2a6479ef4499..7b9baa9cab6c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1288,7 +1288,7 @@ void lps_ctrl_wk_hdl(struct adapter *padapter, u8 lps_ctrl_type)
 	case LPS_CTRL_CONNECT:
 		mstatus = 1;/* connect */
 		/*  Reset LPS Setting */
-		pwrpriv->LpsIdleCount = 0;
+		pwrpriv->lps_idle_count = 0;
 		rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_JOINBSSRPT, (u8 *)(&mstatus));
 		rtw_btcoex_MediaStatusNotify(padapter, mstatus);
 		break;
@@ -1299,7 +1299,7 @@ void lps_ctrl_wk_hdl(struct adapter *padapter, u8 lps_ctrl_type)
 		rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_JOINBSSRPT, (u8 *)(&mstatus));
 		break;
 	case LPS_CTRL_SPECIAL_PACKET:
-		pwrpriv->DelayLPSLastTimeStamp = jiffies;
+		pwrpriv->delay_lps_last_timestamp = jiffies;
 		hal_btcoex_SpecialPacketNotify(padapter, PACKET_DHCP);
 		LPS_Leave(padapter, "LPS_CTRL_SPECIAL_PACKET");
 		break;
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 88888de9e903..e998f695cc52 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -308,7 +308,7 @@ static u8 PS_RDY_CHECK(struct adapter *padapter)

 	curr_time = jiffies;

-	delta_time = curr_time - pwrpriv->DelayLPSLastTimeStamp;
+	delta_time = curr_time - pwrpriv->delay_lps_last_timestamp;

 	if (delta_time < LPS_DELAY_TIME)
 		return false;
@@ -448,14 +448,14 @@ void LPS_Enter(struct adapter *padapter, const char *msg)

 	if (pwrpriv->leisure_ps) {
 		/*  Idle for a while if we connect to AP a while ago. */
-		if (pwrpriv->LpsIdleCount >= 2) { /*   4 Sec */
+		if (pwrpriv->lps_idle_count >= 2) { /*   4 Sec */
 			if (pwrpriv->pwr_mode == PS_MODE_ACTIVE) {
 				scnprintf(buf, sizeof(buf), "WIFI-%s", msg);
 				pwrpriv->bpower_saving = true;
 				rtw_set_ps_mode(padapter, pwrpriv->power_mgnt, padapter->registrypriv.smart_ps, 0, buf);
 			}
 		} else
-			pwrpriv->LpsIdleCount++;
+			pwrpriv->lps_idle_count++;
 	}
 }

@@ -484,7 +484,7 @@ void LPS_Leave(struct adapter *padapter, const char *msg)
 	pwrpriv->bpower_saving = false;
 }

-void LeaveAllPowerSaveModeDirect(struct adapter *Adapter)
+void leave_all_power_save_mode_direct(struct adapter *Adapter)
 {
 	struct adapter *pri_padapter = GET_PRIMARY_ADAPTER(Adapter);
 	struct mlme_priv *pmlmepriv = &(Adapter->mlmepriv);
@@ -515,7 +515,7 @@ void LeaveAllPowerSaveModeDirect(struct adapter *Adapter)
 /*  Description: Leave all power save mode: LPS, FwLPS, IPS if needed. */
 /*  Move code to function by tynli. 2010.03.26. */
 /*  */
-void LeaveAllPowerSaveMode(struct adapter *Adapter)
+void leave_all_power_save_mode(struct adapter *Adapter)
 {
 	struct dvobj_priv *dvobj = adapter_to_dvobj(Adapter);
 	u8 enqueue = 0;
@@ -953,7 +953,7 @@ void rtw_init_pwrctrl_priv(struct adapter *padapter)
 	pwrctrlpriv->in_suspend = false;
 	pwrctrlpriv->bkeepfwalive = false;

-	pwrctrlpriv->LpsIdleCount = 0;
+	pwrctrlpriv->lps_idle_count = 0;
 	pwrctrlpriv->power_mgnt = padapter->registrypriv.power_mgnt;/*  PS_MODE_MIN; */
 	pwrctrlpriv->leisure_ps = pwrctrlpriv->power_mgnt != PS_MODE_ACTIVE;

@@ -1011,7 +1011,7 @@ int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_deffer_ms, const char *cal
 	unsigned long deny_time = jiffies + msecs_to_jiffies(ips_deffer_ms);

 	/* for LPS */
-	LeaveAllPowerSaveMode(padapter);
+	leave_all_power_save_mode(padapter);

 	/* IPS still bound with primary adapter */
 	padapter = GET_PRIMARY_ADAPTER(padapter);
@@ -1079,9 +1079,9 @@ int rtw_pm_set_lps(struct adapter *padapter, u8 mode)
 	if (mode < PS_MODE_NUM) {
 		if (pwrctrlpriv->power_mgnt != mode) {
 			if (mode == PS_MODE_ACTIVE)
-				LeaveAllPowerSaveMode(padapter);
+				leave_all_power_save_mode(padapter);
 			else
-				pwrctrlpriv->LpsIdleCount = 2;
+				pwrctrlpriv->lps_idle_count = 2;

 			pwrctrlpriv->power_mgnt = mode;
 			pwrctrlpriv->leisure_ps =
diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index 2872501ac85f..6c0b007408c2 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -165,11 +165,11 @@ struct pwrctrl_priv {

 	u8 fw_psmode_iface_id;
 	u8 leisure_ps;
-	u8 LpsIdleCount;
+	u8 lps_idle_count;
 	u8 power_mgnt;
 	u8 org_power_mgnt;
 	bool fw_current_in_ps_mode;
-	unsigned long	DelayLPSLastTimeStamp;
+	unsigned long	delay_lps_last_timestamp;
 	s32		pnp_current_pwr_state;
 	u8 pnp_bstop_trx;

@@ -224,8 +224,8 @@ extern void rtw_unregister_cmd_alive(struct adapter *padapter);
 extern void cpwm_int_hdl(struct adapter *padapter, struct reportpwrstate_parm *preportpwrstate);
 extern void LPS_Leave_check(struct adapter *padapter);

-extern void LeaveAllPowerSaveMode(struct adapter *Adapter);
-extern void LeaveAllPowerSaveModeDirect(struct adapter *Adapter);
+extern void leave_all_power_save_mode(struct adapter *Adapter);
+extern void leave_all_power_save_mode_direct(struct adapter *Adapter);
 void _ips_enter(struct adapter *padapter);
 void ips_enter(struct adapter *padapter);
 int _ips_leave(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index a558592068e0..2d60dc669bd3 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1606,7 +1606,7 @@ static int cfg80211_rtw_leave_ibss(struct wiphy *wiphy, struct net_device *ndev)

 	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED)) {
 		rtw_scan_abort(padapter);
-		LeaveAllPowerSaveMode(padapter);
+		leave_all_power_save_mode(padapter);

 		rtw_wdev->iftype = NL80211_IFTYPE_STATION;

@@ -1783,7 +1783,7 @@ static int cfg80211_rtw_disconnect(struct wiphy *wiphy, struct net_device *ndev,
 	rtw_set_to_roam(padapter, 0);

 	rtw_scan_abort(padapter);
-	LeaveAllPowerSaveMode(padapter);
+	leave_all_power_save_mode(padapter);
 	rtw_disassoc_cmd(padapter, 500, false);

 	rtw_indicate_disconnect(padapter);
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 3b5ef0c7a403..07a94828a75a 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -948,7 +948,7 @@ static int netdev_close(struct net_device *pnetdev)
 		}

 		/* s2. */
-		LeaveAllPowerSaveMode(padapter);
+		leave_all_power_save_mode(padapter);
 		rtw_disassoc_cmd(padapter, 500, false);
 		/* s2-2.  indicate disconnect to os */
 		rtw_indicate_disconnect(padapter);
@@ -999,7 +999,7 @@ void rtw_dev_unload(struct adapter *padapter)
 			/* check HW status and SW state */
 			netdev_dbg(padapter->pnetdev,
 				   "%s: driver in IPS-FWLPS\n", __func__);
-			LeaveAllPowerSaveMode(padapter);
+			leave_all_power_save_mode(padapter);
 		} else {
 			netdev_dbg(padapter->pnetdev,
 				   "%s: driver not in IPS\n", __func__);
@@ -1100,7 +1100,7 @@ void rtw_suspend_common(struct adapter *padapter)

 	rtw_cancel_all_timer(padapter);

-	LeaveAllPowerSaveModeDirect(padapter);
+	leave_all_power_save_mode_direct(padapter);

 	rtw_stop_cmd_thread(padapter);

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 126107d69a74..27977c8be620 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -404,7 +404,7 @@ static void rtw_dev_remove(struct sdio_func *func)
 	rtw_pm_set_ips(padapter, IPS_NONE);
 	rtw_pm_set_lps(padapter, PS_MODE_ACTIVE);

-	LeaveAllPowerSaveMode(padapter);
+	leave_all_power_save_mode(padapter);

 	rtw_btcoex_HaltNotify(padapter);

--
2.53.0

