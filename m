Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9694017744
	for <linux-staging@lists.linux.dev>; Mon,  2 Oct 2023 12:06:41 +0000 (UTC)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:9537:67ca:c85e:d0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4E233660731D;
	Mon,  2 Oct 2023 13:06:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696248398;
	bh=7OP/lnsbD5MzPZ4L/gceSmxIzda3Ng9eLtu0phjni7k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f88Lkm0oKTrBkVS+11PzY0oHDtH24yH2hRy+ovgFH1RcJt5BuaKf6dhZxZLVj0d1m
	 pEzDe/zH34BjfmNCWHk1Svyw2F0rYKTA0eC9K3BsAvthcKPWLO/lVfpBVpCabDtXy6
	 rlKYM4QI0x7Qk85CCDVH9q6BouBVguyNbu+VOFQ0yAyJ2trsFPY0DuP4fZshU3ycxI
	 RhqyY6MdSIb8qkbL9MDzvwRW4iTiRZJI26o6YziZ7lkHlbOiT8kT8pdOhQoP461h+l
	 cYL1AwoinjFwZCpMScAjefTMXBVzvZ/bJY7xQ0t36JVzRr+x6xGZSgr4yqr9FwgL5N
	 5Lpd1ZJ/O0xVA==
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
Subject: [PATCH v9 26/53] media: pci: dt3155: Remove useless check
Date: Mon,  2 Oct 2023 14:05:50 +0200
Message-Id: <20231002120617.119602-27-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
References: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

min_buffers_needed is already set to 2 so remove this useless
check.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/pci/dt3155/dt3155.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/pci/dt3155/dt3155.c b/drivers/media/pci/dt3155/dt3155.c
index 548156b199cc..d09cde2f6ee4 100644
--- a/drivers/media/pci/dt3155/dt3155.c
+++ b/drivers/media/pci/dt3155/dt3155.c
@@ -128,8 +128,6 @@ dt3155_queue_setup(struct vb2_queue *vq,
 	struct dt3155_priv *pd = vb2_get_drv_priv(vq);
 	unsigned size = pd->width * pd->height;
 
-	if (vq->num_buffers + *nbuffers < 2)
-		*nbuffers = 2 - vq->num_buffers;
 	if (*num_planes)
 		return sizes[0] < size ? -EINVAL : 0;
 	*num_planes = 1;
-- 
2.39.2

