Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E5B808
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 11:29:02 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id lz22so3280568ejb.3
        for <linux-staging@lists.linux.dev>; Fri, 09 Sep 2022 04:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :from:to:cc:subject:date;
        bh=dl2woc6VxZxBG9PRHSyadBOfV8W4AihZHiXdGtwtKZk=;
        b=qyhZ3Lqk9YmDSbdq46SeszDEhNnUJGy1kd/Eii8q/jkN8+HHZKX7+TfYfrk+Fwsm3l
         3BCY+AraYvu9CQt1MpnbxXxBfZCqYkMCJ21WYviN8UvEgd2nJyL8MiqHxpa7JN7bPuU5
         9VDSorxTY96vvzFepULa15xSpzi5p6igLh3beppYZV/70zJFHYnLlBQcWfMU6UZQ/Rtu
         +vx9Mck6CXhcaZtgXHRWQv4d1PYrBAK4ihh1QCWSE91HrgsT8cEN/nCDKFCnWSorlzPL
         B/am96bP9BKbNHy+A36SsF59ulpapavktHz5kxkbzb6pcDEjyOB4wkPmUAjCLT+X5VKj
         lEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=dl2woc6VxZxBG9PRHSyadBOfV8W4AihZHiXdGtwtKZk=;
        b=E50XLn+i6qgXIlyb8+NfZ2EiwhjNCiFocDu0XBey1AUKfQCO5jn3ou7G1wuy8S4txH
         o8jFKIryL8i+E2F+2hyBYSi0gtpLWjrv3IY8u5PE4/BPm1iPYnxvZDp2n+KVLxRTrX3s
         Nr/kk4TemMXw9g7lRg4x+YshJAiphWaDKIpirSXcqRJXmPH1VBpAtufFdKKt84scyGJS
         PLGNhOaiDtGHMf+zjHzAU3gQXp8xdOxnOrpbTMHOnoylFwcsXFHPd1GdoK1+dSHy/MNw
         ps9c8MPpMTn5kopguLGVqkKLlVqzN7fyog4wMtbM64CBB1AnbqiAKlOZrZfJYcr1y5Bk
         EYfg==
X-Gm-Message-State: ACgBeo1CPM1uNE1hgZajaELDdL2ywIXomUcQrj5mHwGWz4OwOMs7AtvP
	A0qgxUX/Vu8AyI5+qM/Vog0=
X-Google-Smtp-Source: AA6agR7txTvJieNQLG2Ek1WmWlvmgJNiEqXiWKf4wl5I9uI/ARQ//cqOjuc+E+gk6Ex8WDZniTl6JA==
X-Received: by 2002:a17:907:1c1e:b0:741:8abe:320e with SMTP id nc30-20020a1709071c1e00b007418abe320emr9838802ejc.123.1662722940989;
        Fri, 09 Sep 2022 04:29:00 -0700 (PDT)
Received: from localhost ([89.40.126.93])
        by smtp.gmail.com with ESMTPSA id os23-20020a170906af7700b00730860b6c43sm130758ejb.173.2022.09.09.04.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 04:29:00 -0700 (PDT)
Message-ID: <631b237c.170a0220.aed56.04f5@mx.google.com>
X-Google-Original-Message-ID: <YxtNoWt74SjNbrsF@<DarkDistro>>
Date: Fri, 9 Sep 2022 14:28:49 +0000
From: Burak Ozdemir <bozdemir@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: sm750fb: Coding style clean up
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

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

