Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8241225B3
	for <linux-staging@lists.linux.dev>; Thu, 19 Oct 2023 12:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IGQZ0uEQ"
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:ccea:1fb5:34eb:239b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E7F206607334;
	Thu, 19 Oct 2023 13:52:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697719970;
	bh=I24/t0ZqSyeKvdZtsSJpVc7QnzmONAbV5k9WYLKmpuU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IGQZ0uEQO3rs1XmURBUPRvA8nKSH1kdVUbI7Fn1LiGDupmgB1HYcYEpwrmhpvYHO8
	 UIbFbDr6MvkbhsNvpvqjGhOcA5paO6TVc+tnHjMOX9OrdO1YmIM9d/5IMPznEVYRjL
	 4fy+dBFLlCXNtARymxvhg0+cZgraUgyoqB/Vkt1x2/hIGLRPGgsnmFoYnMxdZCF1/l
	 3w4CVUQlSbAGjjANefzNmGWuPDPFeU4E7R/8EEt5RF3PLZv//XVI66Xdrm95YIdMNu
	 RQiY97kfN+9ZvGU0sGWQkyBp8csYadlaECbKqyJjlLo8efmLH8335ICvO8i4o2d9nX
	 l6DWtTUE2Pxwg==
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
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v13 37/56] media: renesas: Stop direct calls to queue num_buffers field
Date: Thu, 19 Oct 2023 14:52:03 +0200
Message-Id: <20231019125222.21370-38-benjamin.gaignard@collabora.com>
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
CC: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 drivers/media/platform/renesas/rcar_drif.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
index 292c5bf9e50c..f21d05054341 100644
--- a/drivers/media/platform/renesas/rcar_drif.c
+++ b/drivers/media/platform/renesas/rcar_drif.c
@@ -424,10 +424,11 @@ static int rcar_drif_queue_setup(struct vb2_queue *vq,
 			unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct rcar_drif_sdr *sdr = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 
 	/* Need at least 16 buffers */
-	if (vq->num_buffers + *num_buffers < 16)
-		*num_buffers = 16 - vq->num_buffers;
+	if (q_num_bufs + *num_buffers < 16)
+		*num_buffers = 16 - q_num_bufs;
 
 	*num_planes = 1;
 	sizes[0] = PAGE_ALIGN(sdr->fmt->buffersize);
-- 
2.39.2

