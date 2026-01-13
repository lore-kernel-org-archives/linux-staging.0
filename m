Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CF634FF46
	for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 04:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768280384; cv=none; b=FHfFCNy6JlwzxZnToCTligqd0HcfVhs1KdkyoBfTN7Qa5BLOmWIYklEG4GkmQCUoYu96kXlT/zau3RclK5+dvHwDjN7T6iFXr/MBqlHlPRAcwLQ+MA2Eb7CFhOG1o6RLi7XWCEBlolkytluZGSLoEMbikLT2CnIyecr8xwszIZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768280384; c=relaxed/simple;
	bh=bCEMHZ6kz6Fm1BrBwVu56MAE7W4gVEikAeeavZ/Di9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cFhN0BioXYoKHUlRI1DgH6g/wHSiZli0g6+LwYEt2gM0RRE/MfPyC/HSE5BOzytq9fzS2T2pDshmHIQXQKdFTbhLusRVPT1iBp+B0HqEYCYfcYVknHD/AOgnXCHjumwYrLo4CKnoZ0+oAWElFggFuGuOmvG4Wt69s73CfrlN9zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZtV5Nlkc; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtV5Nlkc"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso2974176a12.3
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 20:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768280381; x=1768885181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jTvxo6KbWMtGy6RGpj72F7tdPe/SFWx8IlZmuHDEiGo=;
        b=ZtV5NlkchS4yZBEbqyB+Jt56XxVIeH8wBbQVUUo8rHtGzKnnUM6ehVFh5y29VOijtn
         nS84uXF+LS+PuccXIhIAzJ7J/fMT6JR1cWx1G3NFgCAmGklNZ7V7t483KaFUpWz6jrUN
         U0908WCkaT4TmC8/LtdqW32hcRX6uFyJ5gw80P1tSS4f1Ze2X+9tzZi0SzY1H0IyC+qs
         wqkgf8W16lwZJpPVNPYgprXcNRJePtPZqIjCTyyBovdw/0hsb4LxGIffSI61f14SbYz3
         tfKFII9jtVNdKJlw49sX4uLGgOx6Ub7gVt8Y6sifloA5G6Y89XLiNiBzoXVHnfkqchVC
         vQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768280381; x=1768885181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTvxo6KbWMtGy6RGpj72F7tdPe/SFWx8IlZmuHDEiGo=;
        b=n8sPLtQiHHtNwdGApplvGNKkv5CivCHLitIjqaVYfGeq6JaOuSA+gAcl1upYajZmvM
         lU+5FwodtdBd3GaceTQPVwXhXvJjXNjMMvqczl23ihsE4zjXwZTcPnzeD7yCs0wTPdF7
         Clw4gNhg5kktCLV6jbO17IjJ7g0nTI31IiQFiCbLhQ7a7hHrEK+GjHkE/wn41Ei+UdG1
         kMRSkrDtq0h39bxgScgcSIQuSCQeG5ng7PtdVgrqAwHFzCMTz1c0WTURO1tw3RmcFY+g
         Gv/7//XoTMhMSqmmZlgBSH48jPYfPHN+anaoESVeQs0CEtJIeOCTzsMjEpztx6thj7Nl
         DrtA==
X-Forwarded-Encrypted: i=1; AJvYcCXKNZHEe9imUqW7kCcXRWkQjtCNUGI6JwvDuGBW1+Q0sbG+2+UCQOcUxcQMJZs/WgFIKuYRzuki9Fo6WUU9@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5bMVYv6lRoETOWv54zjRTaxxHfW7hOjkxV4+yvpeR9FcjgKSJ
	K969S8QJhVXwlVpd4CnWOZBeO2orUTspRuN3QUf4C1bcMvcnoECjJDbX
X-Gm-Gg: AY/fxX7rwls90DAiAOU11nilMRrINnlLHPkB7b0TvZpdsWMQifWSZw3plK2g53PkjEa
	L1nuIEr5QSAoSWH/1QPnSqJfG484OyDPoT+X5TrDObC4Re4tCzCW7xGS3p2AiKUMm/FCoEbrLOv
	i9BHKSht8sTt9q9qi92Gb+YAjVtBvdLalZZY1wnjsho3cG6vdMfToeiJ/aOwZhyJrlw1jvwFEQf
	tIbLEOIzpySRTJuraNP1F7i51ofXi1RvBavc1h4k5i1nO053Ft8x3k6SJGB7sjGW3HLiFZH+WYo
	vzcWpqW0UUjE4oM7QPrXNTkBuRHaUmBknhqS+l1+ZRIhcmlhJtptsb/zLaCHZx6VBMWYCuMCXkw
	u8bIk57xx48MpH/v/F+hBkC5H+zxBnHRiqeFD55k1mbzTumQpXjofABhWGlB9zi9wpzxluJnRPE
	eRtz0IHo2oC0qGYmhQKmIluRhJVWOExuperr8uc9EongE=
X-Google-Smtp-Source: AGHT+IF5y3wMzzLD9O647B9Fwv+OhX6pLmVT/zSElB3m1p3Mv2vCh9yICG/2VmelPoTP3BFPVF2CNg==
X-Received: by 2002:a17:90a:d40c:b0:34a:b8e0:dd64 with SMTP id 98e67ed59e1d1-34f68c023eamr17396933a91.1.1768280381428;
        Mon, 12 Jan 2026 20:59:41 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:6652:1d71:eee0:e3bb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fb74436sm1341597a91.14.2026.01.12.20.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 20:59:40 -0800 (PST)
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
Subject: [PATCH v6] staging: fbtft: Use fbdev logging helpers when FB_DEVICE is disabled
Date: Mon, 12 Jan 2026 20:59:09 -0800
Message-ID: <20260113045909.336931-1-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace direct accesses to info->dev with fb_dbg() and fb_info()
helpers to avoid build failures when CONFIG_FB_DEVICE=n.

Fixes: a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601110740.Y9XK5HtN-lkp@intel.com
Signed-off-by: Chintan Patel <chintanlike@gmail.com>

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
---
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

