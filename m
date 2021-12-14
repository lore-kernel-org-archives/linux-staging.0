Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695F32CA2
	for <linux-staging@lists.linux.dev>; Tue, 14 Dec 2021 16:17:01 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id az34-20020a05600c602200b0033bf8662572so14116771wmb.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Dec 2021 08:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WMS2o1RG6OOY773SExtf5pXJlS02JecjKlii7tDnHds=;
        b=fyTyd1+IJ1YqPGsfBd4bZVOxshAxJ9rrqy+OZzJyky9cvyAjtNrL21Rl3BgayWNIce
         bQ1iHqVMZPISJlOCLD6SR4wLM/F2MiyYQ2lLyhO6RsmKoPgFtDcWFUvcKrvLyVUr1dAh
         2xTVFum1JoBn8Cub5a1Zt+QoJEqyDlfMsYR0FJ04o5yUtKFp9YOwchcVJd2HliHmwjRL
         SUIq1BT565wtBOnJcvLnz5+wOSj3J80G7jxwqbVgnjA3UVMjfGHh+LE5LoZrgtOvkDS3
         vvv17otElycjl+sgZDpywDqrhKa/CixETfhuW05tXrbcJwb8BopPWzoW6mP3bC2ss5ru
         LNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WMS2o1RG6OOY773SExtf5pXJlS02JecjKlii7tDnHds=;
        b=Wl1b14Df8p78IPkcMKZgKv+4tsHlElgiz9+TMkKp8p+rpuLOTBPbuJP2yV5YI7Qg5f
         sf4UVGWhka3XG3eqmmrzdBgyiOg5QDEb/YiW0zIdtwF7SiegwcU9n8ZcQDJH2QTQJ73b
         PkvCZ7w1hOLymVTbU4d1MkVJeK9/jLcqD5DgJOPlYk0CEg5oq47JYCtMt0SCbhumjhw6
         sovUj5gmSEJXRMCqesk4YBm8+3q7YQz0mGz3KLZ2TwL6Ldiw6l9Oh5dhImWt2SipuuRe
         foOd3LCkMQWu+moiEehvqZy7qQN3xnqSeZ3CHvWa2Trmk2s34Ec1FRpYlG4SiUOtsT1V
         rjcw==
X-Gm-Message-State: AOAM5325GGvLKMR24uh0VY6aPoZmD3YODyE1u2dkgduGy42j+OpoU9BG
	X5BiM4khvlaafaxx1UxnB1aYPg==
X-Google-Smtp-Source: ABdhPJwXKcjNUUPBit4ldRqWlkvBv7lzavL92IzSrDie60QDhC4S7rMjzkaBphXmgZfN4e4FRhASJw==
X-Received: by 2002:a05:600c:3b28:: with SMTP id m40mr47732150wms.100.1639498619766;
        Tue, 14 Dec 2021 08:16:59 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a9sm295116wrt.66.2021.12.14.08.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 08:16:59 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mjpeg-users@lists.sourceforge.net,
	Hans Verkuil <hans.verkuil@cisco.com>,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v4 17/18] staging: media: zoran: drop kernel log spam
Date: Tue, 14 Dec 2021 16:16:35 +0000
Message-Id: <20211214161636.1886900-18-clabbe@baylibre.com>
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

From: Hans Verkuil <hans.verkuil@cisco.com>

Do not spam the kernel log with messages that result from incorrect
userspace input. Those should be either dropped completely (the error
code gives sufficient info) or changed to debug messages.

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_device.c |  8 ++++----
 drivers/staging/media/zoran/zoran_driver.c | 22 +++++++++++-----------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index 294e459307c3..8f60db4e44c1 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -239,7 +239,7 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 	wa = tvn->wa;
 	ha = tvn->ha;
 
-	pci_info(zr->pci_dev, "set_vfe() - width = %d, height = %d\n", video_width, video_height);
+	pci_dbg(zr->pci_dev, "set_vfe() - width = %d, height = %d\n", video_width, video_height);
 
 	if (video_width < BUZ_MIN_WIDTH ||
 	    video_height < BUZ_MIN_HEIGHT ||
@@ -664,7 +664,7 @@ void zr36057_enable_jpg(struct zoran *zr, enum zoran_codec_mode mode)
 		zr36057_set_jpg(zr, mode);	// \P_Reset, ... Video param, FIFO
 
 		clear_interrupt_counters(zr);
-		pci_info(zr->pci_dev, "enable_jpg(MOTION_COMPRESS)\n");
+		pci_dbg(zr->pci_dev, "enable_jpg(MOTION_COMPRESS)\n");
 		break;
 	}
 
@@ -693,7 +693,7 @@ void zr36057_enable_jpg(struct zoran *zr, enum zoran_codec_mode mode)
 		zr36057_set_jpg(zr, mode);	// \P_Reset, ... Video param, FIFO
 
 		clear_interrupt_counters(zr);
-		pci_info(zr->pci_dev, "enable_jpg(MOTION_DECOMPRESS)\n");
+		pci_dbg(zr->pci_dev, "enable_jpg(MOTION_DECOMPRESS)\n");
 		break;
 
 	case BUZ_MODE_IDLE:
@@ -720,7 +720,7 @@ void zr36057_enable_jpg(struct zoran *zr, enum zoran_codec_mode mode)
 		decoder_call(zr, video, s_stream, 1);
 		encoder_call(zr, video, s_routing, 0, 0, 0);
 
-		pci_info(zr->pci_dev, "enable_jpg(IDLE)\n");
+		pci_dbg(zr->pci_dev, "enable_jpg(IDLE)\n");
 		break;
 	}
 }
diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 367fe4be8357..013efdecd582 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -171,7 +171,7 @@ static int zoran_v4l_set_format(struct zoran *zr, int width, int height,
 
 	if (height < BUZ_MIN_HEIGHT || width < BUZ_MIN_WIDTH ||
 	    height > BUZ_MAX_HEIGHT || width > BUZ_MAX_WIDTH) {
-		pci_err(zr->pci_dev, "%s - wrong frame size (%dx%d)\n", __func__, width, height);
+		pci_dbg(zr->pci_dev, "%s - wrong frame size (%dx%d)\n", __func__, width, height);
 		return -EINVAL;
 	}
 
@@ -181,7 +181,7 @@ static int zoran_v4l_set_format(struct zoran *zr, int width, int height,
 
 	/* Check against available buffer size */
 	if (height * width * bpp > zr->buffer_size) {
-		pci_err(zr->pci_dev, "%s - video buffer size (%d kB) is too small\n",
+		pci_dbg(zr->pci_dev, "%s - video buffer size (%d kB) is too small\n",
 			__func__, zr->buffer_size >> 10);
 		return -EINVAL;
 	}
@@ -189,7 +189,7 @@ static int zoran_v4l_set_format(struct zoran *zr, int width, int height,
 	/* The video front end needs 4-byte alinged line sizes */
 
 	if ((bpp == 2 && (width & 1)) || (bpp == 3 && (width & 3))) {
-		pci_err(zr->pci_dev, "%s - wrong frame alignment\n", __func__);
+		pci_dbg(zr->pci_dev, "%s - wrong frame alignment\n", __func__);
 		return -EINVAL;
 	}
 
@@ -205,7 +205,7 @@ static int zoran_set_norm(struct zoran *zr, v4l2_std_id norm)
 {
 
 	if (!(norm & zr->card.norms)) {
-		pci_err(zr->pci_dev, "%s - unsupported norm %llx\n", __func__, norm);
+		pci_dbg(zr->pci_dev, "%s - unsupported norm %llx\n", __func__, norm);
 		return -EINVAL;
 	}
 
@@ -231,7 +231,7 @@ static int zoran_set_input(struct zoran *zr, int input)
 		return 0;
 
 	if (input < 0 || input >= zr->card.inputs) {
-		pci_err(zr->pci_dev, "%s - unsupported input %d\n", __func__, input);
+		pci_dbg(zr->pci_dev, "%s - unsupported input %d\n", __func__, input);
 		return -EINVAL;
 	}
 
@@ -532,7 +532,7 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *__fh,
 		if (fmt->fmt.pix.pixelformat == zoran_formats[i].fourcc)
 			break;
 	if (i == NUM_FORMATS) {
-		pci_err(zr->pci_dev, "VIDIOC_S_FMT - unknown/unsupported format 0x%x\n",
+		pci_dbg(zr->pci_dev, "VIDIOC_S_FMT - unknown/unsupported format 0x%x\n",
 			fmt->fmt.pix.pixelformat);
 		/* TODO do not return here to fix the TRY_FMT cannot handle an invalid pixelformat*/
 		return -EINVAL;
@@ -666,7 +666,7 @@ static int zoran_g_selection(struct file *file, void *__fh, struct v4l2_selectio
 
 	if (sel->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
 	    sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE) {
-		pci_err(zr->pci_dev, "%s invalid selection type combination\n", __func__);
+		pci_dbg(zr->pci_dev, "%s invalid selection type combination\n", __func__);
 		return -EINVAL;
 	}
 
@@ -712,7 +712,7 @@ static int zoran_s_selection(struct file *file, void *__fh, struct v4l2_selectio
 		return -EINVAL;
 
 	if (zr->map_mode == ZORAN_MAP_MODE_RAW) {
-		pci_err(zr->pci_dev, "VIDIOC_S_SELECTION - subcapture only supported for compressed capture\n");
+		pci_dbg(zr->pci_dev, "VIDIOC_S_SELECTION - subcapture only supported for compressed capture\n");
 		return -EINVAL;
 	}
 
@@ -937,7 +937,7 @@ static int zr_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
 	zr->vbseq = 0;
 
 	if (zr->map_mode != ZORAN_MAP_MODE_RAW) {
-		pci_info(zr->pci_dev, "START JPG\n");
+		pci_dbg(zr->pci_dev, "START JPG\n");
 		zr36057_restart(zr);
 		zoran_init_hardware(zr);
 		if (zr->map_mode == ZORAN_MAP_MODE_JPG_REC)
@@ -951,7 +951,7 @@ static int zr_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
 		return 0;
 	}
 
-	pci_info(zr->pci_dev, "START RAW\n");
+	pci_dbg(zr->pci_dev, "START RAW\n");
 	zr36057_restart(zr);
 	zoran_init_hardware(zr);
 
@@ -1001,7 +1001,7 @@ static void zr_vb2_stop_streaming(struct vb2_queue *vq)
 	}
 	spin_unlock_irqrestore(&zr->queued_bufs_lock, flags);
 	if (zr->buf_in_reserve)
-		pci_err(zr->pci_dev, "Buffer remaining %d\n", zr->buf_in_reserve);
+		pci_dbg(zr->pci_dev, "Buffer remaining %d\n", zr->buf_in_reserve);
 	zr->map_mode = ZORAN_MAP_MODE_RAW;
 }
 
-- 
2.32.0

