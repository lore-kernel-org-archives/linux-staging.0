Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A836046B5
	for <linux-staging@lists.linux.dev>; Sun, 15 Jan 2023 20:20:52 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id bk15so6206345ejb.9
        for <linux-staging@lists.linux.dev>; Sun, 15 Jan 2023 12:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C3D8UAIpPdh0OnnneROpH+4kQYTJrI2bK2LOL7v5ysU=;
        b=aiV7jbke00Xwy3+nc4Ypx6fdmK1d7XS+jTfHdfkjIPxwsC+IRsIwmtugjczEzbPknh
         WYXi9qKISR2FGWSqw3GlrkithkJ7cMN4Cl2yJ6Hf4kB06Z0Fs8gNyKKzxI42Oky8XidG
         oN8oxl+AfaFAHF1GXMQzfSBRGIBlQrWSyNNHRUmnCXunExrvlrW/DHiEFM1QdUiitH7j
         sF1c4nBFRLVLH0yAl5ETTscXf0FjeqxjWxWs3F36r+VOEFPAR68SWusV/oXDx+OYZgWz
         7sMjHsHu/DC9tA/aHyOgkahB1YmpmMn0Jjfo2Il+Hwzh11TyEaKNCsVlmLx4WsgciNJO
         w4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3D8UAIpPdh0OnnneROpH+4kQYTJrI2bK2LOL7v5ysU=;
        b=Gjnz4mTS2Sp7RmisXsw6cKYrlVtfvaHPh7Pxi90I9hUabKnbRJExL2MYTFxzr61+Yh
         nYJ0qYBmYb/bFiapAaN0/+ncVrbcuCEwLMHonmJRcAVvJ21pI7T3nT3DQgutbMTchj35
         tYVmtWHMb3IkpT6vzqlxbWCE4ALVrHTRM94kpsszIXkGkqSuo0bz3TaMo96xbob958lQ
         /yFSitOs66K+IW5uikXmMKtprmlNQ1fOSIGqCEr8eItAxi2XtCrYE+qkEKtl8H3s62Tj
         nxShi5ibY460+UduBQRT4Nfug4emD66cNUzEm6gvTQXfFL7rJj5OmlKYOcsH3qjpoTq6
         vKMA==
X-Gm-Message-State: AFqh2kpZH/w18gdO6cDQlz8oZeJPMlHSLkJMGVyDZtKUK1b9VZV/BMZ0
	3jqse4EUcw0nzNbRTO4z0cBi8RhAp/M=
X-Google-Smtp-Source: AMrXdXvVfX2+tQcOf7SUfnG8hQNx2q+j57JB3WuUXqs7Bu1yrocPVJW/Sfvp1k0afgZT7qC+g4H0/g==
X-Received: by 2002:a17:906:ccc1:b0:7c1:81d2:1e55 with SMTP id ot1-20020a170906ccc100b007c181d21e55mr20036293ejb.6.1673814051055;
        Sun, 15 Jan 2023 12:20:51 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id lb14-20020a170907784e00b007c0fd177c0bsm10864347ejc.46.2023.01.15.12.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 12:20:50 -0800 (PST)
Date: Sun, 15 Jan 2023 21:20:48 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] staging: rtl8192e: Rename CrystalCap,
 EEPROMLegacyHTT.. and EEPROMCrys..
Message-ID: <16337153218e9d1e25f90ca17774d1246086f1a7.1673812849.git.philipp.g.hortmann@gmail.com>
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

Rename variable CrystalCap to crystal_cap, EEPROMLegacyHTTxPowerDiff to
eeprom_legacy_ht_tx_pwr_diff and EEPROMCrystalCap to eeprom_crystal_cap
to avoid CamelCase which is not accepted by checkpatch.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 16 ++++++++--------
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c |  2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   |  6 +++---
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 1499e6b2fa39..df8cdea5ee95 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -355,14 +355,14 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 		if (!priv->AutoloadFailFlag) {
 			tempval = (rtl92e_eeprom_read(dev,
 						      (EEPROM_RFInd_PowerDiff >> 1))) & 0xff;
-			priv->EEPROMLegacyHTTxPowerDiff = tempval & 0xf;
+			priv->eeprom_legacy_ht_tx_pwr_diff = tempval & 0xf;
 
 			if (tempval&0x80)
 				priv->rf_type = RF_1T2R;
 			else
 				priv->rf_type = RF_2T4R;
 		} else {
-			priv->EEPROMLegacyHTTxPowerDiff = 0x04;
+			priv->eeprom_legacy_ht_tx_pwr_diff = 0x04;
 		}
 
 		if (!priv->AutoloadFailFlag)
@@ -378,12 +378,12 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 				usValue = rtl92e_eeprom_read(dev,
 					  EEPROM_TxPwDiff_CrystalCap >> 1);
 				priv->EEPROMAntPwDiff = usValue & 0x0fff;
-				priv->EEPROMCrystalCap = (usValue & 0xf000)
+				priv->eeprom_crystal_cap = (usValue & 0xf000)
 							 >> 12;
 			} else {
 				priv->EEPROMAntPwDiff =
 					 EEPROM_Default_AntTxPowerDiff;
-				priv->EEPROMCrystalCap =
+				priv->eeprom_crystal_cap =
 					 EEPROM_Default_TxPwDiff_CrystalCap;
 			}
 
@@ -414,13 +414,13 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 					 priv->EEPROMTxPowerLevelOFDM24G[i];
 			}
 			priv->legacy_ht_tx_pwr_diff =
-					 priv->EEPROMLegacyHTTxPowerDiff;
+					 priv->eeprom_legacy_ht_tx_pwr_diff;
 			priv->antenna_tx_pwr_diff[0] = priv->EEPROMAntPwDiff & 0xf;
 			priv->antenna_tx_pwr_diff[1] = (priv->EEPROMAntPwDiff &
 							0xf0) >> 4;
 			priv->antenna_tx_pwr_diff[2] = (priv->EEPROMAntPwDiff &
 							0xf00) >> 8;
-			priv->CrystalCap = priv->EEPROMCrystalCap;
+			priv->crystal_cap = priv->eeprom_crystal_cap;
 			priv->thermal_meter[0] = priv->EEPROMThermalMeter & 0xf;
 			priv->thermal_meter[1] = (priv->EEPROMThermalMeter &
 						     0xf0) >> 4;
@@ -457,11 +457,11 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 					 priv->EEPROMRfCOfdmChnlTxPwLevel[2];
 			}
 			priv->legacy_ht_tx_pwr_diff =
-				 priv->EEPROMLegacyHTTxPowerDiff;
+				 priv->eeprom_legacy_ht_tx_pwr_diff;
 			priv->antenna_tx_pwr_diff[0] = 0;
 			priv->antenna_tx_pwr_diff[1] = 0;
 			priv->antenna_tx_pwr_diff[2] = 0;
-			priv->CrystalCap = priv->EEPROMCrystalCap;
+			priv->crystal_cap = priv->eeprom_crystal_cap;
 			priv->thermal_meter[0] = priv->EEPROMThermalMeter & 0xf;
 			priv->thermal_meter[1] = (priv->EEPROMThermalMeter &
 						     0xf0) >> 4;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 2af6763707d0..6da76ea16ff1 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -544,7 +544,7 @@ static bool _rtl92e_bb_config_para_file(struct net_device *dev)
 				  (bXBTxAGC|bXCTxAGC|bXDTxAGC), dwRegValue);
 
 
-		dwRegValue = priv->CrystalCap;
+		dwRegValue = priv->crystal_cap;
 		rtl92e_set_bb_reg(dev, rFPGA0_AnalogParameter1, bXtalCap92x,
 				  dwRegValue);
 	}
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index edc02a61a92d..4a2b4f01507e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -430,11 +430,11 @@ struct r8192_priv {
 	u8 EEPROMRfCOfdmChnlTxPwLevel[3];
 	u16 EEPROMAntPwDiff;
 	u8 EEPROMThermalMeter;
-	u8 EEPROMCrystalCap;
+	u8 eeprom_crystal_cap;
 
-	u8 EEPROMLegacyHTTxPowerDiff;
+	u8 eeprom_legacy_ht_tx_pwr_diff;
 
-	u8 CrystalCap;
+	u8 crystal_cap;
 	u8 thermal_meter[2];
 
 	u8 sw_chnl_in_progress;
-- 
2.39.0

