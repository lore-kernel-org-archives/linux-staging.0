Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600806D11
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:43:46 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id m11so9552242pfc.11
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ud5Lzp79k1SGUuv+EiKNbNuFA/5+lE3CGchvKku3uIE=;
        b=iJkwBi7KVbyZYS9GfX0BYQ91VreWjBOm8zpdIIlzLlF3Ry9LHDAcwS6uCbzrtlwzVO
         O6P//6QInNKwmD/t9RPVEZx9rR02xxPqpSGP5ruuQddvo5izBtQLh2FfbtHhMTXOtg4M
         92K4fjg30GwsFx+D1FiAVCCnwwfoFF+YIWFfcqjsX9/YJxuqEagqqpju5wV5CBeCtwbJ
         VyoXFnEZW5qKcrMsQkrwxYrwemMg0WPhUsef2ZCfKOhEAGaOyxWZIqBN4OTGPgNIznHi
         P0FZ+scia1jCQl9rd5JRaNv0//YaDXThk4BQuyvGMQyomtzFL1jUy62VLsTMV8qng45F
         66OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ud5Lzp79k1SGUuv+EiKNbNuFA/5+lE3CGchvKku3uIE=;
        b=goMPtn33yito6W+waayNQo+cteWZSOJLgtJODakhzj/1NexR13stM7gUKc4udzh75L
         MvrLitXLhfIFhXEwUDQDuSSgscuy0U3BIt8t0UzoMpOu1+zpMOdVCJ0+pCMf9rD6AeqP
         Bf4fsBraLfdGlUlSGASPoHOPoJwIKM6rJEyn9ir+NOqcHoMHGim2qYKlqjKH+rP+NOyb
         ySQaGwynxogaY+B+tyjLV78QwNK86PHSxtlrhK1QFS3PJg5i3vS/u8OCvayWEqAIYzrV
         R5qBsTVCDoF16dl/ORhGOK5mIqzrGbAS2tT+tU21m99MpVf7XgbLmvn1qfSyFoQJx1dT
         syMQ==
X-Gm-Message-State: AOAM531nA9H3FWcGLt2lZiQ+X4Er4vaVI12zetfIa5Yx42l8WaqvNE89
	Bz7AwVsm2+LCc6vm/jp+BJU=
X-Google-Smtp-Source: ABdhPJwiGXyAMRtVFst8y5vF7NeRJzg5ktr1IulCzxwSMwUNmxjCn4VFmNbLLH9kTYxuRPqh0iZbjg==
X-Received: by 2002:a63:390:: with SMTP id 138mr1978644pgd.8.1617777825923;
        Tue, 06 Apr 2021 23:43:45 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id p17sm19778622pfn.62.2021.04.06.23.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:43:45 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:43:43 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 28/49] staging: sm750fb: Update members of lynx_cursor to
 snake case
Message-ID: <b9f4e37adf0d973c2ce8566dd8bf48394a42a33c.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpatch.pl checks for the members
of lynx_cursor structure, in particular maxW and maxH.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/sm750.c        | 8 ++++----
 drivers/staging/sm750fb/sm750.h        | 4 ++--
 drivers/staging/sm750fb/sm750_cursor.c | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index c237a8f8eb59..4f5f68e6aa60 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -112,8 +112,8 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
 	crtc = &par->crtc;
 	cursor = &crtc->cursor;
 
-	if (fbcursor->image.width > cursor->maxW ||
-	    fbcursor->image.height > cursor->maxH ||
+	if (fbcursor->image.width > cursor->max_w ||
+	    fbcursor->image.height > cursor->max_h ||
 	    fbcursor->image.depth > 1) {
 		return -ENXIO;
 	}
@@ -723,8 +723,8 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		0x800f0 + (int)crtc->channel * 0x140;
 
 	pr_info("crtc->cursor.mmio = %p\n", crtc->cursor.mmio);
-	crtc->cursor.maxH = crtc->cursor.maxW = 64;
-	crtc->cursor.size = crtc->cursor.maxH * crtc->cursor.maxW * 2 / 8;
+	crtc->cursor.max_h = crtc->cursor.max_w = 64;
+	crtc->cursor.size = crtc->cursor.max_h * crtc->cursor.max_w * 2 / 8;
 	crtc->cursor.vstart = sm750_dev->pvMem + crtc->cursor.offset;
 
 	memset_io(crtc->cursor.vstart, 0, crtc->cursor.size);
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 23eefd019ec9..8271cf7c89f3 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -122,8 +122,8 @@ struct lynx_cursor {
 	int h;
 	int size;
 	/* hardware limitation */
-	int maxW;
-	int maxH;
+	int max_w;
+	int max_h;
 	/* base virtual address and offset  of cursor image */
 	char __iomem *vstart;
 	int offset;
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
2.30.2

