Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C681B6D38;
	Thu, 19 Aug 2021 14:00:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: nicolas)
	with ESMTPSA id C0BC61F4429D
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: cedrus: Fix SUNXI tile size calculation
Date: Thu, 19 Aug 2021 10:00:09 -0400
Message-Id: <20210819140009.158156-1-nicolas.dufresne@collabora.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tiled formats requires full rows being allocated (even for Chroma
planes). When the number of Luma tiles is odd, we need to round up
to twice the tile width in order to roundup the number of Chroma
tiles.

This was notice with a crash running BA1_FT_C compliance test using
sunxi tiles using GStreamer. Cedrus driver would allocate 9 rows for
Luma, but only 4.5 rows for Chroma, causing userspace to crash.

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index 32c13ecb22d8..a8168ac2fbd0 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -135,7 +135,7 @@ void cedrus_prepare_format(struct v4l2_pix_format *pix_fmt)
 		sizeimage = bytesperline * height;
 
 		/* Chroma plane size. */
-		sizeimage += bytesperline * height / 2;
+		sizeimage += bytesperline * ALIGN(height, 64) / 2;
 
 		break;
 
-- 
2.31.1

