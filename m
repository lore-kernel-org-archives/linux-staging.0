Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A2C39A7F6
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 07:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779348934; cv=none; b=aI6EV7NOb3Sd/z6eoYFL2i+g1Z/fZS+Q9LyXZBNH/AU23GaabOZgC5IGhuAsWOe5lhuogLWV8utBsZiw0lxu6oELKMA0V3RKUDhps1gJzOhXZd3Tv9eDTMyLj4Fkcv2aw+72BQSdV0/Bft7uxFKaEgpEznQpPzTlw3C2n3EMcvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779348934; c=relaxed/simple;
	bh=R3voIaLtl2BRlPPKHEPBQ78/UAuVNbWj0w+ZXJI+bb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BtUmPlDj0xba8fToKe+0tWYKKnqV4Hdwu44ytDnx+iOkgijomCLwC3pF2FmZEF9QFD4qt5/asF5Lfyz//g4xTPOb3EtPH8DvDr5mebZ6skOJccKJm+EGGIyfL42vg14tMGZRCgLBWmoAnKrvo9Dy46jnhKlGOUJErojq7giFMdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IqUA0zlB; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IqUA0zlB"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-366be8040a9so2419342a91.3
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 00:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779348932; x=1779953732; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3NPvLu4dxOkoKdNg46+oSXq3CipWU7w/mHnMaydoddU=;
        b=IqUA0zlBNcsMbLo6ntxhQdw99jVl4oey+mq3yBkUA5pXuNLQrishj2glFKT5+aSIj6
         E3O6OwWRUeeOZ/OZq9RUFGllatKCGOTUL0sW3uHt4O+u50XrrTG21HwwpaaRiyZtf/jI
         /xzCn845ZnooW/EqFG7bGBoHrBDCuL+r4CmP0eU6gbn2ePOmN0cb/NSwpwjXG7XUW74L
         aH1sikugPdGzyId3lC+FS//7aQDcg9klxL2bLLF2QUrhYCfbkSecH4LcQhlIyKsFfgng
         jhww8fMyZCjQSkOhGDoK4exZhpsjH5OH4nYhIauHYLJ6EfEiFjnzK+zHoZVoFHqu61sV
         tsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779348932; x=1779953732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3NPvLu4dxOkoKdNg46+oSXq3CipWU7w/mHnMaydoddU=;
        b=RlA1QX+OfAyFiCKgW8Zi9mYPqf3YRhpfyWDH5SDFLgB0P2Ap1y6yrbtz3+sFPe3qcO
         cnR95dfX+JMa5IZa5DERCW2Tje84MWduSx2H/3KMv135UUyP3UHE5WXgnKNy0ZAcAZTB
         Pu2KSK7CY4JKF3xQB1w3dLh4D+f/aaIbgjU8IycqpnAL2uvUF4vm86lXcGllcoZkikOh
         2k/iFWt3QRL5Sg9No50tVa9JFlrPx24Ymg5H2dbkmxI9B/5retX/YLrHWid0LNQVn8GY
         QWWQQPlSwP3D5osAzxHpZcAc9ew/KNtWpGAuLmfhZptsd77vrQgItZkqf4Hmk64t7ZoN
         hkPg==
X-Forwarded-Encrypted: i=1; AFNElJ8hr+QB8Br9w4uZoW6M1CPVonNTZTgVskpvDjElXXMoYD2kpJ1kzyXmHF9oAFuAlAjSAczedz74CsgcVPoX@lists.linux.dev
X-Gm-Message-State: AOJu0YyRNYjWwK4R/tYj4gAOC0iB8TyvG6XjG9XitMn/2y28p1ypu23A
	s1vLKPBv1XGL1u9pgOMrNoHtwGziPfStmJ7/HMYPCr5JXmL3xnSuNZoP
X-Gm-Gg: Acq92OHevpVrEtShKyrBd4js+UdHyGNT1aLFp3wfeT8DkpdeMAMiExJCVfFEEdIFLiq
	4ul5i03r6S5koNCKLg6QlVMQd8p58TO+jY/1E0pYWBDZ1Xke4KXzZ+zOQi1jCFciQCj1lwdTJc+
	XUrPjUBEoxM63zL55r5jQ1JVu4etnCErSGyx6FdfMWeKkPdnaHfGIa/w3SyTxQqYV42ryhlArZ5
	GpCRhdnbkx+ZTd6M380qi4M22G9r7hZWcmtSsyoKLcH0hXRMaSIalsK8TS/QbzTl8TtzAhhPmJx
	IrTiGlqXhJSrBnCZ9pREPFUEuYvZReYcn3w/0VrOoq5VND0LIObRUvVTRC4NRtNHTrZ2FKizlR4
	RKTI1DRVrVnl7B9ZtPtMRoiIZmI3nvv+Utc4OFGk090UcI+ab/o7OrF3KfWoyo4Uswkm9yTTzMr
	Xp4/D/7WJJEoh5jnMkQAQ+4fPWe9G6NzY=
X-Received: by 2002:a17:90b:3c08:b0:35d:a3b4:2f0d with SMTP id 98e67ed59e1d1-36a45137990mr1777189a91.6.1779348932255;
        Thu, 21 May 2026 00:35:32 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a45c5decesm783833a91.1.2026.05.21.00.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:35:31 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v4 2/3] media: meson: vdec: Add error handling for recycle thread creation
Date: Thu, 21 May 2026 13:04:12 +0530
Message-ID: <20260521073449.10057-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260521073449.10057-1-linux.amoon@gmail.com>
References: <20260521073449.10057-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add proper error handling for kthread_run() in vdec_start_streaming().
If thread creation fails and returns an ERR_PTR, record the error,
reset sess->recycle_thread to NULL, and unwind resources via err_cleanup.
This prevents later calls to kthread_stop() in vdec_stop_streaming() from
dereferencing an ERR_PTR and causing a kernel panic. Fix this by adding the
label and invoking vdec_poweroff() to prevent hardware power leaks.

Additionally, reorder the error path to properly mirror the allocation
sequence clear the streamon status flags before emptying the M2M buffers
to avoid race conditions, and ensure DMA buffers are released gracefully
relative to the hardware state lifecycle.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel.org/#t
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v4: new patch
[Severity: High]
This isn't a bug introduced by this patch, but does the driver verify if
kthread_run() returns an ERR_PTR when starting the recycle thread?

If thread creation fails in vdec_start_streaming() and returns an ERR_PTR,
could a later call to kthread_stop(sess->recycle_thread) in
vdec_stop_streaming() attempt to dereference that ERR_PTR and cause a
kernel panic?
---
 drivers/staging/media/meson/vdec/vdec.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 9244fb09eb36..8615a935e86d 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -337,29 +337,37 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 
 	sess->sequence_cap = 0;
 	sess->sequence_out = 0;
-	if (vdec_codec_needs_recycle(sess))
+	if (vdec_codec_needs_recycle(sess)) {
 		sess->recycle_thread = kthread_run(vdec_recycle_thread, sess,
 						   "vdec_recycle");
+		if (IS_ERR(sess->recycle_thread)) {
+			ret = PTR_ERR(sess->recycle_thread);
+			sess->recycle_thread = NULL;
+			goto err_cleanup;
+		}
+	}
 
 	sess->status = STATUS_INIT;
 	core->cur_sess = sess;
 	schedule_work(&sess->esparser_queue_work);
 	return 0;
 
+err_cleanup:
+	vdec_poweroff(sess);
 vififo_free:
 	dma_free_coherent(sess->core->dev, sess->vififo_size,
 			  sess->vififo_vaddr, sess->vififo_paddr);
 bufs_done:
-	while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
-		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
-	while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
-		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
-
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		sess->streamon_out = 0;
 	else
 		sess->streamon_cap = 0;
 
+	while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
+		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
+	while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
+		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
+
 	return ret;
 }
 
-- 
2.50.1

