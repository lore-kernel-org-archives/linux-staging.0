Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1454E7483
	for <linux-staging@lists.linux.dev>; Wed,  5 Jul 2023 12:11:10 +0000 (UTC)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:cbfb:e358:222c:d8c1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DC0276606FBE;
	Wed,  5 Jul 2023 13:11:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688559067;
	bh=6n9YDENO5tS9E5wXFuEEJQVmAp+420F/j+1xBut9kDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=By8WxvmRq50dxMjr2/Qp1PvcwEYlsrV3YglpBY1hUNNS87Lw+SrJeGbsuZSqJxTbO
	 ci2cphotQ+JxWPgnJ82DzDr6E8A0Et8Pd1EiVw7TG+JXs8/isxXVul8VqV9nn099v0
	 I6rAvuOpK+ZpVr/Kia8cxeiVh+VcAnvBvA94VsKwS4LsffbM77NgsvfoyxxFixSStD
	 f9LBWSvk1wPcJRQwquS+PVl9CkwRI8ggaHAiSQkWgGm/WmpQzJmMVEeBn23vcqUn8h
	 LOU1docdsKMHpfr+nRqg/EEEhWdLgi4FDrlHuL64ZyhurDNXISqpz8OOX8rZtfrj4x
	 ynicCG9VnoQhw==
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
Subject: [PATCH v4 07/10] media: verisilicon: postproc: Fix down scale test
Date: Wed,  5 Jul 2023 14:10:53 +0200
Message-Id: <20230705121056.37017-8-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230705121056.37017-1-benjamin.gaignard@collabora.com>
References: <20230705121056.37017-1-benjamin.gaignard@collabora.com>
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
version 4:
- Add Fixes tag

 drivers/media/platform/verisilicon/hantro_postproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
index 9dfe3141a398..38e812089514 100644
--- a/drivers/media/platform/verisilicon/hantro_postproc.c
+++ b/drivers/media/platform/verisilicon/hantro_postproc.c
@@ -103,7 +103,7 @@ static void hantro_postproc_g1_enable(struct hantro_ctx *ctx)
 
 static int down_scale_factor(struct hantro_ctx *ctx)
 {
-	if (ctx->src_fmt.width == ctx->dst_fmt.width)
+	if (ctx->src_fmt.width <= ctx->dst_fmt.width)
 		return 0;
 
 	return DIV_ROUND_CLOSEST(ctx->src_fmt.width, ctx->dst_fmt.width);
-- 
2.39.2

