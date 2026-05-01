Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF22304BA3
	for <linux-staging@lists.linux.dev>; Fri,  1 May 2026 17:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655317; cv=none; b=sghq56UU8OzJ+zsv8UyagrZIbnLlrHLS3ypm7y4/1gHfbCB9Cxb830wWS7N5BoNWD9q0JLQiHoDAqHHzYu0qi9QNw9sX8ZTSXKQ6TKdJuHBRoBFY0TRLwXNKGYNDk+IsacV2Ot9EE1vRzKEkZ7Y47IM2L0v6iSpOjF7uxUoj2TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655317; c=relaxed/simple;
	bh=5YlxqVUZMmAu7OzHvewNrtOrDhqyNa39uWLh5eD7InY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CB5Hzb0LxgUUZ5gk+A9fsB8uUE8lQu2WgiSTeuVMt013a2vHeN2sdLlopxMIExbwF35jzoJWVIWqGpHZWF0PviZx5/khWIkwikl7aWXvyidx9FSX9ck/X8KGBjyTl08af1TORPJ1kqkEIGx9dv6dF7jaSArOktekJaqGvvFnazk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sbgISZMR; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sbgISZMR"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82fb2d0c5d1so2139673b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 01 May 2026 10:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777655315; x=1778260115; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r3jBh2i5QcfKLncxdlwHNU4owYDErQsEOr4uUJaqJO4=;
        b=sbgISZMRMOLbNLnfszgoybl8hth9Zuxri8QVoDj0E4PsA32vjmuP+MZyeZgW4TXADJ
         pVeCozFPJ64bFOSQOGNE+qd0wXcF+n0Wwd80fZlNtgprmWfeWrni9cONfeGlGngVNgTS
         0QJAOayNTTAuUUecudcAvbn/dFsFQJbAf8Li77/BvG0UfY9IDOfQBbwSkU/2ngouChn6
         TJ1Fqzn06vX4SrYnwS5kkbMOLpb8gG9Je/M/3tZTa16nZ1qjP1Laqr/f+iF/ICiSJS6L
         x+zZ3n5hPDgNRHiXVXa18hnmEetTj5W+0m8GweljHG4l7b14mc8NQyWwf3Ymq7eBuFiH
         3a/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655315; x=1778260115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3jBh2i5QcfKLncxdlwHNU4owYDErQsEOr4uUJaqJO4=;
        b=WbqthgjDCBunFfxIr904G5k71OT8OBPnT8M9cWMHmCqeMx4Qr87hEQo0tZ+Sk3hJXK
         07fCNPWt/43A8gzCKD468yECo8kX+/JqmuoscujZiVXa72Wu92XRcSEjGpJBe75D/3de
         7cGsefyA7LdGrfhM+z8mdLMiRXHQrvFYKMl9ReHNV5SW0aTdUxq9sUC/W2rvNlDcPuFb
         KpI39S2JPKOMx4poEhoKa0rL3Cnel2ug2fSrFCOGB4SOs0EH4bNMW3uT2l1OYSxSht5d
         tKEO75/qcEOKOXYLMVCOYlHvaTdXyCEgHWAD0alz2UJf1oj3jrmxFTq5nlYxcsp/SmgV
         JRfw==
X-Forwarded-Encrypted: i=1; AFNElJ+B6w9qvNa0E3p7PStQOPcv+JVTINPy61z6fPb8UAIt7+iWRTmV++OzAmPBGjRbKZMOhMWxIhHFtFWhuOrI@lists.linux.dev
X-Gm-Message-State: AOJu0YxB9um4MVz3KUWmGxB1zX2+decxWBkcLESmws5pPQPh6OzGZlg6
	6Q+Tnt+Fgyw/AjTvo6InLQMJa0gM9MokpfSn+rIKUdjSD/PGvr903xyC
X-Gm-Gg: AeBDieuPQWOcEGoS2EHlRb9HwY0cckFflXuheIgUAPSQTJxDSrXhWZ4XJRim8rg0wfN
	nNcsuopOOnCLTXb4wZUn1uVWZhO6y2gokPw8na30ekfXW8l/OzPg9TmWIzwuVEHNDD44aVSKAhe
	KgMyBxmFAgmrGQHBLb07w2CnM+N3+4TmognxByFuoChoZTLxX2a8wvJ2vH0GLFQk2oSfkqdeDNe
	MoPeyWCC9bvfq1w9aScFXIxb0uWw9lczoeeNe81rk1m6XUMpBUSOmXnV+bHEjq3l4bJLPvrcU3L
	iEki6iYXKSGFAxEZpeKELDpJE6r8PHgz9F3EKmpgrKeOT7ahoXqWscZPfFO7eV6Y2r9o57iKeGF
	C359vu2E57wdaRoLfhSdaqF3ZuiIYl2oZhStLVl6igtGI8zXc1VJnA2DRE92nK7knfqSyl4GCrZ
	6Xnx7rurlUGdEZVw2s9tz8x8jbPWo=
X-Received: by 2002:a05:6a00:b488:b0:7a9:d8a8:992a with SMTP id d2e1a72fcca58-834fff38ebfmr7018376b3a.13.1777655314499;
        Fri, 01 May 2026 10:08:34 -0700 (PDT)
Received: from localhost ([2409:40d1:ac:8595:d46b:293a:655a:c877])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b87869sm3368321b3a.61.2026.05.01.10.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:08:34 -0700 (PDT)
From: Ansh Bagga <ansh.bagga.linux@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ansh Bagga <ansh.bagga.linux@gmail.com>
Subject: [PATCH] staging: media: atomisp: fix block comment formatting
Date: Fri,  1 May 2026 22:38:02 +0530
Message-ID: <20260501170802.554963-1-ansh.bagga.linux@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch warnings regarding block comment alignment.
Block comments should use a trailing '*/' on a separate line to
adhere to the kernel coding style guidelines.

Signed-off-by: Ansh Bagga <ansh.bagga.linux@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 41 ++++++++++++-------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index fec369575d88..37ccc95076a7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1380,8 +1380,10 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 	if (atomisp_css_get_grid_info(asd, pipe_id))
 		return;
 
-	/* We must free all buffers because they no longer match
-	   the grid size. */
+	/*
+	 * We must free all buffers because they no longer match
+	 * the grid size.
+	 */
 	atomisp_css_free_stat_buffers(asd);
 
 	err = atomisp_alloc_css_stat_bufs(asd, ATOMISP_INPUT_STREAM_GENERAL);
@@ -1394,7 +1396,8 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 		/* Failure for 3A buffers does not influence DIS buffers */
 		if (asd->params.s3a_output_bytes != 0) {
 			/* For SOC sensor happens s3a_output_bytes == 0,
-			 * using if condition to exclude false error log */
+			 * using if condition to exclude false error log
+			 */
 			dev_err(isp->dev, "Failed to allocate memory for 3A statistics\n");
 		}
 		goto err;
@@ -1687,8 +1690,9 @@ int atomisp_3a_stat(struct atomisp_sub_device *asd, int flag,
 
 	if (atomisp_compare_grid(asd, &config->grid_info) != 0) {
 		/* If the grid info in the argument differs from the current
-		   grid info, we tell the caller to reset the grid size and
-		   try again. */
+		 * grid info, we tell the caller to reset the grid size and
+		 * try again
+		 */
 		return -EAGAIN;
 	}
 
@@ -2463,8 +2467,9 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		    memcmp(&coefs->grid, cur, sizeof(coefs->grid))) {
 			dev_err(asd->isp->dev, "dvs grid mismatch!\n");
 			/* If the grid info in the argument differs from the current
-			grid info, we tell the caller to reset the grid size and
-			try again. */
+			 * grid info, we tell the caller to reset the grid size and
+			 * try again.
+			 */
 			return -EAGAIN;
 		}
 
@@ -2519,8 +2524,9 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		    memcmp(&dvs2_coefs.grid, cur, sizeof(dvs2_coefs.grid))) {
 			dev_err(asd->isp->dev, "dvs grid mismatch!\n");
 			/* If the grid info in the argument differs from the current
-			grid info, we tell the caller to reset the grid size and
-			try again. */
+			 * grid info, we tell the caller to reset the grid size and
+			 * try again.
+			 */
 			return -EAGAIN;
 		}
 
@@ -3027,7 +3033,8 @@ int atomisp_param(struct atomisp_sub_device *asd, int flag,
 
 		/* We always return the resolution and stride even if there is
 		 * no valid metadata. This allows the caller to get the
-		 * information needed to allocate user-space buffers. */
+		 * information needed to allocate user-space buffers.
+		 */
 		config->metadata_config.metadata_height = asd->
 			stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream_info.
 			metadata_info.resolution.height;
@@ -3278,7 +3285,8 @@ atomisp_bytesperline_to_padded_width(unsigned int bytesperline,
 	case IA_CSS_FRAME_FORMAT_RGBA888:
 		return bytesperline / 4;
 	/* The following cases could be removed, but we leave them
-	   in to document the formats that are included. */
+	 * in to document the formats that are included.
+	 */
 	case IA_CSS_FRAME_FORMAT_NV11:
 	case IA_CSS_FRAME_FORMAT_NV12:
 	case IA_CSS_FRAME_FORMAT_NV16:
@@ -3315,8 +3323,9 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
 			   arg->fmt.bytesperline, sh_format);
 
 	/* Note: the padded width on an ia_css_frame is in elements, not in
-	   bytes. The RAW frame we use here should always be a 16bit RAW
-	   frame. This is why we bytesperline/2 is equal to the padded with */
+	 * bytes. The RAW frame we use here should always be a 16bit RAW
+	 * frame. This is why we bytesperline/2 is equal to the padded with
+	 */
 	if (ia_css_frame_allocate(&res, arg->fmt.width, arg->fmt.height,
 				       sh_format, padded_width, 0)) {
 		ret = -ENOMEM;
@@ -3926,7 +3935,8 @@ static inline int atomisp_set_sensor_mipi_to_isp(
 	}
 
 	/* Compatibility for sensors which provide no media bus code
-	 * in s_mbus_framefmt() nor support pad formats. */
+	 * in s_mbus_framefmt() nor support pad formats.
+	 */
 	if (mipi_info && mipi_info->input_format != -1) {
 		bayer_order = mipi_info->raw_bayer_order;
 
@@ -4385,7 +4395,8 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 			V4L2_SEL_TGT_CROP);
 
 	/* Try to enable YUV downscaling if ISP input is 10 % (either
-	 * width or height) bigger than the desired result. */
+	 * width or height) bigger than the desired result.
+	 */
 	if (!IS_MOFD ||
 	    isp_sink_crop.width * 9 / 10 < f->fmt.pix.width ||
 	    isp_sink_crop.height * 9 / 10 < f->fmt.pix.height ||
-- 
2.54.0

