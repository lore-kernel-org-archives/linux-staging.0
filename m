Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA5B40682E
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 12:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944611; cv=none; b=XWreTGeFZ6zqzGkvg/RJbnyxSVolwMWfJDLpNxPTBBxEAgzD6ptRpJdlzNKAJ6lCJimZ//LUuGNBzDWQ+tjgYpE6Q2U8feLHVM7EYzqw6McXl2a6Wj5kOggizdIT9HC/m6VDs6pgjKyMPAVasi75ef8XPSz4tdkUkj5AHI6XvPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944611; c=relaxed/simple;
	bh=jmgoQL+MH+cHI2abCHhSjB4sQPbvNKTxgke0bczlm7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fwkLQiGUpkDuhKzyKuw26E+opwErFfx8ydjhGBEEzjhINNCmQCNzlTDdOECBkynLw0YPnZH3KrDdsZ2ye6x6EIKj+6J+XofJVuKNYpZ/sv1IOwXoKsOglppcR5hn9EuKL5daDkI4MM1HDrSGQuyAaCcjuLXw6IQfHij2mZ45SGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kgEEEMVN; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kgEEEMVN"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c96c92c0980so1584633a12.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 05:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944608; x=1784549408; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cz2FSgCZR0hsmFPhKS7OSCHd3SyOY5Jhxrt1826LFDI=;
        b=kgEEEMVN0KiV5eEtmT7Ra0sKpKJ/P+rCltGvJ5cRGK+gzzQfaz3RlRchzemGzDUmPu
         +nasEJGIpYpZy62/k/1XTSod6nDfj+BvbJxy44ERQkq0rk1u4sHbcXp8akjwMKPRA2uk
         GF1HyEQxcZxerOGHKePIhYjmmyEE2Y0ILTKNp4NQp3UCVhdoc401XxqWWUf+nBdMVgSJ
         SIeiAYXxUBtQufvkHZhqPujvzyS8l3UGkwzk47NAXb21ztOkrV7xogJTC61NIKQcr7yR
         v2G6hJ/UP9r6YU0bxt9fUo/DBSP73gAGgTNDBmqlD0sYsg31sRBceeuU0teqq4gv7dj4
         2nSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944608; x=1784549408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cz2FSgCZR0hsmFPhKS7OSCHd3SyOY5Jhxrt1826LFDI=;
        b=Y2B9EhpSKsA/PQBMC9EvFy+A9L5b1TgHll05qCgXsiqllfpQiEM5z/J1Dd2n+nUJ9y
         diMfUUoPF/vJmbVeAE7bP6JScFMnNTTIRQ5R1x4MQgjvtl4nxbyiCVFLXJVUEKQu+ZMP
         DS7qxDzKTX0b0NCiVYeZa1enf7WxaBtNGJjFzzpXPfduOG2H31zIKY+8W6AWUZK9OmxD
         cqR6MzWWdFkPfSHMInmEp0ntTV/UQHi73xwmOZsxYEyo6PG+uT8Jogl5XH3ENZ/67cqi
         b4dTBgSbUwjupixm9fFyYxPzyi7mjEdrB0QzXV2OUHh29XM3tYNMhfLMiOl+wPG9b1Ou
         70iA==
X-Forwarded-Encrypted: i=1; AHgh+RqfvhhTdxmutnvHXmRZ1rNuSDe08bgcXnaJdN4ONGdVSLH9wKuuJZADLX6cQiBFiK6pJyr15THJrhSZpcy2@lists.linux.dev
X-Gm-Message-State: AOJu0Yz81m27QFgfAsK8tPV1CFyivYMZ91TNMbmM+bbHNjelMuD6IR92
	013kx9l0x0KAW2kE6FPyBtCueU179aStyW4GylMbFRA/8/K0JdvUKXWQ
X-Gm-Gg: AfdE7cm85UOfrQZaySbi8duW8RmzImOpGLFMJ1jKXs3p5o/OlalRFaGOs8EjlV7MyEg
	dZMyqqwUUIysp5GcM/WWp7va+57Z/6ihq1I88twVO3q+nOXmQ6rwcxDbMzWqMx1mEIRAPvZeYO8
	ca1pV5Xr2YE9+vRFmtOIQwf9sD4MwCAhLsUFBAPqurOMVmh9dyFZOuHA6Tnsr7ja1HzkeA3qJ3v
	L4+v8lRAb+idVB/7uIAVjkAVK24nXp8yROH/Cdbxn4aRe/k2IDtANbAa9UH65nAnSRUb15pBhvw
	0dX2Oa8TJHDb8OaMe+XgAaPyfh3kot/Mbth5nHEhdlo54FJQgVk9lkBFQ7CmnNU1kz/dsN3V2Ro
	J+lhT+vHd3yEwbJxvNx9Qi1680DpXrsZ4VjvhtiUZyUmn7NbPlkEb7C27KhDRX345n1NFAyt+aE
	WY7wnAskVibQ==
X-Received: by 2002:a05:6a21:140a:b0:3c0:9c19:b27d with SMTP id adf61e73a8af0-3c110cfefa5mr9580843637.75.1783944607855;
        Mon, 13 Jul 2026 05:10:07 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:10:07 -0700 (PDT)
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
Subject: [PATCH v7 07/19] media: meson: vdec: Refactor esparser work queue and fix teardown race
Date: Mon, 13 Jul 2026 17:37:02 +0530
Message-ID: <20260713120840.17427-8-linux.amoon@gmail.com>
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

Rework the esparser work queue logic to prevent concurrent queue mutations
and fix a race condition during streaming teardown.

The previous implementation relied on v4l2_m2m_for_each_src_buf_safe(),
which held the session mutex across the entire queue traversal. This
blocked concurrent operations, caused inaccurate buffer mapping, and
triggered 100+ second watchdog freezes due to an unyielding polling loop.
Additionally, the low-level parser handled buffer ownership adjustments
and completion callbacks directly, leading to inconsistent error paths and
races between streamon and streamoff.

Fix this by utilizing the modern scoped_guard(mutex) mechanism inside the
main worker loop. This allows the session lock to be automatically
dropped on any conditional breakout path, preventing voluntary scheduling
bugs while invoking cond_resched(). De-couple buffer lifecycles from the
hardware parser routine by leveraging safe, linear fetches via
v4l2_m2m_next_src_buf() and v4l2_m2m_src_buf_remove(), ensuring orderly
frame transactions. Refactor esparser_queue() to return explicit error
codes (such as -EBADMSG, -EIO, and -EAGAIN) to safely handle buffer states.

Clean up teardown paths: Execute cancel_work_sync() inside
vdec_stop_streaming() and vdec_close() immediately after
synchronize_irq(). This ensures any pending scheduled queue work is fully
flushed and canceled before the driver destroys hardware instances.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/esparser.c | 69 +++++++++++++++------
 1 file changed, 49 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
index 37749ede308c6..e5d3d817b9b2b 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -328,15 +328,11 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
 		return -EAGAIN;
 	}
 
-	v4l2_m2m_src_buf_remove_by_buf(sess->m2m_ctx, vbuf);
-
 	offset = esparser_get_offset(sess);
 
 	ret = amvdec_add_ts(sess, vb->timestamp, vbuf->timecode, offset, vbuf->flags);
-	if (ret) {
-		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+	if (ret)
 		return ret;
-	}
 
 	dev_dbg(core->dev, "esparser: ts = %llu pld_size = %u offset = %08X flags = %08X\n",
 		vb->timestamp, payload_size, offset, vbuf->flags);
@@ -348,12 +344,10 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
 	if (sess->fmt_out->pixfmt == V4L2_PIX_FMT_VP9) {
 		payload_size = vp9_update_header(core, vb);
 
-		/* If unable to alter buffer to add headers */
 		if (payload_size == 0) {
+			dev_err(core->dev, "esparser: VP9 header update failed\n");
 			amvdec_remove_ts(sess, vb->timestamp);
-			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
-
-			return 0;
+			return -EBADMSG;
 		}
 	}
 
@@ -363,33 +357,68 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
 	if (ret <= 0) {
 		dev_warn(core->dev, "esparser: input parsing error\n");
 		amvdec_remove_ts(sess, vb->timestamp);
-		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
 		amvdec_write_parser(core, PARSER_FETCH_CMD, 0);
-
-		return 0;
+		return -EIO;
 	}
 
 	atomic_inc(&sess->esparser_queued_bufs);
-	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
 
 	return 0;
 }
 
 void esparser_queue_all_src(struct work_struct *work)
 {
-	struct v4l2_m2m_buffer *buf, *n;
 	struct amvdec_session *sess =
 		container_of(work, struct amvdec_session, esparser_queue_work);
+	struct device *dev = sess->core->dev_dec;
+	int ret;
 
-	mutex_lock(&sess->lock);
-	v4l2_m2m_for_each_src_buf_safe(sess->m2m_ctx, buf, n) {
-		if (sess->should_stop)
-			break;
+	while (1) {
+		struct vb2_v4l2_buffer *vbuf = NULL;
+		bool processed_frame = false;
+
+		scoped_guard(mutex, &sess->lock) {
+			/* Safe atomic tracking check: exit loop if session is shutting down */
+			if (sess->should_stop)
+				return;
+
+			/* Queue completely empty: exit work loop cleanly */
+			vbuf = v4l2_m2m_next_src_buf(sess->m2m_ctx);
+			if (!vbuf)
+				break;
+
+			/* Stop processing if we hit the end-of-stream drain buffer */
+			if (vbuf->flags & V4L2_BUF_FLAG_LAST)
+				break;
+
+			/* Check hardware FIFO limits safely inside the locks */
+			ret = esparser_queue(sess, vbuf);
+			if (ret == -EAGAIN)
+				break;
+
+			/* Pop the buffer from the source queue since it is now processed */
+			vbuf = v4l2_m2m_src_buf_remove(sess->m2m_ctx);
+			if (!vbuf) {
+				dev_dbg(dev, "Buffer missing during queue removal\n");
+				break;
+			}
+
+			/* Complete the buffer transaction based on parser results */
+			if (ret < 0)
+				v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+			else
+				v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
 
-		if (esparser_queue(sess, &buf->vb) < 0)
+			/* Set tracking flag indicating transaction completion */
+			processed_frame = true;
+		}
+
+		if (processed_frame)
 			break;
+
+		/* Give other threads and IRQ routines a window to execute while unlocked */
+		cond_resched();
 	}
-	mutex_unlock(&sess->lock);
 }
 
 int esparser_power_up(struct amvdec_session *sess)
-- 
2.50.1

