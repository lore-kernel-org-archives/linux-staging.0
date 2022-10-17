Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C494699;
	Mon, 17 Oct 2022 19:44:43 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id r17so27296577eja.7;
        Mon, 17 Oct 2022 12:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TATHs2k56ufe8lMmyZToJvN32Rg6lEJir/LHJFUdZoQ=;
        b=N3sgwEdi/Li9SwIj/vg8LX7AlvncoeCI/CvSob3JryDoMtcajL9Cd/gfa/CHNCK3V2
         /+e09Gsxp9TYe/Um/zGAOSjHpKWWCn705BM0SuiF2d2RfEM9Uemyj3dh+G/l+9fYWOGG
         bkL8KJH3p/ZHIb5bJL5DAg4abHZX86DtWHAuiKneynkSRDr/Ct0vEUIFnNEwU0p8Vp9U
         HVCjMCoBZqky86jWTElx7jHZgqj/cQNDLZpTU3QL91+EKAspLGMdmatW3Ef6ndE7xkWM
         Ili2sXBR2M8G/TbUFT8qf0GArmRWYYC24xWAucLpcMA3BVA6z7pZTy7ZMoXJfrXfc4P3
         vODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TATHs2k56ufe8lMmyZToJvN32Rg6lEJir/LHJFUdZoQ=;
        b=UqshbD5O4IgNyh+H0IkoNvaA3tEh2BSdPyhMEd3r0xEWWdhhYinNKW/YMLmDqvbqd0
         x1+xD0lYv/dksrGxdwaR7+YXdGkRXAh0263GjvHSMzDptSGwCkjBHo9m0COeuT3NeOSW
         3RqMAqEnXf5tGOUsShN5088yEjgP2pI9o2gRfbmrfb84jiya1OKMDMmOP0/U6ESpnhoz
         boXynB/acfp3+KXOHIy6GWXWY14yv13/qP3G23vsmMBjKTgV6kNy0zNIheMXo5rWwCJ9
         NEQQneV+V0Ez/7dESVdMyOIN2kSTyJPLwW5M96TsK9Ad54d/DcLoyQblvl9V7gYiwSQs
         fYeg==
X-Gm-Message-State: ACrzQf3mBjmi6kdK85ptLi5jX7rwbj3IwMvEONSqOKLu9HV/Mht490U2
	MZQfhLMYh8NeBqdb+JRvTOQ=
X-Google-Smtp-Source: AMsMyM6VFvvFARE0TYh11hDuODd833Jng1g6K9nzB2kniIQ47qpcVhXiqYHDBu0L24rK8hkcGYdGJg==
X-Received: by 2002:a17:907:1ded:b0:78d:4606:268 with SMTP id og45-20020a1709071ded00b0078d46060268mr10090820ejc.163.1666035881499;
        Mon, 17 Oct 2022 12:44:41 -0700 (PDT)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id z5-20020a17090665c500b0078d9c2c8250sm6588957ejn.84.2022.10.17.12.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 12:44:40 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	paul.kocialkowski@bootlin.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	wens@csie.org,
	samuel@sholland.org,
	hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] media: cedrus: hevc: Fix offset adjustments
Date: Mon, 17 Oct 2022 21:44:13 +0200
Message-Id: <20221017194413.1198301-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.38.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As it turns out, current padding size check works fine in theory but it
doesn't in practice. Most probable reason are caching issues.

Let's rework reading data from bitstream using Cedrus engine instead of
CPU. That way we avoid all cache issues and make sure that we're reading
same data as Cedrus.

Fixes: e7060d9a78c2 ("media: uapi: Change data_bit_offset definition")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 25 ++++++++++++++-----
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  2 ++
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 687f87598f78..d3a29359a5a2 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -241,6 +241,18 @@ static void cedrus_h265_skip_bits(struct cedrus_dev *dev, int num)
 	}
 }
 
+static u32 cedrus_h265_show_bits(struct cedrus_dev *dev, int num)
+{
+	cedrus_write(dev, VE_DEC_H265_TRIGGER,
+		     VE_DEC_H265_TRIGGER_SHOW_BITS |
+		     VE_DEC_H265_TRIGGER_TYPE_N_BITS(num));
+
+	cedrus_wait_for(dev, VE_DEC_H265_STATUS,
+			VE_DEC_H265_STATUS_VLD_BUSY);
+
+	return cedrus_read(dev, VE_DEC_H265_BITS_READ);
+}
+
 static void cedrus_h265_write_scaling_list(struct cedrus_ctx *ctx,
 					   struct cedrus_run *run)
 {
@@ -405,7 +417,7 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	u32 num_entry_point_offsets;
 	u32 output_pic_list_index;
 	u32 pic_order_cnt[2];
-	u8 *padding;
+	u8 padding;
 	int count;
 	u32 reg;
 
@@ -519,21 +531,22 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	if (slice_params->data_byte_offset == 0)
 		return -EOPNOTSUPP;
 
-	padding = (u8 *)vb2_plane_vaddr(&run->src->vb2_buf, 0) +
-		slice_params->data_byte_offset - 1;
+	cedrus_h265_skip_bits(dev, (slice_params->data_byte_offset - 1) * 8);
+
+	padding = cedrus_h265_show_bits(dev, 8);
 
 	/* at least one bit must be set in that byte */
-	if (*padding == 0)
+	if (padding == 0)
 		return -EINVAL;
 
 	for (count = 0; count < 8; count++)
-		if (*padding & (1 << count))
+		if (padding & (1 << count))
 			break;
 
 	/* Include the one bit. */
 	count++;
 
-	cedrus_h265_skip_bits(dev, slice_params->data_byte_offset * 8 - count);
+	cedrus_h265_skip_bits(dev, 8 - count);
 
 	/* Bitstream parameters. */
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
index d81f7513ade0..655c05b389cf 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
@@ -505,6 +505,8 @@
 #define VE_DEC_H265_LOW_ADDR_ENTRY_POINTS_BUF(a) \
 	SHIFT_AND_MASK_BITS(a, 7, 0)
 
+#define VE_DEC_H265_BITS_READ			(VE_ENGINE_DEC_H265 + 0xdc)
+
 #define VE_DEC_H265_SRAM_OFFSET			(VE_ENGINE_DEC_H265 + 0xe0)
 
 #define VE_DEC_H265_SRAM_OFFSET_PRED_WEIGHT_LUMA_L0	0x00
-- 
2.38.0

