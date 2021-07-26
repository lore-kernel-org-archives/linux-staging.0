Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBA170
	for <linux-staging@lists.linux.dev>; Mon, 26 Jul 2021 13:16:49 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id g23-20020a17090a5797b02901765d605e14so14124972pji.5
        for <linux-staging@lists.linux.dev>; Mon, 26 Jul 2021 06:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F1UL54kq9P3B03/zrEaHmiJVQdBboZhMIM+Kjok0NDY=;
        b=C36NpbPuZKpV5iBQACQRJs+XclqHKt1igprkGySAlIR/vKUdiam2f2wpzXiM9oAgLB
         UbSij7LBho010HkJrW0cJ20MxTwygttVWZezEC/ABMzCgiIc6FUi/cizAgMnrEVLQwAU
         uvOX/ZBn4xSC7cVFaDkfXaxGjk0qzrVrcfL6/B3xuQkhgkznMo/efyksYpCgSdolHBVa
         BN73oKkbOYezCBipnAjxbwJIFvTjPL8y7QiKMATPmFU5HE7S5gQVsJjKRdg4BcufxqOa
         T7bwhJK89qZIthhQ/iNGHxSgKK8Pgfx92k8CVFaKTsACfOZYTRv/XeADVXNbCMaIx/Hf
         4Ylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F1UL54kq9P3B03/zrEaHmiJVQdBboZhMIM+Kjok0NDY=;
        b=RG4mMb1YRdlMwbFdbXdhsSE0qlToq339U0aObkgrzSh1kgiIXX4DHWSVIr2AuS3Y4N
         8MhFwI28qjVC5Hk9IxA9kwPrY4iTQIZFwTrt1Vs2fzoY+TwF/Wzk6o4E6wSUFGqgBnJJ
         xUJv6En89BDu1rWvBp0HtbWYcgiWtbfAb7lXh0Fdnv6H74wqI3W5rMLEdBHzmtJbENv6
         8o41r3Rrtc8FSKoGd0ugXes4Ly8qx72mnl302ZyitRjILvAHJWbZYAlJR0v/tS+rDbLb
         0BcyUsKNVazY3FAOegnZh/F50MT7O4GTYScyVtEaBKr2LVa2r5/d7ebGAMY/MEpZAWJL
         IHsw==
X-Gm-Message-State: AOAM532mrIEwGfWNdikT//I06FLD1DmngWxTcEVICA6ZyjrLi7vyRClE
	o6SmAw67KSCxB5z5+zuuTQM=
X-Google-Smtp-Source: ABdhPJx6eIHRutchmLGiKkUgbUcc8PSZS2vs88kH6Qdf5R8BfIa1c+bA5sI1Af5TgvyeuP1StPY3aw==
X-Received: by 2002:a17:90a:f690:: with SMTP id cl16mr13519662pjb.164.1627305409475;
        Mon, 26 Jul 2021 06:16:49 -0700 (PDT)
Received: from localhost.localdomain ([2402:e280:2130:198:9b25:1cfb:9ff3:2a8f])
        by smtp.gmail.com with ESMTPSA id c12sm12070869pfl.56.2021.07.26.06.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 06:16:49 -0700 (PDT)
From: Benjamin Philip <benjamin.philip495@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Benjamin Philip <benjamin.philip495@gmail.com>
Subject: [PATCH 1/2] staging: sm750fb: Rename maxH to max_h in lynx_cursor
Date: Mon, 26 Jul 2021 18:45:01 +0530
Message-Id: <692211000786d76aa41bc24d4ee06b5868d82771.1627304144.git.benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1627304144.git.benjamin.philip495@gmail.com>
References: <cover.1627304144.git.benjamin.philip495@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct lynx_cursor has a member named maxH. This name is
CamelCase and is frowned upon. This commit renames it to max_h
and makes the necessary changes for the module to build.

This change also fixes the following checkpatch CHECK:

CHECK: Avoid CamelCase: <maxH>
116: FILE: drivers/staging/sm750fb/sm750.c:116:
+           fbcursor->image.height > cursor->maxH ||

Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 6 +++---
 drivers/staging/sm750fb/sm750.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index c237a8f8eb59..ee9ee2857f00 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -113,7 +113,7 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
 	cursor = &crtc->cursor;
 
 	if (fbcursor->image.width > cursor->maxW ||
-	    fbcursor->image.height > cursor->maxH ||
+	    fbcursor->image.height > cursor->max_h ||
 	    fbcursor->image.depth > 1) {
 		return -ENXIO;
 	}
@@ -723,8 +723,8 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		0x800f0 + (int)crtc->channel * 0x140;
 
 	pr_info("crtc->cursor.mmio = %p\n", crtc->cursor.mmio);
-	crtc->cursor.maxH = crtc->cursor.maxW = 64;
-	crtc->cursor.size = crtc->cursor.maxH * crtc->cursor.maxW * 2 / 8;
+	crtc->cursor.max_h = crtc->cursor.maxW = 64;
+	crtc->cursor.size = crtc->cursor.max_h * crtc->cursor.maxW * 2 / 8;
 	crtc->cursor.vstart = sm750_dev->pvMem + crtc->cursor.offset;
 
 	memset_io(crtc->cursor.vstart, 0, crtc->cursor.size);
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 23eefd019ec9..5556208f7178 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -123,7 +123,7 @@ struct lynx_cursor {
 	int size;
 	/* hardware limitation */
 	int maxW;
-	int maxH;
+	int max_h;
 	/* base virtual address and offset  of cursor image */
 	char __iomem *vstart;
 	int offset;
-- 
2.31.1

