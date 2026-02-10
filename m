Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185D22D46DD
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 11:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770723383; cv=none; b=Uq8u34MIxI/PZMwQkL63lLOyLcZqZ7JyFlrnHRqXx4Yv2KNK8fso2tMBqTd0JAbxDNBOWZMKn/59sIyYyOtJnybehcpDaXcnZcs3Rq6ov82Zlmay5AdENkWFMTx5v7POtCRgSpu1kV6XDfgFBmn8aAfPGZkTlCf6Xw3/yhIewEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770723383; c=relaxed/simple;
	bh=6UZF0hPHXXbabgndO/pADRwx6wnGa8jhCrhXvoluDNU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ose5h0qg6C9VYN4LqSRSN4c82VnuybTEXYLJ4fewG9APPgukIBwcOHfCDN3z6nNUkmHHRHkysyMlN4FFcsXuQJp7uSurO+Dp7Giv91WCPZYT6Syl26zhi73BbK2Dl+rvFuuwQVXIuDSNNrOs+JEhXP76U3GPfQtdBpLhoLSRbQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1o35SIx; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1o35SIx"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-823075fed75so3264900b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 03:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770723381; x=1771328181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2ySLvsFg7TLrIk93eB4lu1hrX+Zw7l/j16aUMMMVV/0=;
        b=Q1o35SIxISN17oPVE1ume9y1mLaebnqz09nmCNExZgXqsvKEe3kYD7c61NMU3d+zRU
         rzbw1oAsn/bYwIWPCYPf+eIutPTcdCFCmJDJb6XFpsGpjBJOK31VeU0a/63h6hvrLvUM
         j8eaIC3EeuF+kgcq6EzcxrLjFWBsIR/wN3Dk3GFB/IXGLtK3blSaqq/2v9Fp3K0x9uNh
         IWexPsMz5XySBI41cnmsyhuTf/G/gPSPBt65s7O4xLx5DFs96BInfM29hjgoB2tqglux
         lmL9vmpi1eiQ+K0/HmIHg3JmDKs3YutmfFLocyWHRduqob2EPec2GsZF6NCr6VKFgP78
         /eiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770723381; x=1771328181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ySLvsFg7TLrIk93eB4lu1hrX+Zw7l/j16aUMMMVV/0=;
        b=WSr62RD6lq7u/eJNH3dESw3dTFRQt2nBvGVayzNudTR0RgnvHsE3Y0NqW0hxeLmjcs
         h/TaRdjoTcmT9mNF3V0vRulFZxyRVbaOtajVYymqptyHgdvMSl7EcCxOMgm4az3dmnSI
         FwzxGXHJEYgLWvt/19vDAAA65g3l90vKofAbewePHnr+SCbmT74fhyqNuvp8XF7hxfJv
         vblMJ9gnNbOS+sE8SZn0S7RJFPK16rbeJ4NOjvV/3J8weP7JwN9OLaurgESpTYUvGuOj
         AO4TmAUkSAQ2Kne8M/KNfLUPDSGMzl7GmHJEirzXRU1OdQ7Y9fTdIIebHKx0Mj/6bxle
         iKBA==
X-Forwarded-Encrypted: i=1; AJvYcCV0E39oFhC3rTMvFtxbutGYh6koYtHtrlRiPv3xRFIUe0KMphtgOd9Q8SYmguxYZAiOmuP1wsH6w32yEXSz@lists.linux.dev
X-Gm-Message-State: AOJu0YzS7wD2GCApTSOAKOnjZTQVgfIXHSpwvisGtNoYq/W4+e048JmU
	Gw8xxl/GNkeA6jRUNOwKDuW858YLHi+pPjyZPKXlSr35CatmgzCTOSvI
X-Gm-Gg: AZuq6aKqXFh6sz43pJGGVw/Swzx0ho7esnPu7SvZOD1r6QJfLYowhdVWdOhAvw7fSsB
	LtVNHIl3bdZuHWegyH1eGkYiwQL/WTV4zRUqsrkabp3DMpCBhwPedhbm/a9tZaTy06ZpJe6wDow
	3lgtRZCLtIPyeMI15OjSYDWbvyvDoF70NJkrCN1OgiJFkMjE/xeSe0H9pm02ttLtK/T5rLXI9Gv
	kpgjvt3j9uin3lj5tEXGeGCnYkSe43wGP7ndQyqyfGrn9FBUqmbwczW7GoELvxQ44/AAEtg7Idn
	VwmNVFkH8VIz+DqQdJH/LPbjEfUinCFOX7sOR6L1Sec5f/HvXa/NUVB/AgDreB7mK7bpN2p3FkR
	JTNpEBolrG6fhQCfonp99sjvoUBDGqlPgW8hXHD1Qdb0UVTFUrf+AQQDQBG7dODI0q/qKLYBlbk
	EHK1WRfrbDJ7H9Bi+jx51fLcI=
X-Received: by 2002:a05:6a00:e13:b0:81e:f280:f341 with SMTP id d2e1a72fcca58-824873ca992mr2256942b3a.6.1770723381341;
        Tue, 10 Feb 2026 03:36:21 -0800 (PST)
Received: from deadibone.. ([118.141.233.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82441884b75sm14671935b3a.39.2026.02.10.03.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 03:36:21 -0800 (PST)
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
Subject: [PATCH v3] staging: media: atomisp: fix block comment style
Date: Tue, 10 Feb 2026 19:35:57 +0800
Message-ID: <20260210113557.71677-1-ethanlxkernel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed all block comment style warnings by checkpatch.pl.
Kept original indentation in comments (requested by Andy Shevchenko)

Signed-off-by: Ethan Lam <ethanlxkernel@gmail.com>
---
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

