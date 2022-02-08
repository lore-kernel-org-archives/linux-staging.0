Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B1B2F25
	for <linux-staging@lists.linux.dev>; Tue,  8 Feb 2022 10:55:02 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id on2so7475037pjb.4
        for <linux-staging@lists.linux.dev>; Tue, 08 Feb 2022 02:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JpFe2MD1E+2DPoXg543PglALXj4OP+/vcuv1a1idPqs=;
        b=deOHRpDN7/U/V2+1GsKT9q4cej3QCC1mv9oreCRy2yqCzqwof20GqvzEGli/OdHxZp
         XbF3QBT3Th2t6JVa2oGczJxri5/zN1rZQOLve5TxfB5GgIpK5tzEM08Ad2tDnXi2n3L1
         QkJwk/5mWQ/oqiRINLAHiGlQgQye9NmBNdHJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JpFe2MD1E+2DPoXg543PglALXj4OP+/vcuv1a1idPqs=;
        b=KdMmOBWjMedbu+AWwCAPFJZgD9AflrBTijGJxoottyu0fJOtE+chBszMF0gAuB9tS6
         NAhrGnHV280FaZ7XgEVGWM06Pb0DTL7UGD+JNUXb+uQy0h9ReEWtB8pcSi2xcEdnXCzZ
         SAOKw84i+BTjBAGwD+wEV4+t+REH925x9ihjhOAHLHDbOWO77zo4obZMtirP5b8o1w68
         ceQeHZY6FMTSjDr0GmtpyX+1QUaUE9zEqJm3424f9hIqA6w83XyUT/qZi54kkSWgQ2kd
         okDELkn+CFEPtf5mgEzPb1xmzkPSr4rCVfyAj63C4BNxCSPVXrjA4vzPGSv1gLn1VOnw
         UGkQ==
X-Gm-Message-State: AOAM531Rb4nqEvyL4ojEMK215OZ0voDLmFJUCmHMAXu5I5sTnpo0ICL9
	KdSwRekAQJ3jxvZL20ZCVY3Jow==
X-Google-Smtp-Source: ABdhPJzxCELfUQ71vOBWo/X6NxZxybbY8TJpqWcbbxZ9oEXImbmiUN5OoLbviGkL9g1oIynidlrpnw==
X-Received: by 2002:a17:902:dcca:: with SMTP id t10mr3844961pll.133.1644317702158;
        Tue, 08 Feb 2022 02:55:02 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:41b6:813e:c823:609c])
        by smtp.gmail.com with ESMTPSA id e17sm14907277pfv.101.2022.02.08.02.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 02:55:01 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC] media: hantro: Implement support for encoder commands
Date: Tue,  8 Feb 2022 18:54:56 +0800
Message-Id: <20220208105456.321294-1-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The V4L2 stateful encoder uAPI specification requires that drivers
support the ENCODER_CMD ioctl to allow draining of buffers. This
however was not implemented, and causes issues for some userspace
applications.

Implement support for the ENCODER_CMD ioctl using v4l2-mem2mem helpers.
This is entirely based on existing code found in the vicodec test
driver.

Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---

This is based on linux-next-20220207, and was tested on RK3399 with
Gstreamer running the JPEG encoder. It was also tested on ChromeOS
5.10 on Kevin with the video encoder used in ChromeOS ARC, which
requires this.

Everything works OK, but since I'm not very familiar with the mem2mem
framework, I might be missing something, causing resource leaks.
Hence this patch is labeled RFC.

---
 drivers/staging/media/hantro/hantro_drv.c  | 10 +++++
 drivers/staging/media/hantro/hantro_v4l2.c | 44 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index bc9bcb4eaf46..ccd47eee5c43 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -56,6 +56,10 @@ dma_addr_t hantro_get_ref(struct hantro_ctx *ctx, u64 ts)
 	return hantro_get_dec_buf_addr(ctx, buf);
 }
 
+static const struct v4l2_event hantro_eos_event = {
+	.type = V4L2_EVENT_EOS
+};
+
 static void hantro_job_finish_no_pm(struct hantro_dev *vpu,
 				    struct hantro_ctx *ctx,
 				    enum vb2_buffer_state result)
@@ -73,6 +77,12 @@ static void hantro_job_finish_no_pm(struct hantro_dev *vpu,
 	src->sequence = ctx->sequence_out++;
 	dst->sequence = ctx->sequence_cap++;
 
+	if (v4l2_m2m_is_last_draining_src_buf(ctx->fh.m2m_ctx, src)) {
+		dst->flags |= V4L2_BUF_FLAG_LAST;
+		v4l2_event_queue_fh(&ctx->fh, &hantro_eos_event);
+		v4l2_m2m_mark_stopped(ctx->fh.m2m_ctx);
+	}
+
 	v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx,
 					 result);
 }
diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index 67148ba346f5..8c6746637236 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -628,6 +628,39 @@ static int vidioc_s_selection(struct file *file, void *priv,
 	return 0;
 }
 
+static const struct v4l2_event hantro_eos_event = {
+	.type = V4L2_EVENT_EOS
+};
+
+static int vidioc_encoder_cmd(struct file *file, void *priv,
+			      struct v4l2_encoder_cmd *ec)
+{
+	struct hantro_ctx *ctx = fh_to_ctx(priv);
+	int ret;
+
+	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, priv, ec);
+	if (ret < 0)
+		return ret;
+
+	if (!vb2_is_streaming(v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)) ||
+	    !vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)))
+		return 0;
+
+	ret = v4l2_m2m_ioctl_encoder_cmd(file, priv, ec);
+	if (ret < 0)
+		return ret;
+
+	if (ec->cmd == V4L2_ENC_CMD_STOP &&
+	    v4l2_m2m_has_stopped(ctx->fh.m2m_ctx))
+		v4l2_event_queue_fh(&ctx->fh, &hantro_eos_event);
+
+	if (ec->cmd == V4L2_ENC_CMD_START &&
+	    v4l2_m2m_has_stopped(ctx->fh.m2m_ctx))
+		vb2_clear_last_buffer_dequeued(&ctx->fh.m2m_ctx->cap_q_ctx.q);
+
+	return 0;
+}
+
 const struct v4l2_ioctl_ops hantro_ioctl_ops = {
 	.vidioc_querycap = vidioc_querycap,
 	.vidioc_enum_framesizes = vidioc_enum_framesizes,
@@ -657,6 +690,9 @@ const struct v4l2_ioctl_ops hantro_ioctl_ops = {
 
 	.vidioc_g_selection = vidioc_g_selection,
 	.vidioc_s_selection = vidioc_s_selection,
+
+	.vidioc_try_encoder_cmd = v4l2_m2m_ioctl_try_encoder_cmd,
+	.vidioc_encoder_cmd = vidioc_encoder_cmd,
 };
 
 static int
@@ -759,6 +795,8 @@ static int hantro_start_streaming(struct vb2_queue *q, unsigned int count)
 	struct hantro_ctx *ctx = vb2_get_drv_priv(q);
 	int ret = 0;
 
+	v4l2_m2m_update_start_streaming_state(ctx->fh.m2m_ctx, q);
+
 	if (V4L2_TYPE_IS_OUTPUT(q->type))
 		ctx->sequence_out = 0;
 	else
@@ -831,6 +869,12 @@ static void hantro_stop_streaming(struct vb2_queue *q)
 		hantro_return_bufs(q, v4l2_m2m_src_buf_remove);
 	else
 		hantro_return_bufs(q, v4l2_m2m_dst_buf_remove);
+
+	v4l2_m2m_update_stop_streaming_state(ctx->fh.m2m_ctx, q);
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type) &&
+	    v4l2_m2m_has_stopped(ctx->fh.m2m_ctx))
+		v4l2_event_queue_fh(&ctx->fh, &hantro_eos_event);
 }
 
 static void hantro_buf_request_complete(struct vb2_buffer *vb)
-- 
2.35.0.263.gb82422642f-goog

