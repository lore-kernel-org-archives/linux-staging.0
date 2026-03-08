Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AC03242D9
	for <linux-staging@lists.linux.dev>; Sun,  8 Mar 2026 21:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773007150; cv=none; b=EkjhwJNbSv6bwj19yTx0YUbxipJgpzMQ9svE7TSbJvmmzaL3tddQpgC9EG+aA33Dgv/Lz+Z6aQQTMTmgu8Av/kZnWLgZ6gCnDL7lZxD6yXVV1KU3UE8y0sAfeuGpq+3+ueaeim++YJWETwISNxa1MXlxTuOVz0kD6anF/v7UBRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773007150; c=relaxed/simple;
	bh=RkI0Ck+Z//36o4GYMvtpCE/Nbzne3VOHMoCn1ZlFcrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gEc1f7Cz0C1VsI64GeY9QJY9oQpKa4hmm096vo0i/Qf7W7QRNkVfifTWb3nBC3oGgTrT70a9BIKSw9AEkUsYo/cVsmKOZrvu0RMKFmdxXjwUdz1N+hxFhbpFibJVm8uqBGb1LWk19MAtRb6eitx4mNpO20pQGwauR84/kAHn/FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URkcm3VR; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URkcm3VR"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4852a8482fcso17177775e9.3
        for <linux-staging@lists.linux.dev>; Sun, 08 Mar 2026 14:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773007147; x=1773611947; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ubLM4F7XEC/QmTucukVIfkm75FRzWcZH4FP0WB/k0JE=;
        b=URkcm3VRPpIlIjVWxNQHYM8+C79K0DUKoQbeq+VDLPo5Tu2wNlXVrRKhZ/h4NgDuvY
         kijaiAFSw+jgxdBeOY56EiqgFGf3GLZHkTQuwtuLbZG06y0Y8UHfCPwda48GV/apnADI
         mkgDdsnWAGYXeDMCcJR59eRK0fa5ntYtGZmRCE6RKtGuy0X2JilAyupS6PDVvfVhBoh2
         H0cR5WxdDwh2kDv1RLFsUX6Tvw9we19JdhNGWojctdmpEjmvZuwg2OERBQSM4roGaf3L
         I4kf9U3ME0nlTXexRYw8YGDP8mZIXVuRWAdR1oRdUGJLE7LTG1iuslYcShDkXXIkGTda
         KgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773007147; x=1773611947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubLM4F7XEC/QmTucukVIfkm75FRzWcZH4FP0WB/k0JE=;
        b=JB0nSnYpyNflIemKzUssrgoNivaxF40zsvr3QTzpi/3I9SFMtqH017E6vdd9nORnjx
         gqPEGwruQnIRPkr+UychuKNbqnN4R6+wIGOmvnozsH74epMn9P4l3lGGm2MQQfOTb0lp
         O123FAohZ27roT1Xh8vbEGbbu2HB16lp1vDVJu6Hy9xb/9t6cYEM1SnmF7wg2rJV2oTL
         ifSZA4Rcy9gY1O+VoD8fYlHpsFsfnasbB5qZ+td3aFpN3Yz7ZaMIGIf0o5ii/1HJkGdZ
         0iqp4Bg7X761jKbeChKR2aPQ75NKBuKwxHAJUpLGwx9UVTmqa16zPcRjN8NUHfQqjL8m
         hqgA==
X-Forwarded-Encrypted: i=1; AJvYcCXKarFWfjuPrtj9NXy/iwwJdGMKxms/gYrFbfSijG5kMjnbfJ8Ddn3r2TXysCOvG9flH2uU6MPUIyxk8Uka@lists.linux.dev
X-Gm-Message-State: AOJu0YwQaj6zulKWZJUwOkuKZXhtFORyXv7znLf9peS0xFuLT5VDqa9d
	fjAx8FEpddxqaBEpHa7CnvB/akgnz3FsCKauO2cnUVIsGR1z2ouP1jVlV+pj3/L+hy4DFw==
X-Gm-Gg: ATEYQzzke364ad/C/OWwShr15SFNTNUutr70z9TXR7PqvXWW3Tn5H6b4MOEPv9ixyhO
	NmgOEnEstBD7uXSDmgPoi+IS6Aex5Kvpqj7zXBHfN0mp/aidliumgUfWj9pn3d2Tlq+p2+cBf4p
	8M4gIp1wwgcph6U+fPmEt+jlj0nz9UHTL3mo8OLkQhDn+ywdmwP55Ab/2m+5qaBpzRRPHK1IFwM
	LKYBoIiWh4BeXhGOA2VFWY9jwdPsoTalNbW37Xqi8QmVOapRIzNeosPGKjS4jAlflltTvpwGQEC
	SK1TH9niSnK3AVZsrWDqwE1MwocdhJomPh3FbxmYgm0K71pwvoGN8xCAROJIwitrG4r3wzpQt39
	3ib6rKsvOp5lWY/AX5/RHncfb8vopWoEZ1r0S8wXbgKYlelSvMbIkW1tyMIvdJXYkzE1j7Rg2mO
	g0gKoSDU6vbIpGIiUfwRw6FQCnY39U2u1z77igzOgEMVXY74iip3YU6ygKw5m/n5J8mFzW
X-Received: by 2002:a05:600c:3acf:b0:480:4b5d:9ec with SMTP id 5b1f17b1804b1-48526978978mr154072235e9.33.1773007146690;
        Sun, 08 Mar 2026 14:59:06 -0700 (PDT)
Received: from laurentiu-Inspiron-15-3525.. ([188.27.131.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852767d8e4sm198995015e9.2.2026.03.08.14.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 14:59:06 -0700 (PDT)
From: Laur <laurentiutopai2004@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laur <laurentiutopai2004@gmail.com>
Subject: [PATCH] staging: media: atomisp: comprehensive coding style cleanup
Date: Sun,  8 Mar 2026 23:58:40 +0200
Message-ID: <20260308215840.31197-1-laurentiutopai2004@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up atomisp_cmd.c to comply with Linux Kernel coding standards.
This patch addresses multiple checkpatch.pl issues:
-Fixed block comment formatting(trailing */ on separate lines).
-Replaced hardcoded function names in logs with %s and __func__.
-Fixed comma spacing and converted leading spaces to tabs.
-Removed redundant else branches and void return statements.
-Merged multiple line dereferences to improve readability.

Signed-off-by: Laur <laurentiutopai2004@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 96 ++++++++++---------
 1 file changed, 53 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index fec369575..dc9176918 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -262,8 +262,6 @@ int atomisp_reset(struct atomisp_device *isp)
 	/* Reset ISP by power-cycling it */
 	int ret = 0;
 
-	dev_dbg(isp->dev, "%s\n", __func__);
-
 	ret = atomisp_power_off(isp->dev);
 	if (ret < 0)
 		dev_err(isp->dev, "atomisp_power_off failed, %d\n", ret);
@@ -1024,11 +1022,9 @@ v4l2_fmt_to_sh_fmt(u32 fmt)
 		return IA_CSS_FRAME_FORMAT_RGBA888;
 	case V4L2_PIX_FMT_RGB565:
 		return IA_CSS_FRAME_FORMAT_RGB565;
-#if 0
 	case V4L2_PIX_FMT_JPEG:
 	case V4L2_PIX_FMT_CUSTOM_M10MO_RAW:
 		return IA_CSS_FRAME_FORMAT_BINARY_8;
-#endif
 	case V4L2_PIX_FMT_SBGGR16:
 	case V4L2_PIX_FMT_SBGGR10:
 	case V4L2_PIX_FMT_SGBRG10:
@@ -1380,8 +1376,10 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 	if (atomisp_css_get_grid_info(asd, pipe_id))
 		return;
 
-	/* We must free all buffers because they no longer match
-	   the grid size. */
+	/*
+	 *  We must free all buffers because they no longer match
+	 *  the grid size.
+	 */
 	atomisp_css_free_stat_buffers(asd);
 
 	err = atomisp_alloc_css_stat_bufs(asd, ATOMISP_INPUT_STREAM_GENERAL);
@@ -1393,8 +1391,10 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 	if (atomisp_alloc_3a_output_buf(asd)) {
 		/* Failure for 3A buffers does not influence DIS buffers */
 		if (asd->params.s3a_output_bytes != 0) {
-			/* For SOC sensor happens s3a_output_bytes == 0,
-			 * using if condition to exclude false error log */
+			/*
+			 * For SOC sensor happens s3a_output_bytes == 0,
+			 * using if condition to exclude false error log
+			 */
 			dev_err(isp->dev, "Failed to allocate memory for 3A statistics\n");
 		}
 		goto err;
@@ -1415,7 +1415,7 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 
 err:
 	atomisp_css_free_stat_buffers(asd);
-	return;
+
 }
 
 static void atomisp_curr_user_grid_info(struct atomisp_sub_device *asd,
@@ -1589,7 +1589,6 @@ int atomisp_get_dis_stat(struct atomisp_sub_device *asd,
 int atomisp_set_array_res(struct atomisp_sub_device *asd,
 			  struct atomisp_resolution  *config)
 {
-	dev_dbg(asd->isp->dev, ">%s start\n", __func__);
 	if (!config) {
 		dev_err(asd->isp->dev, "Set sensor array size is not valid\n");
 		return -EINVAL;
@@ -1687,8 +1686,9 @@ int atomisp_3a_stat(struct atomisp_sub_device *asd, int flag,
 
 	if (atomisp_compare_grid(asd, &config->grid_info) != 0) {
 		/* If the grid info in the argument differs from the current
-		   grid info, we tell the caller to reset the grid size and
-		   try again. */
+		 * grid info, we tell the caller to reset the grid size and
+		 * try again.
+		 */
 		return -EAGAIN;
 	}
 
@@ -1885,8 +1885,8 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
  * Function to check the zoom region whether is effective
  */
 static bool atomisp_check_zoom_region(
-    struct atomisp_sub_device *asd,
-    struct ia_css_dz_config *dz_config)
+	struct atomisp_sub_device *asd,
+	struct ia_css_dz_config *dz_config)
 {
 	struct atomisp_resolution  config;
 	bool flag = false;
@@ -1920,8 +1920,8 @@ static bool atomisp_check_zoom_region(
 }
 
 void atomisp_apply_css_parameters(
-    struct atomisp_sub_device *asd,
-    struct atomisp_css_params *css_param)
+	struct atomisp_sub_device *asd,
+	struct atomisp_css_params *css_param)
 {
 	if (css_param->update_flag.wb_config)
 		asd->params.config.wb_config = &css_param->wb_config;
@@ -2032,7 +2032,7 @@ static unsigned int long copy_from_compatible(void *to, const void *from,
 {
 	if (from_user)
 		return copy_from_user(to, (void __user *)from, n);
-	else
+
 		memcpy(to, from, n);
 	return 0;
 }
@@ -2462,9 +2462,11 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		if (sizeof(*cur) != sizeof(coefs->grid) ||
 		    memcmp(&coefs->grid, cur, sizeof(coefs->grid))) {
 			dev_err(asd->isp->dev, "dvs grid mismatch!\n");
-			/* If the grid info in the argument differs from the current
-			grid info, we tell the caller to reset the grid size and
-			try again. */
+			/*
+			 * If the grid info in the argument differs from the current
+			 * grid info, we tell the caller to reset the grid size and
+			 * try again.
+			 */
 			return -EAGAIN;
 		}
 
@@ -2518,9 +2520,11 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		if (sizeof(*cur) != sizeof(dvs2_coefs.grid) ||
 		    memcmp(&dvs2_coefs.grid, cur, sizeof(dvs2_coefs.grid))) {
 			dev_err(asd->isp->dev, "dvs grid mismatch!\n");
-			/* If the grid info in the argument differs from the current
-			grid info, we tell the caller to reset the grid size and
-			try again. */
+			/*
+			 * If the grid info in the argument differs from the current
+			 * grid info, we tell the caller to reset the grid size and
+			 * try again.
+			 */
 			return -EAGAIN;
 		}
 
@@ -3016,6 +3020,8 @@ int atomisp_param(struct atomisp_sub_device *asd, int flag,
 	struct ia_css_pipe_config *vp_cfg =
 		    &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].
 		    pipe_configs[IA_CSS_PIPE_ID_VIDEO];
+	struct ia_css_stream_info *s_info =
+		    &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream_info;
 
 	/* Read parameter for 3A binary info */
 	if (flag == 0) {
@@ -3027,13 +3033,12 @@ int atomisp_param(struct atomisp_sub_device *asd, int flag,
 
 		/* We always return the resolution and stride even if there is
 		 * no valid metadata. This allows the caller to get the
-		 * information needed to allocate user-space buffers. */
-		config->metadata_config.metadata_height = asd->
-			stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream_info.
-			metadata_info.resolution.height;
-		config->metadata_config.metadata_stride = asd->
-			stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream_info.
-			metadata_info.stride;
+		 * information needed to allocate user-space buffers.
+		 */
+		config->metadata_config.metadata_height =
+			 s_info->metadata_info.resolution.height;
+		config->metadata_config.metadata_stride =
+			 s_info->metadata_info.stride;
 
 		/* update dvs grid info */
 		if (dvs_grid_info)
@@ -3277,8 +3282,10 @@ atomisp_bytesperline_to_padded_width(unsigned int bytesperline,
 		return bytesperline / 2;
 	case IA_CSS_FRAME_FORMAT_RGBA888:
 		return bytesperline / 4;
-	/* The following cases could be removed, but we leave them
-	   in to document the formats that are included. */
+	/*
+	 * The following cases could be removed, but we leave them
+	 * in to document the formats that are included.
+	 */
 	case IA_CSS_FRAME_FORMAT_NV11:
 	case IA_CSS_FRAME_FORMAT_NV12:
 	case IA_CSS_FRAME_FORMAT_NV16:
@@ -3314,9 +3321,11 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
 	padded_width = atomisp_bytesperline_to_padded_width(
 			   arg->fmt.bytesperline, sh_format);
 
-	/* Note: the padded width on an ia_css_frame is in elements, not in
-	   bytes. The RAW frame we use here should always be a 16bit RAW
-	   frame. This is why we bytesperline/2 is equal to the padded with */
+	/*
+	 * Note: the padded width on an ia_css_frame is in elements, not in
+	 * bytes. The RAW frame we use here should always be a 16bit RAW
+	 * frame. This is why we bytesperline/2 is equal to the padded with
+	 */
 	if (ia_css_frame_allocate(&res, arg->fmt.width, arg->fmt.height,
 				       sh_format, padded_width, 0)) {
 		ret = -ENOMEM;
@@ -3889,9 +3898,9 @@ enum mipi_port_id atomisp_port_to_mipi_port(struct atomisp_device *isp,
 }
 
 static inline int atomisp_set_sensor_mipi_to_isp(
-    struct atomisp_sub_device *asd,
-    enum atomisp_input_stream_id stream_id,
-    struct camera_mipi_info *mipi_info)
+	struct atomisp_sub_device *asd,
+	enum atomisp_input_stream_id stream_id,
+	struct camera_mipi_info *mipi_info)
 {
 	struct v4l2_control ctrl;
 	struct atomisp_device *isp = asd->isp;
@@ -3926,7 +3935,8 @@ static inline int atomisp_set_sensor_mipi_to_isp(
 	}
 
 	/* Compatibility for sensors which provide no media bus code
-	 * in s_mbus_framefmt() nor support pad formats. */
+	 * in s_mbus_framefmt() nor support pad formats.
+	 */
 	if (mipi_info && mipi_info->input_format != -1) {
 		bayer_order = mipi_info->raw_bayer_order;
 
@@ -3998,13 +4008,12 @@ static int get_frame_info_nop(struct atomisp_sub_device *asd,
  * handled in CSS when the input resolution is changed.
  */
 static int css_input_resolution_changed(struct atomisp_sub_device *asd,
-					struct v4l2_mbus_framefmt *ffmt)
+	struct v4l2_mbus_framefmt *ffmt)
 {
 	struct atomisp_metadata_buf *md_buf = NULL, *_md_buf;
 	unsigned int i;
 
-	dev_dbg(asd->isp->dev, "css_input_resolution_changed to %ux%u\n",
-		ffmt->width, ffmt->height);
+	dev_dbg(asd->isp->dev, "%s to %ux%u\n", __func__, ffmt->width, ffmt->height);
 
 	if (IS_ISP2401)
 		atomisp_css_input_set_two_pixels_per_clock(asd, false);
@@ -4385,7 +4394,8 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 			V4L2_SEL_TGT_CROP);
 
 	/* Try to enable YUV downscaling if ISP input is 10 % (either
-	 * width or height) bigger than the desired result. */
+	 * width or height) bigger than the desired result.
+	 */
 	if (!IS_MOFD ||
 	    isp_sink_crop.width * 9 / 10 < f->fmt.pix.width ||
 	    isp_sink_crop.height * 9 / 10 < f->fmt.pix.height ||
-- 
2.43.0

