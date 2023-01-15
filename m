Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C4346B5
	for <linux-staging@lists.linux.dev>; Sun, 15 Jan 2023 20:21:02 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id v6so20695829ejg.6
        for <linux-staging@lists.linux.dev>; Sun, 15 Jan 2023 12:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DrcHpDAznuQD/6gaEXJ1kSYqjTyGuN9vC1MPEK+KavU=;
        b=HCBHzCmySYICU8fJw3pW7HWruJ7N3jyNt6rtktF+esocEOTMfhIInjQhr+DIGx2VrF
         vcEcfutoXXGM2O1unBl4+5gpprq5LTAFjSUuBBUORpezLJ/nifBcg9YJXEdNUuaQgtcY
         mFt+58sL6+Q6MMrKdLYdXoe82A17LlnC6cW4pgWwWn3DKiDvlucc2ccYu1bxLdygFzaP
         eTJe+9PYPBGYnK+NPXhvT8B3xYJr37pUoTMCGzTzMY33YeZK/Ik4odEZj2bWr7Tkhq5D
         jjMkJoUe6doYPHuOMUJj1aZDeqjlVAfnjoV1bkfMIxPJWn3fukE027rDw6ZKwulNxpUW
         oCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DrcHpDAznuQD/6gaEXJ1kSYqjTyGuN9vC1MPEK+KavU=;
        b=KBhucx+QYs45sIXGSRt4fj1/nnZA2gCoNqOs0fNw0yVdbqbvtyKascDKpeqGMsdhKA
         VHTv8xUIqUwGjSTWeoPXidGooGbc5SFza/wOOKnuC/eT1J4ujC7bxFwZTkc0bbl9oT1b
         lK8C9OXwjPHiIwimelNtX3PoxUA9qruGYDeTPVv0Tmbu8RSbFR84jLwvW872zOq7F/os
         pKnUdO0OoWhVViI0uieTo1WoYDoVOOjvzUfkPMu4tVWEym1ViKcBuODw0PqdpOmX6mZU
         R2NW5/GsDMWpzp0hrcB3jeHYm0pgTBvRQ9XBtp2AunYYyYRkMgEnr1yXipINKnmjBdXE
         hwFw==
X-Gm-Message-State: AFqh2koGtv2k1FIqL1Ldy8KZNeTWHUUhobLP5LvstpAo97Sr9FD+eRNY
	Kn6/vcdKFzppHY6S5IIIeRc=
X-Google-Smtp-Source: AMrXdXvL4w3nHAuHA3Yw8EuR0m70zgg8hIbGbFq2qz4vUpdj7MSscRkilh8NhayPJzkldNF/ZptjgA==
X-Received: by 2002:a17:906:3512:b0:862:e612:f00e with SMTP id r18-20020a170906351200b00862e612f00emr3446078eja.5.1673814060810;
        Sun, 15 Jan 2023 12:21:00 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id la19-20020a170907781300b007aee7ca1199sm11059196ejc.10.2023.01.15.12.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 12:21:00 -0800 (PST)
Date: Sun, 15 Jan 2023 21:20:58 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] staging: rtl8192e: Rename EEPROMTherma..,
 EEPROMAntPw.. and EEPROMTxPow..
Message-ID: <f708533cc24af1e08f34b681b9e8e8c01dc7b8f5.1673812850.git.philipp.g.hortmann@gmail.com>
References: <cover.1673812849.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1673812849.git.philipp.g.hortmann@gmail.com>

Rename variable EEPROMThermalMeter to eeprom_thermal_meter,
EEPROMAntPwDiff to eeprom_ant_pwr_diff and EEPROMTxPowerLevelOFDM24G to
eeprom_tx_pwr_level_ofdm24g to avoid CamelCase which is not accepted by
checkpatch.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 28 +++++++++----------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h  |  6 ++--
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index df8cdea5ee95..655a7966a876 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -366,22 +366,22 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 		}
 
 		if (!priv->AutoloadFailFlag)
-			priv->EEPROMThermalMeter = ((rtl92e_eeprom_read(dev,
+			priv->eeprom_thermal_meter = ((rtl92e_eeprom_read(dev,
 						   (EEPROM_ThermalMeter>>1))) &
 						   0xff00) >> 8;
 		else
-			priv->EEPROMThermalMeter = EEPROM_Default_ThermalMeter;
-		priv->tssi_13dBm = priv->EEPROMThermalMeter * 100;
+			priv->eeprom_thermal_meter = EEPROM_Default_ThermalMeter;
+		priv->tssi_13dBm = priv->eeprom_thermal_meter * 100;
 
 		if (priv->epromtype == EEPROM_93C46) {
 			if (!priv->AutoloadFailFlag) {
 				usValue = rtl92e_eeprom_read(dev,
 					  EEPROM_TxPwDiff_CrystalCap >> 1);
-				priv->EEPROMAntPwDiff = usValue & 0x0fff;
+				priv->eeprom_ant_pwr_diff = usValue & 0x0fff;
 				priv->eeprom_crystal_cap = (usValue & 0xf000)
 							 >> 12;
 			} else {
-				priv->EEPROMAntPwDiff =
+				priv->eeprom_ant_pwr_diff =
 					 EEPROM_Default_AntTxPowerDiff;
 				priv->eeprom_crystal_cap =
 					 EEPROM_Default_TxPwDiff_CrystalCap;
@@ -402,7 +402,7 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 						(EEPROM_TxPwIndex_OFDM_24G + i) >> 1);
 				else
 					usValue = EEPROM_Default_TxPower;
-				*((u16 *)(&priv->EEPROMTxPowerLevelOFDM24G[i]))
+				*((u16 *)(&priv->eeprom_tx_pwr_level_ofdm24g[i]))
 							 = usValue;
 			}
 		}
@@ -411,18 +411,18 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 				priv->tx_pwr_level_cck[i] =
 					 priv->EEPROMTxPowerLevelCCK[i];
 				priv->tx_pwr_level_ofdm_24g[i] =
-					 priv->EEPROMTxPowerLevelOFDM24G[i];
+					 priv->eeprom_tx_pwr_level_ofdm24g[i];
 			}
 			priv->legacy_ht_tx_pwr_diff =
 					 priv->eeprom_legacy_ht_tx_pwr_diff;
-			priv->antenna_tx_pwr_diff[0] = priv->EEPROMAntPwDiff & 0xf;
-			priv->antenna_tx_pwr_diff[1] = (priv->EEPROMAntPwDiff &
+			priv->antenna_tx_pwr_diff[0] = priv->eeprom_ant_pwr_diff & 0xf;
+			priv->antenna_tx_pwr_diff[1] = (priv->eeprom_ant_pwr_diff &
 							0xf0) >> 4;
-			priv->antenna_tx_pwr_diff[2] = (priv->EEPROMAntPwDiff &
+			priv->antenna_tx_pwr_diff[2] = (priv->eeprom_ant_pwr_diff &
 							0xf00) >> 8;
 			priv->crystal_cap = priv->eeprom_crystal_cap;
-			priv->thermal_meter[0] = priv->EEPROMThermalMeter & 0xf;
-			priv->thermal_meter[1] = (priv->EEPROMThermalMeter &
+			priv->thermal_meter[0] = priv->eeprom_thermal_meter & 0xf;
+			priv->thermal_meter[1] = (priv->eeprom_thermal_meter &
 						     0xf0) >> 4;
 		} else if (priv->epromtype == EEPROM_93C56) {
 
@@ -462,8 +462,8 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 			priv->antenna_tx_pwr_diff[1] = 0;
 			priv->antenna_tx_pwr_diff[2] = 0;
 			priv->crystal_cap = priv->eeprom_crystal_cap;
-			priv->thermal_meter[0] = priv->EEPROMThermalMeter & 0xf;
-			priv->thermal_meter[1] = (priv->EEPROMThermalMeter &
+			priv->thermal_meter[0] = priv->eeprom_thermal_meter & 0xf;
+			priv->thermal_meter[1] = (priv->eeprom_thermal_meter &
 						     0xf0) >> 4;
 		}
 	}
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 4a2b4f01507e..9cb717892dcb 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -423,13 +423,13 @@ struct r8192_priv {
 	u16 eeprom_chnl_plan;
 
 	u8 EEPROMTxPowerLevelCCK[14];
-	u8 EEPROMTxPowerLevelOFDM24G[14];
+	u8 eeprom_tx_pwr_level_ofdm24g[14];
 	u8 EEPROMRfACCKChnl1TxPwLevel[3];
 	u8 EEPROMRfAOfdmChnlTxPwLevel[3];
 	u8 EEPROMRfCCCKChnl1TxPwLevel[3];
 	u8 EEPROMRfCOfdmChnlTxPwLevel[3];
-	u16 EEPROMAntPwDiff;
-	u8 EEPROMThermalMeter;
+	u16 eeprom_ant_pwr_diff;
+	u8 eeprom_thermal_meter;
 	u8 eeprom_crystal_cap;
 
 	u8 eeprom_legacy_ht_tx_pwr_diff;
-- 
2.39.0

