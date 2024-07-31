Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36221BC09E;
	Wed, 31 Jul 2024 16:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722444321; cv=none; b=SGClbwK2VuGPrMuS7u588ndZax0+eYpj1CcF1bDnucinObq4lQrPZ4j8n4WFGkI2cEmZX/iqdSX+Qdl1x3kwGEksxdZ4tyDlGRkU+1QULf8KcwKNvCit1Sn1uelgKo1UstGs9OA6UtRfG5KzkuCWZ1l6kSNRez/XS/SI2XAtlEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722444321; c=relaxed/simple;
	bh=h8eh7VYeDujcBIAS3vBOyPxLeyfsyYT2kvXLLn/W5TU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LcBOvOQLsEuPm6hvuekFgyY5oghLc+JVmdvaondC//4wKMj5gm7Mqvat4kzseyECoJ+mjoarlBtSWubz/12lHALU+ipEibg2hRifiUMZ0LPjffTLMz1vl3LZLIMH3b4Mfgi8yfwR5JwJ6PQWMSB+SPqjO6x4J1UvM4syVuHPkRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 1950F14649E0; Wed, 31 Jul 2024 18:44:29 +0200 (CEST)
From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To: linux-sunxi@lists.linux.dev
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] media: cedrus: Don't require requests for all codecs
Date: Wed, 31 Jul 2024 18:44:14 +0200
Message-ID: <20240731164422.206503-5-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240731164422.206503-1-linkmauve@linkmauve.fr>
References: <20240731164422.206503-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

JPEG decoding doesn’t need it currently.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index 7205c2315bc5..30821d81d0db 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -599,7 +599,7 @@ int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
 	src_vq->lock = &ctx->dev->dev_mutex;
 	src_vq->dev = ctx->dev->dev;
 	src_vq->supports_requests = true;
-	src_vq->requires_requests = true;
+	src_vq->requires_requests = false;
 
 	ret = vb2_queue_init(src_vq);
 	if (ret)
-- 
2.45.2

