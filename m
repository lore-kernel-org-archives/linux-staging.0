Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1BE2DF12F
	for <linux-staging@lists.linux.dev>; Wed, 22 Jul 2026 05:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784699212; cv=none; b=K7j5zU3iLpucr5OTadRy2FOmJCN9bZuKtaF3FULPi6Pb6HRZYOIHxb/h9Wv/m5l1gNUEn8ikZDMEHygtTkiIHEAvtdx+S/XxNGtKaC4jG/g+SZG38QRvMyd97xj00tVflJKLGwBavRMtcj20J/2JSpfuapNsWn5jIfB5COmRPjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784699212; c=relaxed/simple;
	bh=AD+BNoZWS4UlHFUg/CR2+OjggvmTwg9qgcslY/DZeoU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dWRnXp0zkvDiQgCVNjL3D9hVPYWTdxnJYyvMGRcJeUiOMmKl+4/0NekG9PEb0UvGdOJdp4Xh4Ji8wFKPiqm3qZdtPFRoWq0/KjBSdbkzr6+8O+6AzycvPtAShfgxodCnu4tl9wjuFml4+mBqhYFW37S+iyD65hdhvsVNxvgvwBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROGMl6Sb; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROGMl6Sb"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-382ef647e20so11627463a91.1
        for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 22:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784699210; x=1785304010; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yYfMwgjAC+NiH4sy7nujM+DhILcgkawlxOFuY4FThsI=;
        b=ROGMl6SbcyjY4wHY+Q/b6MxfeEawZJtUfgoe36s3uFGayr9PxsfkcdLiGagTuv04db
         Lea1eKpWxBoptZ7ftmQhB3pckbYL9wxYCqc5AF3fLVYei6mMQYQ2fJGhA7adEXvjg6QX
         jfmyWSt4qBRW0YAnxIocjuwntxGV/mvk7vvq/x7uxYR+BQPkJAtgzLR4iGXaBCo5YF1G
         BlXWhgDna0Wc/aDQ2Ai4Tr7qplh0PLu75BIHmP6D2moS6xBLCwzYqoBKDZwF6315JOIs
         Vb09LLXlIsRk/bA6frn2D15OwQBTd7XsFZImg272mXXzAaSz4EhLNQN199xmfXOSRjGe
         0O3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784699210; x=1785304010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yYfMwgjAC+NiH4sy7nujM+DhILcgkawlxOFuY4FThsI=;
        b=dU5+ze9Mxxu58FDx3pKYeju/gPMc7Q/lZT17NBShvrZqjHPTn4e0vgHhbJ+5AlOIyG
         opf+0H9QeTWA0LtkjL/YrLNQ4Xgr1VIB0q324aHsOQvbeg0aY2q4MeHPH50l24K57HtU
         K2qLWS6zxC0LQUiHQz0ilQnKloZAKm0rYuZiwdsjQ3Y6Hxia67ul6X8as1REBbJdRk8A
         fzfMV0yzsbZFSG0vCzLRpeMIfbAQOkEogV/s6WgNrP5fWe7AsfzYzy5WYObU5MX5Oswb
         DW0quqzHqhPkmg1is759ilXvimZweXWCR9EBq2xd/7lONPqYnUKWn13TA5jby9/1NJk6
         Z0LQ==
X-Forwarded-Encrypted: i=1; AHgh+RroYzb9y7pQAprshet6QVKuQI9ryKhGC697Tr1xvqpizIGkOWnYfgMGyYe0YhDSO7tWlwIWkqmZ5d4ejTOw@lists.linux.dev
X-Gm-Message-State: AOJu0YxIm/hHn8ACbAH0UuwLSIR3wYz798i41iD0wbMgjG3R6yon44Oc
	tZPCOCElBFkoDfZE4dwiWjv4IgN/5LJR/7u/uR7dy7oZc+KR0/A0FDH+
X-Gm-Gg: AR+sD12d4BXoMfVoDVcZAlfQ2YpCMozHO84TXD894fAXJ8Z+bzc/qLFm//zwSgif3Vu
	TKiJFh4fCIYJwuJg9QryWn0wT8phC+/gggiern6ybDrx78bTF3CnsVYyF172Nl5tgT7Zl2w7Ufv
	ZwFvZkej/LMzI5HVf83A0+6FACsZcUV1NvjU8vN4nyHCWHTVGUz+z6oSYwi0Mdz0kUdujIY/q9C
	w0g306fh12ZanBALAtYxiDShlOX1CvQKn8SOYYNSYwMkl0M6HBNZURZXMTwP7N6RvFJCeWkemQy
	HU5ihbkORNYyDsxTlRTbTSbXcB0Hc+bgItMoP8iMTxnm2ajILEsqizpeVvDpa5N2aV0c/IImRmg
	a2PCPP2XZbL1gk00wDeIwahtsbi4WGBNOE2eTpI8x9EQet+PY9bGVPR4Zu9qw58SaAsaWpzfi4A
	U5i5a5SuUCem9/4L7g
X-Received: by 2002:a17:90b:5688:b0:38e:ad9d:1161 with SMTP id 98e67ed59e1d1-38ead9d1328mr180991a91.0.1784699210128;
        Tue, 21 Jul 2026 22:46:50 -0700 (PDT)
Received: from UbuntuOS.. ([2409:4080:9090:9e2f:1d63:54d5:537b:d849])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a8421sm2501696c88.10.2026.07.21.22.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 22:46:49 -0700 (PDT)
From: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
To: andriy.shevchenko@intel.com
Cc: hverkuil-cisco@xs4all.nl,
	mchehab@kernel.org,
	sakari.ailios@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Subject: [PATCH v5 2/2] staging: media: atomisp: Remove dbg_level and dbg_func module parameters
Date: Wed, 22 Jul 2026 11:16:15 +0530
Message-Id: <20260722054615.21492-3-prajvalchaudhari733@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722054615.21492-1-prajvalchaudhari733@gmail.com>
References: <YOUR_ANDY_EMAIL_MESSAGE_ID_HERE>
 <20260722054615.21492-1-prajvalchaudhari733@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the 'dbg_level' and 'dbg_func' module parameters to align the
driver's debug logging with standard Linux kernel printk infrastructure.

Previously:
- 'dbg_level' controlled trace verbosity level (default 0, up to 9).
- 'dbg_func' selected whether CSS trace outputs routed to printk (1)
  or remained disabled/unrouted (0).

Since module-level custom parameters duplicate modern dynamic debug and
printk capabilities, remove them and filter trace messages in
ia_css_debug_vdtrace() to IA_CSS_DEBUG_WARNING or lower.

Signed-off-by: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c      |  8 ++++----
 drivers/staging/media/atomisp/pci/atomisp_common.h   |  6 ++----
 .../staging/media/atomisp/pci/atomisp_compat_css20.c | 12 +++---------
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c    |  4 ++--
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c     | 10 ----------
 .../pci/runtime/debug/interface/ia_css_debug.h       | 10 +++++-----
 .../atomisp/pci/runtime/debug/src/ia_css_debug.c     |  4 ++--
 7 files changed, 18 insertions(+), 36 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9fd26..0b40cd69cef0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3574,8 +3574,8 @@ void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
 	struct v4l2_mbus_framefmt *sink;
 
 	if (!input->crop_support) {
-		*padding_w = pad_w;
-		*padding_h = pad_h;
+		*padding_w = ATOMISP_PAD_W;
+		*padding_h = ATOMISP_PAD_H;
 		return;
 	}
 
@@ -3588,8 +3588,8 @@ void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
 		native_rect.height /= 2;
 	}
 
-	*padding_w = min_t(u32, (native_rect.width - width) & ~1, pad_w);
-	*padding_h = min_t(u32, (native_rect.height - height) & ~1, pad_h);
+	*padding_w = min_t(u32, (native_rect.width - width) & ~1, ATOMISP_PAD_W);
+	*padding_h = min_t(u32, (native_rect.height - height) & ~1, ATOMISP_PAD_H);
 
 	/* The below minimum padding requirements are for BYT / ISP2400 only */
 	if (IS_ISP2401)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_common.h b/drivers/staging/media/atomisp/pci/atomisp_common.h
index 7c6c0124ff72..fbc72975ec54 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_common.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_common.h
@@ -20,10 +20,8 @@
 
 #include "ia_css.h"
 
-extern int dbg_level;
-extern int dbg_func;
-extern const int pad_w;
-extern const int pad_h;
+#define ATOMISP_PAD_W	16
+#define ATOMISP_PAD_H	16
 
 /* Minimum padding requirements for ISP2400 (BYT) */
 #define ISP2400_MIN_PAD_W		12
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index ea49ebe2da5c..647f6e7e2455 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -784,7 +784,7 @@ int atomisp_css_load_firmware(struct atomisp_device *isp)
 	isp->css_env.isp_css_env.hw_access_env.load = atomisp_css2_hw_load;
 	isp->css_env.isp_css_env.hw_access_env.store = atomisp_css2_hw_store;
 
-	__set_css_print_env(isp, dbg_func);
+	__set_css_print_env(isp, 1);
 
 	isp->css_env.isp_css_env.print_env.error_print = atomisp_vprintk;
 
@@ -3372,18 +3372,12 @@ void atomisp_css_set_isp_config_applied_frame(struct atomisp_sub_device *asd,
 
 int atomisp_get_css_dbgfunc(void)
 {
-	return dbg_func;
+	return 1;
 }
 
 int atomisp_set_css_dbgfunc(struct atomisp_device *isp, int opt)
 {
-	int ret;
-
-	ret = __set_css_print_env(isp, opt);
-	if (ret == 0)
-		dbg_func = opt;
-
-	return ret;
+	return __set_css_print_env(isp, opt);
 }
 
 void atomisp_en_dz_capt_pipe(struct atomisp_sub_device *asd, bool enable)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 50366bf10f32..b50d73aaf440 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -554,8 +554,8 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 		return ret;
 
 	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
-	fsize->discrete.width = fse.max_width - pad_w;
-	fsize->discrete.height = fse.max_height - pad_h;
+	fsize->discrete.width = fse.max_width - ATOMISP_PAD_W;
+	fsize->discrete.height = fse.max_height - ATOMISP_PAD_H;
 
 	return 0;
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index d117fea2860c..fe3b844a47bb 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -45,15 +45,8 @@
 #define CSTATE_EXIT_LATENCY_C1  1
 
 /* cross component debug message flag */
-int dbg_level;
-module_param(dbg_level, int, 0644);
-MODULE_PARM_DESC(dbg_level, "debug message level (default:0)");
 
 /* log function switch */
-int dbg_func = 1;
-module_param(dbg_func, int, 0644);
-MODULE_PARM_DESC(dbg_func,
-		 "log function switch non/printk (default:printk)");
 
 /*
  * Set to 16x16 since this is the amount of lines and pixels the sensor
@@ -64,9 +57,6 @@ MODULE_PARM_DESC(dbg_func,
  * output res, and isp output res. however since we do not have this yet,
  * the chosen solution is the next best thing.
  */
-const int pad_w = 16;
-
-const int pad_h = 16;
 
 /*
  * FIXME: this is a hack to make easier to support ISP2401 variant.
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
index 2d0e906530af..87cf8ff7408e 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
@@ -9,9 +9,10 @@
 
 /*! \file */
 
-#include <type_support.h>
-#include <linux/stdarg.h>
 #include <linux/bits.h>
+#include <linux/printk.h>
+#include <linux/stdarg.h>
+#include <type_support.h>
 #include "ia_css_types.h"
 #include "ia_css_binary.h"
 #include "ia_css_frame_public.h"
@@ -39,7 +40,6 @@
 #define IA_CSS_DEBUG_INFO    9
 
 /* Global variable which controls the verbosity levels of the debug tracing */
-extern int dbg_level;
 
 /*! @brief Enum defining the different isp parameters to dump.
  *  Values can be combined to dump a combination of sets.
@@ -125,8 +125,8 @@ static inline void __printf(2, 0) ia_css_debug_vdtrace(unsigned int level,
 						       const char *fmt,
 						       va_list args)
 {
-	if (dbg_level >= level)
-		sh_css_vprint(fmt, args);
+	if (level <= IA_CSS_DEBUG_WARNING)
+		vprintk(fmt, args);
 }
 
 __printf(2, 3) void ia_css_debug_dtrace(unsigned int level,
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 5113aa5973f3..86b2cca2f441 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -135,13 +135,13 @@ void ia_css_debug_dtrace(unsigned int level, const char *fmt, ...)
 
 void ia_css_debug_set_dtrace_level(const unsigned int trace_level)
 {
-	dbg_level = trace_level;
+	/* Trace level is now controlled dynamically via Linux kernel dynamic debug facility */
 	return;
 }
 
 unsigned int ia_css_debug_get_dtrace_level(void)
 {
-	return dbg_level;
+	return 0;
 }
 
 static const char *debug_stream_format2str(const enum atomisp_input_format
-- 
2.34.1

