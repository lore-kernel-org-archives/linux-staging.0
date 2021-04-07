Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CCA6D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:46:13 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id t22so5134587pgu.0
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=m074W+fFkEnWYNx+xHLavlSpN4uemXZiY3b+q0HiAUU=;
        b=FHU0blh6RjBM8BtMRLL9ChwDZ32YGDEWkaMi3L7+Pgl7h99c9/lsrEmPf0k6rnXSxT
         emdtWz7SMBTt6gegFBrrR8hsNfyrDFLYueDsRVGLqelYXV36q6nC83vgmJspou5sK60D
         GuJUkhvnKn8HFlLofTUSE3kv6chHp7nuYNKfnmeBpLBz7F1Ji9hXEL7osG1ONDjTImP0
         2qj7JnoQ6X5AyxbFR2xtI85PDtsrQVVcXtfWdJin6NmCjYPeZ/WajH820G32HtQV+1RX
         sdIMI3GQ2/6Q/9N7vORHMsqTkVu1AOipzLoJMIn/5zsjeFgG4xTyuXj5CIG+YyMq/nm8
         95WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m074W+fFkEnWYNx+xHLavlSpN4uemXZiY3b+q0HiAUU=;
        b=Oxkxgwe2CDT4d1HMsQAfR04cWuxRJEEgxxYA5t+B8wVanY1PRUEnVmq0KSxDANK6AA
         25zENK1o0Lnm4+G+OfWJluxKfcrH7DrcHyTB12BLw6GhnG00liYMz5xKv5D04f8HgBOO
         PkyPoVSlDFHnamaAQ0oZ/1lgPTyYK+ey+3zLH19oe7Dn6NGNagV2a/jR1mLM+fnZrbMO
         IpvktyfzrqDSFLqtqJM3pLGVM7+mTTUvCNKUv7a+5bbeVgdMuGI2I9OFvJ3l5GGXW1in
         MXtXR/uWvWF22w3kZrdLTEsQEAU1fuAJEnUPWDJ8SXsfRtUwDTcrZMF4nEzMXA4rEQCw
         Xx6g==
X-Gm-Message-State: AOAM531gE6YMWW9WI7esM/gsF00Qjiiik764Gf1zThcDzu4pO9RaIkKG
	AI6aM5K8LDG1FzZaRGRue9RZojIOvI5PMA==
X-Google-Smtp-Source: ABdhPJx6IPOkk0HkagSvLJIsZglNVauGdjjn7nSK6ZyfeI0lP0SWEnafiKYcC/WDk3q1snSmaBT4TQ==
X-Received: by 2002:aa7:9394:0:b029:1f4:2b30:4cdb with SMTP id t20-20020aa793940000b02901f42b304cdbmr1563635pfe.50.1617777973359;
        Tue, 06 Apr 2021 23:46:13 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id e3sm20476007pfm.43.2021.04.06.23.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:46:12 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:46:10 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 47/49] staging: sm750fb: Rename proc_setBLANK member of
 lynxfb_output struct
Message-ID: <4ac1f3b8295e4f6e2c82a2508a0742bf0b490ef4.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpatch.pl check for proc_setBLANK member of
lynxfb_output structure.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 4 ++--
 drivers/staging/sm750fb/sm750.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 937a44530fbf..0c6bfbedde50 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -577,7 +577,7 @@ static int lynxfb_ops_blank(int blank, struct fb_info *info)
 	pr_debug("blank = %d.\n", blank);
 	par = info->par;
 	output = &par->output;
-	return output->proc_setBLANK(output, blank);
+	return output->proc_set_blank(output, blank);
 }
 
 static int sm750fb_set_drv(struct lynxfb_par *par)
@@ -605,7 +605,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 	crtc->ypanstep = 1;
 	crtc->ywrapstep = 0;
 
-	output->proc_setBLANK = (sm750_dev->revid == SM750LE_REVISION_ID) ?
+	output->proc_set_blank = (sm750_dev->revid == SM750LE_REVISION_ID) ?
 				 hw_sm750le_set_blank : hw_sm750_set_blank;
 	/* chip specific phase */
 	sm750_dev->accel.de_wait = (sm750_dev->revid == SM750LE_REVISION_ID) ?
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 2e6481809d43..06cf136fa28c 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -170,7 +170,7 @@ struct lynxfb_output {
 	 */
 	void *priv;
 
-	int (*proc_setBLANK)(struct lynxfb_output *output, int blank);
+	int (*proc_set_blank)(struct lynxfb_output *output, int blank);
 };
 
 struct lynxfb_par {
-- 
2.30.2

