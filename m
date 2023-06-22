Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1381ED43
	for <linux-staging@lists.linux.dev>; Thu, 22 Jun 2023 13:14:03 +0000 (UTC)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7d72:676c:e745:a6ef])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 465616607134;
	Thu, 22 Jun 2023 14:14:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1687439641;
	bh=L/PjipZuAgM8U3/G13tgH1tvV239+bgnDOvwg/NHT0o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oie9OYCVzgy392asDkxBx6pxe2/ZE5DwJwj5wC+XHaa1K50YLVzx2KFrvUnDE4Fxb
	 bolJAeXxnDGzshzKaVttYEvDKuWJMvWDs/tnXVj2YJDdRkm1YGLQL5AKKZlonUsHhl
	 kqJ43rCFtmcWzXqIK7gNcRlJOFy6NaHRp/jM96egbEOykqF4U5IprC1Yzk7lY41CxP
	 rJtWH/9odTvPjI7XFgv321jDmQ01jhmTZbtv1y6RSn4ZJRCQHTCgU0CJiFeBbSX69h
	 NtaB6tRkK34wlQgPgbUmlhb3bh4dLhcA0RhJvtfjLTIrAZZYIU8uYVFn6YB+p0mNhs
	 nBqsle6SK92Lw==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	ming.qian@nxp.com,
	ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3 08/11] media: verisilicon: postproc: Fix down scale test
Date: Thu, 22 Jun 2023 15:13:46 +0200
Message-Id: <20230622131349.144160-9-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230622131349.144160-1-benjamin.gaignard@collabora.com>
References: <20230622131349.144160-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not allow down scaling if the source buffer resolution is
smaller than destination one.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/verisilicon/hantro_postproc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
index a6b67d0cc66c..a4f2c5e8932c 100644
--- a/drivers/media/platform/verisilicon/hantro_postproc.c
+++ b/drivers/media/platform/verisilicon/hantro_postproc.c
@@ -103,7 +103,10 @@ static void hantro_postproc_g1_enable(struct hantro_ctx *ctx)
 
 static int down_scale_factor(struct hantro_ctx *ctx)
 {
-	if (ctx->src_fmt.width == ctx->dst_fmt.width)
+	if (ctx->src_fmt.width <= ctx->dst_fmt.width)
+		return 0;
+
+	if (ctx->src_fmt.height <= ctx->dst_fmt.height)
 		return 0;
 
 	return DIV_ROUND_CLOSEST(ctx->src_fmt.width, ctx->dst_fmt.width);
-- 
2.39.2

