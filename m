Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A03310E5;
	Mon, 20 Mar 2023 05:14:14 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id p13-20020a17090a284d00b0023d2e945aebso12649026pjf.0;
        Sun, 19 Mar 2023 22:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679289254;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XwohmK57i/90pCNr/XO2uCZZcnhhUHJXFuwW9Sz8iVM=;
        b=Q2aWrn5eHZ3nj5q0rTaVZZiRadPo5ih6lnO98OgIJFHdj0mN1yDXpPp0hThuWlZ9Sk
         /ZRPZvVd21n+Lq2tqqFVnrsstC5a/8gWYLwNlHb6o9Nsh3PuYLVD6NVfnuIS0P52wZoa
         FxnrXNNmUpNmp9t6QiagEVRwxe3In/Sp3FXWY807fvZVxdpKnRmKhki/VpexT1IkjD6e
         R3xBDOFCWRVGouca76lOKNqXqltjng7oVKLh/HipRJlflA3PuZkoJymnC7wNeP7JK5EU
         JzzakHPJi62HB5K6Gc3CJrmuaBnZzy1Kg6AFGULkJdOebTTWzwjrYDN0owHpk74WDRSH
         Gsig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679289254;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XwohmK57i/90pCNr/XO2uCZZcnhhUHJXFuwW9Sz8iVM=;
        b=Lah9Sz2PrBIKEifSKJAm6ddkhwKsnw99crp65ChAz2BEQdARv9mW4TT70IdboPOn9P
         VT5pW0O9i17TxWlw6L0c2UA3NQ/OxqL0muXe3y+YARVs6v6W2ukxMakvc4sjlORArnA8
         2mcCgYYmNc/urDNDCNmCKdM6nK8cCDmjsZi2oRH4Xhxx3WjQ/np/QFWzJdo19KEsNzl2
         +XXkllIVIcnilQoANmV4JrhrZ9M7FOV4Rk0rSt6o5zkFAiunpn+Zp0A/ZrFdrjHyhQAE
         8xgsRfA9Y9OrW/+Jy9eaeiWXLE5GlyUNyyf+AwChqtkeptVFR7/JGTBJbXQgaQ2tzJ/M
         JoVg==
X-Gm-Message-State: AO0yUKUt1Du+AMyDXnNxJwevHtszA2M9tepp0GXKos/RULpCQV2tL+dI
	AwU2Jx59jK4FWJxQ7c1WO7lBd4oE789DYdS/
X-Google-Smtp-Source: AK7set+r63vKirc/vKZYT8T/aDJJJ/np7SOCSoG9ZCvQyoCA79sYbQvWzbebmPMQiSxrYRIxdqNBYw==
X-Received: by 2002:a17:90a:1a01:b0:23d:39e0:13b with SMTP id 1-20020a17090a1a0100b0023d39e0013bmr17383093pjk.43.1679289254348;
        Sun, 19 Mar 2023 22:14:14 -0700 (PDT)
Received: from CloudiRingWorld ([125.121.39.5])
        by smtp.gmail.com with ESMTPSA id p7-20020a1709028a8700b001a1860da968sm5575096plo.178.2023.03.19.22.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 22:14:14 -0700 (PDT)
Date: Mon, 20 Mar 2023 13:14:11 +0800
From: Kloudifold <cloudifold.3125@gmail.com>
To: teddy.wang@siliconmotion.com, sudipm.mukherjee@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Subject: [PATCH v4] staging: sm750: Rename sm750_hw_cursor_* functions to
 snake_case
Message-ID: <ZBfro5U4s0lWA6tl@CloudiRingWorld>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Cc: linux-kernel@vger.kernel.org 
Bcc: 
Subject: [PATCH v4] staging: sm750: Rename sm750_hw_cursor_* functions to snake_case
Reply-To: 

sm750 driver has sm750_hw_cursor_* functions, which are named in
camelcase. Rename them to snake case to follow the function naming
convention.

- sm750_hw_cursor_setSize  => sm750_hw_cursor_set_size
- sm750_hw_cursor_setPos   => sm750_hw_cursor_set_pos
- sm750_hw_cursor_setColor => sm750_hw_cursor_set_color
- sm750_hw_cursor_setData  => sm750_hw_cursor_set_data
- sm750_hw_cursor_setData2 => sm750_hw_cursor_set_data2

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202303110849.X24WnHnM-lkp@intel.com/
Signed-off-by: Kloudifold <cloudifold.3125@gmail.com>

---
Changes in v4:
- Update the commit msg (Deepak)
- Use tabs replace 8 spaces

This v4 patch was prompted by 2 errors, 2 warnings and 1 checks reported
by the scripts/checkpatch.pl, which detected the style problem.

Changes in v3:
- Add this changelog (Philipp)
- Move lkp tags and link to the correct location in commit log (Alison)
- Update the commit msg (Philip)
- Update the commit log (Bagas, Julia)

Changes in v2:
- Use new function names in call sites (LKP)

 drivers/staging/sm750fb/sm750.c        | 22 +++++++++++-----------
 drivers/staging/sm750fb/sm750_cursor.c | 14 +++++++-------
 drivers/staging/sm750fb/sm750_cursor.h | 12 ++++++------
 3 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index effc7fcc3..5d7249e82 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -121,14 +121,14 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
 
 	sm750_hw_cursor_disable(cursor);
 	if (fbcursor->set & FB_CUR_SETSIZE)
-		sm750_hw_cursor_setSize(cursor,
-					fbcursor->image.width,
-					fbcursor->image.height);
+		sm750_hw_cursor_set_size(cursor,
+					 fbcursor->image.width,
+					 fbcursor->image.height);
 
 	if (fbcursor->set & FB_CUR_SETPOS)
-		sm750_hw_cursor_setPos(cursor,
-				       fbcursor->image.dx - info->var.xoffset,
-				       fbcursor->image.dy - info->var.yoffset);
+		sm750_hw_cursor_set_pos(cursor,
+					fbcursor->image.dx - info->var.xoffset,
+					fbcursor->image.dy - info->var.yoffset);
 
 	if (fbcursor->set & FB_CUR_SETCMAP) {
 		/* get the 16bit color of kernel means */
@@ -142,14 +142,14 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
 		     ((info->cmap.green[fbcursor->image.bg_color] & 0xfc00) >> 5) |
 		     ((info->cmap.blue[fbcursor->image.bg_color] & 0xf800) >> 11);
 
-		sm750_hw_cursor_setColor(cursor, fg, bg);
+		sm750_hw_cursor_set_color(cursor, fg, bg);
 	}
 
 	if (fbcursor->set & (FB_CUR_SETSHAPE | FB_CUR_SETIMAGE)) {
-		sm750_hw_cursor_setData(cursor,
-					fbcursor->rop,
-					fbcursor->image.data,
-					fbcursor->mask);
+		sm750_hw_cursor_set_data(cursor,
+					 fbcursor->rop,
+					 fbcursor->image.data,
+					 fbcursor->mask);
 	}
 
 	if (fbcursor->enable)
diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm750fb/sm750_cursor.c
index 43e6f52c2..ff643e33f 100644
--- a/drivers/staging/sm750fb/sm750_cursor.c
+++ b/drivers/staging/sm750fb/sm750_cursor.c
@@ -58,13 +58,13 @@ void sm750_hw_cursor_disable(struct lynx_cursor *cursor)
 	poke32(HWC_ADDRESS, 0);
 }
 
-void sm750_hw_cursor_setSize(struct lynx_cursor *cursor, int w, int h)
+void sm750_hw_cursor_set_size(struct lynx_cursor *cursor, int w, int h)
 {
 	cursor->w = w;
 	cursor->h = h;
 }
 
-void sm750_hw_cursor_setPos(struct lynx_cursor *cursor, int x, int y)
+void sm750_hw_cursor_set_pos(struct lynx_cursor *cursor, int x, int y)
 {
 	u32 reg;
 
@@ -73,7 +73,7 @@ void sm750_hw_cursor_setPos(struct lynx_cursor *cursor, int x, int y)
 	poke32(HWC_LOCATION, reg);
 }
 
-void sm750_hw_cursor_setColor(struct lynx_cursor *cursor, u32 fg, u32 bg)
+void sm750_hw_cursor_set_color(struct lynx_cursor *cursor, u32 fg, u32 bg)
 {
 	u32 reg = (fg << HWC_COLOR_12_2_RGB565_SHIFT) &
 		HWC_COLOR_12_2_RGB565_MASK;
@@ -82,8 +82,8 @@ void sm750_hw_cursor_setColor(struct lynx_cursor *cursor, u32 fg, u32 bg)
 	poke32(HWC_COLOR_3, 0xffe0);
 }
 
-void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
-			     const u8 *pcol, const u8 *pmsk)
+void sm750_hw_cursor_set_data(struct lynx_cursor *cursor, u16 rop,
+			      const u8 *pcol, const u8 *pmsk)
 {
 	int i, j, count, pitch, offset;
 	u8 color, mask, opr;
@@ -132,8 +132,8 @@ void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
 	}
 }
 
-void sm750_hw_cursor_setData2(struct lynx_cursor *cursor, u16 rop,
-			      const u8 *pcol, const u8 *pmsk)
+void sm750_hw_cursor_set_data2(struct lynx_cursor *cursor, u16 rop,
+			       const u8 *pcol, const u8 *pmsk)
 {
 	int i, j, count, pitch, offset;
 	u8 color, mask;
diff --git a/drivers/staging/sm750fb/sm750_cursor.h b/drivers/staging/sm750fb/sm750_cursor.h
index b59643dd6..88fa02f63 100644
--- a/drivers/staging/sm750fb/sm750_cursor.h
+++ b/drivers/staging/sm750fb/sm750_cursor.h
@@ -5,11 +5,11 @@
 /* hw_cursor_xxx works for voyager,718 and 750 */
 void sm750_hw_cursor_enable(struct lynx_cursor *cursor);
 void sm750_hw_cursor_disable(struct lynx_cursor *cursor);
-void sm750_hw_cursor_setSize(struct lynx_cursor *cursor, int w, int h);
-void sm750_hw_cursor_setPos(struct lynx_cursor *cursor, int x, int y);
-void sm750_hw_cursor_setColor(struct lynx_cursor *cursor, u32 fg, u32 bg);
-void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
-			     const u8 *data, const u8 *mask);
-void sm750_hw_cursor_setData2(struct lynx_cursor *cursor, u16 rop,
+void sm750_hw_cursor_set_size(struct lynx_cursor *cursor, int w, int h);
+void sm750_hw_cursor_set_pos(struct lynx_cursor *cursor, int x, int y);
+void sm750_hw_cursor_set_color(struct lynx_cursor *cursor, u32 fg, u32 bg);
+void sm750_hw_cursor_set_data(struct lynx_cursor *cursor, u16 rop,
 			      const u8 *data, const u8 *mask);
+void sm750_hw_cursor_set_data2(struct lynx_cursor *cursor, u16 rop,
+			       const u8 *data, const u8 *mask);
 #endif
-- 
2.40.0

