Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3696BC957;
	Fri, 10 Mar 2023 21:33:06 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id c4so4534827pfl.0;
        Fri, 10 Mar 2023 13:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678483985;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MoaC0QiQ/9QcOQ36YWPBiC9jUnAlg67n+4UaCtTxLVw=;
        b=bLxj6b7Qgt9s1e3O4FjFVTogIcSBM18UR17GYQs72arAv4JZHt5b46HYRzakpM7+1G
         MpBv3mpmwkLgfEKcv58MrYMXQz91SCemZqOoYDZjY4BMwbcTtF2XzDpN9oC/+mRqitOm
         6ma7gU7I41xeCJFjnnzfhhnl6Vj09TydFqoVE6S7yl3wAgWYloi4730Pk0WAv2q+I899
         Zatoa6VWRzgpSiGdFppU/9sjezH1NsKWnbo+FElccAuq59DnRdwPxyCbk+90eG0sKtes
         74RlW5wHsQFrjtO5r21o+mvVZxy23kRPW/Lx/wLszZAGS9UlDRPuqVsTx/8M38rDqDs0
         tSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678483985;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MoaC0QiQ/9QcOQ36YWPBiC9jUnAlg67n+4UaCtTxLVw=;
        b=y2yBed+uoHxQ+5UyEhT/MwAcH+uSbZjHphno5A7w52ekQgydGP371xio9HuYaI1kNP
         Y3vNr4Cd5ecRWJBD3iDVE/NPkdHsouIHXnwyYG/KmInqRb9kuqoubiP+u+GCojv561kW
         Drm5PZgqHyoQ7Ioyyz5I42224YQQnajVP4yzjr/ng4ehQfFSZR60uCaBNtJjUwm8eMNn
         Uq+67sN5CfpB5AXht+LN7WWvcIpZznsDu2UsOVE/7baW1q2sBEBz55ZkIhoPBQm0vAU5
         ilnIYpD/mHxONA+pMgAxItSbwko4TyIPT7oW0Le++0jyBGbTSkoCSma7gJ6LV9fWWpQ7
         Zt0w==
X-Gm-Message-State: AO0yUKVjk4gIkOh7/uhfsrW7DM6EhkSHGo5uWAPR8YI/JsvS8E0qa+G1
	Ecdla4hvqKWmCD+M6d47ars=
X-Google-Smtp-Source: AK7set/seiXL46DulSZFllvj/Q29a2aaDl7sexo6g7bgSAEdGr+iYL92z7JkeIq2vEWkYuwGMQXZrA==
X-Received: by 2002:aa7:941d:0:b0:5ce:ef1b:a86 with SMTP id x29-20020aa7941d000000b005ceef1b0a86mr24480973pfo.2.1678483985579;
        Fri, 10 Mar 2023 13:33:05 -0800 (PST)
Received: from CloudiRingWorld ([122.231.69.163])
        by smtp.gmail.com with ESMTPSA id h3-20020aa786c3000000b005cc52ea452csm243525pfo.100.2023.03.10.13.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:33:05 -0800 (PST)
Date: Sat, 11 Mar 2023 05:33:01 +0800
From: Kloudifold <cloudifold.3125@gmail.com>
To: teddy.wang@siliconmotion.com, sudipm.mukherjee@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] staging: sm750: Rename camel case functions in sm750_cursor.*
Message-ID: <ZAuiDTDT8dmBcRoH@CloudiRingWorld>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch fixes the "CHECK: Avoid CamelCase" reported by
checkpatch.pl by renaming camel case functions.

Signed-off-by: Kloudifold <cloudifold.3125@gmail.com>
---
 drivers/staging/sm750fb/sm750_cursor.c | 14 +++++++-------
 drivers/staging/sm750fb/sm750_cursor.h | 12 ++++++------
 2 files changed, 13 insertions(+), 13 deletions(-)

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
2.39.2

