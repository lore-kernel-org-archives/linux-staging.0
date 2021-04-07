Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AF56D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:45:42 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id c204so8440134pfc.4
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2cYF68oFcyjU4Kfw0xfEVQzUH83t8nX8JKIHWjr/Ga4=;
        b=MEokI6t3x8iAwgGFuejhxCZfmi/8MZr1VfKdpod4k0sm+6g0CTIMZud2LT2aIEjPmM
         SGKqVjzmxeHkaq0RbhWqK0TBvdEod2XCaDHzh/O+S05TvY7T4fiacuLDQYI0hK5UsLrx
         V11h9pGD6iJZxUEwJAszphcVnKmeM/Ocutf6obIGu5JpbkxIbabAI7FQNc0salQf6OM7
         c/7tfo6Dv6UW+r1B8uAkp5FRh0kDMHvq+hWQcI4vn1ZZr4ApZ6xoBHx0W4cLNPgXbCqF
         XxEMZZLA2z0RavXGOmdGyc+9iPDhPjiQPQltvlyDzrowszOJj14dxsOjLdROM37Nf0zw
         GhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2cYF68oFcyjU4Kfw0xfEVQzUH83t8nX8JKIHWjr/Ga4=;
        b=mRrd5U/v6KtUv+IIzjNZvgxbHdRRvWGyvd7Ecpstwzzs9ykH+UkovmAZA+yctq4t5m
         4BSDmWFO6qqeRojsTngxYb7/RlR2KS6gu9SdSdj9Zwgqu2W5cstZmkMww1eOpl2PE1Vj
         /ln4o1qiNIgZjil9yOAjG6IJrvvmRMM2/f8MGqbvDaV6uhfnmoKBYYLWZiBASAYT6Yzt
         is4SNYkzmFg/YNGGWA71dU85xalHm0PbXTDjWMVv8UATu0PsLz1ze8IkHsna0SC0IW7C
         hWZ3w/rE/3BnmLM2gszOtuJEw/t7ev5A6JqZGtegMxltSUHCZwVLkAuZSQahGAlFyq+x
         +e+g==
X-Gm-Message-State: AOAM530cHGv/AnwnJsToJgI+blEcKdGYBbCw6/nJReUjqoO90qQSiISk
	teIGzgTZeuRPGw5W4F8KtUk=
X-Google-Smtp-Source: ABdhPJxk+9euoAl2I+ED+syNGgwrNK2Klr1blr3hUcYgQ/TU2vQI/PVdYVYP0vPQ22ggVoTxZGYaBg==
X-Received: by 2002:a63:1b5f:: with SMTP id b31mr1968300pgm.194.1617777941781;
        Tue, 06 Apr 2021 23:45:41 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id l25sm21847554pgu.72.2021.04.06.23.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:45:41 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:45:39 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 37/49] staging: sm750fb: Rename function
 hw_sm750_output_setMode to snake case
Message-ID: <b24581cc3a52db532d55f0c2a0a079f95e21613f.1617776878.git.pavle.rohalj@gmail.com>
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
hw_sm750_output_set_mod.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    | 2 +-
 drivers/staging/sm750fb/sm750.h    | 2 +-
 drivers/staging/sm750fb/sm750_hw.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 2c944539eaf0..8e803b580a71 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -395,7 +395,7 @@ static int lynxfb_ops_set_par(struct fb_info *info)
 	}
 	ret = hw_sm750_crtc_set_mode(crtc, var, fix);
 	if (!ret)
-		ret = hw_sm750_output_setMode(output, var, fix);
+		ret = hw_sm750_output_set_mode(output, var, fix);
 	return ret;
 }
 
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 368e5cc19147..b46d13134f76 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -197,7 +197,7 @@ void hw_sm750_initAccel(struct sm750_dev *sm750_dev);
 int hw_sm750_deWait(void);
 int hw_sm750le_deWait(void);
 
-int hw_sm750_output_setMode(struct lynxfb_output *output,
+int hw_sm750_output_set_mode(struct lynxfb_output *output,
 			    struct fb_var_screeninfo *var,
 			    struct fb_fix_screeninfo *fix);
 
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 7c852c6a153b..410f726b03e9 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -180,7 +180,7 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	return 0;
 }
 
-int hw_sm750_output_setMode(struct lynxfb_output *output,
+int hw_sm750_output_set_mode(struct lynxfb_output *output,
 			    struct fb_var_screeninfo *var,
 			    struct fb_fix_screeninfo *fix)
 {
-- 
2.30.2

