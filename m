Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BCF36920C
	for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 09:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780134264; cv=none; b=QwqcPutQy09Gcj9cqkp/8Td/kn8o5nwtTb+/fg4nuAs0zx7V4ffailjN9a10yddnkmr9UxeakoPFIfqk126R/b1mY0nOCi4L9+YjHcURdd7UA6cKHjbEQtp6GfVVPriaJc5zdlQd6fsz8HTSQIjCOSIRGT5RMn7W6otl7So0qCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780134264; c=relaxed/simple;
	bh=G9B1EJrVgntwzA18R6iCzm5tNIqmGP+wgdzFWEsJR3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MzbnogA5YNkEtHpXScprosrwH/hjIyr937vy3Xp/D2sxbHcR2P5V7uNKDXP/KRfR8qLpp1LpOTfVeOHlraNaeUgEtSwxlja0ZGFEb58FMI4nHuMG99G6X/YWKt4UBkF9q0Nu8l1U6p+ucI2YTCHfs3J0ZBvd3W2fsaDVAKmsq54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tElBxSB5; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tElBxSB5"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bf0ddaf50fso14989465ad.1
        for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 02:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134263; x=1780739063; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YD6axKKp8wDht90VyqGQ3zjwLyfLDF+g7zoFDStjFGA=;
        b=tElBxSB5+VPCsD3A108uBz+TOA++QXPAmOdjHFsHqv8Zyh/ZDjuUnVCemlCk3p6In7
         a7Ao2KDrq+M9MvTsQ6PgEfuMLOg4OffMWdAw9bGqDhK6QYZPd30bRbiY8wNY1TP5YlKR
         DWtGjd6SPiW/C9yUgCIO8x6tOQdCszWh0bIkd/bwQuNPttcccJ6NEWwSUe6aRIPgADdP
         1i5tYePnDw71wiCqvhVBgc9gqKg3n2O4cRgYOvT/5PpqnqcZzxy+yWm/ECIRJmg1rvjR
         wVnx/vy3Htox7bkkGxCbRX15Ql1LvFNGw5e6fYl3x4E36c3vC/gdiiWvLEB8bwxuOXto
         NRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134263; x=1780739063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YD6axKKp8wDht90VyqGQ3zjwLyfLDF+g7zoFDStjFGA=;
        b=g8t9xuG50EWRBwisPauaRHawZaWMLXQlPfdLuBJXNWtSPwVvOS7BlTPa79oqJlQHYL
         LHLX19TowZscY7dCEGrERMhEm7ngOMYDscoaDmnuj5gjRhKks/Jo24MOU2BvD/kbY9SN
         LT01qYgEHlcaDWESsADkFAm5PP6p8D9NBi4A91pm1hzoIdz/jTiZt+40wTp0WCWA4Nq9
         p45BFfAfCqZY3jpYZrxGrMCQjcQQlqi05eEUnfaXSAHrpLzvCX0eABA+KibffNwSq5MR
         xll0vG6WyjVc7g9RVseEO9RLbkwUkuF8xRSXEBlBHZ6/gvlDlbuGOqA535FFcaI8VDxH
         41+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/ejie0eTjIRSWl0/ah3LTULqj/LXNZLKjL10x3ZjT7BzLrKnit7y7qQqxnH9/Di4bnGfJ+74NUfj+YLmVx@lists.linux.dev
X-Gm-Message-State: AOJu0YxLQG3WmKAM6hJTr97UUHcp3Q8La5A35X1vwtBqjFEQwpc/hpwJ
	e8cpyw/T6D50veJOFoBRgnwXXwaOBxUh0kXB+3VSRYWJhs1vleZlFA8J
X-Gm-Gg: Acq92OFbE6hM0TmEBvYjdhlj8efKGADqtqOv+Tg4KBb+xWnN0tVjz5RaMfdojjUM+06
	AIKme8wIn+zvlcGhxcgO9zTPx51hB/nSi///3amRk9MFgcwajaSOKjFiNqDv3Y/Eqi+Vz4/v8F3
	QqnG48ciH1yDLE13Rj3O0VxCZTdLrGrg8yVGdYHMwdghLytfMvJPBY2vt6nR44huiinikvddyPN
	CS9/un+PUECLdaAxlmEu0rSKadqO+z80I6SGKMoVjWQy3UOcLwXFEL8MW81RTv5AhQd/yTqFwPy
	YXIVBxJWCBGt/dyV17KKT3c7+KM6zTSfPANnQjTTd/e3RBsEXdJ9Flp/XZO6WmH+ap21oVL/d8j
	1GIzSi3VqdOGMLs6PJKfEgKHifXwb0J2Mgd0Dc0euhC7qQ6p59hQZJkHNUy1TtpJLBcytbormDJ
	fMlXr5WOVSDCX1o9x5Uo16XgRhkPzXaPc=
X-Received: by 2002:a17:903:2305:b0:2ba:7881:948d with SMTP id d9443c01a7336-2bf367b214fmr38817185ad.1.1780134262731;
        Sat, 30 May 2026 02:44:22 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:44:22 -0700 (PDT)
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
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v6 2/8] media: meson: vdec: Fix concurrent STREAMON / STREAMOFF race conditions
Date: Sat, 30 May 2026 15:12:48 +0530
Message-ID: <20260530094326.11892-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260530094326.11892-1-linux.amoon@gmail.com>
References: <20260530094326.11892-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Meson VDEC driver’s start/stop streaming paths previously
updated core->cur_sess and sess->status without synchronization,
leaving a race window between concurrent STREAMON/STREAMOFF calls.

Following change introduces proper locking discipline:

- Hold core->lock when checking or updating core->cur_sess and
  sess->status in vdec_start_streaming().
- Snapshot sess->status under the lock in vdec_stop_streaming()
  to safely evaluate hardware state after releasing the mutex.
- Ensure error unwind paths clear core->cur_sess and reset
  sess->status inside the lock.

This prevents TOCTOU races, avoids data corruption when multiple
sessions contend for the hardware, and ensures consistent session
lifecycle management.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260525104345.C8D501F00A3C@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 62 ++++++++++++++++++-------
 1 file changed, 46 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4ffebba2341d..7233000e2232 100644
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
+		mutex_unlock(&core->lock);
+		ret = -EBUSY;
+		goto bufs_done;
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
@@ -341,8 +356,6 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 		sess->recycle_thread = kthread_run(vdec_recycle_thread, sess,
 						   "vdec_recycle");
 
-	sess->status = STATUS_INIT;
-	core->cur_sess = sess;
 	schedule_work(&sess->esparser_queue_work);
 	return 0;
 
@@ -350,6 +363,12 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	dma_free_coherent(sess->core->dev, sess->vififo_size,
 			  sess->vififo_vaddr, sess->vififo_paddr);
 bufs_done:
+	mutex_lock(&core->lock);
+	if (core->cur_sess == sess)
+		core->cur_sess = NULL;
+	sess->status = STATUS_STOPPED;
+	mutex_unlock(&core->lock);
+
 	while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
 		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
 	while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
@@ -399,10 +418,23 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 	struct amvdec_codec_ops *codec_ops = sess->fmt_out->codec_ops;
 	struct amvdec_core *core = sess->core;
 	struct vb2_v4l2_buffer *buf;
+	enum amvdec_status old_status;
 
-	if (sess->status == STATUS_RUNNING ||
-	    sess->status == STATUS_INIT ||
-	    (sess->status == STATUS_NEEDS_RESUME &&
+	/*
+	 * Safely snapshot the status and clear the hardware owner inside
+	 * the mutex to prevent data races with concurrent STREAMON requests.
+	 */
+	mutex_lock(&core->lock);
+	old_status = sess->status;
+	if (core->cur_sess == sess)
+		core->cur_sess = NULL;
+	sess->status = STATUS_STOPPED;
+	mutex_unlock(&core->lock);
+
+	/* Evaluate the hardware state using our snapshot */
+	if (old_status == STATUS_RUNNING ||
+	    old_status == STATUS_INIT ||
+	    (old_status == STATUS_NEEDS_RESUME &&
 	     (!sess->streamon_out || !sess->streamon_cap))) {
 		if (vdec_codec_needs_recycle(sess))
 			kthread_stop(sess->recycle_thread);
@@ -415,8 +447,6 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 		vdec_reset_bufs_recycle(sess);
 		kfree(sess->priv);
 		sess->priv = NULL;
-		core->cur_sess = NULL;
-		sess->status = STATUS_STOPPED;
 	}
 
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
@@ -425,8 +455,8 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 
 		sess->streamon_out = 0;
 	} else {
-		/* Drain remaining refs if was still running */
-		if (sess->status >= STATUS_RUNNING && codec_ops->drain)
+		/* Drain remaining refs if was still running using the snapshot */
+		if (old_status >= STATUS_RUNNING && codec_ops->drain)
 			codec_ops->drain(sess);
 
 		while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
-- 
2.50.1

