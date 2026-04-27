Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795AB346A1C
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 15:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305277; cv=none; b=RchqlBjO6OrrY3zlg/nxnjgxUOen0CdXgji2eHTIv/qU9XKQ0JxC/D/JHBDJP8pyhLBuMA8nxzvMIjYqVKaY89EsugUxrTy3V4fxAE/NylUEU4KDwkQt3jNsfcQdShT5hqZi57/52Sv7ksI+d6kI47teuAPkQ82uVKKwUlDxqRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305277; c=relaxed/simple;
	bh=I1nJbv81E72QLR9rTJJeT2/s+/pNz9TbaKu14lB08PQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VQc02TQ0mtHimuUrbk0aRWp73Dga00r4IwOsW4y0ujK4W7gsHbzKldErK7ENjmVNrgJw9onTRLJ/V+Wwq/Nbmv5Ji/evxFSz/ajXk3cGymdRLhJLTreeh+aaa7B/TyPMi30oBI545OldtPE/HUPIENRDtGeSEq3+Th5789qx1LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JMkyrHck; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JMkyrHck"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-824c9da9928so5054828b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 08:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777305275; x=1777910075; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wD4HSmg94+zoUy1wxNVzZHgBZRTgsbG2xCqBMkaVIkA=;
        b=JMkyrHckvOYG8m+/LMOqGcQWDBX5vDUid5vaX029fBvLmzeFFMksSjsGoLXbSZruf0
         mntDIz3KG1Xr7vunBklfsNYz5oZEj0hHRDTqkM9T6sgIn+gzK5/O5Yus3fC/S+yGZJhs
         wjvHTwgt0RKMMQgdliL2UnN7uZo0VN+b5q3we9D5KwFdEEdsE02wsM4M5JhPP2oGCnsq
         hGlR64GVlS68Uo/ghV2cuE8KJL6twp+sW54L7OBmvbWbSiVOMaOoxTc8IBuvzeQ/AqSF
         xIHbNnPyPoGZCM6s1Hbqvc51XLn7hOt+p8Se4iK9NtRskPwZb0EXLGFtI37x94qud8ym
         Ly8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777305275; x=1777910075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wD4HSmg94+zoUy1wxNVzZHgBZRTgsbG2xCqBMkaVIkA=;
        b=c9cihXURumcUuFArRpGFK3BOp84+AiSyt/0endmS5O+SBbL0M2eCpoZ27ltkV3eO3F
         H7pOtRsCtxBa+KZNi+GJ6d92kmjFXxB3D0oeab/gNNUn2xm2p9QZkR8alSKXwCMGkuHR
         caaXN2lTsR0cUB6C7GByJq6iHp1ufvAxdVWKBiooBjcngbHr59P5sKQ32g4/ZjVF5God
         j3RUB3sXdakjDU1ieZ5OkVSJ3OZz4wmlTsJ3aqnSxt3f6y7BWNAPoY1Lb69EpJXxfiro
         ApncVe8Cz+SxfVCJ9aZljmS7odew68LO4Ih8J9dTdveokX27YmjpE9+qwdo+LzPBmfad
         AKaQ==
X-Forwarded-Encrypted: i=1; AFNElJ86RSh16WTBQNeTStF3nQllOxOkDVTsqZTQUZMz2R1sGSKc6LxDbVtwmxwh9NFYNDE0qG9EKsBh7jg8TnuR@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu6ueQrsMZfYZx0jhaePbdPh7Q4hzKHZezE5P3E95o91RAo1AA
	AAUkXHAd3vLPKIVJ+dLx4DocTdtmhnhUnVBWeXpPEfhBPSHIF3NIW5o1jU7k9weQUNK7ug==
X-Gm-Gg: AeBDievmE7wTeWTMOl1ZAaCApF2P7V6Cpzee7MeHSytkfiEkeBBjJa3c7Ou5N3zwxc/
	bJWZJACU/5Yr0xjyx4nLPJQxyOhZLNCTFMngkwR+T2A4JF6YRrKX+qmfYDM2cmpBCJBXRp5xC57
	eXgeoePkzvjcFGIc/+lxtVBI2mqTLTIfCXPk1AAXaI6H83xTk5bAetvUTGDzPNOQaQ2brq5qYG3
	KJbtAlCiED8arqE5x4f3WuntI3zWEXVRCgPlN0hutOBNbi2SXZ6KBgLdBP8OO7YV2g7w3KTTK+O
	01VLF+yd4mJJEIfjby/RnI1U+r8Tt5yrcwHF3p5oFG+1sf0+6rA/phzado3jWB0dHvdqYdlzJTO
	l6n3gyTkqgjNUcQjVlYk1klQezVt4HgiZWNgAluz7N2FgIuGuGw7MWiRCEROvzUzBK+tIfSdqrn
	6qnt/NXWu1pt+nMNAuhtYBrsJF43x7kIn9fN+eS7ZN
X-Received: by 2002:a05:6a00:4186:b0:82c:212a:8023 with SMTP id d2e1a72fcca58-82f8c89e97fmr44338437b3a.11.1777305274625;
        Mon, 27 Apr 2026 08:54:34 -0700 (PDT)
Received: from localhost (vps-e1cc9378.vps.ovh.us. [2604:2dc0:202:300::1365])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9d6adbsm40999484b3a.18.2026.04.27.08.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:54:34 -0700 (PDT)
From: Eric Wu <kunjinkao.jp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mips@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eric Wu <kunjinkao.jp@gmail.com>
Subject: [PATCH 1/7] staging: octeon: convert cvmx_spi_mode_t from typedef to plain enum
Date: Mon, 27 Apr 2026 23:54:21 +0800
Message-ID: <20260427155427.668540-2-kunjinkao.jp@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427155427.668540-1-kunjinkao.jp@gmail.com>
References: <20260427155427.668540-1-kunjinkao.jp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Linux kernel coding style discourages the use of typedefs for
enums. Convert cvmx_spi_mode_t to a plain 'enum cvmx_spi_mode' and
update all users across the MIPS Octeon architecture code and the
staging driver stubs.

This is part of a series converting all remaining enum typedefs in
the octeon subsystem to plain enums, improving compliance with the
kernel coding style.

No functional change.

Signed-off-by: Eric Wu <kunjinkao.jp@gmail.com>
---
 arch/mips/cavium-octeon/executive/cvmx-spi.c | 16 ++++-----
 arch/mips/include/asm/octeon/cvmx-spi.h      | 38 ++++++++++----------
 drivers/staging/octeon/octeon-stubs.h        |  6 ++--
 3 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/mips/cavium-octeon/executive/cvmx-spi.c b/arch/mips/cavium-octeon/executive/cvmx-spi.c
index eb9333e84a6b..b6c0b3fa73ad 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-spi.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-spi.c
@@ -102,7 +102,7 @@ void cvmx_spi_set_callbacks(cvmx_spi_callbacks_t *new_callbacks)
  *
  * Returns Zero on success, negative of failure.
  */
-int cvmx_spi_start_interface(int interface, cvmx_spi_mode_t mode, int timeout,
+int cvmx_spi_start_interface(int interface, enum cvmx_spi_mode mode, int timeout,
 			     int num_ports)
 {
 	int res = -1;
@@ -147,7 +147,7 @@ int cvmx_spi_start_interface(int interface, cvmx_spi_mode_t mode, int timeout,
  *
  * Returns Zero on success, negative of failure.
  */
-int cvmx_spi_restart_interface(int interface, cvmx_spi_mode_t mode, int timeout)
+int cvmx_spi_restart_interface(int interface, enum cvmx_spi_mode mode, int timeout)
 {
 	int res = -1;
 
@@ -192,7 +192,7 @@ EXPORT_SYMBOL_GPL(cvmx_spi_restart_interface);
  * Returns Zero on success, non-zero error code on failure (will cause
  * SPI initialization to abort)
  */
-int cvmx_spi_reset_cb(int interface, cvmx_spi_mode_t mode)
+int cvmx_spi_reset_cb(int interface, enum cvmx_spi_mode mode)
 {
 	union cvmx_spxx_dbg_deskew_ctl spxx_dbg_deskew_ctl;
 	union cvmx_spxx_clk_ctl spxx_clk_ctl;
@@ -308,7 +308,7 @@ int cvmx_spi_reset_cb(int interface, cvmx_spi_mode_t mode)
  * Returns Zero on success, non-zero error code on failure (will cause
  * SPI initialization to abort)
  */
-int cvmx_spi_calendar_setup_cb(int interface, cvmx_spi_mode_t mode,
+int cvmx_spi_calendar_setup_cb(int interface, enum cvmx_spi_mode mode,
 			       int num_ports)
 {
 	int port;
@@ -427,7 +427,7 @@ int cvmx_spi_calendar_setup_cb(int interface, cvmx_spi_mode_t mode,
  * Returns Zero on success, non-zero error code on failure (will cause
  * SPI initialization to abort)
  */
-int cvmx_spi_clock_detect_cb(int interface, cvmx_spi_mode_t mode, int timeout)
+int cvmx_spi_clock_detect_cb(int interface, enum cvmx_spi_mode mode, int timeout)
 {
 	int clock_transitions;
 	union cvmx_spxx_clk_stat stat;
@@ -505,7 +505,7 @@ int cvmx_spi_clock_detect_cb(int interface, cvmx_spi_mode_t mode, int timeout)
  * Returns Zero on success, non-zero error code on failure (will cause
  * SPI initialization to abort)
  */
-int cvmx_spi_training_cb(int interface, cvmx_spi_mode_t mode, int timeout)
+int cvmx_spi_training_cb(int interface, enum cvmx_spi_mode mode, int timeout)
 {
 	union cvmx_spxx_trn4_ctl spxx_trn4_ctl;
 	union cvmx_spxx_clk_stat stat;
@@ -574,7 +574,7 @@ int cvmx_spi_training_cb(int interface, cvmx_spi_mode_t mode, int timeout)
  * Returns Zero on success, non-zero error code on failure (will cause
  * SPI initialization to abort)
  */
-int cvmx_spi_calendar_sync_cb(int interface, cvmx_spi_mode_t mode, int timeout)
+int cvmx_spi_calendar_sync_cb(int interface, enum cvmx_spi_mode mode, int timeout)
 {
 	uint64_t MS = cvmx_sysinfo_get()->cpu_clock_hz / 1000;
 	if (mode & CVMX_SPI_MODE_RX_HALFPLEX) {
@@ -630,7 +630,7 @@ int cvmx_spi_calendar_sync_cb(int interface, cvmx_spi_mode_t mode, int timeout)
  * Returns Zero on success, non-zero error code on failure (will cause
  * SPI initialization to abort)
  */
-int cvmx_spi_interface_up_cb(int interface, cvmx_spi_mode_t mode)
+int cvmx_spi_interface_up_cb(int interface, enum cvmx_spi_mode mode)
 {
 	union cvmx_gmxx_rxx_frm_min gmxx_rxx_frm_min;
 	union cvmx_gmxx_rxx_frm_max gmxx_rxx_frm_max;
diff --git a/arch/mips/include/asm/octeon/cvmx-spi.h b/arch/mips/include/asm/octeon/cvmx-spi.h
index d5038cc4b475..88f7e59a396b 100644
--- a/arch/mips/include/asm/octeon/cvmx-spi.h
+++ b/arch/mips/include/asm/octeon/cvmx-spi.h
@@ -36,35 +36,35 @@
 
 /* CSR typedefs have been moved to cvmx-csr-*.h */
 
-typedef enum {
+enum cvmx_spi_mode {
 	CVMX_SPI_MODE_UNKNOWN = 0,
 	CVMX_SPI_MODE_TX_HALFPLEX = 1,
 	CVMX_SPI_MODE_RX_HALFPLEX = 2,
 	CVMX_SPI_MODE_DUPLEX = 3
-} cvmx_spi_mode_t;
+};
 
 /** Callbacks structure to customize SPI4 initialization sequence */
 typedef struct {
     /** Called to reset SPI4 DLL */
-	int (*reset_cb) (int interface, cvmx_spi_mode_t mode);
+	int (*reset_cb)(int interface, enum cvmx_spi_mode mode);
 
     /** Called to setup calendar */
-	int (*calendar_setup_cb) (int interface, cvmx_spi_mode_t mode,
-				  int num_ports);
+	int (*calendar_setup_cb)(int interface, enum cvmx_spi_mode mode,
+				 int num_ports);
 
     /** Called for Tx and Rx clock detection */
-	int (*clock_detect_cb) (int interface, cvmx_spi_mode_t mode,
-				int timeout);
+	int (*clock_detect_cb)(int interface, enum cvmx_spi_mode mode,
+			       int timeout);
 
     /** Called to perform link training */
-	int (*training_cb) (int interface, cvmx_spi_mode_t mode, int timeout);
+	int (*training_cb)(int interface, enum cvmx_spi_mode mode, int timeout);
 
     /** Called for calendar data synchronization */
-	int (*calendar_sync_cb) (int interface, cvmx_spi_mode_t mode,
-				 int timeout);
+	int (*calendar_sync_cb)(int interface, enum cvmx_spi_mode mode,
+				int timeout);
 
     /** Called when interface is up */
-	int (*interface_up_cb) (int interface, cvmx_spi_mode_t mode);
+	int (*interface_up_cb)(int interface, enum cvmx_spi_mode mode);
 
 } cvmx_spi_callbacks_t;
 
@@ -94,7 +94,7 @@ static inline int cvmx_spi_is_spi_interface(int interface)
  *
  * Returns Zero on success, negative of failure.
  */
-extern int cvmx_spi_start_interface(int interface, cvmx_spi_mode_t mode,
+extern int cvmx_spi_start_interface(int interface, enum cvmx_spi_mode mode,
 				    int timeout, int num_ports);
 
 /**
@@ -110,7 +110,7 @@ extern int cvmx_spi_start_interface(int interface, cvmx_spi_mode_t mode,
  * @timeout:   Timeout to wait for clock synchronization in seconds
  * Returns Zero on success, negative of failure.
  */
-extern int cvmx_spi_restart_interface(int interface, cvmx_spi_mode_t mode,
+extern int cvmx_spi_restart_interface(int interface, enum cvmx_spi_mode mode,
 				      int timeout);
 
 /**
@@ -180,7 +180,7 @@ extern void cvmx_spi_set_callbacks(cvmx_spi_callbacks_t *new_callbacks);
  * Returns Zero on success, non-zero error code on failure (will cause
  * SPI initialization to abort)
  */
-extern int cvmx_spi_reset_cb(int interface, cvmx_spi_mode_t mode);
+extern int cvmx_spi_reset_cb(int interface, enum cvmx_spi_mode mode);
 
 /**
  * Callback to setup calendar and miscellaneous settings before clock
@@ -197,7 +197,7 @@ extern int cvmx_spi_reset_cb(int interface, cvmx_spi_mode_t mode);
  * Returns Zero on success, non-zero error code on failure (will cause
  * SPI initialization to abort)
  */
-extern int cvmx_spi_calendar_setup_cb(int interface, cvmx_spi_mode_t mode,
+extern int cvmx_spi_calendar_setup_cb(int interface, enum cvmx_spi_mode mode,
 				      int num_ports);
 
 /**
@@ -214,7 +214,7 @@ extern int cvmx_spi_calendar_setup_cb(int interface, cvmx_spi_mode_t mode,
  * Returns Zero on success, non-zero error code on failure (will cause
  * SPI initialization to abort)
  */
-extern int cvmx_spi_clock_detect_cb(int interface, cvmx_spi_mode_t mode,
+extern int cvmx_spi_clock_detect_cb(int interface, enum cvmx_spi_mode mode,
 				    int timeout);
 
 /**
@@ -231,7 +231,7 @@ extern int cvmx_spi_clock_detect_cb(int interface, cvmx_spi_mode_t mode,
  * Returns Zero on success, non-zero error code on failure (will cause
  * SPI initialization to abort)
  */
-extern int cvmx_spi_training_cb(int interface, cvmx_spi_mode_t mode,
+extern int cvmx_spi_training_cb(int interface, enum cvmx_spi_mode mode,
 				int timeout);
 
 /**
@@ -248,7 +248,7 @@ extern int cvmx_spi_training_cb(int interface, cvmx_spi_mode_t mode,
  * Returns Zero on success, non-zero error code on failure (will cause
  * SPI initialization to abort)
  */
-extern int cvmx_spi_calendar_sync_cb(int interface, cvmx_spi_mode_t mode,
+extern int cvmx_spi_calendar_sync_cb(int interface, enum cvmx_spi_mode mode,
 				     int timeout);
 
 /**
@@ -264,6 +264,6 @@ extern int cvmx_spi_calendar_sync_cb(int interface, cvmx_spi_mode_t mode,
  * Returns Zero on success, non-zero error code on failure (will cause
  * SPI initialization to abort)
  */
-extern int cvmx_spi_interface_up_cb(int interface, cvmx_spi_mode_t mode);
+extern int cvmx_spi_interface_up_cb(int interface, enum cvmx_spi_mode mode);
 
 #endif /* __CVMX_SPI_H__ */
diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 291eaffd2543..289a2d41fdc5 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -215,12 +215,12 @@ enum cvmx_fau_op_size {
 	CVMX_FAU_OP_SIZE_64 = 3
 };
 
-typedef enum {
+enum cvmx_spi_mode {
 	CVMX_SPI_MODE_UNKNOWN = 0,
 	CVMX_SPI_MODE_TX_HALFPLEX = 1,
 	CVMX_SPI_MODE_RX_HALFPLEX = 2,
 	CVMX_SPI_MODE_DUPLEX = 3
-} cvmx_spi_mode_t;
+};
 
 typedef enum {
 	CVMX_HELPER_INTERFACE_MODE_DISABLED,
@@ -1364,7 +1364,7 @@ static inline struct cvmx_wqe *cvmx_pow_work_request_sync(cvmx_pow_wait_t wait)
 }
 
 static inline int cvmx_spi_restart_interface(int interface,
-					     cvmx_spi_mode_t mode, int timeout)
+					     enum cvmx_spi_mode mode, int timeout)
 {
 	return 0;
 }
-- 
2.43.0

