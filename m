Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB831381AF
	for <linux-staging@lists.linux.dev>; Mon, 27 Nov 2023 16:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CudTVH0G"
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 024756607427;
	Mon, 27 Nov 2023 16:55:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104146;
	bh=F5H/xy1t7xG2JnVZwoCdxqoIZwKLuviOUA/LItWXlFI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CudTVH0GFVAKjdGuqqvwAJQo6DmaDPbWDIhBKTvy06O6+ZaBHxeVOOtmtNh1Tmoce
	 pArKAwpVjiXPzhu12+CZStv9JKm+zQFThaHzQEwSHyd2VwWb/OPMUOLXtI44geV2nr
	 lXV3xD9cB9VNaerWjiM8bC+RSlX7G0f8nSWn9HB+73763w4mtZZ8k8z7Nqivgf9z3j
	 GVRS9rjsScq1g9+Exg6mQlQpH6olubrhR407oukK8/wk0S0+nLFJweoE++qIdqQ/5+
	 W6ImZWVz0Vsw5SKHVMspeXI+bKdMGSdhMSe0GdWUXOosAIgF3b0CnY9IBykMOvlPi+
	 oLBpGHFFim9EQ==
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
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH 53/55] media: pci: cobalt: Use min_dma_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:52 +0100
Message-Id: <20231127165454.166373-54-benjamin.gaignard@collabora.com>
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

cobalt driver use a dma engine and needs a minimum number of
buffers to be present before start streaming.
That is 'min_dma_buffers_needed' purpose so use it instead
of 'min_buffers_needed' field.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/pci/cobalt/cobalt-v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cobalt/cobalt-v4l2.c b/drivers/media/pci/cobalt/cobalt-v4l2.c
index 26bf58d17a3d..9e99820f58d4 100644
--- a/drivers/media/pci/cobalt/cobalt-v4l2.c
+++ b/drivers/media/pci/cobalt/cobalt-v4l2.c
@@ -1260,7 +1260,7 @@ static int cobalt_node_register(struct cobalt *cobalt, int node)
 	q->ops = &cobalt_qops;
 	q->mem_ops = &vb2_dma_sg_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->min_buffers_needed = 2;
+	q->min_dma_buffers_needed = 2;
 	q->lock = &s->lock;
 	q->dev = &cobalt->pci_dev->dev;
 	vdev->queue = q;
-- 
2.39.2

