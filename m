Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6442F22;
	Thu, 18 Aug 2022 20:34:01 +0000 (UTC)
Received: from whitebuilder.lan (192-222-136-102.qc.cable.ebox.net [192.222.136.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 606AE6601BCA;
	Thu, 18 Aug 2022 21:33:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1660854839;
	bh=GgPaajQKLXv1616Hqx0PaERx4rlMxlMQza9pzPITvMk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JYDZhzavP0trr+jEEMho+vU+B85/kDtbonYhDioXoPlFOh/TXFSNbC08MUU+JTXQc
	 HSaIkIYCz6PG8Ab++c23BV+/fPUBLzM8FSyaxqBHSVBJRnvf/+QDfW3Y5zQza7TlvO
	 +3HPLFDWffWf5GTbgqED4lOZEfVTuSgVHUcVoVHBBlcYIqeR2jq/ky7b8W1X6SrFnY
	 oz6Fc087flGK0HZ0J2xWb1KjOd1N5XaR1mnAY4y9jFq+N7ylsDPIriVrZV4eCwwmtq
	 Dx71wDW//MViP5NhPmjnZ2qCcPrifKhCxa9vmOBcDSY+5X7FnLP5KGosaC+0r02iMC
	 qEeno4yLzr6Cg==
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: kernel@collabora.com,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	stable@vger.kernel.org,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] media: cedrus: Fix endless loop in cedrus_h265_skip_bits()
Date: Thu, 18 Aug 2022 16:33:08 -0400
Message-Id: <20220818203308.439043-4-nicolas.dufresne@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220818203308.439043-1-nicolas.dufresne@collabora.com>
References: <20220818203308.439043-1-nicolas.dufresne@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Osipenko <dmitry.osipenko@collabora.com>

The busy status bit may never de-assert if number of programmed skip
bits is incorrect, resulting in a kernel hang because the bit is polled
endlessly in the code. Fix it by adding timeout for the bit-polling.
This problem is reproducible by setting the data_bit_offset field of
the HEVC slice params to a wrong value by userspace.

Cc: stable@vger.kernel.org
Reported-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index f703c585d91c5..f0bc118021b0a 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -227,6 +227,7 @@ static void cedrus_h265_pred_weight_write(struct cedrus_dev *dev,
 static void cedrus_h265_skip_bits(struct cedrus_dev *dev, int num)
 {
 	int count = 0;
+	u32 reg;
 
 	while (count < num) {
 		int tmp = min(num - count, 32);
@@ -234,8 +235,9 @@ static void cedrus_h265_skip_bits(struct cedrus_dev *dev, int num)
 		cedrus_write(dev, VE_DEC_H265_TRIGGER,
 			     VE_DEC_H265_TRIGGER_FLUSH_BITS |
 			     VE_DEC_H265_TRIGGER_TYPE_N_BITS(tmp));
-		while (cedrus_read(dev, VE_DEC_H265_STATUS) & VE_DEC_H265_STATUS_VLD_BUSY)
-			udelay(1);
+
+		if (cedrus_wait_for(dev, VE_DEC_H265_STATUS, VE_DEC_H265_STATUS_VLD_BUSY))
+			dev_err_ratelimited(dev->dev, "timed out waiting to skip bits\n");
 
 		count += tmp;
 	}
-- 
2.37.2

