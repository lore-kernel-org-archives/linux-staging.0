Received: from mx.techtum.dev (unknown [51.15.50.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A51D8801
	for <linux-staging@lists.linux.dev>; Thu, 15 Dec 2022 01:28:19 +0000 (UTC)
Received: from noop.highnet.com (ptr134.highnet.com [31.216.14.134])
	by mx.techtum.dev (Postfix) with ESMTPSA id C8F341F3A1;
	Thu, 15 Dec 2022 01:22:02 +0000 (UTC)
From: "Haris M. Bhatti" <kernel@techtum.dev>
To: gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Haris M. Bhatti" <kernel@techtum.dev>
Subject: [PATCH] drivers: staging: fbtft: Replace usage of udelay
Date: Thu, 15 Dec 2022 01:37:46 +0000
Message-Id: <20221215013746.270404-1-kernel@techtum.dev>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

checkpatch highlighted that use of udelay should be replaced by
usleep_range.
---
 drivers/staging/fbtft/fb_ra8875.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index 398bdbf53c9a..75cf3bb18414 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -217,7 +217,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 	}
 	len--;
 
-	udelay(100);
+	usleep_range(100, 101);
 
 	if (len) {
 		buf = (u8 *)par->buf;
@@ -238,7 +238,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 
 	/* restore user spi-speed */
 	par->fbtftops.write = fbtft_write_spi;
-	udelay(100);
+	usleep_range(100, 101);
 }
 
 static int write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
-- 
2.38.1

