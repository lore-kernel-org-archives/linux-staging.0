Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8111728E3C
	for <linux-staging@lists.linux.dev>; Mon,  4 Dec 2023 23:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9LEl0Ll"
Received: by mail-lj1-f193.google.com with SMTP id 38308e7fff4ca-2c9f099cf3aso36559991fa.1
        for <linux-staging@lists.linux.dev>; Mon, 04 Dec 2023 15:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701732847; x=1702337647; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EaLwUM/X6BTpPGziK4zF0Fhh5e9dkHy8RdQ/gNBLN5s=;
        b=F9LEl0Llvr5OE4E0lGrDlxG/LLPxMCTnqrYJEfeHhmMKur6SNC4pRmARI8BA27TMq5
         mCx3i/UcUZqcbXwNEEhxeymWh9Z3w5Wg3J0cANUdrmKdLAv19HxtTtgTCEF9tWvaYa9A
         cYeOkv08LkGE0ri8VQSrsIEmdHFn16v8GD5bXbUNLs0BjJCFQcKVo2ZHUUQ8QuqJ2ESQ
         YE8DZXfs7d1K2AXYUrwvQK4xw8XeYfs0Q7nRHmeMjEhlmCk95aPUX0EtFohsOT5Rj95t
         p80pWza414sFUz3Y/zSKSLasAtfKuyiZdQ7xa/hZqn5Z10LviP8jp57m5iEw/lfPTrB+
         mCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701732847; x=1702337647;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EaLwUM/X6BTpPGziK4zF0Fhh5e9dkHy8RdQ/gNBLN5s=;
        b=ZGbh2bgJ0jXWEeaAA21qS9wwg3TR2i8vSknXPyXW2uuHUqJWmhbcyMeaJVtnXEcM1r
         hFAVDw1OPdX0SE3Dmv7kxHB6ZUjmZOA5DRj7UGEjqKDvnoHEapmcrJmJbXWbL2xmTzzY
         ne4Fnpk48MjqmUC/E0UJ1Ndveo4n1YcnnPJB4KNRPM7A5aswByra01SwdRvKpgAndBSh
         OXrZXour/dL0LlCcXyPsPs1DKfddUhXmdPL4qt2K5Zq68dekGNtdLcxSnTTHmJr8nI/F
         XTN4sUEaCD495dmerj23N3sNXrLYnzqvsfMFW+Yft57tVtt895mCF2Ela9tYtrTm5BWI
         Ho2Q==
X-Gm-Message-State: AOJu0YyQIUYxw21teFOPgquHnH74f8t1Zm4nsyQQhkHgKg0yz/bmdx43
	Ym3Frs1GCKkd0ADgM2MLqKs=
X-Google-Smtp-Source: AGHT+IG1kI3tcjDICa5UlVodr+K6x5G4TeGugcFIxrGcLidlC2Bh+3pWukfuyz54nhAU360PrzdAhQ==
X-Received: by 2002:a2e:9184:0:b0:2c9:f7d3:7d61 with SMTP id f4-20020a2e9184000000b002c9f7d37d61mr1683049ljg.82.1701732847164;
        Mon, 04 Dec 2023 15:34:07 -0800 (PST)
Received: from localhost (86-83-145-178.fixed.kpn.net. [86.83.145.178])
        by smtp.gmail.com with ESMTPSA id i16-20020a1709061cd000b009b2cc87b8c3sm5774701ejh.52.2023.12.04.15.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 15:34:06 -0800 (PST)
From: laburnumT <laburnumtec@gmail.com>
X-Google-Original-From: laburnumT <laburnumTec@gmail.com>
Date: Tue, 5 Dec 2023 00:34:04 +0100
To: gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: sm750fb: fix coding style camelCase issue
Message-ID: <20231204233404.goxljpo2jpwlotig@flo-XPS-13-7390>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="votmzjuwq6leiwsp"
Content-Disposition: inline


--votmzjuwq6leiwsp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Fixed camelCase issues in ddk750_sii164.c and impacted files.

Signed-off-by: laburnumT <laburnumTec@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c    |  16 +--
 drivers/staging/sm750fb/ddk750_sii164.c | 130 ++++++++++++------------
 drivers/staging/sm750fb/ddk750_sii164.h |  16 +--
 3 files changed, 81 insertions(+), 81 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb=
/ddk750_dvi.c
index 8b81e8642f9e..40d92e4bd1f9 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -16,15 +16,15 @@ static struct dvi_ctrl_device dcft_supported_dvi_contro=
ller[] =3D {
 	{
 		.init =3D sii164_init_chip,
 		.get_vendor_id =3D sii164_get_vendor_id,
-		.get_device_id =3D sii164GetDeviceID,
+		.get_device_id =3D sii164_get_device_id,
 #ifdef SII164_FULL_FUNCTIONS
-		.reset_chip =3D sii164ResetChip,
-		.get_chip_string =3D sii164GetChipString,
-		.set_power =3D sii164SetPower,
-		.enable_hot_plug_detection =3D sii164EnableHotPlugDetection,
-		.is_connected =3D sii164IsConnected,
-		.check_interrupt =3D sii164CheckInterrupt,
-		.clear_interrupt =3D sii164ClearInterrupt,
+		.reset_chip =3D sii164_reset_chip,
+		.get_chip_string =3D sii164_get_chip_string,
+		.set_power =3D sii164_set_power,
+		.enable_hot_plug_detection =3D sii164_enable_hotplug_detection,
+		.is_connected =3D sii164_is_connected,
+		.check_interrupt =3D sii164_check_interrupt,
+		.clear_interrupt =3D sii164_clear_interrupt,
 #endif
 	},
 #endif
diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm75=
0fb/ddk750_sii164.c
index 2532b60245ac..596a00101352 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -25,7 +25,7 @@
=20
 #ifdef SII164_FULL_FUNCTIONS
 /* Name of the DVI Controller chip */
-static char *gDviCtrlChipName =3D "Silicon Image SiI 164";
+static char *g_dvi_ctrl_chip_name =3D "Silicon Image SiI 164";
 #endif
=20
 /*
@@ -37,33 +37,33 @@ static char *gDviCtrlChipName =3D "Silicon Image SiI 16=
4";
  */
 unsigned short sii164_get_vendor_id(void)
 {
-	unsigned short vendorID;
+	unsigned short vendor_id;
=20
-	vendorID =3D ((unsigned short)i2cReadReg(SII164_I2C_ADDRESS,
-					       SII164_VENDOR_ID_HIGH) << 8) |
-		   (unsigned short)i2cReadReg(SII164_I2C_ADDRESS,
-					      SII164_VENDOR_ID_LOW);
+	vendor_id =3D ((unsigned short)i2cReadReg(SII164_I2C_ADDRESS,
+						SII164_VENDOR_ID_HIGH) << 8) |
+		    (unsigned short)i2cReadReg(SII164_I2C_ADDRESS,
+					       SII164_VENDOR_ID_LOW);
=20
-	return vendorID;
+	return vendor_id;
 }
=20
 /*
- *  sii164GetDeviceID
+ *  sii164_get_device_id
  *      This function gets the device ID of the DVI controller chip.
  *
  *  Output:
  *      Device ID
  */
-unsigned short sii164GetDeviceID(void)
+unsigned short sii164_get_device_id(void)
 {
-	unsigned short deviceID;
+	unsigned short device_id;
=20
-	deviceID =3D ((unsigned short)i2cReadReg(SII164_I2C_ADDRESS,
-					       SII164_DEVICE_ID_HIGH) << 8) |
-		   (unsigned short)i2cReadReg(SII164_I2C_ADDRESS,
-					      SII164_DEVICE_ID_LOW);
+	device_id =3D ((unsigned short)i2cReadReg(SII164_I2C_ADDRESS,
+						SII164_DEVICE_ID_HIGH) << 8) |
+		    (unsigned short)i2cReadReg(SII164_I2C_ADDRESS,
+					       SII164_DEVICE_ID_LOW);
=20
-	return deviceID;
+	return device_id;
 }
=20
 /*
@@ -141,7 +141,7 @@ long sii164_init_chip(unsigned char edge_select,
=20
 	/* Check if SII164 Chip exists */
 	if ((sii164_get_vendor_id() =3D=3D SII164_VENDOR_ID) &&
-	    (sii164GetDeviceID() =3D=3D SII164_DEVICE_ID)) {
+	    (sii164_get_device_id() =3D=3D SII164_DEVICE_ID)) {
 		/*
 		 *  Initialize SII164 controller chip.
 		 */
@@ -250,41 +250,41 @@ long sii164_init_chip(unsigned char edge_select,
 #ifdef SII164_FULL_FUNCTIONS
=20
 /*
- *  sii164ResetChip
+ *  sii164_reset_chip
  *      This function resets the DVI Controller Chip.
  */
-void sii164ResetChip(void)
+void sii164_reset_chip(void)
 {
 	/* Power down */
-	sii164SetPower(0);
-	sii164SetPower(1);
+	sii164_set_power(0);
+	sii164_set_power(1);
 }
=20
 /*
- * sii164GetChipString
+ * sii164_get_chip_string
  *      This function returns a char string name of the current DVI Contro=
ller
  *      chip.
  *
  *      It's convenient for application need to display the chip name.
  */
-char *sii164GetChipString(void)
+char *sii164_get_chip_string(void)
 {
-	return gDviCtrlChipName;
+	return g_dvi_ctrl_chip_name;
 }
=20
 /*
- *  sii164SetPower
+ *  sii164_set_power
  *      This function sets the power configuration of the DVI Controller C=
hip.
  *
  *  Input:
- *      powerUp - Flag to set the power down or up
+ *      power_up - Flag to set the power down or up
  */
-void sii164SetPower(unsigned char powerUp)
+void sii164_set_power(unsigned char power_up)
 {
 	unsigned char config;
=20
 	config =3D i2cReadReg(SII164_I2C_ADDRESS, SII164_CONFIGURATION);
-	if (powerUp =3D=3D 1) {
+	if (power_up =3D=3D 1) {
 		/* Power up the chip */
 		config &=3D ~SII164_CONFIGURATION_POWER_MASK;
 		config |=3D SII164_CONFIGURATION_POWER_NORMAL;
@@ -298,109 +298,109 @@ void sii164SetPower(unsigned char powerUp)
 }
=20
 /*
- *  sii164SelectHotPlugDetectionMode
+ *  sii164_select_hotplug_detection_mode
  *      This function selects the mode of the hot plug detection.
  */
 static
-void sii164SelectHotPlugDetectionMode(enum sii164_hot_plug_mode hotPlugMod=
e)
+void sii164_select_hotplug_detection_mode(enum sii164_hot_plug_mode hotplu=
g_mode)
 {
-	unsigned char detectReg;
+	unsigned char detect_reg;
=20
-	detectReg =3D i2cReadReg(SII164_I2C_ADDRESS, SII164_DETECT) &
-		    ~SII164_DETECT_MONITOR_SENSE_OUTPUT_FLAG;
-	switch (hotPlugMode) {
+	detect_reg =3D i2cReadReg(SII164_I2C_ADDRESS, SII164_DETECT) &
+		     ~SII164_DETECT_MONITOR_SENSE_OUTPUT_FLAG;
+	switch (hotplug_mode) {
 	case SII164_HOTPLUG_DISABLE:
-		detectReg |=3D SII164_DETECT_MONITOR_SENSE_OUTPUT_HIGH;
+		detect_reg |=3D SII164_DETECT_MONITOR_SENSE_OUTPUT_HIGH;
 		break;
 	case SII164_HOTPLUG_USE_MDI:
-		detectReg &=3D ~SII164_DETECT_INTERRUPT_MASK;
-		detectReg |=3D SII164_DETECT_INTERRUPT_BY_HTPLG_PIN;
-		detectReg |=3D SII164_DETECT_MONITOR_SENSE_OUTPUT_MDI;
+		detect_reg &=3D ~SII164_DETECT_INTERRUPT_MASK;
+		detect_reg |=3D SII164_DETECT_INTERRUPT_BY_HTPLG_PIN;
+		detect_reg |=3D SII164_DETECT_MONITOR_SENSE_OUTPUT_MDI;
 		break;
 	case SII164_HOTPLUG_USE_RSEN:
-		detectReg |=3D SII164_DETECT_MONITOR_SENSE_OUTPUT_RSEN;
+		detect_reg |=3D SII164_DETECT_MONITOR_SENSE_OUTPUT_RSEN;
 		break;
 	case SII164_HOTPLUG_USE_HTPLG:
-		detectReg |=3D SII164_DETECT_MONITOR_SENSE_OUTPUT_HTPLG;
+		detect_reg |=3D SII164_DETECT_MONITOR_SENSE_OUTPUT_HTPLG;
 		break;
 	}
=20
-	i2cWriteReg(SII164_I2C_ADDRESS, SII164_DETECT, detectReg);
+	i2cWriteReg(SII164_I2C_ADDRESS, SII164_DETECT, detect_reg);
 }
=20
 /*
- *  sii164EnableHotPlugDetection
+ *  sii164_enable_hotplug_detection
  *      This function enables the Hot Plug detection.
  *
- *  enableHotPlug   - Enable (=3D1) / disable (=3D0) Hot Plug detection
+ *  enable_hotplug   - Enable (=3D1) / disable (=3D0) Hot Plug detection
  */
-void sii164EnableHotPlugDetection(unsigned char enableHotPlug)
+void sii164_enable_hotplug_detection(unsigned char enable_hotplug)
 {
-	unsigned char detectReg;
+	unsigned char detect_reg;
=20
-	detectReg =3D i2cReadReg(SII164_I2C_ADDRESS, SII164_DETECT);
+	detect_reg =3D i2cReadReg(SII164_I2C_ADDRESS, SII164_DETECT);
=20
 	/* Depending on each DVI controller, need to enable the hot plug based
 	 * on each individual chip design.
 	 */
-	if (enableHotPlug !=3D 0)
-		sii164SelectHotPlugDetectionMode(SII164_HOTPLUG_USE_MDI);
+	if (enable_hotplug !=3D 0)
+		sii164_select_hotplug_detection_mode(SII164_HOTPLUG_USE_MDI);
 	else
-		sii164SelectHotPlugDetectionMode(SII164_HOTPLUG_DISABLE);
+		sii164_select_hotplug_detection_mode(SII164_HOTPLUG_DISABLE);
 }
=20
 /*
- *  sii164IsConnected
+ *  sii164_is_connected
  *      Check if the DVI Monitor is connected.
  *
  *  Output:
  *      0   - Not Connected
  *      1   - Connected
  */
-unsigned char sii164IsConnected(void)
+unsigned char sii164_is_connected(void)
 {
-	unsigned char hotPlugValue;
+	unsigned char hotplug_value;
=20
-	hotPlugValue =3D i2cReadReg(SII164_I2C_ADDRESS, SII164_DETECT) &
-		       SII164_DETECT_HOT_PLUG_STATUS_MASK;
-	if (hotPlugValue =3D=3D SII164_DETECT_HOT_PLUG_STATUS_ON)
+	hotplug_value =3D i2cReadReg(SII164_I2C_ADDRESS, SII164_DETECT) &
+			SII164_DETECT_HOT_PLUG_STATUS_MASK;
+	if (hotplug_value =3D=3D SII164_DETECT_HOT_PLUG_STATUS_ON)
 		return 1;
 	else
 		return 0;
 }
=20
 /*
- *  sii164CheckInterrupt
+ *  sii164_check_interrupt
  *      Checks if interrupt has occurred.
  *
  *  Output:
  *      0   - No interrupt
  *      1   - Interrupt occurs
  */
-unsigned char sii164CheckInterrupt(void)
+unsigned char sii164_check_interrupt(void)
 {
-	unsigned char detectReg;
+	unsigned char detect_reg;
=20
-	detectReg =3D i2cReadReg(SII164_I2C_ADDRESS, SII164_DETECT) &
-		    SII164_DETECT_MONITOR_STATE_MASK;
-	if (detectReg =3D=3D SII164_DETECT_MONITOR_STATE_CHANGE)
+	detect_reg =3D i2cReadReg(SII164_I2C_ADDRESS, SII164_DETECT) &
+		     SII164_DETECT_MONITOR_STATE_MASK;
+	if (detect_reg =3D=3D SII164_DETECT_MONITOR_STATE_CHANGE)
 		return 1;
 	else
 		return 0;
 }
=20
 /*
- *  sii164ClearInterrupt
+ *  sii164_clear_interrupt
  *      Clear the hot plug interrupt.
  */
-void sii164ClearInterrupt(void)
+void sii164_clear_interrupt(void)
 {
-	unsigned char detectReg;
+	unsigned char detect_reg;
=20
 	/* Clear the MDI interrupt */
-	detectReg =3D i2cReadReg(SII164_I2C_ADDRESS, SII164_DETECT);
+	detect_reg =3D i2cReadReg(SII164_I2C_ADDRESS, SII164_DETECT);
 	i2cWriteReg(SII164_I2C_ADDRESS, SII164_DETECT,
-		    detectReg | SII164_DETECT_MONITOR_STATE_CLEAR);
+		    detect_reg | SII164_DETECT_MONITOR_STATE_CLEAR);
 }
=20
 #endif
diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm75=
0fb/ddk750_sii164.h
index 71a7c1cb42c4..52c087a15095 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -28,16 +28,16 @@ long sii164_init_chip(unsigned char edgeSelect,
 		      unsigned char pllFilterValue);
=20
 unsigned short sii164_get_vendor_id(void);
-unsigned short sii164GetDeviceID(void);
+unsigned short sii164_get_device_id(void);
=20
 #ifdef SII164_FULL_FUNCTIONS
-void sii164ResetChip(void);
-char *sii164GetChipString(void);
-void sii164SetPower(unsigned char powerUp);
-void sii164EnableHotPlugDetection(unsigned char enableHotPlug);
-unsigned char sii164IsConnected(void);
-unsigned char sii164CheckInterrupt(void);
-void sii164ClearInterrupt(void);
+void sii164_reset_chip(void);
+char *sii164_get_chip_string(void);
+void sii164_set_power(unsigned char power_up);
+void sii164_enable_hotplug_detection(unsigned char enable_hotplug);
+unsigned char sii164_is_connected(void);
+unsigned char sii164_check_interrupt(void);
+void sii164_clear_interrupt(void);
 #endif
 /*
  * below register definition is used for
--=20
2.34.1


--votmzjuwq6leiwsp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEZG3C7x3FyKMfkYRK/mAkXmbbWfsFAmVuYesACgkQ/mAkXmbb
Wftq4w//diGE37qR6yPqybaxRK+dT3BPFKnKLJP414ptv8vERlEZcoXmRGAyN0br
9aI786ddeXQ/79KGZAd1U/gkKmY+wG0WFXDFWL3itbJL1z4juoJ2ZyPP6x+3orec
KqwNKnpzySC44e/HHw4hrQFnfYsazlenRUjpBysqQrTBH7RmbnHL6DAds89Z18Pi
uPM8ynd6OX+FLGNV2XFuI/YgTfAE3t5u8a75dn8F1q8jfGCea/krpTtnNdhbV3BS
UZjZWeYkz+Hg5cLVOx8bKjo/QvJjdr97dBcaIXTMV9TzLFEIU/LG0WooTqwigFvp
yH1BgTm1jCmHkxg73ywh9x2oaOCYwbDdFfxAUgzqKy3daKY9RTyP72xwqcP2u1bI
FAZWAAPAoXkjxCUNPW3i7DwR77QtPQ/Yz/BOZ/HlJZRBEbmf6rc9JYgmEzne+rdi
LEvuAPoI420gTGcodOGwEsBX7ztirh+6QzLs8GcUrDzilUy6iF4XRIy3dkBf/pyz
AxsvXNlzd0EYzeSotp9Qh1vS6k36lNFle8DLOXiDlqRLeK8P0ElOsdQtRISfi3O1
Y03bnb59tD4XrQOyVaJ+YU1r/wBBwUcSiUCmmbu/VkB6wuZz3LIvwEp6GFD1Etjo
Rqm4AChrjrftTGh9kkPaFkrEqI0fhuVRrOzUsbS9KHnegB7TQMU=
=x71A
-----END PGP SIGNATURE-----

--votmzjuwq6leiwsp--
