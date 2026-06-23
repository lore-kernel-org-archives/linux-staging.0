Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94ECC3446A7
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 05:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782193640; cv=none; b=aR9BN0ukKjlLnQiL7+8Uqg9VFEBo3YwHg9B6I35Rhxo3vdmd7NUcLFXPym1ZEHKuYbLkxQ+loyd/sk1EkGad1w6WKaNnnsmUDLnoiY2n0nE99euytcKY/j8BA6NtUeyBvWxbCih2382HwmJ6qav9uKK9K05YnDyk0eNVzbo9aVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782193640; c=relaxed/simple;
	bh=kFPQk6kl9fvriJ973MMJla81VHoLkWNKwY+Zs+LcwEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oFxWfmX/o4D1GtLb1NPYJeXos3E+KqDLfz8TF5NU1rLzjQZsG3g/FWgvO7lx7IAoJqgdRzsmYUI5mzj99/2UWxVqgLvQRcM46g4xnBwVMBj66ruNT6KBmXo1x+BNJ/02hd+MbKoi3IjIVWFE3f8LHAvLv6iwLNpNWnWONPAdEyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mg3K6QuB; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mg3K6QuB"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2bf2247e38eso59395525ad.3
        for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 22:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782193639; x=1782798439; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S4Dp4YoMH/eGOTHSo3LS6xEZ/iAFF63D+EeQLBV9IOE=;
        b=Mg3K6QuBsB/Bg22FojNdnAGQrde4F+xVRIHV/sEVIwjcpdwMYwpnuGPZRiDYJaQ34l
         YpCUm7MTiRQEV1YlY+sAhFtDaZMpYTZIAPWlPkcpfnnYW9MQ3ABL7SmIJ/jKGgKjBHMM
         Lc8pz+HLwzKrgu+O3R3l2KZ/YrCg+A5VNECj86+6VgZhtsuVGzYs63Xvm960ECdXEwFk
         77oiqZz4lmn+BZAbVIROBdQWco8IyeDA9HwtZTFAKA3jzG6mvth8axiHUZnIndbc//JU
         ldf9nldDzZbxL9Lkjnsjyg/FqH3NEHECylZJpVca7t1JXgusjZ2Tah9PvXgckC5xpJrg
         PKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782193639; x=1782798439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4Dp4YoMH/eGOTHSo3LS6xEZ/iAFF63D+EeQLBV9IOE=;
        b=mQn/4e2BKwd4a7SaTsQ1r8jPYrVeoaUOxbOvlNEIkGpgQf18FAG6fC32ivE1h4btyL
         bXw90Zi148bObqH4KfWSAgjAEerBRs8ietoYKdWeRcJngQTC+JSui5nlrsjUJ2cXBit+
         IJiSL26xqvdvCAl/vl5/wnePDFTbQJFx0QhfLfizhAKMMZrfDEWyqlpPzAIBMXrqj1L/
         zAbT9sVG/H/xtSXNkcwICVpWSGYtPjT2xJsQ1NqH19BEIf5kT8lZBBHpiP0e2PM3QSCO
         f8QE/EHnQIFJIWhl5KdYVxdgJAY2GznMzzrzudu4m6MJV2owaoXaymsjfNh4ZL6c1SZv
         NlDw==
X-Gm-Message-State: AOJu0YyXu4v4spxsZcZSyBdXM9yNvjVdlBjSKEyRamhvlt/FR6eYPhwP
	TXA1aRAENplwZVVhXrVMS0fiiGpm1nOBVvZNc7c33I+0BeeqY9iMa9KrCnfFJGXX
X-Gm-Gg: AfdE7clXNyU/2e2y5gKncUX02hCtU+pbtNT3NSGtbliM5krq8jxfSWZLweb2Wlisv07
	bse7soGMSGSeM2alJlI/9N+dRjCMMzYVvj4rXzXR8pA65DrJhIJK3ZAl/wue4B+i3eJqGErJqIf
	uUS4iNJ22cWf26PbyW9dcWtvjVpn+mfIVTYO18YeIxnMS/nLm22WPD9fj1YdCayj6ukhIpQ0fGF
	g3cCbkZr4weCfS26qIP5lkGLTN86syQ8Ul1/BXixHmPB/+DR/gX0QJD5jVOdlJHaf+RpmblHcP0
	rSZLlVJRvu6jmry74y+M+KETS9cJNZJu5QbMAukTaUIUHmHvAdzLN75adNReiTyv05o6kMeP12v
	zD81pG2THZXTDofk4I4Rv0q7RQ6nlhBiWxCIRaUjhrqvXMKlRcxCE6M/c1qRMqg20+ptoJlikvn
	tU+y7FUvXt20TVqgLpuDKhOlUjJ/f6HMwaeko=
X-Received: by 2002:a17:902:e84a:b0:2bf:2015:5b93 with SMTP id d9443c01a7336-2c718ccb90fmr192873065ad.11.1782193638711;
        Mon, 22 Jun 2026 22:47:18 -0700 (PDT)
Received: from dellyboy.tail49fce7.ts.net ([2401:4900:1c0a:3ce3:195d:f9cf:5342:9970])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436af305sm106740345ad.6.2026.06.22.22.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 22:47:17 -0700 (PDT)
From: Ambar Chakravartty <amch9605@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ambar Chakravartty <amch9605@gmail.com>
Subject: [PATCH] staging: media: atomisp: use %s with __func__ in debug messages
Date: Tue, 23 Jun 2026 11:16:27 +0530
Message-ID: <20260623054627.62422-1-amch9605@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the following checkpatch.pl warning:
Prefer using '"%s...", __func__' to using 'ia_css_bayer_io_config',
this function's name, in a string

Signed-off-by: Ambar Chakravartty <amch9605@gmail.com>
---
 .../kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c
index 38f371b6d6d5..cc2179c5bb89 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c
@@ -39,7 +39,7 @@ int ia_css_bayer_io_config(const struct ia_css_binary      *binary,
 		struct dma_port_config config;
 #ifndef IA_CSS_NO_DEBUG
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-				    "ia_css_bayer_io_config() get part enter:\n");
+				    "%s get part enter:\n", __func__);
 #endif
 
 		ret = ia_css_dma_configure_from_info(&config, in_frame_info);
@@ -52,7 +52,7 @@ int ia_css_bayer_io_config(const struct ia_css_binary      *binary,
 		to->ddr_elems_per_word = ddr_elems_per_word;
 #ifndef IA_CSS_NO_DEBUG
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-				    "ia_css_bayer_io_config() get part leave:\n");
+				    "%s get part leave:\n", __func__);
 #endif
 	}
 
@@ -67,7 +67,7 @@ int ia_css_bayer_io_config(const struct ia_css_binary      *binary,
 		struct dma_port_config config;
 #ifndef IA_CSS_NO_DEBUG
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-				    "ia_css_bayer_io_config() put part enter:\n");
+				    "%s put part enter:\n", __func__);
 #endif
 
 		ret = ia_css_dma_configure_from_info(&config, &out_frames[0]->frame_info);
@@ -81,7 +81,7 @@ int ia_css_bayer_io_config(const struct ia_css_binary      *binary,
 
 #ifndef IA_CSS_NO_DEBUG
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-				    "ia_css_bayer_io_config() put part leave:\n");
+				    "%s put part leave:\n", __func__);
 #endif
 	}
 	return 0;
-- 
2.54.0

