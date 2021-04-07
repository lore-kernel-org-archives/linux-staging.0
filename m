Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BA76D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:46:09 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id y32so9095204pga.11
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=r/oBzQNuh63hJGsl/KIQufF0AGvx1q5/RmwFtkCNL+o=;
        b=pJzk1fBbV1MbhZoF8+rV3MlCvT3v6WtiJR+TdKNaJZaKA7lGQQ2pYyfguhIFru8t0s
         RtXPorljbp3FPDO3/EkZsl5J21bsBxWst7PRsYgfKh3qwdKsIGRaEHHo377LloRocV8h
         cZ10BLYrQYC+87Clii+JCtBUKYYJ8UEaynXdOsI9Q/kRYI6hc6wYB9YHkw6ER6v68T3z
         ayFl6/30OWMMnzI+93MXEyRkrEf633fozyr/wJYKVlYlJ7inDn1gDWrgPndH8PbEMTKm
         vGRd1kHUwLewJB+82qUxBymc8k2uJi7UW9XNRolh0iWRiOzFDlbMuqb9srltUOPLikga
         Zv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=r/oBzQNuh63hJGsl/KIQufF0AGvx1q5/RmwFtkCNL+o=;
        b=YCK9z1vOcbeDd06uc3T4AcNGPueGmPiUTNw17PqK+Uf0LMy9AEMDgebZU/jpGHKJ46
         rPSc03Uvkk0g9v4erOQe6K2D+0Ced6LHQ3Fj4MVpJJiSn7zp8TLmzu8d2L/6q5FvFexp
         vMmTbbWwa3TE1xQAmYCHpe3cfIWvTNkhhS7YlD4s6+gMkPLO1up4aOJtP4u2/3jRWBnl
         zpYzLRtNaeHZxrj9sdRITfKY5t90btEd6O3v+aXiCMsimJEJeBpbuWJe2uiBAjmD/Xgj
         uQca7EFnQz4ftKtqzu6zQxeySGcaloBKZCSrkZr/8DsIM3czJGAYpCxaUf2BUG0GklA+
         LDWQ==
X-Gm-Message-State: AOAM531ZQBtLhAIMksrRCoq0rZnQ5SGO3byAkyPK9kUqDN5q/mbXYrjj
	cj56vXc4n4+FVZrPFTOClG0=
X-Google-Smtp-Source: ABdhPJw5XIdGszUVi3JOaGNBZJdtQEMf4VsvOZbSVWrStK1FUM+pJHy4cbOkBHrsJRtrgR2Z1mXpuQ==
X-Received: by 2002:a62:1a08:0:b029:220:da90:9173 with SMTP id a8-20020a621a080000b0290220da909173mr1682186pfa.65.1617777969605;
        Tue, 06 Apr 2021 23:46:09 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id u1sm20031904pgg.11.2021.04.06.23.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:46:09 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:46:07 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 44/49] staging: sm750fb: Rename function
 hw_sm750_crtc_checkMode to snake case
Message-ID: <34c28569d6d690d72913dfc0347d05f8536c3a9b.1617776878.git.pavle.rohalj@gmail.com>
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
hw_sm750_crtc_checkMode.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    | 2 +-
 drivers/staging/sm750fb/sm750.h    | 2 +-
 drivers/staging/sm750fb/sm750_hw.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index bb25ab4ba0de..162eaf08db4c 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -512,7 +512,7 @@ static int lynxfb_ops_check_var(struct fb_var_screeninfo *var,
 		return -ENOMEM;
 	}
 
-	return hw_sm750_crtc_checkMode(crtc, var);
+	return hw_sm750_crtc_check_mode(crtc, var);
 }
 
 static int lynxfb_ops_setcolreg(unsigned int regno,
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index a27aaac5d67a..2e6481809d43 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -201,7 +201,7 @@ int hw_sm750_output_set_mode(struct lynxfb_output *output,
 			    struct fb_var_screeninfo *var,
 			    struct fb_fix_screeninfo *fix);
 
-int hw_sm750_crtc_checkMode(struct lynxfb_crtc *crtc,
+int hw_sm750_crtc_check_mode(struct lynxfb_crtc *crtc,
 			    struct fb_var_screeninfo *var);
 
 int hw_sm750_crtc_set_mode(struct lynxfb_crtc *crtc,
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 97b842148bcb..b445f075d0a9 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -221,7 +221,7 @@ int hw_sm750_output_set_mode(struct lynxfb_output *output,
 	return ret;
 }
 
-int hw_sm750_crtc_checkMode(struct lynxfb_crtc *crtc,
+int hw_sm750_crtc_check_mode(struct lynxfb_crtc *crtc,
 			    struct fb_var_screeninfo *var)
 {
 	struct sm750_dev *sm750_dev;
-- 
2.30.2

