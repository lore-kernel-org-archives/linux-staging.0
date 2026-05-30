Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9450385D84
	for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 09:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780134286; cv=none; b=d4fg8zwN4i0PeqFZ+p2GRHFN9p5n37s1kgbq0mkd4iK0DRDVX5ebq54sXK3q0/24H7nf063Y+39KLvx/z978Z0M9QD+UBMBr9mc5s2Wuh/uq041XKjnp1W+TrLp2EBSbtEtbqYPkNrRJYZKgRCjEJb0hx3Z0PvXs653uEmJU5vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780134286; c=relaxed/simple;
	bh=G4dcvjVYZuF9c1fC6zIr8U0LMJapQ16RTisqEjiIVMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qqnC0CJSCX0ggBZ1bjPOGxZ6qXMTzS2RAMhd3Tjy7JxxqEtTdn7P8pDayJQOMbmUB5wKgtAIpD+8GccLZgv2fIKjnWV3+q2iuW4YB7l1vLQIOZlIte91HgS8cpcieoTwG/JCb0enYqVAJgM/fxFx51/xgV7zcqz4Ehzu42ZpbzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFHUqw2W; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFHUqw2W"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-369002b26f4so8647745a91.3
        for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 02:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134283; x=1780739083; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Je0r03zFWDk/tHsmcp50GPWfnKiSAfNBSvNM4tTawBM=;
        b=PFHUqw2WW7/WkAB/ggTPJlcsJZ7xQSfy2SEIy/T4jHSAF9blPJq7Kk4h1YA0yap27r
         Py+aDdtAuTKo8rUwZpfJobabKZJLy49W5fPEbb1x1O+1WjRg40GnpEQO19tqrw+lBTMp
         /vRXxroIwqRmyvh6ILZKcJBwdH5XM7/CAKDECgCW+IPNV6adVNnwdFWXxm4mr0h9muOu
         +yFQziEC8DGHzjRjNzaAtHQsPO0epJdVx988PUd2m3Za+8ZUws5Q1kRY06TMgUIpvntd
         k8oBTC9EBHWdse936Z1+X8RV1Dwnb+4By8e448muFBONL98cCf6q2sd9sv5t0ZirwZv6
         1Pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134283; x=1780739083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Je0r03zFWDk/tHsmcp50GPWfnKiSAfNBSvNM4tTawBM=;
        b=K+T490Jx41davwAmhydt4ofpqQZ+Xb6n9nIIQoa8KUwNRbucwFW+gN+xQTacDOpdIK
         lL3gAAVWwT3RZxjcvUYPA1ImFOcQOlp/kYv1pAFKyjjecjQbWHjFfPIAg8SPNy18rnbv
         12qZO51pMCDe4StFZAso7gzxZFJXWLlHsoeAhcJiQMZEKfhTw9mc4esOKsao6UfmumM2
         hU9PJNX+xOLSc73ObonrxizVytWrb9IuPsiaa8ZrjUA9lfVQhlK7xdmH5pH199PWvBRG
         pvptklRCxWRnzM0jRyjeYXKOhNu8Qk6c3BjGM6nv84gQyomStBFAayXCksXYowEIbh95
         t5Gg==
X-Forwarded-Encrypted: i=1; AFNElJ8pWp4fvY7GJdJHRGMT0lIzwF2ZhwO7cMRuBjR2SGw5FUQQWVBeD4TDxx1SyU73M6HCJFfxq6j+vE5Nkqsl@lists.linux.dev
X-Gm-Message-State: AOJu0Yzr+zklZ6UeG8n+sEFlS8dF+KwMHH7ZcPf4pLZyY3zsBbZ0sDMm
	Scbxl8+vUuj35lDeSDqP1ZsFIDw5pZNdEC7/GND/gyvFuissvddF+RWI
X-Gm-Gg: Acq92OF3lzCmJqTXVTEIlpcWVa/Rz/nyX2GKPCuzuJj7PnC+kjo2kUnUVnuK+riZUIx
	1RHMlY5+LiqqhptDNgZ5OzQuzOpQVVC4lT9zr1Ujzz/oNpHohGpTiwuIqTJEgVM+ey24P4uhEPU
	mesR5bUavOWBlISjsXmux+39MR3ybQvaFh5dX3cyX8PczzAKr4Q+lfLTrfUEKd1Gmwj2KKJnbBE
	Vz039sNDMbQqhkRmBEbmn+VAo6EW5tQi6n5nJpn37L1j3E1gMNkYLp0eM2TtEqbsNlcm3LOiJDb
	izXBIfL/rROqNHlHBt8/dHblTfTkA7K6o1kyEsmbp1tg38nqLXWheySJiDcRnWHPQGzV5rKHcb4
	nQ6QGlcyqI7QFyppzO00UuKiUg5v6v+9JUXC/Q8yLelimB9ZPA0IIKxdGC0lPb+uDApqViF9Abi
	4Zq/nmXgwiaFzDnzpG4dS1OGDqK4cJ+O8mPjkR4V/uEA==
X-Received: by 2002:a17:903:2450:b0:2bc:e2ed:fd03 with SMTP id d9443c01a7336-2bf368a3dabmr36524785ad.39.1780134283084;
        Sat, 30 May 2026 02:44:43 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:44:42 -0700 (PDT)
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
Subject: [PATCH v6 4/8] media: meson: vdec: Condition buffer flushing on queue type in start_streaming
Date: Sat, 30 May 2026 15:12:50 +0530
Message-ID: <20260530094326.11892-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260530094326.11892-1-linux.amoon@gmail.com>
References: <20260530094326.11892-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When vdec_start_streaming() fails, the error path clears buffers from both
the source and destination queues unconditionally. If one queue was already
streaming successfully from a prior invocation, flushing its buffers behind
its back leaves videobuf2 deadlocked waiting for completions.

Fix this by only sweeping buffers from the specific queue type container
that failed to initialize.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 8a5bf1a96830..698a95566ad2 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -386,15 +386,15 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	sess->status = STATUS_STOPPED;
 	mutex_unlock(&core->lock);
 
-	while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
-		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
-	while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
-		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
-
-	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		sess->streamon_out = 0;
-	else
+		while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
+			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
+	} else {
 		sess->streamon_cap = 0;
+		while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
+			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
+	}
 
 	return ret;
 }
-- 
2.50.1

