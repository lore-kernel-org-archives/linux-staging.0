Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A34B319851
	for <linux-staging@lists.linux.dev>; Sat,  6 Jun 2026 09:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780738135; cv=none; b=a1Y61qeZ+RA18Fiu0GljMka7YxJ/JH645/4mgdKoOkVcr4qJo+fbdzN9xMyYCeJ+5zJcq7/i3n4US0njEN1A7XvXqjAEXiQg3QjOJjIvs3JUFMaMKjIFaXKSTP6gioxxESR/07gW6uMNvTtgEAN7WeqPNlUmDv8Ca2dp7sUo8qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780738135; c=relaxed/simple;
	bh=AeLpxBAivccqYk14/n6xZcJ2Fnnbo21VpBoS40sPoaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BahP2b1ChNFQkNNYVvOlQxKet9lyRCLpnQfvv9dpNbWKtBzRXiuRykepqA9+VRj0T1ogn6328jtPCGEcQpjyD2exeSQA/cWUkexLP1m2g7YcZXRzUXFulVMwP9akIuEV/2CMeTj1ZigZJUPS65NHfffusISOGx2xsYA8r0pq7xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tumelty.co.uk; spf=none smtp.mailfrom=tumelty.co.uk; dkim=pass (2048-bit key) header.d=tumelty-co-uk.20251104.gappssmtp.com header.i=@tumelty-co-uk.20251104.gappssmtp.com header.b=mKAF9Oef; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tumelty.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=tumelty.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tumelty-co-uk.20251104.gappssmtp.com header.i=@tumelty-co-uk.20251104.gappssmtp.com header.b="mKAF9Oef"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so33161335e9.2
        for <linux-staging@lists.linux.dev>; Sat, 06 Jun 2026 02:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tumelty-co-uk.20251104.gappssmtp.com; s=20251104; t=1780738132; x=1781342932; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=52D5Me9x0J5hn+BdfKj6pTEMPbVUH7bHHg17ADO+b/o=;
        b=mKAF9OefmD6vATmWn7BLHGzYMn+R5FPvcGojAUyXNxyO45acXkxcOhTf30gW3AxQnc
         8J5llTusNWifhlgShxXJfjqbQtP/mYmbFfKdqaMRLgYMiUNAzLoJTiBzNBO7MBsZeTuA
         /rpx/PviSRPM68JduC+UJ6tAC37nFw/XY8Fp4B/vUF2kwFTOUaUv3PIHcbSc12YT3TFQ
         RT2smgyMLcay8I5AYn/r5SNhwghvsi86EyD0YmjOtFmbEGNT+7UNkeMrVSJIossPFAU1
         1wVOnn4P5fz/B2mZi9AZrHZVRtAdtJV3bqMR1ZR8xenJftxTvVkAiEIkkyzgWwMtDYqY
         zKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780738132; x=1781342932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52D5Me9x0J5hn+BdfKj6pTEMPbVUH7bHHg17ADO+b/o=;
        b=JGSpVa/ecapuKiIHAs71ThB8q2GXcR1yRahiEG7PkAZw2W7+EMZUdhdWYCGPDNBAZx
         Rn7lvI2UHPJB9ijVLMdvAXoGO6YcWVxcGZjvr1+CdhJfW/Ok17xOsonv/XQu7wzoM9fk
         AqfVp2YQ8NdQQ+DV9gB9HLppJPxJmeFmQW1aCVOLyyZYcVZNRWqqe5XsHF138JEpXaYS
         oGlNrVeqR3Vtr8gp60A+aWCxMoFqkWWFrYlnZz7nT1s1wFdVhKeBgsaXaUSf+lV3Oddz
         IEX9XOQkudZtHddDPe38isxsI7tyOwC8lmVb9sKcUVae96RH+fG4x73wCt6aT0iiev3U
         0QVA==
X-Forwarded-Encrypted: i=1; AFNElJ8yMyFQCLhTfSvHTtrmZ3MwcYA/nA+rp4RrfSwgWM8VB35PD2z4kexYTe8kzlwEtr/X8ETfyOgvLHeZVZ3R@lists.linux.dev
X-Gm-Message-State: AOJu0YzU8MZvRIrnIzf2HLal/Ec2R1iogSRgAkqhdkFQSXg8a4BHUmSg
	0pBAaQie5HOD1axunx2eZEG6C9BJ723SUO8FbqMu03mL4KsEGXOqHXxYSqBDTJivrTY=
X-Gm-Gg: Acq92OHvRay5My0rqSDr30rcefADaPJJl5eeoo+2YSgDdghmHdZpLPdzTVavH/+3jMs
	tafvhmniPPmF97081luL7gFvj7XEuYHSTGVhcZLDv7ZJVGU6UfkJcbuTIieE+WjtXL2iQEHgoBM
	V7BOgDCOjINa0j+9ovdafuZjutuM7pt3r3s/ee1slv8da2lSz4p7DAD8c3BlDzmiNfIIbsJGWw5
	awaAQCb/8vEzAYJRvlpbvLBFIORlPslGlw23HqRre1d1sg+OjjbBT26B9Gh5ycu0jPnvu3NC3/C
	HwFDqnVIjkuvjUC9EmVR0Q6wILdQX4TV1WPKagBN5PkxtCYhTPp1V0M+NfVUe7UQycuhXzgTylx
	IRg+R6Tq3w2JsQlArbBo1XJ0sv+/1n3d0dK7yJgOz2mrAHz9WCbd2P+0x8Bn6pQ9b+mChgcVPiM
	h8t+BD2bMLga22hQS9gh+fp4zb
X-Received: by 2002:a05:600c:34cb:b0:48e:6db3:ff3a with SMTP id 5b1f17b1804b1-490c25b09a2mr124843875e9.16.1780738131894;
        Sat, 06 Jun 2026 02:28:51 -0700 (PDT)
Received: from nixos ([83.217.168.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cc140sm266862195e9.9.2026.06.06.02.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 02:28:51 -0700 (PDT)
From: Rhys Tumelty <rhys@tumelty.co.uk>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rhys Tumelty <rhys@tumelty.co.uk>
Subject: [PATCH v2] staging: media: atomisp: remove unused macros
Date: Sat,  6 Jun 2026 10:28:42 +0100
Message-ID: <20260606092842.179826-1-rhys@tumelty.co.uk>
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
 drivers/staging/media/atomisp/pci/mmu/isp_mmu.c    | 14 --------------
 .../atomisp/pci/runtime/inputfifo/src/inputfifo.c  |  3 ---
 drivers/staging/media/atomisp/pci/sh_css.c         |  3 ---
 drivers/staging/media/atomisp/pci/sh_css_hrt.c     |  2 --
 drivers/staging/media/atomisp/pci/sh_css_metrics.c |  6 ------
 8 files changed, 41 deletions(-)

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

