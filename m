Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEC36D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:46:17 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id nh5so7035131pjb.5
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aNs0AO776EogKhlzulOQJvra1//Jd3QrXTsT/Rf44n8=;
        b=TBa55wJSKfXc31phpjDZmPxaPtI1b8z5bBwBHwO+0yj4x5TkFIxvunTcNiA6hYkcqQ
         JUAaONr16oyjxRFQ3D9ksDLDrbWKC8d+d9YxugrgnRGLhLftQFIqU+XTQc70HU1a8+jm
         H0vHIL2+LMdhSX0D9py+KinOQMp6Hqw42sA5uozZExhhk8DqaKZRiYj/BUsLXMpn0Qrf
         PXh4nVbHRDEpBUlT/sQisCn/FjzIA+BiTNk1B6C5ka5LAMx6czIl4oi+ESKlWrkLVXjp
         ALdsvgfzXqZF5pZxAmjr3TSSDiWerSSgMiOHRTj3iZrinTp8Nu8QalifcCqZNFJNt+a6
         j9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aNs0AO776EogKhlzulOQJvra1//Jd3QrXTsT/Rf44n8=;
        b=JfMHpBagsyV1KjcLLsmiUYfX6JcS/KzLaMkChQrWpdBmPPDfttxur7VLk8PfN/ah2p
         CIpKUVeQzeHF4CLbKSPUKrCjDb01OY//PvkxfMXr/yOrVY1O3N0QRVEksLD6H+0WnHjw
         1WejMHqS7B6ml1j3yMCYZ/7b5cf1fnzbJ0pIsGbFyrzrpvPl3sQulu+Hr+K6+GKQy52W
         xSsPb7MeuE8zX72K7v4MipnemdCHjgSlS0jC1hbqleRYr4HN/xuLQLFSFJw0wF8Uy6vO
         Hyw+c9Ck8y3T+rxAYw+s7eg/XqkrGEpgQyLnSMstCjPS3LCQsZu8ywGMFe8RdYYuDUkJ
         yseQ==
X-Gm-Message-State: AOAM530O1KgecJ6OlYlzD2lfc1oPtC9apnuc73exoB9fqlgAu/Irj9lc
	vLCwPnuh4mwbXX1pw/4PPfI=
X-Google-Smtp-Source: ABdhPJxjo7d1CMoBW6P1IsapB0U61Q0/p/IAFor+//t3W48jP0o0jKvZJzh9bR4yn5nq7+JJyZTqAg==
X-Received: by 2002:a17:902:c192:b029:e9:4afd:1f37 with SMTP id d18-20020a170902c192b02900e94afd1f37mr1789594pld.37.1617777977596;
        Tue, 06 Apr 2021 23:46:17 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id o9sm3999643pjr.43.2021.04.06.23.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:46:17 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:46:15 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 48/49] staging: sm750fb: Rename fixId to fix_id
Message-ID: <65640b7983efc71cd60dbec7a2dd1d6d8c6f4344.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpatch.pl checks for the local variable
fixId in lynxfb_set_fbinfo function.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 0c6bfbedde50..946143de11fc 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -694,7 +694,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		"kernel HELPERS prepared vesa_modes",
 	};
 
-	static const char *fixId[2] = {
+	static const char *fix_id[2] = {
 		"sm750_fb1", "sm750_fb2",
 	};
 
@@ -814,7 +814,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	fix->ywrapstep = crtc->ywrapstep;
 	fix->accel = FB_ACCEL_SMI;
 
-	strscpy(fix->id, fixId[index], sizeof(fix->id));
+	strscpy(fix->id, fix_id[index], sizeof(fix->id));
 
 	fix->smem_start = crtc->o_screen + sm750_dev->vidmem_start;
 	pr_info("fix->smem_start = %lx\n", fix->smem_start);
-- 
2.30.2

