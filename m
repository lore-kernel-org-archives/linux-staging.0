Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180C33E3DB6;
	Mon, 18 May 2026 10:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100170; cv=none; b=HehU5WVnNzKGegWVxDzjKAbLE1QeP8QlYqS2D6n2fu1moyYb2JnGhHPK0JeYygdl84RGBlf6gVYYM8ubIMhP/jO1neZ6VUwYKiUvI26kIjDZfC+2GQbK+d/7mm3XWOa3BLHr1hLDBMUGyXxttmQk9+DKEDU97H6J/GevMOLtOiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100170; c=relaxed/simple;
	bh=eCvQTJjp2h8EORPuvx4oGznSj4EQT6vruXMeoKz4qjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vku/tBNztq5+3Si1Aj3BIl90oSOLzko8iUJRFNQsTijMs8dDuKDs+NKPuUmqHnRzd5UaE3gtmA/Z5czcV/lakTycurks54tgyjaHENx7pvnn7Lxz+a8icHE+II4LbnY9vwCBfbQETIi+lHkquszyyKcGpMhndRdkKhjZBntDzLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id E84571F80044;
	Mon, 18 May 2026 10:29:18 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 757EFB40818; Mon, 18 May 2026 10:29:18 +0000 (UTC)
X-Spam-Level: *
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id A0656B407F5;
	Mon, 18 May 2026 10:24:55 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arash Golgol <arash.golgol@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 08/16] media: v4l2-common: Add NV12_32L32 pixel format to v4l2 format info
Date: Mon, 18 May 2026 12:24:43 +0200
Message-ID: <20260518102451.417971-9-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518102451.417971-1-paulk@sys-base.io>
References: <20260518102451.417971-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Represent the NV12_32L32 pixel format in the v4l2 format info table.
This is a 32x32 tiled version of NV12.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/media/v4l2-core/v4l2-common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 6194d6eb9c56..fe7141883ec5 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -315,6 +315,8 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		  .block_w = { 4, 4, 0, 0 }, .block_h = { 4, 4, 0, 0 }},
 		{ .format = V4L2_PIX_FMT_NV12_16L16,	.pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2,
 		  .block_w = { 16, 16, 0, 0 }, .block_h = { 16, 16, 0, 0 }},
+		{ .format = V4L2_PIX_FMT_NV12_32L32,	.pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2,
+		  .block_w = { 32, 32, 0, 0 }, .block_h = { 32, 32, 0, 0 }},
 
 		/* YUV planar formats, non contiguous variant */
 		{ .format = V4L2_PIX_FMT_YUV420M, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
-- 
2.54.0

