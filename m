Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A444221A14
	for <linux-staging@lists.linux.dev>; Thu, 14 Sep 2023 13:33:46 +0000 (UTC)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2BA32660734E;
	Thu, 14 Sep 2023 14:33:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694698423;
	bh=336tMZ/RUJb+ZhMa2C9VNJt3Yyz+CPMiBOLJjWSuFw8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BRJKAYVXwhZNav2giBo3pXHUXbWZNnNn/esMnZZ2OStWYOMBWFldVyUj23jt/lmcx
	 e5OD6YiVeO6dogFLYdEpRVfL68cYZxjBf4UunxHYT6Z5OMFEi40sl/LW8uJfsn4pQa
	 9i9CW0zfd+Gmr263fTeoi8z1PNRz9Hcznee662yWyritIFcleHr60lxGjsQlLryRwv
	 SBrXXl7CjYX+FbLzW4/TIYhye/FRpmihwZDDAQIDEGvTa2IRfYFGDN7TiwordjsM3W
	 HuQJKfcJPxkLlrUjPVoaVLdP0l660gp2RixoKoKgPlK2y0i/dPy6kDQB3aoq0v2Vih
	 8+dDET6Tb9gug==
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
Subject: [PATCH v7 23/49] media: pci: cx18: Stop direct calls to queue num_buffers field
Date: Thu, 14 Sep 2023 15:32:57 +0200
Message-Id: <20230914133323.198857-24-benjamin.gaignard@collabora.com>
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
 drivers/media/pci/cx18/cx18-streams.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-streams.c b/drivers/media/pci/cx18/cx18-streams.c
index 597472754c4c..a7a7e006b3be 100644
--- a/drivers/media/pci/cx18/cx18-streams.c
+++ b/drivers/media/pci/cx18/cx18-streams.c
@@ -105,6 +105,7 @@ static int cx18_queue_setup(struct vb2_queue *vq,
 			    unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct cx18_stream *s = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 	struct cx18 *cx = s->cx;
 	unsigned int szimage;
 
@@ -121,8 +122,8 @@ static int cx18_queue_setup(struct vb2_queue *vq,
 	 * Let's request at least three buffers: two for the
 	 * DMA engine and one for userspace.
 	 */
-	if (vq->num_buffers + *nbuffers < 3)
-		*nbuffers = 3 - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < 3)
+		*nbuffers = 3 - q_num_bufs;
 
 	if (*nplanes) {
 		if (*nplanes != 1 || sizes[0] < szimage)
-- 
2.39.2

