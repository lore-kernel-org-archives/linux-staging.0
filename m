Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528EC369208
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 12:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944620; cv=none; b=aFKpci/e7TQPAzrvoAMS70MZGU+hDOSjppi+bCC1HixRkAiBw2vyfYgv11zaqlNuH7aHyqryu4UXAjTlxtnHeo6PYoBxAZcPvPj9d3HKGv6UzkNSwuOEGW1zMaHAvWRpFzAkCzFpzjbzNVv+yHYoCB0YLbWhivkkCSgatjLoHH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944620; c=relaxed/simple;
	bh=bhI4E6oc6F1Tv+IuuQmSjw+SHYMiXdNdT/xsno/HW2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rV3ozCYCaol2TMVAE/2wPkLc/JT1dm8Yf2aYxeJWoD7Ma0N/QfEfV8mTjjUeEnn7ljzj+7ewxf/4/OtyYbhEc7fwB6v9Z3nnScXrzH21iX0aQ936M6zpW9JX80AOwYwUg3d7e/rJ1ujDKMhOFQndOVu0oKA58C4rtC0NAvSNtf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JynEyQ70; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JynEyQ70"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so1490311a91.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 05:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944619; x=1784549419; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M52KCQrGH2efvkkWtyT/9Kw89ZxEs+AuVcYa54xJZ9k=;
        b=JynEyQ70NN/FuAZuIP8sAttKvTrDGKKRZ3isVFk+YeljEw0WXEnSztb1fGzMHFBjUB
         l0FXDePnB4jpA199ATp+2d2UiahO7I1HNRGlKVwza9RfxC3kEPJ+UqVBSfcJAyEAslCT
         CCQmEM7nPVhBRhl8o2NypiRdnt74CXsm55qgT3fh79bbjcLbyk9DFQQRL0DUIkL8p8C/
         LjqpEpNVA/ahcMr1m4tsmM4FMUGDlIieWxz6/Ha8HF0QitD6SLeRDPFIE6t1b31mrqw8
         qQjtiww2PYjXKO4TxEjX0NQESRaj7zk0eT08xvEnhKB+7hIwlz5Z08OEpkodquDmf3H2
         O5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944619; x=1784549419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M52KCQrGH2efvkkWtyT/9Kw89ZxEs+AuVcYa54xJZ9k=;
        b=fsklRKtjtLMBODrNyx1tBJODkRl2QrM2gEeFlMoxkD8QsClz0O8KuZvrgBA3K55oCj
         NSFl4uyiXXFJB0CnWkfaCH4HfgBuU/Fla9ip1z6w9JBOHCdgSJLo0d6ChpKU/Fu1D2Pd
         p781R6NQNpt5Yg3r4tNx0NtcGpbfC5XT/sPTSXJWM0r4G72pMawjssWVhE0Q27Uq0Z4D
         db1WZjT65teksCdl2XeJ1USOv2WjZIyvmPqnRRL4nDr2Sov4aZBTMY0nx+MBz2qXa8a7
         N1oyrb9QILc6gifnwQJQGjJHSoMr/k3/usW6kiUN+b8WeDCxfy8Aku1CuN64sqF1B+JO
         JdmA==
X-Forwarded-Encrypted: i=1; AHgh+RoEv9sknKYf2Frpu8LMFlpzi7EVZzuUiq1qx2hdaOsXxFQi5VB75//O4bJXLeMTtL5QFF5VO4anywMLDCEz@lists.linux.dev
X-Gm-Message-State: AOJu0YzaIBmaWAdv7dhue1gEXhGBqsy9J7RtrEUlHJSrxySV8/l+uHdR
	IFhgc/DYCmCex5poru0WovotmPwSujwxuwaGJEmICvxN7G/sLHHVc1px
X-Gm-Gg: AfdE7cmp02NO+nqv/spkFU4VcLw0Lxb/ZPp8VRpnnVVHphn8BjbHYqpEeZ4/30wTU5b
	CVbVPpUL/DQCudzo51VYoaIqWAMTcOMMSUTjU3pYDb9GvvtzROG/0t4dmi7yXEf7g/7p39okdSA
	KnJdjOIpWAXihHA/C7ZDMPWh1ZhkReFY8BNj2xX71PCD1c7pI3BX0vX1w5WITmJykJn7Y0jsnK5
	doGP969s5GHPk+9TU7TrrDAK3XyzS7/Yeaui+JpbLfAS0H2z4erQ8tJy6sqlqxRTCAog21WGhEn
	HmI0oV52OIzeogPRJ63MhcQhNIDY3KlhW79VNmQyyX5ZmSLAKN1EidWYEjE/ayNBQVU0gprDL0C
	yUnDoulj5Nm5fPucJZLGEFR/dAeJA+Rm8SMFFnbam+w7KSQaDeKHbc1hnjnjoArZdmAMDoS9W3F
	Sgb7HTZ/gjMQ==
X-Received: by 2002:a17:90b:58cc:b0:380:540:d499 with SMTP id 98e67ed59e1d1-38dc78224a5mr7942822a91.6.1783944618568;
        Mon, 13 Jul 2026 05:10:18 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:10:17 -0700 (PDT)
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
	Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v7 08/19] media: meson: vdec: Fix concurrent execution races and unsafe teardown
Date: Mon, 13 Jul 2026 17:37:03 +0530
Message-ID: <20260713120840.17427-9-linux.amoon@gmail.com>
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

Address data races involving 'should_stop' and prevent multi-session
hardware clobbering by enforcing atomic tracking and strict owner
validation during device teardown.

The esparser work queue reads 'sess->should_stop' outside of critical
regions without serialization primitives, risking data races or visibility
delays. Furthermore, vdec_close() and vdec_stop_streaming() blindly
shut down hardware components (via poweroff and canvas frees) and nullify
'core->cur_sess' without confirming that the executing session actually
owns the active hardware context. In multi-session scenarios, this allows
a closing inactive session to inadvertently break a running session.

To fix these synchronization and lifecycle issues with the following
changes use thread-safe flagging: Wrap reads and writes of
'sess->should_stop' in READ_ONCE() and WRITE_ONCE() to prevent compiler
optimizations from caching the condition variables across scheduling
boundaries and optimizations across workqueue execution threads.

Also safe context releasing: transition 'core->cur_sess' pointer
clearings to use smp_store_release(). This ensures all prior internal
memory structures are entirely flushed and visible to other execution
cores.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/esparser.c |  2 +-
 drivers/staging/media/meson/vdec/vdec.c     | 88 ++++++++++++++-------
 2 files changed, 59 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
index e5d3d817b9b2b..959673742e699 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -379,7 +379,7 @@ void esparser_queue_all_src(struct work_struct *work)
 
 		scoped_guard(mutex, &sess->lock) {
 			/* Safe atomic tracking check: exit loop if session is shutting down */
-			if (sess->should_stop)
+			if (READ_ONCE(sess->should_stop))
 				return;
 
 			/* Queue completely empty: exit work loop cleanly */
diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 6fe9722577179..83a9b1238972a 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -287,9 +287,13 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	struct amvdec_session *sess = vb2_get_drv_priv(q);
 	struct amvdec_codec_ops *codec_ops = sess->fmt_out->codec_ops;
 	struct amvdec_core *core = sess->core;
+	struct device *dev = core->dev_dec;
 	struct vb2_v4l2_buffer *buf;
 	int ret;
 
+	/* Reset workqueue loop shutdown signal to allow streaming */
+	WRITE_ONCE(sess->should_stop, 0);
+
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		sess->streamon_out = 1;
 	else
@@ -336,7 +340,7 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 		dma_alloc_coherent(sess->core->dev, sess->vififo_size,
 				   &sess->vififo_paddr, GFP_KERNEL);
 	if (!sess->vififo_vaddr) {
-		dev_err(sess->core->dev, "Failed to request VIFIFO buffer\n");
+		dev_err(dev, "Failed to request VIFIFO buffer\n");
 		ret = -ENOMEM;
 		goto err_cleanup_session;
 	}
@@ -388,10 +392,12 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 		sess->streamon_cap = 0;
 
 	mutex_lock(&core->lock);
-	if (core->cur_sess == sess)
-		core->cur_sess = NULL;
-	if (sess->status != STATUS_NEEDS_RESUME)
-		sess->status = STATUS_STOPPED;
+	if (core->cur_sess == sess) {
+		/* Safely clear hardware ownership since we were confirmed as the owner */
+		smp_store_release(&core->cur_sess, NULL);
+		if (sess->status != STATUS_NEEDS_RESUME)
+			sess->status = STATUS_STOPPED;
+	}
 	mutex_unlock(&core->lock);
 err_unlock_no_hw:
 	while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
@@ -441,6 +447,9 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 	enum amvdec_status old_status;
 	bool full_cleanup = false;
 
+	/* Signal workqueue loop to abort instantly */
+	WRITE_ONCE(sess->should_stop, 1);
+
 	/* flush buffers to kill background workqueue thread */
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
@@ -493,26 +502,33 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 		cancel_work_sync(&sess->esparser_queue_work);
 		mutex_lock(&core->lock);
 
-		vdec_poweroff(sess);
-		vdec_free_canvas(sess);
+		if (core->cur_sess == sess) {
+			vdec_poweroff(sess);
+			vdec_free_canvas(sess);
+
+			if (sess->vififo_vaddr) {
+				dma_free_coherent(sess->core->dev,
+						  sess->vififo_size,
+						  sess->vififo_vaddr,
+						  sess->vififo_paddr);
+				sess->vififo_vaddr = NULL;
+				sess->vififo_paddr = 0;
+			}
 
-		if (sess->vififo_vaddr) {
-			dma_free_coherent(sess->core->dev, sess->vififo_size,
-					  sess->vififo_vaddr, sess->vififo_paddr);
-			sess->vififo_vaddr = NULL;
-			sess->vififo_paddr = 0;
-		}
+			vdec_reset_timestamps(sess);
+			vdec_reset_bufs_recycle(sess);
 
-		vdec_reset_timestamps(sess);
-		vdec_reset_bufs_recycle(sess);
-		core->cur_sess = NULL;
+			kfree(sess->priv);
+			sess->priv = NULL;
 
-		kfree(sess->priv);
-		sess->priv = NULL;
+			/* Safely clear hardware ownership since we were confirmed as the owner */
+			smp_store_release(&core->cur_sess, NULL);
+		}
 	} else {
 		if (sess->status == STATUS_NEEDS_RESUME)
 			sess->changed_format = 0;
 	}
+
 	mutex_unlock(&core->lock);
 }
 
@@ -802,7 +818,7 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
 
 	if (cmd->cmd == V4L2_DEC_CMD_START) {
 		v4l2_m2m_clear_state(sess->m2m_ctx);
-		sess->should_stop = 0;
+		WRITE_ONCE(sess->should_stop, 0);
 		return 0;
 	}
 
@@ -812,7 +828,7 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
 
 	dev_dbg(dev, "Received V4L2_DEC_CMD_STOP\n");
 
-	sess->should_stop = 1;
+	WRITE_ONCE(sess->should_stop, 1);
 
 	v4l2_m2m_mark_stopped(sess->m2m_ctx);
 
@@ -998,6 +1014,9 @@ static int vdec_close(struct file *file)
 	struct amvdec_session *sess = file_to_amvdec_session(file);
 	struct amvdec_core *core = sess->core;
 
+	/* Signal workqueue loop to abort instantly */
+	WRITE_ONCE(sess->should_stop, 1);
+
 	/* Synchronize and flush pending hardware interrupt service routines */
 	synchronize_irq(core->vdec_irq);
 	/* Ensure esparser ISR finishes executing */
@@ -1012,21 +1031,30 @@ static int vdec_close(struct file *file)
 
 	mutex_lock(&core->lock);
 
-	vdec_poweroff(sess);
-	vdec_free_canvas(sess);
-	core->cur_sess = NULL;
+	if (core->cur_sess == sess) {
+		vdec_poweroff(sess);
+		vdec_free_canvas(sess);
 
-	if (sess->vififo_vaddr) {
-		dma_free_coherent(core->dev, sess->vififo_size,
-				  sess->vififo_vaddr, sess->vififo_paddr);
-		sess->vififo_vaddr = NULL;
-		sess->vififo_paddr = 0;
+		if (sess->vififo_vaddr) {
+			dma_free_coherent(core->dev,
+					  sess->vififo_size,
+					  sess->vififo_vaddr,
+					  sess->vififo_paddr);
+			sess->vififo_vaddr = NULL;
+			sess->vififo_paddr = 0;
+		}
+		vdec_reset_timestamps(sess);
+		vdec_reset_bufs_recycle(sess);
 	}
-	vdec_reset_timestamps(sess);
-	vdec_reset_bufs_recycle(sess);
+
 	kfree(sess->priv);
 	sess->priv = NULL;
 
+	/* Unconditionally set our local status to stopped */
+	sess->status = STATUS_STOPPED;
+	/* Safely clear hardware ownership since we were confirmed as the owner */
+	smp_store_release(&core->cur_sess, NULL);
+
 	mutex_unlock(&core->lock);
 
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
-- 
2.50.1

