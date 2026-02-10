Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55206340293
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 09:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770715406; cv=none; b=JTWHzJUq6FFwmjWzsuIs/WBGHhefz7jTsrA5PkJCsqcrdLnTLF3JhCpjtfdytePsYMavwrqLwm0x3OEfFs1wFB0lCFbOo/xy5w1jWHFZrRqUh9EiVbz7E4MaEQtmXJcezlPHcYQCcCWqVNT62N+qdz8fbY4wQeykGtCbxpD6DXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770715406; c=relaxed/simple;
	bh=Bjn0RuhZN3vqk8AfJwE84T734D8d5+Wrpn4epkSHCRc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FzRQovizaNHyR7vzWR9jbqIxEHf8cppU2veMbuZiesZq1Kr4rnPR/HY7P89EjKs4jeZQv7GaV9NMK9g1Zi2QiNB/LypimIPbjSnSai0jzY6WkWFNqj2aXOb7yBg8Ac77oMJARQ7AqO+65ewl4dQWzwrbl7tVwBi/6N4CgQS6iLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QxUsz4RK; arc=none smtp.client-ip=209.85.219.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QxUsz4RK"
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-895071c5527so50901426d6.1
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 01:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770715402; x=1771320202; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GFfJRx9iqyIpJUs0rDFUoU85OWoD1Zb4nd1kIoRNApI=;
        b=QxUsz4RKKnj2QltJrN7SO1U0+Uga3+XhCiPomFzsE5BiqEyhB0OXfxcfliqfzazWLq
         l/P2+JOpRvugyuE5BmEFWIpEZazD7fhvlO5ULbwZKnTPle8EvK7PLAFvYXjfHTzTFGUj
         rkdXvqGQdMiTgmOC/8xP9yRqznUxVLsVr5Ovxi6jqEP4SJ2zQz7NbwR2XLdMfiGMlKyt
         +qnoJAycFDl4BWHUZO+D6qWRGKHyLvqXFiWtQvpgrVXmww3Rb7WAmIQ3xGvuWj1Ket7I
         PCJhrI2nLNr14otSeVadZ6dPb0Y1sc5r31BkHQDf/aSeO/oOBuZM0WSXn1SOQFPkFhNj
         qYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770715402; x=1771320202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFfJRx9iqyIpJUs0rDFUoU85OWoD1Zb4nd1kIoRNApI=;
        b=tGDVusGK/phRmHaxV7Ua4oMqy1lW2yOPBUiJOf/OreWeuNuxyUvaUlI/74Qs6afct2
         +BVmhaXiYEOVBEe2XhZuJNnJFPYSZTTn8TBHq4KvOZ9mlq+EfhTgk7OjWZdmqf8lYTfa
         2As4joGer+RALC0SE1sD2iHOB1jEgxAJAca8WYFEPrkli2uACHV1MtXfORKd9X2Bd2oG
         cwWzdjL+5ycfOpB60EZd0AWFdxM10aqV5bYUkPJZ4J+kvzxTQ5fB70gMlKoO+WdkyloZ
         C5dlhJJ1Aj+2eJmrFtHxry8gNyKG+vneDap/iqC0/SiMuTvFXL4oMCSgFls/VPc1rRLz
         4quQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXR9pA4r37pBiKnn/IJ90T1I/8HKrkMMFTH0yJDzHr7zlypCnvEZS2wqYUUhF6IytGt6bxQWwbRx0I9P9x@lists.linux.dev
X-Gm-Message-State: AOJu0Yymv1xQWntPN8vid6nXXDF+D1uS65K6lP+H+x+TE4Fe/7BgnHcj
	Vex65C5xTFs+QEe5Y6a5FEa285sJg2vBWJ8gYFH3g4fBizGzhCC7Z008Jqm7r7JSgzZQOg==
X-Gm-Gg: AZuq6aK7rz759rT3QN2ujjqbv41gzq9mLF0B9LsjO4Zu/2Gv6qhKJe7wXi32k//rzps
	UfVs/8cMgvuMHnId5ZAvlQL3n8S5XingETZP47ab2ihZUYydAgLrMP4ecvBiSPJ7MFE+BHZeJ9J
	nai8pp2ob77RZOjlheTE8w6c0fxZ6qaC+MtK82jO9tomn4HnzWUmxpZKUQoBfoRl9p+zubpp6NH
	eNIv1d1/vfBG896tcW+4U9Uwi54D84fLpXtvj9ZevUfTAoq72Ux+EgcjcqqVliZEZmMHREP6Iye
	oeA2ZYCcUjMBjB98YHNJGNr6joC6uZaEdFrJ68abB4DFCyAuALoXqxT1LVO1wsHNBCMhFlq5Fzb
	eeMedZ+wKGDiaQOp22zdgr/KsgfGahTOqW+RSA2FCAqDUGpeWP5AXq94v92Q9X0y//q8gXS/AXq
	FmkozbXA9nf8ls
X-Received: by 2002:ac8:7f82:0:b0:505:e4ab:ce4 with SMTP id d75a77b69052e-5063985e325mr165282301cf.11.1770715402225;
        Tue, 10 Feb 2026 01:23:22 -0800 (PST)
Received: from deadibone.. ([118.141.233.34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf77f320esm998136485a.5.2026.02.10.01.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:23:21 -0800 (PST)
From: Ethan Lam <ethanlxkernel@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Lam <ethanlxkernel@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: fix block comment style
Date: Tue, 10 Feb 2026 17:23:11 +0800
Message-ID: <20260210092312.29322-1-ethanlxkernel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed all block comment style warnings by checkpatch.pl.

Signed-off-by: Ethan Lam <ethanlxkernel@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 94 ++++++++++++-------
 1 file changed, 59 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 3a4eb4f6d3be..a16fefa24216 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -99,11 +99,11 @@ static unsigned short atomisp_get_sensor_fps(struct atomisp_sub_device *asd)
 /*
  * DFS progress is shown as follows:
  * 1. Target frequency is calculated according to FPS/Resolution/ISP running
- *    mode.
+ * mode.
  * 2. Ratio is calculated using formula: 2 * HPLL / target frequency - 1
- *    with proper rounding.
+ * with proper rounding.
  * 3. Set ratio to ISPFREQ40, 1 to FREQVALID and ISPFREQGUAR40
- *    to 200MHz in ISPSSPM1.
+ * to 200MHz in ISPSSPM1.
  * 4. Wait for FREQVALID to be cleared by P-Unit.
  * 5. Wait for field ISPFREQSTAT40 in ISPSSPM1 turn to ratio set in 3.
  */
@@ -808,7 +808,8 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 						     &asd->params.css_param);
 			if (asd->params.css_param.update_flag.dz_config)
 				asd->params.config.dz_config = &asd->params.css_param.dz_config;
-			/* New global dvs 6axis config should be blocked
+			/*
+			 * New global dvs 6axis config should be blocked
 			 * here if there's a buffer with per-frame parameters
 			 * pending in CSS frame buffer queue.
 			 * This is to aviod zooming vibration since global
@@ -821,7 +822,8 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 							  asd->params.dvs_6axis);
 			else
 				asd->params.css_update_params_needed = false;
-			/* The update flag should not be cleaned here
+			/*
+			 * The update flag should not be cleaned here
 			 * since it is still going to be used to make up
 			 * following per-frame parameters.
 			 * This will introduce more copy work since each
@@ -963,10 +965,10 @@ irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr)
 	 * The standard CSS2.0 API tells the following calling sequence of
 	 * dequeue ready buffers:
 	 * while (ia_css_dequeue_psys_event(...)) {
-	 *	switch (event.type) {
-	 *	...
-	 *	ia_css_pipe_dequeue_buffer()
-	 *	}
+	 * switch (event.type) {
+	 * ...
+	 * ia_css_pipe_dequeue_buffer()
+	 * }
 	 * }
 	 * That is, dequeue event and buffer are one after another.
 	 *
@@ -1380,8 +1382,11 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 	if (atomisp_css_get_grid_info(asd, pipe_id))
 		return;
 
-	/* We must free all buffers because they no longer match
-	   the grid size. */
+	/*
+	 * We must free all buffers because they no longer match
+	 * the grid size.
+	 */
+
 	atomisp_css_free_stat_buffers(asd);
 
 	err = atomisp_alloc_css_stat_bufs(asd, ATOMISP_INPUT_STREAM_GENERAL);
@@ -1393,8 +1398,10 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
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
@@ -1686,9 +1693,11 @@ int atomisp_3a_stat(struct atomisp_sub_device *asd, int flag,
 		return -EINVAL;
 
 	if (atomisp_compare_grid(asd, &config->grid_info) != 0) {
-		/* If the grid info in the argument differs from the current
-		   grid info, we tell the caller to reset the grid size and
-		   try again. */
+		/*
+		 * If the grid info in the argument differs from the current
+		 * grid info, we tell the caller to reset the grid size and
+		 * try again.
+		 */
 		return -EAGAIN;
 	}
 
@@ -1774,7 +1783,8 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
 		return 0;
 	}
 
-	/* FIXME:
+	/*
+	 * FIXME:
 	 * This is not the correct implementation with Google's definition, due
 	 * to firmware limitation.
 	 * map real crop region base on above calculating base max crop region.
@@ -2462,9 +2472,11 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
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
 
@@ -2518,9 +2530,11 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
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
 
@@ -3028,9 +3042,11 @@ int atomisp_param(struct atomisp_sub_device *asd, int flag,
 
 		atomisp_curr_user_grid_info(asd, &config->info);
 
-		/* We always return the resolution and stride even if there is
+		/*
+		 * We always return the resolution and stride even if there is
 		 * no valid metadata. This allows the caller to get the
-		 * information needed to allocate user-space buffers. */
+		 * information needed to allocate user-space buffers.
+		 */
 		config->metadata_config.metadata_height = asd->
 			stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream_info.
 			metadata_info.resolution.height;
@@ -3280,8 +3296,10 @@ atomisp_bytesperline_to_padded_width(unsigned int bytesperline,
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
@@ -3317,9 +3335,11 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
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
@@ -3928,8 +3948,10 @@ static inline int atomisp_set_sensor_mipi_to_isp(
 		    asd->stream_env[stream_id].isys_info[1].height);
 	}
 
-	/* Compatibility for sensors which provide no media bus code
-	 * in s_mbus_framefmt() nor support pad formats. */
+	/*
+	 * Compatibility for sensors which provide no media bus code
+	 * in s_mbus_framefmt() nor support pad formats.
+	 */
 	if (mipi_info && mipi_info->input_format != -1) {
 		bayer_order = mipi_info->raw_bayer_order;
 
@@ -4031,7 +4053,7 @@ static int css_input_resolution_changed(struct atomisp_sub_device *asd,
 
 	/*
 	 * TODO: atomisp_css_preview_configure_pp_input() not
-	 *       reset due to CSS bug tracked as PSI BZ 115124
+	 * reset due to CSS bug tracked as PSI BZ 115124
 	 */
 }
 
@@ -4387,8 +4409,10 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 			ATOMISP_SUBDEV_PAD_SINK,
 			V4L2_SEL_TGT_CROP);
 
-	/* Try to enable YUV downscaling if ISP input is 10 % (either
-	 * width or height) bigger than the desired result. */
+	/*
+	 * Try to enable YUV downscaling if ISP input is 10 % (either
+	 * width or height) bigger than the desired result.
+	 */
 	if (!IS_MOFD ||
 	    isp_sink_crop.width * 9 / 10 < f->fmt.pix.width ||
 	    isp_sink_crop.height * 9 / 10 < f->fmt.pix.height ||
-- 
2.43.0

