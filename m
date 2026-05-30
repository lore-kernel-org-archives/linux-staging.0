Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6969F399011
	for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 09:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780134274; cv=none; b=W+5GnVw2fAGp6QBGUZBvNsD9sdVrAixn/d5tpNhFaHMDVWmG4m9OIU4IOkc6o0xfsAcbeCKgnFfXJy8UIcacoySMDwtWdjQ6BjC4IB5IE2s/lt5O4zWMzq3mygY0leq4yUKIsWY+3lgZo7C8Z0UEye6XzWjPgukSR3V8PbKKvpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780134274; c=relaxed/simple;
	bh=+strja15rp5bfFyNtAbt1Pazm6s+foPib4qovmXYo1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WZOa6qGNI5gRG3p5Btz+79g5iBDXqrH4PIc4Wd8u+6gZrGy62vaigaMUmNo1bAr/msia6RFFYInAMDJaYTHYxNsPn41msBLMvZnVkw9JOm+wNOF91dbS4OZAkY50jHC2g6Gw0TKZi0OG5aLMR6XQBn+L6OB7pNWxVWMdmnyubyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUZMhJ94; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUZMhJ94"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ba4a1a0325so98838925ad.0
        for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 02:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134273; x=1780739073; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrXJFZmxeXg5CYXAWJIPwYaWF/wPAlGFj3atI5I4qIQ=;
        b=VUZMhJ94J9m1XJ/sSeblbRPXqB5/rpgtZnckHcYvgr24C3/nkwgNKNjmceN3nuMp1z
         +zmm+dFacnAS9rgC35mZFPstWE6LJJTQ32TPGj0MsBUGH2CKt+pzCy9fYtGqDGimgknG
         dTRPBs3QxJ90s9sXIJVcm4CWWFR1eVgvZDwxtpSxR7kDg+nRMMLuUb3NUCYckaInpsRp
         rhL5KzAQm4Ks/zKlVcomDXWY6C7yQyudDDOo0RiwMTv+I7TLhnelZYElAQ7E0T+RB6kb
         scabywB13IFoBxXTA1pIsZmpnSu4T69ioGh4RZ5h6HC5pFUU2/tI0IQANFENSnGw8gjQ
         hKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134273; x=1780739073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BrXJFZmxeXg5CYXAWJIPwYaWF/wPAlGFj3atI5I4qIQ=;
        b=tUMSK9ocVWz6ZXuBHOTe2JDFqDwpEzR1dMESaBZdiYXAtcRlXq3N9CarVSmeGaReu6
         W0FPeSzft+mGsbme15HQaZiHdiWdCAjG2nVB4/R1/KHgoZmD1krff+9zZE4qb8dhaYbr
         bIOb+jOg+ZMRJWoYbi8B1S/kQ80q88Z8aUvyjey4MCgwdqOTcnw1x0SGTL93E+gFe30q
         ZVjpUGvDP18ziFrR153cCxs3ufniYnjAT2SUGUfJ7qdebFO5bq+2vXkIjvNP9wWCfdUb
         mSlduOmfyvHEpsPfOj4PMeeBqZUnpJvHSXjLi63PO6W78sGPawqsf1+ZhfWplmH49yMv
         wkZA==
X-Forwarded-Encrypted: i=1; AFNElJ+yzB8OYKJvCw725THjp6esrMjyNbKdo+thBDrCbrAuQ5CuUK2SNKd8oxZj7RP3n+xpX/EAqq3MwA6+WIfw@lists.linux.dev
X-Gm-Message-State: AOJu0YwjMqvkV9tQaGEzwHbBvy8O3ULNVKLeGkOvu7QPbtexKuo1kRB0
	If+6gAqaPQIt9Agw0MxpwEcsejfOuxy25LCQ/atByuzDf5oIZrvJcSR5
X-Gm-Gg: Acq92OG6FIRV0EF06OgwOOBf6HDa7GIc5R/tMmjdXnhxZEIEHNAjUgahhoez4Ed2jhX
	60UQjS5t0HuMi4mSSHgARRspcyAmJbZVEpNVGjyUlPApjOcT1E/lENlyBTpsH82fxXQ4a3q8YkE
	8OwqULVluMebd/xz0GKFSGQyBD1YeztL3jNCO6C+B8oLhDkdBhqZyAH4GJoFEP40xR9KIkTcxK7
	i91BA5nOFB07eRz38o4B20ThyffPiU22PPg5W30cdScAg/9hA9eMPuWmlJiMGsYev3q3RRutkiw
	18J+X/k+JeIxIuSqvpitNlG3Ck+f0eDZBUTzQ4+qSRCLyqhj7ykmJB3XiaOocLMZgDbecBGH/+F
	1PdOccX4MRGQTJkc5PRFidZw8lxr5eDxl+0nN4QvWSg3BwUR8mP1PVjTYwIfV8SNkcZzZwj+kKA
	9rdxbs+NqXEMblPdiu1klDbokyIkfJksk=
X-Received: by 2002:a17:902:da8e:b0:2bf:356f:4e0c with SMTP id d9443c01a7336-2bf36793916mr38435335ad.1.1780134272635;
        Sat, 30 May 2026 02:44:32 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:44:31 -0700 (PDT)
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
	Maxime Jourdan <mjourdan@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v6 3/8] media: meson: vdec: Handle kthread failure and free codec state
Date: Sat, 30 May 2026 15:12:49 +0530
Message-ID: <20260530094326.11892-4-linux.amoon@gmail.com>
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

vdec_start_streaming() launches a recycle thread when required by the
codec. If kthread_run() fails, the previous error path only powered off
the hardware, leaving sess->priv and codec state allocated. This caused
a permanent leak of the codec context and associated DMA buffers.

Fix this by introducing a dedicated err_cleanup path:

- Call codec_ops->stop() to release the codec context and clear sess->priv.
- Power off the hardware before freeing buffers to avoid DMA faults.
- Free canvas IDs explicitly and set sess->vififo_vaddr = NULL after
  dma_free_coherent() to guard against double‑free in fallback stop paths.
- Reset core->cur_sess and sess->status to prevent stale references.

Following change closes the memory leak on kthread_run() failure and ensures
robust cleanup of codec resources in both error and stop paths.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 26 ++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 7233000e2232..8a5bf1a96830 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -32,6 +32,8 @@ struct dummy_buf {
 /* 16 MiB for parsed bitstream swap exchange */
 #define SIZE_VIFIFO SZ_16M
 
+static void vdec_free_canvas(struct amvdec_session *sess);
+
 static u32 get_output_size(u32 width, u32 height)
 {
 	return ALIGN(width * height, SZ_64K);
@@ -352,16 +354,31 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 
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
 
 	schedule_work(&sess->esparser_queue_work);
 	return 0;
 
+err_cleanup:
+	vdec_free_canvas(sess);
+	vdec_poweroff(sess);
+	if (codec_ops && codec_ops->stop && sess->priv) {
+		codec_ops->stop(sess);
+		kfree(sess->priv);
+		sess->priv = NULL;
+	}
 vififo_free:
 	dma_free_coherent(sess->core->dev, sess->vififo_size,
 			  sess->vififo_vaddr, sess->vififo_paddr);
+	sess->vififo_vaddr = NULL;
 bufs_done:
 	mutex_lock(&core->lock);
 	if (core->cur_sess == sess)
@@ -441,8 +458,11 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 
 		vdec_poweroff(sess);
 		vdec_free_canvas(sess);
-		dma_free_coherent(sess->core->dev, sess->vififo_size,
-				  sess->vififo_vaddr, sess->vififo_paddr);
+		if (sess->vififo_vaddr) {
+			dma_free_coherent(sess->core->dev, sess->vififo_size,
+					  sess->vififo_vaddr,
+					  sess->vififo_paddr);
+		}
 		vdec_reset_timestamps(sess);
 		vdec_reset_bufs_recycle(sess);
 		kfree(sess->priv);
-- 
2.50.1

