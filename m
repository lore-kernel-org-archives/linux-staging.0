Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723BB168
	for <linux-staging@lists.linux.dev>; Tue, 14 Dec 2021 16:16:47 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id a83-20020a1c9856000000b00344731e044bso1194950wme.1
        for <linux-staging@lists.linux.dev>; Tue, 14 Dec 2021 08:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9d00CQxtuLbmKfZQEqLshscWS8poY4p1Q3lozDp6W9U=;
        b=SbE3bx+f/5vebISeux3XOeD2/aNUqaQrcGjt3G0WBt07k4+KjXOXMkOj2WEuEH+E3M
         I5IKN+AWdv18rkV7KuY46s0BFTo3fL6X/+pFlAxpWAN0peeUcujLQm7JX9fflkV92lZE
         kQXHf6kIL3cIqybWH0JG7yJZ+6UCSUm/aTgP5xxizgpx04PhaXggF1yukYCBLH/jnbbp
         8i/cW9pTBL59dp3zusGeCLQQpMCABRwJ75FHqp+tg5so3vDe4QPPyIrM3kMqsNBAe1Fq
         ng9a5vfhSgSB4oJF3KbJQeCjRQwxD4nSDi/69hoPIKYynBsekIzz9+kLEd9TiMS3c9lj
         2XjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9d00CQxtuLbmKfZQEqLshscWS8poY4p1Q3lozDp6W9U=;
        b=6NqLAb6LvIB3M6ob9Pwl1taPxCWMk3bBGogoBl9bBtid/uSJ06YybGqL2xTizymND/
         qQlBG7xwqalBjFD3oFP4v/FyqdrVtiBTazK/aX4v5tTDXx0X7Y5Gnmtrcsg7dYamwi+i
         NR/c8GFgPIESAkPBkn0wXocime4hhgJSaPvMhrS5Imib3xygv89uo4hNd9w9eTOB1+96
         kzOCBma8kK4HpKZPl0E/lT4CPzbm26IUQAuIjQxqxFR43g4G8oJzLU/78w4pqUTAfVAl
         0KjeAtOkfI3vRtSne0I+bs2hi/sOVetP5CA2XCurYzzyRUHM7MwMRWTekTQfRK3xDAQt
         h5cg==
X-Gm-Message-State: AOAM532ME178uOPR8U4d1cGOaySyD8EpE1rWlfPvYVAxINWUxYHj7Mr9
	36aZtmNqLtxUz4OTkxmxSbq/GQ==
X-Google-Smtp-Source: ABdhPJxT+E9CvwN1wHLmBTZX39LG4/yvi+mSQhr8wnCEGOY+hEFTHWQf2InARJC78rU3psWOJsVn1g==
X-Received: by 2002:a05:600c:1914:: with SMTP id j20mr47607517wmq.26.1639498605740;
        Tue, 14 Dec 2021 08:16:45 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a9sm295116wrt.66.2021.12.14.08.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 08:16:45 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mjpeg-users@lists.sourceforge.net,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v4 05/18] staging: media: zoran: videocode: remove procfs
Date: Tue, 14 Dec 2021 16:16:23 +0000
Message-Id: <20211214161636.1886900-6-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214161636.1886900-1-clabbe@baylibre.com>
References: <20211214161636.1886900-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now we have a debugfs, we can remove all PROCFS stuff.
We keep videocodec_debugfs_show(), it will be used later

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/videocodec.c | 24 +-----------------------
 drivers/staging/media/zoran/videocodec.h |  3 +++
 2 files changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/zoran/videocodec.c b/drivers/staging/media/zoran/videocodec.c
index 31019b5f377e..5bab7ba56257 100644
--- a/drivers/staging/media/zoran/videocodec.c
+++ b/drivers/staging/media/zoran/videocodec.c
@@ -16,14 +16,6 @@
 #include <linux/types.h>
 #include <linux/slab.h>
 
-// kernel config is here (procfs flag)
-
-#ifdef CONFIG_PROC_FS
-#include <linux/proc_fs.h>
-#include <linux/seq_file.h>
-#include <linux/uaccess.h>
-#endif
-
 #include "videocodec.h"
 
 static int videocodec_debug;
@@ -265,8 +257,7 @@ int videocodec_unregister(const struct videocodec *codec)
 }
 EXPORT_SYMBOL(videocodec_unregister);
 
-#ifdef CONFIG_PROC_FS
-static int proc_videocodecs_show(struct seq_file *m, void *v)
+int videocodec_debugfs_show(struct seq_file *m)
 {
 	struct codec_list *h = codeclist_top;
 	struct attached_list *a;
@@ -293,32 +284,19 @@ static int proc_videocodecs_show(struct seq_file *m, void *v)
 
 	return 0;
 }
-#endif
 
 /* ===================== */
 /* hook in driver module */
 /* ===================== */
 static int __init videocodec_init(void)
 {
-#ifdef CONFIG_PROC_FS
-	static struct proc_dir_entry *videocodec_proc_entry;
-#endif
-
 	pr_info("Linux video codec intermediate layer: %s\n", VIDEOCODEC_VERSION);
 
-#ifdef CONFIG_PROC_FS
-	videocodec_proc_entry = proc_create_single("videocodecs", 0, NULL, proc_videocodecs_show);
-	if (!videocodec_proc_entry)
-		pr_err("videocodec: can't init procfs.\n");
-#endif
 	return 0;
 }
 
 static void __exit videocodec_exit(void)
 {
-#ifdef CONFIG_PROC_FS
-	remove_proc_entry("videocodecs", NULL);
-#endif
 }
 
 module_init(videocodec_init);
diff --git a/drivers/staging/media/zoran/videocodec.h b/drivers/staging/media/zoran/videocodec.h
index 8a5003dda9f4..3a508d326049 100644
--- a/drivers/staging/media/zoran/videocodec.h
+++ b/drivers/staging/media/zoran/videocodec.h
@@ -123,6 +123,7 @@ M                       zr36055[1] 0001 0000c001 00000000 (zr36050[1])
 #ifndef __LINUX_VIDEOCODEC_H
 #define __LINUX_VIDEOCODEC_H
 
+#include <linux/debugfs.h>
 #include <linux/videodev2.h>
 
 #define CODEC_DO_COMPRESSION 0
@@ -305,4 +306,6 @@ extern int videocodec_unregister(const struct videocodec *);
 
 /* the other calls are directly done via the videocodec structure! */
 
+int videocodec_debugfs_show(struct seq_file *m);
+
 #endif				/*ifndef __LINUX_VIDEOCODEC_H */
-- 
2.32.0

