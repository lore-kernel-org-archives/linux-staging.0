Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E988A3D
	for <linux-staging@lists.linux.dev>; Wed, 27 Jul 2022 07:36:22 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id v28so12671660qkg.13
        for <linux-staging@lists.linux.dev>; Wed, 27 Jul 2022 00:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=streamunlimited.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rO4phdManN60SPf1W9WiyPdt9raYFpN1OI/PcK1NnQ0=;
        b=uf7lDkpVYO56NWMPL08t3bV7ykOUYmDaRNEf57tqkkhLMFpNUwzcla0Lokoe8tkjv6
         GY7TYiWRZHqk7bMBMb76LrdFBYz0PHG29omXVyfilS5Kj7k2Y34QjUeFMx9v5Rx6hD86
         OatRJqn2LPFVr9JyH10I7+SY5t911D/Yjk6Sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rO4phdManN60SPf1W9WiyPdt9raYFpN1OI/PcK1NnQ0=;
        b=pw6n438eBDdYUe2lzw7ZQ7c8x9WqQvnjPE15ehgHB4HJnuvzMBEAqJwqZ/ar5VhGCW
         Xh1ug6ZduPD2lW7m9FRFavv5k5O5lFJvy+8dU11nTowjySFGgImV1eS959qaTEC+suHQ
         BEQD8howtqBQZDKxGUkdbK1l9MpxUYG3COIgYjkQRPv4+7I/Aem0KkFoFhvG84gVeFYk
         AhgSPaHSBaFBpr5ybQCFjL9dtV+XAVS1l8rXtBFSo2fCjXfooUJcrDivt96PtR94XkdT
         qgW4Nf0HtZsg9moDpohn7qf+nx7S0lYeoHdFQi7FxajhOnHwbas3Hh5AZkbiIIDzVK89
         IcEw==
X-Gm-Message-State: AJIora+yC/711up1tvIb56oBDBY+terp7xW1F+2NFA6bwqH1YPY02qJP
	RVQT6swk/zVY4wd/bah//A+Q1lyOpzSNV0eL
X-Google-Smtp-Source: AGRyM1tTVXmc9JrwYNXN2698PGpq5P5gj2i9zaPSZqNDeI8sJMebG7pGAmT8yx65QQjJq/P/t8m5dQ==
X-Received: by 2002:a05:620a:2552:b0:6b4:8dbf:8992 with SMTP id s18-20020a05620a255200b006b48dbf8992mr15785127qko.109.1658907381478;
        Wed, 27 Jul 2022 00:36:21 -0700 (PDT)
Received: from localhost.localdomain (vpn.streamunlimited.com. [91.114.0.140])
        by smtp.gmail.com with ESMTPSA id x22-20020ac86b56000000b0031f4007dd92sm2709526qts.89.2022.07.27.00.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 00:36:21 -0700 (PDT)
From: Peter Suti <peter.suti@streamunlimited.com>
To: chuansheng.liu@intel.com,
	dan.carpenter@oracle.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>
Cc: Peter Suti <peter.suti@streamunlimited.com>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: fbtft: core: set smem_len before fb_deferred_io_init call
Date: Wed, 27 Jul 2022 09:35:50 +0200
Message-Id: <20220727073550.1491126-1-peter.suti@streamunlimited.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YuDlfLeossnntH/C@kroah.com>
References: <YuDlfLeossnntH/C@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fbtft_framebuffer_alloc() calls fb_deferred_io_init() before
initializing info->fix.smem_len.  It is set to zero by the
framebuffer_alloc() function.  It will trigger a WARN_ON() at the
start of fb_deferred_io_init() and the function will not do anything.

Fixes: 856082f021a2 ("fbdev: defio: fix the pagelist corruption")

Signed-off-by: Peter Suti <peter.suti@streamunlimited.com>
---
 V2 -> V3: Add patch changelog 
 V1 -> V2: Change commit message and base on top of linux-next

 drivers/staging/fbtft/fbtft-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 9b3eaed80cdd..afaba94d1d1c 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -654,7 +654,6 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	fbdefio->delay =            HZ / fps;
 	fbdefio->sort_pagereflist = true;
 	fbdefio->deferred_io =      fbtft_deferred_io;
-	fb_deferred_io_init(info);
 
 	snprintf(info->fix.id, sizeof(info->fix.id), "%s", dev->driver->name);
 	info->fix.type =           FB_TYPE_PACKED_PIXELS;
@@ -665,6 +664,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	info->fix.line_length =    width * bpp / 8;
 	info->fix.accel =          FB_ACCEL_NONE;
 	info->fix.smem_len =       vmem_size;
+	fb_deferred_io_init(info);
 
 	info->var.rotate =         pdata->rotate;
 	info->var.xres =           width;
-- 
2.25.1

