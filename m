Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626B6358D16
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 10:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770027695; cv=none; b=hrMpd/0irIVJT1zAXKYMP8us2KtpSGuwhYjGCPV3ETZSn7dU50tv2nZdU1gVHbwzcnZk8KdaZevruNfeatGUFtxGSJP7/twbt7pBzFCEZx2tvf7B/H+FnVnw9J1ofdI6K4E0fl3j/xzkfjiKOw4SNRzwk/eWS8Moc3AAY3DE7cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770027695; c=relaxed/simple;
	bh=RVym36iHa0D9PB8wcICXIbzfqYxAUHus/xA6pircK8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q7GzeD/w4xED1VG5OHaQuA0DRs9Xp1wutQZR5+lAphX1VLouBh9/qLPQXB/6lie0XCXkqqco1q5yb71gCbjOxkXdnWfuLSYHlSdHXTHMCj+IREtsU/PRZn5mblCdFEVSAuph/E10fLhJx/RFeqN1TA6ixI4ucni79PKXETetSQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nM3BhkfD; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nM3BhkfD"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-435f177a8f7so3184076f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 02:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770027692; x=1770632492; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlH5d3Pp8tQ/A6zHD9El45ieDfHm2GOFvP06basgclY=;
        b=nM3BhkfDLGdPE6dSv9vsQ6ej+LPexsEieLDkKoYYIK4nI+rCun9aNJZGcrxfwYWBgD
         yZGmkYW1LvrJrmpm5CaJ/Gkn7vnyn8KoJant4THnmJE7u4qkEq6KRpSZdW5vPqCMHcyU
         KFMhjrzt51ALmBKN50NmneQY0eQCUztH0hxrVoeQ/zvQjol2Gtx4Kqtl10/Z1yB4Jnir
         jq9dR8RUYAcgM6lJa7FhBkOBGlgTI2Uwmz5dgLJn3KNhbG7M8tFYejSwt0uArDzlwy06
         BCODVYBWNcKf9/BTw1avzk12Ii0BPGl5ZzFx8ccP50pqAwj6oFsV42o4PopoW+sus7Aa
         kT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770027692; x=1770632492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xlH5d3Pp8tQ/A6zHD9El45ieDfHm2GOFvP06basgclY=;
        b=HBrlarZi0KdGgSlsrFekgrSrDAj6gREg+CKzrktFsf0RKLnsyNPpWQpeMEU0zhTbD+
         SJQxcfR/7jfe9y9eRRGqC+syU8kCaYLHpTTRMg/2jRXZr5u1IymUE7F9786zlae7Vjyl
         7TfNmMR/47tJFMmUg1y2fI3uHE6ww6H44zg6conyg+pHLof/6rlJA9fs9n+thuavIQEu
         cdMQVUY6eoAQ7I0U/Fq3t9eq+oKVpiZiJ9bpjxC79bXrxucBxXbXB5LWhSeaBzaMsKjW
         7dfUX/+V9paW9pfCbzqTT/yaTUS+tIhnFJXheY3V6ZKSf4RD63whH2QBxNtoYhvRH8Gt
         L5Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXXA/o1i2jNFF+KmaVDEPrld8/FBjZR3kg6JwzZWuoSg31Fts5B3nILJtYB9eR7ZxBzKwggPX9mVlvZjxVu@lists.linux.dev
X-Gm-Message-State: AOJu0YzD20LUfMxPU1NsLgg78P+0e+MT9HhlCvXFn1hToJG43SZ1PEUr
	BkdIHhh8A5kXYV1CjUt60zSABCuLs51LqislfMeQ8yDFDYC4lbwyyR3Z
X-Gm-Gg: AZuq6aJcii3h016XOskVJiE2y47tdxWUjbOKYIKpbzOCrG8+cfnnrJ/Yk6qPo0xb0Ji
	Kwx8ITMaThrZ9V4qWCN8qTJ+h1BuCwYlMhd3oCzK76ukEJlAJZPcJ4TI4siMMLRuRcPtArg/a3W
	SD0Neu0g1GYZZifGF7DBa8TbhRiV2Yw2L4PvVhagsZZG5N7jsgLmUiYJoz+qYR9v7znvJFGIsjJ
	DkKyknnc6e2sE5P2cgzMBUzB1u3sDEswF3CMu5xslwLdEe79oQrUqKdQ1W7PxzdbQKGkl6sExo6
	QB8RrwY2zZwzfZljyr+ansohoi/fXWCccWdCEiCSChL6sptxQEPgSGtbpoWUgpGmt4MmAcS/qt7
	ECDWBgxfHYw5OootOI7bMbAPuQM0k/E3dpvKjNMiRLiCNbrXj+Tne42NQHW153CElYMI/Dy4B1c
	TJsXmOcrsQclkYjeqqICoNcFXYNpQKf1rbZ1eXGw==
X-Received: by 2002:a05:6000:420d:b0:430:f65d:c0df with SMTP id ffacd0b85a97d-435f3abb44dmr16989904f8f.56.1770027691624;
        Mon, 02 Feb 2026 02:21:31 -0800 (PST)
Received: from DESKTOP-VOVUFNJ.localdomain ([5.14.81.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce64sm44667193f8f.26.2026.02.02.02.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 02:21:31 -0800 (PST)
From: Bogdan Sandu <bogdanelsandu2011@gmail.com>
To: gregkh@linuxfoundation.org
Cc: bingbu.cao@intel.com,
	bogdanelsandu2011@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	tian.shu.qiu@intel.com
Subject: [PATCH] Cleanup ipu3 driver
Date: Mon,  2 Feb 2026 12:18:44 +0200
Message-ID: <20260202102033.9642-3-bogdanelsandu2011@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202102033.9642-2-bogdanelsandu2011@gmail.com>
References: <2026020258-very-numbly-b36b@gregkh>
 <20260202102033.9642-2-bogdanelsandu2011@gmail.com>
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

