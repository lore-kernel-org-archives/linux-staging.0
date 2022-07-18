Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53C4EA6;
	Mon, 18 Jul 2022 08:40:01 +0000 (UTC)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:4754:89ee:32c6:e620])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F1D786601A1B;
	Mon, 18 Jul 2022 09:39:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658133594;
	bh=p1IL0WApAId0OF2roNkCC1LN0QMRN6h/Fzya6tDqTJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bNTMEP3NGof4m/05T5ErKNB6zBdxk7o8uu7EzV6O+TXcJGGOesbsBZ5IBBI3S/H4C
	 rY/8idtsmPNdCQVneBfN5sHPBtnMjGW0ysZ7kb0nS9bC845it6XZCjhFveSGrBEDNp
	 S7MFX2hpW7ehPKoOekzqM9ZXqswy6GmJ04mHBuaEsjCLYebLrfRM9+7UtJneXQxdFx
	 R9+EymURvZCcOeYMz7zekaI+LIoawhphJnG6Z1HNdrnQFlJ3ysdoMlZi44ufLC2CDC
	 azATiv/epXe/Ts/MlexbOKpkAbZa5sCW1pj0m482/zO65RhBZLY1SCfaiYj5E7qrHg
	 NthFthxzUvSeQ==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	mripard@kernel.org,
	paul.kocialkowski@bootlin.com,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	nicolas.dufresne@collabora.com,
	andrzej.p@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 1/7] media: hantro: Store HEVC bit depth in context
Date: Mon, 18 Jul 2022 10:39:39 +0200
Message-Id: <20220718083945.200845-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220718083945.200845-1-benjamin.gaignard@collabora.com>
References: <20220718083945.200845-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Store HEVC bit depth in context.
Bit depth is equal to hevc sps bit_depth_luma_minus8 + 8.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/staging/media/hantro/hantro_hevc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/hantro/hantro_hevc.c b/drivers/staging/media/hantro/hantro_hevc.c
index 5984c5fa6f83..dcb5c8703b6e 100644
--- a/drivers/staging/media/hantro/hantro_hevc.c
+++ b/drivers/staging/media/hantro/hantro_hevc.c
@@ -163,6 +163,8 @@ int hantro_hevc_validate_sps(struct hantro_ctx *ctx, const struct v4l2_ctrl_hevc
 		/* Only 8-bit is supported */
 		return -EINVAL;
 
+	ctx->bit_depth = sps->bit_depth_luma_minus8 + 8;
+
 	/*
 	 * for tile pixel format check if the width and height match
 	 * hardware constraints
-- 
2.32.0

