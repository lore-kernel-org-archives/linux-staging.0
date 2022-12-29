Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E57D79C5
	for <linux-staging@lists.linux.dev>; Thu, 29 Dec 2022 16:26:19 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id u9so46220639ejo.0
        for <linux-staging@lists.linux.dev>; Thu, 29 Dec 2022 08:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eS98uo5EwthbiK4UNGthUBCm8vqMR7EmoQLq88cB8yc=;
        b=dQNrll5LjUVKXeTAho50UrGzlMkAGXpx4NjnpY6AaKpnQIyz3rtL8OVByzbHCQhTk6
         h6TlQV11WRRlUmvAtfydRD5ukKB1oWHouuxWkHxckeKk+ZbM6y8130Zmimc68tpweyG7
         z5+0oA6wsu6lYRMCX3O1zH2Lb0eoIfRSnfFbb8Tzviwxx7/jmX39Ypb38bEId/IPPKEO
         uPOxp2jK1VNUG1ePHj2y0V164ka1FFAyR2CHvjKfHHXhLo35WgNq8wGoR7BWvpvtBWLl
         ix4OXyYNv+GptY6Zh62yLG/37BJudOdSLpEWZejAi4w/62haczuCDQSaVw7mlWFURM3c
         pF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eS98uo5EwthbiK4UNGthUBCm8vqMR7EmoQLq88cB8yc=;
        b=JYRTkR55CM4VWFlLBDakLwawwM0lJ4dnKQGkICyUbcNJ9p5tEgAOVgp/rI8hArHfrj
         EOUgqz76dnjLlAkpuOHzYi6eLG47/MIDKt0fCmf2KnWhsyGjz/bnRXXZry36/rIaj4aW
         r+iLmanDPDb3uSdmNyrBk16L0naHIxs2ZQ5tJhPuZcbYUDTFDAT3lNZLNr9sThWSoo8g
         ecLXTK6s80BVw0wzXkI/zDS94iQtYNaLbmLDBOuPdme40uP+W9Risx8XQh/SjbQ2tNhb
         C6SCHNQFyok1/UusSgWj3x1wa8uex64yta9PXBq/fxwpXQqOWIdVEAX9pHZITxNps9A4
         37Eg==
X-Gm-Message-State: AFqh2krZ59Y9HFKkOcIpSaOtizoQPmWW5v7SlYNwdC2Er8LT3UUAooaa
	I1GlRTl8o2H0VvsMZ9QyeHo=
X-Google-Smtp-Source: AMrXdXsuQnidHP9UtNxfhIfNVn+hS4otI2YcokWsl6wDqJFdHAEeQLrkFb2JDyOvvTjdUq3/KL+SJg==
X-Received: by 2002:a17:907:9a8a:b0:7c0:b944:fc4d with SMTP id km10-20020a1709079a8a00b007c0b944fc4dmr6367470ejc.3.1672331177817;
        Thu, 29 Dec 2022 08:26:17 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id z25-20020a170906945900b007c1633cea13sm8855393ejx.12.2022.12.29.08.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 08:26:17 -0800 (PST)
Date: Thu, 29 Dec 2022 17:26:14 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] staging: rtl8192e: Rename TxPowerLevelOFDM24G...
Message-ID: <a4fac8c1bc8b3f1f9af9959bfec0c3d37aa3a6ec.1672330343.git.philipp.g.hortmann@gmail.com>
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

Rename variable TxPowerLevelOFDM24G to tx_pwr_level_ofdm_24g,
TxPowerLevelOFDM24G_A to tx_pwr_level_ofdm_24g_a and TxPowerLevelOFDM24G_C
to tx_pwr_level_ofdm_24g_c to avoid CamelCase which is not accepted by
checkpatch.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 14 +++++++-------
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 12 ++++++------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   |  6 +++---
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index c121784bd810..618939dbfb13 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -410,7 +410,7 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 			for (i = 0; i < 14; i++) {
 				priv->tx_pwr_level_cck[i] =
 					 priv->EEPROMTxPowerLevelCCK[i];
-				priv->TxPowerLevelOFDM24G[i] =
+				priv->tx_pwr_level_ofdm_24g[i] =
 					 priv->EEPROMTxPowerLevelOFDM24G[i];
 			}
 			priv->LegacyHTTxPowerDiff =
@@ -429,31 +429,31 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 			for (i = 0; i < 3; i++) {
 				priv->tx_pwr_level_cck_a[i] =
 					 priv->EEPROMRfACCKChnl1TxPwLevel[0];
-				priv->TxPowerLevelOFDM24G_A[i] =
+				priv->tx_pwr_level_ofdm_24g_a[i] =
 					 priv->EEPROMRfAOfdmChnlTxPwLevel[0];
 				priv->tx_pwr_level_cck_c[i] =
 					 priv->EEPROMRfCCCKChnl1TxPwLevel[0];
-				priv->TxPowerLevelOFDM24G_C[i] =
+				priv->tx_pwr_level_ofdm_24g_c[i] =
 					 priv->EEPROMRfCOfdmChnlTxPwLevel[0];
 			}
 			for (i = 3; i < 9; i++) {
 				priv->tx_pwr_level_cck_a[i]  =
 					 priv->EEPROMRfACCKChnl1TxPwLevel[1];
-				priv->TxPowerLevelOFDM24G_A[i] =
+				priv->tx_pwr_level_ofdm_24g_a[i] =
 					 priv->EEPROMRfAOfdmChnlTxPwLevel[1];
 				priv->tx_pwr_level_cck_c[i] =
 					 priv->EEPROMRfCCCKChnl1TxPwLevel[1];
-				priv->TxPowerLevelOFDM24G_C[i] =
+				priv->tx_pwr_level_ofdm_24g_c[i] =
 					 priv->EEPROMRfCOfdmChnlTxPwLevel[1];
 			}
 			for (i = 9; i < 14; i++) {
 				priv->tx_pwr_level_cck_a[i]  =
 					 priv->EEPROMRfACCKChnl1TxPwLevel[2];
-				priv->TxPowerLevelOFDM24G_A[i] =
+				priv->tx_pwr_level_ofdm_24g_a[i] =
 					 priv->EEPROMRfAOfdmChnlTxPwLevel[2];
 				priv->tx_pwr_level_cck_c[i] =
 					 priv->EEPROMRfCCCKChnl1TxPwLevel[2];
-				priv->TxPowerLevelOFDM24G_C[i] =
+				priv->tx_pwr_level_ofdm_24g_c[i] =
 					 priv->EEPROMRfCOfdmChnlTxPwLevel[2];
 			}
 			priv->LegacyHTTxPowerDiff =
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index ee6138699e10..19c65aaef3f6 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -593,17 +593,17 @@ void rtl92e_set_tx_power(struct net_device *dev, u8 channel)
 
 	if (priv->epromtype == EEPROM_93C46) {
 		powerlevel = priv->tx_pwr_level_cck[channel - 1];
-		powerlevelOFDM24G = priv->TxPowerLevelOFDM24G[channel-1];
+		powerlevelOFDM24G = priv->tx_pwr_level_ofdm_24g[channel - 1];
 	} else if (priv->epromtype == EEPROM_93C56) {
 		if (priv->rf_type == RF_1T2R) {
 			powerlevel = priv->tx_pwr_level_cck_c[channel - 1];
-			powerlevelOFDM24G = priv->TxPowerLevelOFDM24G_C[channel-1];
+			powerlevelOFDM24G = priv->tx_pwr_level_ofdm_24g_c[channel - 1];
 		} else if (priv->rf_type == RF_2T4R) {
 			powerlevel = priv->tx_pwr_level_cck_a[channel - 1];
-			powerlevelOFDM24G = priv->TxPowerLevelOFDM24G_A[channel-1];
+			powerlevelOFDM24G = priv->tx_pwr_level_ofdm_24g_a[channel - 1];
 
-			ant_pwr_diff = priv->TxPowerLevelOFDM24G_C[channel-1]
-				       - priv->TxPowerLevelOFDM24G_A[channel-1];
+			ant_pwr_diff = priv->tx_pwr_level_ofdm_24g_c[channel - 1]
+				       - priv->tx_pwr_level_ofdm_24g_a[channel - 1];
 
 			priv->RF_C_TxPwDiff = ant_pwr_diff;
 
@@ -727,7 +727,7 @@ static void _rtl92e_set_tx_power_level(struct net_device *dev, u8 channel)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 	u8	powerlevel = priv->tx_pwr_level_cck[channel - 1];
-	u8	powerlevelOFDM24G = priv->TxPowerLevelOFDM24G[channel-1];
+	u8	powerlevelOFDM24G = priv->tx_pwr_level_ofdm_24g[channel - 1];
 
 	switch (priv->rf_chip) {
 	case RF_8225:
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index a74ef0125caa..a1274a5fdf44 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -473,9 +473,9 @@ struct r8192_priv {
 	u8 tx_pwr_level_cck[14];
 	u8 tx_pwr_level_cck_a[14];
 	u8 tx_pwr_level_cck_c[14];
-	u8		TxPowerLevelOFDM24G[14];
-	u8		TxPowerLevelOFDM24G_A[14];
-	u8		TxPowerLevelOFDM24G_C[14];
+	u8 tx_pwr_level_ofdm_24g[14];
+	u8 tx_pwr_level_ofdm_24g_a[14];
+	u8 tx_pwr_level_ofdm_24g_c[14];
 	u8		LegacyHTTxPowerDiff;
 	s8		RF_C_TxPwDiff;
 	u8		AntennaTxPwDiff[3];
-- 
2.39.0

