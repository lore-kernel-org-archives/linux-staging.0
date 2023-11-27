Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70327374D2
	for <linux-staging@lists.linux.dev>; Mon, 27 Nov 2023 16:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Lqhg8KZo"
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 060E66607314;
	Mon, 27 Nov 2023 16:55:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104112;
	bh=bIx0yhKI+ScDV20M08uZHnsyThCdjj2x5yD228Iuuco=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lqhg8KZokYkmmqeIECo9Ws1F/frc0ZzueihVGe0Indtr4/7hIh4Tu0gb+qxYqWhQo
	 qntkHXlnmpN8OSJSXBXyk1gDKVE2yDegPQuhNR/1Nd1yCmJte94yWf74OKzvXoNfNb
	 nTRbBSZ7zJ1PpL+90aSl3GwfrtEUQ1Mh+t5n8bdAFqmOGPQ4p2jnUsIyUCLxah2KQ3
	 ywygheN76NPjONpYpI5d+OgDzuMmigh6vPV6ZpY6g5uYJhFLKVyKLeKi3tvxuicqOs
	 GL9HQOX9fgqOqWE6TEmn799ggdtawQWQkrxUYTDU5cGeJi3MBteQf9Owr6Ancu2+vu
	 XgFhrD89nI40w==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	matt.ranostay@konsulko.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 09/55] media: chips-media: coda: Stop abusing of min_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:08 +0100
Message-Id: <20231127165454.166373-10-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
References: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'min_buffers_needed' is suppose to be used to indicate the number
of buffers needed by DMA engine to start streaming.
code driver doesn't use DMA engine and just want to specify
the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
That 'min_reqbufs_allocation' field purpose so use it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/chips-media/coda/coda-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index f1d85758f6dd..2b535a31e017 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -2546,7 +2546,7 @@ static int coda_queue_init(struct coda_ctx *ctx, struct vb2_queue *vq)
 	 * would need to be reflected in job_ready(). Currently we expect all
 	 * queues to have at least one buffer queued.
 	 */
-	vq->min_buffers_needed = 1;
+	vq->min_reqbufs_allocation = 1;
 	vq->dev = ctx->dev->dev;
 
 	return vb2_queue_init(vq);
-- 
2.39.2

