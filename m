Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D60225B3
	for <linux-staging@lists.linux.dev>; Thu, 19 Oct 2023 12:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TlSKxAPk"
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:ccea:1fb5:34eb:239b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5B7276607356;
	Thu, 19 Oct 2023 13:52:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697719959;
	bh=hEdAN5aNNO1/pDSIenHgJGapeD5q9IeR/wL5fN5tnvk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TlSKxAPko5PHW8AQZyZLF37lazQijX8qrL4wdv7yqcG7ETlAjebi5pc+JZbLY+e87
	 Qns5e3CLsUj02JYPqhjkXlDdq0LAy9uBYEZ+dVvuJHiNHeB3IhpuIwsaT+HsbeqrTs
	 4qNobax9zLgLJOLsCn/LJ0Nj1kPp4aDW7+jSfFjeBu+AM4+1d5/psD6lwGNqODZzfB
	 3Db2r5LZqrXo2SKJklOxwTFt+HWLQeyzo2pAHdq0wEgOrjKsmyyL7qFw4+dKBfpdYF
	 T5BJoEGX16baEzZmQ+mSAI5a91osD/6o6JbG2bgwhBhYF7WTMlEJZ6iSr/2WK/A+aU
	 2qLRpoXkERITA==
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
	Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v13 17/56] media: atomisp: Stop direct calls to queue num_buffers field
Date: Thu, 19 Oct 2023 14:51:43 +0200
Message-Id: <20231019125222.21370-18-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
References: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
This allows us to change how the number of buffers is computed in the
future.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index a8a964b2f1a8..09c0091b920f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1028,7 +1028,7 @@ static int atomisp_qbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
 
-	if (buf->index >= vdev->queue->num_buffers)
+	if (buf->index >= vb2_get_num_buffers(vdev->queue))
 		return -EINVAL;
 
 	if (buf->reserved2 & ATOMISP_BUFFER_HAS_PER_FRAME_SETTING) {
-- 
2.39.2

