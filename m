Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555B5296BD7
	for <linux-staging@lists.linux.dev>; Thu,  1 Jan 2026 16:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767285688; cv=none; b=imKF/0DfKZJ3+G6x0n+FlwBggjy4B/Y0UYoYt6TuMdFrIfROel01ba+jLiEQjMl0CowteZSi6hr0NoUry+X5Akp9UDsEfKr+/LYY7r1MiGvnA9rtrbVf2KyYa93W/zPZoyHGCgdlayMDA0V1fK+VVLxYLe/3ovSMUyPY+N5rjCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767285688; c=relaxed/simple;
	bh=NQEfzUm8CoXDEDaIg+I/sw4HQyVJ5kOYQMNLSWHizCU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HgTMKjjsnx1clMuEEZBmBUo5Eo7vw6w7QMdYWMxNGifSEARvWfXqYYhHYJ4ODWlS1KTh/WrWrNsIGzUwvOa4nD4fVg0Sm4B5pO2w+YA/gRhnay5y+8N0gISMIdHwXXJt4yT+OtqnNyPO0BQaXLemoUr493OjiwWOTTK4FDKv/1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HFLO5GOH; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HFLO5GOH"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so88777585e9.1
        for <linux-staging@lists.linux.dev>; Thu, 01 Jan 2026 08:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767285685; x=1767890485; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZFn5mZZ1GFrLX+zltD0NdQ5QIlUaqG+YHTjhL+HRPtI=;
        b=HFLO5GOHoKE3ZfDkV1tNjlo0Lqyx9a4JTjTj3s/1us6KweJSus4P5IZpU7QjKXMXYw
         ksFSD/yx5nex2Gusfii38yThpiTpAGTZum+VYvBqWOZqH78zu2IyH66L7Bcbny5szoeS
         YkhRlpAszFX1cHsatAJo7JbyyeSARMEaEUpCVcoMzzTSHk6+PCtEKvI0SD1eWVwXyOPO
         pvKNvOsDpfc3NJ4bxl2DWa/yTcog+8OWMrJLc+CdS2Z4VLbbBHU9fVi5fi7zlQQmuQwX
         CPVCMI6s16zRGwnJdjNwgWqckMxBsUswlPDi9dMZnByLCv/NdtJwFFpQnTuaOoL6Dd4m
         o8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767285685; x=1767890485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFn5mZZ1GFrLX+zltD0NdQ5QIlUaqG+YHTjhL+HRPtI=;
        b=LrDYyrgcC7+XHXgqYSynxxf9wk+bXhyd57xeG/eyrTAqyempjNlMpm1w14tg7RU2W0
         n2PDffWB9Eto51IypcG0xVIV+iRKSluntvGE2eA7FAaoYOX2F9VVgWhLtlR98c1AgBlg
         h49E9Qm1xBqHoQxWc7DFLC6OEnHmGFQPJLYSEOlSUmfX6FQtWgR/NAolCzrHDeoJYXGr
         3ZVQZzUzGelCd1pdPWTi+ZXv2AbrF1x2LlEVf/N9o22yXLbZDEKs1TdBWlolvgJS7HJv
         y6kNyvig3Tih6S2nDnBJJQM7+w1k9xi44d2Cyvmh3bGrIl0U5igE1wNOD6tu6MV5xC72
         EU8A==
X-Forwarded-Encrypted: i=1; AJvYcCXhIiPaFasJEvm83mfV5fOOmisN3R9r7wcUGhijvt1uJSlZuylRBepxo+TJnLa0Ld1fB+pMf1NQLpSAtdhh@lists.linux.dev
X-Gm-Message-State: AOJu0YytLpBlWOvELcInQFPr3G5ufY4mj8AIN+H97tBqc4fzT2UL2pQl
	Ah1WLwH3RFGSa4MCk+3IjgRDa2dfXCTvVmNO+uCRPb9Z4hqO1rUyKZRr
X-Gm-Gg: AY/fxX4sPAFlBB3hn4tPDpVZv3waSdLZ66INv/54IRleAitn3ixymuYyCP9+modWX7D
	NhPyXUq7/kcWc03S6m42Q/pfcXTilnn5kSsNOAaZC3opzIoxifztYrr2vKooSRWq5GgC+UUEmMg
	zsPj2yPtTCN7xgfVviSf7wzbqSnkBbVVbFWzMOzNubb7RuePxbHfZOZsXzIiFopa6JplYNQMnmL
	guk4WndFAQkGgGYy5QW87zG9/xm+V+fkRlZF6FgbkmZqp2WIr0ctyXl/y798oQOlsaZgUTfb73v
	O5MrV1kZmllqigoOD/kMnUbEcL+/I3g/eCIuZT+quEf1zzpD7V2SU+iXJnVjzqV38gY64h72WQ0
	5XtlC34V0IOH0Fp2yeTRSM1vM0huWbeN2/TkGOP6W7iOYlGmYD8obU8KnAvoYlPw/M6wiZKbPlf
	58wTTgyRKAkau0kb1XSvADw6v8
X-Google-Smtp-Source: AGHT+IFvVQu4Gd5ZRQSV1t2Koilx6EPmTM0D/s54QwT1w/8bMlds5wzVPAa25EjjdjImABNxaa+7tg==
X-Received: by 2002:a05:600c:4fd4:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-47d1955b744mr452339575e9.6.1767285684569;
        Thu, 01 Jan 2026 08:41:24 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324e9ba877sm80995853f8f.0.2026.01.01.08.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 08:41:24 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH] media: atomisp: Fix block comment coding style in sh_css_param_shading.c
Date: Thu,  1 Jan 2026 21:41:17 +0500
Message-ID: <20260101164117.14292-1-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warnings in sh_css_param_shading.c regarding block
comment formatting.

The warning was:
- Block comments use a trailing */ on a separate line

This change also moves text from the first line of block comments to
subsequent lines to adhere to the standard Linux kernel coding style.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 .../media/atomisp/pci/sh_css_param_shading.c   | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
index 513e272f2fdc..b5e9d11b28a6 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
@@ -20,7 +20,8 @@
 
 #include "platform_support.h"
 
-/* Bilinear interpolation on shading tables:
+/*
+ * Bilinear interpolation on shading tables:
  * For each target point T, we calculate the 4 surrounding source points:
  * ul (upper left), ur (upper right), ll (lower left) and lr (lower right).
  * We then calculate the distances from the T to the source points: x0, x1,
@@ -116,8 +117,10 @@ crop_and_interpolate(unsigned int cropped_width,
 		 */
 		ty = out_start_row + i * out_cell_size;
 
-		/* calculate closest source points in shading table and
-		   make sure they fall within the table */
+		/*
+		 * calculate closest source points in shading table and
+		 * make sure they fall within the table
+		 */
 		src_y0 = ty / (int)in_cell_size;
 		if (in_cell_size < out_cell_size)
 			src_y1 = (ty + out_cell_size) / in_cell_size;
@@ -173,7 +176,8 @@ crop_and_interpolate(unsigned int cropped_width,
 			dx0 = tx - sx0;
 			dx1 = sx1 - tx;
 			divx = sx1 - sx0;
-			/* if we're at the edge, we just use the closest
+			/*
+			 * if we're at the edge, we just use the closest
 			 * point still in the grid. We make up for the divider
 			 * in this case by setting the distance to
 			 * out_cell_size, since it's actually 0.
@@ -291,8 +295,10 @@ prepare_shading_table(const struct ia_css_shading_table *in_table,
 	input_width  = min(input_width,  in_table->sensor_width);
 	input_height = min(input_height, in_table->sensor_height);
 
-	/* This prepare_shading_table() function is called only in legacy API (not in new API).
-	   Then, the legacy shading table width and height should be used. */
+	/*
+	 * This prepare_shading_table() function is called only in legacy API (not in new API).
+	 * Then, the legacy shading table width and height should be used.
+	 */
 	table_width  = binary->sctbl_width_per_color;
 	table_height = binary->sctbl_height;
 
-- 
2.47.3

