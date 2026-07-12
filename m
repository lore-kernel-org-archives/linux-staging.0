Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3755B3815E4
	for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 22:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783895407; cv=none; b=t1PdEEl3JOEZ2d0Bm5iXlE0h1BUxJYksYGU2q3v61+KuxQLr8PjC0gHo6QK6/LBXa84nel02+vnPF121ZFtWBrQmV1LD5eIamQvqJ6PGOD8yM1X73cIBvMoYtX+yhme50XWnohXKRi+XUL7WcBskzxjDMSEGnmOGGS1y16PdBSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783895407; c=relaxed/simple;
	bh=h4Vryts5/HJkz1V5caojW1TWYW0a9IEe9ExT/gVUbuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WuYPFewvS4FKXL3qiuphZuF+ffe5YVccnheXGfiDVnfRGzCHxGH0HiWqYtqBM3S5wLmfghWV3fHdgNgG1wZ8N+KOgZ5VINnJp2jPKJvHbGLR6qogWZNiwqFk6OU3yZkuBf3J1K0AiNmOtIl8TFDuOpV9d5sTYtMIApSX5drul60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/r37YXy; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/r37YXy"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cea3004256so16700695ad.0
        for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 15:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783895405; x=1784500205; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6oxtH7JnenqWTHEDhaGlPkoYn8q2KAF+d8dgovCM58M=;
        b=A/r37YXy5lga2E1yiCVbVbACSYBipMUzQpWWTTInGOe67KcLSXwMAn00BLhvTzjJio
         ccJC6xHmHY0BFXWV+evFNG2QYNQosYmcSFOdTlyyueVdz1Mhva3g42MQTtklnnb6qqvE
         LQrM+ptrc8yfCV2Y7pdkk2oKW63Tg8NpScVxNj8HW72dGSkQT49smTlh7CDKVupvrhBH
         lbX4vQCa1dkmWkB3YvVNvaNlYp7PWS8l4EsoeuYq33Ir0BIP+3kJ0NFynu0hxk0xayea
         NA7YBDN8N6vU1Gaa9RRrhTDZIKS8NJ3PLz5gMi3i+gVskhMTNP6cn7C+/FE4DCllkjJ4
         KXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783895405; x=1784500205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6oxtH7JnenqWTHEDhaGlPkoYn8q2KAF+d8dgovCM58M=;
        b=Q0hxxOUP8u1gXU3hGC4Ru7XZSU1MD/ifGLECf+WOPWWRUEiw/iVZGj28bRimOfiCD+
         sBOA1PfTortwQ5K3LyB2Nv4pVJ70c/YRH4DpOfuuQCJJDiEk0cyv+3JXkwikoAWfE4mr
         DX62ISZ7jgDAivuvj3K3QP7oGadHdJFRCwTvqGMBUGu6LrL98zJ1eRHSUj50Via9vuQY
         y59/GU08kWc20GsJVhpT7vPd14mRrXxmJhDltf30UIPvmbTsayl0XEwuJHj/EFMxw+Zh
         +FVYKIV0GmfuLHsmaZzrCLrvfh2Nsigi004fyRVmJd8uE8hYNEc1UbDnTFjAMjnlqvuq
         SBfg==
X-Forwarded-Encrypted: i=1; AHgh+RpljA3J+HXVVNv31ixKdzyHX5udUSJQYnbRUHEaQn0GAAu/tjG9FlZgZXLhYUbxBrP4cpEJsMDQExl8PZS6@lists.linux.dev
X-Gm-Message-State: AOJu0YwmasM0YWLOGCwUI+HE5nk5haPkWq0t50kuirVqUXqbz+N8wOMB
	U+34bQpqmmknMn7JjSxfPKdbgfA/NcchU0BX3eoSMhWUnX38MFIuOYNx
X-Gm-Gg: AfdE7ckXZ45/UUh4/dpoEjkywCYAVQcWTNLDghJMb3jKUermdDAlJl5YVF5Xhfa7MwW
	NhymgZootiOxQByL6OKHhu075smgTQjruRQwfwWlpnPCDI359pkPxRZn5u+T1OpgoWq45aZvU4t
	ce2utAEiWsQ0qNjodbSyRr9VjHNOU6nR5UspU6gewbLOCk1vDChafGqROIFo4pArB79Bbr872/3
	XNLMPfqXE9IeH3KO4I+GbGYXrHGbBJ1AIklewuSR6P/9TCt819xKUAFmvGStvm5LowzlI+8WV4s
	dB+CKAeG1bVWqYDNxB7qUqC0DWn3FoEDspIYh4RzLxq3eP63mzRQhuZMCl23qdXB4+HmY1vCXyT
	rr/uA2sofJZeB9xNmN61v0O2n7GeuEqkEgiL0UkcN9pfqwfJi8nQbczTqOk3l4STh6/xWraufIk
	1TqMChQeSAfNQo
X-Received: by 2002:a17:903:1a2b:b0:2c8:1f58:55dd with SMTP id d9443c01a7336-2ce9e79f35amr63957415ad.9.1783895405574;
        Sun, 12 Jul 2026 15:30:05 -0700 (PDT)
Received: from kdev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bc1fsm89048375ad.55.2026.07.12.15.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 15:30:05 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH] staging: iio: frequency: remove incorrect kernel-doc markings in dds.h
Date: Sun, 12 Jul 2026 22:30:04 +0000
Message-ID: <20260712223004.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 13 comment blocks in dds.h noting which sysfs attribute each
convenience macro creates are opened with the kernel-doc /** marker,
but they are not kernel-doc: there is no identifier to document.
Running kernel-doc on the file emits 103 warnings:

  $ scripts/kernel-doc -none drivers/staging/iio/frequency/dds.h
  Warning: drivers/staging/iio/frequency/dds.h:10 Cannot find
  identifier on line:
   * /sys/bus/iio/devices/.../out_altvoltageX_frequencyY

The header is not scanned during normal builds (build-time kernel-doc
checks cover .c files), so the warnings only show up when kernel-doc
is invoked on the file directly.

The comments have carried the /** marker since the file was introduced
in commit 4851d97d87c8 ("Staging: IIO: dds.h convenience macros"). The
attributes themselves are already documented in
drivers/staging/iio/Documentation/sysfs-bus-iio-dds, so demote the
comments to plain /* style rather than converting them into kernel-doc
for the macros. No functional change.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
 drivers/staging/iio/frequency/dds.h | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/iio/frequency/dds.h b/drivers/staging/iio/frequency/dds.h
index b2ca8bb971e8..d5f0139b79f0 100644
--- a/drivers/staging/iio/frequency/dds.h
+++ b/drivers/staging/iio/frequency/dds.h
@@ -7,7 +7,7 @@
 #ifndef IIO_DDS_H_
 #define IIO_DDS_H_
 
-/**
+/*
  * /sys/bus/iio/devices/.../out_altvoltageX_frequencyY
  */
 
@@ -15,14 +15,14 @@
 	IIO_DEVICE_ATTR(out_altvoltage##_channel##_frequency##_num,	\
 			_mode, _show, _store, _addr)
 
-/**
+/*
  * /sys/bus/iio/devices/.../out_altvoltageX_frequencyY_scale
  */
 
 #define IIO_CONST_ATTR_FREQ_SCALE(_channel, _string)			\
 	IIO_CONST_ATTR(out_altvoltage##_channel##_frequency_scale, _string)
 
-/**
+/*
  * /sys/bus/iio/devices/.../out_altvoltageX_frequencysymbol
  */
 
@@ -30,7 +30,7 @@
 	IIO_DEVICE_ATTR(out_altvoltage##_channel##_frequencysymbol,	\
 			_mode, _show, _store, _addr)
 
-/**
+/*
  * /sys/bus/iio/devices/.../out_altvoltageX_phaseY
  */
 
@@ -38,14 +38,14 @@
 	IIO_DEVICE_ATTR(out_altvoltage##_channel##_phase##_num,		\
 			_mode, _show, _store, _addr)
 
-/**
+/*
  * /sys/bus/iio/devices/.../out_altvoltageX_phaseY_scale
  */
 
 #define IIO_CONST_ATTR_PHASE_SCALE(_channel, _string)			\
 	IIO_CONST_ATTR(out_altvoltage##_channel##_phase_scale, _string)
 
-/**
+/*
  * /sys/bus/iio/devices/.../out_altvoltageX_phasesymbol
  */
 
@@ -53,7 +53,7 @@
 	IIO_DEVICE_ATTR(out_altvoltage##_channel##_phasesymbol,		\
 			_mode, _show, _store, _addr)
 
-/**
+/*
  * /sys/bus/iio/devices/.../out_altvoltageX_pincontrol_en
  */
 
@@ -61,7 +61,7 @@
 	IIO_DEVICE_ATTR(out_altvoltage##_channel##_pincontrol_en,	\
 			_mode, _show, _store, _addr)
 
-/**
+/*
  * /sys/bus/iio/devices/.../out_altvoltageX_pincontrol_frequency_en
  */
 
@@ -69,7 +69,7 @@
 	IIO_DEVICE_ATTR(out_altvoltage##_channel##_pincontrol_frequency_en,\
 			_mode, _show, _store, _addr)
 
-/**
+/*
  * /sys/bus/iio/devices/.../out_altvoltageX_pincontrol_phase_en
  */
 
@@ -77,7 +77,7 @@
 	IIO_DEVICE_ATTR(out_altvoltage##_channel##_pincontrol_phase_en,	\
 			_mode, _show, _store, _addr)
 
-/**
+/*
  * /sys/bus/iio/devices/.../out_altvoltageX_out_enable
  */
 
@@ -85,7 +85,7 @@
 	IIO_DEVICE_ATTR(out_altvoltage##_channel##_out_enable,		\
 			_mode, _show, _store, _addr)
 
-/**
+/*
  * /sys/bus/iio/devices/.../out_altvoltageX_outY_enable
  */
 
@@ -94,7 +94,7 @@
 	IIO_DEVICE_ATTR(out_altvoltage##_channel##_out##_output##_enable,\
 			_mode, _show, _store, _addr)
 
-/**
+/*
  * /sys/bus/iio/devices/.../out_altvoltageX_outY_wavetype
  */
 
@@ -102,7 +102,7 @@
 	IIO_DEVICE_ATTR(out_altvoltage##_channel##_out##_output##_wavetype,\
 			_mode, NULL, _store, _addr)
 
-/**
+/*
  * /sys/bus/iio/devices/.../out_altvoltageX_outY_wavetype_available
  */
 

base-commit: 2e2f2de7532cbbc2269de8be20ec709606c6e79b
-- 
2.43.0

