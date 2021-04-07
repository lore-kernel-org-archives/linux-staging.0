Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC42C6D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:46:02 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id v8so8827482plz.10
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RuREhl/6r10Ul/aj5kYlhGySoHbzCHI5JHMjmbOPC1k=;
        b=mnBY/ZNujoLmuROjHLZ9tSCR/DZDxFQquNW1LET3jthFDTWzg6gex9lffVXFltJP4s
         ZPZ0tMCROCdMEa/R6DKY3Nbe0A/jt8Q0in3XjQZoa1dh3rOXEEm9F8iLDGVvbhACNG28
         k8w2DesvE1+yCySAKzpG+GnsNEi4tDEKz85T2hPOR3GDIMhcTqzZHnztI/O1Ht+WLkBb
         c6n9xTC/rXdFuJL1Yw02EB8ldI1VkrFvk+1FediLwkCPq3K24sijsGp3IAgNHMCjThKm
         2TCqhNV8mCYTOFQu31LpS3Xo3+ozV9m10to76RrBLH2t19Qb4JgzGwtZ8SsRyv644hrY
         jzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RuREhl/6r10Ul/aj5kYlhGySoHbzCHI5JHMjmbOPC1k=;
        b=P60oF40EjxC/QRn1Msd2gv4yMVQwJVdnUBGr4kdenLqwZiyu/C954h1TLq0HAIhD3F
         9bZjceU3+mmr4b1Ze/ePjX0MBd6/q+N05VfGC+4AjuexLwjTT8k/fhS4nG2beKe0nxVR
         On84fcKr+X7y3Xa3/V6zHZZ5HDL9I3lOzRL5mYpZQUEoxrvrRBgVW8BQ94jyT10O0HWS
         x5elTop0vLwdelmoWO/73+LeRsPENy5yiL5FPyWHjpHxXopApBwb8vWNG93cqwGPXhyq
         q+PbYJ1k3Ip913twH49Nom+8QfkUIdJnfoQfiixJZ+e5QKQqh7pISZ2rJaluUSUXd0D9
         n45A==
X-Gm-Message-State: AOAM530lcT1RT15Owml/yiEK1OPZzqXDocgi9hd52UvdnZSVbrjsL/za
	UXWhifXQ5pJfbYjnAMmAo50=
X-Google-Smtp-Source: ABdhPJwValtxEqyXA2Z/HAUme9fwOnwBPtVfz9kJYomrVchhuDMQuF2DvVqf1hNjmn4KLPUBIuuGGg==
X-Received: by 2002:a17:903:189:b029:e5:d7c3:a264 with SMTP id z9-20020a1709030189b02900e5d7c3a264mr1815902plg.6.1617777962492;
        Tue, 06 Apr 2021 23:46:02 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id 12sm19779641pgw.18.2021.04.06.23.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:46:02 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:46:00 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 39/49] staging: sm750fb: Rename functions *_setBLANK to
 snake case
Message-ID: <1022013daf6d3985becbdab8b59ed17790fec431.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpatch.pl checks for the functions
hw_sm750_setBLANK and hw_sm750le_setBLANK.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    | 2 +-
 drivers/staging/sm750fb/sm750.h    | 4 ++--
 drivers/staging/sm750fb/sm750_hw.c | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 62c9a8c5de8f..05f3a1d454db 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -606,7 +606,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 	crtc->ywrapstep = 0;
 
 	output->proc_setBLANK = (sm750_dev->revid == SM750LE_REVISION_ID) ?
-				 hw_sm750le_setBLANK : hw_sm750_setBLANK;
+				 hw_sm750le_set_blank : hw_sm750_set_blank;
 	/* chip specific phase */
 	sm750_dev->accel.de_wait = (sm750_dev->revid == SM750LE_REVISION_ID) ?
 				    hw_sm750le_deWait : hw_sm750_deWait;
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 71b4ce05f4fe..7347be7dcded 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -211,8 +211,8 @@ int hw_sm750_crtc_set_mode(struct lynxfb_crtc *crtc,
 int hw_sm750_set_col_reg(struct lynxfb_crtc *crtc, ushort index,
 		       ushort red, ushort green, ushort blue);
 
-int hw_sm750_setBLANK(struct lynxfb_output *output, int blank);
-int hw_sm750le_setBLANK(struct lynxfb_output *output, int blank);
+int hw_sm750_set_blank(struct lynxfb_output *output, int blank);
+int hw_sm750le_set_blank(struct lynxfb_output *output, int blank);
 int hw_sm750_pan_display(struct lynxfb_crtc *crtc,
 			 const struct fb_var_screeninfo *var,
 			 const struct fb_info *info);
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 7eae56b74a2b..87d2b82f0880 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -382,7 +382,7 @@ int hw_sm750_set_col_reg(struct lynxfb_crtc *crtc, ushort index,
 	return 0;
 }
 
-int hw_sm750le_setBLANK(struct lynxfb_output *output, int blank)
+int hw_sm750le_set_blank(struct lynxfb_output *output, int blank)
 {
 	int dpms, crtdb;
 
@@ -423,7 +423,7 @@ int hw_sm750le_setBLANK(struct lynxfb_output *output, int blank)
 	return 0;
 }
 
-int hw_sm750_setBLANK(struct lynxfb_output *output, int blank)
+int hw_sm750_set_blank(struct lynxfb_output *output, int blank)
 {
 	unsigned int dpms, pps, crtdb;
 
-- 
2.30.2

