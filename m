Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA0D48DA;
	Sun, 27 Feb 2022 14:50:36 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id lw4so20005910ejb.12;
        Sun, 27 Feb 2022 06:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h0hl126aUwxb4PSQYFJBWdIRBbMkxmpBsFtc/sUEmus=;
        b=ZqYYVei1mzsAvqBzrob99pzoGKGY7zVJUtRC5+0Y/kSWlDJ8cA6r/aoConZ2+E9Mn2
         T/lJcDV98ANrQE2I6qShTK9wY5dg8Kj8/qijqBA7vORA4fkkjI/Jf4YDz5crOvMb2A2X
         leslwNk37O2t98qAAuzt6V70Kdu318CbR+ub8MHBLVvis2kphZBOCYnnJRHZyAotmdqp
         1iEy/li/k5o7ao5fzgCkMyV5qCAsVacdexk2X661I+YzRvF2TVJdgxvs5xFPOF6exJd/
         UBwXMkmSrtvVq3oPGadlQSEPaWMECzlkAeqo507Z6vwf1nkexU0qeqsNfgsb5hnp/YsL
         woYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h0hl126aUwxb4PSQYFJBWdIRBbMkxmpBsFtc/sUEmus=;
        b=xW+SeskIIkKJ02lbG5oOSr5MMBj0Afksc0eYRxvBUrtIf0kUR30Us5bgDp2f0tEejP
         /A8mDvfqPJO7HXyY9ItWrOOqLmg6D+I04JIzUXeqw2ZNXTQWNm8oEJWh/2/sAUbGokRP
         Lpn8SNI8NxrOktyH8PrsZxXAqqHSKrVaklpAflvA5taAPmsd+AspaP4w6gNupIf0lDnX
         D3HW6JAteaUqigNLLKizrD+AnmrkuH0LRDEUcBD4uW4MgHJ1adPqPB3wVD344UESE/g+
         UolamYXuAV/Y/La5n8cN6sUODCx0vjLmZ5Nt7roV1861z+JfC5Zq1s0NGQNkktrPcjCI
         cZ0w==
X-Gm-Message-State: AOAM532nk+aTHZldK7guQEfN0RSFj0MGtzEpiJGwcw6K48BBBLqwQrgr
	LM1f8e6X170LoJCndaMuOiY=
X-Google-Smtp-Source: ABdhPJwC9BrQTMCj9U3aIxaUX5zC0VOt6dPWeDEEWUeu9vfRSKOAjGywKeocjVU11912bQjFNxCQcA==
X-Received: by 2002:a17:906:85b:b0:69d:eb3:8a7c with SMTP id f27-20020a170906085b00b0069d0eb38a7cmr12318500ejd.427.1645973435045;
        Sun, 27 Feb 2022 06:50:35 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id a1-20020a1709063e8100b006ce06ed8aa7sm3501887ejj.142.2022.02.27.06.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 06:50:34 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de
Cc: mchehab@kernel.org,
	nicolas@ndufresne.ca,
	hverkuil-cisco@xs4all.nl,
	gregkh@linuxfoundation.org,
	wens@csie.org,
	samuel@sholland.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [RFC PATCH 5/8] media: hantro: postproc: Fix legacy regs configuration
Date: Sun, 27 Feb 2022 15:49:23 +0100
Message-Id: <20220227144926.3006585-6-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220227144926.3006585-1-jernej.skrabec@gmail.com>
References: <20220227144926.3006585-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some postproc legacy registers were set in VP9 code. Move them to
postproc and fix their value.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/hantro/hantro_g2_vp9_dec.c |  8 --------
 drivers/staging/media/hantro/hantro_postproc.c   | 10 ++++++++++
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g2_vp9_dec.c b/drivers/staging/media/hantro/hantro_g2_vp9_dec.c
index 91c21b634fab..c9cb11fd95af 100644
--- a/drivers/staging/media/hantro/hantro_g2_vp9_dec.c
+++ b/drivers/staging/media/hantro/hantro_g2_vp9_dec.c
@@ -515,16 +515,8 @@ static void
 config_bit_depth(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_frame *dec_params)
 {
 	if (ctx->dev->variant->legacy_regs) {
-		u8 pp_shift = 0;
-
 		hantro_reg_write(ctx->dev, &g2_bit_depth_y, dec_params->bit_depth);
 		hantro_reg_write(ctx->dev, &g2_bit_depth_c, dec_params->bit_depth);
-		hantro_reg_write(ctx->dev, &g2_rs_out_bit_depth, dec_params->bit_depth);
-
-		if (dec_params->bit_depth > 8)
-			pp_shift = 16 - dec_params->bit_depth;
-
-		hantro_reg_write(ctx->dev, &g2_pp_pix_shift, pp_shift);
 		hantro_reg_write(ctx->dev, &g2_pix_shift, 0);
 	} else {
 		hantro_reg_write(ctx->dev, &g2_bit_depth_y_minus8, dec_params->bit_depth - 8);
diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
index 1a76628d5754..11ae663f11b7 100644
--- a/drivers/staging/media/hantro/hantro_postproc.c
+++ b/drivers/staging/media/hantro/hantro_postproc.c
@@ -113,6 +113,16 @@ static void hantro_postproc_g2_enable(struct hantro_ctx *ctx)
 
 	hantro_write_addr(vpu, G2_RS_OUT_LUMA_ADDR, dst_dma);
 	hantro_write_addr(vpu, G2_RS_OUT_CHROMA_ADDR, dst_dma + chroma_offset);
+	if (ctx->dev->variant->legacy_regs) {
+		int out_depth = hantro_get_formath_depth(ctx->dst_fmt.pixelformat);
+		u8 pp_shift = 0;
+
+		if (out_depth > 8)
+			pp_shift = 16 - out_depth;
+
+		hantro_reg_write(ctx->dev, &g2_rs_out_bit_depth, out_depth);
+		hantro_reg_write(ctx->dev, &g2_pp_pix_shift, pp_shift);
+	}
 	hantro_reg_write(vpu, &g2_out_rs_e, 1);
 }
 
-- 
2.35.1

