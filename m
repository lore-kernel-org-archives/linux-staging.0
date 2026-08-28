Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EF045C6F7
	for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 16:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933734; cv=none; b=f4HA/vViclTfWuidAdHyy/tYIaWu7oeSLBJva2rdYKr6vP8YkaLRMi73sNPdYjo/pxlkrtj5AzQfpzzSctuo70OGRZFZkG5TWNr/NRWxN9vi+mawRN5eIhnZnMCP/wmRgOSxeRkQRN3Dj8kmckloI0jK3YJYuP8ztHFYMPL9IiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933734; c=relaxed/simple;
	bh=l6qatP/1SS7be0G2miVwTO4xWFBkzQQs/ILAgIcLmkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nNbRZ8ho/9Pq8aYwdm09pwTtMoSv+Xb3Q1rB9pg+uWwzYXElhGL4agbNA7rLPW2PEUgc6aF+NVugkB3psDHGx3svDB3g9S+L8xJkwd4YreQJ4w1+Invfr4r3em3B2aLnqA2HFjQjZwuImVNxFiGs09S8XqCzha5aBDKxt6KMhp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IgN1DiTx; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IgN1DiTx"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482e067e908so754479f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 09:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933731; x=1788538531; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zCLWLdSI658UBVRaCX9PmNUq6TQMDtUFjTpgX36dYDg=;
        b=IgN1DiTx98GJd5bG9Lu6KkUJ7+1G11DKeebK+00aPNpprAeGZOu790sI0pSOhTeXyd
         4vsUWn+yP1lnkuIe7SEo+YDwpypXKs6FHDMccuznA2hX7nQk6GtCutGS369b+7zCT4sx
         W/hyJpzTw2ooP+pjo39ob/kd6JbYOeQkZUw1eUNSCvGESt5fov2lIphS4VFx9gEsHf6a
         rezmZQnbezE5YlpiCJuzRLAxZcOIy64Ai+AWZbzYjhbUb1T0lsB3VRXd6rptNqAbp/ji
         MwwhTtFVKh04InKoqXB60YJD1kac1aV2noj0pcZCJ5HW+r/m9z2vCTD3uZkLs8cIkPuh
         Z51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933731; x=1788538531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zCLWLdSI658UBVRaCX9PmNUq6TQMDtUFjTpgX36dYDg=;
        b=mU0P+NUaFBtVfEjQ+LOxC13Q1QtjEi5AK8LXDSyp3UgV85UUyozM0HbUg51WQfhxVE
         xr2aW/hlEO0+gl16Bbe9czyw7DMgqVIOY3ZHVs2n9hi1rm5eTk9QnFiTsdYVsaohBgEZ
         T0H5Yo1a61zMT6fjL2HI7nQOO0tiESGaa+q/DvvIMXByQDGlnUgKRb6PNrcmrTxprDQo
         8buqDNCxYJ1cjycDXDXN50Motnccz6NqDCFiItv2VuOikc578jaSqacZD9Baf44ceVIy
         yzyMzHBVmxEg69ho4+QZBocbd3bPV7880c4yfPJ3vauWALCOFXx50u3LvLGTcron9JuS
         xKRQ==
X-Forwarded-Encrypted: i=1; AHgh+RqDXBb1Kp0R/cN3VB/JljcXQyeskGtnR6c8Pn5KCRN9IagIPiyZqXJyfdk3Yu6IYnRhFK/uKy8BnuJIJGdq@lists.linux.dev
X-Gm-Message-State: AFuF++nMlD/fI5MJkkZL3850YidOXJGS9lFG7Q2xm1V3gfxTE+t08cA/
	5eKog/9/h6nZNLXCp3gMCezmnRP/xSavw8ILl8+KQazzMgbZpriydSln
X-Gm-Gg: AR+sD10DRZX23GXlU43y07fS+lnZiJsboJXPWHAM6mvX/dbCxnSriPtbS75l62SIWHh
	c0Nt+kt0eHnFDOt/kLOKs8O3gmoCJGbxduwIbRnzQu3P1Qs7tfkGLZcBXPR/7zHfR8jsl5HOt2R
	+78X/e1ECrl/1nLG/+KODD96wNl2R46Jv+XaLAxL4K2cBKOJUEgFCKrL9AwBAwHdc/gXafqq2O3
	Xbu+ONQmgKqv0K/ACaJkd/5zcZRvKtQk41YfQ3ybnI73+/iblyDKoke4aCzMFW1awhL1PPvNOjX
	yfl/La8IR7Ur1d8Zbidr1N09NEF6zqpij61peklx8lekVdJ+eU/AGi8JDUzfC9rs3oFabSPZsB1
	frD7jhbCOaeV9B6a+EP+0pPBkBOchIPz/iaI9oxanzIMdLBh2eoN0KOPZOkJRFhDVskx/+tReXR
	7IKLhdVoOzQv5IIA/ZBXgxneosU0MJZWh0W4AbRbALS2UODAFY5kfcclgkJWpnjbf+RZonOwipZ
	g0U+XWb5KJ7hoxH3onfykXlkEKuO7MoNolwrX2AGw==
X-Received: by 2002:a05:6000:2904:b0:482:e963:22bc with SMTP id ffacd0b85a97d-482f79a7548mr14687981f8f.6.1787933730940;
        Fri, 28 Aug 2026 09:15:30 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:30 -0700 (PDT)
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
Subject: [PATCH v4 13/15] media: atomisp: Use struct v4l2_area for padding
Date: Fri, 28 Aug 2026 18:14:55 +0200
Message-ID: <d75701c5a72daf6b36305297a44e925e5ed6b935.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
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
This makes the dimensions explicit and simplifies all three callers.

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

