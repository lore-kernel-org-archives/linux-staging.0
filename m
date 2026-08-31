Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733A1453A29
	for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 18:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199297; cv=none; b=Zkr8aa+qleSkewWB7K6K/bhG07yl12mjzP0nbsNmwmNMQGxqNkDZrvQvBj0Svyghjpr1Iyo9BChTy/CGSqP6Qw9MFlxvRrUInMh8iNiJAAKmlweUqk3UWtqtIQ1/W0IkRHsPsLnGtUAqxOCwgfHOO3DxMkojYkAdFiWNj5pUSuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199297; c=relaxed/simple;
	bh=GV7ecQMvAtHIiN3yvOqr4q4LTDCBEQJXua361xvFxkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=suSWNkIKFo4/vQMHDN3vrSUbs00FC2riWe0PiiuThsDNKtjtybBp4dCJ+88LIfESrfB1FGJrvGu2Upa0l0jjQQydUW9iwva5yO+I6mv0v1RRFw1/7n0KRWQC0lSfGnVfmNRFMHqxJksmIzU9M0hr+M9rEoixxCGxh1HsUriKgHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvUY/QAI; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvUY/QAI"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-482e2fdf6ebso3174780f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 11:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199294; x=1788804094; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0jy4jniSdFTM5OWRwaSjf11E7VXlWc1WIdO+dQpFRQA=;
        b=lvUY/QAI2XNR5OCjsXkXDA9D2a0kBZsfRdgjHFMgarEk+kNNqgROn5guEwwkY/n/h9
         P4i6bj/2Z1OAatNQaHCY0QUtmiO7xt3TP3eqPoUGLFfP4aJDNRuc+a33wukIdsH654GX
         XvlolQHUlQSqCJZa8pGH50YwTJuPvyIG/W31cfdPpuGT2sB/wUxev6PRDXGF3eZ3qjen
         tc7uNEWC/KSM1AopVsj97tgAuKlKafF8b0u0nonU/IEjZhH7q56iI3Q/SL2JmZonVhY1
         FIuLlc3lR7Lb0patmTxYizpeBdY4Ltf+Ob7FGsEpKDqdq8DJSgtjGC6YctfzGA+McBnV
         yetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199294; x=1788804094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0jy4jniSdFTM5OWRwaSjf11E7VXlWc1WIdO+dQpFRQA=;
        b=EnMIb5qqdUOgu/+2tXUAqp1MSCGeQdSaN1RwQShzfKTmGWDuJvfbmucrGD/zzof3iS
         0kQaSJ0i2u39E0QQZDuuvKwTUmJIw1jQ4gsxR79ZpMFDDs9uOroSXKFC12rL8FXTKUP8
         K1jx1Pa9XIDGVbQXlS/s9/eAn6icFzuqVH857zFt6JKguqQAr99J4CT4My+Bww6/8r6D
         1o26BgNZXF5SighaFi9vvg4x+Mna1GbkzpY1tlldJfClz0ZAfgDOneSlSWU9IAXjgig1
         zcXxJRaWsFM5eVghP3rnv+l4l/oR3ec7B5JHfUWxB6n0dDzw0fgElCeJlesF9WliORbd
         jiGg==
X-Forwarded-Encrypted: i=1; AKwUvBzpq4K1hSQhVVn3oL6d4hiqDKQFys4LGwxN0c5PfxGoO2w6utVFT+4Sqfhpe/4GswiugaF8Lkjkw1+E/zDr@lists.linux.dev
X-Gm-Message-State: AFuF++mGxwWc1RG4ygT8vJSt8zRr5zxda9L79pIbaMIJQpsIMiA3RmtN
	dPGhWz6NUFge6V/Sl2cIYtG2rcWdoZOmS6ahtUJxoAT4Gg83YTJunLOB
X-Gm-Gg: AYBFou0ys0gywo4XEgzNE9TNlT0jF/FxlORSQDK2P9ee0NC45citecuiAYMRHxmsIZ6
	rPC1MBBJRI0fUe/3jJFLxYS6CC2rOdn48E6Ag8fBI2FhqRYeo7z+UQvFQ+uTEGP0a/SaNRzhrvQ
	pX/iwm2jR9q7IDI2AFNJnN/uJN9WWS6k6JdBHtiFKaltTLpFz7vTsFWWhX+rsKLoSuvBazXYdjo
	eIPEVwI4/zxJP/pPXUJHQMQXOvsKW/5Ppl3Y2SSSjOS/mes/KR2I7W+wbZAt2yvfIv0tVDhdz8f
	GplfIHCRhiOBckSBrJOx4i3xuSUIvxmnOlbi/PP/SabClCtLaSSWlLPEFR9K7fUxZVrKkX+TO/P
	RqU30L5BaR1cshKmqTB1+nMeMCcDMfvLAi75uSIPJu4DXM2lENt17O5SsQwB/otDMe6x3JatMlN
	3H9NjKh4lY+niEwlcUOF/6YikAVtfAYas2FkrY5KkV6JbHLWSdnbC8ZL7xQX3y46S6xtj04WwDW
	9yqei76NepEYhVTY2PMWTgZKwYI5JFcvrtT4ZfTrUA2/gHn4GoVYg==
X-Received: by 2002:a05:6000:607:b0:484:41fb:4128 with SMTP id ffacd0b85a97d-48441fb4389mr183112f8f.10.1788199293453;
        Mon, 31 Aug 2026 11:01:33 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:33 -0700 (PDT)
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
Subject: [PATCH v5 14/16] media: atomisp: Use struct v4l2_area for padding
Date: Mon, 31 Aug 2026 20:00:59 +0200
Message-ID: <20260831180101.3109854-15-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
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
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 68 +++++++++++--------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  6 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 15 ++--
 .../media/atomisp/pci/atomisp_subdev.c        |  4 +-
 .../media/atomisp/pci/atomisp_subdev.h        |  3 +-
 5 files changed, 53 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9fd26..759effdb2e8d 100644
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
@@ -3617,8 +3618,18 @@ void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
 		min_pad_h += 2;
 
 apply_min_padding:
-	*padding_w = max_t(u32, *padding_w, min_pad_w);
-	*padding_h = max_t(u32, *padding_h, min_pad_h);
+	pad->width = max_t(u32, pad->width, min_pad_w);
+	pad->height = max_t(u32, pad->height, min_pad_h);
+}
+
+static inline void
+atomisp_get_pix_padding(struct atomisp_device *isp,
+			struct v4l2_pix_format *f,
+			struct v4l2_area *pad)
+{
+	struct v4l2_area size = { .width = f->width, .height = f->height };
+
+	atomisp_get_padding(isp, size, pad);
 }
 
 int atomisp_s_sensor_power(struct atomisp_device *isp, unsigned int input, bool on)
@@ -3800,7 +3811,7 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	const struct atomisp_format_bridge *fmt, *snr_fmt;
 	struct atomisp_sub_device *asd = &isp->asd;
 	struct v4l2_mbus_framefmt ffmt = { };
-	u32 padding_w, padding_h;
+	struct v4l2_area padding;
 	int ret;
 
 	fmt = atomisp_get_format_bridge(f->pixelformat);
@@ -3827,10 +3838,10 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	 * resolution + padding. Add padding here and remove it again after
 	 * the set_fmt call, like atomisp_set_fmt_to_snr() does.
 	 */
-	atomisp_get_padding(isp, f->width, f->height, &padding_w, &padding_h);
+	atomisp_get_pix_padding(isp, f, &padding);
 	v4l2_fill_mbus_format(&ffmt, f, fmt->mbus_code);
-	ffmt.width += padding_w;
-	ffmt.height += padding_h;
+	ffmt.width += padding.width;
+	ffmt.height += padding.height;
 
 	dev_dbg(isp->dev, "try_mbus_fmt: try %ux%u\n", ffmt.width, ffmt.height);
 
@@ -3847,8 +3858,8 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 		return -EINVAL;
 	}
 
-	f->width = ffmt.width - padding_w;
-	f->height = ffmt.height - padding_h;
+	f->width = ffmt.width - padding.width;
+	f->height = ffmt.height - padding.height;
 
 	/*
 	 * If the format is jpeg or custom RAW, then the width and height will
@@ -4268,11 +4279,12 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 		return -EINVAL;
 
 	v4l2_fill_mbus_format(&ffmt, f, format->mbus_code);
-	ffmt.height += asd->sink_pad_padding_h + dvs_env_h;
-	ffmt.width += asd->sink_pad_padding_w + dvs_env_w;
+	ffmt.height += asd->sink_pad_padding.height + dvs_env_h;
+	ffmt.width += asd->sink_pad_padding.width + dvs_env_w;
 
 	dev_dbg(isp->dev, "s_mbus_fmt: ask %ux%u (padding %ux%u, dvs %ux%u)\n",
-		ffmt.width, ffmt.height, asd->sink_pad_padding_w, asd->sink_pad_padding_h,
+		ffmt.width, ffmt.height, asd->sink_pad_padding.width,
+		asd->sink_pad_padding.height,
 		dvs_env_w, dvs_env_h);
 
 	__atomisp_init_stream_info(ATOMISP_INPUT_STREAM_GENERAL, stream_info);
@@ -4365,13 +4377,11 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 				V4L2_SUBDEV_FORMAT_ACTIVE,
 				ATOMISP_SUBDEV_PAD_SOURCE, &isp_source_fmt);
 
-	if (atomisp_subdev_format_conversion(asd)) {
-		atomisp_get_padding(isp, f->fmt.pix.width, f->fmt.pix.height,
-				    &asd->sink_pad_padding_w, &asd->sink_pad_padding_h);
-	} else {
-		asd->sink_pad_padding_w = 0;
-		asd->sink_pad_padding_h = 0;
-	}
+	if (atomisp_subdev_format_conversion(asd))
+		atomisp_get_pix_padding(isp, &f->fmt.pix,
+					&asd->sink_pad_padding);
+	else
+		asd->sink_pad_padding = (struct v4l2_area) { };
 
 	atomisp_get_dis_envelop(asd, f->fmt.pix.width, f->fmt.pix.height,
 				&dvs_env_w, &dvs_env_h);
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
index 50366bf10f32..87c29a940f9b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -457,7 +457,7 @@ static int atomisp_enum_framesizes_crop_inner(struct atomisp_device *isp,
 					      const struct v4l2_rect *native,
 					      int *valid_sizes)
 {
-	static const struct v4l2_frmsize_discrete frame_sizes[] = {
+	static const struct v4l2_area frame_sizes[] = {
 		{ 1920, 1440 },
 		{ 1920, 1200 },
 		{ 1920, 1080 },
@@ -470,15 +470,15 @@ static int atomisp_enum_framesizes_crop_inner(struct atomisp_device *isp,
 		{  800,  600 },
 		{  640,  480 },
 	};
-	u32 padding_w, padding_h;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(frame_sizes); i++) {
-		atomisp_get_padding(isp, frame_sizes[i].width, frame_sizes[i].height,
-				    &padding_w, &padding_h);
+		struct v4l2_area padding;
 
-		if ((frame_sizes[i].width + padding_w) > native->width ||
-		    (frame_sizes[i].height + padding_h) > native->height)
+		atomisp_get_padding(isp, frame_sizes[i], &padding);
+
+		if ((frame_sizes[i].width + padding.width) > native->width ||
+		    (frame_sizes[i].height + padding.height) > native->height)
 			continue;
 
 		/*
@@ -491,7 +491,8 @@ static int atomisp_enum_framesizes_crop_inner(struct atomisp_device *isp,
 
 		if (*valid_sizes == fsize->index) {
 			fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
-			fsize->discrete = frame_sizes[i];
+			fsize->discrete.width = frame_sizes[i].width;
+			fsize->discrete.height = frame_sizes[i].height;
 			return 0;
 		}
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 9de9cd884d99..ad97e4691d9a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -326,8 +326,8 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 
 		if (atomisp_subdev_format_conversion(isp_sd)
 		    && crop[pad]->width && crop[pad]->height) {
-			crop[pad]->width -= isp_sd->sink_pad_padding_w;
-			crop[pad]->height -= isp_sd->sink_pad_padding_h;
+			crop[pad]->width -= isp_sd->sink_pad_padding.width;
+			crop[pad]->height -= isp_sd->sink_pad_padding.height;
 		}
 
 		if (isp_sd->params.video_dis_en &&
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index b12bb65be3f2..0045f380de74 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -214,8 +214,7 @@ struct atomisp_sub_device {
 	struct media_pad pads[ATOMISP_SUBDEV_PADS_NUM];
 	struct atomisp_pad_format fmt[ATOMISP_SUBDEV_PADS_NUM];
 	/* Padding for currently set sink-pad fmt */
-	u32 sink_pad_padding_w;
-	u32 sink_pad_padding_h;
+	struct v4l2_area sink_pad_padding;
 
 	unsigned int output;
 	struct atomisp_video_pipe video_out;
-- 
With Best Regards,
Maurizio Casciano

