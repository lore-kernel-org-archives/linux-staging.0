Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8142CA7;
	Wed, 15 Jun 2022 20:44:58 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id cn20so5463951edb.6;
        Wed, 15 Jun 2022 13:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NK4/Hf2pXq8vs+whlyiQe78XKedAQVOQEImTLUfGWOc=;
        b=OstEOMN8l+7npy77KUmPSRCg2LzLv1OR1shAiljV1nNYHy9d/m1pThZxIcx+Kjmnfj
         ZAScAe4SUfnFwWjLjeJGYAWYy59O1Ml8HXLsS7644REPqg9673p6c87WEWXW3gxlofJQ
         QrPywh6GbNd+HcWGKYidKe3NugaQbky+dvkolOrEKvd0zIKvECvUDQ6wcfPU6h3zxdko
         WeKuaGwweoEg43gUJcQwrQ+RmdCD7Nw3CEIB5XVIrOLAj8lW3mJb2Z2m9DM7WStLFEPZ
         oaqDHcxgwShOgctMEUEPva7Tup/ZeFA3cizW/ZcjNpfg0sGQUBNj6fnOVxkOMu34sUiV
         p2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NK4/Hf2pXq8vs+whlyiQe78XKedAQVOQEImTLUfGWOc=;
        b=SPqGnOC5n+wv6/Z9Kw+/LVXjxgtRgz86ZqETFF6vSIRAwXIdJpPuiwMRkdUBETNJ1b
         +l0slHu69mpp4FtEDGowgMib7e9Ukjut3n8ummnoYUCc4uLj0sMptp1hVqYbWV0PWiV3
         tAUSZCiXqdByfSKc/KR9wBvfa8vo+i49nKICnOgJUWnERQ1XqMWYi8dBzyRSNWsaKh1N
         9o2a4HyU3b5G7GgVnwLbiMfSP3FtzgaAEjHfEaaixd7XcEbxAXGV53vdsy7xxZrig8Np
         lJd3wDGS0GpAv7ZKQwPIFcouR6gDv2RjG490UMH3w/JDB+TgSSIhzKSLpNVEUhiPFi8R
         TNsQ==
X-Gm-Message-State: AJIora/++fS7tTebTpdzxXVT5RQzJ4yDsOSX9yOpBb4qO/ZrXfPDlx01
	eMafiL2JJfYaI8Tcgkp1VA4=
X-Google-Smtp-Source: AGRyM1v+txm9b7SzlUcjBJURyyLsNCjRqLfWXvxRuKU4XIbf2Gz0hrB3Tn174dc3BSTZxOxoduxPrg==
X-Received: by 2002:aa7:d052:0:b0:42d:d114:43f7 with SMTP id n18-20020aa7d052000000b0042dd11443f7mr2046980edo.320.1655325896550;
        Wed, 15 Jun 2022 13:44:56 -0700 (PDT)
Received: from kista.localdomain (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id h16-20020a1709060f5000b00711d0b41bcfsm6777291ejj.0.2022.06.15.13.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 13:44:56 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	paul.kocialkowski@bootlin.com
Cc: mchehab@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	hverkuil-cisco@xs4all.nl,
	benjamin.gaignard@collabora.com,
	nicolas.dufresne@collabora.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: cedrus: h265: Fix flag name
Date: Wed, 15 Jun 2022 22:44:35 +0200
Message-Id: <20220615204436.137377-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220615204436.137377-1-jernej.skrabec@gmail.com>
References: <20220615204436.137377-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bit 21 in register 0x24 (slice header info 1) actually represents
negated version of low delay flag. This can be seen in vendor Cedar
library source code. While this flag is not part of the standard, it can
be found in reference HEVC implementation.

Fix macro name and change it to flag.

Fixes: 86caab29da78 ("media: cedrus: Add HEVC/H.265 decoding support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 4 +++-
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h | 3 +--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 44f385be9f6c..2febdf7a97fe 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -559,7 +559,6 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 
 	reg = VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_TC_OFFSET_DIV2(slice_params->slice_tc_offset_div2) |
 	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_BETA_OFFSET_DIV2(slice_params->slice_beta_offset_div2) |
-	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_POC_BIGEST_IN_RPS_ST(decode_params->num_poc_st_curr_after == 0) |
 	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_CR_QP_OFFSET(slice_params->slice_cr_qp_offset) |
 	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_CB_QP_OFFSET(slice_params->slice_cb_qp_offset) |
 	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_QP_DELTA(slice_params->slice_qp_delta);
@@ -572,6 +571,9 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 				V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_LOOP_FILTER_ACROSS_SLICES_ENABLED,
 				slice_params->flags);
 
+	if (decode_params->num_poc_st_curr_after == 0)
+		reg |= VE_DEC_H265_DEC_SLICE_HDR_INFO1_FLAG_SLICE_NOT_LOW_DELAY;
+
 	cedrus_write(dev, VE_DEC_H265_DEC_SLICE_HDR_INFO1, reg);
 
 	chroma_log2_weight_denom = pred_weight_table->luma_log2_weight_denom +
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
index bdb062ad8682..d81f7513ade0 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
@@ -377,13 +377,12 @@
 
 #define VE_DEC_H265_DEC_SLICE_HDR_INFO1_FLAG_SLICE_DEBLOCKING_FILTER_DISABLED BIT(23)
 #define VE_DEC_H265_DEC_SLICE_HDR_INFO1_FLAG_SLICE_LOOP_FILTER_ACROSS_SLICES_ENABLED BIT(22)
+#define VE_DEC_H265_DEC_SLICE_HDR_INFO1_FLAG_SLICE_NOT_LOW_DELAY BIT(21)
 
 #define VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_TC_OFFSET_DIV2(v) \
 	SHIFT_AND_MASK_BITS(v, 31, 28)
 #define VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_BETA_OFFSET_DIV2(v) \
 	SHIFT_AND_MASK_BITS(v, 27, 24)
-#define VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_POC_BIGEST_IN_RPS_ST(v) \
-	((v) ? BIT(21) : 0)
 #define VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_CR_QP_OFFSET(v) \
 	SHIFT_AND_MASK_BITS(v, 20, 16)
 #define VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_CB_QP_OFFSET(v) \
-- 
2.36.1

