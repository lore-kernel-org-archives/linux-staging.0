Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34213F660B
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 14:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781532335; cv=none; b=nlURVmzLDRgDi6zPvh2iI3WmPmvl35w4LV/BvU8PweMdv17W66VjcLaYrpyPtSSJqm19DdOA/EINYFmbRaF1SxJCMHombAhYpWVFMPT5ZEKuL3QxQvd6N16gUhRJB2Ubaf3FKVAL4LpspljrE7wj4cPh4uXgPq24mwJj0RPhIk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781532335; c=relaxed/simple;
	bh=wNlRLgc+VfgMCDRAIjUgYi0AoA49S8oofmEjD+i/wcM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BU3xjU8YHmcHn7BnvMiVXqvZTgXenJrXFcNE/kKFsIPvWHy4XgKpayeX1/bpvR3zmAzvwf8rppm154Efjz9ueO3TqW25QlcRNb+/444qbrE+6TDVu/VcsFEYGdjB+8o/0o3r8jnymyQTuAlsW4eGV83rKeE12RIqkT46SvTdcl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=qQymgEsx; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="qQymgEsx"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4602e2a0372so2606011f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 07:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1781532332; x=1782137132; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6MN3j+7e1dFG2jfIP/6dw1N/4Etu3I0/uUny4h6HJVI=;
        b=qQymgEsx7zN15eIfbtp/Ho9qXGe7ULHkcO0TLCkSqBjiUQDRkDiqMXSh/bCGttD5zj
         YjWw71Xnvh8eBR96HJ9e5S69ymlvFwfWpLeGZQG0q2n4lsmXpgkgVq8v2+osQMvdhvpx
         9If2h7U46jqlw8sktWK2TV6AP1dD1tyBhtSpE4YOoYDB3QT/4pK+Jy1k4a3V/7yeSJUN
         zAOTUx3Qn4Vm+/q6h8KiUKAqlrzmYZBZHA00Xjl4iBEVVUD11d9kDNPERnXHKKEa5+Ao
         l3rI/aItX0RePoN/PYA32xghGJGkzQQY6TPGYRZwnNJHujqyEfTM/407qNWeqDYt+T1k
         EI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781532332; x=1782137132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MN3j+7e1dFG2jfIP/6dw1N/4Etu3I0/uUny4h6HJVI=;
        b=N4ZA7jhTY2DnKv1VmN8VGQOjtntGoXVc/84u8dKaHxDNbkr3UwLfJ4jI6XnB4fxfrJ
         BwZyN0M/HiFqFx/f5WJOBZ4Xnqe42Tz3Nxc9eZzTzaHEAqvwTuDst7zcefSNsrggkPk9
         NytXpbibdu5r3/b/AtGaZiZrwKcCpSnhiQ1oTgjYqsP0cGjO/I7e0IiT/1PbfGtVeZBi
         udessqrvw8ocm1JRNWm5l8VwtQSNVCaaO4nUfH8Ynd5Z10fndVsTCXl1O8cfYhk6Zuc4
         5CWGq1VPPGXhi1VYfTKcrdtCAEA0IhSz0q95o4I2c9TaVRo3ig9wVKrwRMGLJT3f0IC8
         SO9A==
X-Forwarded-Encrypted: i=1; AFNElJ8XrV6BPnPIOUcTxhUA8jlG4v2fK6tvb8pYNn+RMSMvC6LHh76ZFYAkVVDJbqGKULAGs9pRq/nJqMeWd0PU@lists.linux.dev
X-Gm-Message-State: AOJu0YzWjDCzwofEJneVQozj9efVsqFpwOLHA13VboMbK0cBw2Ifshon
	C64l2KKnMqq4nKhcl5xDvQTw9xuwP6KSKRjLJztmIEQycD/23utbePAI1sas7W5yEtKs
X-Gm-Gg: Acq92OGglDTgzw/ydd+lqsuQEKpkNGBzReFJV4yavq8KiXXpM0AH03wj3vHxnyNqa1z
	zcLQ2UhqypdJJrgcV2lQKeEjYuiZeFSLAKVcjquBU7AqifteZFA7a0TGpm+0sTqwG5LfZgmTKq2
	A6PO1DEY5fRzTO1FXRLJRqZnePheiqZHEbzxdSI+tH9fma0PDio+InHCqGza/+pglFuQTZDPchL
	G39Jlam18fzNqIsLExdLbFaHAfLTVs8u9vHghHjB41XSGIhN42IAH/z0ccFmkU9YWNjBUIOl+8V
	BByqXK4IK35vOqFYgc4grfVGlyc6YM+EenJAJP9QpVSeaHurzP75v1GF7g823dKSy6K3kG/b3PF
	vLsU7T4H4EYsqU36Ch4/DPeFx3aYoV61QNnbIIzptlNu8pLtAjU6mCU0Fe0XD9rQYUY6z0M9mFX
	FZlxfe2uRPvNPCpUxeoXQQzL+oy+6Jg/spSjMFiJ76DjsqO9YsGxVmkyuzuHvDDc05Hgya/2hmV
	1rY7ag7MGhpAghUUbqK5QpWbUZKblq/krpAcZtSM9pFng==
X-Received: by 2002:a05:6000:1844:b0:439:c18f:5aaf with SMTP id ffacd0b85a97d-4606dbf15f5mr21550537f8f.34.1781532332022;
        Mon, 15 Jun 2026 07:05:32 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f3basm33177359f8f.12.2026.06.15.07.05.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 15 Jun 2026 07:05:31 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: neil.armstrong@linaro.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	mjourdan@baylibre.com,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>,
	stable@vger.kernel.org
Subject: [PATCH] media: meson: vdec: fix use-after-free of decode work in stop/close path
Date: Mon, 15 Jun 2026 16:05:29 +0200
Message-ID: <20260615140529.52653-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vdec_close() calls v4l2_m2m_ctx_release() and then kfree(sess) without
ever cancelling sess->esparser_queue_work. The worker
esparser_queue_all_src() takes sess->lock and walks the source buffers
of sess->m2m_ctx, so if it is still pending or running when the session
is torn down it dereferences freed memory.

The work is (re-)armed from several places, including amvdec_buf_done(),
which runs from the decode-completion/IRQ path. That makes the obvious
fixes insufficient:

  - v4l2_m2m_ctx_release() frees m2m_ctx (and runs stop_streaming via
    vb2_queue_release()), but never cancels the work. Cancelling in
    vdec_close() after v4l2_m2m_ctx_release() would wait on a worker that
    may already be dereferencing the now-freed m2m_ctx.

  - Cancelling in vdec_close() before v4l2_m2m_ctx_release() keeps
    m2m_ctx valid, but the hardware is still live, so amvdec_buf_done()
    can re-arm the work right after the cancel, reintroducing the UAF.

Cancel the work in vdec_stop_streaming() instead, right after
vdec_poweroff() has quiesced the hardware (so its IRQ can no longer
re-arm the work) and while sess->m2m_ctx is still valid. Because
v4l2_m2m_ctx_release() always tears the queues down through
vb2_queue_release() -> __vb2_queue_cancel() -> stop_streaming, this
single cancel covers both the STREAMOFF and the close paths.

This does not deadlock: the queue lock (sess->lock, shared by both vb2
queues) is taken by the worker, but neither the STREAMOFF path
(video_ioctl2 serialises on vdev->lock == core->lock, and
v4l2_m2m_streamoff() calls the lockless vb2_streamoff()) nor the close
path (vb2_queue_release()) holds sess->lock when stop_streaming runs, so
cancel_work_sync() can safely wait for the worker.

Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Cc: stable@vger.kernel.org
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/staging/media/meson/vdec/vdec.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..42822064cf8d 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -419,6 +419,16 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 		sess->status = STATUS_STOPPED;
 	}
 
+	/*
+	 * The esparser_queue_work worker dereferences sess->m2m_ctx and
+	 * sess->lock. The hardware (and its IRQ, which re-arms the work via
+	 * amvdec_buf_done()) has been quiesced by vdec_poweroff() above, so
+	 * no new work can be scheduled past this point. m2m_ctx is still
+	 * valid here. Wait for any in-flight worker to finish before the
+	 * buffers and (on the close path) m2m_ctx are torn down.
+	 */
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
 			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
-- 
2.43.0

