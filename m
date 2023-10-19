Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8264225C6
	for <linux-staging@lists.linux.dev>; Thu, 19 Oct 2023 12:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mPTQB3Cn"
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:ccea:1fb5:34eb:239b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 95CE16607332;
	Thu, 19 Oct 2023 13:52:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697719963;
	bh=uLexcsAscd7+q7L/zlCLSkE5WS81tRYkOSdorkQDUyM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mPTQB3CnNDCl4Omkm2Av5e9XNa/KizUCbBDp3gDOA194OoGaFXlsLJ58YfE36qbgb
	 PFWHp7DTE6e6t6hVqFzrqHG1IycsCitCECtpXA8zderS7bkl5lKSsoOb42MYyajE/R
	 Cz1WCryShqoyMWKY6nk/NNqJQ/RTRsseYoPjFUbLG/XZ43qARXxibtRr79bJV8fD0N
	 eIaW8JnYFlPKmc/RintxidgFHGVMY7Ocwng0AMo+DJSehY+w0e9a3cGGPI+T6NKrlV
	 q8OouEZcwXbgv1cl3iV4/g/VEoOqcYGv8mcZEHcKk2P4IGOwZZVyvgEc7puMyKlefL
	 9ZPupyYvGaAlw==
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
	Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>
Subject: [PATCH v13 23/56] media: pci: cx18: Stop direct calls to queue num_buffers field
Date: Thu, 19 Oct 2023 14:51:49 +0200
Message-Id: <20231019125222.21370-24-benjamin.gaignard@collabora.com>
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
CC: Sergey Kozlov <serjk@netup.ru>
CC: Abylay Ospan <aospan@netup.ru>
---
 drivers/media/pci/cx18/cx18-streams.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-streams.c b/drivers/media/pci/cx18/cx18-streams.c
index 597472754c4c..cfbc4a907802 100644
--- a/drivers/media/pci/cx18/cx18-streams.c
+++ b/drivers/media/pci/cx18/cx18-streams.c
@@ -104,6 +104,7 @@ static int cx18_queue_setup(struct vb2_queue *vq,
 			    unsigned int *nbuffers, unsigned int *nplanes,
 			    unsigned int sizes[], struct device *alloc_devs[])
 {
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 	struct cx18_stream *s = vb2_get_drv_priv(vq);
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

