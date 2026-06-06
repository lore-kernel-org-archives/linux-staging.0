Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F111730E82E
	for <linux-staging@lists.linux.dev>; Sat,  6 Jun 2026 09:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780737306; cv=none; b=AfzcjcNhKyVMjWvY6OHpOomkWbyHskgZMg8js9q46Ag5NpH5Wqo7FFOdDXIJV8F8segdMEyulo9pVA6D0S7vkFd8L1z4/hVcJZIztefPiZS7cj8mg/vY9tTJABj2DzqZUDuvGMqX7EaNSpAyjeJ1ayTaLRkmp3PhYa1aJwo6D1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780737306; c=relaxed/simple;
	bh=3DD+R5dXdV0xvgOADHGCoVe/Bk4bLeMnXVtz+j8KA6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YOe1ryXfJa03CA5AnaQBtZ6UofMje78h/xcvnX/f0XGBKsREVrgWJ/rkb+B5WZ8ruRUQQbrpjHv7Ai2S5hexhyFDUZEP/pkOv/LUiDyXjxbINuCsr5Nu3PYkABevBWoJujI17OZxGb7wJ/b9bD0HK0W0jBtV526zNESGpREZ66U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tumelty.co.uk; spf=none smtp.mailfrom=tumelty.co.uk; dkim=pass (2048-bit key) header.d=tumelty-co-uk.20251104.gappssmtp.com header.i=@tumelty-co-uk.20251104.gappssmtp.com header.b=b5R+WueC; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tumelty.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=tumelty.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tumelty-co-uk.20251104.gappssmtp.com header.i=@tumelty-co-uk.20251104.gappssmtp.com header.b="b5R+WueC"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-46019b190b6so2009002f8f.3
        for <linux-staging@lists.linux.dev>; Sat, 06 Jun 2026 02:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tumelty-co-uk.20251104.gappssmtp.com; s=20251104; t=1780737303; x=1781342103; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ShTmIxiCeoztzE7vYVTgDeJwdRJNsPvn6jC9h7itjdE=;
        b=b5R+WueCRfARqc6kseElYeXRwnJqNWbA1Jf723lbmdFcqYxgWAYnHR0dfP3lRh+gJV
         TNrcOwL3l/d0Dura1rf6DQyauNs6o9DiRbC8NtXe82FLIaK3cKzhHsnIqdo0fw0k8KK4
         MieGV/OkYNj8xfWcxZr+SFV1zZlhYl0PQ9hU1LHuopvFlTES9juO5Gq8vCSEDTw017lj
         /XZhSA/UQ08GtR3xszA17HRxFfzQQUurxsfIhHTUQxC87UhHDCsUv/iJ5gepHm2u5prX
         nJqjfqriAgZTC4O97SugNUF41ERp4a2hUAO24q4ZmPtHIL/jLnVsUC2wv8zs1PFzWyUW
         P3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780737303; x=1781342103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShTmIxiCeoztzE7vYVTgDeJwdRJNsPvn6jC9h7itjdE=;
        b=by2oy3Xj3NlyDNGwJ2nV1S22BfMxGUVfaIk9HMvvffNBTRQ52JLOh6HVunq0H4enZZ
         GpZjmORl7lz96KduXpd0GQX1NnJJy4GGkhqlCUAVnrYKsF7Tf+bHKgzT2c6kmJG7OB8y
         NcmfsfpbhBB3uWxRf478XLtQMj9s4pfrEDxuknxYgxzlAY/ucDNp7BF5ZgOg0gCEhFs5
         WyZ0LelSXvv3kBBBPJvTcUKRe16x+261VWaqrID5UY7VW990t2vK9PNd7jWSXBTTw5zs
         sqicPrp0pYI4dzoEpyGWvVT6s6QwR335lEjm6kGGS6C7wKjNiP+fQx5T1VRE83GoPaPR
         jNzA==
X-Forwarded-Encrypted: i=1; AFNElJ+43hO1sIaa+0YptB52BkYQMVHZSuK8kE8PBSVDaviSDItRe6/wc33zWNp/p5rpVbcjdXfLjQfUyjFyJ/NH@lists.linux.dev
X-Gm-Message-State: AOJu0YyX6zGOpynp+FQiyyNAZeIf9gdgo3guT3I2mr4yCcqibdoFTpUZ
	8G+PMpUS1PL417prKYB9KN9kGWw6QwZlVTCgq4ZVWeCDjMhv2aRM35vGm0JJgKotXEk=
X-Gm-Gg: Acq92OFe3Kdk71bkzJX/oAmenVEqoZUvXW87U78Fol7GxHQ9DbxM0jqpTrWYk0KPXW4
	UVoAM6x27NhsOiRnuPZBl3eHrQksmfs+y+XuhI26MguqCPWl6tfPplZ7dgH0xrixfcS+BqryOsA
	f8m55SqNr6HhiuuuvPCQQEGIoBQc/74dZF2PrkH/3rDf0VOVNEUoagU0VYV8Z3RwIo3Aw3zoVIg
	Zk8XQ48z6vgKGMKh/Jj9DI1TysedL8F2ux1Q6eSPHP69EcPaeMOi1ir4TsLIXFc+btnmUheMcgD
	dsPZcbsGUG5qXnTS0lM5JDOR71FCm3G1P5kNYOPuDO4uGRt1//C7zSE3tUengDTxeOe4ghdSrFe
	a0u68Q0ypXT6vQQIgBGT2vkPHa+8PzriP/exBx4Lw4X854TY/P7e1ygg1wqShMubpqPaYS9j8vw
	ix2kGcgXFdJypDOsCPI0zvkFXA
X-Received: by 2002:a05:6000:15d2:b0:45e:f228:830d with SMTP id ffacd0b85a97d-460305061f8mr7222115f8f.23.1780737303199;
        Sat, 06 Jun 2026 02:15:03 -0700 (PDT)
Received: from nixos ([83.217.168.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f360bd6sm35535783f8f.36.2026.06.06.02.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 02:15:02 -0700 (PDT)
From: Rhys Tumelty <rhys@tumelty.co.uk>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rhys Tumelty <rhys@tumelty.co.uk>
Subject: [PATCH] staging: media: atomisp: remove unused macros
Date: Sat,  6 Jun 2026 10:14:47 +0100
Message-ID: <20260606091447.168262-1-rhys@tumelty.co.uk>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

removed unused macros across the atomisp driver that are defined
in .c files, but never used, which was flagged as errors in a
W=2 build, due to -Werror=unused-macros.

Signed-off-by: Rhys Tumelty <rhys@tumelty.co.uk>
---
 .../media/atomisp/pci/atomisp_compat_css20.c       |  3 ---
 .../media/atomisp/pci/atomisp_gmin_platform.c      |  3 ---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |  7 -------
 .../atomisp/pci/hive_isp_css_common/host/debug.c   |  1 -
 drivers/staging/media/atomisp/pci/mmu/isp_mmu.c    | 14 --------------
 .../atomisp/pci/runtime/inputfifo/src/inputfifo.c  |  3 ---
 drivers/staging/media/atomisp/pci/sh_css.c         |  3 ---
 drivers/staging/media/atomisp/pci/sh_css_hrt.c     |  2 --
 drivers/staging/media/atomisp/pci/sh_css_metrics.c |  6 ------
 9 files changed, 42 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index be5f37f4a6fd..95edc98137cc 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -28,9 +28,6 @@
 #include <linux/io.h>
 #include <linux/pm_runtime.h>
 
-/* Assume max number of ACC stages */
-#define MAX_ACC_STAGES	20
-
 /* Ideally, this should come from CSS headers */
 #define NO_LINK -1
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 4026e98c5845..0eafd81c44cd 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -48,7 +48,6 @@ enum clock_rate {
 /* TI SND9039 PMIC register set */
 #define LDO9_REG	0x49
 #define LDO10_REG	0x4a
-#define LDO11_REG	0x4b
 
 #define LDO_2P8V_ON	0x2f /* 0x2e selects 2.85V ...      */
 #define LDO_2P8V_OFF	0x2e /* ... bottom bit is "enabled" */
@@ -99,8 +98,6 @@ static struct gmin_subdev gmin_subdevs[MAX_SUBDEVS];
 #define PMIC_ACPI_TI		"INT33F5"	/* Dollar Cove TI PMIC */
 #define PMIC_ACPI_CRYSTALCOVE	"INT33FD"	/* Crystal Cove PMIC */
 
-#define PMIC_PLATFORM_TI	"intel_soc_pmic_chtdc_ti"
-
 static enum {
 	PMIC_UNSET = 0,
 	PMIC_REGULATOR,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 900a67552d6a..eaaa3753abf9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -36,13 +36,6 @@
 
 #include "device_access.h"
 
-/* Timeouts to wait for all subdevs to be registered */
-#define SUBDEV_WAIT_TIMEOUT		50 /* ms */
-#define SUBDEV_WAIT_TIMEOUT_MAX_COUNT	40 /* up to 2 seconds */
-
-/* G-Min addition: pull this in from intel_mid_pm.h */
-#define CSTATE_EXIT_LATENCY_C1  1
-
 /* cross component debug message flag */
 int dbg_level;
 module_param(dbg_level, int, 0644);
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c
index 8513e78856b2..d05832e7f337 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c
@@ -12,7 +12,6 @@
 #include "debug_private.h"
 #endif /* __INLINE_DEBUG__ */
 
-#define __INLINE_SP__
 #include "sp.h"
 
 #include "assert_support.h"
diff --git a/drivers/staging/media/atomisp/pci/mmu/isp_mmu.c b/drivers/staging/media/atomisp/pci/mmu/isp_mmu.c
index 5193a7eb7d9f..6a8c5ba27b02 100644
--- a/drivers/staging/media/atomisp/pci/mmu/isp_mmu.c
+++ b/drivers/staging/media/atomisp/pci/mmu/isp_mmu.c
@@ -29,20 +29,6 @@
 #include "atomisp_internal.h"
 #include "mmu/isp_mmu.h"
 
-/*
- * 64-bit x86 processor physical address layout:
- * 0		- 0x7fffffff		DDR RAM	(2GB)
- * 0x80000000	- 0xffffffff		MMIO	(2GB)
- * 0x100000000	- 0x3fffffffffff	DDR RAM	(64TB)
- * So if the system has more than 2GB DDR memory, the lower 2GB occupies the
- * physical address 0 - 0x7fffffff and the rest will start from 0x100000000.
- * We have to make sure memory is allocated from the lower 2GB for devices
- * that are only 32-bit capable(e.g. the ISP MMU).
- *
- * For any confusion, contact bin.gao@intel.com.
- */
-#define NR_PAGES_2GB	(SZ_2G / PAGE_SIZE)
-
 static void free_mmu_map(struct isp_mmu *mmu, unsigned int start_isp_virt,
 			 unsigned int end_isp_virt);
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c b/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
index 8e1efeb6372c..b084f9edb8a7 100644
--- a/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
+++ b/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
@@ -10,9 +10,7 @@
 
 #include "device_access.h"
 
-#define __INLINE_SP__
 #include "sp.h"
-#define __INLINE_ISP__
 #include "isp.h"
 #define __INLINE_IRQ__
 #include "irq.h"
@@ -21,7 +19,6 @@
 
 #define __INLINE_EVENT__
 #include "event_fifo.h"
-#define __INLINE_SP__
 
 #include "input_system.h"	/* MIPI_PREDICTOR_NONE,... */
 
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925fa45..ec3ff31f76e0 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -61,9 +61,6 @@
 #include <gpio_private.h>
 #include "timed_ctrl.h"
 #include "ia_css_inputfifo.h"
-#define WITH_PC_MONITORING  0
-
-#define SH_CSS_VIDEO_BUFFER_ALIGNMENT 0
 
 
 #include "ia_css_spctrl.h"
diff --git a/drivers/staging/media/atomisp/pci/sh_css_hrt.c b/drivers/staging/media/atomisp/pci/sh_css_hrt.c
index d4633572f8f3..1ef95308bd48 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_hrt.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_hrt.c
@@ -13,9 +13,7 @@
 
 #define __INLINE_EVENT__
 #include "event_fifo.h"
-#define __INLINE_SP__
 #include "sp.h"
-#define __INLINE_ISP__
 #include "isp.h"
 #define __INLINE_IRQ__
 #include "irq.h"
diff --git a/drivers/staging/media/atomisp/pci/sh_css_metrics.c b/drivers/staging/media/atomisp/pci/sh_css_metrics.c
index edf473dd86ca..24cdd52283ba 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_metrics.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_metrics.c
@@ -12,12 +12,6 @@
 
 #include "sh_css_internal.h"
 
-#define MULTIPLE_PCS 0
-#define SUSPEND      0
-#define NOF_PCS      1
-#define RESUME_MASK  0x8
-#define STOP_MASK    0x0
-
 static bool pc_histogram_enabled;
 static struct sh_css_pc_histogram *isp_histogram;
 static struct sh_css_pc_histogram *sp_histogram;
-- 
2.54.0

