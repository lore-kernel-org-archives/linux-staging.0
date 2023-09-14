Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B6421A10
	for <linux-staging@lists.linux.dev>; Thu, 14 Sep 2023 13:33:52 +0000 (UTC)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 04702660737C;
	Thu, 14 Sep 2023 14:33:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694698431;
	bh=B011NIBIJAGyFwZSTyw+k80RuXUocSH7ODG0b+1sZBU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CGtACEWkKQesYSAvkU0BWg6izVBOghL10PsjDrmnT4bDx02gde3v5hddxApJoyq32
	 7G8nHpvClGZ+VNVUN9eVKGJo6xFkU88LpJI4XEcXXLTc3rKb5zhZQQtbZNb0UcMwax
	 X7VrZFyfglSFeKhixLrtjSQJT7ECGOiY/dyjfjkWPf568Jq67boXyCCvGbx3lbMRt8
	 8YN2yTLj2AmwOiPi9Yp1KqRPoXfFZDeB2yPxMuHFioVcrml+Sgx4XPCtaHe0Vgpf/z
	 Ut3l7gKG7BiA6mArC8WFrgjNaW5cvOpnxhJPcHYYNYeGsE7Ve4tDHgQRyOktWeGIjW
	 skYKe4axRbNFA==
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
Subject: [PATCH v7 38/49] media: usb: cx231xx: Stop direct calls to queue num_buffers field
Date: Thu, 14 Sep 2023 15:33:12 +0200
Message-Id: <20230914133323.198857-39-benjamin.gaignard@collabora.com>
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
 drivers/media/usb/cx231xx/cx231xx-417.c   | 5 +++--
 drivers/media/usb/cx231xx/cx231xx-video.c | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
index c5e21785fafe..9ec0b7e355e2 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -1218,13 +1218,14 @@ static int queue_setup(struct vb2_queue *vq,
 		       unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct cx231xx *dev = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 	unsigned int size = mpeglinesize * mpeglines;
 
 	dev->ts1.ts_packet_size  = mpeglinesize;
 	dev->ts1.ts_packet_count = mpeglines;
 
-	if (vq->num_buffers + *nbuffers < CX231XX_MIN_BUF)
-		*nbuffers = CX231XX_MIN_BUF - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < CX231XX_MIN_BUF)
+		*nbuffers = CX231XX_MIN_BUF - q_num_bufs;
 
 	if (*nplanes)
 		return sizes[0] < size ? -EINVAL : 0;
diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index e23b8ccd79d4..c8eb4222319d 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -714,11 +714,12 @@ static int queue_setup(struct vb2_queue *vq,
 		       unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct cx231xx *dev = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 
 	dev->size = (dev->width * dev->height * dev->format->depth + 7) >> 3;
 
-	if (vq->num_buffers + *nbuffers < CX231XX_MIN_BUF)
-		*nbuffers = CX231XX_MIN_BUF - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < CX231XX_MIN_BUF)
+		*nbuffers = CX231XX_MIN_BUF - q_num_bufs;
 
 	if (*nplanes)
 		return sizes[0] < dev->size ? -EINVAL : 0;
-- 
2.39.2

