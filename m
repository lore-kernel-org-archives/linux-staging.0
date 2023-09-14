Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3E121A14
	for <linux-staging@lists.linux.dev>; Thu, 14 Sep 2023 13:33:50 +0000 (UTC)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5F0C16607384;
	Thu, 14 Sep 2023 14:33:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694698428;
	bh=5agb5+731PbAsmHV0HkXiz/yWnDWBOST3c/elC0GOlM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DaoUlmXCrWVmNSTPHSiU0Kze4b4dAxEsiAESC1T1RfI/N0JSuqIQOAC/pOIRJqpy4
	 IbiKdjzHMO2qLKCSGrfwliIrQojFUKgG/R/Z1Y8pDeP6+bXkNYoQMnC9Z+Z/rJbhyh
	 ph1SM0l0l8VshDQXmDv920KdJUit/rNECupZfAv3ipHMW2mHAJZK2iQe9A78H0W+z5
	 U9e+q85xg3sPaR4acMAVSHtDAB2q2JzFEMfNO7e7bHQSMKz5rZa9qW8iLkDBflDnLd
	 K1VEIXpGL0dy6JQifII9yJzBQQ3XK/ZRpK3MU+1qOSgK9QLT7h7/zBDb0jjd+91lC/
	 UOgkav/mWZIrQ==
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
Subject: [PATCH v7 33/49] media: sti: hva: Stop direct calls to queue num_buffers field
Date: Thu, 14 Sep 2023 15:33:07 +0200
Message-Id: <20230914133323.198857-34-benjamin.gaignard@collabora.com>
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

Use vb2_get_num_buffers() to avoid using queue num_buffer field directly.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/st/sti/hva/hva-v4l2.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/platform/st/sti/hva/hva-v4l2.c b/drivers/media/platform/st/sti/hva/hva-v4l2.c
index 326be09bdb55..cfe83e9dc01b 100644
--- a/drivers/media/platform/st/sti/hva/hva-v4l2.c
+++ b/drivers/media/platform/st/sti/hva/hva-v4l2.c
@@ -569,13 +569,6 @@ static int hva_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 		struct vb2_buffer *vb2_buf;
 
 		vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, buf->type);
-
-		if (buf->index >= vq->num_buffers) {
-			dev_dbg(dev, "%s buffer index %d out of range (%d)\n",
-				ctx->name, buf->index, vq->num_buffers);
-			return -EINVAL;
-		}
-
 		vb2_buf = vb2_get_buffer(vq, buf->index);
 		if (!vb2_buf) {
 			dev_dbg(dev, "%s buffer index %d not found\n", ctx->name, buf->index);
-- 
2.39.2

