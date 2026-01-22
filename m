Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F402D3101C4
	for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 03:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769051816; cv=none; b=gZ7X9yOqx9EI9KL11vaUWTsVQxsVu8KShqRhz7Nv0DbNS2G6l4IUO3k9eBdA++v4jT7qiG9WyVW3z1hCX/U41AzZLFQi0Zh1jnEpqHk7//b0Tx1ShXodFLEC0MkuC4Rxj26HFLlOBLrT3D4M1V2y00G/WzwQlF43KoMxWBiFNIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769051816; c=relaxed/simple;
	bh=+MYoKC4GsgZniJRfFsr+5viMvEwYPUanOo3mvBb8WUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e2UC3eeLf51WjKJZU1AGnYGvUZgRY2x3ogU3ABZKirXCmqx73LTqznlLzJRhsQiFzlS9mSr0zXaNWDPVMT42sd5uq8jPbJPSf4TIrtN/LvWTLjA2eRJQ7+t+GaYoN17rbVrFQ/XyE1DxRMQIbuUdUD8HdFGi82Ci3NuBBwfGtY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RsQeWndI; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsQeWndI"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a0fe77d141so2706625ad.1
        for <linux-staging@lists.linux.dev>; Wed, 21 Jan 2026 19:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769051808; x=1769656608; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWQboeoR7+6YsMwaf3C2xb3O23tU5oXeb/k98XP/HFY=;
        b=RsQeWndIhBboFWwFBGSPDY4OfGVDLoZW2Q6XjfWyMqLahiDazObO2u4xIV821XbYE1
         v2n9G0O+ZXFK2YauaN1NqqW1MuMGqzNnaLyu7lvQMv0QY4ew87tJuVm48uNI1Lkv3Tr/
         L6pP4XQ3Xp2hEeMOmK+iysbfvb0Cb1Dt1Ftpf9zZJpac6OTewjapfAEi5rN3UqdPTsHZ
         gkCFQhhInAtNzEvtdQsjV1VE0WBBaWIVwa0Y/QrSccDIqeJzt0dePgs7OXwzayc7dwIc
         98FTMXx7QOl3Q8PRU0bIaKGAjloSd5GCZQvs0duSwKFZX6suhu184KG2laOwZupLhT97
         JtPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769051808; x=1769656608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nWQboeoR7+6YsMwaf3C2xb3O23tU5oXeb/k98XP/HFY=;
        b=Qso3a3vLXr/OgS6X5UTIZxVHBvnOtzhHDHP2cBKIWDSIXXfqxkmB2fSLHTX/tn/wDX
         jE6FMT53Nmd6UNnuLdh9pkxKZJYdvvlUdUyIDvOhrihfmi0yCD5x2+1ffGBH4ww6+/vl
         WMyK6oGFYCDBDgPe0PnOPl7znoDzjRJVUBCVF1YewYBpoK/5sNVXAR7RlMkoxGYDttgA
         VRhCbF1WEdWZ87W1fEETwyrFji0lKWfktqtR1xPSpbMp9dvZbx+iHiU5sgk4N+WNbj59
         wot90MtVnXCL2tkp+966ko9VRIKYXqTW5+1LsWIbtdr/pJUy0GNR6KY5vL3VxhWi97Z4
         8ICA==
X-Forwarded-Encrypted: i=1; AJvYcCXuqkkk/ZKEk0vg5dptN8HIzbRgNPfMx0elXk9l9u3xrHeStrxErOqSq21X5HIsVcDOD7aoM32F2CFhUB6+@lists.linux.dev
X-Gm-Message-State: AOJu0YwpKO7vqhkb37Q7lwMNkIGY2rL5Xi6hSN8MOpfV3oPdomi6ELqj
	eX41Q5VimPlZtXsCRRI6BsenJ+AaeIW7H9IzY5EG4C0y26DZknM3JXBd
X-Gm-Gg: AZuq6aKN/HtFcqrtM0wcAx/nxcPrV/BRvV9LJ90VDua1nvQG1W1LfPsIdZ0yTdMNSp2
	IrcpgGiILWq93CTMFGyQxcf0ovBSaFNgEKPTjNpCzxx422reDfvhI62mxixWPZwgS9fBWX2BlPM
	71dIeu8jPRZuJ82viDpk26dYyzsWsOExd68sOfHaRsDvP0W43Td77o1g/1Xn48fpeqJFt06G074
	hZW19c9g0OXASDnujzdtDXvlbDKJ0D5gT4EXsavcvI2dkW93Cf6rghJhg1XjxghlqjxUP/QIwNO
	ptGNl6rlRB26aTjtBK4XAjapiR08WK4+ZiDR9QiH4N9+43mO8DEiyHdR8Pz7cDi+m2fvg1PSGlY
	3v60yE5d4fxwQnxDAoxd7xJtZhj6/imhAaRTGHlQt0fCSA41wSmsghbxqKA8HkonxhO1YDaecF3
	2rjIDKO1N/agWYnuFTYLOHT6p/Nwjm1OPkS56Q1vDKU3w=
X-Received: by 2002:a17:902:e80f:b0:2a7:682b:50af with SMTP id d9443c01a7336-2a7682b521bmr74186085ad.40.1769051807610;
        Wed, 21 Jan 2026 19:16:47 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:5396:967a:93dd:83bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a719412d38sm155966625ad.87.2026.01.21.19.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 19:16:47 -0800 (PST)
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
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v8 2/2] staging: fbtft: Make framebuffer registration message debug-only
Date: Wed, 21 Jan 2026 19:16:35 -0800
Message-ID: <20260122031635.11414-2-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122031635.11414-1-chintanlike@gmail.com>
References: <20260122031635.11414-1-chintanlike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The framebuffer registration message is informational only and not
useful during normal operation. Convert it to debug-level logging to
keep the driver quiet when working correctly.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>

---
Changes in v8:
- Add Reviewed-by tag from Andy Shevchenko
- Add Suggested-by tag from Greg Kroah-Hartman

 drivers/staging/fbtft/fbtft-core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 1b3b62950205..f427c0914907 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -792,11 +792,11 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 	if (spi)
 		sprintf(text2, ", spi%d.%d at %d MHz", spi->controller->bus_num,
 			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
-	fb_info(fb_info,
-		"%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
-		fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
-		fb_info->fix.smem_len >> 10, text1,
-		HZ / fb_info->fbdefio->delay, text2);
+	fb_dbg(fb_info,
+	       "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
+	       fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
+	       fb_info->fix.smem_len >> 10, text1,
+	       HZ / fb_info->fbdefio->delay, text2);
 
 	/* Turn on backlight if available */
 	if (fb_info->bl_dev) {
-- 
2.43.0

