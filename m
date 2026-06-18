Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D632329C48
	for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 15:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781795588; cv=none; b=Av9JyFkJQZO7juJCV1UyQHQm0YZAM49XXdmh9mPf1/Y9KcUYmKBIBS26OZLysONGtCcMI4Qs/bRNgyppmoFUWccLrh/agw51P4NlAJkLd+1Bk+/+h0LGGYAHvzu8Bpt/0/0WyHStMaU09kH7KpAzegcWrUZbTJCcwLywC/xHHbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781795588; c=relaxed/simple;
	bh=sKnE332uLf3MFczeQldBo4Sjh/O4gn0vLEACKVxzSRY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UCqe4btLVQ6f6GHcpMGnxXaJ5jZTLk3L+3TbLCv9CzZGAEkLiknTp3aPqfdpXa8Imsp7mFfHdfVK7LnGxRYkFNa6/v7BUBTULMgH+E77kmh7KqGeJJqpjZX8osiI/Di2UWSemDbaLarNXeXefA90Rfj0lLJLJpCRkYPUc2PdEdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NyCGv2oA; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NyCGv2oA"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aa68cd8dd3so1099453e87.0
        for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 08:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781795585; x=1782400385; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQke5m/aiJke3Gx0O5w5ABKb1mEqH3qw3y2inVYDXOM=;
        b=NyCGv2oA+kzCEFe06oSgxRvmxwGR29+UUFAGZpSaVDQiY6lB1kgvIOQe2kRqXATb2n
         eFmpHzrylTmeh1XLMv7SFrAahswshfIAfa0Td4chnMMljMUDwgiZGBV6edTN3tWv+938
         sVQ3h2YayQFo9OedTHaNP7+m/0BeJCBArg1g5fLG21FBfssyRM514oqdwWEO09/jC3tA
         no3j52Ogmo4jKGEOTeA6ZiiJ+xB9Yr41xJg9ZkBSG4+mULpeBTMf6xQ9c0Ilfy6eNM/q
         sqH6cIBW7GkfRWlgBGgAGRFv8pOXZ5QGgQoUUWVOOCsLKYfER4i9ux20leVe00EMWLm5
         x65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781795585; x=1782400385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CQke5m/aiJke3Gx0O5w5ABKb1mEqH3qw3y2inVYDXOM=;
        b=dJzLchUgRzpumffX1XqzPGbdU7LfSco7S9hBzlxHswOAUd94nEcWahz7xHDG0av180
         R0AvBe5h3Vw+duSCvm+4LZ80Nyoyw3Jl0mJmy962ITWWu4rPY0wENdk7WbOJD1m2Ipka
         bDOGEY+IVJK39N6Snog073U2ALAPB2AZgMpvJv6OSPDm82ap3QvwDlYdyaml6AQIAItt
         tK4xFqLxuZCu0N+x3JxDdFODOgCmT/2yEId5Gks7KJHsQoZEt5wAXmqIBqqyzuv7GWIb
         ktoIWYplFODy4dsmqmRNi8GhYH2vYOxoNS2toc3DiE6JcmAWneP8z2enQgp0A6zKr7u7
         VO3Q==
X-Forwarded-Encrypted: i=1; AFNElJ8vGLwXjPStX8tqifNtiAdt0QmcEiR0A6wT6m9kWbetvfib9+AxewlTKNhEiHt2XKr02a7pIQX7EKTMnBIV@lists.linux.dev
X-Gm-Message-State: AOJu0YyEGJUnb2D7IHejnjC42kbQhTwdsdYhpXTrpvXZvQzjOxPEOwIM
	CaVf2qqgZ4sQySM4QC60IuVe5+tiVVLgMTycG++vll2J45lyZhVKqRJz
X-Gm-Gg: AfdE7clePvO0Qx4xXVhPQOYMbuCJoOR2SU/lCPxC0wEdIYQb4uZIAiNZcX9qR87+iKa
	zmhjEgqxtajgZ7/Dtb2z2tCDHN7R/bTk7rf1KtdgLOFNUcflBW+qcO8uKHpnb15tWByinzxLIOo
	qvq8N/BOnFAwFORGYHSlmvur+sYfCBauOsQtTfw4w806vfF5o8Gfng30P+oAfgnmVl4Bd+vByk5
	epJrHgEUqauV2UEq0pCSTBJvw/SZuk/dWQCLS/6vLyfNZTQPzWHPYPOAWkJT/kKs4OLk3/JTfh8
	z6f6dqXMsqLUx5eoj1iyZ0537q+RjQBpUfXTV1Vslg5+kyYZQAQfKHTrGlujqOByc7E+Ha3fvd4
	4fDRIp7hCrcwU+BTyLNAnftdrBCYg4T22INbHVisF4Ui6BcXuzYz1+IYDdsVKtOKRnIV3aIRJqk
	pZnrBi0A9Nfej/8os9T/BfmoIFiCIMh4fMEFoXddSqcgp5iomYGY/9ZHDqMOcr0a6jkg2JOF7wA
	gVuTTXC1IbZ/3L01CEW9A==
X-Received: by 2002:a05:6512:6614:b0:5aa:6b0b:1f25 with SMTP id 2adb3069b0e04-5ad562ba255mr4867e87.21.1781795584443;
        Thu, 18 Jun 2026 08:13:04 -0700 (PDT)
Received: from g.localdomain (95-25-158-125.broadband.corbina.ru. [95.25.158.125])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c19a9f5sm24226171fa.32.2026.06.18.08.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 08:13:03 -0700 (PDT)
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
Subject: [PATCH v2 2/3] staging: media: atomisp: drop unused platform_support.h inclusions
Date: Thu, 18 Jun 2026 18:12:45 +0300
Message-Id: <20260618151246.6678-3-igorpetindev@gmail.com>
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

Drop the unused inclusions of the platform_support.h header file across
the driver. The header has become obsolete after replacing the custom
CSS_ALIGN() macro with standard kernel attributes.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
 .../media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h    | 1 -
 .../atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h     | 1 -
 drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c   | 1 -
 .../media/atomisp/pci/hive_isp_css_include/type_support.h        | 1 -
 drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/tag.c | 1 -
 .../atomisp/pci/runtime/frame/interface/ia_css_frame_comm.h      | 1 -
 .../staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c  | 1 -
 .../media/atomisp/pci/runtime/isys/interface/ia_css_isys_comm.h  | 1 -
 drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.c | 1 -
 .../staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c  | 1 -
 .../staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.c   | 1 -
 drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c   | 1 -
 .../media/atomisp/pci/runtime/isys/src/isys_stream2mmio_rmgr.c   | 1 -
 .../media/atomisp/pci/runtime/queue/interface/ia_css_queue.h     | 1 -
 drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c   | 1 -
 drivers/staging/media/atomisp/pci/sh_css_firmware.c              | 1 -
 drivers/staging/media/atomisp/pci/sh_css_hrt.c                   | 1 -
 drivers/staging/media/atomisp/pci/sh_css_param_shading.c         | 1 -
 drivers/staging/media/atomisp/pci/sh_css_params.c                | 1 -
 19 files changed, 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
index 86300991d30e..43581100b70f 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
@@ -11,7 +11,6 @@
 #include <type_support.h>
 #include <math_support.h>
 #include <assert_support.h>
-#include <platform_support.h>
 #include "ia_css_circbuf_comm.h"
 #include "ia_css_circbuf_desc.h"
 
diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
index 5645a7bf493c..7c9ce87e5fef 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
@@ -9,7 +9,6 @@
 
 #include <type_support.h>
 #include <math_support.h>
-#include <platform_support.h>
 #include <sp.h>
 #include "ia_css_circbuf_comm.h"
 /****************************************************************
diff --git a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
index 58e4e3173b40..123389ff310f 100644
--- a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
+++ b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
@@ -9,7 +9,6 @@
 #include "ia_css_refcount.h"
 #include "sh_css_defs.h"
 
-#include "platform_support.h"
 
 #include "assert_support.h"
 
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/type_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/type_support.h
index 097be6bd3cb5..566fa6c1ea94 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/type_support.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/type_support.h
@@ -12,7 +12,6 @@
 * Platform specific types.
 *
 * Per the DLI spec, types are in "type_support.h" and
-* "platform_support.h" is for unclassified/to be refactored
 * platform specific definitions.
 */
 
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/tag.c b/drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/tag.c
index c68b096444de..3a9a21a589b2 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/tag.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/tag.c
@@ -5,7 +5,6 @@
  */
 
 #include "tag.h"
-#include <platform_support.h>	/* NULL */
 #include <assert_support.h>
 #include "tag_local.h"
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame_comm.h b/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame_comm.h
index d1031f824896..cb51824f5ba7 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame_comm.h
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame_comm.h
@@ -8,7 +8,6 @@
 #define __IA_CSS_FRAME_COMM_H__
 
 #include "type_support.h"
-#include "platform_support.h"
 #include "runtime/bufq/interface/ia_css_bufq_comm.h"
 #include <system_local.h>	 /* ia_css_ptr */
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c b/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
index 8e1efeb6372c..57623352af4f 100644
--- a/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
+++ b/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
@@ -4,7 +4,6 @@
  * Copyright (c) 2010 - 2015, Intel Corporation.
  */
 
-#include "platform_support.h"
 
 #include "ia_css_inputfifo.h"
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys_comm.h b/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys_comm.h
index 3d4c0cd2f2a6..801b2472cca5 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys_comm.h
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys_comm.h
@@ -10,7 +10,6 @@
 #include <type_support.h>
 #include <input_system.h>
 
-#include <platform_support.h>		/* inline */
 #include <input_system_global.h>
 #include <ia_css_stream_public.h>	/* IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH */
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.c
index 7490d189f39d..cc03822942e8 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.c
@@ -8,7 +8,6 @@
 
 
 #include "assert_support.h"
-#include "platform_support.h"
 #include "ia_css_isys.h"
 #include "bitop_support.h"
 #include "ia_css_pipeline.h"	/* ia_css_pipeline_get_pipe_io_status() */
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c
index b8d431dcd6c1..562fca4888d4 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c
@@ -7,7 +7,6 @@
 #include "system_global.h"
 
 #include "assert_support.h"
-#include "platform_support.h"
 #include "ia_css_isys.h"
 #include "ibuf_ctrl_rmgr.h"
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.c
index 2ce2f32a1946..3884ff6ac4b5 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.c
@@ -8,7 +8,6 @@
 
 
 #include "assert_support.h"
-#include "platform_support.h"
 #include "ia_css_isys.h"
 #include "bitop_support.h"
 #include "isys_dma_rmgr.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
index 46bb3569e139..f19efae1bd86 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
@@ -7,7 +7,6 @@
 #include "input_system.h"
 
 #include "ia_css_isys.h"
-#include "platform_support.h"
 
 #include "isys_dma_public.h"	/* isys2401_dma_set_max_burst_size() */
 #include "isys_irq.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_stream2mmio_rmgr.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_stream2mmio_rmgr.c
index 9217d26cf632..24da447caa10 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_stream2mmio_rmgr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_stream2mmio_rmgr.c
@@ -8,7 +8,6 @@
 
 
 #include "assert_support.h"
-#include "platform_support.h"
 #include "ia_css_isys.h"
 #include "bitop_support.h"
 #include "isys_stream2mmio_rmgr.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h
index c097d912d87f..88558878e6ff 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h
@@ -7,7 +7,6 @@
 #ifndef __IA_CSS_QUEUE_H
 #define __IA_CSS_QUEUE_H
 
-#include <platform_support.h>
 #include <type_support.h>
 
 #include "ia_css_queue_comm.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
index 940b28c66e99..463bbd470ef4 100644
--- a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
+++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
@@ -9,7 +9,6 @@
 
 #include <type_support.h>
 #include <assert_support.h>
-#include <platform_support.h> /* memset */
 #include <ia_css_debug.h>
 
 /*
diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index 57ecf5549c23..75b0720e98d7 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -11,7 +11,6 @@
 #include "hmm.h"
 
 #include <math_support.h>
-#include "platform_support.h"
 #include "sh_css_firmware.h"
 
 #include "sh_css_defs.h"
diff --git a/drivers/staging/media/atomisp/pci/sh_css_hrt.c b/drivers/staging/media/atomisp/pci/sh_css_hrt.c
index d4633572f8f3..8c1c9478ce36 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_hrt.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_hrt.c
@@ -4,7 +4,6 @@
  * Copyright (c) 2015, Intel Corporation.
  */
 
-#include "platform_support.h"
 
 #include "sh_css_hrt.h"
 #include "ia_css_debug.h"
diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
index 9105334c71b1..2b10e441898c 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
@@ -18,7 +18,6 @@
 
 #include "sh_css_hrt.h"
 
-#include "platform_support.h"
 
 /* Bilinear interpolation on shading tables:
  * For each target point T, we calculate the 4 surrounding source points:
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index fcebace11daf..636801c46589 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -21,7 +21,6 @@
 #include "ia_css_queue.h"
 #include "sw_event_global.h"		/* Event IDs */
 
-#include "platform_support.h"
 #include "assert_support.h"
 
 #include "ia_css_stream.h"
-- 
2.34.1

