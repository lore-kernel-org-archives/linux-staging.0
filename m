Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C108191F92
	for <linux-staging@lists.linux.dev>; Sat, 15 Nov 2025 15:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763219987; cv=none; b=EfcfMKs5NiE4WNQqueiTbgLjmQ/yxiZjsLn2Yjs5go1tdR5RblX0tifql654GR+qtctFELldHSRoYlirl7b8CIdEC5v3Z6E4hV0P2uwmA9zCRWEUtGgKlPT98PB3V4OY1gMMx0GgOL53S4gqFuBLweMi5YBFl3QAQ8Qg9xMV2js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763219987; c=relaxed/simple;
	bh=pwhk6KUC9aj1bO1CnKCgI1WgBJAeVfM9l/gwJMBdHX8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jX+Mc8tPJ9DpQIqZdSQHttkVBxCDuma3Qni3H8V7y0J5d37YoC+JBf0InQ4DvrODk49hKdDm7R84/7fdjCMMOC6nn10ftXk8hVfL2JFnLivLIjw9mmAF22UDftMUy+Pv/n3bYLM7bC9sGNhw0OTfvV6VPeGwoLB2ecL0I4WJquA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j2R1iPB9; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j2R1iPB9"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b3b29153fso1628351f8f.3
        for <linux-staging@lists.linux.dev>; Sat, 15 Nov 2025 07:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763219984; x=1763824784; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3fiwCuDBn6bCR36wBmkPpqkRzBcsOHTvfCQX1x7iMNw=;
        b=j2R1iPB9SxtsHK5uomsgpJ/ufKYKRjMRjz0gk6/g4WiLJLtmo8+J6FTbqWqZu0gmJr
         TmSaL7CP+6BEcjHX4XWtlYK5kTsbAqISCsMMyYGtJoDJGYSDUPPU7fUWjHv7AOmhLCGI
         Vs7aSP5MZ7cFXy7HuDDK7cUfznrwBMbLMPMk47IG4XrXtgvoE9hav4ltEXnJzODk0zSl
         ulbA0bP98N4LiN1C/lK61E1sMLjy/q0UMLCU1MmGXtT3Xxut1TGCaJW079t6IjwKAYDC
         AyyyilqN5FYvE2ck6lSOnEMo/sjumQS8MPKkJxWmISNPQ8UurlrYvPbea+Fpv5aGoX69
         A1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763219984; x=1763824784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fiwCuDBn6bCR36wBmkPpqkRzBcsOHTvfCQX1x7iMNw=;
        b=qVQQ3+A/fpHyLjPhJyP6h3gu77E55lOwfNOTMBxm7RxMMhke4C6kDObXvhlr8xKZu8
         JntKrl5sGMFUxrTvYgNqaFqS8tg1cyx4lzVAWt7f3mhgrEJCppnAfCTBtTXOgyyXU5Pu
         uR4oaOBIfkiVkvVlAuIVhYpvPWCe9zbc3AUkaSuavxY+Ln3T87aG/+CtqfRjHD6nkulN
         DLZxnXpbp0VAG0+4iEEwjrxJjpx+C5nHL3Y63Ggemc6qyJvokdHITEtdi3FhemdFuDi4
         PIh8YVOfOyfUYGlEs8OX79DJ5IXK/qSBXdibhEi7xqMUftleuexr0PH5o8eCjF9Yx9/h
         RqPw==
X-Forwarded-Encrypted: i=1; AJvYcCVSViWo5XYnCjwsrPvCpScWGUtxLG2LjSVNG/ZAxz0wpi8HyG6pOIuaGX7cvZZYLYb2mdb1lvTpcTG6eCHs@lists.linux.dev
X-Gm-Message-State: AOJu0YwdjgnmAUkk8QM2BHUwQiaFAXzqtREq0Qp4muMGmExlQTXqpMY8
	SX53tRtoEyg1y1aNhiNBOp2lU6Z0lioSFpaPrX5ulO3rFFmSkJPFga1u
X-Gm-Gg: ASbGnctAznCngp9JI86JPvCspuGaJDhEzvctvlkDS1zj96jwRRXHkx3Zima2S6l0qWp
	W/Tx+666vgEvKwcVGxrYQQcWJ8wbCWgvL6R1PbAVtFBuMafAKrqiDN18iKn07g6jRsmnvVRWkU5
	hNYDs5T6RCnhEer91lMJkyJPhQyga27kzawCJbRjJctzhuxw47mLqKCczueMs1QJHe+Y0pJia1v
	W4FkxdFGrFlJ2SxskBNXnw5UzsfKJLEb1AremTnbkdRDx1zhwauNV3ttj199NtB7dpr5balsi+o
	SqYHYvPz+kuZrPda2k0rkI6bFkUuNHal47lvziqRUndjiEJUmkp6pJfrpT/MJzzQSuVmVRu60BL
	0GuyYNz7q+ICtfJ2SN33lOIJhZGuNA7uK1waCI8LrJQ7bIrUsZirc4KlwhCd1/SMQFxb+dlnUFK
	OoUBQ=
X-Google-Smtp-Source: AGHT+IE0WZaMPkQ2gf5Cfbpuz0f0f1hn6sPXTkFITHtyS6NvFcAeITRj13yFAzpQHkMmtxXEeKa0kQ==
X-Received: by 2002:a05:6000:2010:b0:42b:3c3e:5d53 with SMTP id ffacd0b85a97d-42b5933aff4mr5549415f8f.16.1763219984236;
        Sat, 15 Nov 2025 07:19:44 -0800 (PST)
Received: from hamdan-pc.. ([39.34.132.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e982d6sm16665382f8f.21.2025.11.15.07.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 07:19:43 -0800 (PST)
From: Hamdan Khan <hamdankhan212@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Hamdan Khan <hamdankhan212@gmail.com>
Subject: [PATCH] staging: media: atomisp: Fix typos and comments alignment issue in include/linux/* header files
Date: Sat, 15 Nov 2025 20:18:40 +0500
Message-ID: <20251115151840.6366-1-hamdankhan212@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes minor comment and code alignment issues in
atomisp/include/linux/*.h header files. Some of them were warnings
generated by checkpatch.pl (missing * at the start of the line or */
present in the same line)

The changes are code-style related only and don't affect the
functionality.

Signed-off-by: Hamdan Khan <hamdankhan212@gmail.com>
---
 .../media/atomisp/include/linux/atomisp.h     | 30 +++++++++++--------
 .../include/linux/atomisp_gmin_platform.h     |  7 ++---
 .../atomisp/include/linux/atomisp_platform.h  | 21 +++++++------
 3 files changed, 32 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index 3c8fa3f5808d..bce4e5f1bfc7 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -146,8 +146,7 @@ struct atomisp_3a_config {
 	unsigned int ae_y_coef_r;	/* [gain] Weight of R for Y */
 	unsigned int ae_y_coef_g;	/* [gain] Weight of G for Y */
 	unsigned int ae_y_coef_b;	/* [gain] Weight of B for Y */
-	unsigned int awb_lg_high_raw;	/* [intensity]
-					   AWB level gate high for raw */
+	unsigned int awb_lg_high_raw;	/* [intensity] AWB level gate high for raw */
 	unsigned int awb_lg_low;	/* [intensity] AWB level gate low */
 	unsigned int awb_lg_high;	/* [intensity] AWB level gate high */
 	int af_fir1_coef[7];	/* [factor] AF FIR coefficients of fir1 */
@@ -272,8 +271,10 @@ struct atomisp_wb_config {
 /* Color Space Conversion settings */
 struct atomisp_cc_config {
 	unsigned int fraction_bits;
-	int matrix[3 * 3];	/* RGB2YUV Color matrix, signed
-				   <13-fraction_bits>.<fraction_bits> */
+	/* RGB2YUV Color matrix, signed
+	 * <13-fraction_bits>.<fraction_bits>
+	 */
+	int matrix[3 * 3];
 };
 
 /* De pixel noise configuration */
@@ -425,10 +426,8 @@ struct atomisp_parameters {
 	struct atomisp_3a_config   *a3a_config; /* 3A Statistics config */
 	struct atomisp_xnr_config  *xnr_config; /* eXtra Noise Reduction */
 	struct atomisp_dz_config   *dz_config;  /* Digital Zoom */
-	struct atomisp_cc_config *yuv2rgb_cc_config; /* Color
-							Correction config */
-	struct atomisp_cc_config *rgb2yuv_cc_config; /* Color
-							Correction config */
+	struct atomisp_cc_config *yuv2rgb_cc_config; /* Color Correction config */
+	struct atomisp_cc_config *rgb2yuv_cc_config; /* Color Correction config */
 	struct atomisp_macc_table  *macc_table;
 	struct atomisp_gamma_table *gamma_table;
 	struct atomisp_ctc_table   *ctc_table;
@@ -538,7 +537,8 @@ struct atomisp_ctc_table {
 
 /* Parameter for overlay image loading */
 struct atomisp_overlay {
-	/* the frame containing the overlay data The overlay frame width should
+	/*
+	 * the frame containing the overlay data The overlay frame width should
 	 * be the multiples of 2*ISP_VEC_NELEMS. The overlay frame height
 	 * should be the multiples of 2.
 	 */
@@ -562,10 +562,12 @@ struct atomisp_overlay {
 	/* the blending percent of overlay data for V subpixels */
 	unsigned char blend_overlay_perc_v;
 	/* the overlay start x pixel position on output frame It should be the
-	   multiples of 2*ISP_VEC_NELEMS. */
+	 * multiples of 2*ISP_VEC_NELEMS.
+	 */
 	unsigned int overlay_start_x;
 	/* the overlay start y pixel position on output frame It should be the
-	   multiples of 2. */
+	 * multiples of 2.
+	 */
 	unsigned int overlay_start_y;
 };
 
@@ -836,8 +838,10 @@ enum atomisp_burst_capture_options {
 #define V4L2_CID_ATOMISP_LOW_LIGHT \
 	(V4L2_CID_PRIVATE_BASE + 5)
 
-/* Camera class:
- * Exposure, Flash and privacy (indicator) light controls, to be upstreamed */
+/*
+ * Camera class:
+ * Exposure, Flash and privacy (indicator) light controls, to be upstreamed
+ */
 #define V4L2_CID_CAMERA_LASTP1             (V4L2_CID_CAMERA_CLASS_BASE + 1024)
 
 #define V4L2_CID_RUN_MODE			(V4L2_CID_CAMERA_LASTP1 + 20)
diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h
index 426c5ee4ec18..415b265505c7 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h
@@ -15,8 +15,7 @@ int atomisp_gmin_remove_subdev(struct v4l2_subdev *sd);
 int gmin_get_var_int(struct device *dev, bool is_gmin,
 		     const char *var, int def);
 struct camera_sensor_platform_data *
-gmin_camera_platform_data(
-    struct v4l2_subdev *subdev,
-    enum atomisp_input_format csi_format,
-    enum atomisp_bayer_order csi_bayer);
+gmin_camera_platform_data(struct v4l2_subdev *subdev,
+			  enum atomisp_input_format csi_format,
+			  enum atomisp_bayer_order csi_bayer);
 #endif
diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index 6146555fe9cf..2378a21ee961 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -72,10 +72,12 @@ enum atomisp_input_format {
 
 	/* CSI2-MIPI specific format: YUV data.
 	 */
-	ATOMISP_INPUT_FORMAT_YUV420_8_SHIFT,  /* YUV420 8-bit (Chroma Shifted
-						 Pixel Sampling) */
-	ATOMISP_INPUT_FORMAT_YUV420_10_SHIFT, /* YUV420 8-bit (Chroma Shifted
-						 Pixel Sampling) */
+	ATOMISP_INPUT_FORMAT_YUV420_8_SHIFT,   /* YUV420 8-bit (Chroma Shifted
+						* Pixel Sampling)
+						*/
+	ATOMISP_INPUT_FORMAT_YUV420_10_SHIFT,  /* YUV420 10-bit (Chroma Shifted
+						* Pixel Sampling)
+						*/
 
 	/* CSI2-MIPI specific format: Generic long packet data
 	 */
@@ -105,7 +107,7 @@ struct intel_v4l2_subdev_table {
 };
 
 /*
- *  Sensor of external ISP can send multiple streams with different mipi data
+ * Sensor of external ISP can send multiple streams with different mipi data
  * type in the same virtual channel. This information needs to come from the
  * sensor or external ISP
  */
@@ -119,13 +121,14 @@ struct atomisp_input_stream_info {
 	enum atomisp_input_stream_id stream;
 	u8 enable;
 	/* Sensor driver fills ch_id with the id
-	   of the virtual channel. */
+	 * of the virtual channel.
+	 */
 	u8 ch_id;
 	/* Tells how many streams in this virtual channel. If 0 ignore rest
-	 * and the input format will be from mipi_info */
+	 * and the input format will be from mipi_info
+	 */
 	u8 isys_configs;
-	/*
-	 * if more isys_configs is more than 0, sensor needs to configure the
+	/* If isys_configs is more than 0, sensor needs to configure the
 	 * input format differently. width and height can be 0. If width and
 	 * height is not zero, then the corresponding data needs to be set
 	 */
-- 
2.43.0

