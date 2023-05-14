Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA291C2B
	for <linux-staging@lists.linux.dev>; Sun, 14 May 2023 12:00:45 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f4ad71b00eso30207985e9.2
        for <linux-staging@lists.linux.dev>; Sun, 14 May 2023 05:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684065643; x=1686657643;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3nX7HINFrxMEhxaCqGf3LGlV+gteAv1IdnxosamIx7A=;
        b=Dr6v7B1rjIQ6cbBpQdeRMy0E1cyqezkuvo/0hVD0Gruvv07qrAw2sXD0gmOPVN6KlT
         LDLa3To/hKA1Z4CGrWUQavTJ++U9KLvK3jBAKMlWqv7XQH0UM8HVjnGhfFHIGy8EqWh3
         hDRtDUbY342QFJUraLr9QRWrE8ngqAN035G1zeu6ETn9i9mVXYZVWd1BJlj4F2giV0Ei
         XZbvRX+pNWByKw5/NUgpqWT2S8ObmUDvZy+6X02Xx7ZxF1i6y82vL8sXwpCsv5FCAZ3l
         xynOOCatFE3xVgkuUyQC5eEIeCzySSC+Lu4xhd0291jwonn412kDjLT/F4MizULe+Pc2
         nE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684065643; x=1686657643;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3nX7HINFrxMEhxaCqGf3LGlV+gteAv1IdnxosamIx7A=;
        b=l4KQThKdvl05tlCOr2E44oZvR8SW84+a9zV/YStDSr9vmS8z5c82giXUNs9Il3SVl6
         pouXD5H7AJHNJ1Utp+/2xDE7tL99fXo3V/j89Uxvh5oDwvGoVElfAITfaR4hW0yiLB67
         KEwKMujl68XY+S4hRbyomNVHMyCrRKDRQpoFxveCaiqjSR8tIQyQsDIuuMdxzplP40Ya
         cgksc5/2l+gFdIEblOigp4iO4toDSO4cT3nC0f3X6DE7i0B/Tb/GDccEuIT0reeUfwAN
         CEaNAMJadyEDkfsd0434QrViYA43je4+5Zo9hJR3eubjJhSUd2Jo3JY8ldQ48PmE7zIS
         W9mg==
X-Gm-Message-State: AC+VfDxKjFo1h4gJpErZOgYEFeNHuki2LSatXz/9LpxfIC08OSso/UX3
	IfU/23IoCm+OWaEPHd9bdBOlGeSnWQ==
X-Google-Smtp-Source: ACHHUZ7zQkS0uOxnkUk7BkBSgu7v00K89T0NVU3LBHILNLBaHW51Sd8xiMTqlJMFDMy/cBRGAzKkiQ==
X-Received: by 2002:a05:600c:b4b:b0:3f4:2897:4eb7 with SMTP id k11-20020a05600c0b4b00b003f428974eb7mr13928246wmr.38.1684065643352;
        Sun, 14 May 2023 05:00:43 -0700 (PDT)
Received: from koolguy (dslb-002-205-192-117.002.205.pools.vodafone-ip.de. [2.205.192.117])
        by smtp.gmail.com with ESMTPSA id 14-20020a05600c230e00b003f4248dcfcbsm20752446wmo.30.2023.05.14.05.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 05:00:42 -0700 (PDT)
Date: Sun, 14 May 2023 14:00:40 +0200
From: Dalvin-Ehinoma Noah Aiguobas <pharcodra@gmail.com>
To: gregkh@linuxfoundation.org
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: sm750fb: fix camelCase names
Message-ID: <20230514120040.GA10240@koolguy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Adhere to Linux kernel coding style.

Reported by checkpatch:

Avoid CamelCase:
Rename variables and functions in ddk750_sii164.c which cause styleproblem.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <pharcodra@gmail.com>
---
 drivers/staging/sm750fb/ddk750_sii164.c | 104 ++++++++++++------------
 1 file changed, 52 insertions(+), 52 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index 3da1796cd7aa..4b8f9e617a91 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -12,11 +12,11 @@
 #define USE_HW_I2C
 
 #ifdef USE_HW_I2C
-    #define i2cWriteReg sm750_hw_i2c_write_reg
-    #define i2cReadReg  sm750_hw_i2c_read_reg
+    #define i2c_write_reg sm750_hw_i2c_write_reg
+    #define i2c_read_reg  sm750_hw_i2c_read_reg
 #else
-    #define i2cWriteReg sm750_sw_i2c_write_reg
-    #define i2cReadReg  sm750_sw_i2c_read_reg
+    #define i2c_write_reg sm750_sw_i2c_write_reg
+    #define i2c_read_reg  sm750_sw_i2c_read_reg
 #endif
 
 /* SII164 Vendor and Device ID */
@@ -25,7 +25,7 @@
 
 #ifdef SII164_FULL_FUNCTIONS
 /* Name of the DVI Controller chip */
-static char *gDviCtrlChipName = "Silicon Image SiI 164";
+static char *g_dvi_ctrl_chip_name = "Silicon Image SiI 164";
 #endif
 
 /*
@@ -37,14 +37,14 @@ static char *gDviCtrlChipName = "Silicon Image SiI 164";
  */
 unsigned short sii164_get_vendor_id(void)
 {
-	unsigned short vendorID;
+	unsigned short vendor_ID;
 
-	vendorID = ((unsigned short)i2cReadReg(SII164_I2C_ADDRESS,
+	vendor_ID = ((unsigned short)i2c_read_reg(SII164_I2C_ADDRESS,
 					       SII164_VENDOR_ID_HIGH) << 8) |
-		   (unsigned short)i2cReadReg(SII164_I2C_ADDRESS,
+		   (unsigned short)i2c_read_reg(SII164_I2C_ADDRESS,
 					      SII164_VENDOR_ID_LOW);
 
-	return vendorID;
+	return vendor_ID;
 }
 
 /*
@@ -56,14 +56,14 @@ unsigned short sii164_get_vendor_id(void)
  */
 unsigned short sii164GetDeviceID(void)
 {
-	unsigned short deviceID;
+	unsigned short device_ID;
 
-	deviceID = ((unsigned short)i2cReadReg(SII164_I2C_ADDRESS,
+	device_ID = ((unsigned short)i2c_read_reg(SII164_I2C_ADDRESS,
 					       SII164_DEVICE_ID_HIGH) << 8) |
-		   (unsigned short)i2cReadReg(SII164_I2C_ADDRESS,
+		   (unsigned short)i2c_read_reg(SII164_I2C_ADDRESS,
 					      SII164_DEVICE_ID_LOW);
 
-	return deviceID;
+	return device_ID;
 }
 
 /*
@@ -176,7 +176,7 @@ long sii164InitChip(unsigned char edge_select,
 		else
 			config |= SII164_CONFIGURATION_VSYNC_AS_IS;
 
-		i2cWriteReg(SII164_I2C_ADDRESS, SII164_CONFIGURATION, config);
+		i2c_write_reg(SII164_I2C_ADDRESS, SII164_CONFIGURATION, config);
 
 		/*
 		 * De-skew enabled with default 111b value.
@@ -214,7 +214,7 @@ long sii164InitChip(unsigned char edge_select,
 			config |= SII164_DESKEW_8_STEP;
 			break;
 		}
-		i2cWriteReg(SII164_I2C_ADDRESS, SII164_DESKEW, config);
+		i2c_write_reg(SII164_I2C_ADDRESS, SII164_DESKEW, config);
 
 		/* Enable/Disable Continuous Sync. */
 		if (continuous_sync_enable == 0)
@@ -231,12 +231,12 @@ long sii164InitChip(unsigned char edge_select,
 		/* Set the PLL Filter value */
 		config |= ((pll_filter_value & 0x07) << 1);
 
-		i2cWriteReg(SII164_I2C_ADDRESS, SII164_PLL, config);
+		i2c_write_reg(SII164_I2C_ADDRESS, SII164_PLL, config);
 
 		/* Recover from Power Down and enable output. */
-		config = i2cReadReg(SII164_I2C_ADDRESS, SII164_CONFIGURATION);
+		config = i2c_read_reg(SII164_I2C_ADDRESS, SII164_CONFIGURATION);
 		config |= SII164_CONFIGURATION_POWER_NORMAL;
-		i2cWriteReg(SII164_I2C_ADDRESS, SII164_CONFIGURATION, config);
+		i2c_write_reg(SII164_I2C_ADDRESS, SII164_CONFIGURATION, config);
 
 		return 0;
 	}
@@ -269,7 +269,7 @@ void sii164ResetChip(void)
  */
 char *sii164GetChipString(void)
 {
-	return gDviCtrlChipName;
+	return g_dvi_ctrl_chip_name;
 }
 
 /*
@@ -279,53 +279,53 @@ char *sii164GetChipString(void)
  *  Input:
  *      powerUp - Flag to set the power down or up
  */
-void sii164SetPower(unsigned char powerUp)
+void sii164SetPower(unsigned char power_up)
 {
 	unsigned char config;
 
-	config = i2cReadReg(SII164_I2C_ADDRESS, SII164_CONFIGURATION);
-	if (powerUp == 1) {
+	config = i2c_read_reg(SII164_I2C_ADDRESS, SII164_CONFIGURATION);
+	if (power_up == 1) {
 		/* Power up the chip */
 		config &= ~SII164_CONFIGURATION_POWER_MASK;
 		config |= SII164_CONFIGURATION_POWER_NORMAL;
-		i2cWriteReg(SII164_I2C_ADDRESS, SII164_CONFIGURATION, config);
+		i2c_write_reg(SII164_I2C_ADDRESS, SII164_CONFIGURATION, config);
 	} else {
 		/* Power down the chip */
 		config &= ~SII164_CONFIGURATION_POWER_MASK;
 		config |= SII164_CONFIGURATION_POWER_DOWN;
-		i2cWriteReg(SII164_I2C_ADDRESS, SII164_CONFIGURATION, config);
+		i2c_write_reg(SII164_I2C_ADDRESS, SII164_CONFIGURATION, config);
 	}
 }
 
 /*
- *  sii164SelectHotPlugDetectionMode
+ *  sii164_select_hot_plug_detection_mode
  *      This function selects the mode of the hot plug detection.
  */
 static
-void sii164SelectHotPlugDetectionMode(enum sii164_hot_plug_mode hotPlugMode)
+void sii164_select_hot_plug_detection_mode(enum sii164_hot_plug_mode hot_plug_mode)
 {
-	unsigned char detectReg;
+	unsigned char detect_reg;
 
-	detectReg = i2cReadReg(SII164_I2C_ADDRESS, SII164_DETECT) &
+	detect_reg = i2c_read_reg(SII164_I2C_ADDRESS, SII164_DETECT) &
 		    ~SII164_DETECT_MONITOR_SENSE_OUTPUT_FLAG;
-	switch (hotPlugMode) {
+	switch (hot_plug_mode) {
 	case SII164_HOTPLUG_DISABLE:
-		detectReg |= SII164_DETECT_MONITOR_SENSE_OUTPUT_HIGH;
+		detect_reg |= SII164_DETECT_MONITOR_SENSE_OUTPUT_HIGH;
 		break;
 	case SII164_HOTPLUG_USE_MDI:
-		detectReg &= ~SII164_DETECT_INTERRUPT_MASK;
-		detectReg |= SII164_DETECT_INTERRUPT_BY_HTPLG_PIN;
-		detectReg |= SII164_DETECT_MONITOR_SENSE_OUTPUT_MDI;
+		detect_reg &= ~SII164_DETECT_INTERRUPT_MASK;
+		detect_reg |= SII164_DETECT_INTERRUPT_BY_HTPLG_PIN;
+		detect_reg |= SII164_DETECT_MONITOR_SENSE_OUTPUT_MDI;
 		break;
 	case SII164_HOTPLUG_USE_RSEN:
-		detectReg |= SII164_DETECT_MONITOR_SENSE_OUTPUT_RSEN;
+		detect_reg |= SII164_DETECT_MONITOR_SENSE_OUTPUT_RSEN;
 		break;
 	case SII164_HOTPLUG_USE_HTPLG:
-		detectReg |= SII164_DETECT_MONITOR_SENSE_OUTPUT_HTPLG;
+		detect_reg |= SII164_DETECT_MONITOR_SENSE_OUTPUT_HTPLG;
 		break;
 	}
 
-	i2cWriteReg(SII164_I2C_ADDRESS, SII164_DETECT, detectReg);
+	i2c_write_reg(SII164_I2C_ADDRESS, SII164_DETECT, detect_reg);
 }
 
 /*
@@ -334,19 +334,19 @@ void sii164SelectHotPlugDetectionMode(enum sii164_hot_plug_mode hotPlugMode)
  *
  *  enableHotPlug   - Enable (=1) / disable (=0) Hot Plug detection
  */
-void sii164EnableHotPlugDetection(unsigned char enableHotPlug)
+void sii164EnableHotPlugDetection(unsigned char enable_hot_plug)
 {
-	unsigned char detectReg;
+	unsigned char detect_reg;
 
-	detectReg = i2cReadReg(SII164_I2C_ADDRESS, SII164_DETECT);
+	detect_reg = i2c_read_reg(SII164_I2C_ADDRESS, SII164_DETECT);
 
 	/* Depending on each DVI controller, need to enable the hot plug based
 	 * on each individual chip design.
 	 */
-	if (enableHotPlug != 0)
-		sii164SelectHotPlugDetectionMode(SII164_HOTPLUG_USE_MDI);
+	if (enable_hot_plug != 0)
+		sii164_select_hot_plug_detection_mode(SII164_HOTPLUG_USE_MDI);
 	else
-		sii164SelectHotPlugDetectionMode(SII164_HOTPLUG_DISABLE);
+		sii164_select_hot_plug_detection_mode(SII164_HOTPLUG_DISABLE);
 }
 
 /*
@@ -359,11 +359,11 @@ void sii164EnableHotPlugDetection(unsigned char enableHotPlug)
  */
 unsigned char sii164IsConnected(void)
 {
-	unsigned char hotPlugValue;
+	unsigned char hot_plug_value;
 
-	hotPlugValue = i2cReadReg(SII164_I2C_ADDRESS, SII164_DETECT) &
+	hot_plug_value = i2c_read_reg(SII164_I2C_ADDRESS, SII164_DETECT) &
 		       SII164_DETECT_HOT_PLUG_STATUS_MASK;
-	if (hotPlugValue == SII164_DETECT_HOT_PLUG_STATUS_ON)
+	if (hot_plug_value == SII164_DETECT_HOT_PLUG_STATUS_ON)
 		return 1;
 	else
 		return 0;
@@ -379,11 +379,11 @@ unsigned char sii164IsConnected(void)
  */
 unsigned char sii164CheckInterrupt(void)
 {
-	unsigned char detectReg;
+	unsigned char detect_reg;
 
-	detectReg = i2cReadReg(SII164_I2C_ADDRESS, SII164_DETECT) &
+	detect_reg = i2c_read_reg(SII164_I2C_ADDRESS, SII164_DETECT) &
 		    SII164_DETECT_MONITOR_STATE_MASK;
-	if (detectReg == SII164_DETECT_MONITOR_STATE_CHANGE)
+	if (detect_reg == SII164_DETECT_MONITOR_STATE_CHANGE)
 		return 1;
 	else
 		return 0;
@@ -395,12 +395,12 @@ unsigned char sii164CheckInterrupt(void)
  */
 void sii164ClearInterrupt(void)
 {
-	unsigned char detectReg;
+	unsigned char detect_reg;
 
 	/* Clear the MDI interrupt */
-	detectReg = i2cReadReg(SII164_I2C_ADDRESS, SII164_DETECT);
-	i2cWriteReg(SII164_I2C_ADDRESS, SII164_DETECT,
-		    detectReg | SII164_DETECT_MONITOR_STATE_CLEAR);
+	detect_reg = i2c_read_reg(SII164_I2C_ADDRESS, SII164_DETECT);
+	i2c_write_reg(SII164_I2C_ADDRESS, SII164_DETECT,
+		      detect_reg | SII164_DETECT_MONITOR_STATE_CLEAR);
 }
 
 #endif
-- 
2.25.1

