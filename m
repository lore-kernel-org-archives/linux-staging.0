Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC71934C83C
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 17:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783964345; cv=none; b=hd7iDwrKFBJ9JpUucYzgJNu6609e2TOTAj/n8gxvbQQGmChrCF1sQzQpWBin4BwxS7UeM3j5bMQfz8xNhlNZBHj+8guwqq3oB1+rm1A2ovAoChHn9y0s+4NghoPTNluMrobadMD12pu1XjkvkOoVDZR9JHOYXaZ+Hzti3e8W7pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783964345; c=relaxed/simple;
	bh=+UfnnAywhWfDmMFu2HtpjxsWcBfvg1aF8Wh4AXz/GD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sgPWLD6U2b1bewLfIvyXuET4MoEC/ZUEoFJyyyDvVSwom8j+zrPbMnX1KvuJxLGTEZcqGWG5mX9QtU3nNzmk51IxegewL3SCsZO/5Cp3g9WRlYrCVNj/0jfU8sVa9y5fvIs1IfJaO5EV2qm2tJ9lsxJi+vtrZnD8pARoAit2F2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aP8zqHWG; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aP8zqHWG"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so3296125a91.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 10:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783964342; x=1784569142; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JJTXKcUVPMM2q094v4fU7tfA4D6n06AAOLUKvX0e/q8=;
        b=aP8zqHWG7qCWzTnvYvPricdNMfi6a6ABYUsbmnspO1P2UEVbImEDbamfvmVgx8Ncpt
         45Fx0lkpHYCDOl5UDDHfq+kpiRNHQbuy/vZxAlAbnSM3TOWnlSaevAgnG2yHNO18ct1w
         eIcFfBbowJiXLetx9JrTnLRiCskpY9FftTDVn8BIAUvfU03cLpPFwp7gGxZbFey1ybjU
         68lc/TuQtchHssWi8iQ/wMokJ5ed3N2ktCRag7B1RoGVJPrVTtTcqK1w9ePWymToyhbz
         Y7T4mu+RnQVNuYbvRAqmRDIOpi1kkDVWz1fZnNBNRgQtYexZfuyj+x2hu+TwNdkOTs1M
         5aiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783964342; x=1784569142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJTXKcUVPMM2q094v4fU7tfA4D6n06AAOLUKvX0e/q8=;
        b=Z2ninXYCgorpTXlZpv3pqKeeTnMcUKH1f3cr4/pnO2OIOLHXX2gzvV9ZLLbw9ZTo0p
         f2r+HVAcHlsygBv8eP+1jv7G1uekEFulkmHbc0CpxhXmIeoZ9t9F2J9VkS3A85P4ZYFn
         fD61jtrj2PxuTlosGPIlsCJsDQosohTqEA97utW2od374ytD43Vfw6ZofGrQgUDch1rP
         v4lUnP2a8eIc3cQ/96wqLJVPr22b9sMW43SAR1UEc6YP8ec48WfWDRsSAzbIXaPgLOUg
         ioE6i7KdNZB+9kmjE5seo8A5wFYzKXDoVlv/0vXDGv/8xlekpiHeKdNbXAor2rGCC0+g
         8LbA==
X-Forwarded-Encrypted: i=1; AHgh+RrjueVO9mPRq9MnOzaxQkjDBBemXAuoKM08t3RPFa6z6wAi4R3z343VcnO9BD2N6SOV0sI/SDQL652TmJ0z@lists.linux.dev
X-Gm-Message-State: AOJu0YyVONSVdHLRdqU+Spu9JElElvF74DF7sN2fHuCSKQ7ojFNeCWf/
	6fo1g4WiQDDupyc2/NGYqbzzLX7sYjbbYFEtEHkehgzYKxQToR8tjwQO
X-Gm-Gg: AfdE7cnoeVgRMU4WRoCDlujDhlLXTHmPFr06MnYXbWauyBKw2VEys5Xm8bupqSXqT61
	9vSeOq0To3lwG0WZ/QQC9Sk6Cr4/DDtOOip7z/UHyKeZeijN/Pp74cgzHWEn6aiwnBfsm+FHMc9
	nXCqoBZePxg3xH/Cuo8+VYvZlkK88l4b3+QCX/GOc8dHEq+KjoNTzgpTmia4aw+YgTF6088+kzb
	1wXU8XIkEr/C/L8PaVCm9Ohu+qn9raw+NWmEJLQuhsEVIaw5js7u6vGPX0kFZESuEG/zsBqyLSE
	7kkwqhwl2lvYT2DEX07z1ofMEhOCVytWGkoJCzpT1T4j2uYedcB8YBkUg2CQbOZXHZpNQz8xLUv
	qs5yIT0VhB+mN+ueKn1fYLr15MARkh+ejG4C6zesb/3QiCgDxTskbdUdiW+HrsUT55sP5KxeYxE
	5mf3SRBLTTKLnllQS31piqWndZaE594xUxEeshvvGDwN7RB2YPlVLtBiEEKkmhtTKiJjgJaB9LP
	7piH5j67JEYOZWvB6xCU1T10GsY7GYG0uQ6Hyh9TIfVF4c=
X-Received: by 2002:a17:90b:134b:b0:37d:ee77:78ac with SMTP id 98e67ed59e1d1-38e17dce582mr175439a91.19.1783964341727;
        Mon, 13 Jul 2026 10:39:01 -0700 (PDT)
Received: from OMEN ([103.184.238.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31198cb2b99sm48273547eec.26.2026.07.13.10.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:39:01 -0700 (PDT)
From: Alfie Varghese <alfievarghese22@gmail.com>
To: neil.armstrong@linaro.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alfie Varghese <alfievarghese22@gmail.com>
Subject: [PATCH] staging: media: meson: vdec: fix UAF, memory leak and NULL derefs
Date: Mon, 13 Jul 2026 23:08:59 +0530
Message-ID: <20260713173859.643-1-alfievarghese22@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This combined commit fixes several pre-existing issues identified in the
Amlogic video decoder driver:

1. Fix a critical Use-After-Free in vdec_close() by synchronously
   canceling the sess->esparser_queue_work before freeing the session.
2. Fix a memory leak in vdec_close() by freeing the session control
   handler via v4l2_ctrl_handler_free().
3. Prevent a potential NULL pointer dereference in vdec_probe() by adding
   a NULL check for of_match_node()'s return value.
4. Prevent a potential NULL pointer dereference in vdec_isr() and
   vdec_threaded_isr() by adding NULL checks for core->cur_sess.

Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index a039d925c0fe..b794ad53711c 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -926,11 +926,15 @@ static int vdec_close(struct file *file)
 {
 	struct amvdec_session *sess = file_to_amvdec_session(file);
 
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_m2m_release(sess->m2m_dev);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
 
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
+
 	mutex_destroy(&sess->lock);
 	mutex_destroy(&sess->bufs_recycle_lock);
 
@@ -953,6 +957,9 @@ static irqreturn_t vdec_isr(int irq, void *data)
 	struct amvdec_core *core = data;
 	struct amvdec_session *sess = core->cur_sess;
 
+	if (!sess)
+		return IRQ_NONE;
+
 	sess->last_irq_jiffies = get_jiffies_64();
 
 	return sess->fmt_out->codec_ops->isr(sess);
@@ -963,6 +970,9 @@ static irqreturn_t vdec_threaded_isr(int irq, void *data)
 	struct amvdec_core *core = data;
 	struct amvdec_session *sess = core->cur_sess;
 
+	if (!sess)
+		return IRQ_NONE;
+
 	return sess->fmt_out->codec_ops->threaded_isr(sess);
 }
 
@@ -1020,6 +1030,8 @@ static int vdec_probe(struct platform_device *pdev)
 		return PTR_ERR(core->canvas);
 
 	of_id = of_match_node(vdec_dt_match, dev->of_node);
+	if (!of_id)
+		return -ENODEV;
 	core->platform = of_id->data;
 
 	if (core->platform->revision == VDEC_REVISION_G12A ||
