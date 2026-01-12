Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C19D1EBFF7
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 01:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768180078; cv=none; b=A2idvuFIVSTIY6ETYCeuP2gfoBgUAXRQaT6FHIh0Y1dC0PeAAL2SSr1+p/FPSGB37VwelIUzyGF/Ut1BKOBQADMbCrVjgH3j5C2WG41y3kx+Dy+whSka7Ll7bmuPnrO+ycTPKeH1E0+OG6gc7KLuJkdmx0kksip7zbwFTbIDXCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768180078; c=relaxed/simple;
	bh=zwIEUKzTF3+7hMI67z72W4djedysLxpt1Bovb4GGn2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ClLjyKy80ZkdJoCtstrGfpODDogsvokQ8+Oup8dYUSxp85cX6K1cux+BjGT1QY6UitBeJWh0tXRT4/FNJgroggQCI59Rw2oOkz74ycyzA8gUi+1HP3UEVhXobR2SBhH/nQrGJS7NKxkNjsesFLykXNwQRtlULmrK1B4CPBlouk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ql3ZhYrV; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ql3ZhYrV"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-81f4ba336b4so744000b3a.1
        for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 17:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768180077; x=1768784877; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TkOZXJ1yiBIweSUTCBJOqJ16hNtrAInO8IpS+8lGicY=;
        b=Ql3ZhYrVCv0y5D1Qw2xOl6lqqlrruPwOozsDtJYlug+V2si9736J2XYsr9WQWc/Uh2
         JW3A7puLXdg8hks3duubxpFunAehRjDXx3jQ87242rgPJwCOIlj3CnYnhMsJaT2+UzDI
         R4/IbfurkrDgNhN4l5ZU51M5VTe7KbntQYD8fJJ070/haJARqWmT6wULVFPSH1t5mubE
         1VjPqpTTwAduVwsVXVoRNqQmvnN2KK6WU0SMBEZAAFzixveFtSB4YZlmIl3qpedp/2ip
         YdpbqKrtvpvcdiHPnzUMC34+Jm8IkUM/orb+2PIf9iFy+4nVtwNS/yMA/pWgOFTla0nr
         f75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768180077; x=1768784877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkOZXJ1yiBIweSUTCBJOqJ16hNtrAInO8IpS+8lGicY=;
        b=mC+iI/PWafItf5wjk0Oe2WIqBE7pURg+g/DP3NM8YtkMjGry16meb7+fL/zuIdV+eB
         SBl2yzMTDNxhHv578HHG9jXoOp8qRvYb1v+KmB/WnPupVW5nM4cPjS2ldYCSDdOzcXFJ
         DhMRpsuWaC4XnoVJwxfM262MIANKiD+5CvX12+XI9qz7RZ2VK+UC3t41R4INx6awDJuN
         Yzh8Q60Qex98rl3ZNEgHJR5PiY+3DddT8+qdpHv81HnerH5EHzKYEq/nHEvqzts/7VNn
         /V+jLH1fMxaTBmQB73fiUXfZyJtjuZQsbTrlmKNKWYBkvI2vcOm4PZ90zHWn5rpFHsLr
         Mziw==
X-Forwarded-Encrypted: i=1; AJvYcCXzyQ+2wqMToX6jJANsgqtBuJ0E1hs1DcduGtOQkHKWhcvQUGirgrwU82E+Ilce2XYfq4mQsnAJbEVvqcI7@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9FMT53kL4/JdxHQNo7F04zIUDEfAF0JWzOp49XbQts+MYIepR
	rXxCYCKp8tN2jJ2QgqkBACxjnNN3rebA6rtrWdiwyfXwpMDp0+nsKSEQ
X-Gm-Gg: AY/fxX5W4Y3umMcY6XNj7Yp5cxG0z3Kd88KejUSRxLQSE/4VLBq1e5wkC+8rVJ38J4H
	CKq6Njyv6Vs/9AMI4C9WJQ7DrUOfnlTaNLnJu83Xswg12hbNCE/9jW+8mFBHQ9qHWY6ZU6FMxo4
	3TTpekOE/vHYouBwI6vm03/Wut7LeSB+xbAHQIschfF1PlWptwz24jyifB4kwY/iK+9ymjBZyjj
	OCQqeFAKH6VVsknHim+wOA+iRfDCygCwPDRzPTzwKj7cqjcv6IKUcTnVJLjX9qJQk1ggCpGv+0y
	CUts4ETi7ZZUPRmxORZjHVOcaVk1pJOIPe81JtXJrlcA0ewLAH77rFoBtuQO8DIQ6WmglvZeVa+
	vdNvRd9L0O2gK+wD+ciazZSe+BnJz2Ne4epV2a2SsYvUNHZZ9fBjn5Jhg11AccppSjcTd1yoDNB
	I/yr1RksrjEKmJRMhuq40IH3LUwhlWwjdpCBFuNmiD52k=
X-Google-Smtp-Source: AGHT+IEqSuoKlQd99SJwcfXAwafP6Ad6qD2z83UEaG0kD39I3j77hVcCOmXZQVclGkZssS94ypX4yw==
X-Received: by 2002:a05:6a00:a883:b0:81f:31c3:2e34 with SMTP id d2e1a72fcca58-81f31c33305mr4830490b3a.25.1768180076713;
        Sun, 11 Jan 2026 17:07:56 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:a2d6:d17d:ed6b:f017])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81e042e75b1sm3980489b3a.21.2026.01.11.17.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 17:07:55 -0800 (PST)
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
Subject: [PATCH v5] staging: fbtft: use dev_of_fbinfo() instead of info->dev
Date: Sun, 11 Jan 2026 17:07:39 -0800
Message-ID: <20260112010740.186248-1-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes commit
a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")

from my previous v4 series:
https://patchwork.kernel.org/project/dri-devel/cover/20260107044258.528624-1-chintanlike@gmail.com/

All direct accesses to info->dev or fb_info->dev are replaced with
dev_of_fbinfo() helper, improving readability and ensuring 
compilation succeeds when CONFIG_FB_DEVICE=n.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601110740.Y9XK5HtN-lkp@intel.com
Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 8a5ccc8ae0a1..309e81d7d208 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -364,8 +364,9 @@ static int fbtft_fb_setcolreg(unsigned int regno, unsigned int red,
 {
 	unsigned int val;
 	int ret = 1;
+	struct device *dev = dev_of_fbinfo(info);
 
-	dev_dbg(info->dev,
+	dev_dbg(dev,
 		"%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
 		__func__, regno, red, green, blue, transp);
 
@@ -389,9 +390,10 @@ static int fbtft_fb_setcolreg(unsigned int regno, unsigned int red,
 static int fbtft_fb_blank(int blank, struct fb_info *info)
 {
 	struct fbtft_par *par = info->par;
+	struct device *dev = dev_of_fbinfo(info);
 	int ret = -EINVAL;
 
-	dev_dbg(info->dev, "%s(blank=%d)\n",
+	dev_dbg(dev, "%s(blank=%d)\n",
 		__func__, blank);
 
 	if (!par->fbtftops.blank)
@@ -739,6 +741,7 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 	char text2[50] = "";
 	struct fbtft_par *par = fb_info->par;
 	struct spi_device *spi = par->spi;
+	struct device *dev = dev_of_fbinfo(fb_info);
 
 	/* sanity checks */
 	if (!par->fbtftops.init_display) {
@@ -793,7 +796,7 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 	if (spi)
 		sprintf(text2, ", spi%d.%d at %d MHz", spi->controller->bus_num,
 			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
-	dev_info(fb_info->dev,
+	dev_info(dev,
 		 "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
 		 fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
 		 fb_info->fix.smem_len >> 10, text1,
-- 
2.43.0

