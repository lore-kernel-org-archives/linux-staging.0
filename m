Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA2E7B
	for <linux-staging@lists.linux.dev>; Sat, 24 Sep 2022 22:03:19 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id nb11so7159934ejc.5
        for <linux-staging@lists.linux.dev>; Sat, 24 Sep 2022 15:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=cUeH3XmhsuVxox+WBK0EztC3Vn4IiIlYe/BsguLKMHs=;
        b=gKBMNAlNq3Gi7IwncL+Ps63cJySgz67Aktgne9qw8BKsUp3UBvc4QeP5aGUo8Bi4Xr
         lN1cgGV4d0pV4XDQ1exkMpIfz3g/dvUsgKTn0swyCuc2MlNl9NUM5qdPiiitlUjMcRxw
         rBlV7lqyLB5i+id1TWoPkn859gxI687U/1TT49eaFA8cyPTtD6aT0X4AqKBQ8uAZE73t
         w9BynRNOfYVja4jSIUZOeTq8Hvr9CyaduRNNVXlzIg4zWzlLpV/W8vsE+5pnCLKyAXsD
         lvJVY9J9ZrYqcrOPyufOc4qUuR0Ly0dLQ0MhwH0t8Y48gEyMtx2/0N/HUih3pkvn/QUO
         x+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=cUeH3XmhsuVxox+WBK0EztC3Vn4IiIlYe/BsguLKMHs=;
        b=OZYAYst/jlUFm17tBkQtuAXAyPIR6QM8FCUSGEV2a9A7nxif4N0Sd4xaLQiBEkoEjh
         13PrbjuMuVQwULrdZw2UxJxNjYS9/tVm+PwZxj93BvqIjdG1I7NGKhjlqa3mR9iy8qNH
         TNPef5L1ccpC32pY8ThxeS0H8Qu4LfiUeXyizN4VsuGZlaQhvLjXrdA39uIOcuOaxOBd
         4n2gdsumc35c3sK9OVM6Tm/q5aI9K01vezJDKIaN1ks39gWPWF7GnU1jE/BPLtlDXvn4
         OQq8L4H09itl8Lzt3sLNBffqRrqG2RFGQfCM0Mf57eGdWC3OMF080QeM6IJ5mNJh71x8
         kInQ==
X-Gm-Message-State: ACrzQf0iqvKcKSHrA/p+BiaNPTiuMBCxYMbPUN7eB8wHJZumbbZYSw6I
	1s2RBtCt69BleSGtHHxRbdKncO108Hc=
X-Google-Smtp-Source: AMsMyM6JmiDDITrLR3FWvlnQMtesj2GEBMqXXK/832ldINi7QpgcQaeeY1a3Zla8se+EZdOc0HRzyA==
X-Received: by 2002:a17:907:3e28:b0:782:81d:a4f9 with SMTP id hp40-20020a1709073e2800b00782081da4f9mr12409527ejc.558.1664056998352;
        Sat, 24 Sep 2022 15:03:18 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id r10-20020a17090609ca00b0073cb0801104sm6021615eje.147.2022.09.24.15.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 15:03:17 -0700 (PDT)
Date: Sun, 25 Sep 2022 00:03:16 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] staging: rtl8192e: Rename eRfSleep, eRfPowerStateToSet
 and RfOffReason
Message-ID: <58e21e5cf86270edae93162db2395e6348c9c424.1664055213.git.philipp.g.hortmann@gmail.com>
References: <cover.1664055213.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1664055213.git.philipp.g.hortmann@gmail.com>

Rename variable eRfSleep to rf_sleep, eRfPowerStateToSet to
rf_power_state_to_set and RfOffReason to rf_off_reason to avoid CamelCase
which is not accepted by checkpatch. Omit the upfront "e" as no RfSleep
and RfPowerStateToSet exist and it makes the variables unnecessary long.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 10 +++++-----
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c |  2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_cam.c    |  2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   | 16 ++++++++--------
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c     | 10 +++++-----
 drivers/staging/rtl8192e/rtl8192e/rtl_ps.c     |  6 +++---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c     |  4 ++--
 drivers/staging/rtl8192e/rtllib.h              |  4 ++--
 8 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index cb8b5fd7ab86..bd2696cdaccd 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -758,13 +758,13 @@ bool rtl92e_start_adapter(struct net_device *dev)
 
 	if (priv->RegRfOff) {
 		rtl92e_set_rf_state(dev, rf_off, RF_CHANGE_BY_SW);
-	} else if (priv->rtllib->RfOffReason > RF_CHANGE_BY_PS) {
-		rtl92e_set_rf_state(dev, rf_off, priv->rtllib->RfOffReason);
-	} else if (priv->rtllib->RfOffReason >= RF_CHANGE_BY_IPS) {
-		rtl92e_set_rf_state(dev, rf_off, priv->rtllib->RfOffReason);
+	} else if (priv->rtllib->rf_off_reason > RF_CHANGE_BY_PS) {
+		rtl92e_set_rf_state(dev, rf_off, priv->rtllib->rf_off_reason);
+	} else if (priv->rtllib->rf_off_reason >= RF_CHANGE_BY_IPS) {
+		rtl92e_set_rf_state(dev, rf_off, priv->rtllib->rf_off_reason);
 	} else {
 		priv->rtllib->rf_power_state = rf_on;
-		priv->rtllib->RfOffReason = 0;
+		priv->rtllib->rf_off_reason = 0;
 	}
 
 	if (priv->rtllib->FwRWRF)
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index c81907d31af8..594db05b6558 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -1363,7 +1363,7 @@ static bool _rtl92e_set_rf_power_state(struct net_device *dev,
 
 			break;
 
-		case eRfSleep:
+		case rf_sleep:
 			if (priv->rtllib->rf_power_state == rf_off)
 				break;
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
index 5faf17d8d536..4226bbaaca44 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
@@ -83,7 +83,7 @@ void rtl92e_set_key(struct net_device *dev, u8 EntryNo, u8 KeyIndex,
 	rt_state = priv->rtllib->rf_power_state;
 	if (priv->rtllib->PowerSaveControl.bInactivePs) {
 		if (rt_state == rf_off) {
-			if (priv->rtllib->RfOffReason > RF_CHANGE_BY_IPS) {
+			if (priv->rtllib->rf_off_reason > RF_CHANGE_BY_IPS) {
 				netdev_warn(dev, "%s(): RF is OFF.\n",
 					    __func__);
 				return;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 8954d1e4534c..52b25df99642 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -170,13 +170,13 @@ bool rtl92e_set_rf_state(struct net_device *dev,
 
 	switch (state_to_set) {
 	case rf_on:
-		priv->rtllib->RfOffReason &= (~change_source);
+		priv->rtllib->rf_off_reason &= (~change_source);
 
 		if ((change_source == RF_CHANGE_BY_HW) && priv->hw_radio_off)
 			priv->hw_radio_off = false;
 
-		if (!priv->rtllib->RfOffReason) {
-			priv->rtllib->RfOffReason = 0;
+		if (!priv->rtllib->rf_off_reason) {
+			priv->rtllib->rf_off_reason = 0;
 			action_allowed = true;
 
 			if (rt_state == rf_off &&
@@ -189,7 +189,7 @@ bool rtl92e_set_rf_state(struct net_device *dev,
 
 		if ((priv->rtllib->iw_mode == IW_MODE_INFRA) ||
 		    (priv->rtllib->iw_mode == IW_MODE_ADHOC)) {
-			if ((priv->rtllib->RfOffReason > RF_CHANGE_BY_IPS) ||
+			if ((priv->rtllib->rf_off_reason > RF_CHANGE_BY_IPS) ||
 			    (change_source > RF_CHANGE_BY_IPS)) {
 				if (ieee->state == RTLLIB_LINKED)
 					priv->blinked_ingpio = true;
@@ -201,12 +201,12 @@ bool rtl92e_set_rf_state(struct net_device *dev,
 		}
 		if ((change_source == RF_CHANGE_BY_HW) && !priv->hw_radio_off)
 			priv->hw_radio_off = true;
-		priv->rtllib->RfOffReason |= change_source;
+		priv->rtllib->rf_off_reason |= change_source;
 		action_allowed = true;
 		break;
 
-	case eRfSleep:
-		priv->rtllib->RfOffReason |= change_source;
+	case rf_sleep:
+		priv->rtllib->rf_off_reason |= change_source;
 		action_allowed = true;
 		break;
 
@@ -882,7 +882,7 @@ static void _rtl92e_init_priv_variable(struct net_device *dev)
 	priv->RegRfOff = false;
 	priv->isRFOff = false;
 	priv->bInPowerSaveMode = false;
-	priv->rtllib->RfOffReason = 0;
+	priv->rtllib->rf_off_reason = 0;
 	priv->rf_change_in_progress = false;
 	priv->bHwRfOffAction = 0;
 	priv->SetRFPowerStateInProgress = false;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 92bf4bac31f1..a4bffc081857 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -1665,7 +1665,7 @@ static void _rtl92e_dm_check_rf_ctrl_gpio(void *data)
 				  struct r8192_priv, gpio_change_rf_wq);
 	struct net_device *dev = priv->rtllib->dev;
 	u8 tmp1byte;
-	enum rt_rf_power_state eRfPowerStateToSet;
+	enum rt_rf_power_state rf_power_state_to_set;
 	bool bActuallySet = false;
 	char *argv[3];
 	static const char RadioPowerPath[] = "/etc/acpi/events/RadioPower.sh";
@@ -1684,13 +1684,13 @@ static void _rtl92e_dm_check_rf_ctrl_gpio(void *data)
 
 	tmp1byte = rtl92e_readb(dev, GPI);
 
-	eRfPowerStateToSet = (tmp1byte&BIT1) ?  rf_on : rf_off;
+	rf_power_state_to_set = (tmp1byte&BIT1) ?  rf_on : rf_off;
 
-	if (priv->hw_radio_off && (eRfPowerStateToSet == rf_on)) {
+	if (priv->hw_radio_off && (rf_power_state_to_set == rf_on)) {
 		netdev_info(dev, "gpiochangeRF  - HW Radio ON\n");
 		priv->hw_radio_off = false;
 		bActuallySet = true;
-	} else if (!priv->hw_radio_off && (eRfPowerStateToSet == rf_off)) {
+	} else if (!priv->hw_radio_off && (rf_power_state_to_set == rf_off)) {
 		netdev_info(dev, "gpiochangeRF  - HW Radio OFF\n");
 		priv->hw_radio_off = true;
 		bActuallySet = true;
@@ -1699,7 +1699,7 @@ static void _rtl92e_dm_check_rf_ctrl_gpio(void *data)
 	if (bActuallySet) {
 		mdelay(1000);
 		priv->bHwRfOffAction = 1;
-		rtl92e_set_rf_state(dev, eRfPowerStateToSet, RF_CHANGE_BY_HW);
+		rtl92e_set_rf_state(dev, rf_power_state_to_set, RF_CHANGE_BY_HW);
 		if (priv->hw_radio_off)
 			argv[1] = "RFOFF";
 		else
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
index b43454320606..8c00b111ddb2 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
@@ -26,7 +26,7 @@ static void _rtl92e_hw_sleep(struct net_device *dev)
 		return;
 	}
 	spin_unlock_irqrestore(&priv->rf_ps_lock, flags);
-	rtl92e_set_rf_state(dev, eRfSleep, RF_CHANGE_BY_PS);
+	rtl92e_set_rf_state(dev, rf_sleep, RF_CHANGE_BY_PS);
 }
 
 void rtl92e_hw_sleep_wq(void *data)
@@ -139,7 +139,7 @@ void rtl92e_ips_leave(struct net_device *dev)
 	if (pPSC->bInactivePs) {
 		rt_state = priv->rtllib->rf_power_state;
 		if (rt_state != rf_on  && !pPSC->bSwRfProcessing &&
-		    priv->rtllib->RfOffReason <= RF_CHANGE_BY_IPS) {
+		    priv->rtllib->rf_off_reason <= RF_CHANGE_BY_IPS) {
 			pPSC->eInactivePowerState = rf_on;
 			priv->bInPowerSaveMode = false;
 			_rtl92e_ps_update_rf_state(dev);
@@ -168,7 +168,7 @@ void rtl92e_rtllib_ips_leave_wq(struct net_device *dev)
 
 	if (priv->rtllib->PowerSaveControl.bInactivePs) {
 		if (rt_state == rf_off) {
-			if (priv->rtllib->RfOffReason > RF_CHANGE_BY_IPS) {
+			if (priv->rtllib->rf_off_reason > RF_CHANGE_BY_IPS) {
 				netdev_warn(dev, "%s(): RF is OFF.\n",
 					    __func__);
 				return;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index 4c9ff1b1dfe1..4920cb49e381 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -254,7 +254,7 @@ static int _rtl92e_wx_set_mode(struct net_device *dev,
 	    ieee->bNetPromiscuousMode) {
 		if (priv->rtllib->PowerSaveControl.bInactivePs) {
 			if (rt_state == rf_off) {
-				if (priv->rtllib->RfOffReason >
+				if (priv->rtllib->rf_off_reason >
 				    RF_CHANGE_BY_IPS) {
 					netdev_warn(dev, "%s(): RF is OFF.\n",
 						    __func__);
@@ -416,7 +416,7 @@ static int _rtl92e_wx_set_scan(struct net_device *dev,
 	if (priv->rtllib->state != RTLLIB_LINKED) {
 		if (priv->rtllib->PowerSaveControl.bInactivePs) {
 			if (rt_state == rf_off) {
-				if (priv->rtllib->RfOffReason >
+				if (priv->rtllib->rf_off_reason >
 				    RF_CHANGE_BY_IPS) {
 					netdev_warn(dev, "%s(): RF is OFF.\n",
 						    __func__);
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 6b5c5962ae14..f7c786c8117e 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1245,7 +1245,7 @@ enum ips_callback_function {
 
 enum rt_rf_power_state {
 	rf_on,
-	eRfSleep,
+	rf_sleep,
 	rf_off
 };
 
@@ -1435,7 +1435,7 @@ struct rtllib_device {
 	bool be_scan_inprogress;
 	bool beinretry;
 	enum rt_rf_power_state rf_power_state;
-	RT_RF_CHANGE_SOURCE	RfOffReason;
+	RT_RF_CHANGE_SOURCE rf_off_reason;
 	bool is_set_key;
 	bool wx_set_enc;
 	struct rt_hi_throughput *pHTInfo;
-- 
2.37.3

