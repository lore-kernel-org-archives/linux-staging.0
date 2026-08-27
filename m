Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06763EB7F8
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 23:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872685; cv=none; b=T5dD1JJcxufBTws2fcaSFFE7uAGcRdIH5/ClicQRJI6e8xKDvBGBDEIYA02l2dJk9Oxv0mtUOvIe4tu/sJi90/kTfgGorI68bQZVB4Gn7RyK3tM9u9lVHWLbwBTCjIZ2ZCRJgAdfPNOYq2YVWTLlMmXGuoniHxJWGF6jZV7HwQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872685; c=relaxed/simple;
	bh=/jOhce2BN6VpAXwoiqB7U1OURXwM6bRy+qBptBCallw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JmnV2MOZhW+ZdzRZzCNR2VwFkIKVbvMf/KUo5ashlLr1Wi4Zyqzq8wWfDFqwDfWzMFEQ8WhTBnxvz6oNI1f+zl7T4MIhqBezctXAoWdUlvITrYTZWTgSOyMTb1Iy4um2EZdSMSFWNZKKVpitqZpus/dfxpnceOA2ZxO944udcYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pK8tzfST; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pK8tzfST"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so2537915e9.1
        for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 16:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872682; x=1788477482; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gHPz8eBJKsS4HfZNihKxORDaEopiSH7AswobSRa+vUI=;
        b=pK8tzfST0Z890tYZaA/sNBFP1s4mqHMHKzUQLTOpesRNhNtoGNyGIHyKTPzMPY/6KU
         f1QU1g7oPAktbrnV4KcQcDU430Qwr8jE91lGAAR9B84GZDjW7ZO3zqz8YRrJPNcpBFQV
         z8lZrRn9fhvDgh07dZgfsA/XxP2U1V8rVX09rdTgUvtq9BLuMKarre0TGB8hQSSW5aGX
         VOJx/U+IihxiLimw36EQTTeuG2j6N55NfwxLbZPeMf5ZhWD9F5CTE/NDsX+7gDj1IfPr
         UvXOGCOm3fhanAm6oagTw+hNyfSkX4fO4CNfCpxfKmTdTkobnbgyhobMgIiRI3d8I2Z8
         mxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872682; x=1788477482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gHPz8eBJKsS4HfZNihKxORDaEopiSH7AswobSRa+vUI=;
        b=cXBEF8rOGwDmIqA6YdJvrIpvdkvKKYfRL96vptHxP34eQG+lmeAwQi46J4q+A/HCf3
         iiEXQDhT6mszJJebY3j/RWFn5wUeI+5NFah7qVw/Ix+2pgaeVeVrph2LiFI4ajkdXDd/
         H3p25MqLJix5uwsd9gWZQK1eeNPFDNQNV+H72wqbJOU5yvI6Qv34QytImGYo2VdWyBXZ
         +vZKhmS+tgeg+el0iC1qYyVR7wh1LVdV7rJBxfA2g/tr1gS9GBm/VrAyxLaz0ki8SbnC
         9ko3RGmfG7J+D8IVyNs90JrgpP430+LwUA7AYgRcG1AqybVhWZE+GI4I+RVhVYpZ6vGN
         9QGA==
X-Forwarded-Encrypted: i=1; AHgh+RqyI5yAEWKK3qJ/acteGZLjmFPk1Rw/oIwjE5nvFv6vsGvuOw+K0V/ugFzbMFvzhtrHhJQbmb5Ls8eODGCJ@lists.linux.dev
X-Gm-Message-State: AFuF++lv1hvfUxjoKkDuwbndth1rI1K6vyHHwpaXNtr2meBIE+I1fp8B
	765KRdezQfnqDJ6+baGoA93ViFcoK21RGcJO5qx5Ap60eyoATkD/yk8nSWGjOU3+
X-Gm-Gg: AR+sD11mot6P8vGq0NsCufvUq6sPv37Vcxqw9rqmibL03WIf9pdQl7oGVNPiz9DmURm
	1FoyXO4jEZFGiWPYXZN95Ax56FErVA+vPxsWgR4+ZBwNoxdsG6+fJKRPRQXwOKtkoKsLRJIS8go
	cvizV9I5thYnJM/uS8Q1bzXi4VdrW8R/WWCvA9cH8WBkgAgLQM5dUdrLyjokeYQQ98Ctbtb0h8h
	UyQEJu6pDp8nGQpBwFgUHQXd6XECSyOVH2mGeeUmjRShWo9HxhXAREHbXV1iBmljlkvGYcXgHDM
	vjV/DKp6lCUYBDzQkuBU1hvEvsmRXzvBDpRBpG4gAFUxvrNNqmI+IhbiePUNOCSvULHXy7gdQhT
	gjWYtSPWOLstUev2XARKuEXTW7uclTAQmEpYGAiqZ444HSvG07TkVCbDpUjne/6ara6e9Vx7wUc
	xxbs35s4LwWIE6xdTyv7qtxfHcdA2BZhFup57Q1r3nwcj5jrfWlJ/5JqPvzKuacrFOMKClP0mYL
	p0fAJZzBjHL5OrJWleOPi4f1qYu6aWD2Yrh3FHZx8vn
X-Received: by 2002:a05:600c:c494:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-49b91c486c3mr28282985e9.14.1787872681917;
        Thu, 27 Aug 2026 16:18:01 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm7157765e9.2.2026.08.27.16.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:18:01 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v3 10/12] media: atomisp: Use struct v4l2_area for padding
Date: Fri, 28 Aug 2026 01:17:28 +0200
Message-ID: <2202cbcaf51189b3886c2b2d92b320eb261a4e85.1787872237.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787872237.git.mauriziocasciano7@gmail.com>
References: <cover.1787872237.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The padding helper passes width and height as four separate scalar
arguments even though they form two logical dimensions.

Pass the requested size and returned padding as struct v4l2_area values.
This also simplifies all three callers before extending the helper with
sensor-specific padding.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Link: https://lore.kernel.org/linux-media/apCc_pt5dDxGJrei@ashevche-desk.local/
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 51 +++++++++++--------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  6 +--
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 14 +++--
 3 files changed, 42 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9fd26..51dd59d98b3b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3562,9 +3562,9 @@ static void atomisp_fill_pix_format(struct v4l2_pix_format *f,
 	f->xfer_func = V4L2_XFER_FUNC_709;
 }
 
-/* Get sensor padding values for the non padded width x height resolution */
-void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
-			 u32 *padding_w, u32 *padding_h)
+/* Get sensor padding values for the non-padded size */
+void atomisp_get_padding(struct atomisp_device *isp, struct v4l2_area size,
+			 struct v4l2_area *pad)
 {
 	struct atomisp_input_subdev *input = &isp->inputs[isp->asd.input_curr];
 	struct v4l2_rect native_rect = input->native_rect;
@@ -3574,22 +3574,23 @@ void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
 	struct v4l2_mbus_framefmt *sink;
 
 	if (!input->crop_support) {
-		*padding_w = pad_w;
-		*padding_h = pad_h;
+		pad->width = pad_w;
+		pad->height = pad_h;
 		return;
 	}
 
-	width = min(width, input->active_rect.width);
-	height = min(height, input->active_rect.height);
+	size.width = min(size.width, input->active_rect.width);
+	size.height = min(size.height, input->active_rect.height);
 
-	if (input->binning_support && width <= (input->active_rect.width / 2) &&
-				      height <= (input->active_rect.height / 2)) {
+	if (input->binning_support &&
+	    size.width <= (input->active_rect.width / 2) &&
+	    size.height <= (input->active_rect.height / 2)) {
 		native_rect.width /= 2;
 		native_rect.height /= 2;
 	}
 
-	*padding_w = min_t(u32, (native_rect.width - width) & ~1, pad_w);
-	*padding_h = min_t(u32, (native_rect.height - height) & ~1, pad_h);
+	pad->width = min_t(u32, (native_rect.width - size.width) & ~1, pad_w);
+	pad->height = min_t(u32, (native_rect.height - size.height) & ~1, pad_h);
 
 	/* The below minimum padding requirements are for BYT / ISP2400 only */
 	if (IS_ISP2401)
@@ -3617,8 +3618,8 @@ void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
 		min_pad_h += 2;
 
 apply_min_padding:
-	*padding_w = max_t(u32, *padding_w, min_pad_w);
-	*padding_h = max_t(u32, *padding_h, min_pad_h);
+	pad->width = max_t(u32, pad->width, min_pad_w);
+	pad->height = max_t(u32, pad->height, min_pad_h);
 }
 
 int atomisp_s_sensor_power(struct atomisp_device *isp, unsigned int input, bool on)
@@ -3800,7 +3801,8 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	const struct atomisp_format_bridge *fmt, *snr_fmt;
 	struct atomisp_sub_device *asd = &isp->asd;
 	struct v4l2_mbus_framefmt ffmt = { };
-	u32 padding_w, padding_h;
+	struct v4l2_area padding;
+	struct v4l2_area size;
 	int ret;
 
 	fmt = atomisp_get_format_bridge(f->pixelformat);
@@ -3827,10 +3829,12 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	 * resolution + padding. Add padding here and remove it again after
 	 * the set_fmt call, like atomisp_set_fmt_to_snr() does.
 	 */
-	atomisp_get_padding(isp, f->width, f->height, &padding_w, &padding_h);
+	size.width = f->width;
+	size.height = f->height;
+	atomisp_get_padding(isp, size, &padding);
 	v4l2_fill_mbus_format(&ffmt, f, fmt->mbus_code);
-	ffmt.width += padding_w;
-	ffmt.height += padding_h;
+	ffmt.width += padding.width;
+	ffmt.height += padding.height;
 
 	dev_dbg(isp->dev, "try_mbus_fmt: try %ux%u\n", ffmt.width, ffmt.height);
 
@@ -3847,8 +3851,8 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 		return -EINVAL;
 	}
 
-	f->width = ffmt.width - padding_w;
-	f->height = ffmt.height - padding_h;
+	f->width = ffmt.width - padding.width;
+	f->height = ffmt.height - padding.height;
 
 	/*
 	 * If the format is jpeg or custom RAW, then the width and height will
@@ -4334,6 +4338,8 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	const struct atomisp_format_bridge *format_bridge;
 	const struct atomisp_format_bridge *snr_format_bridge;
 	struct ia_css_frame_info output_info;
+	struct v4l2_area padding;
+	struct v4l2_area size;
 	unsigned int dvs_env_w = 0, dvs_env_h = 0;
 	struct v4l2_mbus_framefmt isp_source_fmt = {0};
 	struct v4l2_rect isp_sink_crop;
@@ -4366,8 +4372,11 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 				ATOMISP_SUBDEV_PAD_SOURCE, &isp_source_fmt);
 
 	if (atomisp_subdev_format_conversion(asd)) {
-		atomisp_get_padding(isp, f->fmt.pix.width, f->fmt.pix.height,
-				    &asd->sink_pad_padding_w, &asd->sink_pad_padding_h);
+		size.width = f->fmt.pix.width;
+		size.height = f->fmt.pix.height;
+		atomisp_get_padding(isp, size, &padding);
+		asd->sink_pad_padding_w = padding.width;
+		asd->sink_pad_padding_h = padding.height;
 	} else {
 		asd->sink_pad_padding_w = 0;
 		asd->sink_pad_padding_h = 0;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index d3d1f2574e77..8a84e774f4d5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -225,9 +225,9 @@ int atomisp_makeup_css_parameters(struct atomisp_sub_device *asd,
 int atomisp_compare_grid(struct atomisp_sub_device *asd,
 			 struct atomisp_grid_info *atomgrid);
 
-/* Get sensor padding values for the non padded width x height resolution */
-void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
-			 u32 *padding_w, u32 *padding_h);
+/* Get sensor padding values for the non-padded size */
+void atomisp_get_padding(struct atomisp_device *isp, struct v4l2_area size,
+			 struct v4l2_area *pad);
 
 /* Set sensor power (no-op if already on/off) */
 int atomisp_s_sensor_power(struct atomisp_device *isp, unsigned int input, bool on);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 50366bf10f32..43bca68d1e6d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -470,15 +470,19 @@ static int atomisp_enum_framesizes_crop_inner(struct atomisp_device *isp,
 		{  800,  600 },
 		{  640,  480 },
 	};
-	u32 padding_w, padding_h;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(frame_sizes); i++) {
-		atomisp_get_padding(isp, frame_sizes[i].width, frame_sizes[i].height,
-				    &padding_w, &padding_h);
+		struct v4l2_area size = {
+			.width = frame_sizes[i].width,
+			.height = frame_sizes[i].height,
+		};
+		struct v4l2_area padding;
 
-		if ((frame_sizes[i].width + padding_w) > native->width ||
-		    (frame_sizes[i].height + padding_h) > native->height)
+		atomisp_get_padding(isp, size, &padding);
+
+		if ((frame_sizes[i].width + padding.width) > native->width ||
+		    (frame_sizes[i].height + padding.height) > native->height)
 			continue;
 
 		/*
-- 
2.53.0

