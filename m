Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7984C2C81;
	Mon, 22 Nov 2021 18:47:18 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id x15so80817377edv.1;
        Mon, 22 Nov 2021 10:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MWqT8jgM+LxizZRnwNQ4lYoOgf1SpCYqwsAExcOLMVI=;
        b=Hes/v+KIictHB9Qldriu0R0Qd+74EZhSW4B024o73zgqni34zeC7mkXgTMJkLtMm+i
         vcnS6Qc6Z37MOOBzqOxcV+rv/TvxLDJimsZjN2X5WwfiN3/96AUjETN5yaT/AvgKrx3b
         YwJ+0rSmwFY6kcTfK3LOrLxg9eCpGBITD1cm5ie7/l5oMSItGmq8ilvTzXcVXZbetgTX
         Dew+15IJM20AAfD5Ek7ISIXz/FjD9smpJ8pdQe8hMLhhPDmU7atznfWgVFNrtyPNpQOZ
         k2gRpRSmBY0A5knsMdYsxAju+8nT67k8oX7H2sA88WS5jBiIhqw5OY3jNjdmZF37PgvK
         VZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MWqT8jgM+LxizZRnwNQ4lYoOgf1SpCYqwsAExcOLMVI=;
        b=deVNA3o4kM5kTp6XTgeoCEwe9eXeoiN3Fi7hSiL6Y96hU7nw+rJfceeWCmkpXMRxQV
         ETElNycqzHnXm1SVOIJGsvw/si/uI8cSQ+gTfWU5W+j84jucEG3vhWGNexSY5xeqUcez
         SknwZPYY8s8jAuj04pAawWU5Bjh4Z5nQJptX8ipdrsSCALELiw3OH7/C4DkSPWIpobpY
         6rFItqnjPxDezZ4QSMyeUW0EJogcBVHsk0X7VkFM36NAoPg9LfxNM6vEKqUKawfvz7OU
         f7G9wtnBz6jGvQqg3kjC1I4REPhRb4Ypj/GNALgxzVm2rewItGdxa5GqIiPX19v9wpPf
         ZhmA==
X-Gm-Message-State: AOAM5326e1cQa1eR9vNOEH46iYUGik/zS4vkNixcwDg2RT7JO6jrngve
	xwbhCM/nEl5amPUWklfPLeY=
X-Google-Smtp-Source: ABdhPJz35lPCNuyABipllxBzdcJzYzKIiQZ5XLS+pqrXIVlp7yUVBLtqgqtbilp4nqQsAW5aIh3sKQ==
X-Received: by 2002:a17:906:2b16:: with SMTP id a22mr42530944ejg.447.1637606836941;
        Mon, 22 Nov 2021 10:47:16 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id h10sm4512312edr.95.2021.11.22.10.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 10:47:16 -0800 (PST)
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
Subject: [PATCH 4/7] media: hantro: move postproc enablement for old cores
Date: Mon, 22 Nov 2021 19:46:59 +0100
Message-Id: <20211122184702.768341-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211122184702.768341-1-jernej.skrabec@gmail.com>
References: <20211122184702.768341-1-jernej.skrabec@gmail.com>
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
 drivers/staging/media/hantro/hantro_drv.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 8c3de31f51b3..530994ab3024 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -130,7 +130,7 @@ void hantro_start_prepare_run(struct hantro_ctx *ctx)
 	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
 				&ctx->ctrl_handler);
 
-	if (!ctx->is_encoder) {
+	if (!ctx->is_encoder && !ctx->dev->variant->legacy_regs) {
 		if (hantro_needs_postproc(ctx, ctx->vpu_dst_fmt))
 			hantro_postproc_enable(ctx);
 		else
@@ -142,6 +142,13 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
 {
 	struct vb2_v4l2_buffer *src_buf;
 
+	if (ctx->dev->variant->legacy_regs && !ctx->is_encoder) {
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
2.34.0

