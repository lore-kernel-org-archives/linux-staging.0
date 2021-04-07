Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F676D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:46:25 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id bg21so6200689pjb.0
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8KMjQscDTu2f3qX/EIrSUJ8LapWFh940dfHfctQfV8U=;
        b=nmYWcmTrl1AUYU22euLKozyZVDSQkPaf4gh4z/xzAbjRtmXsQxuKhSN5PMcavyiv2h
         T9y28cNGSmLtswteu2JAPwKXUwpReeUKLzIodYygr7FfXtfyhNTnx2/rV+TWer9o0y2J
         o9gLSnZp7N/gLCxrvDb4ziBC17Z4LQ3dhfxWhjCKEhodfqTOBlYmmpjzPXVzDexQmos4
         m1+RIaEd3lvve7s3FmFEP0g7B4+6hrhBbFo+DMHQG9Hnw9lNRKPw4+Yc+S5orEvJrnQH
         ZrBrNGuW3xUOrvupsTstOdaS+iQ6OqNva9WopXbYVqXmHxf8M02sdxk9BSPqwWIViQlN
         ytnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8KMjQscDTu2f3qX/EIrSUJ8LapWFh940dfHfctQfV8U=;
        b=E+9CZtle/6AJjs7Yc5rAK1qWtQrt0zDbdS0NsZBUhmOMNZukM+ARI3DfMq28G2ne5n
         EV8yj4AP7NumtpaPJIdaRIYlvI7NUr2q7vguEY7UVlYa4nIHbXeh14dOoydWFRLwv9hT
         83AKaPzFyNWnv6cvNZ7p0po52vJTNyDMiUUW5F1eOxy1ScOeuvtoco2aO/sA79O3/d0C
         e77IJ72xOzgsA6DYvs7Na5o/4Hjm74TbI74SaLjY+OqsRuijamfQSXEWrw6h8IY/1xvo
         17KkcP7z3PFymeTabq28IGsfpsft7qIobNBxn0TMHem8TBGw3cObz1qg5XbuggDJA+CM
         X31w==
X-Gm-Message-State: AOAM532gaoTi2lBq2Jryz11d9FAw71bCGvCJzy+bPCbB/WbGEYmoY3kP
	NeWEwtS4FoHY9jnjtHI0J0I=
X-Google-Smtp-Source: ABdhPJz1w6XNaPtFfWFzMBtK3MAqep3koqt9yCzs6xcZ4oja/eBFaNTuGevI7KU8w/uF3GmX8g5mtw==
X-Received: by 2002:a17:90a:77c5:: with SMTP id e5mr1800883pjs.189.1617777985391;
        Tue, 06 Apr 2021 23:46:25 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id t16sm871809pfc.94.2021.04.06.23.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:46:25 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:46:22 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 49/49] staging: sm750fb: Update members of sm750_pnltype
 struct to snake case
Message-ID: <5d8d02f140f9ed246cd5a660a06a3f15daa48297.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpatch.pl checks for the members of
sm750_pnltype structure, in particular sm750_24TFT, sm750_dualTFT,
and sm750_doubleTFT.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    | 6 +++---
 drivers/staging/sm750fb/sm750.h    | 6 +++---
 drivers/staging/sm750fb/sm750_hw.c | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 946143de11fc..c9b17d6ac9fb 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -894,11 +894,11 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 		} else if (!strncmp(opt, "nocrt", strlen("nocrt"))) {
 			sm750_dev->nocrt = 1;
 		} else if (!strncmp(opt, "36bit", strlen("36bit"))) {
-			sm750_dev->pnltype = sm750_doubleTFT;
+			sm750_dev->pnltype = sm750_double_tft;
 		} else if (!strncmp(opt, "18bit", strlen("18bit"))) {
-			sm750_dev->pnltype = sm750_dualTFT;
+			sm750_dev->pnltype = sm750_dual_tft;
 		} else if (!strncmp(opt, "24bit", strlen("24bit"))) {
-			sm750_dev->pnltype = sm750_24TFT;
+			sm750_dev->pnltype = sm750_24_tft;
 		} else if (!strncmp(opt, "nohwc0", strlen("nohwc0"))) {
 			g_hwcursor &= ~0x1;
 		} else if (!strncmp(opt, "nohwc1", strlen("nohwc1"))) {
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 06cf136fa28c..ce02671a1419 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -13,9 +13,9 @@
 #endif
 
 enum sm750_pnltype {
-	sm750_24TFT = 0,	/* 24bit tft */
-	sm750_dualTFT = 2,	/* dual 18 bit tft */
-	sm750_doubleTFT = 1,	/* 36 bit double pixel tft */
+	sm750_24_tft = 0,	/* 24bit tft */
+	sm750_dual_tft = 2,	/* dual 18 bit tft */
+	sm750_double_tft = 1,	/* 36 bit double pixel tft */
 };
 
 /* vga channel is not concerned  */
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index b445f075d0a9..ad81fd5c33ad 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -136,12 +136,12 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 			~(PANEL_DISPLAY_CTRL_DUAL_DISPLAY |
 			  PANEL_DISPLAY_CTRL_DOUBLE_PIXEL);
 		switch (sm750_dev->pnltype) {
-		case sm750_24TFT:
+		case sm750_24_tft:
 			break;
-		case sm750_doubleTFT:
+		case sm750_double_tft:
 			val |= PANEL_DISPLAY_CTRL_DOUBLE_PIXEL;
 			break;
-		case sm750_dualTFT:
+		case sm750_dual_tft:
 			val |= PANEL_DISPLAY_CTRL_DUAL_DISPLAY;
 			break;
 		}
-- 
2.30.2

