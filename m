Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8FA3FDF
	for <linux-staging@lists.linux.dev>; Fri,  3 Sep 2021 19:15:57 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id v10so130982wrd.4
        for <linux-staging@lists.linux.dev>; Fri, 03 Sep 2021 12:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1NmIdsFD86RNjphoyemqsLToxbge8B3EnKqYSVZuo2Y=;
        b=1HbmBCWKRfy/qbtCLMcic0WLmk59QE/9OleagyarLaL0dgHqjZxZsNru4qAcQtKSSm
         EtCH0k9rSDSF9dylLch0P563QPQftBsKbtgqccH4mR/ktgv2z9wSLwKt9f3KEHpq+2Zv
         NJ7apVSm0V9CFPFJ2+HB2b7QxMB4zy0D48mVG/wAvpaurwX0xcdvI+06htLwc9BqFnqp
         l0qWTkzGqa/udvtbmP3u0pD8IHNANdDY/pyCh9mpjLjhKoPQQyhz6exBU4mrobHU81MC
         JfurgV6i26oVOqKdrA/An5NEOn4OsUZ6gcnjka8CqMNlwwGx4IFQeexTeBS7DgtkuN+h
         +lCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1NmIdsFD86RNjphoyemqsLToxbge8B3EnKqYSVZuo2Y=;
        b=ST7xeyLJxxTp/shNt6lS8PNoiPPnBO1LD98mXxgRyTiIBN5PyOktWjpUFP+7XQ0KKD
         0BxqP0s7OGukNIyzraaS5Zvq6WaJVW6wZJ2gJLNiP5JmyFlGSvOFuaT1gG6NKDsNEltP
         DgNvq3KXu13fzi/ymI+M0u4FxZK2P3Ovmt66k+ztG2+YSAlZhYeJ08DD4Kdzsad5qiFI
         JfOTBHLJ3kOK6Qex0IJeXGyvaG8IrhYTt/uZMLrjsK541FKNUSdBmzytWJZ559Earp2I
         HpOkDlm+ZcO7fwA+ufmdEa+QX9KcHl66Dt4LpHqKuNvF3AWffvjFoAOA3GhGhjJetVrU
         xc/w==
X-Gm-Message-State: AOAM533JlzBfOWvYb5tMx0zAmEY2SzBqTvFibodETQfJRQOBiGG15Ctp
	kVvhO3oXpd6bLdwJUFcJIr1ZyQ==
X-Google-Smtp-Source: ABdhPJxR56Efcyt43sCJExSiASr0RQSzm9RG7u10CGLRdOHwTEMias0MFbSqvXFemkwhCmDQpYUAIg==
X-Received: by 2002:a5d:5441:: with SMTP id w1mr612235wrv.280.1630696556242;
        Fri, 03 Sep 2021 12:15:56 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a133sm253397wme.5.2021.09.03.12.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 12:15:56 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mjpeg-users@lists.sourceforge.net,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 4/8] staging: media: zoran: add debugfs
Date: Fri,  3 Sep 2021 19:15:36 +0000
Message-Id: <20210903191540.3052775-5-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903191540.3052775-1-clabbe@baylibre.com>
References: <20210903191540.3052775-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add debugfs for displaying zoran debug and stats information.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/Kconfig      | 10 ++++++
 drivers/staging/media/zoran/zoran.h      |  5 +++
 drivers/staging/media/zoran/zoran_card.c | 39 ++++++++++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/drivers/staging/media/zoran/Kconfig b/drivers/staging/media/zoran/Kconfig
index 7874842033ca..7d2d3c2431b1 100644
--- a/drivers/staging/media/zoran/Kconfig
+++ b/drivers/staging/media/zoran/Kconfig
@@ -74,3 +74,13 @@ config VIDEO_ZORAN_AVS6EYES
 	select VIDEO_KS0127 if MEDIA_SUBDRV_AUTOSELECT
 	help
 	  Support for the AverMedia 6 Eyes video surveillance card.
+
+config VIDEO_ZORAN_DEBUG
+	bool "Enable zoran debugfs"
+	depends on VIDEO_ZORAN
+	depends on DEBUG_FS
+	help
+	  Say y to enable zoran debug file.
+	  This will create /sys/kernel/debug/CARD_NAME/debug for displaying
+	  stats and debug information.
+
diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
index b1ad2a2b914c..8c271005f14d 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -18,6 +18,7 @@
 #ifndef _BUZ_H_
 #define _BUZ_H_
 
+#include <linux/debugfs.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ctrls.h>
 #include <media/videobuf2-core.h>
@@ -295,6 +296,10 @@ struct zoran {
 	struct list_head queued_bufs;
 	spinlock_t queued_bufs_lock; /* Protects queued_bufs */
 	struct zr_buffer *inuse[BUZ_NUM_STAT_COM * 2];
+#ifdef CONFIG_VIDEO_ZORAN_DEBUG
+	struct dentry *dbgfs_dir;
+	struct dentry *dbgfs_file;
+#endif
 };
 
 static inline struct zoran *to_zoran(struct v4l2_device *v4l2_dev)
diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index f1465fbf98af..1ed8ed2f4f7f 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -1051,6 +1051,39 @@ static const struct v4l2_ctrl_ops zoran_video_ctrl_ops = {
 	.s_ctrl = zoran_video_set_ctrl,
 };
 
+#ifdef CONFIG_VIDEO_ZORAN_DEBUG
+static int zoran_debugfs_show(struct seq_file *seq, void *v)
+{
+	struct zoran *zr = seq->private;
+
+	seq_printf(seq, "Running mode %x\n", zr->running);
+	seq_printf(seq, "Codec mode %x\n", zr->codec_mode);
+	seq_printf(seq, "Norm %x\n", zr->norm);
+	seq_printf(seq, "Input %d\n", zr->input);
+	seq_printf(seq, "Buffersize %d\n", zr->buffer_size);
+
+	seq_printf(seq, "V4L width %dx%d\n", zr->v4l_settings.width, zr->v4l_settings.height);
+	seq_printf(seq, "V4L bytesperline %d\n", zr->v4l_settings.bytesperline);
+
+	seq_printf(seq, "JPG decimation %u\n", zr->jpg_settings.decimation);
+	seq_printf(seq, "JPG hor_dcm %u\n", zr->jpg_settings.hor_dcm);
+	seq_printf(seq, "JPG ver_dcm %u\n", zr->jpg_settings.ver_dcm);
+	seq_printf(seq, "JPG tmp_dcm %u\n", zr->jpg_settings.tmp_dcm);
+	seq_printf(seq, "JPG odd_even %u\n", zr->jpg_settings.odd_even);
+	seq_printf(seq, "JPG crop %dx%d %d %d\n",
+		zr->jpg_settings.img_x,
+		zr->jpg_settings.img_y,
+		zr->jpg_settings.img_width,
+		zr->jpg_settings.img_height);
+
+	seq_printf(seq, "Prepared %u\n", zr->prepared);
+	seq_printf(seq, "Queued %u\n", zr->queued);
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(zoran_debugfs);
+#endif
+
 /*
  *   Scan for a Buz card (actually for the PCI controller ZR36057),
  *   request the irq and map the io memory
@@ -1286,6 +1319,12 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	zr->map_mode = ZORAN_MAP_MODE_RAW;
 
+#ifdef CONFIG_VIDEO_ZORAN_DEBUG
+	zr->dbgfs_dir = debugfs_create_dir(ZR_DEVNAME(zr), NULL);
+	zr->dbgfs_file = debugfs_create_file("debug", 0444,
+					      zr->dbgfs_dir, zr,
+					      &zoran_debugfs_fops);
+#endif
 	return 0;
 
 zr_detach_vfe:
-- 
2.32.0

