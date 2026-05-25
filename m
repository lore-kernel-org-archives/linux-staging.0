Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A633E63B3
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 09:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779702769; cv=none; b=QMkw956EQABEQtwOPqN/suvk6z+fdbOTqTV+N1Xwys8zeKzVhFnqyaPjkPyyjLzJZCdCvIxODGlzpZw7hABR69Zj7tSShrEpI0Ja02fOvMWAAttY370WwjkXlUD27CuJUhrEGB0WTnwWbClwPqFTVJ6xjBXSYQkW6M50zVchVK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779702769; c=relaxed/simple;
	bh=4B9KkP1btML4C6oNkrTHn+OUIMQeidMbAkDiIWR3XwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hjz3uii/EFDWajflzqUwEIOEkMywEyFQktHyjDx0poovr+rx5ikVVWN3oBUZfe2kMUcd1NmA0PZR8p+Y9teUJF+6uMZN7en1eiseyzurj2AkGWgiho0G2GU3KcOO3VeeJwHVITAhNuvlIubj6R2A/sVFALuCXlKqFf30GtcgqQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HBnqOc3C; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HBnqOc3C"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b9ec9443c2so54278735ad.1
        for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 02:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779702768; x=1780307568; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIFEnpVuawucZlIPGTpnFigTasBUEJzr8Hl8oaehmP4=;
        b=HBnqOc3CFRYlU/QqT2pEe5GZdBRAAtRuC7nfRSwbkmYFA6j4T9owQ7IUs/AvgSo1aF
         tzZagKcKAQSYkbJTHMCt9/q4Gmjuy8vUzSP5HMcRJQH84jIb7/RMiW6tl6R6kGe8RbXW
         SlcCvJCf9as+R4oi8hyWYKddkjmkzXoqw9jrucyvktT6+Cvjm3odcANvjWSvknj1heYN
         OLDFIjPZu3PaJ7KPJZGwXMVSnj1XbpUg6XjRalMSfIQ+7D/QcCtuLo8MNNLhW1zsPy/5
         CbpKLR/chfyBFkbjM/Cn8e0paap5U9LdopFZjE05e3451lMpi7mlIzTbZbyfJ9526O4Z
         TP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779702768; x=1780307568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oIFEnpVuawucZlIPGTpnFigTasBUEJzr8Hl8oaehmP4=;
        b=JdOTZN5IQqyNLyVhvnwlck0AyjMM0wl5fTeNhmA3Zq8JnjACA7LJZX6q/gUq//F8oA
         wpk0kou+VHetkRZQBQ/PzBLPLx5z8QkYZ9KLas+pqa37v/X61Pn4ywLkPuU0WKcANg9Q
         qCy++hctPnz/GHzVCKatGReHvrSlokXf7TLUmvz7vTLQj3F/2ai6tA3DmcgT+FRt2Don
         xnyrxbdxFnsPUyK8nlXgyseKA0gkJWNBcAUDId/rLgm2163IGqEnHs08sSwDZnZbRL7O
         xjhgm6Fdv1Q9iNhFyM7TY6PD75k8f0GCf4dsoW+GbVukbKX2vr3wv638cKbfParOJJiG
         bbjA==
X-Forwarded-Encrypted: i=1; AFNElJ8bWsairwJe0HDognWHJmX8GW3rukim6C6lZ4yrj7hJW/5vtnmq/30ElxHJzRpR9t+cSEZ3TApbVAvG6QHI@lists.linux.dev
X-Gm-Message-State: AOJu0YzBMvVhFbjLBbSx9bV6IoSYPjtpaIwVPhTsWss+b/ZXL4f9fHxw
	hHdySdfRfe2nG1SJY/KtP88jixkuba6kHgqnOkViwPpq/SU8m0y+cXw+
X-Gm-Gg: Acq92OH2BStyTDjDP+V3gp3/EIVtR0AK2jo06akfl2mzR/sVWB+RAAgkqBBqtapK2BW
	/mL3AszzZ45S4U1NjbCAGhLzr2Q5xjA9i3r//5XQ0eP1tcV8kzFXwxgCw7YO+LwAC+2c198qhR6
	dtU+jTa4D4qQNbTxBhYVvYJs5RJkM6ewHoSUl2BBNe2jysQ4dHgx45WalRZkmzQmDWjsc0VQqiR
	N148qYcaqrQJgvGn+RcGxfVj9PgtG5vi5QLV7kSi2tkU8pSHNAZb9OIbMb57D3hpFGN34MVgkio
	HC/XLK/m6Iqov5isab868QQkhRQD4WMGJx043n4/rN5h+edruXJhh00HgyAGLFtSgxzGl3PzjIT
	VnrIEPmX62uVvGdAqBsN8wrsB9VcPFvdcNLWWlKwx0r7c0h9m3AgltCgxb7cRJjJoJPpe7LfC4s
	y8WxKeVL9kf3tNV61yjzHT
X-Received: by 2002:a17:902:f546:b0:2bc:8e7d:3dce with SMTP id d9443c01a7336-2bea23e2057mr157194235ad.27.1779702767866;
        Mon, 25 May 2026 02:52:47 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2cd6sm92533615ad.52.2026.05.25.02.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:52:47 -0700 (PDT)
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
Subject: [PATCH v5 2/6] media: meson: vdec: Protect session exclusivity check with lock
Date: Mon, 25 May 2026 15:21:50 +0530
Message-ID: <20260525095216.12078-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260525095216.12078-1-linux.amoon@gmail.com>
References: <20260525095216.12078-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the check for an active hardware session is performed without holding
the core->lock mutex. In multi-threaded environments, two concurrent
STREAMON ioctls on different file descriptors can simultaneously find
core->cur_sess to be NULL, bypass the check, and concurrently call
vdec_poweron(), corrupting hardware state.

Fix this by wrapping the session exclusivity check inside core->lock.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v5: New patch.
[High] Concurrent sessions can bypass the hardware exclusivity check,
leading to simultaneous hardware programming.
---
 drivers/staging/media/meson/vdec/vdec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 18a22b79e835..e72f54af026e 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -286,10 +286,13 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	struct vb2_v4l2_buffer *buf;
 	int ret;
 
+	mutex_lock(&core->lock);
 	if (core->cur_sess && core->cur_sess != sess) {
+		mutex_unlock(&core->lock);
 		ret = -EBUSY;
 		goto bufs_done;
 	}
+	mutex_unlock(&core->lock);
 
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		sess->streamon_out = 1;
-- 
2.50.1

