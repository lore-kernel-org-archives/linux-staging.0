Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6F4224DA
	for <linux-staging@lists.linux.dev>; Thu, 14 Sep 2023 13:33:54 +0000 (UTC)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8C248660735A;
	Thu, 14 Sep 2023 14:33:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694698433;
	bh=g+cKvL+57Ge4BbEO/J6pfXbFnIiiN4vCjyxapf5D6Zg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BF/oWSSzruSq2mPoOs3pLdafwHgIDEVGPUJAogmZ2Pn3jq91kpmFLkc/leTdV6CLe
	 o0YQeVWi8i3MmUFknNMB/4F09BncPnnh+uzR2+i7peezooDR61j9s1VYvwzoQmsAoU
	 4HxpCDwVjGIhhTt2lygHGUfa8XRvnbGokkOk8XddVXNmqYNJp7UOrLHCIbejmme0Dz
	 15oxHz7rGTwk65MLth9ocO39WL1t2xF1Cxpj3vnZO6kCAd0aCYIysAtSyfbEaGG0ii
	 2WkUXpAmARnf3OGLeiiQSXI5rlMTkSqDxy4WXS0kmH1PwX6wTgTAEB+QQZqEH1wEOe
	 txQgTb8VXbQ6w==
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
Subject: [PATCH v7 41/49] media: atomisp: Stop direct calls to queue num_buffers field
Date: Thu, 14 Sep 2023 15:33:15 +0200
Message-Id: <20230914133323.198857-42-benjamin.gaignard@collabora.com>
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
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 4b65c69fa60d..48f9745421a9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1030,7 +1030,7 @@ static int atomisp_qbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
 
-	if (buf->index >= vdev->queue->num_buffers)
+	if (buf->index >= vb2_get_num_buffers(vdev->queue))
 		return -EINVAL;
 
 	if (buf->reserved2 & ATOMISP_BUFFER_HAS_PER_FRAME_SETTING) {
-- 
2.39.2

