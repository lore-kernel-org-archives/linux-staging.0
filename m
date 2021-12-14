Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5DA2CB2
	for <linux-staging@lists.linux.dev>; Tue, 14 Dec 2021 16:16:46 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id o19-20020a1c7513000000b0033a93202467so14077132wmc.2
        for <linux-staging@lists.linux.dev>; Tue, 14 Dec 2021 08:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hut926V20OH93089sBQ+FiKkhdXp4O3nTh6QgQgaA7A=;
        b=SlxcsL4nFKbjXPbah55EeCqyCseVZJjko6sedSwnNOxVdBj/lH7lnCTmXUaSY7neRq
         GJQGRuvnR2yi75Hq0hBpyZyPBNI6i1Z035V0PEUEclE86UAHMgLwMr9/viGidiRUgwlV
         xGEsI2tTZFLYPgJXIPgtAwC0fUsS2dw1ufnT3FqEKl9O5mgglLtKCiEL2XY1wa0vGmT5
         b9W2IHb8x4LnfY9AKOHgfB3/FlsGVQI4EkIda6OuSPPvhZYcXen8hbgLxO10uhATwOyT
         mIzyjSAKlUpTayWUald8zAbSynE3kvIxux28NOozK8WbTvBOv2JKF2M1zNDiHe5kAG+o
         JcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hut926V20OH93089sBQ+FiKkhdXp4O3nTh6QgQgaA7A=;
        b=pI70Gk9JHtDkThKfRt2tT0/x5f/Rf0a8KDphYn3Fe//VSQkEonAoPUox8a2ByBa8cd
         hSGa5Oc0miKw/jdGIpZ5AYE98QNXXuse9fi00a50+d/0iqyHQy7UHUnd/U6sHTtXWy/q
         XAIFIqNXfAr2nktIsnxU7PUdye0PVJazXmetTCTdnY3S0vwv1aqMJPITY08Kz5qtGI2o
         nLBpP4uSINbFBOdQC6YGf1bkrw1e/cpr+IrziflsrQrNUnQ+3xqj/cIejC7ZYkBdDLhf
         L14sKnyb+zmFbLh08TJuXq9iwidp40XN7Lneff5Qkm3SI0UWbkqQVtU1QIHmCD/7mfQx
         rDUg==
X-Gm-Message-State: AOAM530V574ntU7xIjG3hPtu9rcC1m0p2CzbdzysYGaBKlCSOx6n6iiR
	XTIi9NqKDcvxaazJG4UT5QFMzQ==
X-Google-Smtp-Source: ABdhPJyLqAfusRVWFmULPpDBEmYjVePw93+cFLOzgza4/eC+u84tFZkh7nBf9qbrjGeF03It9IwQrA==
X-Received: by 2002:a7b:cbd8:: with SMTP id n24mr8115216wmi.150.1639498605031;
        Tue, 14 Dec 2021 08:16:45 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a9sm295116wrt.66.2021.12.14.08.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 08:16:44 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mjpeg-users@lists.sourceforge.net,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v4 04/18] staging: media: zoran: add debugfs
Date: Tue, 14 Dec 2021 16:16:22 +0000
Message-Id: <20211214161636.1886900-5-clabbe@baylibre.com>
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

Add debugfs for displaying zoran debug and stats information.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/Kconfig      |  1 +
 drivers/staging/media/zoran/zoran.h      |  2 ++
 drivers/staging/media/zoran/zoran_card.c | 36 ++++++++++++++++++++++++
 3 files changed, 39 insertions(+)

diff --git a/drivers/staging/media/zoran/Kconfig b/drivers/staging/media/zoran/Kconfig
index 7874842033ca..6d6e4c93f873 100644
--- a/drivers/staging/media/zoran/Kconfig
+++ b/drivers/staging/media/zoran/Kconfig
@@ -2,6 +2,7 @@ config VIDEO_ZORAN
 	tristate "Zoran ZR36057/36067 Video For Linux (Deprecated)"
 	depends on PCI && I2C_ALGOBIT && VIDEO_V4L2
 	depends on !ALPHA
+	depends on DEBUG_FS
 	select VIDEOBUF2_DMA_CONTIG
 	help
 	  Say Y for support for MJPEG capture cards based on the Zoran
diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
index b1ad2a2b914c..981cb63ac9af 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -18,6 +18,7 @@
 #ifndef _BUZ_H_
 #define _BUZ_H_
 
+#include <linux/debugfs.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ctrls.h>
 #include <media/videobuf2-core.h>
@@ -295,6 +296,7 @@ struct zoran {
 	struct list_head queued_bufs;
 	spinlock_t queued_bufs_lock; /* Protects queued_bufs */
 	struct zr_buffer *inuse[BUZ_NUM_STAT_COM * 2];
+	struct dentry *dbgfs_dir;
 };
 
 static inline struct zoran *to_zoran(struct v4l2_device *v4l2_dev)
diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index f1465fbf98af..28a3363a8838 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -945,6 +945,8 @@ static void zoran_remove(struct pci_dev *pdev)
 	if (!zr->initialized)
 		goto exit_free;
 
+	debugfs_remove_recursive(zr->dbgfs_dir);
+
 	zoran_queue_exit(zr);
 
 	/* unregister videocodec bus */
@@ -1051,6 +1053,37 @@ static const struct v4l2_ctrl_ops zoran_video_ctrl_ops = {
 	.s_ctrl = zoran_video_set_ctrl,
 };
 
+static int zoran_debugfs_show(struct seq_file *seq, void *v)
+{
+	struct zoran *zr = seq->private;
+
+	seq_printf(seq, "Running mode %x\n", zr->running);
+	seq_printf(seq, "Codec mode %x\n", zr->codec_mode);
+	seq_printf(seq, "Norm %llx\n", zr->norm);
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
+
 /*
  *   Scan for a Buz card (actually for the PCI controller ZR36057),
  *   request the irq and map the io memory
@@ -1286,6 +1319,9 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	zr->map_mode = ZORAN_MAP_MODE_RAW;
 
+	zr->dbgfs_dir = debugfs_create_dir(ZR_DEVNAME(zr), NULL);
+	debugfs_create_file("debug", 0444, zr->dbgfs_dir, zr,
+			    &zoran_debugfs_fops);
 	return 0;
 
 zr_detach_vfe:
-- 
2.32.0

