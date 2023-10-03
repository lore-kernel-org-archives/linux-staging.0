Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AE6D52A
	for <linux-staging@lists.linux.dev>; Tue,  3 Oct 2023 08:07:28 +0000 (UTC)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:b6df:b784:6a0f:8451])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DFD2F660735E;
	Tue,  3 Oct 2023 09:07:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696320447;
	bh=ZWZu+iiWZeSR97TuxWAcPyCT2zWmqcsNlEZTasx6lQc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TM877k3dbdv5cZ3/+fzoBT0lguta5bDqCV9H8tQ8PNrG5rqShpGoZHosFKCqo+gR2
	 aNnRhEh910+mZEG615eL480UAWFDxh5mBICdi8AV1G2/xg53Q2C7SWF+7SmWfip1Mk
	 3q12j79ajrgx/XNulaWFbSKsJlmeAs34SBtQ7Rbz8u6zY48K68sA2uNRgIDumytrUa
	 vnN34JOqeZOMSddzFZGcz9Oiw3GCGautxBvRG3pHJoUiegtBBD/DDk1ds/db79eaMP
	 tF2MEa9LEcz3+IHiIXmLh++xqfhOqDLuGe9J63hN1PKcD6HAL8CG9SJd15m7vc4rRb
	 zFQtQW7z+30Zg==
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
Subject: [PATCH v10 27/54] media: pci: netup_unidvb: Remove useless number of buffers check
Date: Tue,  3 Oct 2023 10:06:36 +0200
Message-Id: <20231003080704.43911-28-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
References: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vb2 core tests this already so remove it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
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

