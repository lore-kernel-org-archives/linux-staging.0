Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0DEBA56
	for <linux-staging@lists.linux.dev>; Fri,  1 Sep 2023 12:44:28 +0000 (UTC)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:4d01:31d2:de6b:d217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1F85866072B7;
	Fri,  1 Sep 2023 13:44:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693572267;
	bh=swS7yYiqBxggjIra2XX2pXDY4PPq3f683TK0rKa6DhQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XCA1Oaz5DjS6kBeRp5mhjD9JZ5zaUevWlkLivlCVo4hTv4mvRw4HQM46Ph0vN14jo
	 5LFBuHbl0vvg+WoFcs1iKwpdywnKoBTWrVsM5uFZtMfuypN9FduTJBKSnfQM5cxkTe
	 4mwQcJW95/ZIM/qP5NLqCQsej+xEfc/9P8v8cJ41Hlm0HH9HIWXDm67rfknoIC3cq/
	 8NzkJDiEj/jbTm5xxsOTyC9+UL1VejMyMLW67z76QUjT09zFdUGJmL2Q22xp0Z+trj
	 6PFgD1gcCyUvFyo3tg+Niy27rcZBvQdRdoDSUhZuTBEI9cD5yMsSEHJKyg1S2nmVpg
	 VDGga3RSJ+qIQ==
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
Subject: [PATCH v6 04/18] media: amphion: Use vb2_get_buffer() instead of directly access to buffers array
Date: Fri,  1 Sep 2023 14:44:00 +0200
Message-Id: <20230901124414.48497-5-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230901124414.48497-1-benjamin.gaignard@collabora.com>
References: <20230901124414.48497-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use vb2_get_buffer() instead of directly access to vb2_buffer buffer array.
This could allow to change the type bufs[] field of vb2_buffer structure if
needed.
After each call to vb2_get_buffer() we need to be sure that we get
a valid pointer so check the return value of all of them.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/amphion/vpu_dbg.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_dbg.c b/drivers/media/platform/amphion/vpu_dbg.c
index 982c2c777484..a462d6fe4ea9 100644
--- a/drivers/media/platform/amphion/vpu_dbg.c
+++ b/drivers/media/platform/amphion/vpu_dbg.c
@@ -140,11 +140,18 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
 
 	vq = v4l2_m2m_get_src_vq(inst->fh.m2m_ctx);
 	for (i = 0; i < vq->num_buffers; i++) {
-		struct vb2_buffer *vb = vq->bufs[i];
-		struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+		struct vb2_buffer *vb;
+		struct vb2_v4l2_buffer *vbuf;
+
+		vb = vb2_get_buffer(vq, i);
+		if (!vb)
+			continue;
 
 		if (vb->state == VB2_BUF_STATE_DEQUEUED)
 			continue;
+
+		vbuf = to_vb2_v4l2_buffer(vb);
+
 		num = scnprintf(str, sizeof(str),
 				"output [%2d] state = %10s, %8s\n",
 				i, vb2_stat_name[vb->state],
@@ -155,11 +162,18 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
 
 	vq = v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx);
 	for (i = 0; i < vq->num_buffers; i++) {
-		struct vb2_buffer *vb = vq->bufs[i];
-		struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+		struct vb2_buffer *vb;
+		struct vb2_v4l2_buffer *vbuf;
+
+		vb = vb2_get_buffer(vq, i);
+		if (!vb)
+			continue;
 
 		if (vb->state == VB2_BUF_STATE_DEQUEUED)
 			continue;
+
+		vbuf = to_vb2_v4l2_buffer(vb);
+
 		num = scnprintf(str, sizeof(str),
 				"capture[%2d] state = %10s, %8s\n",
 				i, vb2_stat_name[vb->state],
-- 
2.39.2

