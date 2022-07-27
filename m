Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47060A3D
	for <linux-staging@lists.linux.dev>; Wed, 27 Jul 2022 07:08:24 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id l14so12062588qtv.4
        for <linux-staging@lists.linux.dev>; Wed, 27 Jul 2022 00:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=streamunlimited.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pyyO3i1v16awzlQfFzZWgMicARjUE5W8d3bIsv/OgNE=;
        b=mJFiwyzHl75IMZ8ucjWQXx6hvsV4XWr5nHjqYFHrjRKyhGKgh948OvOKF9+y/ZtevT
         YbF6R8O855DD/LtEHZ0KY8BQp4g1HgHeCgi7TTPXNf06zAOr+EoSi5Q5o2EIBggI78H+
         JLRduYEAy2fDKRwMjhOkzuziXSGvbHXLj2+uM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pyyO3i1v16awzlQfFzZWgMicARjUE5W8d3bIsv/OgNE=;
        b=m/WaLYDjvX8zFZES59MR9HQZgUCJ8yoGh37Y+yBLfaR8JWpu9PEKV+PCeYbuTR7dUh
         BJuaVtSx9Tq/jJi+BZywS5ULMXS8quH+SwUgcpf5NKQyvA8KoWYtOegYKpWE+mWIxVp2
         Ww+hWZgCmwyKBrWWjFXQQZ582dijf9FX+03+bzu3POTZYmAlwi1E/Hcwcd0ZmIiXeSez
         x1NBOEzja0Uu9CYcceW8Dyex84mqcK5CLjQDOUglPLrF6vy0F6UQVs8ekN3J1Xwfqu7M
         vL2coGWIWP9I8vW1jFEXstwmKtWCRj7UU3MNajgDAbIW1j2ki/49B0Cd4FP9+6Noijxp
         NJMg==
X-Gm-Message-State: AJIora/EmlidY0YZOM3NU6H1zP42XV3SeYq2iDh0UI3gQuoWz0EmzLdZ
	DZFP8JlP/wiOMErsxFkBFo6ySA==
X-Google-Smtp-Source: AGRyM1sKKtleTGian1VChNl553V9Yw0pvi8UIZxWLqXfq44/w+W/AU43ZicsJpg0Tc6g6tlY2AolQw==
X-Received: by 2002:a05:622a:44e:b0:31f:4cf7:3abc with SMTP id o14-20020a05622a044e00b0031f4cf73abcmr31806qtx.124.1658905703974;
        Wed, 27 Jul 2022 00:08:23 -0700 (PDT)
Received: from localhost.localdomain (vpn.streamunlimited.com. [91.114.0.140])
        by smtp.gmail.com with ESMTPSA id f14-20020a05620a280e00b006b5bf5d45casm12585198qkp.27.2022.07.27.00.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 00:08:23 -0700 (PDT)
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
Subject: [PATCH v2] staging: fbtft: core: set smem_len before fb_deferred_io_init call
Date: Wed, 27 Jul 2022 09:07:23 +0200
Message-Id: <20220727070723.1489599-1-peter.suti@streamunlimited.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726161347.GR2338@kadam>
References: <20220726161347.GR2338@kadam>
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

