Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539123FC5AB
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 12:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944544; cv=none; b=NsLpGSyCXxziGynWqzEmQrOKaWRU3iPN7MOVcN+GsBOS82E5v0lMzIW34ZJEJS02FqKD2+avJtMk7XeLCgGQrTheO01z1juo0k/1ggr3GoeINGJEdmdtNObU08nFGU9J2HhR0N91yAAH8m83ZrhO+OCpTgvVQCAwI4jJP6q9NfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944544; c=relaxed/simple;
	bh=cl53inObwN0kZLnRPY3uNUdKQLoT80ggd4q5F9Ek/xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=avmX5be5QBWW7ogeLyiJja1hlg/0v5qp2vXidUHeMwI8e5iVgF+40ODzNBOlY6nvjpa3mP6aFfKxqmuAww3hvAO53JIJgoFXbEsaahYZvAfjEv+pnC0hHqVXnLHZDtaFqXI63A/ocN406Pq3cgv67W2yUGNM9bzBknfSVydJdF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmEXyaS2; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmEXyaS2"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-381891a9525so3417503a91.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 05:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944543; x=1784549343; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ARrER7TwdRrsnOsOCnXp0K3Qc6DycIa1Bph8QCPIN4s=;
        b=kmEXyaS25LsipXH23zA917Rbh+gziWXW62eUZfjYWoViPOzDDBuc9Ktskx4g8mqZgo
         OBpp8n0VKnZboWSLYpGnFn8jTk5Ytu0wGIdNhuziKtrwS9V81zz/SYJmDJEr/rQ6E9PG
         1e8lb4o1MFUCs0wJf9REY1Vf16EfzhaCoAeYBaXNEyA52YTxiyZejFROeMZ922QuvV5B
         G9gGj5LLq7G2VFFDI5vLIfSa1GkOa6+QOA0bJh7ksoRcmPh9KE9DFLDNOI1POt0XUv68
         DLarqjqtTIHURpUSvdpQhfIKDPdWZ8FZqd7lmCJIIgGnREXFBT0L53vkEAyDaroJshnH
         A0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944543; x=1784549343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ARrER7TwdRrsnOsOCnXp0K3Qc6DycIa1Bph8QCPIN4s=;
        b=WOTI5u5iSvQsNNPOiTYXUpVNHaNsF84GO10uadPMrOMm3pOZuf5PJWwJC2UjcJFqy+
         byUskp8VipHJ083FPhWVBt+wHEnNYz37Qwjdqw8P0RMYECZlljdr79auve4BHB2scUmD
         AZjnmsCsaJ8nOv6H27vC9EfEOahKff2Btw7naTWV/fHULiSaWIDyRAOBY8ddNU6tjQ+v
         3zMxjjyoUE6y2u4QEfxDV8+KWNYKuVAU5F+WuXc+hG5luQ+zzKbJdvbpVNIGM6e6MDrQ
         6pRGUoinOVblvZ9AcfYWJNZR2f6JVxA4tilbsjLmcuLcSi/gHbR8L5nsnF4WbdjfeYks
         pZ3w==
X-Forwarded-Encrypted: i=1; AHgh+RrJJd5DjBllzmjR5ou1hkPBzWvZUYtFs4YOpv0QrajO9iglPIYnfttY4XBiUd5m6Q5kry4Ts/+URX3o6/zK@lists.linux.dev
X-Gm-Message-State: AOJu0YyDkpfFDeBMemC7JyzcwODvKPrPezr0Df+idGuGkM5lbggKgH4A
	ipzz9yvO+19871DK6FGpoSe9b/FNvciYBVp1CiEgTeSzqzHVCQfDl6y6
X-Gm-Gg: AfdE7cn1vCXU9V5I9KGvbaPkdCACWIAV0gFeiVfLDN5CHL5GM0L+4se8wWq7REyu3kR
	WSPo9gf/y9G3IzZUP7S2F0Sq65+JffPJio8PpF5ctPiS2ZavK/6ukovvW0IvyaB7CATVwZWG3Ri
	j4WH1wqBKdc7Nz25rbVR9uDxcOTzI0e9PaWtRiyECP/LVtOGg3jSKvljd/bHJirNOXrAtpR/abz
	aGvyn/JM9HKfGtwJOTUYKtzuok/0wuZD5vH8fLbj7Zz6DIQqLcWI3NaxDro/PpkBgW2sWI3e8eR
	GAkYgK3q5QPa39ePN7zuUQWhOsUnXEwI0wtf0WGoQSGWQP3YKbxmkf8UTkXX9owwRNnou+vzK3b
	edojTxe/VuZDOxN8rG1yxjiYWF8asWkkNViwyUIbs1Xtjvz5uAm1DVyZFk4tMMzw3joy4TRcjDW
	xDUkoCn1DMZw==
X-Received: by 2002:a17:90b:2750:b0:37c:18e0:90dc with SMTP id 98e67ed59e1d1-38dc75ebea3mr8633908a91.16.1783944542617;
        Mon, 13 Jul 2026 05:09:02 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:09:01 -0700 (PDT)
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
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v7 01/19] media: meson: vdec: Fix m2m device lifetime and cleanup path
Date: Mon, 13 Jul 2026 17:36:56 +0530
Message-ID: <20260713120840.17427-2-linux.amoon@gmail.com>
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

The vdec driver was incorrectly initializing a new v4l2_m2m device
instance per session inside vdec_open() and releasing it in vdec_close().
This design is faulty because the m2m device models the core hardware
engine and must persist across multiple sessions.

Fix the lifetime by moving v4l2_m2m_init() into vdec_probe() and
releasing it in vdec_remove() which resolves passing the global
core->m2m_dev down to session contexts so all sessions share the
same hardware instance.

This change aligns the driver with proper v4l2_m2m usage, ensuring
the hardware device lifetime is tied to the platform driver core,
not individual sessions, and making teardown safe and predictable.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel.org/#t
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 36 +++++++++++++------------
 drivers/staging/media/meson/vdec/vdec.h |  4 +--
 2 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index a039d925c0fe5..6ae3471155a87 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -153,7 +153,7 @@ static void vdec_m2m_job_abort(void *priv)
 {
 	struct amvdec_session *sess = priv;
 
-	v4l2_m2m_job_finish(sess->m2m_dev, sess->m2m_ctx);
+	v4l2_m2m_job_finish(sess->core->m2m_dev, sess->m2m_ctx);
 }
 
 static const struct v4l2_m2m_ops vdec_m2m_ops = {
@@ -873,23 +873,16 @@ static int vdec_open(struct file *file)
 
 	sess->core = core;
 
-	sess->m2m_dev = v4l2_m2m_init(&vdec_m2m_ops);
-	if (IS_ERR(sess->m2m_dev)) {
-		dev_err(dev, "Fail to v4l2_m2m_init\n");
-		ret = PTR_ERR(sess->m2m_dev);
-		goto err_free_sess;
-	}
-
-	sess->m2m_ctx = v4l2_m2m_ctx_init(sess->m2m_dev, sess, m2m_queue_init);
+	sess->m2m_ctx = v4l2_m2m_ctx_init(core->m2m_dev, sess, m2m_queue_init);
 	if (IS_ERR(sess->m2m_ctx)) {
 		dev_err(dev, "Fail to v4l2_m2m_ctx_init\n");
 		ret = PTR_ERR(sess->m2m_ctx);
-		goto err_m2m_release;
+		goto err_free_sess;
 	}
 
 	ret = vdec_init_ctrls(sess);
 	if (ret)
-		goto err_m2m_ctx_release;
+		goto err_release_ctx;
 
 	sess->pixfmt_cap = formats[0].pixfmts_cap[0];
 	sess->fmt_out = &formats[0];
@@ -913,10 +906,8 @@ static int vdec_open(struct file *file)
 
 	return 0;
 
-err_m2m_ctx_release:
+err_release_ctx:
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
-err_m2m_release:
-	v4l2_m2m_release(sess->m2m_dev);
 err_free_sess:
 	kfree(sess);
 	return ret;
@@ -927,9 +918,9 @@ static int vdec_close(struct file *file)
 	struct amvdec_session *sess = file_to_amvdec_session(file);
 
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
-	v4l2_m2m_release(sess->m2m_dev);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
 
 	mutex_destroy(&sess->lock);
 	mutex_destroy(&sess->bufs_recycle_lock);
@@ -1059,16 +1050,23 @@ static int vdec_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	core->m2m_dev = v4l2_m2m_init(&vdec_m2m_ops);
+	if (IS_ERR(core->m2m_dev)) {
+		dev_err(dev, "Failed to initialize v4l2 m2m device\n");
+		return PTR_ERR(core->m2m_dev);
+	}
+
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret) {
 		dev_err(dev, "Couldn't register v4l2 device\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_m2m_release;
 	}
 
 	vdev = video_device_alloc();
 	if (!vdev) {
 		ret = -ENOMEM;
-		goto err_vdev_release;
+		goto err_v4l2_unregister;
 	}
 
 	core->vdev_dec = vdev;
@@ -1096,7 +1094,10 @@ static int vdec_probe(struct platform_device *pdev)
 
 err_vdev_release:
 	video_device_release(vdev);
+err_v4l2_unregister:
 	v4l2_device_unregister(&core->v4l2_dev);
+err_m2m_release:
+	v4l2_m2m_release(core->m2m_dev);
 	return ret;
 }
 
@@ -1105,6 +1106,7 @@ static void vdec_remove(struct platform_device *pdev)
 	struct amvdec_core *core = platform_get_drvdata(pdev);
 
 	video_unregister_device(core->vdev_dec);
+	v4l2_m2m_release(core->m2m_dev);
 	v4l2_device_unregister(&core->v4l2_dev);
 }
 
diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/media/meson/vdec/vdec.h
index 7a5d8e871d708..cc0cfafb8a951 100644
--- a/drivers/staging/media/meson/vdec/vdec.h
+++ b/drivers/staging/media/meson/vdec/vdec.h
@@ -63,6 +63,7 @@ struct amvdec_session;
  * @vdec_hevcf_clk: VDEC_HEVCF clock
  * @esparser_reset: RESET for the PARSER
  * @vdev_dec: video device for the decoder
+ * @m2m_dev: v4l2 m2m device
  * @v4l2_dev: v4l2 device
  * @cur_sess: current decoding session
  * @lock: video device lock
@@ -87,6 +88,7 @@ struct amvdec_core {
 	struct reset_control *esparser_reset;
 
 	struct video_device *vdev_dec;
+	struct v4l2_m2m_dev *m2m_dev;
 	struct v4l2_device v4l2_dev;
 
 	struct amvdec_session *cur_sess;
@@ -183,7 +185,6 @@ enum amvdec_status {
  *
  * @core: reference to the vdec core struct
  * @fh: v4l2 file handle
- * @m2m_dev: v4l2 m2m device
  * @m2m_ctx: v4l2 m2m context
  * @ctrl_handler: V4L2 control handler
  * @ctrl_min_buf_capture: V4L2 control V4L2_CID_MIN_BUFFERS_FOR_CAPTURE
@@ -230,7 +231,6 @@ struct amvdec_session {
 	struct amvdec_core *core;
 
 	struct v4l2_fh fh;
-	struct v4l2_m2m_dev *m2m_dev;
 	struct v4l2_m2m_ctx *m2m_ctx;
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct v4l2_ctrl *ctrl_min_buf_capture;
-- 
2.50.1

