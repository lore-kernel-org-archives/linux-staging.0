Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72212C99;
	Mon, 29 Nov 2021 18:26:46 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id j3so38865958wrp.1;
        Mon, 29 Nov 2021 10:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a0+nTL0DN+mXlurHwon8EeRIBZDbCYqkIIB67asrkdI=;
        b=D9jg0iWuc1rjMrQWm7gWT/0O2pTEON1NW4/9pTdoqwKfyfG/eOpujQLPHTZvi0UWFD
         BeRngYZOam5f2lmLVwtMDAo2NO03+jsHYgYFmTrYlFh7gHK5+mSXzZOU9OdDKxqrjP2A
         Yg+gRPXi8vL3b2J9zgkFOJAnhh8FAy3YTQJoqifET/UT4OXiX8dZA8ajHApAupsPjrs8
         1muu+0iGJdHC1z85ozo83O5n14AFAi00BQmdjbqGWKMAPpr3Ycj1yqOd4O/N/bmrz9b1
         mi5g2pILmEdIiwdlUlPUpt7MjndDbma/75rmPqjlcSq9TwjFfPwjRAgwXo/GwME9njiY
         P/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a0+nTL0DN+mXlurHwon8EeRIBZDbCYqkIIB67asrkdI=;
        b=a29fY2OaPgpq+t68i1mePRAeEJx0v3zPzd0WJZc9PaP+MsJNGIOk+R+fH3Ma7ymeOh
         tB+OmAll0XdYaMI80/IbK/vbrvPcAp856NqYIXoBwIH4hFsl2LF/sQHlrFqPrctYNRfk
         JLwUOTym4uQabeYxaOeEANwmYEZ8/3ngAbwu7DJ1F/iQHG3vC23AZB5b5zJcpDr+WQBa
         k5JXj8S+z5mR4G8sWGF1VFUZJ+4k6OeaxZ/Crk2WchS6jlG14+0zzQtpuH5I17Rct9Pq
         P2JYAfnfUq5fPdAirgr5qR7KFoykK/65eiJHtStUHlq3kYA2hvaVgyqCghoddKtYy7jN
         g7RA==
X-Gm-Message-State: AOAM532VrAz627ttfFYCQrViwLAV/27FriyGW1X4lk76zNNUKA8MLGcZ
	o5T/RVxJ2KCwQlUhw4rwfus=
X-Google-Smtp-Source: ABdhPJxwEk4PeOYew3lrBCgfb3LuSgZ+3uNJEjxF89OkToMSqyoueFPcPM44bzY/pA8nWtal5C+UuA==
X-Received: by 2002:adf:a48e:: with SMTP id g14mr35615932wrb.474.1638210405319;
        Mon, 29 Nov 2021 10:26:45 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id o12sm85907wmq.12.2021.11.29.10.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 10:26:45 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: linux-media@vger.kernel.org
Cc: ezequiel@vanguardiasur.com.ar,
	nicolas.dufresne@collabora.com,
	mchehab@kernel.org,
	robh+dt@kernel.org,
	mripard@kernel.org,
	wens@csie.org,
	p.zabel@pengutronix.de,
	andrzej.p@collabora.com,
	gregkh@linuxfoundation.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 5/9] media: hantro: move postproc enablement for old cores
Date: Mon, 29 Nov 2021 19:26:29 +0100
Message-Id: <20211129182633.480021-6-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211129182633.480021-1-jernej.skrabec@gmail.com>
References: <20211129182633.480021-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Older G2 cores, like that in Allwinner H6, seem to have issue with
latching postproc register values if this is first thing done in job.
Moving that to the end solves the issue.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/hantro/hantro.h     | 2 ++
 drivers/staging/media/hantro/hantro_drv.c | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index 83ed25d9657b..06d0f3597694 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -75,6 +75,7 @@ struct hantro_irq {
  * @num_regs:			number of register range names in the array
  * @double_buffer:		core needs double buffering
  * @legacy_regs:		core uses legacy register set
+ * @late_postproc:		postproc must be set up at the end of the job
  */
 struct hantro_variant {
 	unsigned int enc_offset;
@@ -98,6 +99,7 @@ struct hantro_variant {
 	int num_regs;
 	unsigned int double_buffer : 1;
 	unsigned int legacy_regs : 1;
+	unsigned int late_postproc : 1;
 };
 
 /**
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 770f4ce71d29..33bf78be145b 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -130,7 +130,7 @@ void hantro_start_prepare_run(struct hantro_ctx *ctx)
 	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
 				&ctx->ctrl_handler);
 
-	if (!ctx->is_encoder) {
+	if (!ctx->is_encoder && !ctx->dev->variant->late_postproc) {
 		if (hantro_needs_postproc(ctx, ctx->vpu_dst_fmt))
 			hantro_postproc_enable(ctx);
 		else
@@ -142,6 +142,13 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
 {
 	struct vb2_v4l2_buffer *src_buf;
 
+	if (!ctx->is_encoder && ctx->dev->variant->late_postproc) {
+		if (hantro_needs_postproc(ctx, ctx->vpu_dst_fmt))
+			hantro_postproc_enable(ctx);
+		else
+			hantro_postproc_disable(ctx);
+	}
+
 	src_buf = hantro_get_src_buf(ctx);
 	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
 				   &ctx->ctrl_handler);
-- 
2.34.1

