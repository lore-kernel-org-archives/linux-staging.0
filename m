Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EBF3803E3
	for <linux-staging@lists.linux.dev>; Sun, 31 May 2026 08:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780214431; cv=none; b=tQE4XbzPnvplBz+bXhUuHStw329TdVtpg/2kO/h5VGGOZ96K+h0ft2L/SbQQdcnZ5EJFcEnqfvz3ItonYGrXCAzDJkRIhF5hEZHomE44IJ2FH+KgB3cFM+B0h0C401VsVwLwgp4lGCR/UbpsgxQ/FS+3bMStgKfEJG34m3vf1Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780214431; c=relaxed/simple;
	bh=QFbbBh1k7Ix4B4SlsEYLiFKBIsow4wW7YNuONhLGWi0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RqQBpk/yPa7aNNJK+tFwbOF3QGTTIkgUS/OKyqIBCjx3FTIqogIq/WOPpZ3TGjgmGLurqSJPf+6/JddMnKLwRNvfI1KOOxria9/cRXsqPDA56tI3AW6mPBKFwO+NGs76CiiWI2+5nHdj3h60oQWY2kAImfZT/BTEwm5VZhpyd7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDEd4uiW; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDEd4uiW"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aa5f06b16cso1180074e87.1
        for <linux-staging@lists.linux.dev>; Sun, 31 May 2026 01:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780214423; x=1780819223; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pnAH5xlgZfcNB86CsX6eS0wzxQ0myi7gwtTcXApndRY=;
        b=TDEd4uiWiyum1xkrVf5sg5RhZRz8vujfPDF4hdgVxyWZ1bcLCPejqKmHDJbVUZoYoS
         GfFddeH1NFxGwV656hvJE1xw1pdQPSfqP36rhYjR4zOCuw8E/Snjds/oBeCgKNHv2g+L
         uZW2dx9sv+73/9zRUnLn9Z5oLtUIrLQuv5m6pm+I6vtZ7x3NxAFCIMpFInjOOSdz4qO8
         +gC58Py1kBExb8QZw5PiZ0zq7HQh1eOiqgQYHWob49KbAq/rubsPDRUcfegUFpxDJU8I
         7aYknWi6hGkwMNRmE59j1f24+hZimgOTzGElLf456SdrGk0XleJfjHYYj2IHX+fEwam6
         k9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780214423; x=1780819223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnAH5xlgZfcNB86CsX6eS0wzxQ0myi7gwtTcXApndRY=;
        b=DWzucUvOle4KkjH27JMturYAZA9fwNcI4iHfQ457IU2l7AUx75Cy9bUQa+J0FAl42U
         jWwY6gf7xQXAKllpaEJU56z1pCxW6ig12OKZlL9CkaIwjv1dEcqHb/F1kk96vAbamv08
         lU1sw6PVdlzgITRsM2t/ba6m+fGOBgxfIe4T/6rhodQ15m4b3Gs9RyUZmQhPJ5J9UvWC
         ELBdsqADmBnf7VMkONEt/ETOGn0HHGT0Uyh7JcoJIKbXVFT4gFztlUmMaTbPLcBVhvKc
         3702AfO1MsBnOiYvYFF45HFf78bP81gDe69yS8SRbkA1Zgn/f08owiIXiiQ8ATMWlIbS
         Qkpg==
X-Gm-Message-State: AOJu0YyVmeHI9Pbrx/6eO4Vc5pWikPcrS9BUH7dEIL8bDFi+5/drDbfa
	OWJ+vNCLvKz2XSLm4+KrQr3ogio9+IxW8TxclRZO359D7O+R+FcVYBb7
X-Gm-Gg: Acq92OFrkuOQKCyveNOhJJcura2Zk8QY/VkCgngYfT+k8721JE2Lgf59/b8ICuKcEKQ
	OwGABIgCF93RErrM9ahT+5S3jMzkAtyeIath3pNFA5R5mmOfzAyuIDPlHJHi5SXL4GdOqNCnzLC
	2ViaDYPPjY99r/0pQmqkMeXwa003bjuDxtPa7BJtf8PccBz0PIP9hU9LOGmtrfE+G0p1LhVKbNN
	rnvmdHRvnLsWgeGVPp1CgoGw97XnztcuQ4v43apSptB3YAM9sSfHt87PggTdSQeAJAjL3sRw8+z
	uIucy2s7A7BwIPoWk332ehCGXU03r7sUNRpa6K53dtU9U+hZVpxW/DDv9fM6SrjXF2dHWrXCoDU
	9PHdJCdH3Wp+fCGNUOWvgC1lPn+zeHJqLDD7EQPn+3t/16ZkjwXlM1g1+BdNJFZLHnuy9MHQt8o
	IQCBYyp3OGR82WrKGNMWSMpqbrD8EZNTd/7w==
X-Received: by 2002:a05:6512:3044:b0:5a8:7426:d2da with SMTP id 2adb3069b0e04-5aa60799febmr1512956e87.7.1780214422529;
        Sun, 31 May 2026 01:00:22 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39659e2b164sm15300581fa.34.2026.05.31.01.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 01:00:21 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unused field 'bAPKThermalMeterIgnore'
Date: Sun, 31 May 2026 11:00:00 +0300
Message-ID: <20260531080015.74870-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This field is set to 'true' once and is never used again. Remove it to
eliminate dead code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 4 +---
 drivers/staging/rtl8723bs/include/hal_data.h      | 1 -
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index bcaf63b2893c..59ed674cfbeb 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1514,10 +1514,8 @@ void Hal_EfuseParseThermalMeter_8723B(
 	else
 		pHalData->EEPROMThermalMeter = EEPROM_Default_ThermalMeter_8723B;
 
-	if ((pHalData->EEPROMThermalMeter == 0xff) || AutoLoadFail) {
-		pHalData->bAPKThermalMeterIgnore = true;
+	if ((pHalData->EEPROMThermalMeter == 0xff) || AutoLoadFail)
 		pHalData->EEPROMThermalMeter = EEPROM_Default_ThermalMeter_8723B;
-	}
 }
 
 void Hal_ReadRFGainOffset(
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index 3a93ac312ded..78dec6e5db19 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -209,7 +209,6 @@ struct hal_com_data {
 	u8 EEPROMBluetoothAntIsolation;
 	u8 EEPROMBluetoothRadioShared;
 	u8 bTXPowerDataReadFromEEPORM;
-	u8 bAPKThermalMeterIgnore;
 	u8 bDisableSWChannelPlan; /*  flag of disable software change channel plan */
 
 	bool		EepromOrEfuse;

base-commit: 7cb1c5b32a2bfde961fff8d5204526b609bcb30a
-- 
2.54.0

