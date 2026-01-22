Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30B934FF54
	for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 03:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769051816; cv=none; b=u7yFgWK9p/o/zhl2li3chT2rd3Bm1aqknm7QiUVNMRyNAtumnUCXLtnnchwQViezlXAc4DMr+gQ2W0ohb7dWA8aYNHU/05WMlVAtu0+C3GqOnU7V0dAnBZuZfRVZrT7E5JY+D1Sj95DJvs+nnSgTtEOi2cxxy5ncseo8byXq/+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769051816; c=relaxed/simple;
	bh=fB4qFDnLcEuztYyiCjd+RjPOd463HVI1jnS3oHKE1Nk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NyBpgcPEu07+U5a+KNW36XMzOWAw7Rf7PIoHIYVHkx1h/MZiXQJTiWHc9V4dbnScaG0JZC9bk2eFsDf+6BXXRyuZFgmJR1rVkNjw2U0P9JPxwxYBKhZ7BHRyRRSGieqesyx35IXorm2C0yaebBnyJpZoniQUM/NJYsPiNp52ylw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/W5xxxW; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/W5xxxW"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a12ebe4b74so5001685ad.0
        for <linux-staging@lists.linux.dev>; Wed, 21 Jan 2026 19:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769051805; x=1769656605; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GfgKMmP8DcncE4pa4cHunaIBJ+0sSublRL5+ZWYWWN8=;
        b=B/W5xxxWdRL93HLlkYn4Epvj1X8NEGnST7YckRMLjK2iFU40UAkjXYFRgz2rCjLIwH
         9MUCH41TcFm6t1m6e2rJD0GjA/iF58jJh44B8B0ZoG9wT4xVuhuU3sD0Vn8ECiORDjkO
         DyoD9SipQfc3myW+WTVQeH9rm5iYM6GNUp6peUF4xUAMOo+nsUBS///cxxZhf3VpF02T
         jD8JU+YIoDmpBrR9jvXg6E/s09so3zYp5lucfajuPLWUc9lXtRKQE/Ll3Xudbg5pmM/O
         Gl48KtaF3Rnidg8jdK7CM6Y9JzLazDh4d8BIxIYi5BRqwg8Sc5gEyjbFavQH/LtZwJ6u
         2SNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769051805; x=1769656605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfgKMmP8DcncE4pa4cHunaIBJ+0sSublRL5+ZWYWWN8=;
        b=bQv0QMcafrDCOfn66dhpjlO1EzoIN0l6wB7AHFivuAY09j+/FP2I7+ixKfDz/T0O/9
         Pr/re9wAUW3WqSzgImEa6Cui1rFxBUcLEolHrkMh6MdZS8h5IUlaaZYFmQxXYbsakgHw
         03Ia9tJIx4GhcCGf1SFDF2BY2x94kVq2tQlarIvWW1AIFF+LDRBI83squkLlM8RBUndY
         WtmD/jQ4u6kgki/BU6gJ8pZKSI7zdEVzBQw0I6EYoDWZ9cybWEMNWkzjpRVyWdPTmUbB
         Jduf65QGdjnbJE4M45HAjnuPWib6IIFqmwJiFNvjvORPj33aJyEVn8sKt7mCiRfZF2/F
         s45w==
X-Forwarded-Encrypted: i=1; AJvYcCWPmIwWoKwNeOcdifXkUKfoosrir2JsRkiyJ4EzBHtylAx1X9yLzWFawn/b0gizEwzQplg3Dtx0W4h8puAx@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7WO4HADp21cqs05i/BLrQzQNntvEMhwEnmctA9wqGZ1MprBKr
	5YvTK0Jc+pWaBFGfEABivhgNKzHaXl4rWTv55FK4JRZcZZyGf5qLjztE
X-Gm-Gg: AZuq6aLyMFJftNT/Sflzp/ChEr5QydoopJcZYBv3znGmx/Er/8UjqE+vSu3dsIpSvaC
	RZJuQDBNT3Mk1kxOs8FlpeD/BVdLN8kRYjQfqQm8NWXfXI3zqB63JBYaHV5ucnaz9gY5ZJfaDJi
	1rRuRNM2wXE6YEtuyuRELWXKWAq/d1XoeeN1jrc9Uq/4jSHHZJDjbtDr/Lu/WQFERrNsisS4n6b
	w8lq7PE2A9GT0j/J1k10vrZTBOgbgS7e3aKseQfKIC4jO/z41zu0wGK/5M0iQ7NAh5C8yfbLiqY
	puSt00+9CJlTSADpf8haO9xuccvO8ulRg9rv9fbPgjJCwVCyIFtlKZwbrVnBON4IMyby/3Ut+hY
	CkukNq+v+r46J1FKVBOhO49bZgGjvTT4mftL5Y4g5jJ/wxjf+MwIawJz2hAaXhWAl/z6RY5YPiU
	JNScMxiyOueH8tqRqixO8jyHTGQeFnF+YqLu8RFJPR3Ik=
X-Received: by 2002:a17:902:cf41:b0:29e:fd60:2cf9 with SMTP id d9443c01a7336-2a76b169703mr73811165ad.54.1769051804927;
        Wed, 21 Jan 2026 19:16:44 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:5396:967a:93dd:83bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a719412d38sm155966625ad.87.2026.01.21.19.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 19:16:44 -0800 (PST)
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
	kernel test robot <lkp@intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v8 1/2] staging: fbtft: Fix build failure when CONFIG_FB_DEVICE=n
Date: Wed, 21 Jan 2026 19:16:34 -0800
Message-ID: <20260122031635.11414-1-chintanlike@gmail.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>

---
Changes in v8:
- Add Reviewed-by tag from Andy Shevchenko.

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

