Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994252;
	b=yLGocOrpIBOYLghczMKB7UjZ8GlEFRTkotgckdcwV/3LF1pm2Xv2xmq/M7p16w6iRfZy
	 Hqui0yI1PlaOa5dIq4EbRMoH1e+0mikxQ3A4ELDkDU4gGAqymBobbLvoRLhH9r+2G/spE
	 uSBopFUnOZz5+D4Oi58OIjHLQ8xnUBYrIg8GBH8ruDAOfaVbcavzplVxhKdO5uUJEilao
	 zdo4QXFXFlBbJXbNDVzEiB8DftDLxf9gTyuPPlJfSkrd+nRyKuSPGrj/bYAH+gcVavFTi
	 aPuKK+tV0VgGOlA4fYpOliG4iAiDJa24Z3z9wiTz0mcbEkxCZZqVHhNXwEUXkQWjMgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yH+uT6HKFwSfsz9asBe1dm2/HfQO5A2IC9muIRzxhY8=;
	b=dAz9M8cv3G0NliVoKSKJlSLiYhnXx7s2f515uwifuuxqhFmGv8Wy3DivI/ikP65t5bx5
	 tUO7AZimkEmlF6voY8/qRtf+uUiDb1QMSXFU7Nm7IqblaD3E96Qu8PJmWqzcvgaMMuYBM
	 Dr0FobfEahwGYYlHierS89QEnJiPN6I2RYZWdYVkAjaImPRrA+K/gmai5EPxDVAMVRWu/
	 4NeXFsbot4pZWuo/8ZLXu2+jUgL7ezH39sC4BGW8mo5QjI1/YjG1aQPSGqcO1vU3IRBL9
	 oI+HpSR2sgIZbm6AcWKB3i+4QCaDo7Ft13dwHwuycVlk+SPYQQkCpiCDwuvR3bR3vDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XQQiJskv;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACAF606A326
	for <linux-staging@lists.linux.dev>; Fri,  6 Nov 2026 19:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CACAF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XQQiJskv
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49d05d51553so6946625e9.2
        for <linux-staging@lists.linux.dev>; Fri, 06 Nov 2026 11:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793994250; x=1794599050; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yH+uT6HKFwSfsz9asBe1dm2/HfQO5A2IC9muIRzxhY8=;
        b=XQQiJskvtZsPS5u4WtT0ttn+n7pcoDkJRHqSqHgRQr0J2EfjRgh4vVJFzWlObYGDY9
         dug5IKsd8iVS7sUVOglhXM8kItprGEOYzWyVKw2iDauAbJe/A9TNxqFVTYqHnvboWCFv
         8PVl2TQDdwxqfOcwG3KUj6+TWW2qtFF7kdx64zFx2tLhpGBQO1zK0ULbjxNF3XSgCDe8
         LPkuhd0qRA1nRYhKt79vJTuLkW1y3mCKAcId3OeYfiSZ8XnJ15bJ/ZXD6RBErKnURDCm
         UrKx4UNzRCLajjcB1tQ63/suC6lPQ35nAhonycEVXKGCib82d6vOb/0bnWkFmAaY3DC5
         OpeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994250; x=1794599050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yH+uT6HKFwSfsz9asBe1dm2/HfQO5A2IC9muIRzxhY8=;
        b=SIkPCCT8sgZujVQ1MG+12VZBe1hDBrIfOSnMQCn0YWdpKIUheuc5t+rFz/u2nuyg8w
         y6UIWGv16flShsuLwIDKBJX3272BHRCIdCz4EWy7+HfWQjpPEZTqL1Babn/Q3PwQZDEW
         sFy6wF7u4ZCAgxcHKJ67PThYTC/jXCE0Pzh60sWbT8gQKhVlk4AP9OHlkRQ+jVveBSi3
         LeepXiBs1A2zmRxaIbD/kK23PgnIhFVLlQ+LCxR5L2ClJLg5QI5niZxfwOd+EdFY7w6C
         th3bbLHrM01Yx1GQWU0PvWd4Ndajam5AgCp74sHjV9Jkt2WAtPXp3XyoRQom3IFIDXcQ
         1TQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrP9dUd5jLXdAHUklBGUSnM2S6ckjRf5IIfdX1M9GBMlVvxfSZQaJzI6u1yu6fp0h7aPge1d2uefbVlZV4@lists.linux.dev
X-Gm-Message-State: APuU4Z8sJcRoJYotaJaISBphWFZuBisRNDW24vRLopExHcnU7R/dkrZf
	6LmQhUlMUU1gy25pakCFlq8V/ga95mMJjeDyThwgiqsNskad8Wo4DATx
X-Gm-Gg: AYBFou0nS70Lp6dvpRak8moXFimh93GXXheQXkbeQCSMM8Kqy08aCoIUEdUF7fX2OMi
	vH182f1GnWyr8eOGNlzgvYwjGicqwNkzSbF0Z8rTnwKvHq3gvqDThcZByWQrv+tje6ATTurp+a3
	nvFoRjJwWuUWayfcTxD3kw4UtBoRj5q9aZH3FF9S60tRlnevhySF8nYNnYNnhJz1ntkvE3Puvt/
	s58Qo0Vm8pDRQ9n0L8BrSvR+kAmUkK4/ag3NcRfiSNWSoL/q0wpIpdUTOGUEhhQV6E1QN560syF
	tP+bHD+iLlInxL7e452gwY5m3lBLreh2JL46gwfKhfKH4RDBhDWRA3WNhBRWNiOps3t2fXVckQC
	YsDEoPmRA/oEmbWAN+KWyxgd/2T8cW0A1WDkilLxj9iHbd6jeGLqS9aF14z4wsCkr1mvw+/bEOq
	LbhOeyUMVkc6rmJkZHiDIr/TJn/hmq8CW4j5CPnuNhgxIpIAEqPV4wePbw152o/GzOEkTv74B66
	VYY/LLSHPXbMtBlRaO5PtRH6eSG4TAkd5zkP3vOh9Ay4NMqhw2z93MeFd25UrnS78szgKljroJw
	vJ3ooQVabEyzYe84WTIu6v+aKUQBLyJ7beFNUAkUK2WkbbK910O3sQ==
X-Received: by 2002:a05:600c:46c8:b0:4a1:fbd2:f689 with SMTP id 5b1f17b1804b1-4b6dea69526mr63988215e9.7.1793994250067;
        Fri, 06 Nov 2026 11:44:10 -0800 (PST)
Received: from localhost.localdomain ([87.13.215.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc628dsm5512894f8f.48.2026.11.06.11.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:44:09 -0800 (PST)
From: Francesco Giandinoto <testata.nucleare13@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Francesco Giandinoto <testata.nucleare13@gmail.com>
Subject: [PATCH] staging: media: ipu3: Fix alignment issues and remove an unnecessary blank line in ipu3-v4l2.c
Date: Fri,  6 Nov 2026 20:42:26 +0100
Message-ID: <20261106194226.8233-1-testata.nucleare13@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix alignment issues and remove an unnecessary blank line before a closing
brace in ipu3-v4l2.c, as reported by checkpatch.pl.
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 61fdefe78..e9b2ce2b4 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -248,7 +248,7 @@ static int imgu_subdev_set_selection(struct v4l2_subdev *sd,
 	struct v4l2_rect *rect;
 
 	dev_dbg(&imgu->pci_dev->dev,
-		 "set subdev %u sel which %u target 0x%4x rect [%ux%u]",
+		"set subdev %u sel which %u target 0x%4x rect [%ux%u]",
 		 imgu_sd->pipe, sel->which, sel->target,
 		 sel->r.width, sel->r.height);
 
@@ -291,7 +291,7 @@ static int imgu_link_setup(struct media_entity *entity,
 	WARN_ON(pad >= IMGU_NODE_NUM);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u pad %u is %s", pipe, pad,
-		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
+		str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	imgu_pipe = &imgu->imgu_pipe[pipe];
 	imgu_pipe->nodes[pad].enabled = flags & MEDIA_LNK_FL_ENABLED;
@@ -306,7 +306,7 @@ static int imgu_link_setup(struct media_entity *entity,
 		__clear_bit(pipe, imgu->css.enabled_pipes);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u is %s", pipe,
-		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
+		str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	return 0;
 }
@@ -753,7 +753,6 @@ static int imgu_fmt(struct imgu_device *imgu, unsigned int pipe, int node,
 		} else {
 			fmts[i] = &imgu_pipe->nodes[inode].vdev_fmt.fmt.pix_mp;
 		}
-
 	}
 
 	if (!try) {
-- 
2.56.0

