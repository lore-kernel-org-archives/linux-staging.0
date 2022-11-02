Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689752108
	for <linux-staging@lists.linux.dev>; Wed,  2 Nov 2022 13:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1667395007; x=1698931007;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cOD+lDlaA4B/ArMiUay7i5XoiBIAeb6MV0seZdHgvxg=;
  b=BZ/N1X1HcbLDJvmRjoPrW+E/KIjKgoGKWf89PkB/p5+dIeIWRwsgRt/r
   wb+xrl0UPpWyzKI2dUJDoovz3gsrJJZjbfcf9ZBhrt7OHgIXmOfjz/rhU
   7YPBkAc26Qx+xFlSI83dsO53vCzyv4vIRLwQlfh5+k1c92Wxm5gXduDDE
   Z7u5XysrnNrY3godR3OQPnnR/Ow1delVUHlhBYG58ixxR3b5qRnEiFkPo
   OllLrik/XoY3YM2WZBS2ZsDWcEscrxPguZRrW0nPIcjN1FE0F2su3mEMN
   MAOayk6kxm3+MZiiFX4IwhW9sU6HZDklvqkJd/0XZmIQjW/ltIeob/4O7
   A==;
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="185022392"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Nov 2022 06:15:37 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 2 Nov 2022 06:15:38 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Wed, 2 Nov 2022 06:15:36 -0700
From: Eugen Hristev <eugen.hristev@microchip.com>
To: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<hverkuil-cisco@xs4all.nl>, <jacopo@jmondi.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-staging@lists.linux.dev>,
	Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v11 6/6] media: microchip: microchip-isc: move media_pipeline_* to (un)prepare cb
Date: Wed, 2 Nov 2022 15:15:00 +0200
Message-ID: <20221102131500.476024-7-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221102131500.476024-1-eugen.hristev@microchip.com>
References: <20221102131500.476024-1-eugen.hristev@microchip.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Move the media_pipeline_start/stop calls from start/stop streaming to
the new prepare_streaming and unprepare_streaming callbacks.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 .../platform/microchip/microchip-isc-base.c   | 27 ++++++++++++-------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index 00651c313e9d..eed96e2a6a00 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -328,6 +328,13 @@ static int isc_configure(struct isc_device *isc)
 	return isc_update_profile(isc);
 }
 
+static int isc_prepare_streaming(struct vb2_queue *vq)
+{
+	struct isc_device *isc = vb2_get_drv_priv(vq);
+
+	return media_pipeline_start(isc->video_dev.entity.pads, &isc->mpipe);
+}
+
 static int isc_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct isc_device *isc = vb2_get_drv_priv(vq);
@@ -336,10 +343,6 @@ static int isc_start_streaming(struct vb2_queue *vq, unsigned int count)
 	unsigned long flags;
 	int ret;
 
-	ret = media_pipeline_start(isc->video_dev.entity.pads, &isc->mpipe);
-	if (ret)
-		goto err_pipeline_start;
-
 	/* Enable stream on the sub device */
 	ret = v4l2_subdev_call(isc->current_subdev->sd, video, s_stream, 1);
 	if (ret && ret != -ENOIOCTLCMD) {
@@ -389,9 +392,6 @@ static int isc_start_streaming(struct vb2_queue *vq, unsigned int count)
 	v4l2_subdev_call(isc->current_subdev->sd, video, s_stream, 0);
 
 err_start_stream:
-	media_pipeline_stop(isc->video_dev.entity.pads);
-
-err_pipeline_start:
 	spin_lock_irqsave(&isc->dma_queue_lock, flags);
 	list_for_each_entry(buf, &isc->dma_queue, list)
 		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
@@ -401,6 +401,14 @@ static int isc_start_streaming(struct vb2_queue *vq, unsigned int count)
 	return ret;
 }
 
+static void isc_unprepare_streaming(struct vb2_queue *vq)
+{
+	struct isc_device *isc = vb2_get_drv_priv(vq);
+
+	/* Stop media pipeline */
+	media_pipeline_stop(isc->video_dev.entity.pads);
+}
+
 static void isc_stop_streaming(struct vb2_queue *vq)
 {
 	struct isc_device *isc = vb2_get_drv_priv(vq);
@@ -430,9 +438,6 @@ static void isc_stop_streaming(struct vb2_queue *vq)
 	if (ret && ret != -ENOIOCTLCMD)
 		v4l2_err(&isc->v4l2_dev, "stream off failed in subdev\n");
 
-	/* Stop media pipeline */
-	media_pipeline_stop(isc->video_dev.entity.pads);
-
 	/* Release all active buffers */
 	spin_lock_irqsave(&isc->dma_queue_lock, flags);
 	if (unlikely(isc->cur_frm)) {
@@ -472,6 +477,8 @@ static const struct vb2_ops isc_vb2_ops = {
 	.start_streaming	= isc_start_streaming,
 	.stop_streaming		= isc_stop_streaming,
 	.buf_queue		= isc_buffer_queue,
+	.prepare_streaming	= isc_prepare_streaming,
+	.unprepare_streaming	= isc_unprepare_streaming,
 };
 
 static int isc_querycap(struct file *file, void *priv,
-- 
2.25.1

