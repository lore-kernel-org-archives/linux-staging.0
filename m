Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDEB6D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:36:26 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id g10so8815192plt.8
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ruk0ECVgk5cWHRPO3cAAhvgkfpUeZxerRvgvguMhn0o=;
        b=cCxkJ6PcgHqucOCgBqwJzcXMho+kt6wxoC9luQC65j75k28zZis00M0SDW3j2Y4AVa
         5VsMoxxNOrJjg5dj/E7aa/dO1MxwWX2K5GDUm1NErwkCGTRleULp/7KSpky/XhXZeVJw
         Wcyj9etukxGB50xyMBmT2ccHj5lTgRhuZKk5NeoTPbXC0InqfWPEFQci63q6cZeEDdg+
         4vZUuTfdeBc48mAbTscdQIbfIOHuUlBw1tORYtZaM3iUXEuj+ZVxsb41PbzbGmxgR4Fr
         +pm/4yD7Ka8bwklFfKxAzHbO1TjDxsYMpikH1lRAHJHK8t+HWZEgUNYiXS84Xr8TLvlM
         EAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ruk0ECVgk5cWHRPO3cAAhvgkfpUeZxerRvgvguMhn0o=;
        b=YnrujsU2OcMVzhhLBnulyDNp/O3NXjKyrMhRTNnnCyzsOCXJ7HyZIRwSUesPJFEOpP
         SpFHqEFLeIBybT6UU5fEAg+c6aPKcjFsSQYOzISEMr9IIrQVp3crxgA633AUEFhPoK2w
         yO/lig553SmatD6t4aUt6rQfOSnILsvIn8GlWJdj2Pm/stP5EMujZJTzLVkCPFSxMcJP
         T0R6FSpprgxOSKuD3wD6prKNzVag/9bPleN5Z9/K8hQUUTuRmcJ8cbuybsbWZfcFfTUI
         m/wADAU+vLCBMjOcdTEEmOAB8CysU5WlMA3YMR45ieF+zF2dDtXe+ZxbEcmJCEsCIDYz
         qwlQ==
X-Gm-Message-State: AOAM533HANMcOZDjLksd3cVMSvc/a5Xbd6l79rogUBZl4cxeL6cFjd/c
	xgmNUXW4sZwrxZPKEtRTqd0=
X-Google-Smtp-Source: ABdhPJyN79crnDz/EANR+ilOos5UHzuBrR29ClVpgHmPReRVWTDoisYajjjTpvhOzOjwA4j+Xc4I3A==
X-Received: by 2002:a17:90a:3ee3:: with SMTP id k90mr417024pjc.147.1617777385644;
        Tue, 06 Apr 2021 23:36:25 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id w16sm784249pfn.200.2021.04.06.23.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:36:25 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:36:23 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/49] staging: sm750fb: Rename ddk750_setModeTiming to
 ddk750_set_mode_timing
Message-ID: <2b1d5ae43f2f5556dfc787d15b27d0db99354c85.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpatch.pl check for the function
ddk750_setModeTiming.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/ddk750_mode.c | 2 +-
 drivers/staging/sm750fb/ddk750_mode.h | 2 +-
 drivers/staging/sm750fb/sm750_hw.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
index 5c685b4e2fd6..2548695829ec 100644
--- a/drivers/staging/sm750fb/ddk750_mode.c
+++ b/drivers/staging/sm750fb/ddk750_mode.c
@@ -207,7 +207,7 @@ static int program_mode_registers(struct mode_parameter *mode_param,
 	return ret;
 }
 
-int ddk750_setModeTiming(struct mode_parameter *parm, enum clock_type clock)
+int ddk750_set_mode_timing(struct mode_parameter *parm, enum clock_type clock)
 {
 	struct pll_value pll;
 
diff --git a/drivers/staging/sm750fb/ddk750_mode.h b/drivers/staging/sm750fb/ddk750_mode.h
index 2df78a0937b2..1b70885f85e5 100644
--- a/drivers/staging/sm750fb/ddk750_mode.h
+++ b/drivers/staging/sm750fb/ddk750_mode.h
@@ -33,5 +33,5 @@ struct mode_parameter {
 	enum spolarity clock_phase_polarity;
 };
 
-int ddk750_setModeTiming(struct mode_parameter *parm, enum clock_type clock);
+int ddk750_set_mode_timing(struct mode_parameter *parm, enum clock_type clock);
 #endif
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 7136d751cff5..e31f4c6bc69e 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -305,7 +305,7 @@ int hw_sm750_crtc_setMode(struct lynxfb_crtc *crtc,
 		clock = SECONDARY_PLL;
 
 	pr_debug("Request pixel clock = %lu\n", modparm.pixel_clock);
-	ret = ddk750_setModeTiming(&modparm, clock);
+	ret = ddk750_set_mode_timing(&modparm, clock);
 	if (ret) {
 		pr_err("Set mode timing failed\n");
 		goto exit;
-- 
2.30.2

