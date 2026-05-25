Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5949E3E2AA3
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 09:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779702779; cv=none; b=Q1aAPw87XofG7rKvEhtqGDjEw5aqdyh0KWMujzOgMlHGpdYpwhD+zG594P6lChyp1ntl4DZES3gUMlheIyjRE4lAiXVFJp4dF+EcHGW7orErwwSvjFN8I4+GbsYwKVevPywYfqzS1LuEU1OkC23PM8KyWFBLCpZgDYO3lUe8LFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779702779; c=relaxed/simple;
	bh=YXwLVmvrPT3CxIUwe1z2kjZT4+cCRWaplcDqgHQKXS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EDR8ZQ+LyBhRFzYsjidDQuc45O3XtW3cmNBuS2a4/L6AWSEHvarI1qTdskdX5qS0gm5IaazR5B1F3jK3trmAg2LbSVU5mL7WFIsckzeCkphrJHGvUSw5CQbz5nqAUqJQxnLEDLudy+Xqr9KWUCjcmZRLo5wfFobVU4XZnrlv33E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5iLevg4; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5iLevg4"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b4650d5f5cso38894315ad.0
        for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 02:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779702778; x=1780307578; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2KznrLCQ77VZ51Z4KvrxVufB2DqA7HTlU0nEjlF/zw=;
        b=R5iLevg4GWsAqEwehG4X1G36NBctNPdGigHxK9dyjpRz2Z4hMuZ9s3KaPVE/l8ijCL
         hP1x8nKEr9AHH+X7VpGstKlqJUAN8nX7azeDTbkBDrQXVG/ZO+ejT2NaSj/IYL+Sqjs8
         JHX2EG0gPA5DOPIanuZ4UYGmg6yhBo/jyE1/EkhcPRY4MzQxsZjwRIcv5xC0W8oGQwkW
         pP1Xk6S2TrVHuknHrrIJUotvYMTj5mvBFW/7FjFZv3Tzh6+Kv3fO0sUpy9if+UW3lvBQ
         ajtKqLdKLKffUM2JXGWzINuo7Xqq9ZlOhF5Rcvldoz32FmIch737ynrmt1F9JHCzFjRS
         fY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779702778; x=1780307578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v2KznrLCQ77VZ51Z4KvrxVufB2DqA7HTlU0nEjlF/zw=;
        b=TDNBSWRcaBAToKIDYOz+vcBIxAJxZSvUe24iFeDE9S9D4mQzngS3ULuRA57C51m3x+
         HnUpMjj/Rv1eHm3nK6j6Kq/f2AyOBVoRhj9PIIyKL3qf2mY4TAub1clNLpFfg463kz4N
         CdSMjhZTuF279lpq0a+g/Nkf8ntWhUc7+rIWoUPga0tXEcnv6muGqb2woxed167Vaq+b
         B5bmerPrPXb0yMWPfGDUis3OT978YBGs7DG7ihWTYUWi+M6FamKP/jUgHaZBlsPIv+Qd
         DBBE8x8Mqt24bbM5eXhibBe2lUbEoyN5IxzmjGSIfRYIi1LA2dBoEpnSizn7UhwKwEzt
         pQqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/KeidtIQMvE1F0xGAxFR4+u3hGPUwXZpzFINF5yB0E3MM9ct3WarLR+826tEOku+RKjTlTc6NV71n5oshW@lists.linux.dev
X-Gm-Message-State: AOJu0Yzg4u0qM/kjBxOaSnSdxQvuTHDWHkMot8TBQqdWliPtaZa7VtDn
	COiP6smFgX60uwSjXeDElcAa/+mvINqj9JI53TQwr7DsL+CMKNLq3vU9
X-Gm-Gg: Acq92OFZMC6NT7Nq9tkqdKaiHem2sd0DtKChZMBgtsAl1tVwFZyOKd4k2zo0NE5IRoW
	gPfO0hcWOOH95j8qmGyxSEwQaRXBv0z2g+TRX7Eq4DZwDw5KrEQVBFas8gM3rlgbKW77sttsfCG
	3dphBNoI6IjM5s1fDE3uvLmgBFdy0v0UlqmnI62py9YeMVKpAVFOyIQMCscSgNHJ6XovBzKiKzD
	etP97abtKLpQHP0Jx/OzA0bIagWOgfxmDv7TscIEHrC4GZocGbmNd/HmLDValqlX+MJCnTzp6E/
	V6dSYag0lOKRiC9djiaOwPmy4ABwuYebTvmC9PzE7+rOhKutTQAp/3m4b9FvKcoL4Y+t2/fRtsb
	QLVi28CnOsChLfOYaBhQANWqkmLHXLhDo9GKrddO9BlBrWDiw1KhfuB+uQky335ZUF5HdHuB4WC
	/gKpQZISRLtixSgsHgKwmD
X-Received: by 2002:a17:903:1ae3:b0:2ba:bfc:76a8 with SMTP id d9443c01a7336-2beb057f8c9mr151250385ad.16.1779702777738;
        Mon, 25 May 2026 02:52:57 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2cd6sm92533615ad.52.2026.05.25.02.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:52:56 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v5 3/6] media: meson: vdec: Set cur_sess before hardware vdec_poweron()
Date: Mon, 25 May 2026 15:21:51 +0530
Message-ID: <20260525095216.12078-4-linux.amoon@gmail.com>
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

vdec_poweron() initializes hardware and unmasks device interrupts. If an
interrupt fires before core->cur_sess is set, vdec_isr() dereferences a
NULL pointer when updating sess->last_irq_jiffies, leading to a kernel
panic.

Fix this by assigning core->cur_sess and updating sess->status under
core->lock before calling vdec_poweron(). This ensures the interrupt
handler always sees a valid session pointer. On the error path, clear
core->cur_sess and reset sess->status to STATUS_STOPPED to avoid stale
references.

Following change also strengthens the hardware exclusivity check by
holding core->lock during session assignment, preventing concurrent
sessions from racing through cur_sess == NULL and corrupting hardware
state.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v5: [Critical] Race condition between hardware power-on and `core->cur_sess`
 initialization leads to a NULL pointer dereference in the IRQ handler.
---
 drivers/staging/media/meson/vdec/vdec.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index e72f54af026e..52ace4de967c 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -334,6 +334,11 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	atomic_set(&sess->esparser_queued_bufs, 0);
 	v4l2_ctrl_s_ctrl(sess->ctrl_min_buf_capture, 1);
 
+	mutex_lock(&core->lock);
+	core->cur_sess = sess;
+	sess->status = STATUS_INIT;
+	mutex_unlock(&core->lock);
+
 	ret = vdec_poweron(sess);
 	if (ret)
 		goto vififo_free;
@@ -344,12 +349,14 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 		sess->recycle_thread = kthread_run(vdec_recycle_thread, sess,
 						   "vdec_recycle");
 
-	sess->status = STATUS_INIT;
-	core->cur_sess = sess;
 	schedule_work(&sess->esparser_queue_work);
 	return 0;
 
 vififo_free:
+	mutex_lock(&core->lock);
+	core->cur_sess = NULL;
+	sess->status = STATUS_STOPPED;
+	mutex_unlock(&core->lock);
 	dma_free_coherent(sess->core->dev, sess->vififo_size,
 			  sess->vififo_vaddr, sess->vififo_paddr);
 bufs_done:
-- 
2.50.1

