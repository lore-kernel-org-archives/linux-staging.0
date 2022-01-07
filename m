Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971422CA3
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 09:35:08 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id h1so4464853pls.11
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 01:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rdOIoZ+TgGuU5AsegB3fHTze1qyXqLuPOXXXHf1uigo=;
        b=N/iRPyGDvOpeNg78lIyT9dxhuh54SZrC9Wq054ryPDJeYxTiaD/9ob0UvN0CKHuB5/
         VEWXt30685YBAH/gbvqXGQQlacbvGPse47ag/5OQtn126Yuo8qqqjdl/QpBVtQ3I6yxt
         YAmHBVVZepadD41/3AdToNEZP/ml4Xe0uQ34A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rdOIoZ+TgGuU5AsegB3fHTze1qyXqLuPOXXXHf1uigo=;
        b=6yjPF1oIkyy3Hrhk91tpiOEM7H6WX36IqiNB4mqj0SGn3tK30CuGHN1SK3fUYCQf8a
         zPZT3Egqo4zY3e9+cLwVvhSR/Vl8nWjKnES4yj8EsaTkliJ2GVvq2Zrpekh8ZvmhTZxO
         B6BrxIb1Yij4t2/uRWvkfCYT9leMATCFetRMnwf6X95b7ZYZeivl/N6kFcJY16DdRxa2
         ArwI7CUVMnAe+lDdJohjlBoZCFKytOm8irEcSVsG31GAgZDcTG+4UKV4MyaU33G3WWSe
         iluLrjKMUwTrQxTcMn1tE9edd6RIOa5r1AFrE9KewaHMpXvCn++ye1lvsO+yp2ADoucD
         EfDw==
X-Gm-Message-State: AOAM532ixVcrWa94t9l56n9UL6krLOIVggWlralWeF499EtB6LVdi318
	cT8axZx2UJoHwcZbeOAf+1DCLg==
X-Google-Smtp-Source: ABdhPJzWLTwfR71eotanrG4gal1FGzLpvAEjuqNZ8B7j935+/nKhzmavNQfJtAdv/Ldrgr775DlDYg==
X-Received: by 2002:a17:902:dac7:b0:148:ea85:af4d with SMTP id q7-20020a170902dac700b00148ea85af4dmr62032775plx.131.1641548108204;
        Fri, 07 Jan 2022 01:35:08 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8f6b:ee:64d8:ae81])
        by smtp.gmail.com with ESMTPSA id j17sm5269192pfu.77.2022.01.07.01.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 01:35:07 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFT v2 1/8] media: hantro: jpeg: Relax register writes before write starting hardware
Date: Fri,  7 Jan 2022 17:34:48 +0800
Message-Id: <20220107093455.73766-2-wenst@chromium.org>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
In-Reply-To: <20220107093455.73766-1-wenst@chromium.org>
References: <20220107093455.73766-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the earlier submissions of the Hantro/Rockchip JPEG encoder driver, a
wmb() was inserted before the final register write that starts the
encoder. In v11, it was removed and the second-to-last register write
was changed to a non-relaxed write, which has an implicit wmb() [1].
The rockchip_vpu2 (then rk3399_vpu) variant is even weirder as there
is another writel_relaxed() following the non-relaxed one.

Turns out only the last writel() needs to be non-relaxed. Device I/O
mappings already guarantee strict ordering to the same endpoint, and
the writel() triggering the hardware would force all writes to memory
to be observed before the writel() to the hardware is observed.

[1] https://lore.kernel.org/linux-media/CAAFQd5ArFG0hU6MgcyLd+_UOP3+T_U-aw2FXv6sE7fGqVCVGqw@mail.gmail.com/

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/staging/media/hantro/hantro_h1_jpeg_enc.c        | 3 +--
 drivers/staging/media/hantro/rockchip_vpu2_hw_jpeg_enc.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c b/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
index 1450013d3685..03db1c3444f8 100644
--- a/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
+++ b/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
@@ -123,8 +123,7 @@ int hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx)
 		| H1_REG_AXI_CTRL_INPUT_SWAP32
 		| H1_REG_AXI_CTRL_OUTPUT_SWAP8
 		| H1_REG_AXI_CTRL_INPUT_SWAP8;
-	/* Make sure that all registers are written at this point. */
-	vepu_write(vpu, reg, H1_REG_AXI_CTRL);
+	vepu_write_relaxed(vpu, reg, H1_REG_AXI_CTRL);
 
 	reg = H1_REG_ENC_CTRL_WIDTH(MB_WIDTH(ctx->src_fmt.width))
 		| H1_REG_ENC_CTRL_HEIGHT(MB_HEIGHT(ctx->src_fmt.height))
diff --git a/drivers/staging/media/hantro/rockchip_vpu2_hw_jpeg_enc.c b/drivers/staging/media/hantro/rockchip_vpu2_hw_jpeg_enc.c
index 4df16f59fb97..b931fc5fa1a9 100644
--- a/drivers/staging/media/hantro/rockchip_vpu2_hw_jpeg_enc.c
+++ b/drivers/staging/media/hantro/rockchip_vpu2_hw_jpeg_enc.c
@@ -152,8 +152,7 @@ int rockchip_vpu2_jpeg_enc_run(struct hantro_ctx *ctx)
 		| VEPU_REG_INPUT_SWAP8
 		| VEPU_REG_INPUT_SWAP16
 		| VEPU_REG_INPUT_SWAP32;
-	/* Make sure that all registers are written at this point. */
-	vepu_write(vpu, reg, VEPU_REG_DATA_ENDIAN);
+	vepu_write_relaxed(vpu, reg, VEPU_REG_DATA_ENDIAN);
 
 	reg = VEPU_REG_AXI_CTRL_BURST_LEN(16);
 	vepu_write_relaxed(vpu, reg, VEPU_REG_AXI_CTRL);
-- 
2.34.1.575.g55b058a8bb-goog

