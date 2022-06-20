Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DB03205;
	Mon, 20 Jun 2022 17:55:32 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id g27so9043747wrb.10;
        Mon, 20 Jun 2022 10:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IIGvFdI/wJ4/LBOf7PZx+JpLogMq9gYH/QS1CnB4btI=;
        b=SniQDHgjVfXKBSGsUuDwSkfqHypta48g5YrJl77DFnz9lDLxN/KW8s3NVjF0xwIB1E
         MspMRJdwEUs/mTnQ2JalZYRQu7KIa/zJfFLUBAb9FuY9zj8M7tnNlFGU86Zcs5g7GVFA
         2B2526v1crqcHHSumSR7pfRFshcdw1AydSmmr8cg1EN19U8bAsidLJBsPwSoRfnCFz4I
         iRG9oWQrRufKxNXX25H7wzYJB7xBAsZVi4ihZ/PldsdeOwUgTFG53NumpzRxOaBr9h2k
         o9eD6nUDWS5SZW91nRUOQ62Ma46UNNTiSE6DO/RTB387NMpx9ADSXSiVEZlPIEGXMku8
         7dVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IIGvFdI/wJ4/LBOf7PZx+JpLogMq9gYH/QS1CnB4btI=;
        b=PNcMypUoLryfIlmvuRYY0/QRbWtwIayT+uopo09xUqTi8x1re+PxDxtrcGrIS7KDIr
         ZkPvkLxnRqtHbGv4bQnnC/iqw6kzt1IgsHBk4p2EciUVdyhpumVPk9IvmsjjO8nUt0GR
         el0udQk8U2PHLTRijOKae8WegShFVmQvWfr2xrWOP2qYv3G+8zFilx+3m9B+HONB1UZk
         xf9VXEUKftU5eG6CM+vtYAT8okn++p5PnEaq3J++aZY7YcGN+gFTLswFM4lKc2Eu5zIW
         +s4SuPvhc4skOgGr0BBpD/0QzEzGWd+RpfJ23uO31lHaL3mm5NfPQw83xKoKfGcI0VW5
         Uxxg==
X-Gm-Message-State: AJIora8ZcYfA40rP/TV29lN1PIIlGf7wy9Tkim+BFKaDKop1GU3aap5i
	2gaFf+inIX8Yvr/ra6djpUw=
X-Google-Smtp-Source: AGRyM1ufCg7KEptfMe5HeaGDv+eQ7f13H7/55G33w2XYZBwqxHDxoDuZ2UX8gz0YB/Putqu5tQ5zcA==
X-Received: by 2002:a05:6000:2a4:b0:219:2aad:51ce with SMTP id l4-20020a05600002a400b002192aad51cemr23651238wry.719.1655747731160;
        Mon, 20 Jun 2022 10:55:31 -0700 (PDT)
Received: from kista.localdomain (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id 184-20020a1c02c1000000b0039db31f6372sm19620752wmc.2.2022.06.20.10.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 10:55:30 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	paul.kocialkowski@bootlin.com,
	wens@csie.org,
	samuel@sholland.org
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/7] media: cedrus: h265: Fix flag name
Date: Mon, 20 Jun 2022 19:55:11 +0200
Message-Id: <20220620175517.648767-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220620175517.648767-1-jernej.skrabec@gmail.com>
References: <20220620175517.648767-1-jernej.skrabec@gmail.com>
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
index 7b67cb4621cf..9ee6f0f111e5 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -576,7 +576,6 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 
 	reg = VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_TC_OFFSET_DIV2(slice_params->slice_tc_offset_div2) |
 	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_BETA_OFFSET_DIV2(slice_params->slice_beta_offset_div2) |
-	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_POC_BIGEST_IN_RPS_ST(decode_params->num_poc_st_curr_after == 0) |
 	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_CR_QP_OFFSET(slice_params->slice_cr_qp_offset) |
 	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_CB_QP_OFFSET(slice_params->slice_cb_qp_offset) |
 	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_QP_DELTA(slice_params->slice_qp_delta);
@@ -589,6 +588,9 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
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

