Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F25A2CAA
	for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 19:34:26 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id k7so80874wrd.13
        for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 12:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9d00CQxtuLbmKfZQEqLshscWS8poY4p1Q3lozDp6W9U=;
        b=fwv8aNrAyxe5i4jWD2gyV34JjH6qiFTlYo6cq78FdY5nK0+ENvJK3+FNm3tUg5CsyU
         9lRgtpXzBBrJzHYLNcXPmluXFkl+l3x85YlyGCgnhKep5poYJyLtvi7RGq87oCdU5MHZ
         b1y2c/v7XQspwenObvtlvlViThjGrHj1SzK7TUvMyT7KyNVXvAkMwbJQ6UuzbiV3HpB9
         sz6jcP7JedYXu/ZLeMsp1HBmLEVDzsJGBhdoB/HqXci500wXC4CrAN67PUGqz37dsNxs
         YEIaopFIw8AYIFKV0TJgwflH0js0FyNztAazfKYD6QOJlOjR8XW8IxTNXEd7cXT+wY05
         ZxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9d00CQxtuLbmKfZQEqLshscWS8poY4p1Q3lozDp6W9U=;
        b=uvBE/SwoNawcMSeWdbd3N4avxpbM3gzSCR3sxdnKAA1mBdGp9h9hcfLUMA8mMD+J6T
         vDPsSsHrGXC1RAeFvr/eIAXnFatfZMLNq5x83FwR5y9ZIxqN+RW3PKua24ZJvZS7dHcl
         90ymruIrs1NUXSaeW3PeqlTKEBCWLX8qqfULnjDPysN09Fss69Br94BLuYQrVUTVFvuG
         mxOkIXCIgXeoA/XZCXgN51wVUcSDn28H8zNf72XuTFAhd7Sdyph/l8qp5PyLiCZy7SP+
         OqGOQFISt1HDbMS7no+W5Rqt6av6JW12REqusVCHzIgnPmQy4uXCqqhmHQfUzCko4h3J
         Q/VA==
X-Gm-Message-State: AOAM532tGXZtzw5bVOOb46WPI07L8g95Jm4Uhm3xay0UU2rfJp3S0cGR
	G815lJda9fMa7lFTEUH+PNsxrQ==
X-Google-Smtp-Source: ABdhPJxU/WKHVOZDz+CIGYlrw+MJsmcdLc1hfny2+jhN0CPjdH6F+7ffTEAwgY9SpTm6WU1EwI+Z6g==
X-Received: by 2002:adf:f38a:: with SMTP id m10mr10727726wro.126.1635276864545;
        Tue, 26 Oct 2021 12:34:24 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id s18sm17676123wrb.95.2021.10.26.12.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 12:34:24 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mjpeg-users@lists.sourceforge.net,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3 05/14] staging: media: zoran: videocode: remove procfs
Date: Tue, 26 Oct 2021 19:34:07 +0000
Message-Id: <20211026193416.1176797-6-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026193416.1176797-1-clabbe@baylibre.com>
References: <20211026193416.1176797-1-clabbe@baylibre.com>
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

