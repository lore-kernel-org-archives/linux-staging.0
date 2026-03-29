Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4D53815F4
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 16:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774802161; cv=none; b=VrpnIlAul3KmzEkk+sKU0Gsndvnuz6aTtAnh+bg4LBmeeBpnbQW+mnW0CuzTcEG3Sq7YFd0gAdLG6NOe6r1cZkJatjt39r46Ufje6GrOZTu0zeNYfxvL+sxyZ2dmF/G0DW1yyAP9LDenW3nIgFhQVnojSwunyAQtoAtW0kP8gPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774802161; c=relaxed/simple;
	bh=/9yQEBIn68Vm63TOdna+jIH6GLtqs3AUtQj1YyQ+4ng=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B0lmroXFVObkJuPGVXNx4wQd9/wM7Nw7ZqaVOGTwkPKck8F/26ZZvzQI1wIMPRnzAg612PLqLTptb9S71aJbBvnNfiM7xDQv6EyreAFi+CvkEEqlW38pgiP/CyVRdQRlzOG1+EsAiVhbhJAkCImXqZmKqmGPw7A0jB5p5EFEwSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CcVidsLc; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CcVidsLc"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fkKkY5Pjnz9tDX;
	Sun, 29 Mar 2026 18:35:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774802150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fZfWTd3DNdnwA/bP8ajgb6z23+Y1Gcti6OfTy3BHOPY=;
	b=CcVidsLcUBYmJib567b6kmpKH2SJmdFDExTnZ1r6d5/C69P0zbVRxq4CO8fBskkdzl8xxZ
	ira4BjOYC4BZnn5BeXp6nngiYNDNJa/ywbNQFlyN1FJznQgzK4Ti0kvXXjV7Na3FE5N1FO
	C8dRvNoe3px6Wk0jFq4ds9Lizs9CtF5ww4lWprFWz/kdJhGmwZ5+AIShJtC0RfHm7lKmAQ
	sv2BGNxUh64rhrqPcb5Rp4Hw1PiAef8Er9sAb3Xj+ckqOAZ10DEqSQAe1v5lHnT04RpOyK
	nKpvFCfdJIEVQ3nhXptgnoVpPBV9xXFHQcJgd2XqY096Uj8edyf+OowGJShStg==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: remove unnecessary parentheses and fix alignment
Date: Sun, 29 Mar 2026 19:35:41 +0300
Message-ID: <20260329163541.21423-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: dhoacebg197oy4gd89maw8bkn51qpn9s
X-MBO-RS-ID: fbf7c59bd8681e31554

Fixed several checkpatch.pl CHECKs regarding unnecessary parentheses
and alignment to improve code readability. These are coding style
changes only.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 drivers/staging/fbtft/fb_ili9320.c | 2 +-
 drivers/staging/fbtft/fb_ra8875.c  | 2 +-
 drivers/staging/fbtft/fb_tinylcd.c | 2 +-
 drivers/staging/fbtft/fbtft-bus.c  | 2 +-
 drivers/staging/fbtft/fbtft-core.c | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ili9320.c b/drivers/staging/fbtft/fb_ili9320.c
index 050fc2367c12..9f97cfa34b81 100644
--- a/drivers/staging/fbtft/fb_ili9320.c
+++ b/drivers/staging/fbtft/fb_ili9320.c
@@ -35,7 +35,7 @@ static int init_display(struct fbtft_par *par)
 	par->fbtftops.reset(par);
 
 	devcode = read_devicecode(par);
-	if ((devcode != 0x0000) && (devcode != 0x9320))
+	if (devcode != 0x0000 && devcode != 0x9320)
 		dev_warn(par->info->device,
 			 "Unrecognized Device code: 0x%04X (expected 0x9320)\n",
 			devcode);
diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index 0ab1de6647d0..4374a1682ebc 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -43,7 +43,7 @@ static int init_display(struct fbtft_par *par)
 
 	par->fbtftops.reset(par);
 
-	if ((par->info->var.xres == 320) && (par->info->var.yres == 240)) {
+	if (par->info->var.xres == 320 && par->info->var.yres == 240) {
 		/* PLL clock frequency */
 		write_reg(par, 0x88, 0x0A);
 		write_reg(par, 0x89, 0x02);
diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
index afa8f1c740c5..d58b1247262b 100644
--- a/drivers/staging/fbtft/fb_tinylcd.c
+++ b/drivers/staging/fbtft/fb_tinylcd.c
@@ -38,7 +38,7 @@ static int init_display(struct fbtft_par *par)
 	write_reg(par, 0xE5, 0x00);
 	write_reg(par, 0xF0, 0x36, 0xA5, 0x53);
 	write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00,
-		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
+		  0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
 	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
 	fsleep(250);
diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff19e4..3ae0bbd727a0 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -85,7 +85,7 @@ void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 	if (len <= 0)
 		return;
 
-	if (par->spi && (par->spi->bits_per_word == 8)) {
+	if (par->spi && par->spi->bits_per_word == 8) {
 		/* we're emulating 9-bit, pad start of buffer with no-ops
 		 * (assuming here that zero is a no-op)
 		 */
diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 3da42c8ca6e3..445ce426859d 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -659,7 +659,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 		txbuflen = 0;
 
 #ifdef __LITTLE_ENDIAN
-	if ((!txbuflen) && (bpp > 8))
+	if (!txbuflen && bpp > 8)
 		txbuflen = PAGE_SIZE; /* need buffer for byteswapping */
 #endif
 
-- 
2.53.0

