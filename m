Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFC56D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:44:32 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id d10so7430056pgf.12
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6p8ZANqd/RqsWjSImmd+1sF92/GqWhRbXBxvKnMm8Pg=;
        b=jV4m0l4ZmxdtJzwPsVyZjRIfDdmI8j5RZhoa/zDJAGovAhwpeq7vTBXKWw2R8FGgT7
         4h5V3TxuCQ/tx9xQCE3LwD/S0QZhKI2zMN1S87dpLCVZH4kKT9RfIP4FGrxGI6+/PrHt
         Wel2RMXwRjGPuWIEmWnFJ14EABXdt8Qp4mynEr8aGhGBfy8j0kPW6Gth6J0qTXcsV9Ti
         8y5xl9yMQoIRlZ0PxtJ/7UUTUsMwQM6cVEOYasdCuGJ5NvJrxbI/4l8ukwIcHz8gze2e
         RmcQWwc+aott8c3KLTYJocgDasuP1bUab2AsUq6t7f1Sxm+U++S5cHAwB4sCdJuQ/SdK
         J4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6p8ZANqd/RqsWjSImmd+1sF92/GqWhRbXBxvKnMm8Pg=;
        b=k8xu/kFn3cwHpV8MHfe1a5inydxR+KhTwbDp4c3ylOTIQ7agj28YDWJ6Oa/RR/Y4Dq
         BfgO3dOdfN3Tpw+Wo2JS3GSELNlhXWTeEbmBXBvochBDQ1VgJF5ZIGPrH0va4zM7Fvz+
         qkDW5SvOSVBVG5xooK0VdMpKfxJMiOq7yln2O+LgqH+mfcp9RjWSDbRLXA3ygtN42weW
         tT059vd5iIZJnaoHfpW2cOBQoUgiL3vH/a+3Q6BMGfqfYlor2omJlQ1GJEJIAkHmbww9
         96QqqR3dNByt9YFx8Dd+OSypdJQ4JV13RIRtJaWu1V1n3OVXWTroeIMIP9LvUYb83f3S
         o8mA==
X-Gm-Message-State: AOAM530GkCObEYiSjjcSG3qxQg71v33Qu2y1Tth1BkVSJfVonkQZlQ6v
	Jrh9tBgg65tD3reN5tNTT8k=
X-Google-Smtp-Source: ABdhPJyFmpsftdsYmNluBQreMHb0XqH5cpB/EVFcvW9RKRwrT0uyXBG66Mq1jUNM4Of1+X3Z6Wmm2Q==
X-Received: by 2002:a63:c847:: with SMTP id l7mr1919574pgi.445.1617777872126;
        Tue, 06 Apr 2021 23:44:32 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id l191sm4313761pfd.36.2021.04.06.23.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:44:31 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:44:29 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 32/49] staging: sm750fb: Rename function
 sm750_hw_cursor_setData to snake case
Message-ID: <3df59f311d53a8d0dba7cc8a9704b036d34c5a7d.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpatch.pl checks for the function
sm750_hw_cursor_setData.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/sm750.c        | 2 +-
 drivers/staging/sm750fb/sm750_cursor.c | 2 +-
 drivers/staging/sm750fb/sm750_cursor.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index d93884f9da7f..9263d4bdd222 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -145,7 +145,7 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
 	}
 
 	if (fbcursor->set & (FB_CUR_SETSHAPE | FB_CUR_SETIMAGE)) {
-		sm750_hw_cursor_setData(cursor,
+		sm750_hw_cursor_set_data(cursor,
 					fbcursor->rop,
 					fbcursor->image.data,
 					fbcursor->mask);
diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm750fb/sm750_cursor.c
index ac83ead1c5bc..98d294ac223c 100644
--- a/drivers/staging/sm750fb/sm750_cursor.c
+++ b/drivers/staging/sm750fb/sm750_cursor.c
@@ -82,7 +82,7 @@ void sm750_hw_cursor_set_color(struct lynx_cursor *cursor, u32 fg, u32 bg)
 	poke32(HWC_COLOR_3, 0xffe0);
 }
 
-void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
+void sm750_hw_cursor_set_data(struct lynx_cursor *cursor, u16 rop,
 			     const u8 *pcol, const u8 *pmsk)
 {
 	int i, j, count, pitch, offset;
diff --git a/drivers/staging/sm750fb/sm750_cursor.h b/drivers/staging/sm750fb/sm750_cursor.h
index edfa6a8202cd..af0211242ae8 100644
--- a/drivers/staging/sm750fb/sm750_cursor.h
+++ b/drivers/staging/sm750fb/sm750_cursor.h
@@ -8,7 +8,7 @@ void sm750_hw_cursor_disable(struct lynx_cursor *cursor);
 void sm750_hw_cursor_set_size(struct lynx_cursor *cursor, int w, int h);
 void sm750_hw_cursor_set_pos(struct lynx_cursor *cursor, int x, int y);
 void sm750_hw_cursor_set_color(struct lynx_cursor *cursor, u32 fg, u32 bg);
-void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
+void sm750_hw_cursor_set_data(struct lynx_cursor *cursor, u16 rop,
 			     const u8 *data, const u8 *mask);
 void sm750_hw_cursor_setData2(struct lynx_cursor *cursor, u16 rop,
 			      const u8 *data, const u8 *mask);
-- 
2.30.2

