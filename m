Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4596D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:44:43 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id t23so6021160pjy.3
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v5F66A4CVLf0PCVKwwhgQWPfplNHHogpzp6J0Rowd60=;
        b=J+83Zbiiag6BpOcxsapxpcpjCFeBM7GFFXJ7MMoFNkOQCMOCajfwQGgfim/yMz0Xjt
         r/trgUh9QydkyOeFJcI/BZc2virqSs1viHTFxvfI7NZe0cYbSDqrBPHHzmDx6n3xqpoM
         7iduvXOrbE7tVdAq9UGLBTTwSCxIaBRnbc62ws0d/RTJoPt5joGBvs9xIguZqxyZ3lsw
         6bCdTnUTj/tFQvvJqsFWlLqV8neyHLzoOM/njFTZn/3e7JPeTm4TN2RyaBVTWuw9A7+9
         sZdvSHAdOCShuJvMkLf676LEssxQxskJJTIAg/HOK6GJbp863xGhS6Amb7LR/6A3bBZu
         qHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v5F66A4CVLf0PCVKwwhgQWPfplNHHogpzp6J0Rowd60=;
        b=tk6eTFODqTOl3KyWBza/KyD+oJs4qpZNmYfDy7nZZgTuXzsYYEtplxdxBVMT0iXcLZ
         tWylq5B8kFyMEfpvDX+M0+zTMwi0BPG7TgTIUgjOqq3Uddv8yNJbJqqCg8ha29XPEBsL
         6JFSIyAmTGzth2/6S7Be0eQyiWfzrzT7ySIP/+Skgg10B3MdLrVIbjASlkhIucVHFrWs
         BIJHb41S+HVnxq18JL4WUFmgK75nj8FIQ6AeXM0IxjxoDcYT+pdqLkkpBaMDA/UccjqH
         +f2RYw4ubiahICOf7f7REzdMornR+E0YdI5zmxI5lyv6uhdOxuEPE6hlc3BKQi4HYxWA
         ENDQ==
X-Gm-Message-State: AOAM530uh2CblPyJHJV84M4iccgN4ilJUXp15D1rkOPlpuE10ayDHVrs
	RGKsTNiI/21IrXujgexA9EI=
X-Google-Smtp-Source: ABdhPJz+XXWB75AReec2tP6DygxwX83W/w/NAB6x50T3Tg926mjmOGn4LbRYExRzqS4N1RCtTls18A==
X-Received: by 2002:a17:90b:1993:: with SMTP id mv19mr1869403pjb.193.1617777883018;
        Tue, 06 Apr 2021 23:44:43 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id s9sm3816977pfc.192.2021.04.06.23.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:44:42 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:44:40 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 33/49] staging: sm750fb: Rename function
 hw_sm750_crtc_setMode to snake case
Message-ID: <db83765fac5956430ffc87118a6a667c45377665.1617776878.git.pavle.rohalj@gmail.com>
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
hw_sm750_crtc_setMode.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    | 2 +-
 drivers/staging/sm750fb/sm750.h    | 2 +-
 drivers/staging/sm750fb/sm750_hw.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 9263d4bdd222..2343cd897989 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -393,7 +393,7 @@ static int lynxfb_ops_set_par(struct fb_info *info)
 		pr_err("bpp %d not supported\n", var->bits_per_pixel);
 		return ret;
 	}
-	ret = hw_sm750_crtc_setMode(crtc, var, fix);
+	ret = hw_sm750_crtc_set_mode(crtc, var, fix);
 	if (!ret)
 		ret = hw_sm750_output_setMode(output, var, fix);
 	return ret;
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 8271cf7c89f3..6e0805a99180 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -204,7 +204,7 @@ int hw_sm750_output_setMode(struct lynxfb_output *output,
 int hw_sm750_crtc_checkMode(struct lynxfb_crtc *crtc,
 			    struct fb_var_screeninfo *var);
 
-int hw_sm750_crtc_setMode(struct lynxfb_crtc *crtc,
+int hw_sm750_crtc_set_mode(struct lynxfb_crtc *crtc,
 			  struct fb_var_screeninfo *var,
 			  struct fb_fix_screeninfo *fix);
 
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index e31f4c6bc69e..efe379ef3438 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -247,7 +247,7 @@ int hw_sm750_crtc_checkMode(struct lynxfb_crtc *crtc,
 }
 
 /* set the controller's mode for @crtc charged with @var and @fix parameters */
-int hw_sm750_crtc_setMode(struct lynxfb_crtc *crtc,
+int hw_sm750_crtc_set_mode(struct lynxfb_crtc *crtc,
 			  struct fb_var_screeninfo *var,
 			  struct fb_fix_screeninfo *fix)
 {
-- 
2.30.2

