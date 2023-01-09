Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB208C09
	for <linux-staging@lists.linux.dev>; Mon,  9 Jan 2023 19:08:36 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id u19so22560626ejm.8
        for <linux-staging@lists.linux.dev>; Mon, 09 Jan 2023 11:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GSqVE1Npu53dUzMwRfFPsKJ6inkj7DGO4q2n7SdPytE=;
        b=TesMS0/DQOi3fKCr2VJGm2ih+k3XV+kWtuMJRKQTasW3NylH6qTchH3fE+DuxsxdWg
         9x3PIDRlDcpoIepR3Ed4BkTBkGWhgagu4upcv/kxEEgsjf6GClDM8z1IHcnmkHPqn+DU
         lsn7fxD6ya08HKC+KPwPsoUbt8WIL/zBq7i5GdpQxy7gKAxdP3BBIgPxWzIWtzipT4p+
         LiXMnaL2mOTRm/KXC31HLVCvPkw5fKIpPikDi7AksW33wg5MJ95vFNjjMVyJhUJ28g1D
         iS++ccAkzE+3KkLBEWmYcAhbhAD83o4pox3DL7wSJ+fPZvhsiqulpgQUFvtxGfJS4cLf
         ClUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSqVE1Npu53dUzMwRfFPsKJ6inkj7DGO4q2n7SdPytE=;
        b=R2oZl9Ext1S89w/ZP815Y+oMEcR0RaKDaBB0k70fshyVgvrAG6qhSG4RdWNFXu7cTB
         jAzpifgejs82Pj5V9zSpriqOmN8+CH1Tc/8tgoecJ3lIkADZqU96kJDfnYrc9lku69ms
         pV/gR+IbOtgGa7wW0IweLYdYZyMt86mfkyvm/keG8xu7jgiZwK7X+ZLkQyAMWIrRIOlS
         fH9vLF++2c8vKCbYi0yt1ffaL/q3EX6B4tJ46gkIMNN3/eLtg6Ffd5mTYiRJY9g8tblZ
         TOvifHgugnO9g3IFlID4zxL1VW01njU1200e17YhI7pMU18/z1HE5JOCR/D+sJXWh504
         wEEg==
X-Gm-Message-State: AFqh2kqlpbSzvGXnaOrG2tW6up9ivLqhjR06TpU9qIsGCYy2cuTcg/oC
	aLPBgnE99tDZP05jXMQAfWQ=
X-Google-Smtp-Source: AMrXdXvYvHRQEOVQLJyX1pVSaculzteW2U+AZXTiGy3kvUz4bxtPENj6VGNi77khMDlQQTEc2YOG9A==
X-Received: by 2002:a17:906:6a1a:b0:7a6:65c:5104 with SMTP id qw26-20020a1709066a1a00b007a6065c5104mr16880421ejc.6.1673291314724;
        Mon, 09 Jan 2023 11:08:34 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id sh39-20020a1709076ea700b007c0e6d6bd10sm4090039ejc.132.2023.01.09.11.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 11:08:34 -0800 (PST)
Date: Mon, 9 Jan 2023 20:08:32 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] staging: rtl8192e: Rename TSSI_13dBm, Pwr_Track and
 NumTotalRFPath
Message-ID: <d3bb45535b7babd1cb8df437ca238eb0ce93c9fe.1673290428.git.philipp.g.hortmann@gmail.com>
References: <cover.1673290428.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1673290428.git.philipp.g.hortmann@gmail.com>

Rename variable TSSI_13dBm to tssi_13dBm, Pwr_Track to pwr_track and
NumTotalRFPath to num_total_rf_path to avoid CamelCase which is not
accepted by checkpatch.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1 -> V2: Changed TSSI_13dBm to tssi_13dBm instead of tssi_13dbm
---
 drivers/staging/rtl8192e/rtl8192e/r8190P_rtl8256.c |  8 ++++----
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c     |  2 +-
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c     |  2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h       |  6 +++---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c         | 14 +++++++-------
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8190P_rtl8256.c b/drivers/staging/rtl8192e/rtl8192e/r8190P_rtl8256.c
index 93928f3585c1..7517ec001421 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8190P_rtl8256.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8190P_rtl8256.c
@@ -21,7 +21,7 @@ void rtl92e_set_bandwidth(struct net_device *dev,
 		return;
 	}
 
-	for (eRFPath = 0; eRFPath < priv->NumTotalRFPath; eRFPath++) {
+	for (eRFPath = 0; eRFPath < priv->num_total_rf_path; eRFPath++) {
 		if (!rtl92e_is_legal_rf_path(dev, eRFPath))
 			continue;
 
@@ -63,10 +63,10 @@ bool rtl92e_config_rf(struct net_device *dev)
 	u8	ConstRetryTimes = 5, RetryTimes = 5;
 	u8 ret = 0;
 
-	priv->NumTotalRFPath = RTL819X_TOTAL_RF_PATH;
+	priv->num_total_rf_path = RTL819X_TOTAL_RF_PATH;
 
 	for (eRFPath = (enum rf90_radio_path)RF90_PATH_A;
-	     eRFPath < priv->NumTotalRFPath; eRFPath++) {
+	     eRFPath < priv->num_total_rf_path; eRFPath++) {
 		if (!rtl92e_is_legal_rf_path(dev, eRFPath))
 			continue;
 
@@ -195,7 +195,7 @@ void rtl92e_set_ofdm_tx_power(struct net_device *dev, u8 powerlevel)
 		if (index == 3) {
 			writeVal_tmp = (byte3 << 24) | (byte2 << 16) |
 				       (byte1 << 8) | byte0;
-			priv->Pwr_Track = writeVal_tmp;
+			priv->pwr_track = writeVal_tmp;
 		}
 
 		if (priv->bDynamicTxHighPower)
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 25fa7714df4e..8b61c7581fe0 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -371,7 +371,7 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 						   0xff00) >> 8;
 		else
 			priv->EEPROMThermalMeter = EEPROM_Default_ThermalMeter;
-		priv->TSSI_13dBm = priv->EEPROMThermalMeter * 100;
+		priv->tssi_13dBm = priv->EEPROMThermalMeter * 100;
 
 		if (priv->epromtype == EEPROM_93C46) {
 			if (!priv->AutoloadFailFlag) {
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index a813eded4cb3..ccbce3e177b6 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -904,7 +904,7 @@ static u8 _rtl92e_phy_switch_channel_step(struct net_device *dev, u8 channel,
 				break;
 			case CmdID_RF_WriteReg:
 				for (eRFPath = 0; eRFPath <
-				     priv->NumTotalRFPath; eRFPath++)
+				     priv->num_total_rf_path; eRFPath++)
 					rtl92e_set_rf_reg(dev,
 						 (enum rf90_radio_path)eRFPath,
 						 CurrentCmd->Para1, bMask12Bits,
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 93b3b75a063f..825cb8ce06c0 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -445,7 +445,7 @@ struct r8192_priv {
 	u8 nCur40MhzPrimeSC;
 
 	u32 RfReg0Value[4];
-	u8 NumTotalRFPath;
+	u8 num_total_rf_path;
 	bool brfpath_rxenable[4];
 
 	bool bTXPowerDataReadFromEEPORM;
@@ -461,8 +461,8 @@ struct r8192_priv {
 	u8 DM_Type;
 
 	u8 cck_pwr_enl;
-	u16 TSSI_13dBm;
-	u32 Pwr_Track;
+	u16 tssi_13dBm;
+	u32 pwr_track;
 	u8 CCKPresentAttentuation_20Mdefault;
 	u8 CCKPresentAttentuation_40Mdefault;
 	s8 CCKPresentAttentuation_difference;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index a18393c8a833..6cd49b3f6408 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -615,14 +615,14 @@ static void _rtl92e_dm_tx_power_tracking_callback_tssi(struct net_device *dev)
 	u8	RF_Type, tmp_report[5] = {0, 0, 0, 0, 0};
 	u32	Value;
 	u8	Pwr_Flag;
-	u16	Avg_TSSI_Meas, TSSI_13dBm, Avg_TSSI_Meas_from_driver = 0;
+	u16	Avg_TSSI_Meas, tssi_13dBm, Avg_TSSI_Meas_from_driver = 0;
 	u32	delta = 0;
 
 	rtl92e_writeb(dev, Pw_Track_Flag, 0);
 	rtl92e_writeb(dev, FW_Busy_Flag, 0);
 	priv->rtllib->bdynamic_txpower_enable = false;
 
-	powerlevelOFDM24G = priv->Pwr_Track >> 24;
+	powerlevelOFDM24G = priv->pwr_track >> 24;
 	RF_Type = priv->rf_type;
 	Value = (RF_Type<<8) | powerlevelOFDM24G;
 
@@ -688,12 +688,12 @@ static void _rtl92e_dm_tx_power_tracking_callback_tssi(struct net_device *dev)
 				Avg_TSSI_Meas_from_driver += tmp_report[k];
 
 			Avg_TSSI_Meas_from_driver *= 100 / 5;
-			TSSI_13dBm = priv->TSSI_13dBm;
+			tssi_13dBm = priv->tssi_13dBm;
 
-			if (Avg_TSSI_Meas_from_driver > TSSI_13dBm)
-				delta = Avg_TSSI_Meas_from_driver - TSSI_13dBm;
+			if (Avg_TSSI_Meas_from_driver > tssi_13dBm)
+				delta = Avg_TSSI_Meas_from_driver - tssi_13dBm;
 			else
-				delta = TSSI_13dBm - Avg_TSSI_Meas_from_driver;
+				delta = tssi_13dBm - Avg_TSSI_Meas_from_driver;
 
 			if (delta <= E_FOR_TX_POWER_TRACK) {
 				priv->rtllib->bdynamic_txpower_enable = true;
@@ -701,7 +701,7 @@ static void _rtl92e_dm_tx_power_tracking_callback_tssi(struct net_device *dev)
 				rtl92e_writeb(dev, FW_Busy_Flag, 0);
 				return;
 			}
-			if (Avg_TSSI_Meas_from_driver < TSSI_13dBm - E_FOR_TX_POWER_TRACK)
+			if (Avg_TSSI_Meas_from_driver < tssi_13dBm - E_FOR_TX_POWER_TRACK)
 				_rtl92e_dm_tx_update_tssi_weak_signal(dev,
 								      RF_Type);
 			else
-- 
2.39.0

