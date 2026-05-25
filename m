Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C588B3E3C79
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 09:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779702796; cv=none; b=YNd+NlKX46bzjO0UsvBttmuN88bteXOvAWf1ukPgXWYIPIYRp7BPT2KF/0zQlXyrm4gwk8YQ4eSiugT+7fwscq0qqZbtPMnsfPNqlF4i58dv9vkMBf7Ii2RwPMkhZwKQGn33tJT2LjuKCggIzk6r9YAnIi5QOS7jxivqxbE7ZmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779702796; c=relaxed/simple;
	bh=Mdlv4jporUZmlLf4lx7rproUzpgtFGaAxxp4Y+lMBaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RP/wrBwTbhNPCVxNUaDHR/6pdck+Rl4uWoQN145U9HK3TO9bHAY75u5VA4CeBz8CcddHy9wzzSvNXN6VrRKmgw4KrwPKFa0TQOMCDkwV6HQ9G6FH5o4LNseuD3bghXG28Gc96OCTS0ZuDIaSHWCVcmjNBCIk4XxD9XbBAJMdqJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwKj9Glg; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwKj9Glg"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36a8ee1e28cso1999893a91.0
        for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 02:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779702794; x=1780307594; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ez92gLCG1+yJIQjG46e8Hvs9v1kkCpJ4jicfjTVkky4=;
        b=jwKj9Glgkr46vpB4t6L7ICd64DMeIZBo2NIjbsOQ6llkOUtJgVXRSsF7/e8uAosY+D
         5sxc3RDKVuqH4Z2AUPA/jJNjwZ7UjBNaPZfgcAYBDKtiBgahmM7P2FzCXJYtZIEzsGpG
         BKxe1TiIb5WoCmDy/f69ue6Jk75QdncA+xiXnL46IzrlDr7iDhliSQclyLkhSsNjyBWU
         TsIO/do/HIzsLCRxdyjFMXxBJ0WIOcSjtKT/36GeKo4xnnlPJni34n0SHTtJMFLAvqmz
         QpVQKp9D1nxQ6fSQavxDF3VOz0K8U+aNaxn2jsLUUnY9KmAgNpLzuuENHAb2kMQDkrqk
         Dm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779702794; x=1780307594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ez92gLCG1+yJIQjG46e8Hvs9v1kkCpJ4jicfjTVkky4=;
        b=p7cntuyut8i8N8RbwSO0BBINShHjKVyH2CzXCf237tNrgEAltoLV6hdWTlKaS7Kg2s
         /lW+GNa23/k1UeJ1vCmASelW3QQxIPEh07NFZ30tHPuFnI49/kzhE3SjQNJgztmZ1AXd
         eJMFIO0fZGRLalTizm3h09rzHz7TY0ljBHiiPboQx/51yDVF4LmYfbN5mpdC6H/M/IGA
         9oZS/IxD9z/sefNwLUr8cYO50QP63lrfHcPcqxM1CP8/Ca9TliNBxY6VHFiOXvVHLqbb
         OFlg+lthkbuRyc0+70gjA/NMVtiT+w5194tI5qcp4zUpIoTr1RXuEsu9I5MMGRhoFLOv
         IkUg==
X-Forwarded-Encrypted: i=1; AFNElJ8+LanPApZRbC66rkaRo2E2EZu0XvWjU1hx990NIEA5gzLl2+x+hEgp0afxsEtCuJb5RIN8rzQ2hA/Isiti@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1FAt6I812gEDJ9oDf9t7frSpaAnAbz2ZCBsBfv37mSyAEvqmt
	Ni7NzHNQtevU3JAAuCLmFVd6oir+Qglu2ORFsfTlSIe888u4Df+u0zY1S7qSUw==
X-Gm-Gg: Acq92OGYKmHifouwMPwyFAKhn9LBMor+3Hp75tUHE8A6zb2Sez2RFqwTp1JcwstTijf
	yICpQhEG+7LhgBkDW1DnX0jzSaZPhX7Nojerm5V9V/WEklo2FLMEyYUCdkHrF3C1KhVVLbsj8BI
	CCsLJ+c/OA48/boUX1mvOM0D1C/glCu09Kat4pLBZZTjaDERRg8cbhmiqDPz30SC4FNCKGxoGSN
	5yrYaAlCn99seQRULie2jeze2MqVp1AQf6q+Co3QVRDhDyHezNsgDvPotyDAY8SpWJvuyhImgRI
	K02LVSeiB9swZihYb4mxIFrKReirszGw3VLEicxB44ovNEm2dagGp9NmCrOHoB06UobqutBayot
	Ij0yDippvPWLhrJUhQjkYqqAQxXGeGNV/upa3GV1kvVFnnzMfvzrLJZ7OV0AcJgWndvJAx9BV5A
	1NsSHe8doTGJXE+WEb+8RbwzSXObcub38qPpKNeIOqmQ==
X-Received: by 2002:a17:902:e548:b0:2ba:78a6:7dec with SMTP id d9443c01a7336-2beb05c07aemr160215525ad.13.1779702794227;
        Mon, 25 May 2026 02:53:14 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2cd6sm92533615ad.52.2026.05.25.02.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:53:13 -0700 (PDT)
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
Subject: [PATCH v5 5/6] media: meson: vdec: Isolate error path buffer flush to the active queue
Date: Mon, 25 May 2026 15:21:53 +0530
Message-ID: <20260525095216.12078-6-linux.amoon@gmail.com>
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
v5:
This is a pre-existing issue, but will returning buffers for both queues upon
a single-queue failure orphan active queue buffers?

If the CAPTURE queue was successfully started in a previous call, returning
its buffers puts them back into the vb2 queued list while the driver
discards its references. Because the CAPTURE queue remains active,
userspace calling DQBUF will hang indefinitely waiting for frames that
the driver will never process.
---
 drivers/staging/media/meson/vdec/vdec.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index b31bf08af88e..925537bd4d0b 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -372,15 +372,15 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	dma_free_coherent(sess->core->dev, sess->vififo_size,
 			  sess->vififo_vaddr, sess->vififo_paddr);
 bufs_done:
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

