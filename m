Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8233C3E5A31
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 09:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779702788; cv=none; b=P9ShFwsbCtFDf4wT/f0SoCi4/r97E6ntCaXjZ/eOD2y2hnqhmZW4WsRHbyq6RXs+hHrX71duUhSS4ouFRl3YH1kuZt5KgHVwaqzf2vrqvLTBIU6AglW2CoTcuZpxovBcNqI9Xw5bTqEzRFpt3fOCPaJqhNiCobKscZgzF/hRX+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779702788; c=relaxed/simple;
	bh=QRfnZAsf4fSDp5/JMDhDg9a0MSoVbrVjv3/Xv8G0CJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qXVeN3Uj8rOqNwtP4KJBqksp1/Zxn6wpOmJbdVj3H59rP6dXkRr1ooLV7o0YOellK6Qj+NnJhSt/nEP13NzfAP//SLhm1XhZlCN5kpzTx+HoOAfGy1Z7WaW3iDuXHqStwPDPfYyue5qvVXC1rhbf7rthnjWRVkcY5dzfdXAl8RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdPxsI5w; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdPxsI5w"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bc85eda6b6so47427545ad.1
        for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 02:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779702786; x=1780307586; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ib1oZbigCdwlVvPfRDEBvGe4OjSQvC3V53nI1f6TImU=;
        b=bdPxsI5wghQcVR7BTz7spb8Ch/XH4dj8HT5t/6fqN/kNfCnYzYaeFuhX1GeBV9DFMF
         Gu+7lg6mnQQiaryiTX/esv7Gw4QOBQozHOmjCA3YCkR70VxVNj/fd1HcqFRqdf/HlxTC
         dNe+OR26ydPJD5Z86mJfoh/VG/D30CqKODC812GcuounymK5lJqCbUPy42aifEgKTQWQ
         l9LpxLiKHzWristMQXqGPHU+4OrHUVmlPItnF/C7+muF2E1AC4yQ7kW5RcQKyDtW5yxE
         26qJMcfwnhRMHaad6XU4vHUw4kmJNTioC//oPCaBSjQ0x5GYi8A7SV52n0tG+QaNsv6C
         kD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779702786; x=1780307586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ib1oZbigCdwlVvPfRDEBvGe4OjSQvC3V53nI1f6TImU=;
        b=i0m1iSSgJFj603Fjiv1rQdz66fbqU/34WnXs/pKWU2wB4IdLmYbDk7P1IeDKPIM7wA
         UKXiI4vjuJk4VUIA5Wu3EJtcANnKsLJe/FYFrUu62jLwXHpiBISqnjOubB5O8xOKuTSz
         UUiXbW3FvLgRlph2pAlNO3Dnav1/NJ1/us34oVSJ5yLly19e2jYTaZeDlYNCHYm28ace
         qc37S2gfVPwn1bHH3qNmeEym7FGnXNIyTw6wc/xwXGzsGFQo0Cuk2/NY55czUSeYuZ9x
         ekvuD4XRRlBzdNikOEi6Bq3/n7zORaomedeUvWuMRfONM+L9bpI5SB9y6N1iJVqGWGlc
         S4Rw==
X-Forwarded-Encrypted: i=1; AFNElJ9SD+fmvaUH9ng5oGD+g9be0oHu47clfitTf3lCOFRIDe5KD0WKMj2frK3KNpuRXETJ48fAsAuvaztnX2RN@lists.linux.dev
X-Gm-Message-State: AOJu0YyGaQ1GzH72cnoq/vnZ48mtQkCCPRRjidZ5UqsZOuH8cgvDTR6s
	GkfLGD82QQZ2B0V+cZptHll9sbHtZnXJJtAwx1e2jhMpE4QmfHI4hYNH
X-Gm-Gg: Acq92OEGMgsIVfRoj3vu1ch3pRiwp/0MDh1fISqB0PchBqDSEM7pT7d/yVxW6peVG0K
	/iUpNjkf5Bc617Bn0IhOGU8SWGfaMs48Q94cZbcqEY1qlA/LTyYh3qKPXVOYZuQlqOACyYUhgEQ
	Axfi3DXnvjFWN+g3pkzggys/5B4Tss31NHa1T7tXyb2LmX4FYuh7r1HrmsFfCO70gtzdQjLq+Yb
	wcbUipDuNYe5lQtQkoFt5VjwcYzRXHdD/PnShG++0aiC7gmFvHY4hi7evWVgZLIKH4olI0fH7pK
	y0YTY2wf3qSePRti07kfhQ8YhjpcLp2p1ZE2/g/j1LA/620ydB8kJSjIFa+VmDuR18VSX0/o7Cg
	LrtiyjV4pSsMKQFZIjxDKX1jNzCXCzNVoPLU4Ba2y6+SyZ1EqKeixRqAIDtyBb75VajqT4IlsJ/
	m0Cm7CV5Z1tigJzb2jednA
X-Received: by 2002:a17:903:2f90:b0:2bd:ef15:9fce with SMTP id d9443c01a7336-2beb063227emr153939475ad.20.1779702785924;
        Mon, 25 May 2026 02:53:05 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2cd6sm92533615ad.52.2026.05.25.02.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:53:05 -0700 (PDT)
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
Subject: [PATCH v5 4/6] media: meson: vdec: Handle kthread error and free codec private data
Date: Mon, 25 May 2026 15:21:52 +0530
Message-ID: <20260525095216.12078-5-linux.amoon@gmail.com>
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

vdec_start_streaming() launches a recycle thread when required by the
codec. If kthread_run() fails, the previous error path only powered off
the hardware, leaving sess->priv and codec state allocated. This caused
a permanent leak of the codec context and associated DMA buffers.

Fix this by adding an err_cleanup path: if thread creation fails, call
codec_ops->stop() to release the codec context and clear sess->priv,
then power off the hardware. Also reset core->cur_sess and sess->status
to avoid stale references.

This change closes the memory leak on kthread_run() failure and ensures
proper cleanup of codec resources.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v5: The vdec_poweron() function invoked earlier allocates dynamic memory for
the codec context and assigns it to sess->priv. When kthread_run() fails,
this new error path calls vdec_poweroff() which stops the hardware but
doesn't free sess->priv.
---
 drivers/staging/media/meson/vdec/vdec.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 52ace4de967c..b31bf08af88e 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -345,13 +345,25 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 
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
+	if (codec_ops && codec_ops->stop && sess->priv) {
+		codec_ops->stop(sess);
+		sess->priv = NULL;
+	}
+	vdec_poweroff(sess);
 vififo_free:
 	mutex_lock(&core->lock);
 	core->cur_sess = NULL;
-- 
2.50.1

