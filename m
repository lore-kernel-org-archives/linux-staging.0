Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F5D33BBCC
	for <linux-staging@lists.linux.dev>; Sun,  1 Feb 2026 14:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769955869; cv=none; b=P8B2cpcgN3+Qi3JFpAPwfyC6Mr124UHqXvJtlFnmo7yVofOCqDAQoIe/+MK3N/SIHSRkz6Q2uYdz9r4xIYSEd0doPFS26q5qWSqAGSUHFKO68TSseBumSnrujU9gLTxgfqGeCiABh4woaG7zTm6nZKwRcUkIh2lBx51i34GI/zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769955869; c=relaxed/simple;
	bh=13AkoiTdNyAz1YeVgxEBNel/QyLHuky5VNXheaXheHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m6IjvJNn6OvgMRuraxkr/ARZJqYjyD3RFHRwx9w5An91iNk75R6rBGh27UOirLuVWq+BWlwhIdTSdAEwZkW6KVjf7sa+dFkgbPMfHZCp33z8ibqiREytSahUfJEtIxrN492wLNjrcnwo/FBGYV+sNz7WCoUodnelLtKEgbmPSYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xc/rAfK+; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xc/rAfK+"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81f5381d168so3473391b3a.2
        for <linux-staging@lists.linux.dev>; Sun, 01 Feb 2026 06:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769955867; x=1770560667; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D+9zUqm+raFHNUIjJ3frlwGtuvelVytXrMAJu8jxiT8=;
        b=Xc/rAfK+4SC4K0T6OLtoL+QQrZtc/1l8vDk6POwYtrV5sCCTOcQSmyco1+d+ktoq7g
         d87zJudkwxeydA3BO315pv9RUdp8b3CBrl99JKlXlklOuwWL0APijjh1RdC/RVlUIxr4
         E2rIgA9znEO66d5skMryon6sWJA1iBH6Jp6qe8dFbVgamb5hJJkRMBA8K1twIBSYzIzo
         ru4C/vtUwVX2K2vSTu/hDG+kqj7/1uQrkKoDaXeTUdSzG+wXwIHGPaAVMT8MlzBFSRnT
         fFyPXQ4mfPWTlqA4YeD9LmIjKUSIVR4IQCgk89dTOkW20tC2ZgS3BE2x2Bp2OoZiT2Am
         f+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769955867; x=1770560667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+9zUqm+raFHNUIjJ3frlwGtuvelVytXrMAJu8jxiT8=;
        b=YnoN/8keBdi9WzM5J8Ls/v5N8o760L3g92/B1qRmdFcOMCOy+NP0K28w35LmMXrSBF
         jZXlCwqKKTWiIC/odnZJ6g9Vd36T893U0BgpZlRk2nUWx4Wa2Oh294abZQdEt4h/ozyG
         kmRrO8lJjhz6HIz/pY28SaYsIBKi0vuEqvTZCvUT6bWe/TLeHul7g6AB1e+GFVC+1trL
         /GKy0liXcgZqswh6nZR8qrwXKOlz+YZfNkuL9j7iaUH7fqGO9ZPWU2OK8MZhTE+f7RDS
         eVTxxtT22dwE12l7MFR+YXHfw7CFogCRWnkfuLr3G0YR7TEYDoEstgipXi9kFt/NgTqf
         6AjA==
X-Forwarded-Encrypted: i=1; AJvYcCUuj/19ERWL5B4ejVnhyp0MpdTghHldtUHCNXlGTiNmh0XgKkg+XrPRa+EPYLYka/qvVnEr/leiEejhKzB7@lists.linux.dev
X-Gm-Message-State: AOJu0YyAgecbg1V2qweIQit68e/aXOJHK5sWGogWTXLEpWlwn+YFUqgE
	d8iQz2dYiVT4dwuVgSflfuJRBGVe8CpQ3VMKrKMzm76yCDyqHcLkp8Eq
X-Gm-Gg: AZuq6aJ+fKfueeBqhHfzDQyZc49luX3tprVdSEpOeRXcwkiMd41xonjulyyEEJowT4w
	27j8GB0HYHGSfqmR/dJep/k/YT6bXm0TxnCKDTyTp1PaGaSmcJGQkXq/Qc3zJmPvRO46v6ojJaj
	kxPW9ru9yJCAWFUJhNuak9qAse34lkq5BV9khTRIFrJ0aX0QrIVzTKnuyFJek0iDumXUPlidYso
	x3lxNINZnU0mB2m06JwmnOzXXO4FifGOyBx1pv6JkuJKq52m+oYxg4ZOtD1u71C28ZCx5Z2gXs3
	a8mEE24Orv0sa+5/MsUnmICdJ4mvnTiN9NMhFNonBpDRtp0fKvp87zwud9usFntBYSFOmobp1y6
	aEnkHcQ9n3ZlfsQLgY8d35fflYIown4vcVz2yrBLc33ZihuC9r8TxcLk1UMluR6JtxJmaUZZHIP
	4FewzGLgkMIffLWQ==
X-Received: by 2002:a05:6a00:94f6:b0:820:2f9b:fe37 with SMTP id d2e1a72fcca58-823ab748f60mr8019230b3a.35.1769955866748;
        Sun, 01 Feb 2026 06:24:26 -0800 (PST)
Received: from archlinux ([2402:e280:411b:ec:aa93:b1ec:5a6b:5fce])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b6b277sm16452661b3a.29.2026.02.01.06.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 06:24:26 -0800 (PST)
From: Adarsh Das <adarshdas950@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Adarsh Das <adarshdas950@gmail.com>
Subject: [PATCH] staging: media: atomisp: remove functions doing ftrace like logging
Date: Sun,  1 Feb 2026 19:54:15 +0530
Message-ID: <20260201142415.83595-1-adarshdas950@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove ia_css_debug_dtrace() calls which only log function entry.
ftrace should be used instead.

Signed-off-by: Adarsh Das <adarshdas950@gmail.com>
---
 .../media/atomisp/pci/ia_css_isp_configs.c    | 26 -------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c b/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
index 38c9c62366d6..1dce9fa926ab 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
@@ -18,8 +18,6 @@ int ia_css_configure_iterator(const struct ia_css_binary *binary,
 	unsigned int offset = 0;
 	unsigned int size   = 0;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
-
 	if (!binary->info->mem_offsets.offsets.config)
 		return 0;
 
@@ -41,8 +39,6 @@ int ia_css_configure_copy_output(const struct ia_css_binary *binary,
 	unsigned int offset = 0;
 	unsigned int size   = 0;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
-
 	if (!binary->info->mem_offsets.offsets.config)
 		return 0;
 
@@ -66,8 +62,6 @@ int ia_css_configure_crop(const struct ia_css_binary *binary,
 	unsigned int offset = 0;
 	unsigned int size   = 0;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
-
 	if (!binary->info->mem_offsets.offsets.config)
 		return 0;
 
@@ -89,8 +83,6 @@ int ia_css_configure_fpn(const struct ia_css_binary *binary,
 	unsigned int offset = 0;
 	unsigned int size   = 0;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
-
 	if (!binary->info->mem_offsets.offsets.config)
 		return 0;
 
@@ -111,8 +103,6 @@ int ia_css_configure_dvs(const struct ia_css_binary *binary,
 	unsigned int offset = 0;
 	unsigned int size   = 0;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
-
 	if (!binary->info->mem_offsets.offsets.config)
 		return 0;
 
@@ -133,8 +123,6 @@ int ia_css_configure_qplane(const struct ia_css_binary *binary,
 	unsigned int offset = 0;
 	unsigned int size   = 0;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
-
 	if (!binary->info->mem_offsets.offsets.config)
 		return 0;
 
@@ -156,8 +144,6 @@ int ia_css_configure_output0(const struct ia_css_binary *binary,
 	unsigned int offset = 0;
 	unsigned int size   = 0;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
-
 	if (!binary->info->mem_offsets.offsets.config)
 		return 0;
 
@@ -179,8 +165,6 @@ int ia_css_configure_output1(const struct ia_css_binary *binary,
 	unsigned int offset = 0;
 	unsigned int size   = 0;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
-
 	if (!binary->info->mem_offsets.offsets.config)
 		return 0;
 
@@ -202,8 +186,6 @@ int ia_css_configure_output(const struct ia_css_binary *binary,
 	unsigned int offset = 0;
 	unsigned int size   = 0;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
-
 	if (!binary->info->mem_offsets.offsets.config)
 		return 0;
 
@@ -225,8 +207,6 @@ int ia_css_configure_raw(const struct ia_css_binary *binary,
 	unsigned int offset = 0;
 	unsigned int size   = 0;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
-
 	if (!binary->info->mem_offsets.offsets.config)
 		return 0;
 
@@ -248,8 +228,6 @@ int ia_css_configure_tnr(const struct ia_css_binary *binary,
 	unsigned int offset = 0;
 	unsigned int size   = 0;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
-
 	if (!binary->info->mem_offsets.offsets.config)
 		return 0;
 
@@ -271,8 +249,6 @@ int ia_css_configure_ref(const struct ia_css_binary *binary,
 	unsigned int offset = 0;
 	unsigned int size   = 0;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
-
 	if (!binary->info->mem_offsets.offsets.config)
 		return 0;
 
@@ -294,8 +270,6 @@ int ia_css_configure_vf(const struct ia_css_binary *binary,
 	unsigned int offset = 0;
 	unsigned int size   = 0;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
-
 	if (!binary->info->mem_offsets.offsets.config)
 		return 0;
 
-- 
2.52.0

