Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C35424A15
	for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 11:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OoqCZCxG"
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7ae7:b86d:c19a:877e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 159826607375;
	Thu, 12 Oct 2023 12:47:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697111221;
	bh=RixrAQBOgKHoPu9fntvJtw2OX9PZEEsf/szxAuITdMY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OoqCZCxGG5mYLqH7BsWI3ks9lAvuN2A0vIWLC0g+B1qchAvXw3rEGBCIl/oue4HFM
	 cgeVXAHwqToHSGSY0lHLFv93r78jW99SwLlvH3ClkMT2sHvhEmBwlcodI7Ylun6Cr3
	 LQGRiWfYOqXOllevieIMsnB50EhzAmJt15tGHhNVxMNGtLujVUhM2ug8kBH7ddSq/M
	 evTYgma4Jv4k45A5+otebtqyjeTYRKBZWqyI08NJBhqakXAN+PGbrTzSX4574y5nB2
	 KBX09pSZyVmoZDyHKkotwbfmzhZF/a45AL7+RNTPqL9mDKHJgKtPDHk+9qllOzQg8R
	 YffczzznFjvUA==
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
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Andy Walls <awalls@md.metrocast.net>
Subject: [PATCH v11 22/56] media: pci: cx18: Set correct value to min_buffers_needed field
Date: Thu, 12 Oct 2023 13:46:08 +0200
Message-Id: <20231012114642.19040-23-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set queue min_buffers_needed field to 3 and remove the useless
check.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Andy Walls <awalls@md.metrocast.net>
---
 drivers/media/pci/cx18/cx18-streams.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-streams.c b/drivers/media/pci/cx18/cx18-streams.c
index 597472754c4c..6ed2c9fb882c 100644
--- a/drivers/media/pci/cx18/cx18-streams.c
+++ b/drivers/media/pci/cx18/cx18-streams.c
@@ -117,13 +117,6 @@ static int cx18_queue_setup(struct vb2_queue *vq,
 	else
 		szimage = cx->cxhdl.height * 720 * 2;
 
-	/*
-	 * Let's request at least three buffers: two for the
-	 * DMA engine and one for userspace.
-	 */
-	if (vq->num_buffers + *nbuffers < 3)
-		*nbuffers = 3 - vq->num_buffers;
-
 	if (*nplanes) {
 		if (*nplanes != 1 || sizes[0] < szimage)
 			return -EINVAL;
@@ -286,7 +279,11 @@ static int cx18_stream_init(struct cx18 *cx, int type)
 		s->vidq.ops = &cx18_vb2_qops;
 		s->vidq.mem_ops = &vb2_vmalloc_memops;
 		s->vidq.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-		s->vidq.min_buffers_needed = 2;
+		/*
+		 * Let's request at least three buffers: two for the
+		 * DMA engine and one for userspace.
+		 */
+		s->vidq.min_buffers_needed = 3;
 		s->vidq.gfp_flags = GFP_DMA32;
 		s->vidq.dev = &cx->pci_dev->dev;
 		s->vidq.lock = &cx->serialize_lock;
-- 
2.39.2

