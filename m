Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0C23EAC80
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 12:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944556; cv=none; b=iQUACgSG6mxG+mvbz+Oxq40J2vw2WkxCDGVI93ayV1TgpNsjMVOOZAbvskKMIvHiwHNWjrKD5mIzaFu7se8yZ86JFLIYWSmVLRUBPYymsDcoUw5uUZjwJ+k9Dba/IDk6vciqWYVUBWTY29CJPKOXP80bN8wHA2SdcItI5jH9rbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944556; c=relaxed/simple;
	bh=N3uewV9p1wEkq7IBGmE047BkMIsp0re4khks6TNRAIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q2yWIVYLpeybW19vkmP4mvlwOleKg6Gxx9ASABuNyeJierOv3ZeeIjw5gNIq/xH3rDXrAx9zonksHFbQv2kYfuz9dY19Qfi75x3mGmQmJRcjIigkh/RarSdwxZUJAemB4VvjQyDQRLhOwuERw3e+dAuMIJBd2ggIH7caonza9Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Okvr2UsM; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Okvr2UsM"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-384c94c9414so2757188a91.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 05:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944554; x=1784549354; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O9YYyee56RYzJH/7lhC6WY6QS3lP6Hx70/PxBzEZ1WM=;
        b=Okvr2UsMKQS/irspO4cbyuFd3qy8RzbFSn9sMWF2lgnXF6Lj1x5QoI5dYtRZyq3lWl
         YUUxzW5XCjUk1oK48zdCZhZL3MtInN4dG9S//tOEM7ZgcWKdhI0Wh8on7PlBx5avCiNz
         yc38i3Mh8ayya4miJlWXnr0C65ZtGeQ++C8PY93IXfBslJdpNegzC61TCoIOdZ5rveLC
         HSZkyxv+bW8BOia/jia44r1ecnRZOsFhPQpbX/BAe9V+HCAgzAWkecfo74VAoZ0eLMQS
         +RExi7sFR8jLQhVMkJdS7GkKJ8rSTNYFDYWUnBjVKORCRtAmXmlA/NyKAcSVzp9lzpMp
         /HUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944554; x=1784549354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O9YYyee56RYzJH/7lhC6WY6QS3lP6Hx70/PxBzEZ1WM=;
        b=NoQim4CkQKQrhzmNsAxqsmLJ84FX4n4sKAdcEIWNg0Bn2sqp57It0XrD1x/Q6jS/0g
         Rpfpy7Ii3zXgb0hP2xADPmj3+aoDDX0tCJGO0K1W9KTnaeR/tzbRtf9WNvQBcA/lhHvo
         2ltktYDa3HkmsdZ5//lIFkNdxUtljJm+VP2CgGfjcy1JddEfi7lfgi+buMcvkcormIGz
         uZiW+f20LQLWnjRcPF50mjQ+Wp8QSymasTgPtICakO0wobxkzATDjndlmYb3b+0R21bp
         G/3v5kWYEI98gqtm5RdzveaHCx637AGxh8TpkFQvaF0eaeuibtZB1NIIS7CrZNVRcChh
         d8wA==
X-Forwarded-Encrypted: i=1; AHgh+RoGfKeNvqEJekSdGeYKSy1/FmAF6yivlkl3Y3iBRImC/KJ5pkkfUydLkZMznAQnhpsaFZxDccMuLLhEpWAL@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+xweykqF3e+kynQHQAN7iFRFYSPSFDbJIsV+lHMSj2hv7kmzo
	JpGBdo5pcAJTB+wOLRgHC6X/0MPXnDc0SE1wnuWOi0n6tazBWVv8pON6
X-Gm-Gg: AfdE7ckNIpO4tRzyjoAdl2y0JlmKU7K5pHBjzKlKGcTgMer4ehuVQcjPpsY3lPVVPB9
	8gZbvAs/nY5IFRKgJIvT4f2uUuKCy9LLeUuZHe+//XlagTr5/k5ATQsSVslW/jIdFmNm+4SKIip
	pFeWE7MiMEd61o/YeGp5usFZvbWFnYobcOH7J5Yrnn3iYkNt+LL0s1J8Aum/J1NCJ0bhY+MJkMV
	3WOJPNFiLfhmYRngXcaesH1oaVfqwN5yr8cYfRR/sFNke25jihaoZX1t7qLz8nYGVFLZwtG5r5Q
	NARGZcbSt5HDKXkyaMzirUkO5w0N9QJhaw3QAvvpADVp0D7MtEYS6tEBAYyl0f/Q1JmDgHzDfsY
	1/9FQertyCIG/nAoLxMeLElyLtMRNOLQe3adwkirDQdme4Ma3ftIFxgsCWJ5laAagkkAIfoCppU
	Zf0yZYiFGWnRCDKuLS8zM2
X-Received: by 2002:a17:90b:58f0:b0:387:e0db:bc23 with SMTP id 98e67ed59e1d1-38dc77b82bemr9015022a91.35.1783944553867;
        Mon, 13 Jul 2026 05:09:13 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:09:13 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Doruk Tan Ozturk <doruk@0sec.ai>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v7 02/19] media: meson: vdec: Fix STREAMON / STREAMOFF race conditions and session teardown
Date: Mon, 13 Jul 2026 17:36:57 +0530
Message-ID: <20260713120840.17427-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vdec driver suffered from unsafe state transitions and race
conditions when handling concurrent STREAMON / STREAMOFF calls and
dynamic resolution change (DRC) events. Global context pointers
(e.g. core->cur_sess) and session status flags were updated outside
proper lock boundaries, allowing parallel threads to corrupt hardware
state under load.

Address these architectural stability flaws with the following changes:

1. In vdec_start_streaming(), safely encapsulate hardware occupancy
   evaluations and target session context claims within a secure mutex
   lock (core->lock). This blocks overlapping multi-threaded STREAMON
   calls from creating concurrent assignment conflicts.

2. Restructure initialization error path handlers to avoid global memory
   maps cross-contamination. Segregate buffer flushes cleanly based
   strictly on the active vb2 queue type (OUTPUT vs CAPTURE) to avoid
   incorrectly reclaiming undecoded ready blocks.

3. In vdec_stop_streaming(), introduce state-aware tracking to
   accurately identify DRC conditions. If a resolution modification
   forces a capture queue reset while the output stream is still live,
   preserve the driver's inner runtime states and bypass premature
   hardware power-off sweeps.

4. Enforce strict null-pointer safety limits inside DMA unmapping
   sequences. Explicitly clear tracking metadata entries
   (sess->vififo_vaddr = NULL) inside the VIFIFO freeing routines to
   neutralize accidental double-free risks.

Together these changes harden the driver against concurrency bugs,
eliminate memory leaks, and ensure predictable session lifecycle
management under multi threaded workloads.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260530100841.9CEBA1F00893@smtp.kernel.org/
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 136 +++++++++++++++++-------
 1 file changed, 95 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 6ae3471155a87..d1f35fc893de1 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -286,11 +286,6 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	struct vb2_v4l2_buffer *buf;
 	int ret;
 
-	if (core->cur_sess && core->cur_sess != sess) {
-		ret = -EBUSY;
-		goto bufs_done;
-	}
-
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		sess->streamon_out = 1;
 	else
@@ -308,9 +303,29 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	}
 
 	if (sess->status == STATUS_RUNNING ||
-	    sess->status == STATUS_NEEDS_RESUME ||
-	    sess->status == STATUS_INIT)
+	    sess->status == STATUS_NEEDS_RESUME)
+		return 0;
+
+	/*
+	 * Secure the core hardware lock before checking availability
+	 * and updating session states to prevent STREAMON race conditions.
+	 */
+	mutex_lock(&core->lock);
+	if (core->cur_sess && core->cur_sess != sess) {
+		ret = -EBUSY;
+		mutex_unlock(&core->lock);
+		goto err_unlock_no_hw;
+	}
+
+	/* If already half-initialized, do not re-initialize */
+	if (sess->status == STATUS_INIT) {
+		mutex_unlock(&core->lock);
 		return 0;
+	}
+
+	sess->status = STATUS_INIT;
+	core->cur_sess = sess;
+	mutex_unlock(&core->lock);
 
 	sess->vififo_size = SIZE_VIFIFO;
 	sess->vififo_vaddr =
@@ -319,7 +334,7 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	if (!sess->vififo_vaddr) {
 		dev_err(sess->core->dev, "Failed to request VIFIFO buffer\n");
 		ret = -ENOMEM;
-		goto bufs_done;
+		goto err_cleanup_session;
 	}
 
 	sess->should_stop = 0;
@@ -333,33 +348,43 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 
 	ret = vdec_poweron(sess);
 	if (ret)
-		goto vififo_free;
+		goto err_free_vififo;
 
 	sess->sequence_cap = 0;
 	sess->sequence_out = 0;
+
 	if (vdec_codec_needs_recycle(sess))
 		sess->recycle_thread = kthread_run(vdec_recycle_thread, sess,
 						   "vdec_recycle");
 
-	sess->status = STATUS_INIT;
-	core->cur_sess = sess;
 	schedule_work(&sess->esparser_queue_work);
 	return 0;
 
-vififo_free:
-	dma_free_coherent(sess->core->dev, sess->vififo_size,
-			  sess->vififo_vaddr, sess->vififo_paddr);
-bufs_done:
-	while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
-		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
-	while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
-		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
-
+err_free_vififo:
+	if (sess->vififo_vaddr) {
+		dma_free_coherent(sess->core->dev, sess->vififo_size,
+				  sess->vififo_vaddr, sess->vififo_paddr);
+		sess->vififo_vaddr = NULL;
+		sess->vififo_paddr = 0;
+	}
+err_cleanup_session:
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		sess->streamon_out = 0;
 	else
 		sess->streamon_cap = 0;
 
+	mutex_lock(&core->lock);
+	if (core->cur_sess == sess)
+		core->cur_sess = NULL;
+	if (sess->status != STATUS_NEEDS_RESUME)
+		sess->status = STATUS_STOPPED;
+	mutex_unlock(&core->lock);
+err_unlock_no_hw:
+	while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
+		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
+	while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
+		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
+
 	return ret;
 }
 
@@ -399,30 +424,13 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 	struct amvdec_codec_ops *codec_ops = sess->fmt_out->codec_ops;
 	struct amvdec_core *core = sess->core;
 	struct vb2_v4l2_buffer *buf;
+	enum amvdec_status old_status;
+	bool full_cleanup = false;
 
-	if (sess->status == STATUS_RUNNING ||
-	    sess->status == STATUS_INIT ||
-	    (sess->status == STATUS_NEEDS_RESUME &&
-	     (!sess->streamon_out || !sess->streamon_cap))) {
-		if (vdec_codec_needs_recycle(sess))
-			kthread_stop(sess->recycle_thread);
-
-		vdec_poweroff(sess);
-		vdec_free_canvas(sess);
-		dma_free_coherent(sess->core->dev, sess->vififo_size,
-				  sess->vififo_vaddr, sess->vififo_paddr);
-		vdec_reset_timestamps(sess);
-		vdec_reset_bufs_recycle(sess);
-		kfree(sess->priv);
-		sess->priv = NULL;
-		core->cur_sess = NULL;
-		sess->status = STATUS_STOPPED;
-	}
-
+	/* flush buffers to kill background workqueue thread */
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
 			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
-
 		sess->streamon_out = 0;
 	} else {
 		/* Drain remaining refs if was still running */
@@ -431,9 +439,55 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 
 		while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
 			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
-
 		sess->streamon_cap = 0;
 	}
+
+	/* Hold core lock continuously for the state and resource processing */
+	mutex_lock(&core->lock);
+	old_status = sess->status;
+
+	if (old_status == STATUS_RUNNING || old_status == STATUS_INIT ||
+	    (old_status == STATUS_NEEDS_RESUME && (!sess->streamon_out ||
+						   !sess->streamon_cap))) {
+		/*
+		 * If it's a DRC event (Capture queue streamoff only), preserve
+		 * the status
+		 */
+		if (old_status == STATUS_NEEDS_RESUME && sess->streamon_out) {
+			full_cleanup = false;
+		} else {
+			full_cleanup = true;
+			sess->status = STATUS_STOPPED;
+		}
+	}
+
+	if (full_cleanup) {
+		if ((q->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
+		     !sess->streamon_out) && vdec_codec_needs_recycle(sess)) {
+			kthread_stop(sess->recycle_thread);
+		}
+
+		vdec_poweroff(sess);
+		vdec_free_canvas(sess);
+
+		if (sess->vififo_vaddr) {
+			dma_free_coherent(sess->core->dev, sess->vififo_size,
+					  sess->vififo_vaddr, sess->vififo_paddr);
+			sess->vififo_vaddr = NULL;
+			sess->vififo_paddr = 0;
+		}
+
+		vdec_reset_timestamps(sess);
+		vdec_reset_bufs_recycle(sess);
+		core->cur_sess = NULL;
+
+		kfree(sess->priv);
+		sess->priv = NULL;
+	} else {
+		if (sess->status == STATUS_NEEDS_RESUME)
+			sess->changed_format = 0;
+	}
+	mutex_unlock(&core->lock);
 }
 
 static int vdec_vb2_buf_prepare(struct vb2_buffer *vb)
-- 
2.50.1

