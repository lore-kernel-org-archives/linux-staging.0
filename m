Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C301379C5
	for <linux-staging@lists.linux.dev>; Thu, 29 Dec 2022 16:26:06 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id vm8so39192811ejc.2
        for <linux-staging@lists.linux.dev>; Thu, 29 Dec 2022 08:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aR9c5zdfo3vmAkmJ8xuc6Xs69P9xog38I7XyGG+1TNc=;
        b=ZSKH16BZi0K/9yVqDeBbjV/NIEweVjJGEcdBXAMyZlVvXvevNFsFFSyNPfmkfTzIes
         N6DMfP20qEVgs/NopLc3MfvbECKr2HAfPsl8VaY/c1W8WTSCUoMjyJeeyMehMlrMq8DE
         gfzc9iQ7up+o/53+VO9CLgggD7ujud0XYmraKEdxVHNu7lNDcUHJgkVK5OCIBvrkI6B8
         60/32h2peFy8XRzRPyv891bPn6hH0tvF0OQ3l/tQYNUH0Wv1EKo1yRiE51agvNXIo257
         bPaDuc6ax0RLm/iyVey+6HWjeYxPs9KDR3y+KYrs58I9TtIvNoBIeyMUiMPpIuTfQ8Y8
         DbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aR9c5zdfo3vmAkmJ8xuc6Xs69P9xog38I7XyGG+1TNc=;
        b=rJaGyzky2ZD+319dkHSs87go1LLW/GHL1F3QalJrZn8VCcmmiDIJoJ4iivalOUcg2Q
         AmjfCkJ8GDEWyxb3JUJ994WdS2GJUYfpF2XWE38z7mHQzYdE8M5SB4vsLnKDeF1c6Frc
         uGYvsb9394yKllMwJEA9KxvQF3pm0hyknYNBkJWOazVFK1B6bm/CTJqE8wxk5Tvmdb6l
         gpKiAMCX2wAkZ2qZnKXvOGL/sdpggym/d/Mk2tAVSeJVghHLLUyI0v7s94orJTnFGc0r
         XbxeI4Xjdo1wH9/zGyAqTvGldnGTk3iEwR2X6m9ylyA1V2E3EPhsq78EPuyle4V1oyWy
         Zn2g==
X-Gm-Message-State: AFqh2kp4CbdB9/eUztFN7aNJVImEN1x6u18nbtChr0rAM0juPMnX7bLC
	rgjkEMfRpX1+KZ31qfvoW+I=
X-Google-Smtp-Source: AMrXdXvo0SwL8Gm4Zip4asr7a7quP1W93S4txdaItL0+e0prpHvw6K8pu2LFMSfNgReop4F/0ogpBw==
X-Received: by 2002:a17:907:a0d1:b0:7c1:41bb:70b3 with SMTP id hw17-20020a170907a0d100b007c141bb70b3mr5887943ejc.0.1672331165020;
        Thu, 29 Dec 2022 08:26:05 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id t7-20020a1709066bc700b0081bfc79beaesm8633609ejs.75.2022.12.29.08.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 08:26:04 -0800 (PST)
Date: Thu, 29 Dec 2022 17:26:02 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] staging: rtl8192e: Rename TxPowerLevelCCK...
Message-ID: <659aeef65d9ce390106727f720a7b2104d41f37b.1672330343.git.philipp.g.hortmann@gmail.com>
References: <cover.1672330343.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1672330343.git.philipp.g.hortmann@gmail.com>

Rename variable TxPowerLevelCCK to tx_pwr_level_cck, TxPowerLevelCCK_A to
tx_pwr_level_cck_a and TxPowerLevelCCK_C to tx_pwr_level_cck_c to avoid
CamelCase which is not accepted by checkpatch.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 14 +++++++-------
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c |  8 ++++----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   |  6 +++---
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index e3b534206f20..c121784bd810 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -408,7 +408,7 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 		}
 		if (priv->epromtype == EEPROM_93C46) {
 			for (i = 0; i < 14; i++) {
-				priv->TxPowerLevelCCK[i] =
+				priv->tx_pwr_level_cck[i] =
 					 priv->EEPROMTxPowerLevelCCK[i];
 				priv->TxPowerLevelOFDM24G[i] =
 					 priv->EEPROMTxPowerLevelOFDM24G[i];
@@ -427,31 +427,31 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 		} else if (priv->epromtype == EEPROM_93C56) {
 
 			for (i = 0; i < 3; i++) {
-				priv->TxPowerLevelCCK_A[i] =
+				priv->tx_pwr_level_cck_a[i] =
 					 priv->EEPROMRfACCKChnl1TxPwLevel[0];
 				priv->TxPowerLevelOFDM24G_A[i] =
 					 priv->EEPROMRfAOfdmChnlTxPwLevel[0];
-				priv->TxPowerLevelCCK_C[i] =
+				priv->tx_pwr_level_cck_c[i] =
 					 priv->EEPROMRfCCCKChnl1TxPwLevel[0];
 				priv->TxPowerLevelOFDM24G_C[i] =
 					 priv->EEPROMRfCOfdmChnlTxPwLevel[0];
 			}
 			for (i = 3; i < 9; i++) {
-				priv->TxPowerLevelCCK_A[i]  =
+				priv->tx_pwr_level_cck_a[i]  =
 					 priv->EEPROMRfACCKChnl1TxPwLevel[1];
 				priv->TxPowerLevelOFDM24G_A[i] =
 					 priv->EEPROMRfAOfdmChnlTxPwLevel[1];
-				priv->TxPowerLevelCCK_C[i] =
+				priv->tx_pwr_level_cck_c[i] =
 					 priv->EEPROMRfCCCKChnl1TxPwLevel[1];
 				priv->TxPowerLevelOFDM24G_C[i] =
 					 priv->EEPROMRfCOfdmChnlTxPwLevel[1];
 			}
 			for (i = 9; i < 14; i++) {
-				priv->TxPowerLevelCCK_A[i]  =
+				priv->tx_pwr_level_cck_a[i]  =
 					 priv->EEPROMRfACCKChnl1TxPwLevel[2];
 				priv->TxPowerLevelOFDM24G_A[i] =
 					 priv->EEPROMRfAOfdmChnlTxPwLevel[2];
-				priv->TxPowerLevelCCK_C[i] =
+				priv->tx_pwr_level_cck_c[i] =
 					 priv->EEPROMRfCCCKChnl1TxPwLevel[2];
 				priv->TxPowerLevelOFDM24G_C[i] =
 					 priv->EEPROMRfCOfdmChnlTxPwLevel[2];
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 33b39b1dc655..ee6138699e10 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -592,14 +592,14 @@ void rtl92e_set_tx_power(struct net_device *dev, u8 channel)
 	u32	u4RegValue;
 
 	if (priv->epromtype == EEPROM_93C46) {
-		powerlevel = priv->TxPowerLevelCCK[channel-1];
+		powerlevel = priv->tx_pwr_level_cck[channel - 1];
 		powerlevelOFDM24G = priv->TxPowerLevelOFDM24G[channel-1];
 	} else if (priv->epromtype == EEPROM_93C56) {
 		if (priv->rf_type == RF_1T2R) {
-			powerlevel = priv->TxPowerLevelCCK_C[channel-1];
+			powerlevel = priv->tx_pwr_level_cck_c[channel - 1];
 			powerlevelOFDM24G = priv->TxPowerLevelOFDM24G_C[channel-1];
 		} else if (priv->rf_type == RF_2T4R) {
-			powerlevel = priv->TxPowerLevelCCK_A[channel-1];
+			powerlevel = priv->tx_pwr_level_cck_a[channel - 1];
 			powerlevelOFDM24G = priv->TxPowerLevelOFDM24G_A[channel-1];
 
 			ant_pwr_diff = priv->TxPowerLevelOFDM24G_C[channel-1]
@@ -726,7 +726,7 @@ u8 rtl92e_config_rf_path(struct net_device *dev, enum rf90_radio_path eRFPath)
 static void _rtl92e_set_tx_power_level(struct net_device *dev, u8 channel)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
-	u8	powerlevel = priv->TxPowerLevelCCK[channel-1];
+	u8	powerlevel = priv->tx_pwr_level_cck[channel - 1];
 	u8	powerlevelOFDM24G = priv->TxPowerLevelOFDM24G[channel-1];
 
 	switch (priv->rf_chip) {
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 1c5a2a622ccb..a74ef0125caa 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -470,9 +470,9 @@ struct r8192_priv {
 	long undecorated_smoothed_pwdb;
 
 	u32 MCSTxPowerLevelOriginalOffset[6];
-	u8 TxPowerLevelCCK[14];
-	u8 TxPowerLevelCCK_A[14];
-	u8 TxPowerLevelCCK_C[14];
+	u8 tx_pwr_level_cck[14];
+	u8 tx_pwr_level_cck_a[14];
+	u8 tx_pwr_level_cck_c[14];
 	u8		TxPowerLevelOFDM24G[14];
 	u8		TxPowerLevelOFDM24G_A[14];
 	u8		TxPowerLevelOFDM24G_C[14];
-- 
2.39.0

