Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3303DBB1
	for <linux-staging@lists.linux.dev>; Mon, 27 Nov 2023 16:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="J82+hXDN"
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 14A19660738D;
	Mon, 27 Nov 2023 16:55:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104138;
	bh=HM7bQJTrYq0xI931RRj+exZg69MbeR6CU1nWD8Ux+n0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J82+hXDNdOP+SagJpnZv37YHnFlwnFOlaRqILeWuFtj4UTpODQiiCXLoHRJMpFxxE
	 TQseQi+Fb8JdftmA3rnrIRSHvbwN7H4s47izIb49/vo5u8p51C9EHhCVbhtUbzDsxY
	 y886IwJB4KRf5I0fMIDCogDzSogPOEgvGPOycf7QjzGSncgxT6R0fWOOQwVGh26nHf
	 eU2d6+t+2Ju5ICKEsFFgqUm2V8J4Afke1g+PCCHrXBYDRtgzpRfQPvZpFqgUgt1QG3
	 9B1+YAIEWU+WDdP3tRlFpWO6IEjzk/9xBChtGcNV+hAqKsQl63YCRhugv/z50+YPAG
	 ZVqNQ3e/37VTQ==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	matt.ranostay@konsulko.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH 42/55] media: pci: dt3155: Use min_dma_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:41 +0100
Message-Id: <20231127165454.166373-43-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
References: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dt3155 driver use a dma engine and needs a minimum number of
buffers to be present before start streaming.
That is 'min_dma_buffers_needed' purpose so use it instead
of 'min_buffers_needed' field.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/pci/dt3155/dt3155.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/dt3155/dt3155.c b/drivers/media/pci/dt3155/dt3155.c
index d09cde2f6ee4..43b44af1e9ca 100644
--- a/drivers/media/pci/dt3155/dt3155.c
+++ b/drivers/media/pci/dt3155/dt3155.c
@@ -517,7 +517,7 @@ static int dt3155_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	pd->vidq.ops = &q_ops;
 	pd->vidq.mem_ops = &vb2_dma_contig_memops;
 	pd->vidq.drv_priv = pd;
-	pd->vidq.min_buffers_needed = 2;
+	pd->vidq.min_dma_buffers_needed = 2;
 	pd->vidq.gfp_flags = GFP_DMA32;
 	pd->vidq.lock = &pd->mux; /* for locking v4l2_file_operations */
 	pd->vidq.dev = &pdev->dev;
-- 
2.39.2

