Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089262C87
	for <linux-staging@lists.linux.dev>; Wed, 13 Oct 2021 18:58:23 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id m22so11767156wrb.0
        for <linux-staging@lists.linux.dev>; Wed, 13 Oct 2021 11:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rNu7tGzS3a9nNAG4wYt+tSxCNINIYaiwOvt4CtHF4Gs=;
        b=bQL8cJwTetQRi7wJWtinf4IweToaAa7IwT8GlJMAwUncH5Ig6a3S5/fp4xd41Ag0qv
         Ymh15/WjH0C7BdXmn2cAlMyA0a+jT4XF1hr1CScg5ub96GCYFcBQDeYcU87tOPRaFW20
         g1Yj67rsoFvIc2u5mN+fJZlnhfd5vD6kjbqww7Dsg10KmOMpfen2qQ0ggEM+06MrgU1n
         REMzYftS6Em4YqZp+bEkwR5IBTALkD2POfnL1P8yDI6ACPZuxE7AA0Zd3b8uiLygwOVT
         Vva5EaewNxnAdY8wou1TTimWIA2XYhDqs40KGQtm3BgS4Ce/hcfKaAlNyKAKLnhR/6sV
         9VyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rNu7tGzS3a9nNAG4wYt+tSxCNINIYaiwOvt4CtHF4Gs=;
        b=VcfVduMrs0gr3rfWvBvYyMnnEYRdxaXeC7w/l2ZmT61yUZZASu9QVgJGwT3Blwivx6
         xAlgcK6+MeLNuddmqiaaGPbjxnsJWIlrFQFw69lE0+MUQl0tcRkBF5wMP04SeFguPujV
         IfjW7Fed3S3dMaiWHjQ2XAxA1iYu2D5lwkyHXqeg/7f1YWjeMkgM2gCk7Jb2grbona++
         4bWp3MXKabfYr81NEpjyNE1BxtOTChxfNzh3FJNXtAyr/l5D59cR7RPFgk0wFbG9/7lP
         kJqCO3ecEjt8R1U+kQF9FqPrSNlsUPDX/zyccaZapFCuiKfyzc/jasxPxrdiec/SOU5p
         bbBg==
X-Gm-Message-State: AOAM531q4uypXJB9HNo+dDotoc/8uW9RNdSj4l5vyEcL/5TCF7uitzDb
	+UMmypFBi5md+M79Y6LPM/Q7Cg==
X-Google-Smtp-Source: ABdhPJym/BQ+gvcyW+RLAZRdCdxHXNEUma6ef+jjFcJGlqSkU8HBxE3bmbBujd3Eh2yS6WmosQ7jbw==
X-Received: by 2002:adf:bc14:: with SMTP id s20mr1075733wrg.8.1634151501402;
        Wed, 13 Oct 2021 11:58:21 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id e8sm573059wrg.48.2021.10.13.11.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 11:58:21 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mjpeg-users@lists.sourceforge.net,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 05/10] staging: media: zoran: videocode: remove procfs
Date: Wed, 13 Oct 2021 18:58:07 +0000
Message-Id: <20211013185812.590931-6-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013185812.590931-1-clabbe@baylibre.com>
References: <20211013185812.590931-1-clabbe@baylibre.com>
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
 drivers/staging/media/zoran/videocodec.c | 24 ++----------------------
 drivers/staging/media/zoran/videocodec.h |  5 +++++
 2 files changed, 7 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/media/zoran/videocodec.c b/drivers/staging/media/zoran/videocodec.c
index 31019b5f377e..3d5a83a07e07 100644
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
@@ -265,8 +257,8 @@ int videocodec_unregister(const struct videocodec *codec)
 }
 EXPORT_SYMBOL(videocodec_unregister);
 
-#ifdef CONFIG_PROC_FS
-static int proc_videocodecs_show(struct seq_file *m, void *v)
+#ifdef CONFIG_VIDEO_ZORAN_DEBUG
+int videocodec_debugfs_show(struct seq_file *m)
 {
 	struct codec_list *h = codeclist_top;
 	struct attached_list *a;
@@ -300,25 +292,13 @@ static int proc_videocodecs_show(struct seq_file *m, void *v)
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
index 8a5003dda9f4..f2e17566795e 100644
--- a/drivers/staging/media/zoran/videocodec.h
+++ b/drivers/staging/media/zoran/videocodec.h
@@ -123,6 +123,7 @@ M                       zr36055[1] 0001 0000c001 00000000 (zr36050[1])
 #ifndef __LINUX_VIDEOCODEC_H
 #define __LINUX_VIDEOCODEC_H
 
+#include <linux/debugfs.h>
 #include <linux/videodev2.h>
 
 #define CODEC_DO_COMPRESSION 0
@@ -305,4 +306,8 @@ extern int videocodec_unregister(const struct videocodec *);
 
 /* the other calls are directly done via the videocodec structure! */
 
+#ifdef CONFIG_VIDEO_ZORAN_DEBUG
+int videocodec_debugfs_show(struct seq_file *m);
+#endif
+
 #endif				/*ifndef __LINUX_VIDEOCODEC_H */
-- 
2.32.0

