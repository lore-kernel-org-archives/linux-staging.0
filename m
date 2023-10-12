Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56ABF24A0D
	for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 11:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mN6W36Wo"
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7ae7:b86d:c19a:877e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 86A5C660738F;
	Thu, 12 Oct 2023 12:47:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697111228;
	bh=nwepyznt8z6pxABzkpFHR6clGV59kYVToyX8aj6cN+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mN6W36WoEkjWrR30vYtboERgKPchBJyh+WD7O8aVg2uy/HCHqIyoh+sOf2TbXXvxV
	 EoBPi2859Pjn0XZK9IZE6QhBmT6jiRnpsfUnPPEFuZrrwpVXGAotRvmcfW1Gc9SXVJ
	 oBrU9XziAdJLDsG7AcE2xpmi41nBeHIRxm7r8rbbJTNImrGhs/nzsmO+I7u1j9Mr5r
	 xj7zcs6k2KrOy1FC0ikpSWXrKnr7+VX2VYmOYxYiHzy2W5/zZNj5C6khlQ2sqz/2Sz
	 CH1LKyFEVs64Q4oIxigN+qxllG2HtV+qwIeuB4Nm+zguIX8HEgUfe9QL1CHa4tWbE1
	 ew0PRHfGaxX0w==
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
Subject: [PATCH v11 36/56] media: usb: usbtv: Set min_buffers_needed to 2
Date: Thu, 12 Oct 2023 13:46:22 +0200
Message-Id: <20231012114642.19040-37-benjamin.gaignard@collabora.com>
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
min_buffers_needed to 2 and remove the useless check in
usbtv_queue_setup().

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/usb/usbtv/usbtv-video.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/usbtv/usbtv-video.c b/drivers/media/usb/usbtv/usbtv-video.c
index 1e30e05953dc..0e9e860be47f 100644
--- a/drivers/media/usb/usbtv/usbtv-video.c
+++ b/drivers/media/usb/usbtv/usbtv-video.c
@@ -727,8 +727,6 @@ static int usbtv_queue_setup(struct vb2_queue *vq,
 	struct usbtv *usbtv = vb2_get_drv_priv(vq);
 	unsigned size = USBTV_CHUNK * usbtv->n_chunks * 2 * sizeof(u32);
 
-	if (vq->num_buffers + *nbuffers < 2)
-		*nbuffers = 2 - vq->num_buffers;
 	if (*nplanes)
 		return sizes[0] < size ? -EINVAL : 0;
 	*nplanes = 1;
@@ -892,6 +890,7 @@ int usbtv_video_init(struct usbtv *usbtv)
 	/* videobuf2 structure */
 	usbtv->vb2q.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	usbtv->vb2q.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ;
+	usbtv->vb2q.min_buffers_needed = 2;
 	usbtv->vb2q.drv_priv = usbtv;
 	usbtv->vb2q.buf_struct_size = sizeof(struct usbtv_buf);
 	usbtv->vb2q.ops = &usbtv_vb2_ops;
-- 
2.39.2

