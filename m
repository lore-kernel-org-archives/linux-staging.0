Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7015930B508
	for <linux-staging@lists.linux.dev>; Mon,  5 Jan 2026 14:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767625105; cv=none; b=ZyF++Y2dvYvDb0O4FaOX9yq1F2MLZo5pRSbdyDI3LGcMMTFVO9+XA8UTqCpsN/slTKJymTsPsbp3iDtktHYJL3qw0dVhSMuQDcWhb8evPtBaAv5Ih72t7Glfj/uFLVustcd6c4qr0EFVNorD3LzpAtDq83dcCyQUsnSHppLESLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767625105; c=relaxed/simple;
	bh=TKIKwvBOWkccmdrv2iMfjupuseLH7sbcozqajmk2NEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P4/nPxt0c0knaWVByWLRhsVIUjh4YjS/O90krUTc8PYe+UeKqo+eWZM+QKiIscBVDalCt3MmYJvFXt2z3K5klSmPWHk1J7AzV6xcsJ1RnxUsr2nava+wXTvgn22HhO4Q1dik9DyJpq2eHKeQP/wQRy496Wjkqa5w7V5flNrRTzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cw0k8sGe; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cw0k8sGe"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0bae9aca3so199587575ad.3
        for <linux-staging@lists.linux.dev>; Mon, 05 Jan 2026 06:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767625103; x=1768229903; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w43P1JW4wQheNkrfXzMs1sXhL7mJiuv4h8HUQUHGvjE=;
        b=Cw0k8sGeYIrVtBPriRmRa6ZEcFYzeSEbzcc1pYIgcuAGiDiWBHlch4qyXo4EVom93p
         GJyb5tpFa2aiRieLnaYiQJjEQ088BGGO+gVrIBvLlJ7s5lSaN8pv+CHwKHj1yknVfQEj
         aFxLZYJphWesGWVdsS9YRO5HwOWgzZuYDdr9JFuNRNBgh4xHmcpYHeyN/cpH6Ge7bvOW
         8lGbJnZBa/TZLLc148tccT1pOH+zzAyTniQ83t99N9o/PMODkaGMj2wVAhRImGjJJUiy
         23nlVvlHsXi/Va7Vp7FspFVvRaVKKbJzfp60+Dg2feJH3ChwVMBuby+ZXoQB+6meVH03
         dj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767625103; x=1768229903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w43P1JW4wQheNkrfXzMs1sXhL7mJiuv4h8HUQUHGvjE=;
        b=XyaL+Nj30wI6+NBDHDpi73v5Exq8l1wgd+VItyHf6f6DekHXWFojQazY0Ez1AoI9VW
         Gm/TMtSV+LNQakajfD1Ypc8wnMUYDSeAHu8p2mRzCNKmY5US9BYyDoJ18kY+uakMruft
         /jc4VyIQz+6NYK4MGcKfLL0OQqbCUDe3p+UtxUfXKNpyiDN/SSJWL3UIxry77+4Vsljh
         fs1ur82y7OFzJpPfL78/TAYiBRoadZEUjwiDozgSwekmkuQyv2QgmswCAGeFbAAkP/DS
         k9UjCmP8fBMTjOCEmKi4RUpqJUBPZ5mGYXohm/kGeMUeKa4D5aJjS9ZXlUkXw1N1YeIf
         L70A==
X-Forwarded-Encrypted: i=1; AJvYcCVGlEUuRuNMti4zLMYeP6wFINVpkFtg7F/oRrLjcFAhSygfQoNhxwgp6trUkOpxCJucDwedYnzL3m2CLxF1@lists.linux.dev
X-Gm-Message-State: AOJu0YzWw+9wumdbevzCacfnFk6AGn5KsbmorxbOtiJ7Tlp/OvJwtwQW
	8edGCWFV3nZZN9XDW0TmxMCo6MF1FhuUwGpGpTAtIeXxYFas9mSMOYGW
X-Gm-Gg: AY/fxX49lSNAVOlUA00FjxcMWEqbxbdRQReb035oByMSDDP80pmW/ve1XckpVuwprUY
	zAWldIscRX84bN3Om7fFLaFVulrppmU9zjxPQTFgUh8Dt6jgBc1cfZOZRETNWVIJsO+buPbQ2KS
	XBXh7hoSvSSHtWRS2411eiceoqjMlGOufgDEQ9dyt4A1WFi+3DqIvUfNktG6QDAKg5A+n7TBfB2
	cKDQBvREjA/3etDpwCQr7ubC2m0Lt8p902AU/V7UNwIVlb0eYsUWEauJfbOeOVgH5F9/6QD5xVg
	2r4rlIVZ8ZvMDJ5R9qW8jdeOh+BM+A/JBrCoyGkFuyI57HVxKl/EIwDy4MePNdiZk3Dl9R+BDeD
	mHI3V3oGUlvDD1lRWjX6RbS+sdJKB+IcgeMZr0Tds/x7fWIoisoPzvPXHAXz0XPWa5wg+zVup+V
	iS+jIY2HeN4/I=
X-Google-Smtp-Source: AGHT+IHy152Z6oGjqTyOM0Pyz6O4DiVhOTLYoZf+nEhTMBJXwimGMA8sfdnXh1bBOmerORC/+OHzzw==
X-Received: by 2002:a17:902:e74c:b0:298:1422:510d with SMTP id d9443c01a7336-2a3e2d2f925mr250065ad.48.1767625102536;
        Mon, 05 Jan 2026 06:58:22 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e2b81484sm715955ad.78.2026.01.05.06.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:58:22 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v2 1/3] media: atomisp: replace shadow zoom structs with v4l2_rect
Date: Mon,  5 Jan 2026 20:27:22 +0530
Message-ID: <20260105145724.37305-2-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260105145724.37305-1-karthikey3608@gmail.com>
References: <81e2d12c-342b-4b88-88a0-3e24115541aa@kernel.org>
 <20260105145724.37305-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove custom atomisp_zoom_point and atomisp_zoom_region structs and

usage in favor of standard v4l2_rect within atomisp_dz_config.

This aligns the driver with V4L2 standards and removes unnecessary

custom types.

Also standardizes the internal ia_css_region struct members to match

V4L2 naming conventions (left, top, width, height) to facilitate the

bridge mapping.

Updates atomisp_cmd.c and sh_css_params.c to use the new member names

and ensures safe math using long long casts to prevent overflow during

resolution scaling.

Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
---
 .../media/atomisp/include/linux/atomisp.h     |  19 +--
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 130 +++++++++---------
 .../staging/media/atomisp/pci/ia_css_types.h  |   6 +-
 .../staging/media/atomisp/pci/sh_css_params.c |  16 +--
 4 files changed, 79 insertions(+), 92 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index fcf116cc4..b5cce12c1 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -326,27 +326,12 @@ struct atomisp_resolution {
 	u32 height; /** Height */
 };
 
-/*
- * This specifies the coordinates (x,y)
- */
-struct atomisp_zoom_point {
-	s32 x; /** x coordinate */
-	s32 y; /** y coordinate */
-};
-
-/*
- * This specifies the region
- */
-struct atomisp_zoom_region {
-	struct atomisp_zoom_point
-		origin; /* Starting point coordinates for the region */
-	struct atomisp_resolution resolution; /* Region resolution */
-};
+#include <linux/videodev2.h>
 
 struct atomisp_dz_config {
 	u32 dx; /** Horizontal zoom factor */
 	u32 dy; /** Vertical zoom factor */
-	struct atomisp_zoom_region zoom_region; /** region for zoom */
+	struct v4l2_rect zoom_region; /** region for zoom */
 };
 
 struct atomisp_parm {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 327836372..4ed6b8aea 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1764,15 +1764,13 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
 		return -EINVAL;
 	}
 
-	if (dz_config->zoom_region.resolution.width
-	    == asd->sensor_array_res.width
-	    || dz_config->zoom_region.resolution.height
-	    == asd->sensor_array_res.height) {
+	if (dz_config->zoom_region.width == asd->sensor_array_res.width ||
+	    dz_config->zoom_region.height == asd->sensor_array_res.height) {
 		/*no need crop region*/
-		dz_config->zoom_region.origin.x = 0;
-		dz_config->zoom_region.origin.y = 0;
-		dz_config->zoom_region.resolution.width = eff_res.width;
-		dz_config->zoom_region.resolution.height = eff_res.height;
+		dz_config->zoom_region.left = 0;
+		dz_config->zoom_region.top = 0;
+		dz_config->zoom_region.width = eff_res.width;
+		dz_config->zoom_region.height = eff_res.height;
 		return 0;
 	}
 
@@ -1783,18 +1781,18 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
 	 */
 
 	if (!IS_ISP2401) {
-		dz_config->zoom_region.origin.x = dz_config->zoom_region.origin.x
-						  * eff_res.width
-						  / asd->sensor_array_res.width;
-		dz_config->zoom_region.origin.y = dz_config->zoom_region.origin.y
-						  * eff_res.height
-						  / asd->sensor_array_res.height;
-		dz_config->zoom_region.resolution.width = dz_config->zoom_region.resolution.width
-							  * eff_res.width
-							  / asd->sensor_array_res.width;
-		dz_config->zoom_region.resolution.height = dz_config->zoom_region.resolution.height
-							  * eff_res.height
-							  / asd->sensor_array_res.height;
+		dz_config->zoom_region.left =
+			(s32)((long long)dz_config->zoom_region.left *
+			      eff_res.width / asd->sensor_array_res.width);
+		dz_config->zoom_region.top =
+			(s32)((long long)dz_config->zoom_region.top *
+			      eff_res.height / asd->sensor_array_res.height);
+		dz_config->zoom_region.width =
+			(u32)((long long)dz_config->zoom_region.width *
+			      eff_res.width / asd->sensor_array_res.width);
+		dz_config->zoom_region.height =
+			(u32)((long long)dz_config->zoom_region.height *
+			      eff_res.height / asd->sensor_array_res.height);
 		/*
 		 * Set same ratio of crop region resolution and current pipe output
 		 * resolution
@@ -1821,62 +1819,66 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
 				   - asd->sensor_array_res.width
 				   * out_res.height / out_res.width;
 			h_offset = h_offset / 2;
-			if (dz_config->zoom_region.origin.y < h_offset)
-				dz_config->zoom_region.origin.y = 0;
+			if (dz_config->zoom_region.top < h_offset)
+				dz_config->zoom_region.top = 0;
 			else
-				dz_config->zoom_region.origin.y = dz_config->zoom_region.origin.y - h_offset;
+				dz_config->zoom_region.top -= h_offset;
 			w_offset = 0;
 		} else {
 			w_offset = asd->sensor_array_res.width
 				   - asd->sensor_array_res.height
 				   * out_res.width / out_res.height;
 			w_offset = w_offset / 2;
-			if (dz_config->zoom_region.origin.x < w_offset)
-				dz_config->zoom_region.origin.x = 0;
+			if (dz_config->zoom_region.left < w_offset)
+				dz_config->zoom_region.left = 0;
 			else
-				dz_config->zoom_region.origin.x = dz_config->zoom_region.origin.x - w_offset;
+				dz_config->zoom_region.left -= w_offset;
 			h_offset = 0;
 		}
-		dz_config->zoom_region.origin.x = dz_config->zoom_region.origin.x
-						  * eff_res.width
-						  / (asd->sensor_array_res.width - 2 * w_offset);
-		dz_config->zoom_region.origin.y = dz_config->zoom_region.origin.y
-						  * eff_res.height
-						  / (asd->sensor_array_res.height - 2 * h_offset);
-		dz_config->zoom_region.resolution.width = dz_config->zoom_region.resolution.width
-						  * eff_res.width
-						  / (asd->sensor_array_res.width - 2 * w_offset);
-		dz_config->zoom_region.resolution.height = dz_config->zoom_region.resolution.height
-						  * eff_res.height
-						  / (asd->sensor_array_res.height - 2 * h_offset);
-	}
-
-	if (out_res.width * dz_config->zoom_region.resolution.height
-	    > dz_config->zoom_region.resolution.width * out_res.height) {
-		dz_config->zoom_region.resolution.height =
-		    dz_config->zoom_region.resolution.width
-		    * out_res.height / out_res.width;
+		dz_config->zoom_region.left =
+			(s32)((long long)dz_config->zoom_region.left *
+			      eff_res.width /
+			      (asd->sensor_array_res.width - 2 * w_offset));
+		dz_config->zoom_region.top =
+			(s32)((long long)dz_config->zoom_region.top *
+			      eff_res.height /
+			      (asd->sensor_array_res.height - 2 * h_offset));
+		dz_config->zoom_region.width =
+			(u32)((long long)dz_config->zoom_region.width *
+			      eff_res.width /
+			      (asd->sensor_array_res.width - 2 * w_offset));
+		dz_config->zoom_region.height =
+			(u32)((long long)dz_config->zoom_region.height *
+			      eff_res.height /
+			      (asd->sensor_array_res.height - 2 * h_offset));
+	}
+
+	if ((long long)out_res.width * dz_config->zoom_region.height >
+	    (long long)dz_config->zoom_region.width * out_res.height) {
+		dz_config->zoom_region.height =
+			(u32)((long long)dz_config->zoom_region.width *
+			      out_res.height / out_res.width);
 	} else {
-		dz_config->zoom_region.resolution.width =
-		    dz_config->zoom_region.resolution.height
-		    * out_res.width / out_res.height;
+		dz_config->zoom_region.width =
+			(u32)((long long)dz_config->zoom_region.height *
+			      out_res.width / out_res.height);
 	}
 	dev_dbg(asd->isp->dev,
 		"%s crop region:(%d,%d),(%d,%d) eff_res(%d, %d) array_size(%d,%d) out_res(%d, %d)\n",
-		__func__, dz_config->zoom_region.origin.x,
-		dz_config->zoom_region.origin.y,
-		dz_config->zoom_region.resolution.width,
-		dz_config->zoom_region.resolution.height,
+		__func__, dz_config->zoom_region.left,
+		dz_config->zoom_region.top,
+		dz_config->zoom_region.width,
+		dz_config->zoom_region.height,
 		eff_res.width, eff_res.height,
 		asd->sensor_array_res.width,
 		asd->sensor_array_res.height,
 		out_res.width, out_res.height);
 
-	if ((dz_config->zoom_region.origin.x +
-	     dz_config->zoom_region.resolution.width
+	if ((dz_config->zoom_region.left +
+	     dz_config->zoom_region.width
 	     > eff_res.width) ||
-	    (dz_config->zoom_region.origin.y +
-	     dz_config->zoom_region.resolution.height
+	    (dz_config->zoom_region.top +
+	     dz_config->zoom_region.height
 	     > eff_res.height))
 		return -EINVAL;
 
@@ -1901,10 +1903,10 @@ static bool atomisp_check_zoom_region(
 
 	config.width = asd->sensor_array_res.width;
 	config.height = asd->sensor_array_res.height;
-	w = dz_config->zoom_region.origin.x +
-	    dz_config->zoom_region.resolution.width;
-	h = dz_config->zoom_region.origin.y +
-	    dz_config->zoom_region.resolution.height;
+	w = dz_config->zoom_region.left +
+	    dz_config->zoom_region.width;
+	h = dz_config->zoom_region.top +
+	    dz_config->zoom_region.height;
 
 	if ((w <= config.width) && (h <= config.height) && w > 0 && h > 0)
 		flag = true;
@@ -1912,10 +1914,10 @@ static bool atomisp_check_zoom_region(
 		/* setting error zoom region */
 		dev_err(asd->isp->dev,
 			"%s zoom region ERROR:dz_config:(%d,%d),(%d,%d)array_res(%d, %d)\n",
-			__func__, dz_config->zoom_region.origin.x,
-			dz_config->zoom_region.origin.y,
-			dz_config->zoom_region.resolution.width,
-			dz_config->zoom_region.resolution.height,
+			__func__, dz_config->zoom_region.left,
+			dz_config->zoom_region.top,
+			dz_config->zoom_region.width,
+			dz_config->zoom_region.height,
 			config.width, config.height);
 
 	return flag;
diff --git a/drivers/staging/media/atomisp/pci/ia_css_types.h b/drivers/staging/media/atomisp/pci/ia_css_types.h
index 676d7e20b..5c21a5415 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_types.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_types.h
@@ -431,8 +431,10 @@ struct ia_css_point {
  * This specifies the region
  */
 struct ia_css_region {
-	struct ia_css_point origin; /** Starting point coordinates for the region */
-	struct ia_css_resolution resolution; /** Region resolution */
+	s32 left; /** Starting point coordinates for the region */
+	s32 top;
+	s32 width; /** Region resolution */
+	s32 height;
 };
 
 /**
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 11d62313c..0435f20a7 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -658,9 +658,7 @@ static const struct ia_css_dz_config default_dz_config = {
 	HRT_GDC_N,
 	HRT_GDC_N,
 	{
-		\
-		{0, 0}, \
-		{0, 0}, \
+		0, 0, 0, 0
 	}
 };
 
@@ -1210,8 +1208,8 @@ ia_css_process_zoom_and_motion(
 		}
 
 		assert(stage->stage_num < SH_CSS_MAX_STAGES);
-		if (params->dz_config.zoom_region.resolution.width == 0 &&
-		    params->dz_config.zoom_region.resolution.height == 0) {
+		if (params->dz_config.zoom_region.width == 0 &&
+		    params->dz_config.zoom_region.height == 0) {
 			sh_css_update_uds_and_crop_info(
 			    &info->sp,
 			    &binary->in_frame_info,
@@ -4096,10 +4094,10 @@ sh_css_update_uds_and_crop_info_based_on_zoom_region(
 	assert(motion_vector);
 	assert(uds);
 	assert(sp_out_crop_pos);
-	x0 = zoom->zoom_region.origin.x;
-	y0 = zoom->zoom_region.origin.y;
-	x1 = zoom->zoom_region.resolution.width + x0;
-	y1 = zoom->zoom_region.resolution.height + y0;
+	x0 = zoom->zoom_region.left;
+	y0 = zoom->zoom_region.top;
+	x1 = zoom->zoom_region.width + x0;
+	y1 = zoom->zoom_region.height + y0;
 
 	if ((x0 > x1) || (y0 > y1) || (x1 > pipe_in_res.width) || (y1 > pipe_in_res.height))
 		return -EINVAL;
-- 
2.43.0

