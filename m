Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E632DBF69;
	Tue, 17 Jun 2025 12:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750164708; cv=none; b=DyW6uzbSMXQVX68zGNdhbna8N2AD9nIhYNCM2P16O79woMoErcXVdU70D2GdyuxiVi51hv6ryf+Kr07q/jK2oZw0ys7qC2uODTuB0VJbl5x/Tsb+imUCH2HpFn1DB7QyZk9gqB5lE8G3QW/qQ6klpfnOyT0uHpHAJa42mggCaT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750164708; c=relaxed/simple;
	bh=y8+C7iI8r1NplDnN9G0yvYuEi4mGegIOzJfcfmDW34w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GOag2aJzXzNFLaGnj9ZWfWH4qcjzq/SM6+4GgWYkolURKg9HzD32ZPa8gFe03gB5OFv+FhGf0LMtW9fs9O6uJyWitbIQe2y5DZRFxemsF1WT0MnTN4YqhpBqJTRr21lrjDvvVNVIt85JlRIS6+dhPxsVRFVxZbN7EKFcFRkRkh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FlFwy6rL; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlFwy6rL"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3138e64b42aso6490321a91.0;
        Tue, 17 Jun 2025 05:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750164706; x=1750769506; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hSxo0ZHyfJr1fQpftYFJehkxIFFbw7pyxo/Db9fNjFU=;
        b=FlFwy6rLBDkwcfRvu/+0h28jNMorbDBKUln4xSRbZbt4f68O2r9QOIuJPX7f8PcG/a
         0Qgj2vIWFXIp5w86ivo160KmbADp7ngoAFVhDEGzgXYzPfZy1bT/jpQpl+Zg87LCamlk
         I0ePjw0s8fgPzKrzV/3VwxW6mjFih8QobSCXdBl7/mZXLj3VmZW5i8rSKPCo/mQvMP9B
         AfNkrEs55DO6CXhjEIu61n3Bqbw8+4GEqvK2STBve+g/z7gPmtDdHDP+5jtwZXsDG2KJ
         9YRssWWmzMJX+CjNAV4JQu8AbWWq/pC5cNGraMWZE/JPcRya1tSVosTvBelb9bSFue6a
         NnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750164706; x=1750769506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hSxo0ZHyfJr1fQpftYFJehkxIFFbw7pyxo/Db9fNjFU=;
        b=w2bPHq55ZyKdMU3wwI/VDAvi28N/xvdD38hbY+nqWyfbz4WrfpS1Ne5FKhFXpetBzI
         TT4Dh0XDWh95mj15qRRCGSu+2A0vWF7U1LKtqa61Jj0wi4Yi/3SCNFj1vYWeMxT2Rkqd
         cva8SsOcjmCdnpAPUcT2r7iHzOrnEH/XZDjGbz8GZOsHgpDxM3/+JutgANgTq1DVd82V
         SjTAtyDWempAVKHj87VEJ4vBxh8q3ctWL0+0xMFOj4JWgxPJBTPBmR2johSwBF16X66z
         +q4UJTRUez+CggKJ0Jk0/XdgDCCku1LaXmiOwYbQCt5ro8q3CedY4uivmE1ee499xoBI
         PjUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVo9YImaJlST1mOEJpYSVpK5JwrTVuPtzfU63IAZFxO9akj8arwLjqgBtMWvCHgINYlAigKKNNK25ypmSbu4CB29OoG4g==@lists.linux.dev, AJvYcCXYcE1i3lSbVQ2GUZMKGtJshisIQSg2R5kli+wJiiNOZYyYZOsJSnNCF0YC77Uvl/rIbDPCKBixVCWnuIBCHA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyFhcqgYs+plIbm4or6xb5lKfLbLGVpS2K0zx8/stsXgxlUdJtU
	5mFCgxtmX/0mnVROb+qU71c3gu0E0qbY8qa8lKI77FUV8pjv4cBBEBV0
X-Gm-Gg: ASbGncvALVK/a6drYCRi2M6oTJD8UCERhElZGnO8yM39tiZIpQadofpswHAC/hDUpN7
	C0GMXNeOVbtV3UMvfJLVUaiE7Tdj/bdlwm6ORN82ZDmc85raP4Qv1useIwpqidu75KPFF7/brow
	FftO3aJLWSl8SCMu/2x1lyVG+YpUtBuShQhmTetLQsLW9m6GdgtDceXPmI0Z0e3spW8qllHzwRj
	6hJe99t3aAZzG+QlcSYtl70ctyxWbmDbcy+2z9UClINbbv/DYriKs2BaMVtOzuZh0jfYjH+mWam
	ABe8yY6QAFthxQAkzSzQq2eoEhL2oqayLP+azL1Z9CcreqwL76+q0RTGeAl/+Q+IBEBQLEdeAcS
	5i/LSr3F200lESIEh/A==
X-Google-Smtp-Source: AGHT+IFDyTmPgMZj/RHIVJLIOL48m69TjdL4fouKx5vArpbDJpyInEok0Mk+dEvaEXL3/xudr7VNHA==
X-Received: by 2002:a17:90a:dfc8:b0:311:f05b:86a5 with SMTP id 98e67ed59e1d1-313f19d2977mr23454941a91.0.1750164706232;
        Tue, 17 Jun 2025 05:51:46 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c68:884c:5800:7324:c411:408d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1806282sm10421980a91.0.2025.06.17.05.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:51:45 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	vireshk@kernel.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] greybus: firmware: use strscpy, fix tag size
Date: Tue, 17 Jun 2025 18:21:37 +0530
Message-ID: <20250617125137.24503-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Increase the size of firmware_tag arrays in the following structs from
GB_FIRMWARE_U_TAG_MAX_SIZE to GB_FIRMWARE_U_TAG_MAX_SIZE + 1 to
accommodate null termination:
	- fw_mgmt_ioc_intf_load_and_validate
	- fw_mgmt_ioc_get_backend_version
	- fw_mgmt_ioc_backend_fw_update
	- fw_mgmt_ioc_get_intf_version

Replace strncpy() with strscpy() to ensure proper null termination as
firmware_tag is interpreted as a null-terminated string
and printed with %s.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 .../greybus/Documentation/firmware/firmware.c        | 12 ++++++------
 drivers/staging/greybus/greybus_firmware.h           |  8 ++++----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
index 765d69faa9cc..3b4061f4b34a 100644
--- a/drivers/staging/greybus/Documentation/firmware/firmware.c
+++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
@@ -63,8 +63,8 @@ static int update_intf_firmware(int fd)
 	intf_load.major = 0;
 	intf_load.minor = 0;
 
-	strncpy((char *)&intf_load.firmware_tag, firmware_tag,
-		GB_FIRMWARE_U_TAG_MAX_SIZE);
+	strscpy((char *)&intf_load.firmware_tag, firmware_tag,
+		GB_FIRMWARE_U_TAG_MAX_SIZE + 1);
 
 	ret = ioctl(fd, FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE, &intf_load);
 	if (ret < 0) {
@@ -101,8 +101,8 @@ static int update_backend_firmware(int fd)
 	/* Get Backend Firmware Version */
 	printf("Getting Backend Firmware Version\n");
 
-	strncpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
-		GB_FIRMWARE_U_TAG_MAX_SIZE);
+	strscpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
+		GB_FIRMWARE_U_TAG_MAX_SIZE + 1);
 
 retry_fw_version:
 	ret = ioctl(fd, FW_MGMT_IOC_GET_BACKEND_FW, &backend_fw_info);
@@ -129,8 +129,8 @@ static int update_backend_firmware(int fd)
 	/* Try Backend Firmware Update over Unipro */
 	printf("Updating Backend Firmware\n");
 
-	strncpy((char *)&backend_update.firmware_tag, firmware_tag,
-		GB_FIRMWARE_U_TAG_MAX_SIZE);
+	strscpy((char *)&backend_update.firmware_tag, firmware_tag,
+		GB_FIRMWARE_U_TAG_MAX_SIZE + 1);
 
 retry_fw_update:
 	backend_update.status = 0;
diff --git a/drivers/staging/greybus/greybus_firmware.h b/drivers/staging/greybus/greybus_firmware.h
index b6042a82ada4..ad5b2c8a6461 100644
--- a/drivers/staging/greybus/greybus_firmware.h
+++ b/drivers/staging/greybus/greybus_firmware.h
@@ -38,20 +38,20 @@
 
 /* IOCTL support */
 struct fw_mgmt_ioc_get_intf_version {
-	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE];
+	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE + 1];
 	__u16 major;
 	__u16 minor;
 } __packed;
 
 struct fw_mgmt_ioc_get_backend_version {
-	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE];
+	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE + 1];
 	__u16 major;
 	__u16 minor;
 	__u8 status;
 } __packed;
 
 struct fw_mgmt_ioc_intf_load_and_validate {
-	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE];
+	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE + 1];
 	__u8 load_method;
 	__u8 status;
 	__u16 major;
@@ -59,7 +59,7 @@ struct fw_mgmt_ioc_intf_load_and_validate {
 } __packed;
 
 struct fw_mgmt_ioc_backend_fw_update {
-	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE];
+	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE + 1];
 	__u8 status;
 } __packed;
 
-- 
2.49.0

