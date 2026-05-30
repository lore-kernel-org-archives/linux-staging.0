Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2C2368D79
	for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 09:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780134295; cv=none; b=LbsTBuUqBdR1PPHepgEXi58a/f9EBRmY+s80E6hZH4w1qaSGGQ1/spXcoey9n0drPQPZCmnO5rtOC4ULAxB85Mcq8JXHcrKm7HN1eWCownQXGHhy0oFEzNgU/3ly9OdCDxKZzqcEeC3huArdnJTaYLKOmTUkF2WYmFwjcQZcdgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780134295; c=relaxed/simple;
	bh=U+d2jT76hbERqFnnuLcNz9UQ38hwXQfEMVzxXIG/jas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fPc1+JZrfHSAmaZhUo6RmJq2wZfqb2a4+WwJJQJdmlk0iiqvD6QS84oIdRiim0mukG19nbLQZAXT7d18ouuYF8cgz1mgD11xow11uCTVaqf7uiSAcXUuxeGKxJeeCIO4L336mo7zRSctwolALzUnznWUxStW2iUIPSbGjvMDl2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ayR3VtPg; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayR3VtPg"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c0aa420401so1621975ad.3
        for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 02:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134293; x=1780739093; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eg9ggvkEkoQKR+hIDJPnP9lc/gF7VRqufBdsoqX52Vc=;
        b=ayR3VtPgs8Gq191WgOaCkmG0GvY77inAYejhVGPuL+Bsh7vraBKTUx5NHdEEg0G4mP
         OHLbBjMaNtyYR79nEdlHpo0g5nnrLUsnmGcAir6k+quSwm0LV3eDLcLQzga5IiXJx7ZA
         lQq9ElIIEhPN/JJdkLSAUaRQq6U2ZXkrI0NtkirvqV2XbYFLP4/I/RMEZt+debu8O0AU
         wnAo0TAvoP6/kQfcaQhqE8fds+biQyjNxM+75Sx6yi7dw0qGp18U/isN1XVNzJk4AFEP
         46+Oy/Jap21FoMXDS9EZEZM97VQ1mf2dARAutwcEE4zmCyYO5Kumzu0VfAKC3V+IwcGL
         fnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134293; x=1780739093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Eg9ggvkEkoQKR+hIDJPnP9lc/gF7VRqufBdsoqX52Vc=;
        b=mY3IJ+vbSfGqMBA81Tk/3Kzv5fr9ybDGuJEKxx4gGmZtzYCxDO0yuSDQadRyLYwuAI
         3j/8kh0ua2k37g6VrZKLgzjSFjPduz7oZErfpkronJx93HGUzGmADJHx2oWYQGJsk/pT
         dwxea6hDJhxgD3gpMB07ccNRzCRb5Vl3llLUSi9hK+aJAna7ztw3LCoJjPGqQCwu/rKJ
         s8czoW9++256tXCsqvEtLOP6Sfm3Jmk26UJ5vtFu9yKOhFHQ1IZoQCljd5tGR9uDS0Bg
         vQeCTgDTKhSJLS7WLM9uhHmSePlgIxwQrgGyokzMqseWB5OWAHWrOGxusxKEDIVsizIu
         Af4w==
X-Forwarded-Encrypted: i=1; AFNElJ/OVCdl7SMG/0AQ4tn81UMZOZbxMvldqt0+8W/x7y+qUdvVH50Em4dSke0xZ6NBij1RfzEC3vwxxwlb9goa@lists.linux.dev
X-Gm-Message-State: AOJu0YzCYOGwXEQ439Q5O6AEkst7CdheIOrv2KL4uiSknUplKAY/jqhn
	D8XAkCkHiyemEmciklI4RYh/u9wAcAG8ZfRDSI6TCa7g2MjzIaFSMP5M
X-Gm-Gg: Acq92OHIK8r4vOgL3XVQaOMniDeHzvol5jDNE5KG0YOSa8KMGlYh2oIN+EvDhPl7/Tn
	xBuUiiifvHOdn+lXcca5Zp8a7pcvWg05MZDAfviL5z1LD1stPLp/JL9lYaM665QvD1zh0IBvNZx
	xa6qA6LhBkpNclNLj4cr+wMSCisX1KOfUvPDGtrlRfZJjrVfmieFglQysxOWwmYw/YHzZFzARr7
	mKXHZyJE7bykETykJUrDZyfID9xn5oOjCoyjFCsWVmgHbSF+WvkTQgz0yWUVXgHIoivlL/QGYvC
	jjSO6fG3k4rwwmCx65kRJzKB24WNuTQp3TgertpVePnCJWrdi7pUW/GPfZcLxXGmjrnXRjmdpGh
	fsMPDqU/1ghapL7ThWYYNmC0pxaE9q3fFtWklcrSTq6fmkvcpTSAtwT50cFkgcWd9sJgikBtiD9
	ug1bFnJl4oaWTYC9PYBNNtDvCCBI+In4Q=
X-Received: by 2002:a17:902:c94c:b0:2b2:be01:5532 with SMTP id d9443c01a7336-2bf3686d1dcmr41074635ad.35.1780134293228;
        Sat, 30 May 2026 02:44:53 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:44:52 -0700 (PDT)
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
Subject: [PATCH v6 5/8] media: meson: vdec: Cancel esparser work during teardown
Date: Sat, 30 May 2026 15:12:51 +0530
Message-ID: <20260530094326.11892-6-linux.amoon@gmail.com>
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

The esparser workqueue could remain active during error unwind,
streaming stop, or device close, leading to use‑after‑free when
work items accessed freed session memory.

Fix this by explicitly cancelling the work in all teardown paths:

- Call cancel_work_sync(&sess->esparser_queue_work) in
  vdec_start_streaming() error unwind, vdec_stop_streaming(),
  and vdec_close().
- Ensure the workqueue is drained before releasing session
  state and buffers.
- Move codec_ops->drain() evaluation earlier in stop_streaming()
  using the status snapshot, so draining occurs before buffer
  cleanup.

Following change prevents dangling work execution, eliminates
use‑after‑free hazards, and ensures orderly teardown of decoder
resources.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 698a95566ad2..4884ee04b352 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -380,6 +380,8 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 			  sess->vififo_vaddr, sess->vififo_paddr);
 	sess->vififo_vaddr = NULL;
 bufs_done:
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	mutex_lock(&core->lock);
 	if (core->cur_sess == sess)
 		core->cur_sess = NULL;
@@ -437,6 +439,8 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 	struct vb2_v4l2_buffer *buf;
 	enum amvdec_status old_status;
 
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	/*
 	 * Safely snapshot the status and clear the hardware owner inside
 	 * the mutex to prevent data races with concurrent STREAMON requests.
@@ -448,7 +452,11 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 	sess->status = STATUS_STOPPED;
 	mutex_unlock(&core->lock);
 
-	/* Evaluate the hardware state using our snapshot */
+	if (q->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		if (old_status >= STATUS_RUNNING && codec_ops->drain)
+			codec_ops->drain(sess);
+	}
+
 	if (old_status == STATUS_RUNNING ||
 	    old_status == STATUS_INIT ||
 	    (old_status == STATUS_NEEDS_RESUME &&
@@ -472,16 +480,10 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
 			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
-
 		sess->streamon_out = 0;
 	} else {
-		/* Drain remaining refs if was still running using the snapshot */
-		if (old_status >= STATUS_RUNNING && codec_ops->drain)
-			codec_ops->drain(sess);
-
 		while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
 			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
-
 		sess->streamon_cap = 0;
 	}
 }
@@ -967,6 +969,8 @@ static int vdec_close(struct file *file)
 {
 	struct amvdec_session *sess = file_to_amvdec_session(file);
 
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
-- 
2.50.1

