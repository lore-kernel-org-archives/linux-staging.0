Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9080420C00C
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 20:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772398422; cv=none; b=fmezwtJlSXVhQbrZPhIj2h7FCcx7Xpu3ZtGIC0HgzYFKVUCiFyDaTj4VFIsgUfks2EFQj1Puyrc0RwGljgRnxlnKz0QhaErHAUOjlve5QRBLRkycaRLTzKssA0pS6Oul0Ye/x7je0LiBl5enlmOfj5TqfUkRLs4uQqM/k7i42dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772398422; c=relaxed/simple;
	bh=39uFdK1Q7vn96qEWLv0wHXVCHKfsSGVWDeHHyAku2q4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r9R/E+wkeHX/BtA+GfYQdk5p54/W6qYcMVVAo8ChzhpbnS+Smb/UkGclae0qTAnB4BG6al7AUaSOjB0FQOnLbXnBHL0t/UlFkNglc1iFyFkEeAqaL8FUYT8vrYcFXn+KXNU5CpnBj2A03xv3N6/V62lS6J9sk64xy0v8CRgSTbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RoJHqeqn; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RoJHqeqn"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3870dec27f4so64543851fa.1
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 12:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772398419; x=1773003219; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jywKuAMQtVAiPypAjdsdOCiiCMyjTljL9XvusWi7pf4=;
        b=RoJHqeqnQjj8Xg/xcMUXrwYDjdqnYVAM0E3zD8ncHqUvQdsIVeajCfBdpa8wiSolaC
         O2X92tvM9z4OadOVz7e8uLpykQKoKWzEyobpmjwCw8lvQ32+u3LUu1Rk5xRBHH7EbTrA
         6Gx5McbZ8Y30nq2qs8BuAk3H88H/tUN/rDQBBKaZaiT4/tXTm3C23wFSle7tSptcVpqV
         KMkwlmJeCO/jw2egIVThCJTeVp9C84YOjjZoOCc/vmFfXJ3XHFZl2v7AwaZFyWbc9BlQ
         OnoUBCsLdHD+op+UCR7jgHzymgsAsViMv56Y1zbCtgDFpZIAV/ASgO30G0m6UClrXBYv
         w5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772398419; x=1773003219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jywKuAMQtVAiPypAjdsdOCiiCMyjTljL9XvusWi7pf4=;
        b=JprSXSlLkkq+Ji/9LcQAApuR4E73Uo7yC+IfdmxLjF6H47WzbrB8nQ/yFW4zhHHmfg
         JwGWHBcS9PixjOEALlsGzm9dbWi+MZWV+al1S+Ln8iqF2D0JMNVR1V7XFE2JRSRNSMQW
         OZErxywPST6vy9MmlZeyhRor6Q5JnOHWhgZONib88A/5gnk2MxqtUlBhYxbZwTaKcBCU
         Wsft7J9ThS7vEBpD9L+JLz+bm8+lCsBDQ5OZRMMPFR9He0ImW2gQkaGnBQzXDtllGboW
         E0xqZfhIQuxmNVpHC3lZil/OI/ouZv049Jrp2aWMNFsXV12FCdXCK/O5ePsiS41+pv5H
         qyew==
X-Gm-Message-State: AOJu0YxH/ygc47LQddgYb2K9U8I+87jsqNZjcNvsbHXEDyKBq3Fvv43b
	nIN0YVnxeJ1RqN5/s120PUecqqqr0LbtqbFarDeozg91wE+Ri0xKPiET
X-Gm-Gg: ATEYQzz22L7hIznOmCgASJAQzVO9rrD68BGR8pE5kEG59KYm7isp38iolgtCN9cx9IN
	PcZXKValD47bpaxbtNagXDXDw2WGF0/VHoACs1/7QH8Pv4a79W5wgI8rvE069EzP5BAOXA9yjW8
	UHpXsg4Dq8etXTznZrjg91jAok/dREl9YPQ0lI+PXMAwQrB3hltFE3QOUIYWeV31CGTTHp06Ok/
	ls0sbLz8Z+v/Vgqg5GM+2W+9bJtZq0WN4LcibkNNWj3ZqrlSgss+z041E0YoeXRzqhao+pIM489
	oEmILFvBqQl/L5dZho2Y4rK8YbnbA2NjTX0oLN+o1ijF9brES5rGGLaIah2IULKs0pOccm0jSVG
	hxltPIIUkaNDuA+tYJjlZ94tYrsm5lafayn16WeA862cKof0MFCljkddKIEYLo+jO+r1/F6NzuL
	WolRnAVm79e5y7A1XeoogS2tIKe4o/t8TargpiK4KwHein5VbSjdrLhq/TmDbx0z8dGYc=
X-Received: by 2002:a2e:a109:0:b0:389:f86a:f51 with SMTP id 38308e7fff4ca-389ff74bb22mr60743061fa.17.1772398418405;
        Sun, 01 Mar 2026 12:53:38 -0800 (PST)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2ffe119sm26797711fa.21.2026.03.01.12.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 12:53:38 -0800 (PST)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
X-Google-Original-From: Oskar Ray-Frayssinet <oskar.rf@live.se>
To: hansg@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Oskar Ray-Frayssinet <oskar.rf@live.se>
Subject: [PATCH] staging: atomisp: fix block comment style in atomisp_cmd.c
Date: Sun,  1 Mar 2026 21:53:36 +0100
Message-ID: <20260301205337.3157-1-oskar.rf@live.se>
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

Signed-off-by: Oskar Ray-Frayssinet <oskar.rf@live.se>
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

