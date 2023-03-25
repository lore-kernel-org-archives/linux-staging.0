Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1F62908
	for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 13:28:37 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id i5so18463192eda.0
        for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 06:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679750916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TFO6l2l530pLCBQXneBnyGloncOzwtx1xlxfsKR6Qs=;
        b=Ap7OLaUzn0jB+rlcwEkoIZ+VV3MYSpOEYDv5C2CHymZdX8TrzrEKEPjKiQtnki8q79
         J1AQ9YgfTpjDkg8a5q4pE2H/liE0g3zAJE/SbE+TVR/9QIr9ba7bglj3PDaXUCe5Ip9v
         jKDjBcC1Wg50F+91mL5aP3rq8uiQWX+0ikRWuRklD9THtEKeBqVF2D0UqFs+hSd3Rd2D
         JdZLME4ZnDyNEEt+ElF835NhhAMEwADoAQDWiEX+/OKlr27jdODzzfQyMUUN4stLRf5V
         c8l1I9gmMFJCiAIZ0WuruLZK557VRpAkHguIEbpws0G2DQ5j8Vmz+VoROffNKMlY0R8W
         es7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679750916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/TFO6l2l530pLCBQXneBnyGloncOzwtx1xlxfsKR6Qs=;
        b=7cXyQufJnx392blXBCixBtSaxeTNZGxHikcUguc2M2+xanTQb5R/2mk0SvGZvIefIR
         9gQEY79b1qYd7oc0jeNkehLQNeFaxg89kvYLoC1lrXSvB3MIBqgImNdHm9vOCvt2LEGZ
         xA8nDoIdVncgD6EveroSyPtsUxguzssZRyLtGrcs51QOqtOSSlHt8y4+yppo9YmWIhLX
         BJarVLamo5B/hpbLDbKdYdtSLGK+EBw6vnAxDNlq75eM+xg+sJ8ZWsEQFP3ScOrlrCCz
         iwzL+JNK1a4EG/XzlD0KbtVVdeAv6fAM+cxnXBDrFsLYn0CQMjJF83FoCP9sZ1XejZHw
         w8iQ==
X-Gm-Message-State: AAQBX9dz/tnF0hQVtEMhshMUGswDIh95qEWKcpHfQDu9zE26fToNJZJt
	/jGU9J4Hd42iKCt13uv2Py0=
X-Google-Smtp-Source: AKy350bMmuv0s/Na5PRmWXEwY161wF0FPOPWWU78c4IvuWs34pFI56mV4quzXJXDpMPS0kmul7ZPtw==
X-Received: by 2002:a17:906:3590:b0:8b1:75a0:e5c6 with SMTP id o16-20020a170906359000b008b175a0e5c6mr6475706ejb.18.1679750915833;
        Sat, 25 Mar 2023 06:28:35 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abbe9.dynamic.kabel-deutschland.de. [95.90.187.233])
        by smtp.gmail.com with ESMTPSA id lt11-20020a170906fa8b00b008e54ac90de1sm11727610ejb.74.2023.03.25.06.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 06:28:35 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/4] staging: rtl8192e: priv->rf_type is always RF_1T2R
Date: Sat, 25 Mar 2023 14:28:22 +0100
Message-Id: <20230325132823.22872-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230325132823.22872-1-straube.linux@gmail.com>
References: <20230325132823.22872-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The value of priv->rf_type is always RF_1T2R. Remove if statements
that check for priv->rf_type == RF_1T2R and remove resulting dead
code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 13 ++++-------
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    |  7 ++----
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    | 23 +++++++------------
 3 files changed, 14 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 0e0096ef4943..b237970ecf85 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -540,8 +540,7 @@ static void _rtl92e_hwconfig(struct net_device *dev)
 		u32 ratr_value;
 
 		ratr_value = regRATR;
-		if (priv->rf_type == RF_1T2R)
-			ratr_value &= ~(RATE_ALL_OFDM_2SS);
+		ratr_value &= ~(RATE_ALL_OFDM_2SS);
 		rtl92e_writel(dev, RATR0, ratr_value);
 		rtl92e_writeb(dev, UFWP, 1);
 	}
@@ -1886,14 +1885,10 @@ void rtl92e_update_ratr_table(struct net_device *dev)
 		break;
 	case IEEE_N_24G:
 	case IEEE_N_5G:
-		if (ieee->ht_info->peer_mimo_ps == 0) {
+		if (ieee->ht_info->peer_mimo_ps == 0)
 			ratr_value &= 0x0007F007;
-		} else {
-			if (priv->rf_type == RF_1T2R)
-				ratr_value &= 0x000FF007;
-			else
-				ratr_value &= 0x0F81F007;
-		}
+		else
+			ratr_value &= 0x000FF007;
 		break;
 	default:
 		break;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index b1c297d2ae36..bd302f5cb356 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -281,14 +281,11 @@ static void _rtl92e_phy_config_bb(struct net_device *dev, u8 ConfigType)
 	u32 *Rtl819XPHY_REGArray_Table = NULL;
 	u32 *Rtl819XAGCTAB_Array_Table = NULL;
 	u16 AGCTAB_ArrayLen, PHY_REGArrayLen = 0;
-	struct r8192_priv *priv = rtllib_priv(dev);
 
 	AGCTAB_ArrayLen = RTL8192E_AGCTAB_ARR_LEN;
 	Rtl819XAGCTAB_Array_Table = RTL8192E_AGCTAB_ARR;
-	if (priv->rf_type == RF_1T2R) {
-		PHY_REGArrayLen = RTL8192E_PHY_REG_1T2R_ARR_LEN;
-		Rtl819XPHY_REGArray_Table = RTL8192E_PHY_REG_1T2R_ARR;
-	}
+	PHY_REGArrayLen = RTL8192E_PHY_REG_1T2R_ARR_LEN;
+	Rtl819XPHY_REGArray_Table = RTL8192E_PHY_REG_1T2R_ARR;
 
 	if (ConfigType == BB_CONFIG_PHY_REG) {
 		for (i = 0; i < PHY_REGArrayLen; i += 2) {
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index b745b73eedea..46be638677d9 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -272,19 +272,14 @@ void rtl92e_init_adaptive_rate(struct net_device *dev)
 		pra->ping_rssi_enable = 0;
 	pra->ping_rssi_thresh_for_ra = 15;
 
-
-	if (priv->rf_type == RF_1T2R) {
-		pra->upper_rssi_threshold_ratr		=	0x000fc000;
-		pra->middle_rssi_threshold_ratr		=	0x000ff000;
-		pra->low_rssi_threshold_ratr		=	0x000ff001;
-		pra->low_rssi_threshold_ratr_40M	=	0x000ff005;
-		pra->low_rssi_threshold_ratr_20M	=	0x000ff001;
-		pra->ping_rssi_ratr	=	0x0000000d;
-	}
-
+	pra->upper_rssi_threshold_ratr		=	0x000fc000;
+	pra->middle_rssi_threshold_ratr		=	0x000ff000;
+	pra->low_rssi_threshold_ratr		=	0x000ff001;
+	pra->low_rssi_threshold_ratr_40M	=	0x000ff005;
+	pra->low_rssi_threshold_ratr_20M	=	0x000ff001;
+	pra->ping_rssi_ratr	=	0x0000000d;
 }
 
-
 static void _rtl92e_dm_check_rate_adaptive(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
@@ -383,8 +378,7 @@ static void _rtl92e_dm_check_rate_adaptive(struct net_device *dev)
 			u32 ratr_value;
 
 			ratr_value = targetRATR;
-			if (priv->rf_type == RF_1T2R)
-				ratr_value &= ~(RATE_ALL_OFDM_2SS);
+			ratr_value &= ~(RATE_ALL_OFDM_2SS);
 			rtl92e_writel(dev, RATR0, ratr_value);
 			rtl92e_writeb(dev, UFWP, 1);
 
@@ -981,8 +975,7 @@ void rtl92e_dm_restore_state(struct net_device *dev)
 	      priv->rtllib->mode == WIRELESS_MODE_N_5G))
 		return;
 	ratr_value = reg_ratr;
-	if (priv->rf_type == RF_1T2R)
-		ratr_value &= ~(RATE_ALL_OFDM_2SS);
+	ratr_value &= ~(RATE_ALL_OFDM_2SS);
 	rtl92e_writel(dev, RATR0, ratr_value);
 	rtl92e_writeb(dev, UFWP, 1);
 	if (priv->tx_pwr_tracking_init && priv->btxpower_tracking)
-- 
2.40.0

