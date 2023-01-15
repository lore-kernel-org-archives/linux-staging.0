Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA53D46B5
	for <linux-staging@lists.linux.dev>; Sun, 15 Jan 2023 20:20:42 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id vm8so63687799ejc.2
        for <linux-staging@lists.linux.dev>; Sun, 15 Jan 2023 12:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mMkhVziKXAjeT1z9GbTnob0aeQTSn+K+39faEGee5Co=;
        b=Le7lD0qmg+buPtR9hnglVFLeR+5+lKwOddiQD3VXDLUN5P0OptA/Amluf3e9R27HpW
         qzou6bZ0eAfhECQJ6nONdtX6J3/ob1KSOYWF1Wiktw5OwI3RXARtLK60zTbCxTIyEo8y
         rWyYYRtyMYNjD3W8E83TXcdJG9IZWbgd+P/UiptpJ1t3KshSLrjl/0bgVPwnIXksTjR8
         bEQxlq6ZyoNSIuaEOemMmDQZceKs7gZPBIGZqIOZKIpgQ+OEIdqFsIOfDfkBl2YV56vN
         ru2zKsmFt2q9xZ/cdDs92gmcrwjIpBZmeZonwen9vTqXAnzrWU4p2HmtW/uUYO2Oth2L
         HqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMkhVziKXAjeT1z9GbTnob0aeQTSn+K+39faEGee5Co=;
        b=h7ggunUkWGZRnb05X0eYvNnHCqVHKY2k5TxBXsBCluxwuP//qNbr4tBOZUXOyKjil9
         dbpIjUtg6yCyDFQOwuMTjZpkHoT1bQM00kAy/zQ5bhvlK43O0f8kP7CYh/9vU3bGxKTj
         W10PbExsyVKMENGj6po44orv1DnqWOaLVNTjJXdEY78pUagbyx999F2Dm/POUk/ZQkQP
         /gzI3DRcq8Ee28fKOr0UAcEJWK4YGQsfe/EY6GdltPj7ufVyLWfy55rGhukpJE/ap+bn
         UFmNxBblP5ovVrYs22rA4B5n7XYmTh3B8QKnpSLA1vS9xOtmrwIGazn7nfPg8kKsiAWS
         Hw8A==
X-Gm-Message-State: AFqh2kroVWxhBsPSVqd00StohLBLEA5Fv9ToPiZtGn09IweGk8c3J8Cb
	sAO8zodozLgjpD4GuoGHsqg=
X-Google-Smtp-Source: AMrXdXu2VnEeskyIc1jSIa8XyiiFyZfnRJs0piB7YA5I8TeHTSCbki5f6DtqE1y22D5M/1sBTm7wvQ==
X-Received: by 2002:a17:906:9c8e:b0:7c1:6150:ad2b with SMTP id fj14-20020a1709069c8e00b007c16150ad2bmr20587873ejc.0.1673814042378;
        Sun, 15 Jan 2023 12:20:42 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id ov38-20020a170906fc2600b0084d4733c428sm8525942ejb.88.2023.01.15.12.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 12:20:41 -0800 (PST)
Date: Sun, 15 Jan 2023 21:20:40 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] staging: rtl8192e: Rename SetBWModeIn.., SwChnlInPro..
 and ThermalMet..
Message-ID: <fc8bffbef60dba7aeb3bdfeab031c4e02e551c82.1673812849.git.philipp.g.hortmann@gmail.com>
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

Rename variable SetBWModeInProgress to set_bw_mode_in_progress,
SwChnlInProgress to sw_chnl_in_progress and ThermalMeter to thermal_meter
to avoid CamelCase which is not accepted by checkpatch.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c |  8 ++++----
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 14 +++++++-------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   |  6 +++---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c     | 10 +++++-----
 4 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 734a097ee268..1499e6b2fa39 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -421,8 +421,8 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 			priv->antenna_tx_pwr_diff[2] = (priv->EEPROMAntPwDiff &
 							0xf00) >> 8;
 			priv->CrystalCap = priv->EEPROMCrystalCap;
-			priv->ThermalMeter[0] = priv->EEPROMThermalMeter & 0xf;
-			priv->ThermalMeter[1] = (priv->EEPROMThermalMeter &
+			priv->thermal_meter[0] = priv->EEPROMThermalMeter & 0xf;
+			priv->thermal_meter[1] = (priv->EEPROMThermalMeter &
 						     0xf0) >> 4;
 		} else if (priv->epromtype == EEPROM_93C56) {
 
@@ -462,8 +462,8 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 			priv->antenna_tx_pwr_diff[1] = 0;
 			priv->antenna_tx_pwr_diff[2] = 0;
 			priv->CrystalCap = priv->EEPROMCrystalCap;
-			priv->ThermalMeter[0] = priv->EEPROMThermalMeter & 0xf;
-			priv->ThermalMeter[1] = (priv->EEPROMThermalMeter &
+			priv->thermal_meter[0] = priv->EEPROMThermalMeter & 0xf;
+			priv->thermal_meter[1] = (priv->EEPROMThermalMeter &
 						     0xf0) >> 4;
 		}
 	}
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 59b2e8385ef7..2af6763707d0 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -954,7 +954,7 @@ u8 rtl92e_set_channel(struct net_device *dev, u8 channel)
 		netdev_err(dev, "%s(): Driver is not initialized\n", __func__);
 		return false;
 	}
-	if (priv->SwChnlInProgress)
+	if (priv->sw_chnl_in_progress)
 		return false;
 
 
@@ -987,7 +987,7 @@ u8 rtl92e_set_channel(struct net_device *dev, u8 channel)
 		break;
 	}
 
-	priv->SwChnlInProgress = true;
+	priv->sw_chnl_in_progress = true;
 	if (channel == 0)
 		channel = 1;
 
@@ -998,7 +998,7 @@ u8 rtl92e_set_channel(struct net_device *dev, u8 channel)
 
 	if (priv->up)
 		_rtl92e_phy_switch_channel_work_item(dev);
-	priv->SwChnlInProgress = false;
+	priv->sw_chnl_in_progress = false;
 	return true;
 }
 
@@ -1101,7 +1101,7 @@ static void _rtl92e_set_bw_mode_work_item(struct net_device *dev)
 	u8 regBwOpMode;
 
 	if (priv->rf_chip == RF_PSEUDO_11N) {
-		priv->SetBWModeInProgress = false;
+		priv->set_bw_mode_in_progress = false;
 		return;
 	}
 	if (!priv->up) {
@@ -1190,7 +1190,7 @@ static void _rtl92e_set_bw_mode_work_item(struct net_device *dev)
 	}
 
 	atomic_dec(&(priv->rtllib->atm_swbw));
-	priv->SetBWModeInProgress = false;
+	priv->set_bw_mode_in_progress = false;
 }
 
 void rtl92e_set_bw_mode(struct net_device *dev, enum ht_channel_width bandwidth,
@@ -1199,11 +1199,11 @@ void rtl92e_set_bw_mode(struct net_device *dev, enum ht_channel_width bandwidth,
 	struct r8192_priv *priv = rtllib_priv(dev);
 
 
-	if (priv->SetBWModeInProgress)
+	if (priv->set_bw_mode_in_progress)
 		return;
 
 	atomic_inc(&(priv->rtllib->atm_swbw));
-	priv->SetBWModeInProgress = true;
+	priv->set_bw_mode_in_progress = true;
 
 	priv->CurrentChannelBW = bandwidth;
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index ed9ddb2f987b..edc02a61a92d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -435,12 +435,12 @@ struct r8192_priv {
 	u8 EEPROMLegacyHTTxPowerDiff;
 
 	u8 CrystalCap;
-	u8 ThermalMeter[2];
+	u8 thermal_meter[2];
 
-	u8 SwChnlInProgress;
+	u8 sw_chnl_in_progress;
 	u8 SwChnlStage;
 	u8 SwChnlStep;
-	u8 SetBWModeInProgress;
+	u8 set_bw_mode_in_progress;
 
 	u8 n_cur_40mhz_prime_sc;
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 0e278b872470..96c45e5172bd 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -794,11 +794,11 @@ static void _rtl92e_dm_tx_power_tracking_cb_thermal(struct net_device *dev)
 		return;
 	if (tmpRegA >= 12)
 		tmpRegA = 12;
-	priv->ThermalMeter[0] = ThermalMeterVal;
-	priv->ThermalMeter[1] = ThermalMeterVal;
+	priv->thermal_meter[0] = ThermalMeterVal;
+	priv->thermal_meter[1] = ThermalMeterVal;
 
-	if (priv->ThermalMeter[0] >= (u8)tmpRegA) {
-		tmpOFDMindex = tmpCCK20Mindex = 6+(priv->ThermalMeter[0] -
+	if (priv->thermal_meter[0] >= (u8)tmpRegA) {
+		tmpOFDMindex = tmpCCK20Mindex = 6+(priv->thermal_meter[0] -
 			      (u8)tmpRegA);
 		tmpCCK40Mindex = tmpCCK20Mindex - 6;
 		if (tmpOFDMindex >= OFDM_Table_Length)
@@ -808,7 +808,7 @@ static void _rtl92e_dm_tx_power_tracking_cb_thermal(struct net_device *dev)
 		if (tmpCCK40Mindex >= CCK_Table_length)
 			tmpCCK40Mindex = CCK_Table_length-1;
 	} else {
-		tmpval = (u8)tmpRegA - priv->ThermalMeter[0];
+		tmpval = (u8)tmpRegA - priv->thermal_meter[0];
 		if (tmpval >= 6) {
 			tmpOFDMindex = 0;
 			tmpCCK20Mindex = 0;
-- 
2.39.0

