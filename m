Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F192924A13
	for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 11:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ldW/Ogjn"
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7ae7:b86d:c19a:877e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2B9EB660737C;
	Thu, 12 Oct 2023 12:47:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697111222;
	bh=tcL10ushjZKOfejORLVlDBPX8x0SngzD2gGkivTGU0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ldW/Ogjn9kC7gijcctJUy/y/+tFA0G7iAnA/ttNi0MVF+0mW3uyktXU526npAf3Wd
	 B8jXbM6qUhwD4mEpacvh2dWg6MJNrsnW6dpB5ib3/1mvycY4+CBfekkt4EjWGKu5tT
	 LrMbdQ+L9Qviv1A8u8gVDalkbsHMBXdPyTD3EPT/+xxlJxg+Prl3SfhCCQNm7zSf9w
	 NOw3TH2uk3HtGi0/wwAHViVKX8HCyoCNJdUba0qgVOCyqpbCbVO3pdmOz72ATTysmj
	 yb3MqZbn66e2YrfsDGI4rkDivBXmmL8PVFzGf7/LwkbgCG97VWKM9OLI7HX0Y612ho
	 dGi7FgsOFNteg==
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
	Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>
Subject: [PATCH v11 24/56] media: pci: netup_unidvb: Remove useless number of buffers check
Date: Thu, 12 Oct 2023 13:46:10 +0200
Message-Id: <20231012114642.19040-25-benjamin.gaignard@collabora.com>
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

vb2 core tests this already so remove it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Sergey Kozlov <serjk@netup.ru>
CC: Abylay Ospan <aospan@netup.ru>
---
 drivers/media/pci/netup_unidvb/netup_unidvb_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
index d85bfbb77a25..52de9b0af812 100644
--- a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
+++ b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
@@ -297,11 +297,9 @@ static int netup_unidvb_queue_setup(struct vb2_queue *vq,
 	dev_dbg(&dma->ndev->pci_dev->dev, "%s()\n", __func__);
 
 	*nplanes = 1;
-	if (vq->num_buffers + *nbuffers < VIDEO_MAX_FRAME)
-		*nbuffers = VIDEO_MAX_FRAME - vq->num_buffers;
 	sizes[0] = PAGE_ALIGN(NETUP_DMA_PACKETS_COUNT * 188);
 	dev_dbg(&dma->ndev->pci_dev->dev, "%s() nbuffers=%d sizes[0]=%d\n",
-		__func__, *nbuffers, sizes[0]);
+		__func__, vb2_get_num_buffers(vq), sizes[0]);
 	return 0;
 }
 
-- 
2.39.2

