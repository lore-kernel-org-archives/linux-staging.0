Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE9321A0A
	for <linux-staging@lists.linux.dev>; Thu, 14 Sep 2023 13:33:44 +0000 (UTC)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 741D26607356;
	Thu, 14 Sep 2023 14:33:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694698419;
	bh=jUystvUPhotVsWFQwzoEvrV6ekQradIDM/On3bu5eyU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JzNs/qqsuOQni5rFNh5FnwVhEdW6UACA0W7zv6lpXOMRQg1Zjd1cRRAJpq34lYOc3
	 HBwKx3EUT+Bku/VNGm5d7cI3oyJ2ymko6e5D+6mQYlsoALF715+ubY8rEz9dDvu6uI
	 I4Kp0rZeMokBVw7fljsaXntHXQSXmvwVqKvcLhkMRk9J7PMtkCqd8x1ue/wiiWwjIn
	 TKIVhVLQozr7frLJfPYZJyvVkG+mao4mrnKv4hmzhotqb+dRKrArJiTe5FAS0nDveN
	 x9oVlJ1k4DtFsJV4VCLA4SWpRxqhTKKTZA+jp1fiE7aNYwj+TwYIDsMzlERoLEjZwG
	 o6qPTSg3GjcQA==
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
Subject: [PATCH v7 16/49] media: verisilicon: postproc: Fix down scale test
Date: Thu, 14 Sep 2023 15:32:50 +0200
Message-Id: <20230914133323.198857-17-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not allow down scaling if the source buffer resolution is
smaller  than destination one.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Fixes: fbb6c848dd89 ("media: destage Hantro VPU driver")
---
 drivers/media/platform/verisilicon/hantro_postproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
index e624cd98f41b..77d8ecfbe12f 100644
--- a/drivers/media/platform/verisilicon/hantro_postproc.c
+++ b/drivers/media/platform/verisilicon/hantro_postproc.c
@@ -107,7 +107,7 @@ static void hantro_postproc_g1_enable(struct hantro_ctx *ctx)
 
 static int down_scale_factor(struct hantro_ctx *ctx)
 {
-	if (ctx->src_fmt.width == ctx->dst_fmt.width)
+	if (ctx->src_fmt.width <= ctx->dst_fmt.width)
 		return 0;
 
 	return DIV_ROUND_CLOSEST(ctx->src_fmt.width, ctx->dst_fmt.width);
-- 
2.39.2

