Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D034A1BD501;
	Wed, 31 Jul 2024 16:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722444789; cv=none; b=CjXPzIUWWW0oOWfRUadLG9xjzg6xazfWczGMv8IThaTqy5NDbsmGd6Fo9oil04Eha0zG2SV1a95jyrwqbW2CS9Wb2vo17d0rNUqvr97VEyDxBNF/YYgLIcHO7InYg0C2YMzQJgE0XilBF1QQI7wAPJUoGxGfYVqZaXGmgBIftww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722444789; c=relaxed/simple;
	bh=mrZ3g7n1/oLXeu784YnUGJEyIyvmeTD3R96dJjFzqmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nRY57R/fTn0jc3X3o66F6WjimkDy/k8xQ3vufqIB7Nwi6d+6t4+4XZB8rGiQkXSCHi5N1zkvhQjI0YDAtrdvlL6YavEdtnh1du+OMCAa4VgrG2/AQDWYnwx3uJXOwUDoIv2lhhLCw0swjDlM6UtWWCGFydGJW+KeJ0bA5x690Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 9673914649D8; Wed, 31 Jul 2024 18:44:27 +0200 (CEST)
From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To: linux-sunxi@lists.linux.dev
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] media: cedrus: Setup secondary output formats
Date: Wed, 31 Jul 2024 18:44:11 +0200
Message-ID: <20240731164422.206503-2-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240731164422.206503-1-linkmauve@linkmauve.fr>
References: <20240731164422.206503-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

It's needed for JPEG codec, since engine outputs to it for some reason.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c   | 12 +++++++++---
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h |  9 +++++++--
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index 32af0e96e762..582b6cb796ea 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -88,15 +88,21 @@ void cedrus_dst_format_set(struct cedrus_dev *dev,
 	case V4L2_PIX_FMT_NV12:
 		chroma_size = ALIGN(width, 16) * ALIGN(height, 16) / 2;
 
-		reg = VE_PRIMARY_OUT_FMT_NV12;
+		reg = VE_PRIMARY_OUT_FMT_NV12 | VE_SECONDARY_OUT_FMT_EXT_NV12;
 		cedrus_write(dev, VE_PRIMARY_OUT_FMT, reg);
 
 		reg = chroma_size / 2;
 		cedrus_write(dev, VE_PRIMARY_CHROMA_BUF_LEN, reg);
 
-		reg = VE_PRIMARY_FB_LINE_STRIDE_LUMA(ALIGN(width, 16)) |
-		      VE_PRIMARY_FB_LINE_STRIDE_CHROMA(ALIGN(width, 16) / 2);
+		reg = VE_CHROMA_BUF_LEN_SDRT(chroma_size / 2) |
+		      VE_CHROMA_WIDTH_ALIGN_8 |
+		      VE_SECONDARY_OUT_FMT_EXT;
+		cedrus_write(dev, VE_CHROMA_BUF_LEN, reg);
+
+		reg = VE_FB_LINE_STRIDE_LUMA(ALIGN(width, 16)) |
+		      VE_FB_LINE_STRIDE_CHROMA(ALIGN(width, 16) / 2);
 		cedrus_write(dev, VE_PRIMARY_FB_LINE_STRIDE, reg);
+		cedrus_write(dev, VE_SECONDARY_FB_LINE_STRIDE, reg);
 
 		break;
 	case V4L2_PIX_FMT_NV12_32L32:
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
index 05e6cbc548ab..3acc05e0fb54 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
@@ -59,9 +59,10 @@
 #define VE_INTRAPRED_DRAM_BUF_ADDR		0x58
 #define VE_PRIMARY_CHROMA_BUF_LEN		0xc4
 #define VE_PRIMARY_FB_LINE_STRIDE		0xc8
+#define VE_SECONDARY_FB_LINE_STRIDE		0xcc
 
-#define VE_PRIMARY_FB_LINE_STRIDE_CHROMA(s)	SHIFT_AND_MASK_BITS(s, 31, 16)
-#define VE_PRIMARY_FB_LINE_STRIDE_LUMA(s)	SHIFT_AND_MASK_BITS(s, 15, 0)
+#define VE_FB_LINE_STRIDE_CHROMA(s)		SHIFT_AND_MASK_BITS(s, 31, 16)
+#define VE_FB_LINE_STRIDE_LUMA(s)		SHIFT_AND_MASK_BITS(s, 15, 0)
 
 #define VE_CHROMA_BUF_LEN			0xe8
 
@@ -69,6 +70,10 @@
 #define VE_SECONDARY_OUT_FMT_EXT		(0x01 << 30)
 #define VE_SECONDARY_OUT_FMT_YU12		(0x02 << 30)
 #define VE_SECONDARY_OUT_FMT_YV12		(0x03 << 30)
+#define VE_CHROMA_WIDTH_ALIGN_16		(0x00 << 29)
+#define VE_CHROMA_WIDTH_ALIGN_8			(0x01 << 29)
+#define VE_LUMA_WIDTH_ALIGN_16			(0x00 << 28)
+#define VE_LUMA_WIDTH_ALIGN_32			(0x01 << 28)
 #define VE_CHROMA_BUF_LEN_SDRT(l)		SHIFT_AND_MASK_BITS(l, 27, 0)
 
 #define VE_PRIMARY_OUT_FMT			0xec
-- 
2.45.2

