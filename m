Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26F74502A
	for <linux-staging@lists.linux.dev>; Wed, 14 Jan 2026 18:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768415803; cv=none; b=fm9lTzXyoViSUW76sT+iPia+OQrnGqvGJuIyVUgHkDFA1NxXoeGLDeurBZPxTA9RLZwLmBNS2dQP6WFk3mt22QZeQdQI5YT9lzWoe4EFjP+KpoYANpR8gqdu9l0RuznITK/Gdk4n0drgDvAFf1pL7fE/4V1FZ7h1Kz6zv2APvIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768415803; c=relaxed/simple;
	bh=WZQ2O/QTAjPsVo4O3wiUQGnuKqHVSv206gNf8zIJeQs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VsQUUsxxA59Eji2HkJ4fDhjIsYkKiLtp9usf8W2ua7MlQGs+ELautnGVj6aQ5ZxfMk52gIBETD6z5wPtGbqi0+u5rkD+wtaozPZWkRaINBGidrtlwkiYedR9nmtQzceTAaIs5tzjJA8Ytk5aAVRFduBCoiuTsDoEswJPZQ4ovhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4y2nTQF; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4y2nTQF"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7b75e366866so25465b3a.2
        for <linux-staging@lists.linux.dev>; Wed, 14 Jan 2026 10:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768415799; x=1769020599; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H9duD0SGxrnBXhV/AaP7ECjcB12wjXpaHy4+YnrhFVc=;
        b=W4y2nTQFy5SR23/mpgPYz8StoO6zH/8b+oqT9NCiDuOPFZ31cY9EW1ObKyw4RebuFZ
         DpfyPY5fU6b4san5sRqI40MeN9coBEeubpi03ojMXZxdfMXAChBnE2xgje5Mnx+Fb8HU
         GJqD6kbCkxBZZwJNOG+qpzxSyDPvUg5yLQXhIiUSVZJw2whu0xretS8qdA4mhiR5PieM
         YO4Piu9bPCuq1k2kY+s/2el0PukvIBEeVcMo5tGrzIuVSrlOLwKBXGvqTQJbheLTcHsE
         wp5rI0gty39mq5UrauI/JPSwTW0aHTXD+5SoX14WTSC2h1HBAlpGN2hMe9UgBo88VQPL
         BY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768415799; x=1769020599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9duD0SGxrnBXhV/AaP7ECjcB12wjXpaHy4+YnrhFVc=;
        b=rJyH0MW8t/zS65MBcvFwY2IZzrw20I31Wts8SIT1Q/wprHdPjLRLxIvXjsncRO3JG3
         osAvk5qzPFJ1D+6eVOb9UB/4JR9P1lo8Ul80mkr+txvWY841NEK/HW/a4Ki8IuRz4Faq
         7+X+5Gp9ZaplchFw+6m6E7PRJ85cqbSoGIw5h8Xb6A8Rg1FQp1ZXHx/YtFAxd2gQ3tE2
         F7uvGTIy7RIOLATvwZII7W0IhYMA6t3ubzH5KeQUlj2E4HP/7u7w8r5q4AthkB0+A4/j
         /4vaXVzv7L6rMFjZs1GdccjT6fCPkgavPBfGKdHQczGuS2m8l7o+Ub7JSaGc6tvefpMl
         2LVA==
X-Forwarded-Encrypted: i=1; AJvYcCWyL7LfW6ZbaxnbGYvIcDpAEsBa1a1qsAk0RQqd/T+xHuQt7kZUg46C9/H7W3NF99JEQZ+gYohR7UM/03Mk@lists.linux.dev
X-Gm-Message-State: AOJu0YyHVOSgx/AVnf+Zpomd1V+bx5Cw0PX8xLF5YRVw6k81v30PD25O
	OzLBP8xwfOiTbtBIKm5YNmtSev/cgj7ccm/Dg3uB5EnAzbQMvRLtLiqd
X-Gm-Gg: AY/fxX4OL0Bh1oAkSQKseCzh3fZP1W6AFJJkvbTJamDS4S7Lj2OF3cxmgtUxUY60V0T
	ARawClnVuwC2jEI0l8qP/x7z+RmscD+LQElpft9/zsuoXhY/w+8sZGxidVezMCM5993lKH6SSvq
	FLHrRUpMX1ULf3Cbqbm8IJOYKiuFe2/XYD8I0Lh/PCKIeK37bLnU1YiuztDr2msZuDz/IwWCjuL
	UGbK4cYqIMoAZU9XO+HgL6BZVVGNVJw082lcgunfBHtGk58YnJvN9315beApvres3FMTtQduh0e
	0IBrQEDls7YGTSHPvfGe1u/IXfoAIK0T5W/cPWrIdy8vzYJ0DYSiR5pJVIS3GuiQwx7XCyq3C6z
	V5LpjgJJ7hNUwMvMaZrJouqedM52jxmsBZLN/I/aBFGobMZ8vajSsn4uTm4PXPpKqOzWdi7Ctee
	4T8V2YN5UKClXli2kXpaaLV1w=
X-Received: by 2002:a05:6a00:3685:b0:81b:d5d9:a83a with SMTP id d2e1a72fcca58-81f8200ae79mr3679086b3a.61.1768415798882;
        Wed, 14 Jan 2026 10:36:38 -0800 (PST)
Received: from karthik.bbrouter ([103.215.237.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e64bd99sm246872b3a.31.2026.01.14.10.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 10:36:38 -0800 (PST)
From: Karthikey Kadati <karthikey3608@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v3] media: atomisp: replace ia_css_region with v4l2_rect
Date: Thu, 15 Jan 2026 00:06:28 +0530
Message-ID: <20260114183628.45822-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Karthikey D Kadati <karthikey3608@gmail.com>

The struct ia_css_region definition is redundant as struct v4l2_rect
provides the same functionality (left, top, width, height) and is the
standard V4L2 type.

Replace usage of ia_css_region with v4l2_rect in ia_css_dz_config
and remove the definition of ia_css_region from ia_css_types.h.

Also remove historical comments referencing the addition of zoom_region
and include <linux/videodev2.h> to support the v4l2_rect type.

Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
---
Changes in v3:
- Rebased on linux-media/next to resolve conflict with nested structs.
- Replaced usage of zoom_region.origin/resolution with direct members.
Changes in v2:
- Replaced ia_css_region with v4l2_rect in ia_css_types.h.
- Removed definition of ia_css_region.
- Removed historical comments about zoom_region.
- Verified atomisp_cmd.c logic is safe with the type change.
- Updated commit message for clarity and conciseness.

 .../staging/media/atomisp/pci/atomisp_cmd.c   | 166 +++++++++---------
 .../staging/media/atomisp/pci/ia_css_types.h  |  13 +-
 .../staging/media/atomisp/pci/sh_css_params.c |  12 +-
 3 files changed, 91 insertions(+), 100 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 3a4eb4f6d3be..a9c593a3ed8c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -262,7 +262,6 @@ int atomisp_reset(struct atomisp_device *isp)
 	/* Reset ISP by power-cycling it */
 	int ret = 0;
 
-	dev_dbg(isp->dev, "%s\n", __func__);
 
 	ret = atomisp_power_off(isp->dev);
 	if (ret < 0)
@@ -356,7 +355,7 @@ void atomisp_eof_event(struct atomisp_sub_device *asd, uint8_t exp_id)
 }
 
 static void atomisp_3a_stats_ready_event(struct atomisp_sub_device *asd,
-	uint8_t exp_id)
+					 uint8_t exp_id)
 {
 	struct v4l2_event event = {0};
 
@@ -367,7 +366,7 @@ static void atomisp_3a_stats_ready_event(struct atomisp_sub_device *asd,
 }
 
 static void atomisp_metadata_ready_event(struct atomisp_sub_device *asd,
-	enum atomisp_metadata_type md_type)
+					 enum atomisp_metadata_type md_type)
 {
 	struct v4l2_event event = {0};
 
@@ -1589,7 +1588,6 @@ int atomisp_get_dis_stat(struct atomisp_sub_device *asd,
 int atomisp_set_array_res(struct atomisp_sub_device *asd,
 			  struct atomisp_resolution  *config)
 {
-	dev_dbg(asd->isp->dev, ">%s start\n", __func__);
 	if (!config) {
 		dev_err(asd->isp->dev, "Set sensor array size is not valid\n");
 		return -EINVAL;
@@ -1745,8 +1743,8 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
 	if (dz_config->dx || dz_config->dy)
 		return 0;
 
-	if (css_pipe_id != IA_CSS_PIPE_ID_PREVIEW
-	    && css_pipe_id != IA_CSS_PIPE_ID_CAPTURE) {
+	if (css_pipe_id != IA_CSS_PIPE_ID_PREVIEW &&
+	    css_pipe_id != IA_CSS_PIPE_ID_CAPTURE) {
 		dev_err(asd->isp->dev, "%s the set pipe no support crop region"
 			, __func__);
 		return -EINVAL;
@@ -1762,15 +1760,15 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
 		return -EINVAL;
 	}
 
-	if (dz_config->zoom_region.resolution.width
-	    == asd->sensor_array_res.width
-	    || dz_config->zoom_region.resolution.height
+	if (dz_config->zoom_region.width
+	    == asd->sensor_array_res.width ||
+	    dz_config->zoom_region.height
 	    == asd->sensor_array_res.height) {
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
 
@@ -1781,16 +1779,16 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
 	 */
 
 	if (!IS_ISP2401) {
-		dz_config->zoom_region.origin.x = dz_config->zoom_region.origin.x
+		dz_config->zoom_region.left = dz_config->zoom_region.left
 						  * eff_res.width
 						  / asd->sensor_array_res.width;
-		dz_config->zoom_region.origin.y = dz_config->zoom_region.origin.y
+		dz_config->zoom_region.top = dz_config->zoom_region.top
 						  * eff_res.height
 						  / asd->sensor_array_res.height;
-		dz_config->zoom_region.resolution.width = dz_config->zoom_region.resolution.width
+		dz_config->zoom_region.width = dz_config->zoom_region.width
 							  * eff_res.width
 							  / asd->sensor_array_res.width;
-		dz_config->zoom_region.resolution.height = dz_config->zoom_region.resolution.height
+		dz_config->zoom_region.height = dz_config->zoom_region.height
 							  * eff_res.height
 							  / asd->sensor_array_res.height;
 		/*
@@ -1819,62 +1817,62 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
 				   - asd->sensor_array_res.width
 				   * out_res.height / out_res.width;
 			h_offset = h_offset / 2;
-			if (dz_config->zoom_region.origin.y < h_offset)
-				dz_config->zoom_region.origin.y = 0;
+			if (dz_config->zoom_region.top < h_offset)
+				dz_config->zoom_region.top = 0;
 			else
-				dz_config->zoom_region.origin.y = dz_config->zoom_region.origin.y - h_offset;
+				dz_config->zoom_region.top = dz_config->zoom_region.top - h_offset;
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
+				dz_config->zoom_region.left = dz_config->zoom_region.left - w_offset;
 			h_offset = 0;
 		}
-		dz_config->zoom_region.origin.x = dz_config->zoom_region.origin.x
+		dz_config->zoom_region.left = dz_config->zoom_region.left
 						  * eff_res.width
 						  / (asd->sensor_array_res.width - 2 * w_offset);
-		dz_config->zoom_region.origin.y = dz_config->zoom_region.origin.y
+		dz_config->zoom_region.top = dz_config->zoom_region.top
 						  * eff_res.height
 						  / (asd->sensor_array_res.height - 2 * h_offset);
-		dz_config->zoom_region.resolution.width = dz_config->zoom_region.resolution.width
+		dz_config->zoom_region.width = dz_config->zoom_region.width
 						  * eff_res.width
 						  / (asd->sensor_array_res.width - 2 * w_offset);
-		dz_config->zoom_region.resolution.height = dz_config->zoom_region.resolution.height
+		dz_config->zoom_region.height = dz_config->zoom_region.height
 						  * eff_res.height
 						  / (asd->sensor_array_res.height - 2 * h_offset);
 	}
 
-	if (out_res.width * dz_config->zoom_region.resolution.height
-	    > dz_config->zoom_region.resolution.width * out_res.height) {
-		dz_config->zoom_region.resolution.height =
-		    dz_config->zoom_region.resolution.width
+	if (out_res.width * dz_config->zoom_region.height
+	    > dz_config->zoom_region.width * out_res.height) {
+		dz_config->zoom_region.height =
+		    dz_config->zoom_region.width
 		    * out_res.height / out_res.width;
 	} else {
-		dz_config->zoom_region.resolution.width =
-		    dz_config->zoom_region.resolution.height
+		dz_config->zoom_region.width =
+		    dz_config->zoom_region.height
 		    * out_res.width / out_res.height;
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
 
@@ -1899,10 +1897,10 @@ static bool atomisp_check_zoom_region(
 
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
@@ -1910,10 +1908,10 @@ static bool atomisp_check_zoom_region(
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
@@ -2352,7 +2350,7 @@ int atomisp_cp_lsc_table(struct atomisp_sub_device *asd,
 
 	if (IS_ISP2401) {
 		if (copy_from_compatible(&dest_st, source_st,
-					sizeof(struct atomisp_shading_table),
+					 sizeof(struct atomisp_shading_table),
 					from_user)) {
 			dev_err(asd->isp->dev, "copy shading table failed!");
 			return -EFAULT;
@@ -2488,28 +2486,28 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		dvs_hor_coef_bytes = asd->params.dvs_hor_coef_bytes;
 		dvs_ver_coef_bytes = asd->params.dvs_ver_coef_bytes;
 		if (copy_from_compatible(css_param->dvs2_coeff->hor_coefs.odd_real,
-					coefs->hor_coefs.odd_real, dvs_hor_coef_bytes, from_user) ||
+					 coefs->hor_coefs.odd_real, dvs_hor_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->hor_coefs.odd_imag,
-					coefs->hor_coefs.odd_imag, dvs_hor_coef_bytes, from_user) ||
+					 coefs->hor_coefs.odd_imag, dvs_hor_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->hor_coefs.even_real,
-					coefs->hor_coefs.even_real, dvs_hor_coef_bytes, from_user) ||
+					 coefs->hor_coefs.even_real, dvs_hor_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->hor_coefs.even_imag,
-					coefs->hor_coefs.even_imag, dvs_hor_coef_bytes, from_user) ||
+					 coefs->hor_coefs.even_imag, dvs_hor_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->ver_coefs.odd_real,
-					coefs->ver_coefs.odd_real, dvs_ver_coef_bytes, from_user) ||
+					 coefs->ver_coefs.odd_real, dvs_ver_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->ver_coefs.odd_imag,
-					coefs->ver_coefs.odd_imag, dvs_ver_coef_bytes, from_user) ||
+					 coefs->ver_coefs.odd_imag, dvs_ver_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->ver_coefs.even_real,
-					coefs->ver_coefs.even_real, dvs_ver_coef_bytes, from_user) ||
+					 coefs->ver_coefs.even_real, dvs_ver_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->ver_coefs.even_imag,
-					coefs->ver_coefs.even_imag, dvs_ver_coef_bytes, from_user)) {
+					 coefs->ver_coefs.even_imag, dvs_ver_coef_bytes, from_user)) {
 			ia_css_dvs2_coefficients_free(css_param->dvs2_coeff);
 			css_param->dvs2_coeff = NULL;
 			return -EFAULT;
 		}
 	} else {
 		if (copy_from_compatible(&dvs2_coefs, coefs,
-					sizeof(struct ia_css_dvs2_coefficients),
+					 sizeof(struct ia_css_dvs2_coefficients),
 					from_user)) {
 			dev_err(asd->isp->dev, "copy dvs2 coef failed");
 			return -EFAULT;
@@ -2544,21 +2542,21 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		dvs_hor_coef_bytes = asd->params.dvs_hor_coef_bytes;
 		dvs_ver_coef_bytes = asd->params.dvs_ver_coef_bytes;
 		if (copy_from_compatible(css_param->dvs2_coeff->hor_coefs.odd_real,
-					dvs2_coefs.hor_coefs.odd_real, dvs_hor_coef_bytes, from_user) ||
+					 dvs2_coefs.hor_coefs.odd_real, dvs_hor_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->hor_coefs.odd_imag,
-					dvs2_coefs.hor_coefs.odd_imag, dvs_hor_coef_bytes, from_user) ||
+					 dvs2_coefs.hor_coefs.odd_imag, dvs_hor_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->hor_coefs.even_real,
-					dvs2_coefs.hor_coefs.even_real, dvs_hor_coef_bytes, from_user) ||
+					 dvs2_coefs.hor_coefs.even_real, dvs_hor_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->hor_coefs.even_imag,
-					dvs2_coefs.hor_coefs.even_imag, dvs_hor_coef_bytes, from_user) ||
+					 dvs2_coefs.hor_coefs.even_imag, dvs_hor_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->ver_coefs.odd_real,
-					dvs2_coefs.ver_coefs.odd_real, dvs_ver_coef_bytes, from_user) ||
+					 dvs2_coefs.ver_coefs.odd_real, dvs_ver_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->ver_coefs.odd_imag,
-					dvs2_coefs.ver_coefs.odd_imag, dvs_ver_coef_bytes, from_user) ||
+					 dvs2_coefs.ver_coefs.odd_imag, dvs_ver_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->ver_coefs.even_real,
-					dvs2_coefs.ver_coefs.even_real, dvs_ver_coef_bytes, from_user) ||
+					 dvs2_coefs.ver_coefs.even_real, dvs_ver_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->ver_coefs.even_imag,
-					dvs2_coefs.ver_coefs.even_imag, dvs_ver_coef_bytes, from_user)) {
+					 dvs2_coefs.ver_coefs.even_imag, dvs_ver_coef_bytes, from_user)) {
 			ia_css_dvs2_coefficients_free(css_param->dvs2_coeff);
 			css_param->dvs2_coeff = NULL;
 			return -EFAULT;
@@ -2605,7 +2603,7 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 		struct ia_css_dvs_6axis_config t_6axis_config;
 
 		if (copy_from_compatible(&t_6axis_config, source_6axis_config,
-					sizeof(struct atomisp_dvs_6axis_config),
+					 sizeof(struct atomisp_dvs_6axis_config),
 					from_user)) {
 			dev_err(asd->isp->dev, "copy morph table failed!");
 			return -EFAULT;
@@ -2631,28 +2629,28 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 		dvs_6axis_config->exp_id = t_6axis_config.exp_id;
 
 		if (copy_from_compatible(dvs_6axis_config->xcoords_y,
-					t_6axis_config.xcoords_y,
+					 t_6axis_config.xcoords_y,
 					t_6axis_config.width_y *
 					t_6axis_config.height_y *
 					sizeof(*dvs_6axis_config->xcoords_y),
 					from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->ycoords_y,
-					t_6axis_config.ycoords_y,
+					 t_6axis_config.ycoords_y,
 					t_6axis_config.width_y *
 					t_6axis_config.height_y *
 					sizeof(*dvs_6axis_config->ycoords_y),
 					from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->xcoords_uv,
-					t_6axis_config.xcoords_uv,
+					 t_6axis_config.xcoords_uv,
 					t_6axis_config.width_uv *
 					t_6axis_config.height_uv *
 					sizeof(*dvs_6axis_config->xcoords_uv),
 					from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->ycoords_uv,
-					t_6axis_config.ycoords_uv,
+					 t_6axis_config.ycoords_uv,
 					t_6axis_config.width_uv *
 					t_6axis_config.height_uv *
 					sizeof(*dvs_6axis_config->ycoords_uv),
@@ -2683,28 +2681,28 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 		dvs_6axis_config->exp_id = source_6axis_config->exp_id;
 
 		if (copy_from_compatible(dvs_6axis_config->xcoords_y,
-					source_6axis_config->xcoords_y,
+					 source_6axis_config->xcoords_y,
 					source_6axis_config->width_y *
 					source_6axis_config->height_y *
 					sizeof(*source_6axis_config->xcoords_y),
 					from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->ycoords_y,
-					source_6axis_config->ycoords_y,
+					 source_6axis_config->ycoords_y,
 					source_6axis_config->width_y *
 					source_6axis_config->height_y *
 					sizeof(*source_6axis_config->ycoords_y),
 					from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->xcoords_uv,
-					source_6axis_config->xcoords_uv,
+					 source_6axis_config->xcoords_uv,
 					source_6axis_config->width_uv *
 					source_6axis_config->height_uv *
 					sizeof(*source_6axis_config->xcoords_uv),
 					from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->ycoords_uv,
-					source_6axis_config->ycoords_uv,
+					 source_6axis_config->ycoords_uv,
 					source_6axis_config->width_uv *
 					source_6axis_config->height_uv *
 					sizeof(*source_6axis_config->ycoords_uv),
@@ -2744,7 +2742,7 @@ int atomisp_cp_morph_table(struct atomisp_sub_device *asd,
 		struct ia_css_morph_table mtbl;
 
 		if (copy_from_compatible(&mtbl, source_morph_table,
-				sizeof(struct atomisp_morph_table),
+					 sizeof(struct atomisp_morph_table),
 				from_user)) {
 			dev_err(asd->isp->dev, "copy morph table failed!");
 			return -EFAULT;
@@ -2758,14 +2756,14 @@ int atomisp_cp_morph_table(struct atomisp_sub_device *asd,
 
 		for (i = 0; i < IA_CSS_MORPH_TABLE_NUM_PLANES; i++) {
 			if (copy_from_compatible(morph_table->coordinates_x[i],
-						(__force void *)source_morph_table->coordinates_x[i],
+						 (__force void *)source_morph_table->coordinates_x[i],
 						mtbl.height * mtbl.width *
 						sizeof(*morph_table->coordinates_x[i]),
 						from_user))
 				goto error;
 
 			if (copy_from_compatible(morph_table->coordinates_y[i],
-						(__force void *)source_morph_table->coordinates_y[i],
+						 (__force void *)source_morph_table->coordinates_y[i],
 						mtbl.height * mtbl.width *
 						sizeof(*morph_table->coordinates_y[i]),
 						from_user))
@@ -2782,14 +2780,14 @@ int atomisp_cp_morph_table(struct atomisp_sub_device *asd,
 
 		for (i = 0; i < IA_CSS_MORPH_TABLE_NUM_PLANES; i++) {
 			if (copy_from_compatible(morph_table->coordinates_x[i],
-						(__force void *)source_morph_table->coordinates_x[i],
+						 (__force void *)source_morph_table->coordinates_x[i],
 						source_morph_table->height * source_morph_table->width *
 						sizeof(*source_morph_table->coordinates_x[i]),
 						from_user))
 				goto error;
 
 			if (copy_from_compatible(morph_table->coordinates_y[i],
-						(__force void *)source_morph_table->coordinates_y[i],
+						 (__force void *)source_morph_table->coordinates_y[i],
 						source_morph_table->height * source_morph_table->width *
 						sizeof(*source_morph_table->coordinates_y[i]),
 						from_user))
@@ -3321,7 +3319,7 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
 	   bytes. The RAW frame we use here should always be a 16bit RAW
 	   frame. This is why we bytesperline/2 is equal to the padded with */
 	if (ia_css_frame_allocate(&res, arg->fmt.width, arg->fmt.height,
-				       sh_format, padded_width, 0)) {
+				  sh_format, padded_width, 0)) {
 		ret = -ENOMEM;
 		goto err;
 	}
@@ -3580,7 +3578,7 @@ void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
 	height = min(height, input->active_rect.height);
 
 	if (input->binning_support && width <= (input->active_rect.width / 2) &&
-				      height <= (input->active_rect.height / 2)) {
+	    height <= (input->active_rect.height / 2)) {
 		native_rect.width /= 2;
 		native_rect.height /= 2;
 	}
@@ -3730,7 +3728,7 @@ static int atomisp_set_sensor_crop_and_fmt(struct atomisp_device *isp,
 
 	/* Cropping is done before binning, when binning double the crop rect */
 	if (input->binning_support && sel.r.width <= (input->native_rect.width / 2) &&
-				      sel.r.height <= (input->native_rect.height / 2)) {
+	    sel.r.height <= (input->native_rect.height / 2)) {
 		sel.r.width *= 2;
 		sel.r.height *= 2;
 	}
diff --git a/drivers/staging/media/atomisp/pci/ia_css_types.h b/drivers/staging/media/atomisp/pci/ia_css_types.h
index 676d7e20b282..f7b77901ea2f 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_types.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_types.h
@@ -15,6 +15,7 @@
  * directly but still need to forward parameters for it.
  */
 
+#include <linux/videodev2.h>
 #include <type_support.h>
 
 #include "ia_css_frac.h"
@@ -427,14 +428,6 @@ struct ia_css_point {
 	s32 y; /** y coordinate */
 };
 
-/**
- * This specifies the region
- */
-struct ia_css_region {
-	struct ia_css_point origin; /** Starting point coordinates for the region */
-	struct ia_css_resolution resolution; /** Region resolution */
-};
-
 /**
  * Digital zoom:
  * This feature is currently available only for video, but will become
@@ -442,7 +435,7 @@ struct ia_css_region {
  * Set the digital zoom factor, this is a logarithmic scale. The actual zoom
  * factor will be 64/x.
  * Setting dx or dy to 0 disables digital zoom for that direction.
- * New API change for Digital zoom:(added struct ia_css_region zoom_region)
+ *
  * zoom_region specifies the origin of the zoom region and width and
  * height of that region.
  * origin : This is the coordinate (x,y) within the effective input resolution
@@ -455,7 +448,7 @@ struct ia_css_region {
 struct ia_css_dz_config {
 	u32 dx; /** Horizontal zoom factor */
 	u32 dy; /** Vertical zoom factor */
-	struct ia_css_region zoom_region; /** region for zoom */
+	struct v4l2_rect zoom_region; /** region for zoom */
 };
 
 /* The still capture mode, this can be RAW (simply copy sensor input to DDR),
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 11d62313c908..a0a927ebde3e 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -1210,8 +1210,8 @@ ia_css_process_zoom_and_motion(
 		}
 
 		assert(stage->stage_num < SH_CSS_MAX_STAGES);
-		if (params->dz_config.zoom_region.resolution.width == 0 &&
-		    params->dz_config.zoom_region.resolution.height == 0) {
+		if (params->dz_config.zoom_region.width == 0 &&
+		    params->dz_config.zoom_region.height == 0) {
 			sh_css_update_uds_and_crop_info(
 			    &info->sp,
 			    &binary->in_frame_info,
@@ -4096,10 +4096,10 @@ sh_css_update_uds_and_crop_info_based_on_zoom_region(
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

