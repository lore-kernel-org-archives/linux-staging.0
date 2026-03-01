Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B063A3A8F7
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 20:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772398791; cv=none; b=aZQrCiqR3327796neS8Rjgz07jts/3n19POAjye5RYbK0iyBWbU5//gLeXptfEO4X8keT17AGFRGlEuLr+U1Xx86fT5AFjh7lvf7kCYMGwHGnmG2KJwUdFMS4bjsri0nuBPfAVf4sXAyq0mBI0x5F/4k5XMFjkdDeHkdB/Zoz5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772398791; c=relaxed/simple;
	bh=SlOWRADI3nROQA80eTEVqGMa/6yj1B2cTK7v2OlMqj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SZ6yc0kP4kP0qTJAsafWTjv1jxlMGDuSYeA49EHPF1RYmUKwNvMpMP0vzRnSc6CrXZ+7hJLfS9iDg7wcO27Kr5EIygDq9Q/ztRVF1GSxCjx7pcEWweUVuREuvVZ8i+MKg4bgAHkxioKIxiASkvSnPd9o9EwMSfdbJJ/tUoRU2CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYHebY5w; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYHebY5w"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3870778358aso29157201fa.1
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 12:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772398788; x=1773003588; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j6MHN8vujqeAy5voi2iD86dHKq8qVmHMYvFleDpHmjo=;
        b=ZYHebY5wUYFfWMDFxlokWU26I7XqTxPSjQps2AKfALVvQsXTZ5Vw/TGea53K7SVTla
         AqxtNeYOpXprVFDUa/R55BpWhQMWUz9wS79jAJ6Zk4vlp7c8dNbwG0/see2rw2ZXUSkZ
         1Eat7x4n+sQ1Rfwys+z02ont1Ihy4L2IcAbBDvXNxEBTIk18t3JYJW7aABtCFKKH2j2E
         yeIITiB8SFDPzD9PrXLALR/qXasQgQCL1bTiVodhH1tOTqmqodXQipX14xXGU1r0KrrI
         ufZ5Oxa8nDcefLnMFwAQj8taOr2f4v7D0YEbZphXaHULXaTq435Q0tglb06CbFi8+awJ
         JCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772398788; x=1773003588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6MHN8vujqeAy5voi2iD86dHKq8qVmHMYvFleDpHmjo=;
        b=odMfM4yk4vdDkSIMNckfZyIPLQoWqTKgF0QJ33TvIFK2iWgPYVGTaNkPe2zgiqMQJP
         pckaMPO2FgfPbCG/teNK3V+zIqO/wDSZSWpl3M21uCLz8doD8SGiLPvig/Zrf6ueF0Yb
         DMxyeJVjcbBnbV1iV8wrDLKxvFD5pyopyzbVAtadaXDwQGDmKP+JUEWiCXdeWfAKyWVZ
         wix2pfSOF4U1+OP4s7Xd1c/zzpMHzHL7wGo0v7fBF3NDwAEpJiNDg/EUXrq0ErgyTqjR
         LBIrhelBU3t+nB64fFObaq1E9/qavgeJHdgnruuN/O5P0Xqc+UjwnvblMgIo5SwXaP4S
         vXMg==
X-Gm-Message-State: AOJu0YwYSYSedUCetBJPwUW3E2M1vIHYuJ83h0vP/M++NWvjL9+EYoSf
	4/djEP3CaEjOvtRrrDNr+gK+t0oxjAwLj5JA13T4cW5jU8W1RWKJ/Gh5
X-Gm-Gg: ATEYQzzLl6lGgMDVPKWEPWmBYLXccfLi+e7c1wCFyqtiS5l9rHRYsIPX5HTjHqr1LN7
	qIsiDlTVsKkKiFxxP+3knHPtBCrw1BDQHcBnMB8K347dYn+o32JUPvYu6mHzzPDHbqyaFNmmZyq
	Amr+2Z11Famd0RgdywFio8wHdO5dYRc1nGVR8NmKHAewqFdqgg3PO7QoqSBL2AUusIYD3mw9j3A
	3FGn2Vuajn/XMfMKOMAwah1Bzv3wUktQn20m3QKA5UYkgFXu4RcZ9EPpNnONDOFYlrm7My48WoI
	lqNYU6l8zofxZxzny1SJD80WhH1C1ov9ajOxvLhY37sOJmcFQGxHxwl+APtIohHDbbzyf3AnjN2
	vKbivkvAUiGD4SVA5Qgng89EKkhn35921NBK0icwM2q41JPEJseoJ9avmnZzGnT1F5qNFhFvvbS
	+RxZVyDAJTCdlpzKEics5lbEqhhPJaGKnbjjpzz5IyWlUGwFm0YE7qEbSsmNQYqXcZeBFtMmjxi
	yxuwrqO0D3Z
X-Received: by 2002:a2e:a9ac:0:b0:386:91a1:f206 with SMTP id 38308e7fff4ca-389ff119551mr68062701fa.5.1772398787562;
        Sun, 01 Mar 2026 12:59:47 -0800 (PST)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bca099sm1241737e87.32.2026.03.01.12.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 12:59:46 -0800 (PST)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: hansg@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH] staging: atomisp: fix block comment style in atomisp_cmd.c
Date: Sun,  1 Mar 2026 21:59:10 +0100
Message-ID: <20260301205910.3308-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix block comments to use the proper kernel coding style by adding
* on subsequent lines and moving trailing */ to a separate line.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 40 ++++++++++++-------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index fec369575d88..5bc1541b1e40 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1381,7 +1381,8 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 		return;
 
 	/* We must free all buffers because they no longer match
-	   the grid size. */
+	 * the grid size.
+	 */
 	atomisp_css_free_stat_buffers(asd);
 
 	err = atomisp_alloc_css_stat_bufs(asd, ATOMISP_INPUT_STREAM_GENERAL);
@@ -1391,10 +1392,11 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 	}
 
 	if (atomisp_alloc_3a_output_buf(asd)) {
-		/* Failure for 3A buffers does not influence DIS buffers */
+		/* Failure for 3A buffers does not influence DIS buffers. */
 		if (asd->params.s3a_output_bytes != 0) {
 			/* For SOC sensor happens s3a_output_bytes == 0,
-			 * using if condition to exclude false error log */
+			 * using if condition to exclude false error log.
+			 */
 			dev_err(isp->dev, "Failed to allocate memory for 3A statistics\n");
 		}
 		goto err;
@@ -1687,8 +1689,9 @@ int atomisp_3a_stat(struct atomisp_sub_device *asd, int flag,
 
 	if (atomisp_compare_grid(asd, &config->grid_info) != 0) {
 		/* If the grid info in the argument differs from the current
-		   grid info, we tell the caller to reset the grid size and
-		   try again. */
+		 * grid info, we tell the caller to reset the grid size and
+		 * try again.
+		 */
 		return -EAGAIN;
 	}
 
@@ -2463,8 +2466,9 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
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
 
@@ -2519,8 +2523,9 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
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
 
@@ -3027,7 +3032,8 @@ int atomisp_param(struct atomisp_sub_device *asd, int flag,
 
 		/* We always return the resolution and stride even if there is
 		 * no valid metadata. This allows the caller to get the
-		 * information needed to allocate user-space buffers. */
+		 * information needed to allocate user-space buffers.
+		 */
 		config->metadata_config.metadata_height = asd->
 			stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream_info.
 			metadata_info.resolution.height;
@@ -3278,7 +3284,8 @@ atomisp_bytesperline_to_padded_width(unsigned int bytesperline,
 	case IA_CSS_FRAME_FORMAT_RGBA888:
 		return bytesperline / 4;
 	/* The following cases could be removed, but we leave them
-	   in to document the formats that are included. */
+	 * in to document the formats that are included.
+	 */
 	case IA_CSS_FRAME_FORMAT_NV11:
 	case IA_CSS_FRAME_FORMAT_NV12:
 	case IA_CSS_FRAME_FORMAT_NV16:
@@ -3315,8 +3322,9 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
 			   arg->fmt.bytesperline, sh_format);
 
 	/* Note: the padded width on an ia_css_frame is in elements, not in
-	   bytes. The RAW frame we use here should always be a 16bit RAW
-	   frame. This is why we bytesperline/2 is equal to the padded with */
+	 * bytes. The RAW frame we use here should always be a 16bit RAW
+	 * frame. This is why we bytesperline/2 is equal to the padded width.
+	 */
 	if (ia_css_frame_allocate(&res, arg->fmt.width, arg->fmt.height,
 				       sh_format, padded_width, 0)) {
 		ret = -ENOMEM;
@@ -3926,7 +3934,8 @@ static inline int atomisp_set_sensor_mipi_to_isp(
 	}
 
 	/* Compatibility for sensors which provide no media bus code
-	 * in s_mbus_framefmt() nor support pad formats. */
+	 * in s_mbus_framefmt() nor support pad formats.
+	 */
 	if (mipi_info && mipi_info->input_format != -1) {
 		bayer_order = mipi_info->raw_bayer_order;
 
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

