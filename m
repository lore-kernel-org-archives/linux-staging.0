Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CDD24A1C
	for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 11:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="R8PddrSw"
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7ae7:b86d:c19a:877e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3FA8A6607382;
	Thu, 12 Oct 2023 12:47:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697111223;
	bh=YCZw7PvG0/vvqRoLk52CD8Z7MDM+1YNzRKdH40h8V+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R8PddrSwYrJypqDe18vfuYP8TLYDSYw/idYGlsRcstM2f0sRYMh/DPISe+y0ffJuu
	 4kt/lfC2uRsFMfkzckVlAIFWIp2JhQb4rb5icnyD8NU3HdBfP+UUakTQzFCowgDnPi
	 JHHmQ8jHbxn7T91f2FbBAGBPAdi+FmWo6RBneluLVp/CPmxsQl7Pph2msO3HmussbO
	 WuNnVvFhOBDdtJMm8AAAstTlo+tI1U2BP/QgmQ2bkmktV2CfbHVTvuWscER4ftwdMY
	 YcbX3JpKccSevXBp2Z+l8xzLIpyyPPfBQbzosLLm/vYs3STa/MARBTjF0Dw+9UOZUd
	 p3nADtjXcOBzA==
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
Subject: [PATCH v11 26/56] media: pci: tw686x: Set min_buffers_needed to 3
Date: Thu, 12 Oct 2023 13:46:12 +0200
Message-Id: <20231012114642.19040-27-benjamin.gaignard@collabora.com>
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

vb2 queue_setup checks for a minimum number of buffers so set
min_buffers_needed to 3 and remove the useless check in
tw686x_queue_setup().

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/media/pci/tw686x/tw686x-video.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/tw686x/tw686x-video.c b/drivers/media/pci/tw686x/tw686x-video.c
index 3ebf7a2c95f0..74cd864365aa 100644
--- a/drivers/media/pci/tw686x/tw686x-video.c
+++ b/drivers/media/pci/tw686x/tw686x-video.c
@@ -426,13 +426,6 @@ static int tw686x_queue_setup(struct vb2_queue *vq,
 	unsigned int szimage =
 		(vc->width * vc->height * vc->format->depth) >> 3;
 
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
@@ -1221,7 +1214,11 @@ int tw686x_video_init(struct tw686x_dev *dev)
 		vc->vidq.ops = &tw686x_video_qops;
 		vc->vidq.mem_ops = dev->dma_ops->mem_ops;
 		vc->vidq.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-		vc->vidq.min_buffers_needed = 2;
+		/*
+		 * Let's request at least three buffers: two for the
+		 * DMA engine and one for userspace.
+		 */
+		vc->vidq.min_buffers_needed = 3;
 		vc->vidq.lock = &vc->vb_mutex;
 		vc->vidq.gfp_flags = dev->dma_mode != TW686X_DMA_MODE_MEMCPY ?
 				     GFP_DMA32 : 0;
-- 
2.39.2

