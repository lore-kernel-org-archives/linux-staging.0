Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7058B42BEAF
	for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 22:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784069574; cv=none; b=DQzJ3sVx0t1YSCnPAe6h+2pzbJ1JxNUBijgqIHtsCZU6GKrKx1xXO5/BD/7p2ps05ULQkqIisaLjINmEzLn3DBN0bRxncFdJJIQSfcHbXp07BBipEZhi40svXZF9hri8aFhQ+gGerjy325yJR1v/BDVRc9YSn60eoFbJdNhfjGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784069574; c=relaxed/simple;
	bh=5xD+gbAAQfa7Zz6DBWl8uQYu5cCVQd7fsutssEb695I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r96wHT3PaxObvB7JgfLCw2NAkIOOcGjGyD7gACixbs7sgWFCkI8T8Lhdqh74gr3oF6g6yGXP79w4+ObPiP4+X60cF+6Z6nMplTstl8xtRpsb/WH+Z3lpv2L56cy4lM90q66qt+jblO3Ll4mA0YykkKEH3xx8LW0bQ7T0Rc/p6GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZgBJYmWX; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZgBJYmWX"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81e8fa1b8d6so39823537b3.1
        for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 15:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784069571; x=1784674371; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fS/qYunkaEsTBnkedEsMK25XcSingk2GiGQfZYV0Pss=;
        b=ZgBJYmWXOC3UG8mTZOzgl5kcAEiP70k/O6L3SrlzXAOfFQjGOvy58fb4N5XlxPtM4l
         Py/kbDZhtMiI6jSldeX8XfOUewcrMr4J7NXnP5bj/EmXbEJZ6t3aPWh+3DVZPhrEXmxl
         145iR7UjVd+oewSP22Unr95XsLVH8jbjvE60fvmOFJEKGzdu8XqF2xlo3OFowWMU/CxO
         Rjinx5T1J5aVmgad7DWSET1JNeM9PE+rhbaBeF0AsVZU6dwbNWdmPdYgctH93OZY8/Pj
         +jTHdo3w1jhXUd6auToww/gFSgHERoElD96oW9l9PvVY6yrzrcvi5kN739M39e1QX9qg
         tIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784069571; x=1784674371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fS/qYunkaEsTBnkedEsMK25XcSingk2GiGQfZYV0Pss=;
        b=Dhu2s/vyM+crkooqrECP1ljTPoUxdHBHnXQpaT4m8/ecdaZ9uLaU7ziOnPGPBsZ59X
         +9dounBN0AfLy8hRjOb0BDRFh85JORYmUKL4vJGYn/D4TIemvMTfC1yZn8REuBwa3l4t
         XKsjTvKYePkqWGWqGcxlforHt4zJbptOHRaM1yC1mWOytTwdFRVUbkceQ1+UCZ7bXDVk
         Mgk4v/RBiCP8zUl3fv2hGqsvO4MZcT00hjQq93LFig4mAGzjIoOMDVk826uJxniu2zNY
         27dV+asLCFl5nx5Tqt2g3T0Qn4MRWKedITGVFcRABJAEfFCZLV8DDxkBNHTehx6QAaSk
         ZnXQ==
X-Forwarded-Encrypted: i=1; AHgh+RonUxj3Q4ry8TrcF7SQQmSZQOkaAk+xNJMQrdieKiM586PwE03BnzwXRlzL/Iweo+krR34TF1UfmtTNrw70@lists.linux.dev
X-Gm-Message-State: AOJu0YzFIe0oCK1Xj9hSsVRcsKQ0yCgsixTvWIBYlsJnapjayFIOarl4
	mTkhJ/tI21tuTxkuB6iUWjxQfGI8y+YCkDMCjLhpAoaLxzg3WvmC1Qsq
X-Gm-Gg: AfdE7clvloSZYiHhhW9I+RWaOZLxC3X9HQdo805/3KmOtMsrbQNsttGyGI+RQ8XV1Pu
	CFkVtAVPPDdh4U2S3R98zzl0xDTpZRn0M74GFvJaCv7jIzU1EWcP+xngN4WmCev9lX6QDeWjvPs
	qDaQ2oD3CjoSKbYlkzvLubn4vxCMXEUQleOiTywMW5sjcM9e+ScUA0xGd3sVRfsjEzh1F4yBqBi
	9IL6sqzAkpZjWn+k4wc/KYDiw4+bUwNZZcAZOMUlqGaEx34jFY7sO6244RVNmBxfLzWSzv29yU6
	2cUg3BUIVYIKIUEmXEX9PK+/LnQ/sgWIyaKzZWhtQYYeEhZuDiYP/UIx0hDZhffCEW/c9hN/0Td
	rGowHLeY94/xMMcJhWqpZqlqYwBwqKket0wskTZSERBr3KRmok0rEFLBNbDU1FIE+j9RLDBWzkj
	3JgzHDGBwYW4OlHtAUPXtGWhnqjhUe0mv6QRJihAB6+QncQqIcuPcQW5uNKIp+8BLvOg==
X-Received: by 2002:a05:690c:998b:b0:7fe:4069:d3fe with SMTP id 00721157ae682-81ebfdafedfmr30470587b3.30.1784069571383;
        Tue, 14 Jul 2026 15:52:51 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:a510:f4e7:1a8:cf71])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c249b87sm153446897b3.49.2026.07.14.15.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:52:50 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	feng@innora.ai
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 2/3] staging: media: atomisp: use kvmalloc_objs() for overflow-safe allocation
Date: Tue, 14 Jul 2026 19:49:01 -0300
Message-ID: <20260714225235.47134-3-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260714225235.47134-1-rodrigo.gobbi.7@gmail.com>
References: <20260714225235.47134-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Feng Ning <feng@innora.ai>

Replace open-coded width * height * sizeof() multiplications with
kvmalloc_objs() and array_size() to prevent integer overflow in buffer
allocations.

The atomisp driver computes DVS and statistics buffer sizes using
unchecked arithmetic.  When dimensions are large, the product can
silently wrap, causing kvmalloc() to allocate an undersized buffer.

kvmalloc_objs() uses size_mul() internally, which saturates to SIZE_MAX
on overflow, so kvmalloc() returns NULL instead of succeeding with too
few bytes.  array_size() provides the same overflow protection for the
two-factor dimension products.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Feng Ning <feng@innora.ai>
[rodrigo: rebased; convert only the sites left open-coded after
 commit d178c7ca8fef ("staging: media: atomisp: use array3_size()
 for overflow-safe allocation")]
Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 .../staging/media/atomisp/pci/sh_css_params.c | 101 +++++++-----------
 1 file changed, 36 insertions(+), 65 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 8420a22fd8f0..adc329be8b0b 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -6,6 +6,7 @@
 
 #include <linux/overflow.h>
 #include <linux/math.h>
+#include <linux/slab.h>
 
 #include "gdc_device.h"		/* gdc_lut_store(), ... */
 #include "isp.h"			/* ISP_VEC_ELEMBITS */
@@ -4151,7 +4152,7 @@ struct ia_css_3a_statistics *
 ia_css_3a_statistics_allocate(const struct ia_css_3a_grid_info *grid)
 {
 	struct ia_css_3a_statistics *me;
-	int grid_size;
+	size_t grid_size;
 
 	IA_CSS_ENTER("grid=%p", grid);
 
@@ -4162,8 +4163,8 @@ ia_css_3a_statistics_allocate(const struct ia_css_3a_grid_info *grid)
 		goto err;
 
 	me->grid = *grid;
-	grid_size = grid->width * grid->height;
-	me->data = kvmalloc(grid_size * sizeof(*me->data), GFP_KERNEL);
+	grid_size = array_size(grid->width, grid->height);
+	me->data = kvmalloc_objs(*me->data, grid_size);
 	if (!me->data)
 		goto err;
 	/* No weighted histogram, no structure, treat the histogram data as a byte dump in a byte array */
@@ -4236,6 +4237,7 @@ struct ia_css_dvs_coefficients *
 ia_css_dvs_coefficients_allocate(const struct ia_css_dvs_grid_info *grid)
 {
 	struct ia_css_dvs_coefficients *me;
+	size_t cnt;
 
 	assert(grid);
 
@@ -4245,15 +4247,13 @@ ia_css_dvs_coefficients_allocate(const struct ia_css_dvs_grid_info *grid)
 
 	me->grid = *grid;
 
-	me->hor_coefs = kvmalloc(grid->num_hor_coefs *
-				 IA_CSS_DVS_NUM_COEF_TYPES *
-				 sizeof(*me->hor_coefs), GFP_KERNEL);
+	cnt = array_size(grid->num_hor_coefs, IA_CSS_DVS_NUM_COEF_TYPES);
+	me->hor_coefs = kvmalloc_objs(*me->hor_coefs, cnt);
 	if (!me->hor_coefs)
 		goto err;
 
-	me->ver_coefs = kvmalloc(grid->num_ver_coefs *
-				 IA_CSS_DVS_NUM_COEF_TYPES *
-				 sizeof(*me->ver_coefs), GFP_KERNEL);
+	cnt = array_size(grid->num_ver_coefs, IA_CSS_DVS_NUM_COEF_TYPES);
+	me->ver_coefs = kvmalloc_objs(*me->ver_coefs, cnt);
 	if (!me->ver_coefs)
 		goto err;
 
@@ -4277,6 +4277,7 @@ struct ia_css_dvs2_statistics *
 ia_css_dvs2_statistics_allocate(const struct ia_css_dvs_grid_info *grid)
 {
 	struct ia_css_dvs2_statistics *me;
+	size_t cnt;
 
 	assert(grid);
 
@@ -4286,59 +4287,37 @@ ia_css_dvs2_statistics_allocate(const struct ia_css_dvs_grid_info *grid)
 
 	me->grid = *grid;
 
-	me->hor_prod.odd_real = kvmalloc(grid->aligned_width *
-					 grid->aligned_height *
-					 sizeof(*me->hor_prod.odd_real),
-					 GFP_KERNEL);
+	cnt = array_size(grid->aligned_width, grid->aligned_height);
+
+	me->hor_prod.odd_real = kvmalloc_objs(*me->hor_prod.odd_real, cnt);
 	if (!me->hor_prod.odd_real)
 		goto err;
 
-	me->hor_prod.odd_imag = kvmalloc(grid->aligned_width *
-					 grid->aligned_height *
-					 sizeof(*me->hor_prod.odd_imag),
-					 GFP_KERNEL);
+	me->hor_prod.odd_imag = kvmalloc_objs(*me->hor_prod.odd_imag, cnt);
 	if (!me->hor_prod.odd_imag)
 		goto err;
 
-	me->hor_prod.even_real = kvmalloc(grid->aligned_width *
-					  grid->aligned_height *
-					  sizeof(*me->hor_prod.even_real),
-					  GFP_KERNEL);
+	me->hor_prod.even_real = kvmalloc_objs(*me->hor_prod.even_real, cnt);
 	if (!me->hor_prod.even_real)
 		goto err;
 
-	me->hor_prod.even_imag = kvmalloc(grid->aligned_width *
-					  grid->aligned_height *
-					  sizeof(*me->hor_prod.even_imag),
-					  GFP_KERNEL);
+	me->hor_prod.even_imag = kvmalloc_objs(*me->hor_prod.even_imag, cnt);
 	if (!me->hor_prod.even_imag)
 		goto err;
 
-	me->ver_prod.odd_real = kvmalloc(grid->aligned_width *
-					 grid->aligned_height *
-					 sizeof(*me->ver_prod.odd_real),
-					 GFP_KERNEL);
+	me->ver_prod.odd_real = kvmalloc_objs(*me->ver_prod.odd_real, cnt);
 	if (!me->ver_prod.odd_real)
 		goto err;
 
-	me->ver_prod.odd_imag = kvmalloc(grid->aligned_width *
-					 grid->aligned_height *
-					 sizeof(*me->ver_prod.odd_imag),
-					 GFP_KERNEL);
+	me->ver_prod.odd_imag = kvmalloc_objs(*me->ver_prod.odd_imag, cnt);
 	if (!me->ver_prod.odd_imag)
 		goto err;
 
-	me->ver_prod.even_real = kvmalloc(grid->aligned_width *
-					  grid->aligned_height *
-					  sizeof(*me->ver_prod.even_real),
-					  GFP_KERNEL);
+	me->ver_prod.even_real = kvmalloc_objs(*me->ver_prod.even_real, cnt);
 	if (!me->ver_prod.even_real)
 		goto err;
 
-	me->ver_prod.even_imag = kvmalloc(grid->aligned_width *
-					  grid->aligned_height *
-					  sizeof(*me->ver_prod.even_imag),
-					  GFP_KERNEL);
+	me->ver_prod.even_imag = kvmalloc_objs(*me->ver_prod.even_imag, cnt);
 	if (!me->ver_prod.even_imag)
 		goto err;
 
@@ -4377,51 +4356,43 @@ ia_css_dvs2_coefficients_allocate(const struct ia_css_dvs_grid_info *grid)
 
 	me->grid = *grid;
 
-	me->hor_coefs.odd_real = kvmalloc(grid->num_hor_coefs *
-					  sizeof(*me->hor_coefs.odd_real),
-					  GFP_KERNEL);
+	me->hor_coefs.odd_real = kvmalloc_objs(*me->hor_coefs.odd_real,
+					       grid->num_hor_coefs);
 	if (!me->hor_coefs.odd_real)
 		goto err;
 
-	me->hor_coefs.odd_imag = kvmalloc(grid->num_hor_coefs *
-					  sizeof(*me->hor_coefs.odd_imag),
-					  GFP_KERNEL);
+	me->hor_coefs.odd_imag = kvmalloc_objs(*me->hor_coefs.odd_imag,
+					       grid->num_hor_coefs);
 	if (!me->hor_coefs.odd_imag)
 		goto err;
 
-	me->hor_coefs.even_real = kvmalloc(grid->num_hor_coefs *
-					   sizeof(*me->hor_coefs.even_real),
-					   GFP_KERNEL);
+	me->hor_coefs.even_real = kvmalloc_objs(*me->hor_coefs.even_real,
+						grid->num_hor_coefs);
 	if (!me->hor_coefs.even_real)
 		goto err;
 
-	me->hor_coefs.even_imag = kvmalloc(grid->num_hor_coefs *
-					   sizeof(*me->hor_coefs.even_imag),
-					   GFP_KERNEL);
+	me->hor_coefs.even_imag = kvmalloc_objs(*me->hor_coefs.even_imag,
+						grid->num_hor_coefs);
 	if (!me->hor_coefs.even_imag)
 		goto err;
 
-	me->ver_coefs.odd_real = kvmalloc(grid->num_ver_coefs *
-					  sizeof(*me->ver_coefs.odd_real),
-					  GFP_KERNEL);
+	me->ver_coefs.odd_real = kvmalloc_objs(*me->ver_coefs.odd_real,
+					       grid->num_ver_coefs);
 	if (!me->ver_coefs.odd_real)
 		goto err;
 
-	me->ver_coefs.odd_imag = kvmalloc(grid->num_ver_coefs *
-					  sizeof(*me->ver_coefs.odd_imag),
-					  GFP_KERNEL);
+	me->ver_coefs.odd_imag = kvmalloc_objs(*me->ver_coefs.odd_imag,
+					       grid->num_ver_coefs);
 	if (!me->ver_coefs.odd_imag)
 		goto err;
 
-	me->ver_coefs.even_real = kvmalloc(grid->num_ver_coefs *
-					   sizeof(*me->ver_coefs.even_real),
-					   GFP_KERNEL);
+	me->ver_coefs.even_real = kvmalloc_objs(*me->ver_coefs.even_real,
+						grid->num_ver_coefs);
 	if (!me->ver_coefs.even_real)
 		goto err;
 
-	me->ver_coefs.even_imag = kvmalloc(grid->num_ver_coefs *
-					   sizeof(*me->ver_coefs.even_imag),
-					   GFP_KERNEL);
+	me->ver_coefs.even_imag = kvmalloc_objs(*me->ver_coefs.even_imag,
+						grid->num_ver_coefs);
 	if (!me->ver_coefs.even_imag)
 		goto err;
 
-- 
2.48.1

