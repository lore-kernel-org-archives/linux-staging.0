Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795106089;
	b=tpQNHaq5M+xJOLa0eFioGhtzlKUi7N8KoCmQObBzimCR5IsKQChrBsymWbd/HQ8d0+HD
	 DP3TCF/4qvQBGv5SNhtpfPJEyMxNme2pTbk42MA7dV3kO1DOoY5edqY2LKASA65AdO/gT
	 Wt09GqKkTrdVQkXmgh/zWb+5u7Qr5JtLHNKa5MDO+ycZ6ZfVwonScgFk/3PZXWcl4n1Ny
	 mQ51KcyKz59ci2h+MzZeZmS3LKrZKQoLrwvnYu7UEXxxs+DV4gCR+OaXUArE8+CKsnpBh
	 +Vg8/G7kQlfL3ll21ChrcPsLTayMaMLOZxPdM3b3Ow7KRZZBEHHykc7qfgfBvgSeAWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106089;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TaoNleEXGo6xiBeA10auiejfA5+WdvUEBOEnJYwo0bA=;
	b=mElvCjBWZbVewUeB2sl1LMH0PSrubte0YcMoCfu5UPTa0s48zKxBzZt/22niHZRoi5u6
	 2X8v0A1ubOLKY/Lok34kDd45KuF0vQ1DNPChs/FSsvJW0GCqXNefQ/n4Lxs4FMkKGM3NN
	 9ChyzjiPhyFe5w0eYWRh+Ao0ES+wzFQQhbs9u1pYdzLbEk7cT6YoWCQvPqlscfPw6qJrn
	 nPi6h69n9bhEq4RuEN43O58ebN9TQdMNpx5F2HGlgua6OPoH1S2s+rVHGrq5HbwCh+/mE
	 q28fk0fiIbKo00MhofOY+BYRoS2L8dyom734OUyWqMLu6rPwjOhfDiPIh6CuszTZNdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GKDLrQKe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAE4606A336;
	Thu, 19 Nov 2026 16:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GKDLrQKe
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795106088;
	b=SZw+JHV8nZe69Ln3WOZ+eMwEzBO9+/UMt9nZ9AOvxYdrsdCKjeAjrw/FxQtD2OkJTK8F
	 OW8gu/oQRjyg+FObI/4qrWidpyRO4la9akixH6SU7vh0TDdcQVxrvgKVD13m+rX8lqNY7
	 njFR+p3p+G7dRiCLXxPXub1Frl6IxrVZ0nOte8tWtZSIcPHlYU+w3HRqWjwdIjQ2im1xD
	 gJp0wIu3D9/YHQjx06/VOyVk8jWyeJkwjD4FDHNl3rV78e2kFjtlJAkqee5djOcrJrQNR
	 b/PIn9xF2okpi4DZJ03QgrKS/0eIdLQA5SxH+W4c8oWblRyck2ShqWhEpUtkT4jolEA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795106088;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TaoNleEXGo6xiBeA10auiejfA5+WdvUEBOEnJYwo0bA=;
	b=iDUrt/PooCOMi5LzeCkro1PhLhCvWyF/k3PVzHV/ddWcHeQsanpe27bHQi2ZIlCRahQ5
	 v1+lygyvPDMH6nM8DZyIgfFFsrBpJqbh8uvGoLwlSgvRBu4K87cEmynIMlby3AHnQae8R
	 JT0a5VdSQ6d1ZLqaAoreg0ssrO4ql+eCN71RvqWRKtOSCYip6sK6HtGbL9a+jVdg3DXS9
	 KjUz9NCOblkG7d3NiYkde+orQVl3xq7pYcwm44v2Ce9F04Y7nKuZO/lOWm7BEWlv2R6Vl
	 tK/t5GlDhD1JEfzcXTmwplzksK82EM/9vyDOqFjrgFHtzdA81uaW5bO7D7ZWZvPK7BQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CEDE91F000C6;
	Thu, 19 Nov 2026 16:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795106088;
	bh=TaoNleEXGo6xiBeA10auiejfA5+WdvUEBOEnJYwo0bA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GKDLrQKeoUs2pL9ZWUdejcIvVzAMVAbwgRZJNrecBnF9l08ug5ahCbKg8Df/BCkIH
	 GZe1ZjnzOSGp52qlxUNLNQfrI8FYAvzfSDdQo8xFqIF5hK5nO7oe3bV6A/eFnxUZSl
	 l1bPtcPJ9sO5p5TcH5hSwUYHEhSxbykWgEXC+/qBjuP6XqbC/MQrfZQ5nrMYXWtb3f
	 nAWPh8OMUmPU8LTn4GNsFQWVBAYnDjYlnDS31IBVUyaNgaRfnTpEVMpbMwOzSqDr8i
	 t0vriXInakWmClNCiizCQ804PizW4GV9bsw651Q7lEiMTnkFsLz9oebGVAaM4tSzet
	 /iJy1Ay5KzCiA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 504654B336;
	Thu, 19 Nov 2026 16:34:47 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 16:34:47 +0000
Subject: [PATCH 1/2] media: cedrus: fail buffer allocations that do not fit
 with -ENOMEM
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-b4-cedrus-generic-fixes-v1-1-f9f50812c85b@gmail.com>
References: <20261119-b4-cedrus-generic-fixes-v1-0-f9f50812c85b@gmail.com>
In-Reply-To: <20261119-b4-cedrus-generic-fixes-v1-0-f9f50812c85b@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795106086; l=1226;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=hXtCMT/F7gvoSbtMOmEiwBTiT/kPdUTePkmZB9JuFUw=;
 b=fEDYH/5HHKubMaENR7u9rph7nZG63AHPy5b8HSHLPNedtjbePrQRi2t02aSp4EGbBxLMAOYJV
 gLjsIxuv7HIC9eP9/IQHJtmPMyw2WzkR6/iQUVdPhdcwVcQA8unkQqG
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

vb2-dma-contig allocates with GFP_KERNEL, so a buffer pool that does
not fit in memory invokes the OOM killer. Set __GFP_RETRY_MAYFAIL on
both queues: the request returns fewer buffers or -ENOMEM instead.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_video.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index ad4ec3490775..9b2d24e77fdb 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -602,6 +602,7 @@ int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
 	src_vq->dev = ctx->dev->dev;
 	src_vq->supports_requests = true;
 	src_vq->requires_requests = true;
+	src_vq->gfp_flags = __GFP_RETRY_MAYFAIL;
 
 	ret = vb2_queue_init(src_vq);
 	if (ret)
@@ -616,6 +617,7 @@ int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->lock = &ctx->dev->dev_mutex;
 	dst_vq->dev = ctx->dev->dev;
+	dst_vq->gfp_flags = __GFP_RETRY_MAYFAIL;
 
 	return vb2_queue_init(dst_vq);
 }

-- 
2.55.0


