Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D960448E98
	for <linux-staging@lists.linux.dev>; Wed, 27 Sep 2023 15:36:29 +0000 (UTC)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:672:46bd:3ec7:6cdf])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 216D06607374;
	Wed, 27 Sep 2023 16:36:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695828988;
	bh=g+cKvL+57Ge4BbEO/J6pfXbFnIiiN4vCjyxapf5D6Zg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GEZjpG3Mg1O+df6BIyrjZlfYVzJjl0vG5IseZ0ajGJrFj1XsxYL2itb+mcQdbdJjb
	 EAnC1dqe9bSt5Y/6S2HwdRpXo6Ceou0sdZVBVNMXX8s+xyLXtyG1zMZRj4n9ywLv1F
	 vpFzzXPLEz1mCavsBHcMCkpFf8fXFHXd1u3a74raRo2Dc6nYBUV34Hdep5cqj1acnj
	 gCIInYq7h6BlpMNoZ7RZWk7iRMhSsbZ04PiCI2LDUb3lOtMIfH1z/+oCZZPUgc/mKJ
	 1J5z2pldHY07c1rhRZ7Y5tAcC/ce+bFhVZCsadw52brVQBxb9B/ywVKmWrh0qnhhY1
	 RnevAiUJVYvgg==
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
Subject: [PATCH v8 42/53] media: atomisp: Stop direct calls to queue num_buffers field
Date: Wed, 27 Sep 2023 17:35:47 +0200
Message-Id: <20230927153558.159278-43-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927153558.159278-1-benjamin.gaignard@collabora.com>
References: <20230927153558.159278-1-benjamin.gaignard@collabora.com>
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

