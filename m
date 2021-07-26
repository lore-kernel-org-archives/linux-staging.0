Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE3570
	for <linux-staging@lists.linux.dev>; Mon, 26 Jul 2021 13:16:52 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id o44-20020a17090a0a2fb0290176ca3e5a2fso6842659pjo.1
        for <linux-staging@lists.linux.dev>; Mon, 26 Jul 2021 06:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tKvZR1AeK2etahyjDlfPtU4YJhGm6x6glPkXtI2NAaA=;
        b=U49J3pSHmtIMW1xIjiWIVxKFZVdv3/nZj+kjYNwd+XzjiEBNcgR6D9uEejSxV8dlV5
         DOYTj2IWgewXV0QfFt62n7M3NWkBlI23QkFQlUppFr1yTrPWVbYUHcYUg3To6rLWIMZD
         1bkCnE2vo5b+Gvy/kQhzFYZZ45jfxUAiNyEnQndSNL8Y97TzqaBajnuTweTmlOEoyRjn
         +OMTtlhp8sv5dzWwRpN2PVleFxFhM2g1S8OiiwweXL2N6OrWXTlpraX+wd4TZ7yxmyra
         326BsyL2OwpLximb/BPRcHi3ho39b88lnECYhbcUAqyRT84NOlRF7U+dSb1eE6BezqCz
         aZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tKvZR1AeK2etahyjDlfPtU4YJhGm6x6glPkXtI2NAaA=;
        b=mAVU2IVQT4iWc/JDpaE4t9aq0s/F5+XdSmW2ho47I+CsF11hoRFE4YlV7hfyPwsDMb
         cM6mvm1uudTuksrPcgohsc1LVpLTdVlR91D5edfCTduiVRgqfXmbMMrGO/LiMc6LEoML
         SWd3yPGrMirrP6KQGi/ncXUQnME/vFAz6QHyZ9fujljrMKAEFzEPXZ4gDojinO8Q2p/X
         Ih4SnKcyGCPJMwg4oVFxWzQwxfHGDTcagCxkcEbSFp9qNz2l2VagqUB3IY6KCJbD+xWD
         1GdNBaiS+MHpZOIK4s86SxIr+y60fAPZ753+ZW4SFLXvPhPhyTTvDtUmnWkSTgP9H5rK
         Zd4w==
X-Gm-Message-State: AOAM531zqQeTu7YRUjDOb2hIvjj3Ey+UqF4g/k2gyP/1reGa4R7Y8w4l
	Tv0Xc7bIjTTsDQgNn3+vV1YNjKqhexHuIPu7
X-Google-Smtp-Source: ABdhPJxwY1HAUM1CXV+EQT5VI+spGgh/AfS/lkrXy6Bnrcax21qBEpAuoGxI5vqoF50Zajo4xxcNEQ==
X-Received: by 2002:a05:6a00:b46:b029:334:54db:af17 with SMTP id p6-20020a056a000b46b029033454dbaf17mr18049626pfo.26.1627305412250;
        Mon, 26 Jul 2021 06:16:52 -0700 (PDT)
Received: from localhost.localdomain ([2402:e280:2130:198:9b25:1cfb:9ff3:2a8f])
        by smtp.gmail.com with ESMTPSA id c12sm12070869pfl.56.2021.07.26.06.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 06:16:52 -0700 (PDT)
From: Benjamin Philip <benjamin.philip495@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Benjamin Philip <benjamin.philip495@gmail.com>
Subject: [PATCH 2/2] staging: sm750fb: Rename maxW to max_w in lynx_cursor
Date: Mon, 26 Jul 2021 18:45:02 +0530
Message-Id: <c0c84569b155df7b510a505a86863987836e192d.1627304144.git.benjamin.philip495@gmail.com>
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

The struct lynx_cursor has a member named maxW. This name is
CamelCase and is frowned upon. This commit renames it to max_w
and makes the necessary changes for the module to build.

This change also fixes the following checkpatch CHECK:

CHECK: Avoid CamelCase: <maxW>
115: FILE: drivers/staging/sm750fb/sm750.c:115:
+	if (fbcursor->image.width > cursor->maxW ||

Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
---
 drivers/staging/sm750fb/sm750.c        | 6 +++---
 drivers/staging/sm750fb/sm750.h        | 2 +-
 drivers/staging/sm750fb/sm750_cursor.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index ee9ee2857f00..4f5f68e6aa60 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -112,7 +112,7 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
 	crtc = &par->crtc;
 	cursor = &crtc->cursor;
 
-	if (fbcursor->image.width > cursor->maxW ||
+	if (fbcursor->image.width > cursor->max_w ||
 	    fbcursor->image.height > cursor->max_h ||
 	    fbcursor->image.depth > 1) {
 		return -ENXIO;
@@ -723,8 +723,8 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		0x800f0 + (int)crtc->channel * 0x140;
 
 	pr_info("crtc->cursor.mmio = %p\n", crtc->cursor.mmio);
-	crtc->cursor.max_h = crtc->cursor.maxW = 64;
-	crtc->cursor.size = crtc->cursor.max_h * crtc->cursor.maxW * 2 / 8;
+	crtc->cursor.max_h = crtc->cursor.max_w = 64;
+	crtc->cursor.size = crtc->cursor.max_h * crtc->cursor.max_w * 2 / 8;
 	crtc->cursor.vstart = sm750_dev->pvMem + crtc->cursor.offset;
 
 	memset_io(crtc->cursor.vstart, 0, crtc->cursor.size);
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 5556208f7178..8271cf7c89f3 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -122,7 +122,7 @@ struct lynx_cursor {
 	int h;
 	int size;
 	/* hardware limitation */
-	int maxW;
+	int max_w;
 	int max_h;
 	/* base virtual address and offset  of cursor image */
 	char __iomem *vstart;
diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm750fb/sm750_cursor.c
index bbbef27cb329..43e6f52c2551 100644
--- a/drivers/staging/sm750fb/sm750_cursor.c
+++ b/drivers/staging/sm750fb/sm750_cursor.c
@@ -97,7 +97,7 @@ void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
 	count = pitch * cursor->h;
 
 	/* in byte */
-	offset = cursor->maxW * 2 / 8;
+	offset = cursor->max_w * 2 / 8;
 
 	data = 0;
 	pstart = cursor->vstart;
@@ -147,7 +147,7 @@ void sm750_hw_cursor_setData2(struct lynx_cursor *cursor, u16 rop,
 	count = pitch * cursor->h;
 
 	/* in byte */
-	offset = cursor->maxW * 2 / 8;
+	offset = cursor->max_w * 2 / 8;
 
 	data = 0;
 	pstart = cursor->vstart;
-- 
2.31.1

