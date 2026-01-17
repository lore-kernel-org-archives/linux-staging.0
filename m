Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208D8500956
	for <linux-staging@lists.linux.dev>; Sat, 17 Jan 2026 04:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768624234; cv=none; b=JabQYXXguib4s3dx7NrF6kxkG0e+n5zqEifFmeCUNtJXuPb0KFwZdZq1frr5lixpxEJExeKvmEXCLxm9HvM6Y9hdFPDeXXaYnQP42uM5pmt3Hx6wVnxcXE+IHu36QP7W7dztRa2B88MKtySbHS5LtRtRZ1O5v2V93VregAEJXXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768624234; c=relaxed/simple;
	bh=59/a8WTm/gWfCxzRJbq7yPBBnub6sQLN8ljF0PmknGU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ahl2J/NLklnK32A3nvoVktFiquiVY6YXmsbyPFwb9W4ChwCHkb5ZmEarmRX4ygh523COJEK9/rjNJjtasjOCwnDwQVB8TjEjJYy0v4USh9nJVP0luiIg1w/MltjyIIJQ7JWrDTz39OVOPdfDUG0Sn//3oTzaOdFYah7yGGjRSDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3I7TbS2; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3I7TbS2"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a1388cdac3so19117545ad.0
        for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 20:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768624232; x=1769229032; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vCrSsGPr19mQwGzLbkxTfgCN7ZB1b84ZZ1vrvJhEPMM=;
        b=c3I7TbS2GYHX6RzHqivT8LMknp9q3XNqnIIgknjzNCy4Bosn70kqbdWnmqxGEh6JS/
         J5K4u8noZwhbtyuIVly+f2b9F4kB83T3oUaZ6WAI4cE4ZBLXPmnxPWjrN63wF0mcNeWA
         uZLaxEuKZ4IS0Fw7c04X1RUwc2z/xs8N87fvd5DoTWkD98LkpifBtyMURaoI1h/wwlo3
         ciTdmvbL+zsPrMJ1dF8XtjVZZHQX9zXzK/V8dHOxiWAfagUyRpAvAlcuhEcYTAcKUpCu
         +PLSWEjDO/0Cs+o3bdh+upNGOyjZWEOZM8nlsLNGbzyRPlV1isWWmM4LOwmrNZ38QqLj
         Q6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768624232; x=1769229032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCrSsGPr19mQwGzLbkxTfgCN7ZB1b84ZZ1vrvJhEPMM=;
        b=A0NAJeylVur7wiTKh/volSdx9FrGX8wy6u3Xp8uPWL0bAojflhYsx/ztiIXB9Awnzf
         bK0DI3wFWTzrWj1ySjxJc02+UZMOM3VMxKZZuQ8qp/3TeL/4lCAESY6lXCl8Q80iQldR
         kq/RUWbbjGeVkrEojsSM76vtLnhx4/S2piPD3f4t/8fNP8qtUDM67YQfWlUDQ9MCV7du
         WQ33rCUmdCFlfATziQd4og8c3YbR7BPS7zNPHZ2HsDr9NAxbQYaazSlsIgsqeDHGZC1C
         kXrNCns7faQpOfM3TEJrK7vdqg3ewrawLw96O1hhqkA3r0w+zqR4Xz1CTUrq+U4QPwrQ
         MecQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYR/zdZMKbVfK9SCzM5pM3ZuG74jVsFSEO3nr+5zM/vRorQr0xLNef2qBNtRoPgM41+XqRwCy+dhMTEPad@lists.linux.dev
X-Gm-Message-State: AOJu0Yzn7DIOyd1DKY/P8G3gKeff87hVBFvaSY9CtiAQtttfbsUwGEP9
	VZNJ+ZQ0YdUCWW2coz0xO6ttRel+aBshDMjKUNN8tEAI4ZDIKzFP7IRc
X-Gm-Gg: AY/fxX6GxP7krhpaXcTnMMy5oORZvm7X+VCn/Hs9HhsES5B/IuxZvCGxBB3who6GgY3
	JnjHButIQJC3mqvYbtDF0G9jMr0LNG38NcYKqw2Ra1N/yVRwyHsZ3LzYe3IOnQoUws7sQqSHMzo
	xea6O/WxQA/RcPBfV3JZjxk/8HDhuSsuMlPZBkJi3Q99T+wNNyyjzv9oL1Vy16fobG2kv6/ZL7d
	3Ragt1zIUrJ5QFDYoWgHs4QFBCM3YP7BNKDTcWFE6vMKFz9aAXGHoUSP09UjeJJCBQaMUdSBp3D
	V0qqxVe8/OqFDegmQZuuonHYnfungYJusJTF9y/Qlx/jfv0nZ952ugLty4EKb4gTYJxA3dI47VM
	VnSYbfWMWsAmTBS4Vi4gxdKD7GeMVYGOo4NVmmpugVslrKRMdRsNJQZ5vFTgKFiGoFdtEl3zzZ6
	kVFgcVIrShiI0KeuL7ck3J+cTYfaLn1cwRiBTjXUeHHaQ=
X-Received: by 2002:a17:902:f78a:b0:2a0:b066:3f55 with SMTP id d9443c01a7336-2a7174efc71mr45039245ad.10.1768624232460;
        Fri, 16 Jan 2026 20:30:32 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:26af:b454:d793:29de])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa108b23asm3370159b3a.3.2026.01.16.20.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 20:30:31 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de,
	andy@kernel.org,
	deller@gmx.de,
	gregkh@linuxfoundation.org,
	Chintan Patel <chintanlike@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v7 1/2] staging: fbtft: Fix build failure when CONFIG_FB_DEVICE=n
Date: Fri, 16 Jan 2026 20:29:30 -0800
Message-ID: <20260117042931.6088-1-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When CONFIG_FB_DEVICE is disabled, struct fb_info does
not provide a valid dev pointer. Direct dereferences of
fb_info->dev therefore result in build failures.

Fix this by avoiding direct accesses to fb_info->dev and
switching the affected debug logging to framebuffer helpers
that do not rely on a device pointer.

This fixes the following build failure reported by the
kernel test robot.

Fixes: a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601110740.Y9XK5HtN-lkp@intel.com
Signed-off-by: Chintan Patel <chintanlike@gmail.com>

---
Changes in v7:
- Split logging cleanups into a separate patch
- Limit this patch to the CONFIG_FB_DEVICE=n build fix only

Changes in v6:
- Switch debug/info logging to fb_dbg() and fb_info()(suggested by Thomas Zimmermann)
- Drop dev_of_fbinfo() usage in favor of framebuffer helpers that implicitly
  handle the debug/info context.
- Drop __func__ usage per review feedback(suggested by greg k-h)
- Add Fixes tag for a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")
  (suggested by Andy Shevchenko)

Changes in v5:
- Initial attempt to replace info->dev accesses using
  dev_of_fbinfo() helper

 drivers/staging/fbtft/fbtft-core.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 8a5ccc8ae0a1..1b3b62950205 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -365,9 +365,9 @@ static int fbtft_fb_setcolreg(unsigned int regno, unsigned int red,
 	unsigned int val;
 	int ret = 1;
 
-	dev_dbg(info->dev,
-		"%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
-		__func__, regno, red, green, blue, transp);
+	fb_dbg(info,
+	       "regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X\n",
+	       regno, red, green, blue, transp);
 
 	switch (info->fix.visual) {
 	case FB_VISUAL_TRUECOLOR:
@@ -391,8 +391,7 @@ static int fbtft_fb_blank(int blank, struct fb_info *info)
 	struct fbtft_par *par = info->par;
 	int ret = -EINVAL;
 
-	dev_dbg(info->dev, "%s(blank=%d)\n",
-		__func__, blank);
+	fb_dbg(info, "blank=%d\n", blank);
 
 	if (!par->fbtftops.blank)
 		return ret;
@@ -793,11 +792,11 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 	if (spi)
 		sprintf(text2, ", spi%d.%d at %d MHz", spi->controller->bus_num,
 			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
-	dev_info(fb_info->dev,
-		 "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
-		 fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
-		 fb_info->fix.smem_len >> 10, text1,
-		 HZ / fb_info->fbdefio->delay, text2);
+	fb_info(fb_info,
+		"%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
+		fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
+		fb_info->fix.smem_len >> 10, text1,
+		HZ / fb_info->fbdefio->delay, text2);
 
 	/* Turn on backlight if available */
 	if (fb_info->bl_dev) {
-- 
2.43.0

