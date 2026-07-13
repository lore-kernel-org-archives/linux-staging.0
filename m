Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F62F400E0C
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 12:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944577; cv=none; b=BZg6/KNwMV6+C9WzUFLIOTbtczSc2Zb9wz+Qf+hTk7CiS/xNbWZ38Qtv7oLzJOQ8OTtEBk4npCw22AyXDMuxuIHFRJGB9l4yZUUXPtsYYKPLY2UCbRADUEVsqyutLPr1bzOkvB1ymKRYjAOp0LnlZyHlIPhJGZQpDECsiQ2OvnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944577; c=relaxed/simple;
	bh=w1FVvyBSHnItHZLCaA4u0+0Ud64qWBuiALT5aaHxYAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qow3wfp2zVp6+nGhrT7LSYdcIhZs84c2UmJ+a867/WURaczOhVY/tLiOdw9CKEx1prD+JvrwBNr7ujwymauc0fJMzdNo8K0o3aWE0o7HRIdt344n/mmvIcXwJN/NdMMNBq4WkYf7kQGgPHtbnRt+M+pYiYlb9eOPD+KXVH4UvIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/PBQJ5x; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/PBQJ5x"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso3934065a91.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 05:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944576; x=1784549376; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3WTyPeomnpShciKNumkAzLHLjjvlL0zze6H3PBXARM=;
        b=V/PBQJ5xT34eIdJ2sQR3mj9xrrO3Ab2KXEZiNJiyola9hNsm1k50ME6D6qDEkDhzD/
         gtgUOH2aTw9RwtATs81eXYBNbgr6gjLp4pXNkGfqI67YTm/I9vxUalCc9Tl2DowxGD0E
         rvGWNNzwiomDC1HI51xBK5X3dtHmDBjQnvGbmZ7CUZZlsnvCystNFUGDjIoSnA7x58BQ
         nB4Dv1txKsT4LtCENbcHZbqcbizE+RJ1SBvLg/Tn78HpO/YFa36hoYGCG9PKUghzXj7d
         TxoCkXaHJg6/i1IeEfdO4HLJJ09PSO07PqS+UGO2N7Qyz0DQhJg5k98w2sDeonZtVJ57
         MbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944576; x=1784549376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K3WTyPeomnpShciKNumkAzLHLjjvlL0zze6H3PBXARM=;
        b=ryTNpXNm3YyF9tmIrJvB6QE+g9m44d4zaF04z3+9PSX9xQGBjx8LIIFFjrmOn392mO
         tMQZXhY1xrNSOBqcMMUVAcvb79rux/sOTuACIGQC+Tm9Jgma+XQRFxBei8zDDmn77cbn
         cGwKdKWWcCvo4hHb535YJRmxaxtfoJUC/9PmaIlTb7T8jatmlKTVLy1g4shLUNpXkM+W
         Sd25o0XXHloniLJuIYoUa/GJbGEcf2teBrSTw4qjcI5QoQIQUXXDpmECPpProLQWqnH8
         W1JW/+626OHR1IEDRwQ4FqXfqJ7wkIsH63W3T7sD4C0BOBV5I8nDLetoTW2bf0fVKUAa
         xAVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp81e01p1LhhDEiapy3MwRIhOMP2ojwcMvm38knV/0Kc1bnKRveWjFiKph41UhN/DkvcuzhF1vhgAQcNXJi@lists.linux.dev
X-Gm-Message-State: AOJu0YwSfNHwBHDO29hc1uc0hmAggi0ZUt/46h9VJhrjpU+WqChV7tXA
	rPCuEeDmmqnO6LAE7NBu1QHwfghz/VpIlpJ4gwwqg/j47ZKo+6LFdKjh
X-Gm-Gg: AfdE7cnM3NRYFB8xSYb/DIz5XTkiBwjCDaNug/+VeZ9Fw7Dtgg7twbUCasshv3mmf+k
	Ux7aSX4LTCa/ahc+hRDMYKd4fEzSlItGMoHFcc4rGgbvw7/mqo4dGCfZ8BZyK56KhcrthLvifQa
	Vv/PQVHzcF8hx3IOFtSmASwqMgpF5N0RzhxbnCGzmSJGsAVakpJG0QKt6Hxz7c5uPGoXDnc60zA
	hOQs5LKTdHLF+XALiogE5G53eivm9uc55G/t+RBpeli6eQO5zl+NgpZF7mp2RBFuNL1sLuc7et3
	NQJV2CE5k1a8H5kaI8pj5BP2RATRXcNhv84tBV+GAAzQrkbd7RM4lxgsG9fRFGgX9yAjI4v8yeF
	nXTGNbQ22Hde5EMgyKR4Bcu7+Ay2SMpFY1EpWME4XioiEe2aFDb++q9vi50bigxwohIGBTisl3O
	BrMCk0FLxqjA==
X-Received: by 2002:a17:90b:2248:b0:387:e0db:3fae with SMTP id 98e67ed59e1d1-38dc7779d32mr8371305a91.39.1783944575701;
        Mon, 13 Jul 2026 05:09:35 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:09:34 -0700 (PDT)
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
Subject: [PATCH v7 04/19] media: meson: vdec: Fix use-after-free race between teardown and ISR routines
Date: Mon, 13 Jul 2026 17:36:59 +0530
Message-ID: <20260713120840.17427-5-linux.amoon@gmail.com>
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

Prevent critical race conditions and null pointer dereferences inside
the Amlogic video decoder driver by synchronizing the interrupt service
routines during session teardown and file descriptor release phases.

The hardware interrupt handler (vdec_isr) and threaded handler
(vdec_threaded_isr) read 'core->cur_sess' without proper synchronization.
During a streaming teardown sequence via vdec_stop_streaming() or session
release inside vdec_close(), the underlying session structures can be
modified or freed concurrently. This creates a transient window where a
late-stage hardware interrupt can wake up, read 'core->cur_sess', and
dereference an invalid or NULL session pointer, causing a kernel panic.

Update both the hard and threaded interrupt service routines to capture
the current session reference using an smp_load_acquire() barrier snapshot.
If the snapshot resolves to NULL, terminate immediately with IRQ_HANDLED
to guarantee execution contexts do not process stale structures.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Suggested-by: Druk Tan Ozturk <doruk@0sec.ai>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 22 ++++++++++++++++++++--
 drivers/staging/media/meson/vdec/vdec.h |  2 ++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 7fc73d5cdebbf..7ae3d5a9dd6ab 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -484,6 +484,9 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 			}
 		}
 
+		/* Synchronize and flush pending hardware interrupt service routines */
+		synchronize_irq(core->vdec_irq);
+
 		vdec_poweroff(sess);
 		vdec_free_canvas(sess);
 
@@ -989,6 +992,9 @@ static int vdec_close(struct file *file)
 	struct amvdec_session *sess = file_to_amvdec_session(file);
 	struct amvdec_core *core = sess->core;
 
+	/* Synchronize and flush pending hardware interrupt service routines */
+	synchronize_irq(core->vdec_irq);
+
 	if (!IS_ERR_OR_NULL(sess->recycle_thread)) {
 		kthread_stop(sess->recycle_thread);
 		sess->recycle_thread = NULL;
@@ -1038,7 +1044,12 @@ static const struct v4l2_file_operations vdec_fops = {
 static irqreturn_t vdec_isr(int irq, void *data)
 {
 	struct amvdec_core *core = data;
-	struct amvdec_session *sess = core->cur_sess;
+	struct amvdec_session *sess;
+
+	/* Secure an atomic acquire snapshot to protect against concurrent teardown */
+	sess = smp_load_acquire(&core->cur_sess);
+	if (!sess)
+		return IRQ_HANDLED;
 
 	sess->last_irq_jiffies = get_jiffies_64();
 
@@ -1048,7 +1059,12 @@ static irqreturn_t vdec_isr(int irq, void *data)
 static irqreturn_t vdec_threaded_isr(int irq, void *data)
 {
 	struct amvdec_core *core = data;
-	struct amvdec_session *sess = core->cur_sess;
+	struct amvdec_session *sess;
+
+	/* Prevent late-stage threaded interrupts from dereferencing a NULL session */
+	sess = smp_load_acquire(&core->cur_sess);
+	if (!sess)
+		return IRQ_HANDLED;
 
 	return sess->fmt_out->codec_ops->threaded_isr(sess);
 }
@@ -1136,6 +1152,8 @@ static int vdec_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	core->vdec_irq = irq;
+
 	ret = devm_request_threaded_irq(core->dev, irq, vdec_isr,
 					vdec_threaded_isr, IRQF_ONESHOT,
 					"vdec", core);
diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/media/meson/vdec/vdec.h
index cc0cfafb8a951..d165c343fd022 100644
--- a/drivers/staging/media/meson/vdec/vdec.h
+++ b/drivers/staging/media/meson/vdec/vdec.h
@@ -67,6 +67,7 @@ struct amvdec_session;
  * @v4l2_dev: v4l2 device
  * @cur_sess: current decoding session
  * @lock: video device lock
+ * @vdec_irq: irq for video decoding
  */
 struct amvdec_core {
 	void __iomem *dos_base;
@@ -93,6 +94,7 @@ struct amvdec_core {
 
 	struct amvdec_session *cur_sess;
 	struct mutex lock;
+	int vdec_irq;
 };
 
 /**
-- 
2.50.1

