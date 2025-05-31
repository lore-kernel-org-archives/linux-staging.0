Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E491AB6F1
	for <linux-staging@lists.linux.dev>; Sat, 31 May 2025 21:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748726054; cv=none; b=cv+Fc7m0tyQlnRBFp2xmm6CIg2T6dVyMWDi8qfeITBc50AQ2kEAopwlbx/grkv2USC3fZkn3GHRBMEWF2xTYqjbPj8YJGK/J31SEgEIDEBtN+iixIxW68YoxpJNfj0TAZZ1jP0zLbVMJWlxL7jeVf7jHDhDKNzx2khO6Ilawfj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748726054; c=relaxed/simple;
	bh=d71kya2yib1xQWny5HRSfFEYAxSHhHAkIopEVCFPCzk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SPhUHyLGIoC6gYingaQe11JXQ2QJFkHkcZxbe7Hjgmb/CcV89uZNYltSEcjtAf/d0CPyNNQ18CV2MdAQmL3HLdr8A3/lpTa4aAM1Mz5pnTjTBYF5vCCoDVuslUMWHHLWXxBbQgvbjJ1QKX/i3q40fmFhiAzN/Tt0LmUvhW532WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYAqURdK; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYAqURdK"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-73c17c770a7so3554139b3a.2
        for <linux-staging@lists.linux.dev>; Sat, 31 May 2025 14:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748726052; x=1749330852; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhqVWLzanP0xyNFLLfM8OCfW+c2IkuUYEmPVlLCkYFM=;
        b=QYAqURdKSfld6ahXmAdYjc2J58J6u2W2mc5IJ/bHX1ggsTCslZvnXCY8SbLAB+hgNk
         kY/ZBH0vMyaOjsZJLI3se4UQcmfXyHpJ3W/+rnKhv3jJQ3Zz5YZmAN57U9oHhCFgTgnJ
         Nvu0w1i49U2SHqdTy/HGRZgjR0HCIkpjiN8DqWfeint6fcYQteyeJU2hrVEc9TkLygGx
         CsVB3xG+FeM4gi6vCu19xJrmJMN8qKNmmj+FeZN3d/8jQhWhY1UEND8/+PudPElMp8Ks
         PHnFn/jYcDuzbXuJcs112ghizDx7Lpxr8ulH39WmmoCyYIuN+nEZmVIV5Z9x50mMWVu5
         mpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748726052; x=1749330852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhqVWLzanP0xyNFLLfM8OCfW+c2IkuUYEmPVlLCkYFM=;
        b=KFuGT/Cw6qZvqU0Xt86p3cCrp6ywqnHYOoIPzWH6r4D6auAjLt9l92AKqRtYm5zP0L
         Zwvi2Ywfx5CftPkrbsLQyFn2Z4D1/IBYpZNVsAm4Cp0yWloMuvQNj+1V6pDTaOwFjKw9
         1d0uORzB5mW+aLS9CD7YLFiUI1IheEaClhuRykbGv20PBMYWgSv55vRT0FOrIPcfg/vs
         ncixkaa4Oo9uvc/4Cj8Y4EXhy2dW4c3I5DqXyB75HOvOqHCkKiUVGp9XJW6Qnul/A2yi
         jWSSkeCElUuFQOF6M/LB8xEj2qcX3gMZQSIMka+QE9w+Gm3BN8DeqOibZKly9K+e21aM
         B/WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjVuHKMQqVhj5fiwUGwys6Z3MBwWn6TZkFUBpW/98IHiHm5b6tVDhgLOyZjP22RouxiX7GFDrDeQdwVesP@lists.linux.dev
X-Gm-Message-State: AOJu0YyrUugQ0iuQSEU08zfDcdyjQIv060CubN032FIkZep//Nefww7f
	X/mf+ttwIl9tuxtY0JqdZg1FbVn4jMHD9+z22Zjj0DKor5F3lYCqqD/x
X-Gm-Gg: ASbGncspffUQ0mestbo/v5L+fsq1WOCM4i8B5x3icYUTqWnu/6M2iLbHZcmJjzY1ql3
	VX1zv78k0KFuogejjMeyalSFiVG5QpD82tOBitskGsyntQm4rfnzFwlb96c69JH6r/IUoPtTB8+
	rETsOnWYeR0k7xIX+Ntm9rqaKbvhgJWTQub2pZ6l4vi1bW/Tijqw+H3Dclv76le4iyFVlhRW0HH
	cN8K5LS7Lt/cR68FqAiUBFNEQklq/ASLrTbPUbfV8u9KTkP8nNt2D4GnRoqyYzN3ZqJ2uiuEnXB
	eWsIYP1/tKAFRCSvf0Jx7VbrEsdODqUmYGfNbDCrA6D+uXo8PM+ZeEHWybes7ZKwRKQD
X-Google-Smtp-Source: AGHT+IH4bdi3OYNDTHdVm4xnXb+pj8+sjPoPMeiWoZcrBVF3ug78eCZfdPEAPO2VwBfn9D9DWnmPmA==
X-Received: by 2002:a05:6a00:814:b0:740:aa33:c6f8 with SMTP id d2e1a72fcca58-747d1835ccbmr3886256b3a.7.1748726052191;
        Sat, 31 May 2025 14:14:12 -0700 (PDT)
Received: from khalid-HP-Notebook.. ([49.204.30.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affaf9dasm5161824b3a.109.2025.05.31.14.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 14:14:11 -0700 (PDT)
From: khalid.datamax@gmail.com
To: sudipm.mukherjee@gmail.com
Cc: teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khalid Faisal <khalid.datamax@gmail.com>
Subject: [PATCH 1/1] staging: sm750fb: convert CamelCase function names to snake_case
Date: Sun,  1 Jun 2025 02:41:03 +0530
Message-ID: <20250531211319.55682-3-khalid.datamax@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250531211319.55682-1-khalid.datamax@gmail.com>
References: <20250531211319.55682-1-khalid.datamax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khalid Faisal <khalid.datamax@gmail.com>

This patch converts function names in the sm750fb driver from CamelCase to
snake_case to comply with Linux kernel coding style.

No functional changes.

Signed-off-by: Khalid Faisal <khalid.datamax@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c    | 16 +++++------
 drivers/staging/sm750fb/ddk750_sii164.c | 38 ++++++++++++-------------
 drivers/staging/sm750fb/ddk750_sii164.h | 16 +++++------
 3 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index 8b81e8642..6fef1ab48 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -16,15 +16,15 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 	{
 		.init = sii164_init_chip,
 		.get_vendor_id = sii164_get_vendor_id,
-		.get_device_id = sii164GetDeviceID,
+		.get_device_id = sii164_get_device_id,
 #ifdef SII164_FULL_FUNCTIONS
-		.reset_chip = sii164ResetChip,
-		.get_chip_string = sii164GetChipString,
-		.set_power = sii164SetPower,
-		.enable_hot_plug_detection = sii164EnableHotPlugDetection,
-		.is_connected = sii164IsConnected,
-		.check_interrupt = sii164CheckInterrupt,
-		.clear_interrupt = sii164ClearInterrupt,
+		.reset_chip = sii164_reset_chip,
+		.get_chip_string = sii164_get_chip_string,
+		.set_power = sii164_set_power,
+		.enable_hot_plug_detection = sii164_enable_hot_plug_detection,
+		.is_connected = sii164_is_connected,
+		.check_interrupt = sii164_check_interrupt,
+		.clear_interrupt = sii164_clear_interrupt,
 #endif
 	},
 #endif
diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index 2532b6024..d6bfd7c4e 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -48,13 +48,13 @@ unsigned short sii164_get_vendor_id(void)
 }
 
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
 	unsigned short deviceID;
 
@@ -141,7 +141,7 @@ long sii164_init_chip(unsigned char edge_select,
 
 	/* Check if SII164 Chip exists */
 	if ((sii164_get_vendor_id() == SII164_VENDOR_ID) &&
-	    (sii164GetDeviceID() == SII164_DEVICE_ID)) {
+	    (sii164_get_device_id() == SII164_DEVICE_ID)) {
 		/*
 		 *  Initialize SII164 controller chip.
 		 */
@@ -250,36 +250,36 @@ long sii164_init_chip(unsigned char edge_select,
 #ifdef SII164_FULL_FUNCTIONS
 
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
 
 /*
- * sii164GetChipString
+ * sii164_get_chip_string
  *      This function returns a char string name of the current DVI Controller
  *      chip.
  *
  *      It's convenient for application need to display the chip name.
  */
-char *sii164GetChipString(void)
+char *sii164_get_chip_string(void)
 {
 	return gDviCtrlChipName;
 }
 
 /*
- *  sii164SetPower
+ *  sii164_set_power
  *      This function sets the power configuration of the DVI Controller Chip.
  *
  *  Input:
  *      powerUp - Flag to set the power down or up
  */
-void sii164SetPower(unsigned char powerUp)
+void sii164_set_power(unsigned char powerUp)
 {
 	unsigned char config;
 
@@ -329,12 +329,12 @@ void sii164SelectHotPlugDetectionMode(enum sii164_hot_plug_mode hotPlugMode)
 }
 
 /*
- *  sii164EnableHotPlugDetection
+ *  sii164_enable_hot_plug_detection
  *      This function enables the Hot Plug detection.
  *
  *  enableHotPlug   - Enable (=1) / disable (=0) Hot Plug detection
  */
-void sii164EnableHotPlugDetection(unsigned char enableHotPlug)
+void sii164_enable_hot_plug_detection(unsigned char enableHotPlug)
 {
 	unsigned char detectReg;
 
@@ -350,14 +350,14 @@ void sii164EnableHotPlugDetection(unsigned char enableHotPlug)
 }
 
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
 	unsigned char hotPlugValue;
 
@@ -370,14 +370,14 @@ unsigned char sii164IsConnected(void)
 }
 
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
 	unsigned char detectReg;
 
@@ -390,10 +390,10 @@ unsigned char sii164CheckInterrupt(void)
 }
 
 /*
- *  sii164ClearInterrupt
+ *  sii164_clear_interrupt
  *      Clear the hot plug interrupt.
  */
-void sii164ClearInterrupt(void)
+void sii164_clear_interrupt(void)
 {
 	unsigned char detectReg;
 
diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index 71a7c1cb4..005473ca2 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -28,16 +28,16 @@ long sii164_init_chip(unsigned char edgeSelect,
 		      unsigned char pllFilterValue);
 
 unsigned short sii164_get_vendor_id(void);
-unsigned short sii164GetDeviceID(void);
+unsigned short sii164_get_device_id(void);
 
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
+void sii164_set_power(unsigned char powerUp);
+void sii164_enable_hot_plug_detection(unsigned char enableHotPlug);
+unsigned char sii164_is_connected(void);
+unsigned char sii164_check_interrupt(void);
+void sii164_clear_interrupt(void);
 #endif
 /*
  * below register definition is used for
-- 
2.43.0

