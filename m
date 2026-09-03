Received: from mta0.migadu.com (out-72.mta0.migadu.com [91.218.175.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D033144A3F9
	for <linux-staging@lists.linux.dev>; Thu,  3 Sep 2026 11:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434379; cv=none; b=Gg9wuk5nrCvkAS34Dh5gXQkx5Ukbsxjx5h9O0M2JHYARJzgQZjL6ONc3y7vDIAtH090lGID3DVoAEOfwlc9tEActvZo7QidlEmvmgj3aQuAsUgcFtSJTeMJ0Ypv9kYsDENVz6URMj9xMFT3F1Sy05vxUrXCYvL3ZVy1xL1i9iVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434379; c=relaxed/simple;
	bh=p8LEmNTy4lj/AysO9QHX6TPWGagSspjAfvMpNY3h2hA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=BiT0HvlPgjhpWcvCHHRf3h1N0jXk9HmOF9tBjRxLfFCSeJYFtLEgp1mtovzp8vwytp0jvkxhRNY1ArMASCm+SptyRX5oc1HJQgK8/dUgoV+oAU8ApQ2/qWhb1nQBuQgbdeCNsjwxUFkrw1+xmnEsscCFHT0pwxFyqJ1p3nWdnDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-staging@lists.linux.dev
X-Envelope-To: linux-staging@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id 23d713486fe96fd9;
	Thu, 03 Sep 2026 11:19:31 +0000
X-Mizu-Trace-ID: 23d713486fe96fd9
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	hch@lst.de,
	harry@kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>,
	linux-staging@lists.linux.dev
Subject: [PATCH 08/13] media: staging: imx: Don't use GFP_DMA when calling dma_alloc_coherent()
Date: Thu,  3 Sep 2026 19:18:31 +0800
Message-ID: <20260903111836.1777265-9-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903111836.1777265-1-hebaoquan@kylinos.cn>
References: <20260903111836.1777265-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

dma_alloc_coherent() allocates the DMA buffer with the device's
addressing limitation in mind; the DMA core picks the zone from the
device's coherent DMA mask and ignores GFP_DMA passed by the caller.
Remove the redundant GFP_DMA flag.

Cc: linux-staging@lists.linux.dev
Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 drivers/staging/media/imx/imx-media-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index f119477cac6b..7bdcb88a686b 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -588,7 +588,7 @@ int imx_media_alloc_dma_buf(struct device *dev,
 
 	buf->len = PAGE_ALIGN(size);
 	buf->virt = dma_alloc_coherent(dev, buf->len, &buf->phys,
-				       GFP_DMA | GFP_KERNEL);
+				       GFP_KERNEL);
 	if (!buf->virt)
 		return -ENOMEM;
 
-- 
2.54.0

