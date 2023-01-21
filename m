Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD348460
	for <linux-staging@lists.linux.dev>; Sat, 21 Jan 2023 21:45:15 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id bk16so7659163wrb.11
        for <linux-staging@lists.linux.dev>; Sat, 21 Jan 2023 13:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Vx5DSmr5lxiARhdcInV5kBQVKTGumAreM6/77gMk5Q=;
        b=NYqxFwmMFi55/wN5xzVXFQr9rFmK0pvxpTENnmcWmqFN2T5kanNE6fpfB4EVBATjZ/
         bWpr/Xtue1/20LK/GBLns8y2nnOgCREwH3OqeA/TXxjpSxgkjKGqLl+k1KAkAe0DzjXY
         wz7UkrEZRJA9CkEwbWaOb9dd1/oWbsSfexOo4h2z22eJgYRyU+qeKRd1Cft9cHsBVNzZ
         LU66XQjVQ9yrktaBgYg/y9LG0iN+NsuUD8ecIxFyd/BYwzd/3y77ubSsah5JIccH0xk6
         9edButdmPEUKSuAhf+jPlX5WLh9R/6cvttGdSJesaOXyJtro33Vm3+rO+L+EHz12jmpJ
         OSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Vx5DSmr5lxiARhdcInV5kBQVKTGumAreM6/77gMk5Q=;
        b=Wm+jOj3dzd8BY3qjfH/T18gno0R4Ox/RNz7QJqWT4jWvakxaBXyEyGIcQvCRk98Yst
         eyv9vIEGnWrl7OfQw2TDTLqKNLqCnWBRFtXmXCeNcSfClic11REjlwKgFDeL6rdX/FF6
         qL0sayl5cMUe9XfrC90pXHHhDfKlCrwGFaaWDNbku3Z6ISvww+47RdK+gbpXkcYyKNAd
         idh4uQ5BAC6FFDh74lGns174HIx8Dl3onlwF/knY+s6L2kS1Lb4ifTscrdj5SEjBJmnC
         G/ROr5MBrC3teFiN3N3rJcYO695o/mwm4LpFUOqpYRz2waITW0TCvdwMbWuyVFqJWy0F
         YqOA==
X-Gm-Message-State: AFqh2koodqx580gNH8+mzBfGQLg+EZtWiuM8v7VPzqrg5joUGftZTIL7
	dQ/bJTdOi05F7EorD3UO+nw=
X-Google-Smtp-Source: AMrXdXtmsf6qVmtghFPEzqERxS3oXnXFsy8wzNRBO1n+Xc3iJ2vrvHK4W43gpcnBrz64eep2+fr3HQ==
X-Received: by 2002:a5d:4b47:0:b0:2bf:9437:30f0 with SMTP id w7-20020a5d4b47000000b002bf943730f0mr877365wrs.2.1674337513323;
        Sat, 21 Jan 2023 13:45:13 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id r11-20020adff70b000000b002bdf290efdasm16266776wrp.58.2023.01.21.13.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 13:45:12 -0800 (PST)
Date: Sat, 21 Jan 2023 22:45:11 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] staging: rtl8192e: Rename btxpower_trackin..,
 Slide_Beaco.. and Slide_B..
Message-ID: <b722cd913d04d07ac1952da2add2a16cfeb2dc8c.1674336211.git.philipp.g.hortmann@gmail.com>
References: <cover.1674336211.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1674336211.git.philipp.g.hortmann@gmail.com>

Rename variable btxpower_trackingInit to tx_pwr_tracking_init,
Slide_Beacon_pwdb to slide_beacon_pwdb and Slide_Beacon_Total to
slide_beacon_total to avoid CamelCase which is not accepted by
checkpatch.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 10 +++++-----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   |  6 +++---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c     | 10 +++++-----
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 6c570582479d..9260d308e68b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1574,17 +1574,17 @@ static void _rtl92e_process_phyinfo(struct r8192_priv *priv, u8 *buffer,
 		    PHY_Beacon_RSSI_SLID_WIN_MAX) {
 			slide_beacon_adc_pwdb_statistics =
 					 PHY_Beacon_RSSI_SLID_WIN_MAX;
-			last_beacon_adc_pwdb = priv->stats.Slide_Beacon_pwdb
+			last_beacon_adc_pwdb = priv->stats.slide_beacon_pwdb
 					       [slide_beacon_adc_pwdb_index];
-			priv->stats.Slide_Beacon_Total -= last_beacon_adc_pwdb;
+			priv->stats.slide_beacon_total -= last_beacon_adc_pwdb;
 		}
-		priv->stats.Slide_Beacon_Total += prev_st->RxPWDBAll;
-		priv->stats.Slide_Beacon_pwdb[slide_beacon_adc_pwdb_index] =
+		priv->stats.slide_beacon_total += prev_st->RxPWDBAll;
+		priv->stats.slide_beacon_pwdb[slide_beacon_adc_pwdb_index] =
 							 prev_st->RxPWDBAll;
 		slide_beacon_adc_pwdb_index++;
 		if (slide_beacon_adc_pwdb_index >= PHY_Beacon_RSSI_SLID_WIN_MAX)
 			slide_beacon_adc_pwdb_index = 0;
-		prev_st->RxPWDBAll = priv->stats.Slide_Beacon_Total /
+		prev_st->RxPWDBAll = priv->stats.slide_beacon_total /
 				     slide_beacon_adc_pwdb_statistics;
 		if (prev_st->RxPWDBAll >= 3)
 			prev_st->RxPWDBAll -= 3;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 55a68bbe3861..983bc663a570 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -229,8 +229,8 @@ struct rt_stats {
 	u8 rx_rssi_percentage[4];
 	u8 rx_evm_percentage[2];
 	long rxSNRdB[4];
-	u32 Slide_Beacon_pwdb[100];
-	u32 Slide_Beacon_Total;
+	u32 slide_beacon_pwdb[100];
+	u32 slide_beacon_total;
 	u32	CurrentShowTxate;
 };
 
@@ -481,7 +481,7 @@ struct r8192_priv {
 	bool		bcck_in_ch14;
 
 	u8		txpower_count;
-	bool		btxpower_trackingInit;
+	bool		tx_pwr_tracking_init;
 
 	u8		ofdm_index[2];
 	u8		cck_index;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index ba92dab682ec..79f993ab7cee 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -768,7 +768,7 @@ static void _rtl92e_dm_tx_power_tracking_cb_thermal(struct net_device *dev)
 	u8 tmpOFDMindex, tmpCCKindex, tmpCCK20Mindex, tmpCCK40Mindex, tmpval;
 	int i = 0, CCKSwingNeedUpdate = 0;
 
-	if (!priv->btxpower_trackingInit) {
+	if (!priv->tx_pwr_tracking_init) {
 		tmpRegA = rtl92e_get_bb_reg(dev, rOFDM0_XATxIQImbalance,
 					    bMaskDWord);
 		for (i = 0; i < OFDM_Table_Length; i++) {
@@ -783,7 +783,7 @@ static void _rtl92e_dm_tx_power_tracking_cb_thermal(struct net_device *dev)
 				break;
 			}
 		}
-		priv->btxpower_trackingInit = true;
+		priv->tx_pwr_tracking_init = true;
 		return;
 	}
 
@@ -868,7 +868,7 @@ static void _rtl92e_dm_initialize_tx_power_tracking_tssi(struct net_device *dev)
 
 	priv->btxpower_tracking = true;
 	priv->txpower_count       = 0;
-	priv->btxpower_trackingInit = false;
+	priv->tx_pwr_tracking_init = false;
 
 }
 
@@ -882,7 +882,7 @@ static void _rtl92e_dm_init_tx_power_tracking_thermal(struct net_device *dev)
 	else
 		priv->btxpower_tracking = false;
 	priv->txpower_count       = 0;
-	priv->btxpower_trackingInit = false;
+	priv->tx_pwr_tracking_init = false;
 }
 
 void rtl92e_dm_init_txpower_tracking(struct net_device *dev)
@@ -1073,7 +1073,7 @@ void rtl92e_dm_restore_state(struct net_device *dev)
 		ratr_value &= ~(RATE_ALL_OFDM_2SS);
 	rtl92e_writel(dev, RATR0, ratr_value);
 	rtl92e_writeb(dev, UFWP, 1);
-	if (priv->btxpower_trackingInit && priv->btxpower_tracking)
+	if (priv->tx_pwr_tracking_init && priv->btxpower_tracking)
 		_rtl92e_dm_tx_power_reset_recovery(dev);
 
 	_rtl92e_dm_bb_initialgain_restore(dev);
-- 
2.39.0

