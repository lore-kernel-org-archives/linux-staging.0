Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CF8274658
	for <linux-staging@lists.linux.dev>; Sun,  4 Jan 2026 16:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767544861; cv=none; b=cIBDIDfeidWmj09tYWPjdem1ADw/bv7vDk4+N47m0Eizupu/X4LnaIoGSHos0HIePY6JFN1GfLMG1WVaXWatYgUQN48txn9a8zBeIiTz2fzrq8FkKRnCyVV6Cexj2a25p9bxDAyT2UprnYKWwZMvJebOIIe9ZcKgW3BO0+QPHWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767544861; c=relaxed/simple;
	bh=k53koRSntlun2LVw5JaRvIyqbv0ckrOPfN5URiiCN6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gs5B1Cf5vWh0XGTFbPZ6vEugQQrkPm79zxYOrwV1Y50kHalc9u0Hem2OQJakXcCR08C/zmsXIMRxTt2KN0rF/Zf+pacd7P53jDhwaAfi6KUZYM+l3ONiZIV3cL3eWm2KjTtuYv6dJf/4xaxVavgN5dzpnLN/87skRRq7h7N9nu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQmTPDjZ; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQmTPDjZ"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7f121c00dedso17741789b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 04 Jan 2026 08:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767544859; x=1768149659; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ValU0jfB+Ih7l4plfULIl8u7AO5mD9dRY4CULizC5OM=;
        b=kQmTPDjZiEcSw1vZ1ysaOMrC7ZBaS7W7wFPaUu2fPcO+YRhk2CRoC+rtFO1kV6Z/Ql
         XcuipQ21+m7fgpfVmVQwn7jf8uFr5XNv+HRdgSjs3nGKNaicB/73o/NHaQJ0rewKtuS8
         neG2T2rkXdwNTTUHR0+R3G9aaJ3CVONTTuKsDm6XIFdpe3TzMgMxAPT9Ws0+438PbzK/
         83lUtsj6g9Leq6XX/ekCaVF1hOMwuEO9QIZOe0ezbqsQQJXZt+TxAQkk7LTz/JBtNNbF
         V9KVfQckbZoLmwWMF2b2Qsi5CY1INC3v/drxTVB6mSZa0zgB1283jljWiuYJ+xlwb+G6
         FW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767544859; x=1768149659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ValU0jfB+Ih7l4plfULIl8u7AO5mD9dRY4CULizC5OM=;
        b=D9XBOypTYmA7iVM+YJVr7dn3VPPn6n6+dX1/pYGCT6xjW+khooZXgRVVu5EdvUXSC4
         trEDpTbeb+FO4M4dWSzqZjyogh+XotH/5YpVKh32Dis59MeGHO7lahUsH0BVszdnyLF/
         yzC3H4k1GRxYv7yP+N8HqGFBURlMTh0G5guJX5tB+F3OAmlD8n1+s3jUHBHCfo7MXJ4R
         5d4BaXu+9Q5p4gMBage1hl9O/Z6ueYQnOuCERu6lAIqS+awYKQIPLXei897GrqIDn8fi
         E2cO5+EpqEx1Oye83CRJvE3ZST7RQuuvKwJWRWeHSQjAmAMKBeMgnMhYOJF9invynVLz
         JAXA==
X-Forwarded-Encrypted: i=1; AJvYcCVLpoHQFvi1NS+rcbL33jsL7NVYnoeYu3Wj45kagzCu+ZlNNTeoSpkcn//HzhO/d8TM43wgExYt2eOWWq8M@lists.linux.dev
X-Gm-Message-State: AOJu0YymufdCfKbMMCkDmI2+NptBWAcwC7muWQBmOFwph0mX1Pe7IiSb
	71HlPGOhcr3g59ZiMbb4cdyX8d9Ido4LEl8HQc/lSVeHwRJj/t8hIHgj
X-Gm-Gg: AY/fxX5DZbiXPse6uYhbuOBG6iIFNVx1TQXvGja6XsiHhpvFm8nCM45mhy2Er4dOgy0
	8x0abfWA52q9ptaV6cETt3E9SlK1/0g10el43ajmbdIX72PbARk8P1HB6VWn9/nJdJ8uYx4cA1I
	GNwwQ6cF7bxO5optZyiYa0Ea22Co7i/Pkkn0klflWqYKnueq4vomaQA1MHGtfsoFYMbV6uR1oYn
	8+chXLKF7zgB+EzQFcsecYRaWwQ7TL5tPFKA8oL5+YbqbRnLBpcGmmyHeNDBQ5Mqx9mpIKhxT8C
	OKuT5U68pE6bvAxizlncEJQ6BBK/vf05qRPulv2Zznx/Ca6R35xWSaCGT+sjzmFhqesrqghMCVb
	TX6KzrQZsjVCCS0gFeoWhU85MvdyvCVIAHP4jWC7Zc2PDe2YP+827JesLck7aEOcP9cIZPJVQqD
	ybRK3zU7yUtMtmig9iqfiYUg==
X-Google-Smtp-Source: AGHT+IEgjVWJw7E4o4I8dCUB6c5x0fXBP6717aIN4dFWRLq7pV8GPO8SjyBk3kdeQttASAYwBpBi0g==
X-Received: by 2002:a05:6a20:2450:b0:364:144a:d21c with SMTP id adf61e73a8af0-376a8cbe311mr42600076637.26.1767544858622;
        Sun, 04 Jan 2026 08:40:58 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f45be4a21sm2581375a91.1.2026.01.04.08.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 08:40:58 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH] media: atomisp: replace shadow zoom structs with v4l2_rect and fix error paths
Date: Sun,  4 Jan 2026 22:10:37 +0530
Message-ID: <20260104164037.18176-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch addresses a TODO graduation blocker by removing private zoom
structures (`atomisp_zoom_point` and `atomisp_zoom_region`) in favor of
standard V4L2 types (`v4l2_rect`).

It also improves error propagation for IRQs and XNR configuration, ensuring
that failures are detected and reported. Additionally, it consolidates
memory allocation boilerplate into a safer helper function
(`atomisp_alloc_stat_bufs_list`) that includes a proper error-unwind path
to prevent memory leaks during partial allocation failures.

Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
---
 .../media/atomisp/include/linux/atomisp.h     |  19 +--
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 144 ++++++++---------
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 147 +++++++++++++-----
 3 files changed, 183 insertions(+), 127 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index fcf116cc4..e86f636d2 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -326,27 +326,14 @@ struct atomisp_resolution {
 	u32 height; /** Height */
 };
 
-/*
- * This specifies the coordinates (x,y)
- */
-struct atomisp_zoom_point {
-	s32 x; /** x coordinate */
-	s32 y; /** y coordinate */
-};
+#include <linux/videodev2.h>
 
-/*
- * This specifies the region
- */
-struct atomisp_zoom_region {
-	struct atomisp_zoom_point
-		origin; /* Starting point coordinates for the region */
-	struct atomisp_resolution resolution; /* Region resolution */
-};
+/* Use v4l2_rect instead of shadow structures */
 
 struct atomisp_dz_config {
 	u32 dx; /** Horizontal zoom factor */
 	u32 dy; /** Vertical zoom factor */
-	struct atomisp_zoom_region zoom_region; /** region for zoom */
+	struct v4l2_rect zoom_region; /** region for zoom */
 };
 
 struct atomisp_parm {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 327836372..76a65f379 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -874,7 +874,9 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 	if (!isp->asd.streaming)
 		goto out_unlock;
 
-	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false);
+	if (atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF,
+				   false))
+		dev_err_once(isp->dev, "atomisp_css_irq_enable failed\n");
 
 	spin_lock_irqsave(&isp->lock, flags);
 	isp->asd.streaming = false;
@@ -925,8 +927,9 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 
 	atomisp_csi2_configure(&isp->asd);
 
-	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF,
-			       atomisp_css_valid_sof(isp));
+	if (atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF,
+				   atomisp_css_valid_sof(isp)))
+		dev_err_once(isp->dev, "atomisp_css_irq_enable failed\n");
 
 	if (atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_AUTO, true) < 0)
 		dev_dbg(isp->dev, "DFS auto failed while recovering!\n");
@@ -1196,9 +1199,7 @@ int atomisp_xnr(struct atomisp_sub_device *asd, int flag,
 		return 0;
 	}
 
-	atomisp_css_capture_enable_xnr(asd, !!*xnr_enable);
-
-	return 0;
+	return atomisp_css_capture_enable_xnr(asd, !!*xnr_enable);
 }
 
 /*
@@ -1764,15 +1765,13 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
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
 
@@ -1783,18 +1782,18 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
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
@@ -1821,62 +1820,67 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
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
+				dz_config->zoom_region.left =
+					dz_config->zoom_region.left - w_offset;
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
 
@@ -1901,10 +1905,10 @@ static bool atomisp_check_zoom_region(
 
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
@@ -1912,10 +1916,10 @@ static bool atomisp_check_zoom_region(
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
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 5c0a1d92b..bb277f5a3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -678,13 +678,104 @@ static int atomisp_g_fmt_cap(struct file *file, void *fh,
 	return atomisp_try_fmt_cap(file, fh, f);
 }
 
+static int atomisp_alloc_stat_bufs_list(struct atomisp_sub_device *asd,
+					u16 stream_id,
+					struct list_head *head,
+					int count,
+					int type)
+{
+	struct atomisp_s3a_buf *s3a_buf;
+	struct atomisp_dis_buf *dis_buf;
+	struct atomisp_metadata_buf *md_buf;
+	int ret;
+
+	while (count--) {
+		switch (type) {
+		case IA_CSS_BUFFER_TYPE_3A_STATISTICS:
+			s3a_buf = kzalloc(sizeof(*s3a_buf), GFP_KERNEL);
+			if (!s3a_buf)
+				goto error;
+
+			ret = atomisp_css_allocate_stat_buffers(asd, stream_id,
+								s3a_buf, NULL,
+								NULL);
+			if (ret) {
+				kfree(s3a_buf);
+				goto error;
+			}
+			list_add_tail(&s3a_buf->list, head);
+			break;
+		case IA_CSS_BUFFER_TYPE_DIS_STATISTICS:
+			dis_buf = kzalloc(sizeof(*dis_buf), GFP_KERNEL);
+			if (!dis_buf)
+				goto error;
+
+			ret = atomisp_css_allocate_stat_buffers(asd, stream_id,
+								NULL, dis_buf,
+								NULL);
+			if (ret) {
+				kfree(dis_buf);
+				goto error;
+			}
+			list_add_tail(&dis_buf->list, head);
+			break;
+		case IA_CSS_BUFFER_TYPE_METADATA:
+			md_buf = kzalloc(sizeof(*md_buf), GFP_KERNEL);
+			if (!md_buf)
+				goto error;
+
+			ret = atomisp_css_allocate_stat_buffers(asd, stream_id,
+								NULL, NULL,
+								md_buf);
+			if (ret) {
+				kfree(md_buf);
+				goto error;
+			}
+			list_add_tail(&md_buf->list, head);
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+
+error:
+	while (!list_empty(head)) {
+		switch (type) {
+		case IA_CSS_BUFFER_TYPE_3A_STATISTICS:
+			s3a_buf = list_entry(head->next,
+					     struct atomisp_s3a_buf, list);
+			atomisp_css_free_3a_buffer(s3a_buf);
+			list_del(&s3a_buf->list);
+			kfree(s3a_buf);
+			break;
+		case IA_CSS_BUFFER_TYPE_DIS_STATISTICS:
+			dis_buf = list_entry(head->next,
+					     struct atomisp_dis_buf, list);
+			atomisp_css_free_dis_buffer(dis_buf);
+			list_del(&dis_buf->list);
+			kfree(dis_buf);
+			break;
+		case IA_CSS_BUFFER_TYPE_METADATA:
+			md_buf = list_entry(head->next,
+					    struct atomisp_metadata_buf, list);
+			atomisp_css_free_metadata_buffer(md_buf);
+			list_del(&md_buf->list);
+			kfree(md_buf);
+			break;
+		}
+	}
+	return -ENOMEM;
+}
+
 int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
 				uint16_t stream_id)
 {
 	struct atomisp_device *isp = asd->isp;
-	struct atomisp_s3a_buf *s3a_buf = NULL, *_s3a_buf;
-	struct atomisp_dis_buf *dis_buf = NULL, *_dis_buf;
-	struct atomisp_metadata_buf *md_buf = NULL, *_md_buf;
+	struct atomisp_dis_buf *dis_buf, *_dis_buf;
+	struct atomisp_s3a_buf *s3a_buf, *_s3a_buf;
+	struct atomisp_metadata_buf *md_buf, *_md_buf;
 	int count;
 	struct ia_css_dvs_grid_info *dvs_grid_info =
 	    atomisp_css_get_dvs_grid_info(&asd->params.curr_grid_info);
@@ -695,37 +786,20 @@ int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
 		count = ATOMISP_CSS_Q_DEPTH +
 			ATOMISP_S3A_BUF_QUEUE_DEPTH_FOR_HAL;
 		dev_dbg(isp->dev, "allocating %d 3a buffers\n", count);
-		while (count--) {
-			s3a_buf = kzalloc(sizeof(struct atomisp_s3a_buf), GFP_KERNEL);
-			if (!s3a_buf)
-				goto error;
-
-			if (atomisp_css_allocate_stat_buffers(
-				asd, stream_id, s3a_buf, NULL, NULL)) {
-				kfree(s3a_buf);
-				goto error;
-			}
-
-			list_add_tail(&s3a_buf->list, &asd->s3a_stats);
-		}
+		if (atomisp_alloc_stat_bufs_list(asd, stream_id,
+						 &asd->s3a_stats, count,
+						 IA_CSS_BUFFER_TYPE_3A_STATISTICS))
+			goto error;
 	}
 
 	if (list_empty(&asd->dis_stats) && dvs_grid_info &&
 	    dvs_grid_info->enable) {
 		count = ATOMISP_CSS_Q_DEPTH + 1;
 		dev_dbg(isp->dev, "allocating %d dis buffers\n", count);
-		while (count--) {
-			dis_buf = kzalloc(sizeof(struct atomisp_dis_buf), GFP_KERNEL);
-			if (!dis_buf)
-				goto error;
-			if (atomisp_css_allocate_stat_buffers(
-				asd, stream_id, NULL, dis_buf, NULL)) {
-				kfree(dis_buf);
-				goto error;
-			}
-
-			list_add_tail(&dis_buf->list, &asd->dis_stats);
-		}
+		if (atomisp_alloc_stat_bufs_list(asd, stream_id,
+						 &asd->dis_stats, count,
+						 IA_CSS_BUFFER_TYPE_DIS_STATISTICS))
+			goto error;
 	}
 
 	for (i = 0; i < ATOMISP_METADATA_TYPE_NUM; i++) {
@@ -736,19 +810,10 @@ int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
 				ATOMISP_METADATA_QUEUE_DEPTH_FOR_HAL;
 			dev_dbg(isp->dev, "allocating %d metadata buffers for type %d\n",
 				count, i);
-			while (count--) {
-				md_buf = kzalloc(sizeof(struct atomisp_metadata_buf),
-						 GFP_KERNEL);
-				if (!md_buf)
-					goto error;
-
-				if (atomisp_css_allocate_stat_buffers(
-					asd, stream_id, NULL, NULL, md_buf)) {
-					kfree(md_buf);
-					goto error;
-				}
-				list_add_tail(&md_buf->list, &asd->metadata[i]);
-			}
+			if (atomisp_alloc_stat_bufs_list(asd, stream_id,
+							 &asd->metadata[i], count,
+							 IA_CSS_BUFFER_TYPE_METADATA))
+				goto error;
 		}
 	}
 	return 0;
-- 
2.43.0

