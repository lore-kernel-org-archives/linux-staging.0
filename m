Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861973F482A
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 12:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944566; cv=none; b=KCMDy+6IbfKKC/uTF9Omy7z8hQYURr4dyYO7Ao7WfgMuJAYkk5O/Yja5UJ34YZFdMLihqYmtV50vYvIiaeuJVLKPW6MN83++tC8suXymzFBxCt97ZXO1DKZoJ6JjqRwdi1yjv6Dhn8Z8ZnecbYgOVQBAzQ8hrRRCPoxoX9HPCms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944566; c=relaxed/simple;
	bh=TtOqSQ0jC946LW7XV7taMYwKwsUHhdUDq21osqmB4CA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SObnAY3nfeoK56DItOsMKi+vFBbQ1xQChqMID1tnY0Q8vG7XU51JsmFHYPPeVjyKlzoFlUxdwXRYpt2X8RVk1u2o56ZsNEh6M8ahU1aiFju5AtTSMGxofcKwmPz/8+dO6gyp6O0OwtLbS9NX3FJzJd3rg+EAREUKWZBGznJRHx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKDsRXqh; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKDsRXqh"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-384c94c9414so2757316a91.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 05:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944565; x=1784549365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Pn+IHk1Sk762XTDH7lvSm6CZZGNFHunM58OnD0jYLk=;
        b=AKDsRXqh8cmKTR8rLhb0GBK30/PfRWB4HXnJV450Cuq0Wf8e/Ww4xKKQo4HcF7toLM
         8spwECvNCKn5MH0g/fD0cZZsEGRTDi+5p2k9LSoCXG31UIvI6S0+6Bv8L1LtPKPBGTif
         hBMBIS5FHXHhDamsCPxMO9fTQwKTjr/yIvttNuN6PjkSePubsl0tZOBfDIDY5VduFIQN
         x0gS345yyL7BxjQcTaPvbXPigtROKcl+HAa2+FNJixrav1+n4zK+W79KTG13ecbeZ6Yh
         pyk+W8oNPVfZbwtznMJLPFMMsCH4UVnYo9uWteEyhG9MPwgIJO6ALmk76KtzThQC4aHN
         1azA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944565; x=1784549365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Pn+IHk1Sk762XTDH7lvSm6CZZGNFHunM58OnD0jYLk=;
        b=nNBiBIj5Xxq+bpu04XURvXtpdC7rbsq52mXSxIDHuKqjDRU0IvAbYCXVg8ld1E0Wcr
         2db5OVievDZ0L0bxo0dkTXjJv3q62ueeUGBHymbzrkRQTla+uAF2CBYK4NERC8X8QK4Q
         f5oxSKMYQDlLr/srJFi54/yPOLX+2rS+B+gyJnJqIADFpYFFrJ7GjQ1aCNSoEGXmobwx
         7LXiu0XprDfej60mUEqQROwOZ8TRdhaRn6ieeGY4wpQb6TvV5bMg5Otp0PXYpwJCnTBF
         SDSMqx0T0KMJY+7C6pw1A+BzxZxKKpJQn9+/HViVf+8Owtsi6h9FQTr6lSHDiv4Ss2LT
         UCAg==
X-Forwarded-Encrypted: i=1; AHgh+RqUWrWMlsAhc6Mzbsc8L0ziVsvcRbcg4H34/T7VaDgwHXSOCuv0es5NXFEuTEn45Y6EiieU5jjZNVcyPzlc@lists.linux.dev
X-Gm-Message-State: AOJu0YwNckhafgOeC69DmPNC5oUCD+NBYU+K50wq6aL51CoCeyJbkFFL
	09B9MY+10jIiH08tMLI4jRuGQDC4d/HFHIVmcWgyKCZC5KvzHnrprBF9
X-Gm-Gg: AfdE7cms9dgmbnahpTBWC7v7NIJoY0l7bYrT21PcEuRzXstLGtdqWOH9/AuAHJgLFkS
	d4iC7p7WdJsCNW9TaAt3lc/P0szLk7WUEzw2G7NxA/GTuZAKgA1x7dgMrwGVkcA1bPb0HVq1PRb
	yMCkVJ6DXPE+PH/r5aFhVjt2ch1G3k9iGsr16OfDEoZqkS9WnHP0whuodgVU6/q0WHop1DoVtxo
	dUOU0Nca9s37yW/5tnYQdME5F7xxLI+K4SdmzaHbw0SpxCZWRvLMS5qTbqQgVxcO84TE7igRno0
	VqfqewB9rIaf80FONgBwlhYQ4ZIViRspyzNpiUneuS7Cj0YSMWJTYA0/232R7qgrFxFsPtu1bWr
	7pjvgE2bdMvv6mUa1RYVjKsOwgyxw0sUNEz8GRwY/EILAT7Ub8rbV+xAQHCSxpmvunclXNDt8Yi
	moX7DTOaN9bLKyocD9wjNy
X-Received: by 2002:a17:90b:2884:b0:387:e0db:bc22 with SMTP id 98e67ed59e1d1-38dc77b3846mr9100073a91.34.1783944564932;
        Mon, 13 Jul 2026 05:09:24 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:09:24 -0700 (PDT)
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
Subject: [PATCH v7 03/19] media: meson: vdec: Fix lifecycle leaks and race conditions in recycle_thread
Date: Mon, 13 Jul 2026 17:36:58 +0530
Message-ID: <20260713120840.17427-4-linux.amoon@gmail.com>
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

Validate the return status of kthread_run() during decoder recycling
thread initialization to prevent memory leaks, and enforce robust state
checking before invoking kthread_stop() to prevent kernel panics.

If the system operates under severe memory constraints, the previous
implementation silently accepted error pointers returned by a failed
kthread_run() operation. Attempting to pass these invalid error pointers
downstream to kthread_stop() during streaming stop or application
teardown routines triggered instant kernel panics.

Furthermore, when thread initialization failed, the lack of an explicit
unwinding path leaked the session's private context (sess->priv) and its
associated firmware memory block allocations. Because sess->status was
never transitioned to STATUS_INIT, any subsequent call to stop streaming
or close the driver file node failed its state validation checks,
permanently orphaning active platform DMA assets and codec parameters.

Fix these thread lifetime and memory leak bugs via the following:

1. In vdec_start_streaming(), add an explicit IS_ERR() verification
   barrier immediately following the recycling kthread launch. If thread
   creation fails, capture the error code via PTR_ERR(), clear the
   dangling pointer tracking entry to NULL, and jump to a newly added
   'err_poweroff' label to unwind hardware settings and clear out
   allocated structural components cleanly.

2. In vdec_stop_streaming(), protect the teardown execution track by
   wrapping the kthread_stop() invocation inside a safe !IS_ERR_OR_NULL()
   conditional block to ensure the target thread structure actually exists
   in system memory before stopping it.

3. In vdec_close(), cleanly wind down and terminate any lingering
   recycling threads at the absolute entry boundary of the routine
   before flushing data framework contexts and releasing the file
   descriptor matrices to user space.

Together, these changes ensure predictable driver behavior, prevent
kernel panics during low-memory conditions, and guarantee that memory
and DMA assets are fully reclaimed during teardown.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 48 +++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index d1f35fc893de1..7fc73d5cdebbf 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -32,6 +32,10 @@ struct dummy_buf {
 /* 16 MiB for parsed bitstream swap exchange */
 #define SIZE_VIFIFO SZ_16M
 
+static void vdec_free_canvas(struct amvdec_session *sess);
+static void vdec_reset_timestamps(struct amvdec_session *sess);
+static void vdec_reset_bufs_recycle(struct amvdec_session *sess);
+
 static u32 get_output_size(u32 width, u32 height)
 {
 	return ALIGN(width * height, SZ_64K);
@@ -353,13 +357,23 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	sess->sequence_cap = 0;
 	sess->sequence_out = 0;
 
-	if (vdec_codec_needs_recycle(sess))
+	if (vdec_codec_needs_recycle(sess) && !sess->recycle_thread) {
 		sess->recycle_thread = kthread_run(vdec_recycle_thread, sess,
 						   "vdec_recycle");
-
+		if (IS_ERR(sess->recycle_thread)) {
+			ret = PTR_ERR(sess->recycle_thread);
+			sess->recycle_thread = NULL;
+			goto err_poweroff;
+		}
+	}
 	schedule_work(&sess->esparser_queue_work);
 	return 0;
 
+err_poweroff:
+	vdec_poweroff(sess);
+	vdec_free_canvas(sess);
+	vdec_reset_timestamps(sess);
+	vdec_reset_bufs_recycle(sess);
 err_free_vififo:
 	if (sess->vififo_vaddr) {
 		dma_free_coherent(sess->core->dev, sess->vififo_size,
@@ -464,7 +478,10 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 	if (full_cleanup) {
 		if ((q->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
 		     !sess->streamon_out) && vdec_codec_needs_recycle(sess)) {
-			kthread_stop(sess->recycle_thread);
+			if (!IS_ERR_OR_NULL(sess->recycle_thread)) {
+				kthread_stop(sess->recycle_thread);
+				sess->recycle_thread = NULL;
+			}
 		}
 
 		vdec_poweroff(sess);
@@ -970,6 +987,31 @@ static int vdec_open(struct file *file)
 static int vdec_close(struct file *file)
 {
 	struct amvdec_session *sess = file_to_amvdec_session(file);
+	struct amvdec_core *core = sess->core;
+
+	if (!IS_ERR_OR_NULL(sess->recycle_thread)) {
+		kthread_stop(sess->recycle_thread);
+		sess->recycle_thread = NULL;
+	}
+
+	mutex_lock(&core->lock);
+
+	vdec_poweroff(sess);
+	vdec_free_canvas(sess);
+	core->cur_sess = NULL;
+
+	if (sess->vififo_vaddr) {
+		dma_free_coherent(core->dev, sess->vififo_size,
+				  sess->vififo_vaddr, sess->vififo_paddr);
+		sess->vififo_vaddr = NULL;
+		sess->vififo_paddr = 0;
+	}
+	vdec_reset_timestamps(sess);
+	vdec_reset_bufs_recycle(sess);
+	kfree(sess->priv);
+	sess->priv = NULL;
+
+	mutex_unlock(&core->lock);
 
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_fh_del(&sess->fh, file);
-- 
2.50.1

