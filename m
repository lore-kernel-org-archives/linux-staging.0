Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043DF361660
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 12:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772454966; cv=none; b=Qz9V+dzvTccKY0+I1Jb84aYqhqpAMgr9hrtVqpgn3B48Vo+h56S3vEeCpxhyQiDEq7B5vdtiUs64lux1BwO4UtrIHIEmcDtW9XFVPlVnuop8M/fdn9eKQ/Zh1jyneKh3vUId8sCzKXh6Z9d4XOUNcpynQGcmhjfoUaj8uMLZPWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772454966; c=relaxed/simple;
	bh=WjN5TzoQv+xWU7Skq9M9Zm1RgZ2z6sPgG98q3ldmFL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DmG5WzpnElHm7+u0eLClS/3Ku2WiM3HSxvBH8dW/Dqa/VK1gHAZd8aAlvTQRP7Nmz6Glwc3J3m7/Ev6lklbJmzcOaV7rhwbwURhhvZNQwmuGp7gcGhk5LEbMVOmRcOv3tG5iufVebldN8Ic3REnw1Wu3wSxziIaZt4eO17KKfp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9eCqqDP; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9eCqqDP"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-824ac5d28f9so4466344b3a.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 04:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772454964; x=1773059764; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iJO6abKpVzoD+V+e3XRskwGj2DBwgjX9SQo0wFCYDds=;
        b=f9eCqqDPJU6374BTkAZkOhkt762r3M+fV5BGTxe4fH7xfddaUp7VNivyG92JdGCsKq
         1rprvLrr0mkmFmWwwHcc3TVqdsjiYBGyo43hEsyfxaCdzMCiUSiVjlPtCWobPgNODiVV
         cJLIX1VGHCCSuxsPspUNFJkT01tvQX2TH98QeL/m/ei7QLBvp0ddlnVSNJsbQZgSqNxl
         NP7LLT3ZhN+7JMADKI9easstHssOoX+FxhQ06QmtWnbgaGPSoBp/ghwKCV535vlBzZG3
         83S24CnHnzT+Enes9b9jmXRuV7EuPcvNfXO/TK6o8hrYIAXojcBkjFq1Bc7s5nAn5jcP
         xvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772454964; x=1773059764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJO6abKpVzoD+V+e3XRskwGj2DBwgjX9SQo0wFCYDds=;
        b=wFNRTyPVFYqTNPUtSHfBHH0w6faDXZtdlrAvMPuAFVF9CNRu8VIpMTbpufQvX5wnTl
         YTVmAecC8B2a14GKCYf/ofGCUsVUjVZdFXParkA3Vd/F1uUmZGm1qdskkIizPXTb/OaN
         mXraQbLUIIwTtHYFVcASIissuVQWkYhZEKO9GbMm8AWzoTNITDb/enDVklrrcQtqrxfq
         hoM2iz7sGxA392wnpijBaiP2Le8FJ4DgX5UtN+2QlNHeaKWCeCkaqhQgOKxI5ojFhoJe
         7OsbeUPKUgqTYQe1DJlQYbIFCQW4+6t/mtHtL+2nNx9rQ1X2soOFyZ5okDaUXC9vB0eF
         0Q6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVrLB+xY7VmyXqAulGjTQ+EEfJQVdUGXTmysS3LsZQN3oceChB7vgpOqjQB6Asz25SVyKdKUjHsPsm6GjS@lists.linux.dev
X-Gm-Message-State: AOJu0YysKFYxxLc9WXcX6KnCXe2JCI9b5tQA1bhx12sj/XyjfxMHNP2W
	+5qbPIFkEJqSjXbH9AjSnXkLt0nJ/WEXWAwrWfSLW1o56MsKI3mdXWWRgqsUD9690eMncQ==
X-Gm-Gg: ATEYQzyZtKD8S+W1YLpTqvbwLv0ZqZQed/kY69Zj3r4xmW8Ww5I1T+YaAzi6sZtlddN
	3he2CzBHtjfLk/9iqCtyAKkGPe0+XsZq6DNHxa6R1YlYNdsdo4/a3ZacmjvdA4blBxUZCDD1n26
	H/ARzNP8YkKfraxZb8J7wVZGQPkTkEMhkBapMpe/qfKFpEJhNutfOhdaF6L4nGTAIefO6kH9/b2
	Ef94AVRfM14ZZjLgkeXEztPzx58U1/gssVpjveyYx8V8CZTmtd66/wfI81bTaYjEnnHillRx2O0
	4H6reI0PvvKTm7wblpN6ML4ClHMZHzh4hZPQGhyo6ee/y50R/sQzuSawU7GanjehBzp8uRArA8k
	pS+FfSDLc1QWm+WLVwINESho6TZa/k55ORdMzezKCLOo9tUNqu+ONLRnzqoe5g8AwfI2leHdGNC
	a7eWtJGuKbAWxCqU5zXu9a1uYlDdWdfSlIpVKyzLc=
X-Received: by 2002:a05:6a00:94c1:b0:824:93df:6d86 with SMTP id d2e1a72fcca58-8274d9f5b74mr9260840b3a.50.1772454964264;
        Mon, 02 Mar 2026 04:36:04 -0800 (PST)
Received: from deadibone.. ([118.141.233.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a0571acsm13288323b3a.55.2026.03.02.04.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 04:36:03 -0800 (PST)
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
Subject: [PATCH v4] staging: media: atomisp: fix block comment style in atomisp_cmd.c
Date: Mon,  2 Mar 2026 20:35:47 +0800
Message-ID: <20260302123548.24663-1-ethanlxkernel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix block comment style warnings reported by checkpatch.pl in atomisp_cmd.c.

Signed-off-by: Ethan Lam <ethanlxkernel@gmail.com>
---
Changes in v4:
 - Rephrased commit message to fit the documentation's guidelines.
 - Updated subject line to clarify the patch only applies to atomisp_cmd.c.

Changes in v3:
 - Preserved original indentation within comments to avoid breaking
   lists and code examples.
 - Restored dev_dbg() lines that were accidentally removed in v2.

Changes in v2:
 - Added period to the end of the commit message.
 - Fixed missed block comment style warnings in atomisp_cmd.c.

Changes in v1:
 - Initial patch to fix block comment style warnings in atomisp_cmd.c.

 .../staging/media/atomisp/pci/atomisp_cmd.c   | 60 ++++++++++++-------
 1 file changed, 39 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 3a4eb4f6d3be..c67fa4cc3f06 100644
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
@@ -1393,8 +1395,10 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
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
@@ -1686,9 +1690,11 @@ int atomisp_3a_stat(struct atomisp_sub_device *asd, int flag,
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
 
@@ -2462,9 +2468,11 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
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
 
@@ -3028,9 +3036,11 @@ int atomisp_param(struct atomisp_sub_device *asd, int flag,
 
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
@@ -3280,8 +3290,10 @@ atomisp_bytesperline_to_padded_width(unsigned int bytesperline,
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
@@ -3317,9 +3329,11 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
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
@@ -3928,8 +3942,10 @@ static inline int atomisp_set_sensor_mipi_to_isp(
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
 
@@ -4387,8 +4403,10 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
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

