Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3085360
	for <linux-staging@lists.linux.dev>; Fri,  1 Aug 2025 08:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754037036; cv=none; b=kc6pxSwZZAZHXwbrmpjP2Rt6gbstgbueY3mS9LFYg3O/exFnP3kPQ1pkGmVbTr6h6GiSIqlanmsA7ve1ALK4vTBaokdrqldMdcIcz9LZqHmI84DYYdgA70g+NcuP7NIsYnCfuay74qxD2ovAMgTBAUGyJwjj6yAQXCkXBWf5i4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754037036; c=relaxed/simple;
	bh=pHwO2lQbomnHeulpznF5TDaTNdoAuuEEitIN2jfiTGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GVgEH0jwK+2tMw/KYgODAAaX6N3Hv4DlyBqSGyeU2L9c2drHBSnPddCHvWsntkUL6DCeRjb3xxAcr8T/QdB25t2FLZDzw7L53mRYNuh2Y7pkXOMm4GN2p3VTegdEQhkSi+j4JPPHsWQOErYFrauU0NXGmNNkTWOc5+BXD2RFNjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id D4C131F0004B
	for <linux-staging@lists.linux.dev>; Fri,  1 Aug 2025 08:22:09 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 2C7DCB00FC8; Fri,  1 Aug 2025 08:22:09 +0000 (UTC)
X-Spam-Level: *
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 71270B00FC9;
	Fri,  1 Aug 2025 08:21:51 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jack Zhu <jack.zhu@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH] media: starfive: camss: Use common dma-contig dma addr helper
Date: Fri,  1 Aug 2025 10:21:49 +0200
Message-ID: <20250801082149.591192-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vb2_plane_cookie helpers is not meant to be used directly by
drivers using the generic dma-contig allocator.

Use the common helper to retrieve the plane dma address instead.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/staging/media/starfive/camss/stf-video.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/starfive/camss/stf-video.c b/drivers/staging/media/starfive/camss/stf-video.c
index a0420eb6a0aa..b0b9b70b9641 100644
--- a/drivers/staging/media/starfive/camss/stf-video.c
+++ b/drivers/staging/media/starfive/camss/stf-video.c
@@ -167,10 +167,8 @@ static int video_buf_init(struct vb2_buffer *vb)
 	struct stfcamss_video *video = vb2_get_drv_priv(vb->vb2_queue);
 	struct stfcamss_buffer *buffer = to_stfcamss_buffer(vbuf);
 	const struct v4l2_pix_format *fmt = &video->active_fmt.fmt.pix;
-	dma_addr_t *paddr;
 
-	paddr = vb2_plane_cookie(vb, 0);
-	buffer->addr[0] = *paddr;
+	buffer->addr[0] = vb2_dma_contig_plane_dma_addr(vb, 0);
 
 	if (fmt->pixelformat == V4L2_PIX_FMT_NV12)
 		buffer->addr[1] =
-- 
2.50.1

