Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930EA337B87
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 10:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026620; cv=none; b=Y71GkNIJisIm47/1KIP1usHAvLg7Adg0kYCc2UG+BO9/7IKR83yusUGlnLYGX+H9jAPSD8Uc6a78wpi405hSQK3DuCV5RPynwyhhNu0o3949gvERABeOjgVF7rMlUTYRvOBsnoXYkc0GkwG6w+dOuw62EZwWU5dsa4zWIDGA0S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026620; c=relaxed/simple;
	bh=RVym36iHa0D9PB8wcICXIbzfqYxAUHus/xA6pircK8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=suUBb2o8roZKSrG7uY8gbsJtQLR1A7tTajIx1dEnZBldUblP6B1rt7/XsjjvHKG1891kKlMefavI8vPMIA1b22Qeu5oZ5tJTDA7PXLw5nSiOdd9AwLvVENUaeqHEfMTmNI3yGC54LB8EctiW+8Ua7laP0Zj6r2LCHwAdk7midkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A9Ag++OP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A9Ag++OP"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47ee07570deso35289075e9.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 02:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770026617; x=1770631417; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xlH5d3Pp8tQ/A6zHD9El45ieDfHm2GOFvP06basgclY=;
        b=A9Ag++OPZ617rCWwDhdlanSxxx5CBUnaIqen+nmINctMINZ6bmMVkSdviOedcGaywA
         Jipekt1HgBITs6+ZL+TeYNZVgKlk2ZXETjSVic0Mn7SCUALcV2K34lrqioL6KH90sXm+
         ySaLyH3PVs/GSchYbYzNepEbxmyLCcRyGqxQ9brOxQHI7lyGZ55R8Ef2kGBm1b4dgN5E
         uoAvU4ObP0KUO7jD0HNcnzbFteRl83fYjuDNwjBc454z3WXSKvbbVcjw+uw2oSl/2d/q
         yYT5z+o0YUotc/kdZ2oP0iQx1M+xHCJMLiirgIE47ADo9Hsp/HH1jFzJrpn+FlCJCI+w
         MwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770026617; x=1770631417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlH5d3Pp8tQ/A6zHD9El45ieDfHm2GOFvP06basgclY=;
        b=J7oaWP/EBaLeSGe28FkJaVYpVXMG65825ryENjLpOrEgKkEhPBlrwKqA1Epqbx8fyK
         8z85mJ0F/fnKTRBBdPj6hZ0mRTMciJvOTFiborgu8X888Q+Vh51iWgPcXbSrT8q17jg0
         QttW03sL3/cMQXDfZQc/Nc0q6XYCZ7WQXV1cCVRV+L8/8Hmiwk3kUvLrhoYKsIQdxai2
         +JFg/2HT1Wb4skyevdZL5HPIqM1WMpN3WNxygFpDChbw/WGfU1gw2qRQHGXPZ72sSr5p
         5IMWUFRaFanecKDE/wS4BYrRlg2wtJ6wwaPBeTnrjF5/9VM8LYAYvdTrH1aclS8Ws/pF
         eF3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWTcCkL5jzuoyKmI8uCG0VdrIxcmnCwX6868Z667bgif0UfLzomcLj4jQfdVaqrD8M5wTCMZlprcNyAGpP@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6r23zX0d98aB1tMxwvWkc+rLDeX9sge3tHOv9jAzq7ohlYuVu
	zjIQZPUnfh/L3yzJG0bmk128kVPixWIiz2dvtZpnh82JC930p4Q8PeWD
X-Gm-Gg: AZuq6aLit12X5mILLMaaBpgKwWQoVZY2sRkd7fPOg+gftNwnVBeycK5x9B801CJBS93
	OPIQYLO1L9kTyvpUYC/Rmz6ON3ArQh6439z6UWrIM7eMyhgLgmzEBXyuWzv1w1rSZyWW3Z+ietn
	bakrRshAcElH1CoFIt3bWknAl4e5Y5HlIjl3Xf5ihgAIy/sqaLngPmxMy/QdBgzMI3MjL8beEKU
	5pA4TQLB1sATEDiglgKjaMUrvL1+/X5DbVLqUDD47sZY2XoUv7HzmCfsNrXLhYlkgpsBP0fi/3m
	VFRaoKgBlgn6ea4is1cw6imxvUoMssDQHyuQqlj3RsEIcw0mDGxRTMt4YWHtCRZuhatlZzIwBdS
	pSpmkh3oKItfpG5tidACWn4lVgpxX9u/HH7W1ApnV7N4pluHH0Z69ndKCCl27RWEZPdYM9oT57q
	TtmIhu3IlKOkkswc8afqiF3qrEC+EoRmcfSmM4iQ==
X-Received: by 2002:a05:600c:3586:b0:477:582e:7a81 with SMTP id 5b1f17b1804b1-482db45237cmr176015855e9.4.1770026616531;
        Mon, 02 Feb 2026 02:03:36 -0800 (PST)
Received: from DESKTOP-VOVUFNJ.localdomain ([5.14.81.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4762sm40974340f8f.6.2026.02.02.02.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 02:03:36 -0800 (PST)
From: Bogdan Sandu <bogdanelsandu2011@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	tian.shu.qiu@intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bogdanelsandu2011@gmail.com
Subject: [PATCH] Cleanup ipu3 driver
Date: Mon,  2 Feb 2026 12:03:11 +0200
Message-ID: <20260202100310.4425-2-bogdanelsandu2011@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up warnings generated by ./scripts/checkpatch.pl regarding the ipu3 driver at /drivers/staging/media/ipu3

More specifically, the following files have been affected: ipu3-css.c, ipu3-mmu.c, ipu3-mmu.h, ipu3-v4l2.c, ipu3.c, ipu3.h

Signed-off-by: Bogdan Sandu <bogdanelsandu2011@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-css.c  | 39 ++++++++++++--------------
 drivers/staging/media/ipu3/ipu3-mmu.c  |  2 +-
 drivers/staging/media/ipu3/ipu3-mmu.h  |  4 ++-
 drivers/staging/media/ipu3/ipu3-v4l2.c | 11 ++++----
 drivers/staging/media/ipu3/ipu3.c      |  7 ++---
 5 files changed, 30 insertions(+), 33 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index 777cac1c2..832581547 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -118,7 +118,8 @@ static const struct {
 
 /* Initialize queue based on given format, adjust format as needed */
 static int imgu_css_queue_init(struct imgu_css_queue *queue,
-			       struct v4l2_pix_format_mplane *fmt, u32 flags)
+			       struct v4l2_pix_format_mplane *fmt,
+			       u32 flags)
 {
 	struct v4l2_pix_format_mplane *const f = &queue->fmt.mpix;
 	unsigned int i;
@@ -1033,8 +1034,8 @@ static int imgu_css_pipeline_init(struct imgu_css *css, unsigned int pipe)
 			       3 * cfg_dvs->num_horizontal_blocks / 2 *
 			       cfg_dvs->num_vertical_blocks) ||
 	    imgu_css_pool_init(imgu, &css_pipe->pool.obgrid,
-			       imgu_css_fw_obgrid_size(
-			       &css->fwp->binary_header[css_pipe->bindex])))
+			       imgu_css_fw_obgrid_size
+			       (&css->fwp->binary_header[css_pipe->bindex])))
 		goto out_of_memory;
 
 	for (i = 0; i < IMGU_ABI_NUM_MEMORIES; i++)
@@ -1225,8 +1226,7 @@ static int imgu_css_binary_setup(struct imgu_css *css, unsigned int pipe)
 
 	for (j = IMGU_ABI_PARAM_CLASS_CONFIG; j < IMGU_ABI_PARAM_CLASS_NUM; j++)
 		for (i = 0; i < IMGU_ABI_NUM_MEMORIES; i++) {
-			if (imgu_css_dma_buffer_resize(
-			    imgu,
+			if (imgu_css_dma_buffer_resize(imgu,
 			    &css_pipe->binary_params_cs[j - 1][i],
 			    bi->info.isp.sp.mem_initializers.params[j][i].size))
 				goto out_of_memory;
@@ -1241,6 +1241,7 @@ static int imgu_css_binary_setup(struct imgu_css *css, unsigned int pipe)
 	css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_REF].height =
 				ALIGN(css_pipe->rect[IPU3_CSS_RECT_BDS].height,
 				      IMGU_DVS_BLOCK_H) + 2 * IMGU_GDC_BUF_Y;
+
 	h = css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_REF].height;
 	w = ALIGN(css_pipe->rect[IPU3_CSS_RECT_BDS].width,
 		  2 * IPU3_UAPI_ISP_VEC_ELEMS) + 2 * IMGU_GDC_BUF_X;
@@ -1248,10 +1249,9 @@ static int imgu_css_binary_setup(struct imgu_css *css, unsigned int pipe)
 		css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_REF].bytesperpixel * w;
 	size = w * h * BYPC + (w / 2) * (h / 2) * BYPC * 2;
 	for (i = 0; i < IPU3_CSS_AUX_FRAMES; i++)
-		if (imgu_css_dma_buffer_resize(
-			imgu,
-			&css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_REF].mem[i],
-			size))
+		if (imgu_css_dma_buffer_resize(imgu,
+					       &css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_REF].mem[i],
+					       size))
 			goto out_of_memory;
 
 	/* TNR frames for temporal noise reduction, FRAME_FORMAT_YUV_LINE */
@@ -1269,10 +1269,9 @@ static int imgu_css_binary_setup(struct imgu_css *css, unsigned int pipe)
 	h = css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_TNR].height;
 	size = w * ALIGN(h * 3 / 2 + 3, 2);	/* +3 for vf_pp prefetch */
 	for (i = 0; i < IPU3_CSS_AUX_FRAMES; i++)
-		if (imgu_css_dma_buffer_resize(
-			imgu,
-			&css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_TNR].mem[i],
-			size))
+		if (imgu_css_dma_buffer_resize(imgu,
+					       &css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_TNR].mem[i],
+					       size))
 			goto out_of_memory;
 
 	return 0;
@@ -2036,7 +2035,7 @@ struct imgu_css_buffer *imgu_css_buf_dequeue(struct imgu_css *css)
 				     struct imgu_css_buffer, list);
 		if (queue != b->queue ||
 		    daddr != css_pipe->abi_buffers
-			[b->queue][b->queue_pos].daddr) {
+		    [b->queue][b->queue_pos].daddr) {
 			spin_unlock(&css_pipe->qlock);
 			dev_err(css->dev, "dequeued bad buffer 0x%x\n", daddr);
 			return ERR_PTR(-EIO);
@@ -2169,7 +2168,7 @@ int imgu_css_set_parameters(struct imgu_css *css, unsigned int pipe,
 		map = imgu_css_pool_last(&css_pipe->pool.acc, 1);
 		/* user acc */
 		r = imgu_css_cfg_acc(css, pipe, use, acc, map->vaddr,
-			set_params ? &set_params->acc_param : NULL);
+				     set_params ? &set_params->acc_param : NULL);
 		if (r < 0)
 			goto fail;
 	}
@@ -2298,13 +2297,11 @@ int imgu_css_set_parameters(struct imgu_css *css, unsigned int pipe,
 	if (obgrid)
 		imgu_css_pool_put(&css_pipe->pool.obgrid);
 	if (vmem0)
-		imgu_css_pool_put(
-			&css_pipe->pool.binary_params_p
-			[IMGU_ABI_MEM_ISP_VMEM0]);
+		imgu_css_pool_put(&css_pipe->pool.binary_params_p
+				  [IMGU_ABI_MEM_ISP_VMEM0]);
 	if (dmem0)
-		imgu_css_pool_put(
-			&css_pipe->pool.binary_params_p
-			[IMGU_ABI_MEM_ISP_DMEM0]);
+		imgu_css_pool_put(&css_pipe->pool.binary_params_p
+				  [IMGU_ABI_MEM_ISP_DMEM0]);
 
 fail_no_put:
 	return r;
diff --git a/drivers/staging/media/ipu3/ipu3-mmu.c b/drivers/staging/media/ipu3/ipu3-mmu.c
index cb9bf5fb2..95ce34ad8 100644
--- a/drivers/staging/media/ipu3/ipu3-mmu.c
+++ b/drivers/staging/media/ipu3/ipu3-mmu.c
@@ -21,7 +21,7 @@
 #include "ipu3-mmu.h"
 
 #define IPU3_PT_BITS		10
-#define IPU3_PT_PTES		(1UL << IPU3_PT_BITS)
+#define IPU3_PT_PTES		(BIT(IPU3_PT_BITS))
 #define IPU3_PT_SIZE		(IPU3_PT_PTES << 2)
 #define IPU3_PT_ORDER		(IPU3_PT_SIZE >> PAGE_SHIFT)
 
diff --git a/drivers/staging/media/ipu3/ipu3-mmu.h b/drivers/staging/media/ipu3/ipu3-mmu.h
index a5f0bca7e..990482f10 100644
--- a/drivers/staging/media/ipu3/ipu3-mmu.h
+++ b/drivers/staging/media/ipu3/ipu3-mmu.h
@@ -5,8 +5,10 @@
 #ifndef __IPU3_MMU_H
 #define __IPU3_MMU_H
 
+#include <linux/bitops.h>
+
 #define IPU3_PAGE_SHIFT		12
-#define IPU3_PAGE_SIZE		(1UL << IPU3_PAGE_SHIFT)
+#define IPU3_PAGE_SIZE		(BIT(IPU3_PAGE_SHIFT))
 
 /**
  * struct imgu_mmu_info - Describes mmu geometry
diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 2f6041d34..8ebfcddab 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -245,9 +245,9 @@ static int imgu_subdev_set_selection(struct v4l2_subdev *sd,
 	struct v4l2_rect *rect;
 
 	dev_dbg(&imgu->pci_dev->dev,
-		 "set subdev %u sel which %u target 0x%4x rect [%ux%u]",
-		 imgu_sd->pipe, sel->which, sel->target,
-		 sel->r.width, sel->r.height);
+		"set subdev %u sel which %u target 0x%4x rect [%ux%u]",
+		imgu_sd->pipe, sel->which, sel->target,
+		sel->r.width, sel->r.height);
 
 	if (sel->pad != IMGU_NODE_IN)
 		return -EINVAL;
@@ -288,7 +288,7 @@ static int imgu_link_setup(struct media_entity *entity,
 	WARN_ON(pad >= IMGU_NODE_NUM);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u pad %u is %s", pipe, pad,
-		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
+		str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	imgu_pipe = &imgu->imgu_pipe[pipe];
 	imgu_pipe->nodes[pad].enabled = flags & MEDIA_LNK_FL_ENABLED;
@@ -303,7 +303,7 @@ static int imgu_link_setup(struct media_entity *entity,
 		__clear_bit(pipe, imgu->css.enabled_pipes);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u is %s", pipe,
-		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
+		str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	return 0;
 }
@@ -750,7 +750,6 @@ static int imgu_fmt(struct imgu_device *imgu, unsigned int pipe, int node,
 		} else {
 			fmts[i] = &imgu_pipe->nodes[inode].vdev_fmt.fmt.pix_mp;
 		}
-
 	}
 
 	if (!try) {
diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
index bdf5a4577..fe343d368 100644
--- a/drivers/staging/media/ipu3/ipu3.c
+++ b/drivers/staging/media/ipu3/ipu3.c
@@ -151,7 +151,7 @@ static int imgu_dummybufs_init(struct imgu_device *imgu, unsigned int pipe)
 
 /* May be called from atomic context */
 static struct imgu_css_buffer *imgu_dummybufs_get(struct imgu_device *imgu,
-						   int queue, unsigned int pipe)
+						  int queue, unsigned int pipe)
 {
 	unsigned int i;
 	struct imgu_media_pipe *imgu_pipe = &imgu->imgu_pipe[pipe];
@@ -556,8 +556,7 @@ static irqreturn_t imgu_isr_threaded(int irq, void *imgu_ptr)
 			buf->vid_buf.vbb.vb2_buf.timestamp = ns;
 			buf->vid_buf.vbb.field = V4L2_FIELD_NONE;
 			buf->vid_buf.vbb.sequence =
-				atomic_inc_return(
-				&imgu_pipe->nodes[node].sequence);
+				atomic_inc_return(&imgu_pipe->nodes[node].sequence);
 			dev_dbg(&imgu->pci_dev->dev, "vb2 buffer sequence %d",
 				buf->vid_buf.vbb.sequence);
 		}
@@ -774,7 +773,7 @@ static int __maybe_unused imgu_suspend(struct device *dev)
 	synchronize_irq(pci_dev->irq);
 	/* Wait until all buffers in CSS are done. */
 	if (!wait_event_timeout(imgu->buf_drain_wq,
-	    imgu_css_queue_empty(&imgu->css), msecs_to_jiffies(1000)))
+				imgu_css_queue_empty(&imgu->css), msecs_to_jiffies(1000)))
 		dev_err(dev, "wait buffer drain timeout.\n");
 
 	imgu_css_stop_streaming(&imgu->css);
-- 
2.51.0

