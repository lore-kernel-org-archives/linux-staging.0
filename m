Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AE6DDA4
	for <linux-staging@lists.linux.dev>; Tue,  3 Oct 2023 08:07:23 +0000 (UTC)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:b6df:b784:6a0f:8451])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 24038660733F;
	Tue,  3 Oct 2023 09:07:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696320440;
	bh=MaJc8KF/Sr+P2A1rELzeazrdtI+Dtx39Ekc9mMARKkw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CtLRpn1N2WQGcS+FYDvKO+ZColUenPBEF/XKlYO4s+7vr7/MHs03eUvGXOC0VTI+o
	 WV/xfmez/HNWZbORXaV+0ipr7mjWFXqJSM7Z9KyGkE9nAAwCpRhKAWv0HgRYOejGcU
	 3VmvLad2+H1DLI2B07W+rl8YBJUuIvTQ3N/4kTlCFNSgzya1rmHsAMVYFv0kWPmRim
	 B2IMAydKbsHL/MeIOGPY8DEIKU4iJ1C7mCtvMTHGTLvjGFdakeEFaOsJd2DAs/1BBu
	 +GavRdNxgV7QVbeG0nkW86ZJUcaJTvLQcRhKAFOpiQEtha6zpCLHM3nf2hUZa9NvZg
	 g42XEkD8MNF1Q==
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
Subject: [PATCH v10 14/54] media: test-drivers: vivid: Increase max supported buffers for capture queues
Date: Tue,  3 Oct 2023 10:06:23 +0200
Message-Id: <20231003080704.43911-15-benjamin.gaignard@collabora.com>
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

Change the maximum number of buffers of some capture queues in order
to test max_num_buffers field.

Allow to allocate up to:
- 64 buffers for video capture queue.
- 1024 buffers for sdr capture queue.
- 32768 buffers for vbi capture queue.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/test-drivers/vivid/vivid-core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 394c9f81ea72..b5656330578d 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -876,6 +876,13 @@ static int vivid_create_queue(struct vivid_dev *dev,
 	q->type = buf_type;
 	q->io_modes = VB2_MMAP | VB2_DMABUF;
 	q->io_modes |= V4L2_TYPE_IS_OUTPUT(buf_type) ?  VB2_WRITE : VB2_READ;
+	if (buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		q->max_num_buffers = 64;
+	if (buf_type == V4L2_BUF_TYPE_SDR_CAPTURE)
+		q->max_num_buffers = 1024;
+	if (buf_type == V4L2_BUF_TYPE_VBI_CAPTURE)
+		q->max_num_buffers = 32768;
+
 	if (allocators[dev->inst] != 1)
 		q->io_modes |= VB2_USERPTR;
 	q->drv_priv = dev;
-- 
2.39.2

