Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDDD612E
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 19:21:39 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id go34so6280521ejc.2
        for <linux-staging@lists.linux.dev>; Fri, 09 Sep 2022 12:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=fbruvI1As45J13rcrmiazfUwyKfsk6pI2SAj2MWbjgE=;
        b=aGF+CJr6wNyEQKJVyFclWWITvrZBrP3oYL+CYmYFT6thU7M7CPhRlVaRmJ7C+TxauL
         FQ5p8+XhGizOQLebpxB02Zze3SoTX+qvpgDsU3cYEMxZdRIJu04wNmCa5J1qKgdEInK7
         gUIQY60tkopkfgPtabtKoM1L9isqeW9VDkjDuN0o4iu+nwIcOW2DWoFiTFmbfSuGtjL/
         Qb8S48/5CXaZvG60nNj6sYltd6rWZdyENanIFzO9VB+U/7cIvd+MKU41YgYe9MdkWUQ2
         pi05wGrn4nkXqnlglCseLvZSNrahfaMGrKzdjZCkkaTEaSqMZ4Z81fvikhLm3865BnYS
         K0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=fbruvI1As45J13rcrmiazfUwyKfsk6pI2SAj2MWbjgE=;
        b=zlr0xMP1V8z3nWi67DlGyj/6RzM9BaYEU3Qx+753/OJNmK13qLJD/sN0HpaYExMrak
         q6Y7SmXCmsaDmVAoyzS47V98NK7Jb+vHpm5MV4hErx+PNsbNgdutcf6Hg/UpX6JDKcqo
         GGJ1CK2/wdj9zjkjSo5HOf+A8OLsVHyGAHtaG87d1UpZ+MmLSLgBhkRrUS35lc0YPcpo
         g8PdhOhWe/cbYoyWczGS8bZiRF2L96c5+DjVvC/WjWPhQRj7EramPVLEF0Z2RY0arRfZ
         cFXoXvZQbG8Cm8ipcY3av+UVYB/NUCHVdULnfQsHwUjkPL7/1KZp4L5JuTHBPHxuIeKw
         d4AA==
X-Gm-Message-State: ACgBeo3iK6Gg5C7JG28oV1iuSRnCIAUIa1db/KUoSuDMTOTydOTyFnVD
	yFOthmRK6p9vuwrNTfIKkrs=
X-Google-Smtp-Source: AA6agR4vQh1iuufeUhKnUOmdkWrY1EzcLK7faGciuGOGFswzl8JVlQqq3JOX3Nxy3Anv2lmJTQY5Lw==
X-Received: by 2002:a17:907:1dd9:b0:77a:341b:88cb with SMTP id og25-20020a1709071dd900b0077a341b88cbmr2351401ejc.753.1662751297451;
        Fri, 09 Sep 2022 12:21:37 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906310a00b0073d6d6e698bsm635740ejx.187.2022.09.09.12.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 12:21:37 -0700 (PDT)
Date: Fri, 9 Sep 2022 21:21:35 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] staging: rtl8192e: Rename rtState
Message-ID: <e888fa7e6edaa68e741236ea012f8230f6817882.1662402870.git.philipp.g.hortmann@gmail.com>
References: <cover.1662402870.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1662402870.git.philipp.g.hortmann@gmail.com>

Rename variable rtState to rt_state to avoid CamelCase which
is not accepted by checkpatch.pl.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_cam.c  |  6 +++---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c |  6 +++---
 drivers/staging/rtl8192e/rtl8192e/rtl_ps.c   | 18 +++++++++---------
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c   | 12 ++++++------
 4 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
index d7630f02a910..6b372b0dd6bc 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
@@ -86,11 +86,11 @@ void rtl92e_set_key(struct net_device *dev, u8 EntryNo, u8 KeyIndex,
 	u16 usConfig = 0;
 	u8 i;
 	struct r8192_priv *priv = (struct r8192_priv *)rtllib_priv(dev);
-	enum rt_rf_power_state rtState;
+	enum rt_rf_power_state rt_state;
 
-	rtState = priv->rtllib->eRFPowerState;
+	rt_state = priv->rtllib->eRFPowerState;
 	if (priv->rtllib->PowerSaveControl.bInactivePs) {
-		if (rtState == eRfOff) {
+		if (rt_state == eRfOff) {
 			if (priv->rtllib->RfOffReason > RF_CHANGE_BY_IPS) {
 				netdev_warn(dev, "%s(): RF is OFF.\n",
 					    __func__);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index b1f5a63790c8..bc8aca808e99 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -139,7 +139,7 @@ bool rtl92e_set_rf_state(struct net_device *dev,
 	struct rtllib_device *ieee = priv->rtllib;
 	bool action_allowed = false;
 	bool connect_by_ssid = false;
-	enum rt_rf_power_state rtState;
+	enum rt_rf_power_state rt_state;
 	u16			RFWaitCounter = 0;
 	unsigned long flag;
 
@@ -166,7 +166,7 @@ bool rtl92e_set_rf_state(struct net_device *dev,
 		}
 	}
 
-	rtState = priv->rtllib->eRFPowerState;
+	rt_state = priv->rtllib->eRFPowerState;
 
 	switch (state_to_set) {
 	case eRfOn:
@@ -179,7 +179,7 @@ bool rtl92e_set_rf_state(struct net_device *dev,
 			priv->rtllib->RfOffReason = 0;
 			action_allowed = true;
 
-			if (rtState == eRfOff &&
+			if (rt_state == eRfOff &&
 			    change_source >= RF_CHANGE_BY_HW)
 				connect_by_ssid = true;
 		}
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
index c5e89eb40342..3333ce3e88a8 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
@@ -126,11 +126,11 @@ void rtl92e_ips_enter(struct net_device *dev)
 	struct r8192_priv *priv = rtllib_priv(dev);
 	struct rt_pwr_save_ctrl *pPSC = (struct rt_pwr_save_ctrl *)
 					&(priv->rtllib->PowerSaveControl);
-	enum rt_rf_power_state rtState;
+	enum rt_rf_power_state rt_state;
 
 	if (pPSC->bInactivePs) {
-		rtState = priv->rtllib->eRFPowerState;
-		if (rtState == eRfOn && !pPSC->bSwRfProcessing &&
+		rt_state = priv->rtllib->eRFPowerState;
+		if (rt_state == eRfOn && !pPSC->bSwRfProcessing &&
 			(priv->rtllib->state != RTLLIB_LINKED) &&
 			(priv->rtllib->iw_mode != IW_MODE_MASTER)) {
 			RT_TRACE(COMP_PS, "%s(): Turn off RF.\n", __func__);
@@ -147,11 +147,11 @@ void rtl92e_ips_leave(struct net_device *dev)
 	struct r8192_priv *priv = rtllib_priv(dev);
 	struct rt_pwr_save_ctrl *pPSC = (struct rt_pwr_save_ctrl *)
 					&(priv->rtllib->PowerSaveControl);
-	enum rt_rf_power_state rtState;
+	enum rt_rf_power_state rt_state;
 
 	if (pPSC->bInactivePs) {
-		rtState = priv->rtllib->eRFPowerState;
-		if (rtState != eRfOn  && !pPSC->bSwRfProcessing &&
+		rt_state = priv->rtllib->eRFPowerState;
+		if (rt_state != eRfOn  && !pPSC->bSwRfProcessing &&
 		    priv->rtllib->RfOffReason <= RF_CHANGE_BY_IPS) {
 			RT_TRACE(COMP_PS, "%s(): Turn on RF.\n", __func__);
 			pPSC->eInactivePowerState = eRfOn;
@@ -176,12 +176,12 @@ void rtl92e_ips_leave_wq(void *data)
 void rtl92e_rtllib_ips_leave_wq(struct net_device *dev)
 {
 	struct r8192_priv *priv = (struct r8192_priv *)rtllib_priv(dev);
-	enum rt_rf_power_state rtState;
+	enum rt_rf_power_state rt_state;
 
-	rtState = priv->rtllib->eRFPowerState;
+	rt_state = priv->rtllib->eRFPowerState;
 
 	if (priv->rtllib->PowerSaveControl.bInactivePs) {
-		if (rtState == eRfOff) {
+		if (rt_state == eRfOff) {
 			if (priv->rtllib->RfOffReason > RF_CHANGE_BY_IPS) {
 				netdev_warn(dev, "%s(): RF is OFF.\n",
 					    __func__);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index 407effde5e71..70aa47568f3a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -247,17 +247,17 @@ static int _rtl92e_wx_set_mode(struct net_device *dev,
 	struct r8192_priv *priv = rtllib_priv(dev);
 	struct rtllib_device *ieee = netdev_priv_rsl(dev);
 
-	enum rt_rf_power_state rtState;
+	enum rt_rf_power_state rt_state;
 	int ret;
 
 	if (priv->bHwRadioOff)
 		return 0;
-	rtState = priv->rtllib->eRFPowerState;
+	rt_state = priv->rtllib->eRFPowerState;
 	mutex_lock(&priv->wx_mutex);
 	if (wrqu->mode == IW_MODE_ADHOC || wrqu->mode == IW_MODE_MONITOR ||
 	    ieee->bNetPromiscuousMode) {
 		if (priv->rtllib->PowerSaveControl.bInactivePs) {
-			if (rtState == eRfOff) {
+			if (rt_state == eRfOff) {
 				if (priv->rtllib->RfOffReason >
 				    RF_CHANGE_BY_IPS) {
 					netdev_warn(dev, "%s(): RF is OFF.\n",
@@ -379,7 +379,7 @@ static int _rtl92e_wx_set_scan(struct net_device *dev,
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 	struct rtllib_device *ieee = priv->rtllib;
-	enum rt_rf_power_state rtState;
+	enum rt_rf_power_state rt_state;
 	int ret;
 
 	if (!(ieee->softmac_features & IEEE_SOFTMAC_SCAN)) {
@@ -396,7 +396,7 @@ static int _rtl92e_wx_set_scan(struct net_device *dev,
 			    __func__);
 		return 0;
 	}
-	rtState = priv->rtllib->eRFPowerState;
+	rt_state = priv->rtllib->eRFPowerState;
 	if (!priv->up)
 		return -ENETDOWN;
 	if (priv->rtllib->LinkDetectInfo.bBusyTraffic == true)
@@ -419,7 +419,7 @@ static int _rtl92e_wx_set_scan(struct net_device *dev,
 
 	if (priv->rtllib->state != RTLLIB_LINKED) {
 		if (priv->rtllib->PowerSaveControl.bInactivePs) {
-			if (rtState == eRfOff) {
+			if (rt_state == eRfOff) {
 				if (priv->rtllib->RfOffReason >
 				    RF_CHANGE_BY_IPS) {
 					netdev_warn(dev, "%s(): RF is OFF.\n",
-- 
2.37.2

