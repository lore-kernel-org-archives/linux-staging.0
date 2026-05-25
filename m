Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06A33E63BB
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 09:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779702804; cv=none; b=YeA+laILNLyLO+b2nDompfi8dUEZrVwZNWPNN7H1TAMkqXUOJNj7V7y+zPrxaGhu8hACQ8vTA4newEOBru4MdWsE+v9u52VSFVK9iu7S86oPPFgnW5ipMcKBsupHjoUtGXrqIQSMNFN9WlpP32+jj3mKsIHd+VOerhGE4pkG11M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779702804; c=relaxed/simple;
	bh=E43zb/0exWQdHZ2/viBusfLWpvPfMhAC55xSTIPBc2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rMkGyi0FEIBxjKrGaj0bEXtmhis9Ro5cFvNWeZYAkmYH5UNL1GCH2GoWwZyzprhWpgUBMPHMEYcYjlnaETAKIBRGqJTXvoDvVn2dprs1VxYee4aXlZfuvWSXH4Nia82SzPO1JPMzXLf/md21nE5s5dAhKddWIWzhyx4txhC9ffQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqz+Y/ts; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqz+Y/ts"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ba21d32776so69121605ad.2
        for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 02:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779702802; x=1780307602; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKwrXEXaLENw99YJowK3xb8rjn7NyiynQVbSpLY2vlI=;
        b=iqz+Y/tsfB0uFWamE+j53v1BeK2zrQpR9pv5fwW1JWuuIiWriBxStDGkhUvSj36xWD
         hIil90SpTRK4oSnCEWk6jwaKRubOlSCblFtBpLqBGCCK8BJi61qA6B5XtMJgC3/JV5T2
         kzZZ1wGzIB1nk/xw0dI4mLBI5HqavQ10pTC3uBotdXcpAbHCHPlRgunRq165h4nrRuaP
         fBtalrdKsUdISkvwyCz5aempdjBFf4MRoOaEiyFHzEym/G73BgQ3Q57UOtIlAoYbDHUk
         zviyUfACmwvkD0ed1goOPFDA/ZYZePX5cCKKUyNub9DwMJmEc/3at95NVhBXLjmUEKO/
         ZbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779702802; x=1780307602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AKwrXEXaLENw99YJowK3xb8rjn7NyiynQVbSpLY2vlI=;
        b=o5x9V13i6iH+CKcaKMIGcRa5tm97ToU4RSXBqWtk/BtgE5YMQOCLCSZs2ZUQOfxH6q
         iP+XLYG8Lk9+Zh0QjplLEE/PQoCYW+86kPzxYRDjDzags8yhbQgmkI/YnRLfnTPU7I3P
         v6alfVv8X1Gvg3MlExqqNgqlBqTqt2s5g2SoLz7/mkIf2eM4WyRu9deWNoBw3ou2ZvJ9
         C4I7bC/h7zqL2ltTOzu2StwGZjV6dcznfnvY+8bu3A64QfuasjfAvRPhukz9Hj8Bwl37
         UbaKv2UE/SN6jtKSr0q1hcRvC5hQLpuS+oi+1qFxO8fTUElkZUnKOZ3WjGi5M1WBdBU4
         bRwg==
X-Forwarded-Encrypted: i=1; AFNElJ9Ejp4h2sJ4ilvSy0MNG01jb2YejiQXc0AJhoefxoTKq/p7VmaZB2FYdGFHNZ9w1RNkbHxu3UOSHjAGXL+l@lists.linux.dev
X-Gm-Message-State: AOJu0YwJcnBqWiDcvsp7FkvQNsmIrGnYjmmov5KrK23O+UZKyLjRKuz/
	mdSDWd1gyFDVh7jKiMd0qe13cEOCa+1AeFMNs+G0tnrROgpaqNr7wBuS
X-Gm-Gg: Acq92OHqaxoBLX25K91PgpMibGof5dGymaXTYGWMga5WlfIH1Hk9RFVEnl2yjZaWN5B
	OvPkAW0wGN7mz0yoP6e6f3SM08KoEIel5Ks3iMjJWMCKWlPeHcU652sTCILgocLWx4qTPMLtD3Z
	cKMD1vt7EbOEV3bwlU3t+0FJohKu0zw21Sn+lITkKeFnBj/W6cRde182ym29M+CZBjTlfuqOIhA
	+aez9DS2TFsQJjL/3cw90yDtAh1PkJp/54dlheSQ/WoFoCfAGy0j3QcSQ9c62H4pdGTnT40kNQ1
	b99PBinkndiRqDXZHRmO6VCNc8Lm9k3P15sUlT5NBUaoJsIf8F9AkT9y3N+Lc1Tx5o3je9ZUa1k
	AJdYV1YW7i8skKj3v2n7c6t744REriSCWr3hrm/6Ra4HTNmQfcs8XQG7slRBHT9jrEVDFqoYWLN
	EYOPRpP8QD2upJNH2PlfPi
X-Received: by 2002:a17:902:ebc2:b0:2ae:6259:5aff with SMTP id d9443c01a7336-2beb031adfdmr138558515ad.6.1779702802100;
        Mon, 25 May 2026 02:53:22 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2cd6sm92533615ad.52.2026.05.25.02.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:53:21 -0700 (PDT)
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
Subject: [PATCH v5 6/6] media: meson: vdec: Cancel esparser work in error and stop paths
Date: Mon, 25 May 2026 15:21:54 +0530
Message-ID: <20260525095216.12078-7-linux.amoon@gmail.com>
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

The esparser workqueue may remain pending when streaming is stopped or
the device is closed, leading to use-after-free if it runs after session
teardown. vdec_start_streaming(), vdec_stop_streaming(), and vdec_close()
did not cancel this work, leaving a race between session cleanup and
work execution.

Fix this by calling cancel_work_sync(&sess->esparser_queue_work) in all
cleanup paths. Unlocking and relocking sess->lock around the cancel
ensures the work handler cannot run concurrently with teardown. This
prevents dangling work items from accessing freed session memory and
eliminates a potential kernel crash.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel.org/#t
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v5: Tried to fix the order of cancel_work_sync() which could lead to
   a use-after-free. update the commit message.
---
 drivers/staging/media/meson/vdec/vdec.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 925537bd4d0b..296b387f3667 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -372,6 +372,10 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	dma_free_coherent(sess->core->dev, sess->vififo_size,
 			  sess->vififo_vaddr, sess->vififo_paddr);
 bufs_done:
+	mutex_unlock(&sess->lock);
+	cancel_work_sync(&sess->esparser_queue_work);
+	mutex_lock(&sess->lock);
+
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		sess->streamon_out = 0;
 		while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
@@ -430,6 +434,9 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 			kthread_stop(sess->recycle_thread);
 
 		vdec_poweroff(sess);
+		mutex_unlock(&sess->lock);
+		cancel_work_sync(&sess->esparser_queue_work);
+		mutex_lock(&sess->lock);
 		vdec_free_canvas(sess);
 		dma_free_coherent(sess->core->dev, sess->vififo_size,
 				  sess->vififo_vaddr, sess->vififo_paddr);
@@ -948,6 +955,8 @@ static int vdec_close(struct file *file)
 {
 	struct amvdec_session *sess = file_to_amvdec_session(file);
 
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_m2m_release(sess->m2m_dev);
 	v4l2_fh_del(&sess->fh, file);
-- 
2.50.1

