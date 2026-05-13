Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA731C5F13
	for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 08:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778661725; cv=none; b=XZi/qjqpsQ4whCc3PldoJmWU0XCsZLlKurvTUldS0aDewGWaYuu/shX2x2ierROctdQK09IGkYLZSWTfddrV8exkgLkl36DJDn8XeIOgovSzbTcAwqY+Wjt3mnG41y6u3ELEMvJeK3XdVpnEtoDuYSGTyiYYEM+J7n20PeNuz1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778661725; c=relaxed/simple;
	bh=rEgCi6WbSL8Xo+YaQq/VpnJLI0p0KP0P0boReoNJ/GQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h5ewkM0undeo4XbA6oV+vq25L4qHbkJ2pXmpd+fplncYl9j+Kr+l5QszWrD6BTNVe7gtswbbJ9dyM0Z7Qc642sEG2bnb8giCptGpRxeESibQq1rnTAcsCsPAwQq0mrXp5fs/VQ5e2EIKKZpxh0WR7giH+wvu4eM57X+tpwfiGVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6uxedcV; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6uxedcV"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-393ba0616aaso70549211fa.2
        for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 01:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778661709; x=1779266509; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mI5ZtFaAxbXxSmMeyL6G67aMq2kdYFf+5RyhkuotiDo=;
        b=I6uxedcVPd/ws9VpxbFATDdyPuGg7+qcAmP5QUtocQebhXwXDLBGoqh4vWgIP0BFt0
         i4TABKBaJtvRqNP/F3gX9B4HCGHJuyldUMRZqL2VLhMUXXarxTzbShq5TNYnKLfkJlCL
         EjWYlMyC9WOvopxWSJmtUgOs+9V/NOvyIYRJzui2cSExKpW3Zwx29+XKnKstZ3jdR04H
         sObRBAnsfIxjrk3ts57YpwcbyghoNGaXe47hKAc+L3wkJ//1onMXQLdPwUAp7zmiVJ02
         XaqaeEoPDhuabIuDdkd2hKlx8AwOcqIaHtVxgranEOD/EvxbHZJ6ntev0aawtYl+6Iwc
         TFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778661709; x=1779266509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mI5ZtFaAxbXxSmMeyL6G67aMq2kdYFf+5RyhkuotiDo=;
        b=N/3vAvOUYnK2MC86Iyc1VLh5v/fkqB9jM0Potf4vA3mTo2mmmn/AdeDdomzr5j3Wa5
         vIiUSF1xEMFtsOw+pXQobe2sXKjZGFBSubFfQVtKLkX4hA3gYQA0Ap1wr0eMGwIrAwGo
         3BT5HjvHFmXS+/H/Rxr6JM87daQUC6MAoDjxvPGmi0X4tY8DZtA2l3kkNdWpxF8yyaSr
         JKKiknIf1bxniaImcUu62cXmlx62sJOXnYMqrCr8ok0da3lqpC+7dRktw3Hu6nHP70Ui
         KcGupyM7Q+6RVCmEjzgQ/03iFgzuFOkPicaIZNc1HO9TrSDLY0GC+Bsott/UBK/Bhs+8
         B8Rw==
X-Forwarded-Encrypted: i=1; AFNElJ8t64kPfT2CihkAcvy46Xuk/4p61fBxcbOoowFyN/gYKxNzVwwphWhd5ugRnsYZXKGIqAZq89AZ3p5FSTcZ@lists.linux.dev
X-Gm-Message-State: AOJu0YwC06veQiYNN7NEV1id/HbSmmbZX7RRVpJJ0VekeH1UkIztyUFW
	oZCVoO+MARon+imBmKJm/5WC+zWogJSdkRv9oSonLfEPXduXr0qrB+yF
X-Gm-Gg: Acq92OEApye9QBIO1lmcu71WLLXhzHZ5JarJqo3MkxgfpazH/B42BE9fmN45raFPLjj
	Rcy/rX68N1L1G46LFRJAHanlrd9+A1/QStIVWG0YFlXI5lNEvzEIzH0XuLEIZoDZ7c6DfJePUle
	en4BgofG0GY8AYUnWca4vtaZ068Ho/OPgwHhvrISv36yiqpmREcXutKbLxqE7vJEh30W3JgG2gd
	2h4eeivnew9Q68nDcMrlxl6oeXqt0ZqF6mqs0+qm1cP8dZ1XIaXcCglRqYwr94Xf+D0gD1I7edx
	rf1a9gJA1r15d6wHJ15uVJjR2j4wcvgci2jpIxiLLlrYZILOBorPwtW3v7b5M4gMBsiEpHh09q6
	nOsZpeEH7uafK/3afKNuM4olz8ZBpG4PBskLA4R0XsX81ChRyk+MxBqS9BwS1e3dStj6wg8EGWE
	1ovvjGK41t3t37lLQU6atdlElj+Fkuvqv1mncKBlLUOLXv+dw/I+z+5WKYc8lkKNueb8MyUKcfr
	8E=
X-Received: by 2002:a05:6512:15a1:b0:5a8:6e50:b16a with SMTP id 2adb3069b0e04-5a8ef9a29f8mr881136e87.34.1778661709267;
        Wed, 13 May 2026 01:41:49 -0700 (PDT)
Received: from localhost.localdomain (95-25-161-220.broadband.corbina.ru. [95.25.161.220])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95664easm3846493e87.70.2026.05.13.01.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 01:41:48 -0700 (PDT)
From: IgorpetinDev <igorpetindev@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	IgorpetinDev <igorpetindev@gmail.com>
Subject: [PATCH] staging: atomisp: fix trailing statements in input_system.c
Date: Wed, 13 May 2026 11:41:46 +0300
Message-ID: <20260513084146.57706-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change-Id: Id89273d4ac76e8155aa6b1600d1f223407e0412f
Signed-off-by: IgorpetinDev <igorpetindev@gmail.com>
---
 .../hive_isp_css_common/host/input_system.c    | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 9f1199c47..86c9d7a48 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -423,7 +423,8 @@ static input_system_err_t input_system_configure_channel(
 			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 		}
 
-		if (error != INPUT_SYSTEM_ERR_NO_ERROR) return error;
+		if (error != INPUT_SYSTEM_ERR_NO_ERROR)
+			return error;
 		// Input switch channel configurations must be combined in united config.
 		config.input_switch_cfg.hsync_data_reg[channel.source_cfg.csi_cfg.csi_port * 2]
 		    =
@@ -1094,13 +1095,15 @@ static input_system_err_t input_system_configure_channel_sensor(
 
 	status = set_source_type(&config.source_type, channel.source_type,
 				 &config.source_type_flags);
-	if (status != INPUT_SYSTEM_ERR_NO_ERROR) return status;
+	if (status != INPUT_SYSTEM_ERR_NO_ERROR)
+		return status;
 
 	// Check for conflicts on source (implicitly on multicast, capture unit and input buffer).
 
 	status = set_csi_cfg(&config.csi_value[port], &channel.source_cfg.csi_cfg,
 			     &config.csi_flags[port]);
-	if (status != INPUT_SYSTEM_ERR_NO_ERROR) return status;
+	if (status != INPUT_SYSTEM_ERR_NO_ERROR)
+		return status;
 
 	switch (channel.source_cfg.csi_cfg.buffering_mode) {
 	case INPUT_SYSTEM_FIFO_CAPTURE:
@@ -1109,7 +1112,8 @@ static input_system_err_t input_system_configure_channel_sensor(
 		mux = INPUT_SYSTEM_MIPI_PORT0 + port;
 		status = input_system_multiplexer_cfg(&config.multiplexer, mux,
 						      &config.multiplexer_flags);
-		if (status != INPUT_SYSTEM_ERR_NO_ERROR) return status;
+		if (status != INPUT_SYSTEM_ERR_NO_ERROR)
+			return status;
 		config.multicast[port] = INPUT_SYSTEM_CSI_BACKEND;
 
 		// Shared resource, so it should be blocked.
@@ -1124,7 +1128,8 @@ static input_system_err_t input_system_configure_channel_sensor(
 		mux = INPUT_SYSTEM_ACQUISITION_UNIT;
 		status = input_system_multiplexer_cfg(&config.multiplexer, mux,
 						      &config.multiplexer_flags);
-		if (status != INPUT_SYSTEM_ERR_NO_ERROR) return status;
+		if (status != INPUT_SYSTEM_ERR_NO_ERROR)
+			return status;
 		config.multicast[port] = INPUT_SYSTEM_INPUT_BUFFER;
 
 		// Shared resource, so it should be blocked.
@@ -1139,7 +1144,8 @@ static input_system_err_t input_system_configure_channel_sensor(
 		mux = INPUT_SYSTEM_ACQUISITION_UNIT;
 		status = input_system_multiplexer_cfg(&config.multiplexer, mux,
 						      &config.multiplexer_flags);
-		if (status != INPUT_SYSTEM_ERR_NO_ERROR) return status;
+		if (status != INPUT_SYSTEM_ERR_NO_ERROR)
+			return status;
 		config.multicast[port] = INPUT_SYSTEM_INPUT_BUFFER;
 
 		// Shared resource, so it should be blocked.
-- 
2.43.0

