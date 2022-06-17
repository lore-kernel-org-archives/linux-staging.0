Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9E32F4A;
	Fri, 17 Jun 2022 11:58:14 +0000 (UTC)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:faf2:1a12:f903:cc5e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7B38066017E6;
	Fri, 17 Jun 2022 12:58:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655467093;
	bh=UCYAWxfH7NqhDgW2LvrbsQwdBrhxn/zmxyr+y6/KCnw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gpL482i9rVqH8nuvkKstUQRydbw9K6qvl1weUz0Qvvi2hCu3gWoKEXUp7ATR/OeH9
	 yqSt0AB0X2ZZLXxLULLJLZoJa1zuZ4Pwb/Y0L5WZaBRwL0LnXH6hdh9SHILYPKEOBc
	 duFRTtLJsT40jracOgjtXRwUXVquPVD8K2TX7ASEQIRD7G8RxlXlepEW+xtSXgjs6K
	 5X0lzuqj8zPDiZh194vkfaZxEXjREDTA4KNHn/Ny/z3lzDmWhxjrgZsk85VP4NUDUT
	 Sb+93VPYO2ksa/Vf33gMIOQZbyOc4t7kEDlpU9lqi3bWef8N0IQjNLFwgR5BCKwvmu
	 TY6CNssUSUz7w==
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
Subject: [PATCH 3/7] media: hantro: HEVC: Fix chroma offset computation
Date: Fri, 17 Jun 2022 13:57:58 +0200
Message-Id: <20220617115802.396442-4-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220617115802.396442-1-benjamin.gaignard@collabora.com>
References: <20220617115802.396442-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The chroma offset depends of the bitstream depth.
Make sure that ctx->bit_depth is used to compute it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/staging/media/hantro/hantro_g2_hevc_dec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
index 9eac133bda68..8407ad45b7b7 100644
--- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
+++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
@@ -12,7 +12,7 @@
 
 static size_t hantro_hevc_chroma_offset(struct hantro_ctx *ctx)
 {
-	return ctx->dst_fmt.width * ctx->dst_fmt.height;
+	return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth / 8;
 }
 
 static size_t hantro_hevc_motion_vectors_offset(struct hantro_ctx *ctx)
-- 
2.32.0

