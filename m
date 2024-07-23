Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8F0632
	for <linux-staging@lists.linux.dev>; Tue, 23 Jul 2024 06:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721714628; cv=none; b=G9FL6z3pGUCA6DB7cY6IWoNk2RhEHoC/BJ1DlwLc1mQ3iWfk3Fx5payG38LP2dWPse0uQVt15zRiiMZG9n/4ohIDksl3VjthBjvt+Q+wVxq7fnoA8KHQ4NqkSCxXTjxURm9MDnrVIJLHWU7VpstRP187yRtHsvcUGxbqu0lup8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721714628; c=relaxed/simple;
	bh=gwGMfakMSmmXIu2SuQ7DD1aUV9egyzbxf33dyORpkcQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lAMVwhxbLEMRwyBx+f/Me1kLE4miHZ571aFOXhl2fOZ9IQe3ZOMgHxxIPoEgHEN4VYyUY0suRKJbaQtbyykTu+V4dJmm6VBiPuUzCocdFvBJmXtra+Hb5QoZ7uftQfOTyRAKYndJTkee/pIXx7S9saNiWeTmiIvO1p0VT/Vaess=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aG5sFKEL; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aG5sFKEL"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fd69e44596so3487275ad.1
        for <linux-staging@lists.linux.dev>; Mon, 22 Jul 2024 23:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721714626; x=1722319426; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=54T/UrOSVnJ9rISsin1qHr+L1d8cmHOyygXczypoES8=;
        b=aG5sFKELasidMLEpDNl8Ua/+tJsji1XHE1rhvlSbvhPjOcnDHMLT7dtIdtEMcreg56
         XTmZ/xXwMOFF+2qpqsHXH4w+GNhi89SDFZL4ZShmwdw+Yyz+Y5VCvIEGxhHvACvNhZFy
         MRBy/GKyGRfJW1cME4djF7zQ+AfMXd1lXbZhExFDO5tL50MsnkE6XkXIWTJ3ruICFI54
         JxdNy3bPdpy2c//IV9Mwz2PuM8vn1ldXrUVmQnWlDZ7ocYJ+KWqC6qMmrskph++CVWG7
         0K+e7IEUCRC41W5j3W9Ytm7y/BkJe3amBx+ZnNF3/L69Z69DJlF8VS3cfcMSqUDQ2VSc
         2Ytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721714626; x=1722319426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54T/UrOSVnJ9rISsin1qHr+L1d8cmHOyygXczypoES8=;
        b=P7eul3Rr+jxI3AmAaUI+J0KD3AlwwPHF9qiONBnd1ir5Zu9AUcxTvb5wa4p07X2Gx0
         NQL/ZOI0fmCDwKxqzoJwZEwl6iUIMdXQcgzIBksU8wgAiW6HvQ9Vs8De/Hwmck7upEGp
         O8zDcxbchC9loMVzmCiuUE8Wv0nX1/6xvXBwLYhjdM1r/lNzzza545phU0Erv4KCn2ul
         i09WWIjSkcgUqYG3qaboCaQCSFxWiBbr7shT2hsLhlsgFM1Wveoj6FjCo18KTHYZMrx/
         8/oemVgk3iJlNEIGV41yakqPOsX9yDOOK1kXoAwAl73wnWjXRSHcQzt1EFbsdCskL2d3
         hruw==
X-Forwarded-Encrypted: i=1; AJvYcCW/ESv6uIgMajs7POlwH0pSyZLJUoP49mLp+C3YkTyhf/yl1Pkt58OoWFYCSXJTNFFXTJ8FXp3ko+JdZifsxtEhoj71xmhLNX4T1Hk2oA==
X-Gm-Message-State: AOJu0Yz/2u7l/jSt+YZGRv2TMyVMzksyOFynEHOWOdN+bTtNotDpaNst
	FU+j80ZcH+qoeKK/IoU5EuRabHavr31WxSIwqwhuExBiBYGzFFr2
X-Google-Smtp-Source: AGHT+IF5N9Hpjd9u7ffX60R/GPm9+eBUewVTteCh1raMCU9msqL1QfiaSt035qpW/Ns8EXNEz8UJ/A==
X-Received: by 2002:a17:903:2a83:b0:1fa:1a78:b5a9 with SMTP id d9443c01a7336-1fdb94d1692mr20402295ad.3.1721714625795;
        Mon, 22 Jul 2024 23:03:45 -0700 (PDT)
Received: from Riyan.inspiron ([122.176.198.184])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f291f10sm65597795ad.103.2024.07.22.23.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 23:03:45 -0700 (PDT)
From: Riyan Dhiman <riyandhiman14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Riyan Dhiman <riyandhiman14@gmail.com>
Subject: [PATCH] staging: fbtft: remove unnecessary braces in if statements and space before close parenthesis in function call
Date: Tue, 23 Jul 2024 11:33:11 +0530
Message-Id: <20240723060311.32043-1-riyandhiman14@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

Reported by checkpatch:

CHECK: Unnecessary parentheses around 'devcode != 0x0000'
CHECK: Unnecessary parentheses around 'devcode != 0x9320'
CHECK: Unnecessary parentheses around 'par->info->var.xres == 320'
CHECK: Unnecessary parentheses around 'par->info->var.yres == 240'
CHECK: Unnecessary parentheses around 'par->spi->bits_per_word == 8'
CHECK: Unnecessary parentheses around '!txbuflen'
CHECK: Unnecessary parentheses around 'bpp > 8'
ERROR: space prohibited before that close parenthesis ')'

Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
---
 drivers/staging/fbtft/fb_ili9320.c | 2 +-
 drivers/staging/fbtft/fb_ra8875.c  | 2 +-
 drivers/staging/fbtft/fbtft-bus.c  | 6 +++---
 drivers/staging/fbtft/fbtft-core.c | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ili9320.c b/drivers/staging/fbtft/fb_ili9320.c
index 0be7c2d51548..409b54cc562e 100644
--- a/drivers/staging/fbtft/fb_ili9320.c
+++ b/drivers/staging/fbtft/fb_ili9320.c
@@ -37,7 +37,7 @@ static int init_display(struct fbtft_par *par)
 	devcode = read_devicecode(par);
 	fbtft_par_dbg(DEBUG_INIT_DISPLAY, par, "Device code: 0x%04X\n",
 		      devcode);
-	if ((devcode != 0x0000) && (devcode != 0x9320))
+	if (devcode != 0x0000 && devcode != 0x9320)
 		dev_warn(par->info->device,
 			 "Unrecognized Device code: 0x%04X (expected 0x9320)\n",
 			devcode);
diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index 398bdbf53c9a..ce305a0bea48 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -50,7 +50,7 @@ static int init_display(struct fbtft_par *par)
 
 	par->fbtftops.reset(par);
 
-	if ((par->info->var.xres == 320) && (par->info->var.yres == 240)) {
+	if (par->info->var.xres == 320 && par->info->var.yres == 240) {
 		/* PLL clock frequency */
 		write_reg(par, 0x88, 0x0A);
 		write_reg(par, 0x89, 0x02);
diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 3d422bc11641..02d7dbd38678 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8,)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16,)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
@@ -85,7 +85,7 @@ void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 	if (len <= 0)
 		return;
 
-	if (par->spi && (par->spi->bits_per_word == 8)) {
+	if (par->spi && par->spi->bits_per_word == 8) {
 		/* we're emulating 9-bit, pad start of buffer with no-ops
 		 * (assuming here that zero is a no-op)
 		 */
diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 8e2fd0c0fee2..53b104559502 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -666,7 +666,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 		txbuflen = 0;
 
 #ifdef __LITTLE_ENDIAN
-	if ((!txbuflen) && (bpp > 8))
+	if (!txbuflen && bpp > 8)
 		txbuflen = PAGE_SIZE; /* need buffer for byteswapping */
 #endif
 
-- 
2.39.2

