Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24082612F
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 20:42:51 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id j26so2271215wms.0
        for <linux-staging@lists.linux.dev>; Fri, 09 Sep 2022 13:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :from:to:cc:subject:date;
        bh=DZugOTI9KxAAOxuZDWfK5HFNxfJINOMz8DoYNPEVrxE=;
        b=ho53l0n669p8mhv0vyXfuvlo39SXNN+natmOpHXqqJQYxoyhvAYIAd+Zb6fP7tspP1
         buQSRCiENg002YzUo39D2Hnmqw6/yDU17S/8vH3/BWNbsAXbwJsPz1CxGsFD2cx78r2C
         ro4+gHq7aYYx41ya+DjWMLL7ZyvStE44ZgVqo5i+zBhZtj7q3WJds5eWZ3dkQuehcPfb
         IDxlcAffcRnPXIDABcfeY2niDBl99MuGikH+cTwP8CgTCxEFmXwTbf0G0DGX3iMa3Cvx
         6V2rf5j43nvtfEwO4D49zqyrgro9OPffOj/V1FLCzpTqwvLzRAqxkjMr5U7MARJzrdHE
         OpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=DZugOTI9KxAAOxuZDWfK5HFNxfJINOMz8DoYNPEVrxE=;
        b=C7zRSI6kq0ioZDs7eV3Qeh4pNcDeXH9Aa1odykBD7I3bJcDr5ivfH4wqAJrVtbUFPi
         8JR4c4gk51XhO2/CqOz0q128FoWMDkAY1108aL9JI3pwMVWD7wOtMyhN9EnWY1xbBmEG
         JWYDECTopRCEUZzDWDTO3hYOa2DogiwDHxy/4sx/Ohoq5aPxM5jANDWEG5nAFwTnmTow
         WHm5x85J4e4NLoSmWQhCTd3qzr0nsuNMpzx5ndO3BGq8tBXXD/XqFEpck9VQZCLoLWxk
         CARZVp0UUHdi8hpFCnGN/Un2RdmA1NJdBMIMsi9U8UkXm91i2ihVk8AXF1KlSBAU/2u8
         vosg==
X-Gm-Message-State: ACgBeo0U2eyRgwvGWijDELP+h+31/WJVkWWc/qXrdVRHUrNpQH9JRs27
	zpUGCFmwUS4AzgYYjbmwXAA=
X-Google-Smtp-Source: AA6agR61J5kWXkCkMpitFRjVl6+WQkJ/+ibhMWFMoL0aIRqG1TFzeSF3UvnSkdliLmTh3PNinWvseg==
X-Received: by 2002:a7b:c016:0:b0:3a5:fff2:62f4 with SMTP id c22-20020a7bc016000000b003a5fff262f4mr6872914wmb.104.1662756169174;
        Fri, 09 Sep 2022 13:42:49 -0700 (PDT)
Received: from localhost ([176.42.22.250])
        by smtp.gmail.com with ESMTPSA id bh16-20020a05600c3d1000b003a60ff7c082sm1733254wmb.15.2022.09.09.13.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 13:42:48 -0700 (PDT)
Message-ID: <631ba548.050a0220.a64b3.5471@mx.google.com>
X-Google-Original-Message-ID: <YxvPZ+FCxWoTy4Pu@<DarkDistro>>
Date: Fri, 9 Sep 2022 23:42:31 +0000
From: Burak Ozdemir <bozdemir@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: sm750fb: Coding style clean up
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Burak OZDEMIR <bozdemir@gmail.com>

Adhere to coding style and fix camel casing in function name.

Signed-off-by: Burak Ozdemir <bozdemir@gmail.com>
---
 drivers/staging/sm750fb/sm750.c        | 2 +-
 drivers/staging/sm750fb/sm750_cursor.c | 2 +-
 drivers/staging/sm750fb/sm750_cursor.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 3e09e56d3930..a86222cdcb68 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -120,7 +120,7 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
 
 	sm750_hw_cursor_disable(cursor);
 	if (fbcursor->set & FB_CUR_SETSIZE)
-		sm750_hw_cursor_setSize(cursor,
+		sm750_hw_cursor_set_size(cursor,
 					fbcursor->image.width,
 					fbcursor->image.height);
 
diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm750fb/sm750_cursor.c
index 43e6f52c2551..d5ef40b8bc8e 100644
--- a/drivers/staging/sm750fb/sm750_cursor.c
+++ b/drivers/staging/sm750fb/sm750_cursor.c
@@ -58,7 +58,7 @@ void sm750_hw_cursor_disable(struct lynx_cursor *cursor)
 	poke32(HWC_ADDRESS, 0);
 }
 
-void sm750_hw_cursor_setSize(struct lynx_cursor *cursor, int w, int h)
+void sm750_hw_cursor_set_size(struct lynx_cursor *cursor, int w, int h)
 {
 	cursor->w = w;
 	cursor->h = h;
diff --git a/drivers/staging/sm750fb/sm750_cursor.h b/drivers/staging/sm750fb/sm750_cursor.h
index b59643dd61ed..edeed2ea4b04 100644
--- a/drivers/staging/sm750fb/sm750_cursor.h
+++ b/drivers/staging/sm750fb/sm750_cursor.h
@@ -5,7 +5,7 @@
 /* hw_cursor_xxx works for voyager,718 and 750 */
 void sm750_hw_cursor_enable(struct lynx_cursor *cursor);
 void sm750_hw_cursor_disable(struct lynx_cursor *cursor);
-void sm750_hw_cursor_setSize(struct lynx_cursor *cursor, int w, int h);
+void sm750_hw_cursor_set_size(struct lynx_cursor *cursor, int w, int h);
 void sm750_hw_cursor_setPos(struct lynx_cursor *cursor, int x, int y);
 void sm750_hw_cursor_setColor(struct lynx_cursor *cursor, u32 fg, u32 bg);
 void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
-- 
2.35.1

