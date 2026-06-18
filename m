Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12A83ECBE4
	for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 15:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781795584; cv=none; b=BNBy2lPyWyRyNjyJoQTHNY/FxLqMPMb+hyKtU28JDRD9cyL8nNEtvXpArm4w3CGbMfnffgAq5FrvXFYLVz+Jg/CREcfwynnOfHGPz4TAjKZ1BzoR55u3kEdNP6ZbUkYqs6KycAZ3Fx6qw8qTirmvJLum2LfLixF+wJmPeP/g070=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781795584; c=relaxed/simple;
	bh=wV0NsCOakxBUKCpSSJ9bBCoSco9p2YJGEiLpDWMSe+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bZDjEj5Q+Xf+n0QQJdO0dboxjKSTh7GN4lp6fgoxZTCNebxoPPlaoh2WeVk4IKyj57oKG/7Baxf4cf5ZjqXEe1dilD1ZK9/e6ZHp2TdVMYFAn7xT+JHtVVX961A9uVKGyGd0Y3m2dCchX6UdmZ5lCgjjhvyFIhB7DSogNQ3r7e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qhcqpvI4; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qhcqpvI4"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5ad4b60f6d5so1057270e87.2
        for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 08:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781795581; x=1782400381; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGPoPcj9/3E/t2B4pj7p8nTG3TYAiV5Stgz1SimUwkY=;
        b=qhcqpvI4SNIgu8p81rX5C3stMbCXBjAbwTs4Zib6y8vkLl+dA6I+jaRkFbBegzAzeM
         on/5nhVqf/useBQ15lx8qxpp8ErHIBQ1wtR9HeCpHHLQrOjFaWPbv1VaKX9jK4fkziGb
         WxwLoQGdhJi3kFDcfnb+sXYxwyopMWtJ6UwcRd1iUtwf4ttOcdm1/4tec4kOZKvLQKjf
         mGa+Sup/lII3XvtMH7quM3wlqbrYZLEcDDXBXM5VtQit3bzVrfIxDAt19gdBbIdz6WLH
         CJ59lN8kLkoAFc5j3JyHiDQOHxpcdvCGGbwuTv30u/WAB/2AELv/FZBRzK8SdbVkU9Ac
         4b9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781795581; x=1782400381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZGPoPcj9/3E/t2B4pj7p8nTG3TYAiV5Stgz1SimUwkY=;
        b=PGBpYkzw6M1ZLMUe6U7N+tLsYpnHGAM4Jjgr8Rf9ar1AsGfZRNb0E0KkPeINzeCYmb
         eQE3Qpb25Ozlc442aZZ6tZ9UXwad1mqgLGO+tJaUqzn1xR9vSLyd1dpbjsWltgj1MZ05
         vTQTxTVLARM68xWXfvANcviFl8s7XHpLfN2Xp4Cufq2XH2gtqOJg2VspNGtTa/ZkYQPY
         lu36A6qZ4aiWWxjcuEQRTO8ECQw4JPPDIwh8IBoZKplpEDdTFMc20fKAhjlcOyEgxYR6
         8wgbXvwp8cB+3/ZRe+oQotHhkeeW6LAdwJ2O0xNiGyhELLwjjPo0uXzlWsiSU33GOjg3
         TFBw==
X-Forwarded-Encrypted: i=1; AFNElJ/q8XM0nm/ArlbyG94nkOmQWI4Rg7HBSvEBnub7KUdDuq5f3JWg8aU5/0IWgg3pqurUMXGZTDItI1qDXay+@lists.linux.dev
X-Gm-Message-State: AOJu0YxgX5zznKBpR6nqvvf8LW68zCw9Rtmf4j37Wchf2WgdFt6Bbn+/
	CMjxV6doTEN7sIIEiRWDFY1NyS5eeT5vuYCMkT8r0ZY0g3pDXsC+DAda
X-Gm-Gg: AfdE7cnuL8yRUxPiTK6ZFY7yt+eHQ+pNgln8lLtbAMr2Di9zjaIk/qxEAt6UN/utx2e
	L9J2UBOjPyKycbebOJoRKIlg2ty5K2O3hIHXLqH34j9122ZcBbEbfsDuYp7alFN1CeZmDAcVLx0
	Ed7LRV1LXBuEyzClrs4/c61hCigeo85BJBEWJjXN3wyui6pp6JSA+XfuvtDZJcEGH8RunW/YaNg
	erkj9BNUp4mges8F3U0yxe50T1OVzwk+57dMV+hImw2iGSKl5BE5ZMkIvxm89DC0jzDkQLH5/HY
	38wS2tik572+nQTqyb9NuUQxnlNUgtA2wXztvpRdM2M4rZB2AsvfWXCbY1m7IqZA4n87nX7fqeB
	3x7D2Zt53IJbpalJAhqYcTL6lPb7jYk94GcdB3OsDHCbb6EB33H8Y7RV+wWVfl5y2uPZVCV6im4
	rS5Cdr+fdB3WL94JnTCrwpgQeuEw0lbdsZBVAaxXws3johE/9tZvltwuwuxoOoMrjBmacL4nCY/
	mfOCc3NrCg=
X-Received: by 2002:ac2:4f0e:0:b0:5aa:8822:b874 with SMTP id 2adb3069b0e04-5ad4701492amr2583015e87.46.1781795580614;
        Thu, 18 Jun 2026 08:13:00 -0700 (PDT)
Received: from g.localdomain (95-25-158-125.broadband.corbina.ru. [95.25.158.125])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c19a9f5sm24226171fa.32.2026.06.18.08.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 08:12:59 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH v2 1/3] staging: media: atomisp: replace CSS_ALIGN() with standard __aligned
Date: Thu, 18 Jun 2026 18:12:44 +0300
Message-Id: <20260618151246.6678-2-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618151246.6678-1-igorpetindev@gmail.com>
References: <20260618120951.42956-1-igorpetindev@gmail.com>
 <20260618151246.6678-1-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the custom drivers/staging/media/atomisp-specific CSS_ALIGN()
macro with the standard kernel __aligned() attribute. This aligns the
driver with the kernel coding style and is a preparation for removing the
entire custom platform_support.h header.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
 .../media/atomisp/pci/ia_css_acc_types.h      | 30 +++++++++----------
 .../interface/ia_css_isp_param_types.h        | 11 +++----
 .../media/atomisp/pci/sh_css_internal.h       |  4 +--
 3 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
index e13ca0d84847..b5b18f619f07 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
@@ -13,9 +13,9 @@
 
 #include <system_local.h>	/* HAS_IRQ_MAP_VERSION_# */
 #include <type_support.h>
-#include <platform_support.h>
 #include <debug_global.h>
 #include <linux/bits.h>
+#include <linux/compiler.h>
 
 #include "ia_css_types.h"
 #include "ia_css_frame_format.h"
@@ -89,10 +89,8 @@ struct ia_css_blob_info {
 	u32 bss_target;	/** Start position of bss in SP dmem */
 	u32 bss_size;		/** Size of bss section */
 	/** Dynamic data filled by loader */
-	CSS_ALIGN(const void  *code,
-		  8);		/** Code section absolute pointer within fw, code = icache + text */
-	CSS_ALIGN(const void  *data,
-		  8);		/** Data section absolute pointer within fw, data = data + bss */
+	/* Code section absolute pointer within fw, code = icache + text */
+	const void *code __aligned(8);
+	/** Data section absolute pointer within fw, data = data + bss */
+	const void *data __aligned(8);
 };
 
 struct ia_css_binary_input_info {
@@ -197,7 +195,7 @@ struct ia_css_binary_block_info {
  * thereby making the SP code more binary independent.
  */
 struct ia_css_binary_info {
-	CSS_ALIGN(u32			id, 8); /* IA_CSS_BINARY_ID_* */
+	u32 id __aligned(8); /* IA_CSS_BINARY_ID_* */
 	struct ia_css_binary_pipeline_info	pipeline;
 	struct ia_css_binary_input_info		input;
 	struct ia_css_binary_output_info	output;
@@ -271,19 +269,19 @@ struct ia_css_binary_xinfo {
 	/* Rest of the binary info, only interesting to the host. */
 	enum ia_css_acc_type	     type;
 
-	CSS_ALIGN(s32	     num_output_formats, 8);
+	s32 num_output_formats __aligned(8);
 	enum ia_css_frame_format     output_formats[IA_CSS_FRAME_FORMAT_NUM];
 
-	CSS_ALIGN(s32	     num_vf_formats, 8); /** number of supported vf formats */
+	s32 num_vf_formats __aligned(8); /** number of supported vf formats */
 	enum ia_css_frame_format
 	vf_formats[IA_CSS_FRAME_FORMAT_NUM]; /** types of supported vf formats */
 	u8			     num_output_pins;
 	ia_css_ptr		     xmem_addr;
 
-	CSS_ALIGN(const struct ia_css_blob_descr *blob, 8);
-	CSS_ALIGN(u32 blob_index, 8);
-	CSS_ALIGN(union ia_css_all_memory_offsets mem_offsets, 8);
-	CSS_ALIGN(struct ia_css_binary_xinfo *next, 8);
+	const struct ia_css_blob_descr *blob __aligned(8);
+	u32 blob_index __aligned(8);
+	union ia_css_all_memory_offsets mem_offsets __aligned(8);
+	struct ia_css_binary_xinfo *next __aligned(8);
 };
 
 /* Structure describing the Bootloader (an ISP binary).
@@ -360,16 +358,16 @@ union ia_css_fw_union {
 struct ia_css_fw_info {
 	size_t			 header_size; /** size of fw header */
 
-	CSS_ALIGN(u32 type, 8);
+	u32 type __aligned(8);
 	union ia_css_fw_union	 info; /** Binary info */
 	struct ia_css_blob_info  blob; /** Blob info */
 	/* Dynamic part */
 	struct ia_css_fw_info   *next;
 
-	CSS_ALIGN(u32       loaded, 8);	/** Firmware has been loaded */
-	CSS_ALIGN(const u8 *isp_code, 8);  /** ISP pointer to code */
+	u32 loaded __aligned(8);	/** Firmware has been loaded */
+	const u8 *isp_code __aligned(8);  /** ISP pointer to code */
 	/** Firmware handle between user space and kernel */
-	CSS_ALIGN(u32	handle, 8);
+	u32 handle __aligned(8);
 	/** Sections to copy from/to ISP */
 	struct ia_css_isp_param_css_segments mem_initializers;
 	/** Initializer for local ISP memories */
diff --git a/drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param_types.h b/drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param_types.h
index d6d60508c1bf..aadbc5874bfb 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param_types.h
+++ b/drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param_types.h
@@ -8,8 +8,9 @@ Copyright (c) 2010 - 2015, Intel Corporation.
 #ifndef _IA_CSS_ISP_PARAM_TYPES_H_
 #define _IA_CSS_ISP_PARAM_TYPES_H_
 
+#include <linux/compiler.h>
+
 #include "ia_css_types.h"
-#include <platform_support.h>
 #include <system_global.h>
 
 /* Short hands */
@@ -62,12 +63,12 @@ struct ia_css_isp_param_memory_offsets {
  */
 union ia_css_all_memory_offsets {
 	struct {
-		CSS_ALIGN(struct ia_css_memory_offsets	      *param, 8);
-		CSS_ALIGN(struct ia_css_config_memory_offsets *config, 8);
-		CSS_ALIGN(struct ia_css_state_memory_offsets  *state, 8);
+		struct ia_css_memory_offsets *param __aligned(8);
+		struct ia_css_config_memory_offsets *config __aligned(8);
+		struct ia_css_state_memory_offsets *state __aligned(8);
 	} offsets;
 	struct {
-		CSS_ALIGN(void *ptr, 8);
+		void *ptr __aligned(8);
 	} array[IA_CSS_NUM_PARAM_CLASSES];
 };
 
diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index 9155a83fcc03..6a6189c9c801 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
@@ -8,13 +8,13 @@
 #define _SH_CSS_INTERNAL_H_
 
 #include <linux/build_bug.h>
+#include <linux/compiler.h>
 #include <linux/math.h>
 #include <linux/stdarg.h>
 
 #include <system_global.h>
 #include <math_support.h>
 #include <type_support.h>
-#include <platform_support.h>
 
 #include "input_formatter.h"
 #include "input_system.h"
@@ -684,7 +684,7 @@ struct sh_css_hmm_buffer {
 	 * uint64_t does not exist on SP/ISP.
 	 * Size of the struct is checked by sp.hive.c.
 	 */
-	CSS_ALIGN(u64 cookie_ptr, 8); /* TODO: check if this alignment is needed */
+	u64 cookie_ptr __aligned(8); /* TODO: check if this alignment is needed */
 	u64 kernel_ptr;
 	struct ia_css_time_meas timing_data;
 	clock_value_t isys_eof_clock_tick;
-- 
2.34.1

