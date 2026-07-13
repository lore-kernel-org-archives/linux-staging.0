Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2537A3F58CC
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 12:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944662; cv=none; b=ZO1Mh0siePhGESOc5cnKd1Wbd7AcDoaXENiiM12tvGd37F3MTIWCIVlLcbpserGXGDw1emBXfsjaNtBojxTvYGZb1csPDgG8FFK8mK6AQi0c8eoNNKaf4/55feuGispUeU+v89mCFMacO9ixTxIKQvwAesE5udPEOOjlKC0o67U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944662; c=relaxed/simple;
	bh=jmhAhBUOyXzBgu367txMVdCDQtWx981CcyJsmZjgz3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RqXXdistv56OvEV4vjmjOMrI5lC7pI1kNv45s8TD73+pYvez91iR6g/REUHW7Aga1RV+RZsAmJxk1Bb2Rot5OoY1OO/mBkaC2aLdJhhlCyB8v+yxsGXA/edcaYw2XRbBVBUhEFWzhES3Od+hRjSG+xNAEm7xamLERxlSTpDaUtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jv4CSD1s; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jv4CSD1s"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cce6a0c9c3so27119365ad.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 05:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944660; x=1784549460; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=or8zdD24QFos1ceTDAq+AN9AMfFHPT46CUnsHlWUgzA=;
        b=jv4CSD1smq4IJB1W0OHKqoF+L5rqtEU7S8bq+mSRuX1qWifwv8y67BLe7jYJUO2ytj
         L/YMKMCDgWj/L7MlKxlwsdRIxjqpKj9Ezp2l6GDN4Uxk8S3knKdt3Jr+nVN8ASQWUcF0
         iuaJwNLFdJp9SgVI0Kq3h3OdpJGnGYDYUePfWqxn0T7bNMgvYSqV2BW/QxH3jRfU+fV0
         9d2rd0tVgUtONYZ5QPKxYRhljjH2fegmpIvegDogchOVgilCDRhPpvT7Vn4OUTkUv81k
         GHHvXlkjgBw242LP/Z86YF7woryRHI5LldqiqFkTRXkVAtjejEAdQFhCbwngf6hyMTY4
         WYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944660; x=1784549460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=or8zdD24QFos1ceTDAq+AN9AMfFHPT46CUnsHlWUgzA=;
        b=diSRjklJtU1rxxnrTQKnTgAS8oTchPWxIXRP0sA/Az31GXEzzxBK50unrCwO2FDFWw
         WSm94fZgBQ7ckWEK7IpzFh83tI0ydf8Iogl+49XVbHO1Rasx5CDrQW3S1zeAapbheT9g
         UGiVLYB0tv82CGpPj6pDCY8zoco66V/0/m5qJjbTsi2mScdvHoXExeyOc3rC1+dse2hZ
         hRO+EF8o971lP0zmFDHjodYYO22uhJo/XnnHwisQ/tNNdqqVuIQENgUiZfcdc9XDLXMH
         imlck+ruggz8s6D96/POqC3wPVCfHIGWrvmHiJyj2At28Bmi+XTcDE6pttwm07Z5faC4
         i68g==
X-Forwarded-Encrypted: i=1; AHgh+RryodWqd+bmVkgZf1kHDpCSGJpSAn5aA3+EnActReTKPkMYhy6GmSnZxtwMGihZqtSBwx5DKnhmAndPb4du@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv83DHvFSrBLBEt3fMrupTjAK2wc4TXpVCOTEr6XFq1zFaPeTg
	exREAj7GoS5bWRRRNLHc5nnX9fqbW+z+l9uKshfqk1108t1ug6Fq90sM
X-Gm-Gg: AfdE7ckG638So2MJdZkTzy9RYZTVA7LV8qc2kNLnfJ5HQ4yLg/1mfHVrPc4cmX4a9tm
	M8edbDx8MrR/3yx6sOlgP2/J+RyHxCKkoAvzc4Gi04di0KpI9FjEapIgqI/Dut3UwP88I95uZnu
	LZ4VPbu9MxSyQ11FImTtnrSf3iGSZngkDaO5s91b6wGM7jaCW/rqcJLiXrAsV/xqAlVq1DsuN8Y
	RKPWn0yWMHOHB52OuBhnknvuVN2XJeLGNUgoM/l2aYiEi6Tgq9B5/SXIRI20qZ31JTryOrYlvg+
	/eDNcupA3IWll2mhRXmUByhM9xkU3z0xGB6Y603kp8MvcsRRpn8a/Lr7RsJqhhLsKJVnlmYGZ76
	+NEscTUKQBPgYO+P7ZNcC/yK5Cv/NvGKiLsQXnaqbO8vuVc10nqFoIBecNgLBr8W5vrfZRDATCq
	6T12d6Dngdnqm1xveKzkNO
X-Received: by 2002:a17:90b:3c43:b0:37f:9ce3:ca97 with SMTP id 98e67ed59e1d1-38dc777b8a2mr8266584a91.32.1783944660581;
        Mon, 13 Jul 2026 05:11:00 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:10:59 -0700 (PDT)
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
Subject: [PATCH v7 12/19] media: meson: vdec: Coordinate m2m task execution inside async loop
Date: Mon, 13 Jul 2026 17:37:07 +0530
Message-ID: <20260713120840.17427-13-linux.amoon@gmail.com>
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

Introduce proper V4L2 Memory-to-Memory (m2m) scheduler pipeline tracking
by handling job finalisation inside the asynchronous esparser workqueue.

Because the meson video decoder offloads raw hardware register processing
and bitstream feeding to an internal workqueue engine, calling the helper
v4l2_m2m_job_finish() prematurely within the primary device execution
trigger context (vdec_m2m_device_run) drops the active task transaction
state too early. This timing gap creates a state mismatch in user-space
multimedia layers like GStreamer, resulting in a fatal "poll error 1"
event abort that breaks streaming setup sequences during pipeline preroll.

Resolve this architectural loop collision by deferring the scheduling call
to v4l2_m2m_job_finish() to execute exclusively within the worker routine
esparser_queue_all_src() at the precise microsecond after an input buffer
payload is fully validated, cleared, and returned via v4l2_m2m_buf_done().
Additionally, protect hardware session context mappings with core mutex
locks and implement volatile early exit gates within vdec_m2m_device_run()
to ensure stable teardowns.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/esparser.c |  4 ++++
 drivers/staging/media/meson/vdec/vdec.c     | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
index b9f36fef4be12..939b239c2af47 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -399,6 +399,7 @@ void esparser_queue_all_src(struct work_struct *work)
 	struct amvdec_session *sess =
 		container_of(work, struct amvdec_session, esparser_queue_work);
 	struct device *dev = sess->core->dev_dec;
+	struct amvdec_core *core = sess->core;
 	int ret;
 
 	while (1) {
@@ -437,6 +438,9 @@ void esparser_queue_all_src(struct work_struct *work)
 			else
 				v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
 
+			/* Safely notify the V4L2 core sub-framework */
+			v4l2_m2m_job_finish(core->m2m_dev, sess->m2m_ctx);
+
 			/* Set tracking flag indicating transaction completion */
 			processed_frame = true;
 		}
diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 0eb39aa6014ee..b3e1d99e8889f 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -149,6 +149,17 @@ vdec_queue_recycle(struct amvdec_session *sess, struct vb2_buffer *vb)
 static void vdec_m2m_device_run(void *priv)
 {
 	struct amvdec_session *sess = priv;
+	struct amvdec_core *core = sess->core;
+
+	if (READ_ONCE(sess->should_stop)) {
+		v4l2_m2m_job_finish(core->m2m_dev, sess->m2m_ctx);
+		return;
+	}
+
+	mutex_lock(&core->lock);
+	if (!core->cur_sess)
+		core->cur_sess = sess;
+	mutex_unlock(&core->lock);
 
 	schedule_work(&sess->esparser_queue_work);
 }
-- 
2.50.1

