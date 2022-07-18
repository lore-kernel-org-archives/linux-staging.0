Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1660EBD;
	Mon, 18 Jul 2022 08:40:04 +0000 (UTC)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:4754:89ee:32c6:e620])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 13B6A6601A63;
	Mon, 18 Jul 2022 09:39:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658133598;
	bh=ZRxJT5OR9oDych6+2qH0vxPCcILDhySxzLTelLRoAwU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zll13bFJCLG7pIqNCqZHOlUpBI1QHuA6xg6tkdZ0D9nzMC20aEf01juzLIGaea7f2
	 4dcPf9gc2T+P3owNTXfuJlMI6Jb0CN0V4oLGMZIZSYeCos6K9iJR/el5fbdxIzbIS2
	 T2+XkSxLPGbe8x2a1679XwOq3lv9wDmqcoUQK/IjI02iPXsVNXUlAn2PKF72Z8e24t
	 y1TYWIrNBdI2/2IZWmPC4UKSjqpsJ3RpoR+BXdmJ/DfXxnYigZkLYKBHOh4z80G5KO
	 uvJxbmtNJPo6mye9X5l0oQlKQNEe4mt6VL9nwzhnU82jbPRFh5puFyhbPF+Hvr2wiu
	 eWAFa1Swk4tFA==
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
Subject: [PATCH v2 7/7] media: hantro: Allows luma and chroma depth to be different
Date: Mon, 18 Jul 2022 10:39:45 +0200
Message-Id: <20220718083945.200845-8-benjamin.gaignard@collabora.com>
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

Luma and chroma depth are set on different hardware registers.
Even if they aren't identical the bitstream can be compliant
to HEVC specifications and decoded by the hardware.

With this patch TSUNEQBD_A_MAIN10_Technicolor_2 conformance test
is successfully decoded.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/staging/media/hantro/hantro_hevc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_hevc.c b/drivers/staging/media/hantro/hantro_hevc.c
index 85688a4df166..26b1329893f7 100644
--- a/drivers/staging/media/hantro/hantro_hevc.c
+++ b/drivers/staging/media/hantro/hantro_hevc.c
@@ -156,9 +156,6 @@ static int tile_buffer_reallocate(struct hantro_ctx *ctx)
 
 int hantro_hevc_validate_sps(struct hantro_ctx *ctx, const struct v4l2_ctrl_hevc_sps *sps)
 {
-	if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
-		/* Luma and chroma bit depth mismatch */
-		return -EINVAL;
 	if (sps->bit_depth_luma_minus8 != 0 && sps->bit_depth_luma_minus8 != 2)
 		/* Only 8-bit and 10-bit is supported */
 		return -EINVAL;
-- 
2.32.0

