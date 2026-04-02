Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD2E29D266
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 13:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775136611; cv=none; b=ZiPhvWccgtPl9ghB9G4DYL29Bjsnez+hzePZsplnnM470gBwTRa1LjXVEYKJP7V0lclLXIdZUAOhiQMwJprAwY+hyzvHHdBjr5kaj13i2jehvhxthAvp9IywRo6B+F0qEzyo6uvgOwAJbZmX74BEjp2o/aCffb1hJm9IkLunwZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775136611; c=relaxed/simple;
	bh=XVCi/546amQIFXhYbaiOvywekubDKDUMCWNbag5Wb24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gpmlkjXtjz4i3LfCaCvhvkaIVGUNviEBbyDvzG2+oSZFKyBbAECFaXGEjTY/mQnwPs7hr0A/ReyfLwX353qYIJS4b0Y5LM5DHo6DV++GhySjVTNe767Hi0DNLS2zu/F3LRcHdsO0DAeqK4745IGRp+vaglK2i/UNlVMnZPwIhIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDl1Matb; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDl1Matb"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso9385295e9.3
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 06:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775136608; x=1775741408; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X0MIU8GEyiO9stMRDDy9bZVbExCEI6xq1O1exAfXJh0=;
        b=fDl1MatbcQti0zf0NDvZD3QpIpS2HDBst/NizgytKNsj4xdmmv3uNQkzmWq4lEh3hh
         +PER2aaeGiQKRCB1qbohNWb+uozBNAzD6ObIY1wvM4L8/FaJ1roUcsy/WwcZpu7kG7YN
         MFeFfo6NyGmaDd70nFlF2ti5YVJxJl/tXH47CnsvHA7qbLyKZv2Xf5IZWjmJcheGDoIG
         g4pdlWKKchxV6Om+ubuEIhj+3HSsIgRXWWGIVfXxaEJf3ZROvRnYOv3FelCsgDwaT4bf
         MPrF7dQ8QFqrRQgo9mxALiTvnr6C2u/6FcjnbOmy5W2Q3n84hajKGPzWN3E2UIAMfKLt
         BLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775136608; x=1775741408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0MIU8GEyiO9stMRDDy9bZVbExCEI6xq1O1exAfXJh0=;
        b=mrp9bR4RSmA11JUpl2x1T2GB7z7zqH2wgBFHcRDReGPYiWJ4/fXeglz81Z/pEZ2p3l
         86tb86+OzdMnw5BD78jzAWt+JMJPr0d6d57T8l5POnsJLvs6CyteYCP52xtAaywFLA5G
         fjSBmDQw/NN/0H5GA5h0o5XfLFzOGyCZaiFKiHkQ3n316phjBB6HNSeIH1R1sf+SFVAo
         ZeYHOH1urXP3qSc1cdb8qhcTDswQ6cw/jP6EU5H17c6T+KkR9z2S0LRctG+t4Ykf/FBl
         nVcO2XX1RkJdvc7hXxBSjnGvlsiNRuvA4sqFR/sLvZuJURUPogbDrygDfTBhICH0nYOm
         yHGA==
X-Forwarded-Encrypted: i=1; AJvYcCWhMeU+JYcfXo6J0AfuOtOfRuLJDDL/wy2oKZ7cS5j2ZjfFz5nRovH3Y4UsCU5iA5J2qMsdBFwEE9uGRURP@lists.linux.dev
X-Gm-Message-State: AOJu0YwqaMSRyJfY5QhYCCUGMyRd5fuJBVXakrXCFVAqFVeeBSnPcZDA
	AB8WqDJTED5H9+9iJFNey2+6qP5gUdox1KFBwpjZgLroMQ1RWJztD4ab
X-Gm-Gg: ATEYQzzeTjQARydzIOxEOMWiXNCLBaftS5E30+w4INj6QlOg/kZxGTNd6z5+8P6pXJl
	givOVcAJajx2O5Xn3OxCAO0nvLoKHfbvkRMdLIE3CZUQ2bu5SzfgcdNmO288bNuSZi856LrcQ7H
	i9ymYV+FiDyq/8sgSsHqbZ0bmQPXaifnxbB8MktdXLT2/0sk4T98GINWt/iFBuMTtL0OzlQffUo
	pEI7qmZ9rUh2bq2X99k3oabY9mLnpHSNUvAfh5mdgayivli4l28Q+7EdFC6lxZHk/dKm7HJyKi/
	RZOFsWZ0BlmA7/0+rmlqfKckJvhzQYYFH3mSZQYaSpZMWtjrf8/GBxntBQe+PhktDQwJaMrn9lS
	c9k7R2KS6zDnV1Dbak0wXqsnAl2unLyRLrBpyf8TT64swXsttpWt0F/+SbAAxmz7xOPshrMZ1rQ
	CHo9D3Hml6h+EGc2z3PCoI
X-Received: by 2002:a05:600c:848d:b0:485:3c66:e230 with SMTP id 5b1f17b1804b1-488835b78f1mr141100575e9.29.1775136608192;
        Thu, 02 Apr 2026 06:30:08 -0700 (PDT)
Received: from MEROWN ([85.93.99.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e93cf2dsm177225405e9.11.2026.04.02.06.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 06:30:07 -0700 (PDT)
From: Daniil Bulgar <bulgardaniil18@gmail.com>
To: gregkh@linuxfoundation.org,
	hansg@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Daniil Bulgar <bulgardaniil18@gmail.com>
Subject: [PATCH] staging: media: atomisp: fix indentation and spacing in sh_css.c
Date: Thu,  2 Apr 2026 15:30:05 +0200
Message-ID: <20260402133005.288643-1-bulgardaniil18@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix several coding style errors reported by checkpatch.pl.
Use tabs for indentation instead of spaces.
Fix alignment of function arguments to match the opening parenthesis.
Remove trailing whitespaces and fix blank lines.

Signed-off-by: Daniil Bulgar <bulgardaniil18@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 103 ++++++++++-----------
 1 file changed, 49 insertions(+), 54 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925f..fbfa54235 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -65,7 +65,6 @@
 
 #define SH_CSS_VIDEO_BUFFER_ALIGNMENT 0
 
-
 #include "ia_css_spctrl.h"
 #include "ia_css_version_data.h"
 #include "sh_css_struct.h"
@@ -101,7 +100,7 @@ enum ia_sh_css_modes {
 	sh_css_mode_resume
 };
 
-/**
+/*
  * struct sh_css_stream_seed - a stream seed, to save and restore the
  * stream data.
  *
@@ -115,7 +114,7 @@ enum ia_sh_css_modes {
  *
  * the stream seed contains all the data required to "grow" the seed again
  * after it was closed.
-*/
+ */
 struct sh_css_stream_seed {
 	struct ia_css_stream		**orig_stream;
 	struct ia_css_stream		*stream;
@@ -208,11 +207,11 @@ need_capture_pp(const struct ia_css_pipe *pipe);
 static bool
 need_yuv_scaler_stage(const struct ia_css_pipe *pipe);
 
-static int ia_css_pipe_create_cas_scaler_desc_single_output(
-    struct ia_css_frame_info *cas_scaler_in_info,
-    struct ia_css_frame_info *cas_scaler_out_info,
-    struct ia_css_frame_info *cas_scaler_vf_info,
-    struct ia_css_cas_binary_descr *descr);
+static int
+ia_css_pipe_create_cas_scaler_desc_single_output(struct ia_css_frame_info *cas_scaler_in_info,
+						 struct ia_css_frame_info *cas_scaler_out_info,
+						 struct ia_css_frame_info *cas_scaler_vf_info,
+						 struct ia_css_cas_binary_descr *descr);
 
 static void ia_css_pipe_destroy_cas_scaler_desc(struct ia_css_cas_binary_descr
 	*descr);
@@ -226,11 +225,10 @@ static bool need_capt_ldc(const struct ia_css_pipe *pipe);
 static int
 sh_css_pipe_load_binaries(struct ia_css_pipe *pipe);
 
-static
-int sh_css_pipe_get_viewfinder_frame_info(
-    struct ia_css_pipe *pipe,
-    struct ia_css_frame_info *info,
-    unsigned int idx);
+static int
+sh_css_pipe_get_viewfinder_frame_info(struct ia_css_pipe *pipe,
+				      struct ia_css_frame_info *info,
+				      unsigned int idx);
 
 static int
 sh_css_pipe_get_output_frame_info(struct ia_css_pipe *pipe,
@@ -305,8 +303,8 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe);
 static unsigned int
 sh_css_get_sw_interrupt_value(unsigned int irq);
 
-static struct ia_css_binary *ia_css_pipe_get_shading_correction_binary(
-    const struct ia_css_pipe *pipe);
+static struct ia_css_binary *
+ia_css_pipe_get_shading_correction_binary(const struct ia_css_pipe *pipe);
 
 static struct ia_css_binary *
 ia_css_pipe_get_s3a_binary(const struct ia_css_pipe *pipe);
@@ -470,10 +468,9 @@ sh_css_config_input_network_2400(struct ia_css_stream *stream)
 	if (pipe->pipeline.stages)
 		binary = pipe->pipeline.stages->binary;
 
-	err = ia_css_isys_convert_stream_format_to_mipi_format(
-	    stream->config.input_config.format,
-	    stream->csi_rx_config.comp,
-	    &fmt_type);
+	err = ia_css_isys_convert_stream_format_to_mipi_format(stream->config.input_config.format,
+							       stream->csi_rx_config.comp,
+							       &fmt_type);
 	if (err)
 		return err;
 	sh_css_sp_program_input_circuit(fmt_type,
@@ -504,9 +501,9 @@ sh_css_config_input_network_2400(struct ia_css_stream *stream)
 	return 0;
 }
 
-static unsigned int csi2_protocol_calculate_max_subpixels_per_line(
-    enum atomisp_input_format	format,
-    unsigned int			pixels_per_line)
+static unsigned int
+csi2_protocol_calculate_max_subpixels_per_line(enum atomisp_input_format format,
+					       unsigned int pixels_per_line)
 {
 	unsigned int rval;
 
@@ -629,9 +626,9 @@ static unsigned int csi2_protocol_calculate_max_subpixels_per_line(
 	return rval;
 }
 
-static bool sh_css_translate_stream_cfg_to_input_system_input_port_id(
-    struct ia_css_stream_config *stream_cfg,
-    ia_css_isys_descr_t	*isys_stream_descr)
+static bool
+sh_css_translate_stream_cfg_to_input_system_input_port_id(struct ia_css_stream_config *stream_cfg,
+							  ia_css_isys_descr_t *isys_stream_descr)
 {
 	bool rc;
 
@@ -665,9 +662,9 @@ static bool sh_css_translate_stream_cfg_to_input_system_input_port_id(
 	return rc;
 }
 
-static bool sh_css_translate_stream_cfg_to_input_system_input_port_type(
-    struct ia_css_stream_config *stream_cfg,
-    ia_css_isys_descr_t	*isys_stream_descr)
+static bool
+sh_css_translate_stream_cfg_to_input_system_input_port_type(struct ia_css_stream_config *stream_cfg,
+							    ia_css_isys_descr_t *isys_stream_descr)
 {
 	bool rc;
 
@@ -692,10 +689,10 @@ static bool sh_css_translate_stream_cfg_to_input_system_input_port_type(
 	return rc;
 }
 
-static bool sh_css_translate_stream_cfg_to_input_system_input_port_attr(
-    struct ia_css_stream_config *stream_cfg,
-    ia_css_isys_descr_t	*isys_stream_descr,
-    int isys_stream_idx)
+static bool
+sh_css_translate_stream_cfg_to_input_system_input_port_attr(struct ia_css_stream_config *stream_cfg,
+							    ia_css_isys_descr_t	*isys_stream_descr,
+							    int isys_stream_idx)
 {
 	bool rc;
 
@@ -726,9 +723,9 @@ static bool sh_css_translate_stream_cfg_to_input_system_input_port_attr(
 		unsigned int fmt_type;
 
 		err = ia_css_isys_convert_stream_format_to_mipi_format(
-			  stream_cfg->isys_config[isys_stream_idx].format,
-			  MIPI_PREDICTOR_NONE,
-			  &fmt_type);
+				stream_cfg->isys_config[isys_stream_idx].format,
+				MIPI_PREDICTOR_NONE,
+				&fmt_type);
 		if (err)
 			rc = false;
 
@@ -740,9 +737,8 @@ static bool sh_css_translate_stream_cfg_to_input_system_input_port_attr(
 		if (IS_ISP2401)
 			isys_stream_descr->online = stream_cfg->online;
 
-		err |= ia_css_isys_convert_compressed_format(
-			   &stream_cfg->source.port.compression,
-			   isys_stream_descr);
+		err |= ia_css_isys_convert_compressed_format(&stream_cfg->source.port.compression,
+							     isys_stream_descr);
 		if (err)
 			rc = false;
 
@@ -750,9 +746,9 @@ static bool sh_css_translate_stream_cfg_to_input_system_input_port_attr(
 		isys_stream_descr->metadata.enable = false;
 		if (stream_cfg->metadata_config.resolution.height > 0) {
 			err = ia_css_isys_convert_stream_format_to_mipi_format(
-				  stream_cfg->metadata_config.data_type,
-				  MIPI_PREDICTOR_NONE,
-				  &fmt_type);
+					stream_cfg->metadata_config.data_type,
+					MIPI_PREDICTOR_NONE,
+					&fmt_type);
 			if (err)
 				rc = false;
 			isys_stream_descr->metadata.fmt_type = fmt_type;
@@ -787,10 +783,11 @@ static bool sh_css_translate_stream_cfg_to_input_system_input_port_attr(
 	return rc;
 }
 
-static bool sh_css_translate_stream_cfg_to_input_system_input_port_resolution(
-    struct ia_css_stream_config *stream_cfg,
-    ia_css_isys_descr_t	*isys_stream_descr,
-    int isys_stream_idx)
+static bool
+sh_css_translate_stream_cfg_to_input_system_input_port_resolution(
+		struct ia_css_stream_config *stream_cfg,
+		ia_css_isys_descr_t *isys_stream_descr,
+		int isys_stream_idx)
 {
 	unsigned int bits_per_subpixel;
 	unsigned int max_subpixels_per_line;
@@ -840,11 +837,11 @@ static bool sh_css_translate_stream_cfg_to_input_system_input_port_resolution(
 	return true;
 }
 
-static bool sh_css_translate_stream_cfg_to_isys_stream_descr(
-    struct ia_css_stream_config *stream_cfg,
-    bool early_polling,
-    ia_css_isys_descr_t	*isys_stream_descr,
-    int isys_stream_idx)
+static bool
+sh_css_translate_stream_cfg_to_isys_stream_descr(struct ia_css_stream_config *stream_cfg,
+						 bool early_polling,
+						 ia_css_isys_descr_t *isys_stream_descr,
+						 int isys_stream_idx)
 {
 	bool rc;
 
@@ -2256,8 +2253,7 @@ alloc_continuous_frames(struct ia_css_pipe *pipe, bool init_time)
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "alloc_continuous_frames() IA_CSS_FRAME_FORMAT_RAW_PACKED\n");
 		ref_info.format = IA_CSS_FRAME_FORMAT_RAW_PACKED;
-	} else
-	{
+	} else {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "alloc_continuous_frames() IA_CSS_FRAME_FORMAT_RAW\n");
 		ref_info.format = IA_CSS_FRAME_FORMAT_RAW;
@@ -7856,8 +7852,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 
 	/* check if mipi size specified */
 	if (stream_config->mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR)
-		if (!IS_ISP2401 || !stream_config->online)
-		{
+		if (!IS_ISP2401 || !stream_config->online) {
 			unsigned int port = (unsigned int)stream_config->source.port.port;
 
 			if (port >= N_MIPI_PORT_ID) {
-- 
2.53.0

