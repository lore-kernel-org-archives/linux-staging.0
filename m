Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795280580;
	b=l/pCs3hM/aBGtJSbOoIIAafFri2A1HwL67JrVOar9lV0yiEGmOJAElC9NblehvGK3JE+
	 w4kBUm25hxLNXVafNujx4yiTPuTzHnqIfZfSehV7fh7Fy3oLAfnE08gG/DLUkMMEONFss
	 tlzuV42KimK4o3DQ4cZ40tZrQUqA+uWXYDbd7x/e9rcnFYYyxPAxWFo6GLNEvz5N8t5T+
	 mBVsqQ8mLzWfQ9vxYwnUZKIKf+TNazIzK9xoJR2wFX4cFZUH1ZcxdciNq77DH1Y1ahv3I
	 TSvJCGZprx0bu8/qpBbbQGconb/wvzntiIhgPH/3ApuGJ68XbhINVbEiqpitLrmat2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795280580;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=uImbiWa3hhUfxifuX9eRyjzkvS253aNjkQ7n7UVUlm0=;
	b=EsUuG77QPDzyUKtho3GG1J0wRLO/2SigDQ8JBu83EXDhUW69vfui/2TqOF3C6v/DFCU0
	 ByDuKzWis+kdsNImgmz9DEfsZHwLuACAe9ycSZzCLhJITCNXXaJjMy8nwzA7j3SCO+7fQ
	 Grs/U2UhMwEjnKeHXoxoK+2uNhrhSl4kLO/TC97gjDS7YChGnXojCn+7Xpegivls48U3M
	 04j08hCm6wUWXn5KmcvO5z8WuxFIR5sK1VJVuSnkP9KLVBBatfIz8Uv94fXPIQ1R5G5ux
	 BXztj14U8XUr2I5qhfhedGmdIY73G3I0+TUAF2+5yW0PYVrrl0TVtrMuZYy5AavbXcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="i/BXdXQM";
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406FC606A320;
	Sat, 21 Nov 2026 17:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 406FC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=i/BXdXQM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=uImbiWa3hhUfxifuX9eRyjzkvS253aNjkQ7n7UVUlm0=;
	b=i/BXdXQMV9rPS+yNC+TD60ygwW//o2U+jMiwEcGexfP8/jdCet3bg4lIh+ctQY
	CmZS1POiwuy63U2XuGNLr42zLnH4d078/6gIBYq6aQ7xXCet87Q26pwCtCYU2f3W
	uKX9YMf6yTaqCnR9dQB/OQXiHf5ZGgFssKZrUm+Ei6Aok=
Received: from Ubuntu26.04LTS (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCXDkKozgFrr_GYHQ--.15432S4;
	Sun, 22 Nov 2026 01:02:34 +0800 (CST)
From: Jiaqi Shi <shijiaqi_develop@163.com>
To: linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-staging@lists.linux.dev
Cc: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	Frank.Li@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Jiaqi Shi <shijiaqi_develop@163.com>
Subject: [PATCH 2/2] media: v4l2-core: add frame interval monitor helper
Date: Sun, 22 Nov 2026 01:02:32 +0800
Message-ID: <20261121170232.414316-3-shijiaqi_develop@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121170232.414316-1-shijiaqi_develop@163.com>
References: <20261121170232.414316-1-shijiaqi_develop@163.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgCXDkKozgFrr_GYHQ--.15432S4
X-Coremail-Antispam: 1Uf129KBjvAXoWfCF4UXry3JFy5Aw17Xr48Xrb_yoW5GF4UZo
	WxGwsrZw4rCr18XFWvyw13JFW7Zan8Gw47Ar43tr90kF95Z398W34Ikwsxtw1rZa1YkFZ8
	Zw1fX39YqFWrXF18n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RZnYwUUUUU
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbCzgv4TGsBzqurvAAA3p

Move the generic frame interval monitoring implementation from i.MX
to v4l2-core. The helper supports driver-selected control and event
IDs and accepts EOF or external timestamps.

Keep the i.MX-specific input capture controls in the i.MX adapter,
sharing the original control handler and preserving the existing UAPI
and event semantics.

Select V4L2_FIM from VIDEO_IMX_MEDIA and remove the completed TODO.

Signed-off-by: Jiaqi Shi <shijiaqi_develop@163.com>
---
 drivers/media/v4l2-core/Kconfig           |   4 +
 drivers/media/v4l2-core/Makefile          |   1 +
 drivers/media/v4l2-core/v4l2-fim.c        | 331 ++++++++++++++++++++
 drivers/staging/media/imx/Kconfig         |   1 +
 drivers/staging/media/imx/TODO            |   3 -
 drivers/staging/media/imx/imx-media-fim.c | 355 ++++------------------
 include/media/v4l2-fim.h                  |  40 +++
 7 files changed, 429 insertions(+), 306 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-fim.c
 delete mode 100644 drivers/staging/media/imx/TODO
 create mode 100644 include/media/v4l2-fim.h

diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
index d50ccac9733c..cff961b24c04 100644
--- a/drivers/media/v4l2-core/Kconfig
+++ b/drivers/media/v4l2-core/Kconfig
@@ -40,6 +40,10 @@ config VIDEO_TUNER
 config V4L2_JPEG_HELPER
 	tristate
 
+# Used by drivers that need v4l2-fim.ko
+config V4L2_FIM
+	tristate
+
 # Used by drivers that need v4l2-h264.ko
 config V4L2_H264
 	tristate
diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index 329f0eadce99..d5f6699a2669 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -26,6 +26,7 @@ videodev-$(CONFIG_VIDEO_V4L2_I2C) += v4l2-i2c.o
 
 obj-$(CONFIG_V4L2_ASYNC) += v4l2-async.o
 obj-$(CONFIG_V4L2_CCI) += v4l2-cci.o
+obj-$(CONFIG_V4L2_FIM) += v4l2-fim.o
 obj-$(CONFIG_V4L2_FLASH_LED_CLASS) += v4l2-flash-led-class.o
 obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
 obj-$(CONFIG_V4L2_H264) += v4l2-h264.o
diff --git a/drivers/media/v4l2-core/v4l2-fim.c b/drivers/media/v4l2-core/v4l2-fim.c
new file mode 100644
index 000000000000..41bf77542471
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-fim.c
@@ -0,0 +1,331 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Frame Interval Monitor.
+ *
+ * Copyright (c) 2016 Mentor Graphics Inc.
+ */
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-fim.h>
+#include <media/v4l2-subdev.h>
+
+enum {
+	FIM_CL_ENABLE = 0,
+	FIM_CL_NUM,
+	FIM_CL_TOLERANCE_MIN,
+	FIM_CL_TOLERANCE_MAX,
+	FIM_CL_NUM_SKIP,
+};
+
+#define FIM_CL_ENABLE_DEF          0 /* FIM disabled by default */
+#define FIM_CL_NUM_DEF             8 /* average 8 frames */
+#define FIM_CL_NUM_SKIP_DEF        2 /* skip 2 frames after restart */
+#define FIM_CL_TOLERANCE_MIN_DEF  50 /* usec */
+#define FIM_CL_TOLERANCE_MAX_DEF   0 /* no max tolerance (unbounded) */
+
+struct v4l2_fim {
+	struct v4l2_subdev *sd;
+	struct v4l2_fim_config config;
+	struct v4l2_ctrl *ctrl[V4L2_FIM_NUM_CONTROLS];
+
+	spinlock_t lock; /* protect control values and monitoring state */
+
+	bool enabled;
+	int num_avg;
+	int num_skip;
+	unsigned long tolerance_min;
+	unsigned long tolerance_max;
+	bool external_timestamp;
+
+	int counter;
+	ktime_t last_ts;
+	unsigned long sum;
+	unsigned long nominal;
+	bool stream_on;
+};
+
+static void update_fim_nominal(struct v4l2_fim *fim,
+			       const struct v4l2_fract *fi)
+{
+	if (fi->denominator == 0) {
+		dev_dbg(fim->sd->dev, "no frame interval, FIM disabled\n");
+		fim->enabled = false;
+		return;
+	}
+
+	fim->nominal = DIV_ROUND_CLOSEST_ULL(1000000ULL * (u64)fi->numerator,
+					     fi->denominator);
+
+	dev_dbg(fim->sd->dev, "FI=%lu usec\n", fim->nominal);
+}
+
+static void reset_fim(struct v4l2_fim *fim, bool curval, struct v4l2_ctrl *ctrl)
+{
+	struct v4l2_ctrl *en = fim->ctrl[FIM_CL_ENABLE];
+	struct v4l2_ctrl *num = fim->ctrl[FIM_CL_NUM];
+	struct v4l2_ctrl *skip = fim->ctrl[FIM_CL_NUM_SKIP];
+	struct v4l2_ctrl *tol_min = fim->ctrl[FIM_CL_TOLERANCE_MIN];
+	struct v4l2_ctrl *tol_max = fim->ctrl[FIM_CL_TOLERANCE_MAX];
+	bool core_active = !curval && ctrl &&
+			   ctrl->cluster == en->cluster;
+
+	/*
+	 * When curval is false, read ->val only for controls in the cluster
+	 * currently being set; other clusters may hold uncommitted values.
+	 */
+	if (fim->config.external_timestamp)
+		fim->external_timestamp =
+			fim->config.external_timestamp(fim->config.priv, curval,
+						       !curval && !core_active);
+
+	if (!curval && core_active) {
+		fim->enabled = en->val;
+		fim->num_avg = num->val;
+		fim->num_skip = skip->val;
+		fim->tolerance_min = tol_min->val;
+		fim->tolerance_max = tol_max->val;
+	} else {
+		fim->enabled = en->cur.val;
+		fim->num_avg = num->cur.val;
+		fim->num_skip = skip->cur.val;
+		fim->tolerance_min = tol_min->cur.val;
+		fim->tolerance_max = tol_max->cur.val;
+	}
+
+	/* disable tolerance range if max <= min */
+	if (fim->tolerance_max <= fim->tolerance_min)
+		fim->tolerance_max = 0;
+
+	/* num_skip must be >= 1 if input capture not used */
+	if (!fim->external_timestamp)
+		fim->num_skip = max_t(int, fim->num_skip, 1);
+
+	fim->counter = -fim->num_skip;
+	fim->sum = 0;
+}
+
+void v4l2_fim_reset(struct v4l2_fim *fim, bool curval, struct v4l2_ctrl *ctrl)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&fim->lock, flags);
+	reset_fim(fim, curval, ctrl);
+	spin_unlock_irqrestore(&fim->lock, flags);
+}
+EXPORT_SYMBOL_GPL(v4l2_fim_reset);
+
+static void send_fim_event(struct v4l2_fim *fim)
+{
+	struct v4l2_event ev = {
+		.type = fim->config.event_type,
+	};
+
+	v4l2_subdev_notify_event(fim->sd, &ev);
+}
+
+/*
+ * Monitor an averaged frame interval. If the average deviates too much
+ * from the nominal frame rate, send the frame interval error event. The
+ * frame intervals are averaged in order to quiet noise from
+ * (presumably random) interrupt latency.
+ */
+static void frame_interval_monitor(struct v4l2_fim *fim, ktime_t timestamp)
+{
+	long long interval, error;
+	unsigned long error_avg;
+	bool send_event = false;
+
+	if (!fim->enabled || ++fim->counter <= 0)
+		goto out_update_ts;
+
+	/* max error is less than 100µs, so use 32-bit division or fail */
+	interval = ktime_to_ns(ktime_sub(timestamp, fim->last_ts));
+	error = abs(interval - NSEC_PER_USEC * (s64)fim->nominal);
+	if (error > U32_MAX)
+		error = U32_MAX;
+	else
+		error = abs((u32)error / NSEC_PER_USEC);
+
+	if (fim->tolerance_max && error >= fim->tolerance_max) {
+		dev_dbg(fim->sd->dev,
+			"FIM: %llu ignored, out of tolerance bounds\n",
+			error);
+		fim->counter--;
+		goto out_update_ts;
+	}
+
+	fim->sum += error;
+
+	if (fim->counter == fim->num_avg) {
+		error_avg = DIV_ROUND_CLOSEST(fim->sum, fim->num_avg);
+
+		if (error_avg > fim->tolerance_min)
+			send_event = true;
+
+		dev_dbg(fim->sd->dev, "FIM: error: %lu usec%s\n",
+			error_avg, send_event ? " (!!!)" : "");
+
+		fim->counter = 0;
+		fim->sum = 0;
+	}
+
+out_update_ts:
+	fim->last_ts = timestamp;
+	if (send_event)
+		send_fim_event(fim);
+}
+
+void v4l2_fim_eof_monitor(struct v4l2_fim *fim, ktime_t timestamp)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&fim->lock, flags);
+
+	if (!fim->external_timestamp)
+		frame_interval_monitor(fim, timestamp);
+
+	spin_unlock_irqrestore(&fim->lock, flags);
+}
+EXPORT_SYMBOL_GPL(v4l2_fim_eof_monitor);
+
+void v4l2_fim_monitor_timestamp(struct v4l2_fim *fim, ktime_t timestamp)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&fim->lock, flags);
+	frame_interval_monitor(fim, timestamp);
+	spin_unlock_irqrestore(&fim->lock, flags);
+}
+EXPORT_SYMBOL_GPL(v4l2_fim_monitor_timestamp);
+
+void v4l2_fim_set_stream(struct v4l2_fim *fim,
+			 const struct v4l2_fract *fi, bool on)
+{
+	unsigned long flags;
+
+	v4l2_ctrl_lock(fim->ctrl[FIM_CL_ENABLE]);
+
+	if (fim->stream_on == on)
+		goto out;
+
+	if (on) {
+		spin_lock_irqsave(&fim->lock, flags);
+		reset_fim(fim, true, NULL);
+		update_fim_nominal(fim, fi);
+		spin_unlock_irqrestore(&fim->lock, flags);
+
+		if (fim->external_timestamp && fim->enabled && !fim->num_skip &&
+		    fim->config.wait_first_timestamp)
+			fim->config.wait_first_timestamp(fim->config.priv);
+	}
+
+	fim->stream_on = on;
+out:
+	v4l2_ctrl_unlock(fim->ctrl[FIM_CL_ENABLE]);
+}
+EXPORT_SYMBOL_GPL(v4l2_fim_set_stream);
+
+bool v4l2_fim_is_streaming(struct v4l2_fim *fim)
+{
+	return fim->stream_on;
+}
+EXPORT_SYMBOL_GPL(v4l2_fim_is_streaming);
+
+static int fim_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct v4l2_fim *fim = ctrl->priv;
+	unsigned long flags;
+
+	spin_lock_irqsave(&fim->lock, flags);
+	reset_fim(fim, false, ctrl);
+	spin_unlock_irqrestore(&fim->lock, flags);
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops fim_ctrl_ops = {
+	.s_ctrl = fim_s_ctrl,
+};
+
+static const struct v4l2_ctrl_config fim_ctrl[] = {
+	[FIM_CL_ENABLE] = {
+		.ops = &fim_ctrl_ops,
+		.name = "FIM Enable",
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.def = FIM_CL_ENABLE_DEF,
+		.min = 0,
+		.max = 1,
+		.step = 1,
+	},
+	[FIM_CL_NUM] = {
+		.ops = &fim_ctrl_ops,
+		.name = "FIM Num Average",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.def = FIM_CL_NUM_DEF,
+		.min =  1,
+		.max = 64,
+		.step = 1,
+	},
+	[FIM_CL_TOLERANCE_MIN] = {
+		.ops = &fim_ctrl_ops,
+		.name = "FIM Tolerance Min",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.def = FIM_CL_TOLERANCE_MIN_DEF,
+		.min =    2,
+		.max =  200,
+		.step =  1,
+	},
+	[FIM_CL_TOLERANCE_MAX] = {
+		.ops = &fim_ctrl_ops,
+		.name = "FIM Tolerance Max",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.def = FIM_CL_TOLERANCE_MAX_DEF,
+		.min =    0,
+		.max =  500,
+		.step =   1,
+	},
+	[FIM_CL_NUM_SKIP] = {
+		.ops = &fim_ctrl_ops,
+		.name = "FIM Num Skip",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.def = FIM_CL_NUM_SKIP_DEF,
+		.min =   0,
+		.max = 256,
+		.step = 1,
+	},
+};
+
+struct v4l2_fim *v4l2_fim_init(struct v4l2_subdev *sd,
+			       struct v4l2_ctrl_handler *hdlr,
+			       const struct v4l2_fim_config *config)
+{
+	struct v4l2_fim *fim;
+	int i;
+
+	fim = devm_kzalloc(sd->dev, sizeof(*fim), GFP_KERNEL);
+	if (!fim)
+		return ERR_PTR(-ENOMEM);
+
+	fim->sd = sd;
+	fim->config = *config;
+	spin_lock_init(&fim->lock);
+
+	for (i = 0; i < V4L2_FIM_NUM_CONTROLS; i++) {
+		struct v4l2_ctrl_config cfg = fim_ctrl[i];
+
+		cfg.id = config->ctrl_base + i;
+		fim->ctrl[i] = v4l2_ctrl_new_custom(hdlr, &cfg, fim);
+	}
+	if (hdlr->error)
+		return ERR_PTR(hdlr->error);
+
+	v4l2_ctrl_cluster(V4L2_FIM_NUM_CONTROLS, fim->ctrl);
+
+	return fim;
+}
+EXPORT_SYMBOL_GPL(v4l2_fim_init);
+
+MODULE_DESCRIPTION("V4L2 frame interval monitor helpers");
+MODULE_LICENSE("GPL");
diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
index 1cd48028b641..f559b9979039 100644
--- a/drivers/staging/media/imx/Kconfig
+++ b/drivers/staging/media/imx/Kconfig
@@ -6,6 +6,7 @@ config VIDEO_IMX_MEDIA
 	depends on VIDEO_DEV
 	depends on IMX_IPUV3_CORE
 	select MEDIA_CONTROLLER
+	select V4L2_FIM
 	select V4L2_FWNODE
 	select V4L2_MEM2MEM_DEV
 	select VIDEOBUF2_DMA_CONTIG
diff --git a/drivers/staging/media/imx/TODO b/drivers/staging/media/imx/TODO
deleted file mode 100644
index 43cd030d4bbd..000000000000
--- a/drivers/staging/media/imx/TODO
+++ /dev/null
@@ -1,3 +0,0 @@
-
-- The Frame Interval Monitor could be exported to v4l2-core for
-  general use.
diff --git a/drivers/staging/media/imx/imx-media-fim.c b/drivers/staging/media/imx/imx-media-fim.c
index ccbc0371fba2..f94822815771 100644
--- a/drivers/staging/media/imx/imx-media-fim.c
+++ b/drivers/staging/media/imx/imx-media-fim.c
@@ -4,68 +4,31 @@
  *
  * Copyright (c) 2016 Mentor Graphics Inc.
  */
-#include <linux/delay.h>
+#include <linux/completion.h>
 #include <linux/irq.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
+#include <linux/jiffies.h>
 #include <linux/slab.h>
-#include <linux/spinlock.h>
 #include <media/v4l2-ctrls.h>
+#include <media/v4l2-fim.h>
 #include <media/v4l2-subdev.h>
 #include <media/imx.h>
 #include "imx-media.h"
 
-enum {
-	FIM_CL_ENABLE = 0,
-	FIM_CL_NUM,
-	FIM_CL_TOLERANCE_MIN,
-	FIM_CL_TOLERANCE_MAX,
-	FIM_CL_NUM_SKIP,
-	FIM_NUM_CONTROLS,
-};
-
 enum {
 	FIM_CL_ICAP_EDGE = 0,
 	FIM_CL_ICAP_CHANNEL,
 	FIM_NUM_ICAP_CONTROLS,
 };
 
-#define FIM_CL_ENABLE_DEF          0 /* FIM disabled by default */
-#define FIM_CL_NUM_DEF             8 /* average 8 frames */
-#define FIM_CL_NUM_SKIP_DEF        2 /* skip 2 frames after restart */
-#define FIM_CL_TOLERANCE_MIN_DEF  50 /* usec */
-#define FIM_CL_TOLERANCE_MAX_DEF   0 /* no max tolerance (unbounded) */
-
 struct imx_media_fim {
-	/* the owning subdev of this fim instance */
 	struct v4l2_subdev *sd;
-
-	/* FIM's control handler */
+	struct v4l2_fim *core;
 	struct v4l2_ctrl_handler ctrl_handler;
+	struct v4l2_ctrl *icap_ctrl[FIM_NUM_ICAP_CONTROLS];
 
-	/* control clusters */
-	struct v4l2_ctrl  *ctrl[FIM_NUM_CONTROLS];
-	struct v4l2_ctrl  *icap_ctrl[FIM_NUM_ICAP_CONTROLS];
-
-	spinlock_t        lock; /* protect control values */
-
-	/* current control values */
-	bool              enabled;
-	int               num_avg;
-	int               num_skip;
-	unsigned long     tolerance_min; /* usec */
-	unsigned long     tolerance_max; /* usec */
-	/* input capture method of measuring FI */
-	int               icap_channel;
-	int               icap_flags;
-
-	int               counter;
-	ktime_t		  last_ts;
-	unsigned long     sum;       /* usec */
-	unsigned long     nominal;   /* usec */
-
+	int icap_channel;
+	int icap_flags;
 	struct completion icap_first_event;
-	bool              stream_on;
 };
 
 static bool icap_enabled(struct imx_media_fim *fim)
@@ -73,171 +36,52 @@ static bool icap_enabled(struct imx_media_fim *fim)
 	return fim->icap_flags != IRQ_TYPE_NONE;
 }
 
-static void update_fim_nominal(struct imx_media_fim *fim,
-			       const struct v4l2_fract *fi)
-{
-	if (fi->denominator == 0) {
-		dev_dbg(fim->sd->dev, "no frame interval, FIM disabled\n");
-		fim->enabled = false;
-		return;
-	}
-
-	fim->nominal = DIV_ROUND_CLOSEST_ULL(1000000ULL * (u64)fi->numerator,
-					     fi->denominator);
-
-	dev_dbg(fim->sd->dev, "FI=%lu usec\n", fim->nominal);
-}
-
-static void reset_fim(struct imx_media_fim *fim, bool curval)
+static bool imx_fim_external_timestamp(void *priv, bool curval, bool use_val)
 {
+	struct imx_media_fim *fim = priv;
 	struct v4l2_ctrl *icap_chan = fim->icap_ctrl[FIM_CL_ICAP_CHANNEL];
 	struct v4l2_ctrl *icap_edge = fim->icap_ctrl[FIM_CL_ICAP_EDGE];
-	struct v4l2_ctrl *en = fim->ctrl[FIM_CL_ENABLE];
-	struct v4l2_ctrl *num = fim->ctrl[FIM_CL_NUM];
-	struct v4l2_ctrl *skip = fim->ctrl[FIM_CL_NUM_SKIP];
-	struct v4l2_ctrl *tol_min = fim->ctrl[FIM_CL_TOLERANCE_MIN];
-	struct v4l2_ctrl *tol_max = fim->ctrl[FIM_CL_TOLERANCE_MAX];
 
-	if (curval) {
-		fim->enabled = en->cur.val;
+	if (curval || !use_val) {
 		fim->icap_flags = icap_edge->cur.val;
 		fim->icap_channel = icap_chan->cur.val;
-		fim->num_avg = num->cur.val;
-		fim->num_skip = skip->cur.val;
-		fim->tolerance_min = tol_min->cur.val;
-		fim->tolerance_max = tol_max->cur.val;
 	} else {
-		fim->enabled = en->val;
 		fim->icap_flags = icap_edge->val;
 		fim->icap_channel = icap_chan->val;
-		fim->num_avg = num->val;
-		fim->num_skip = skip->val;
-		fim->tolerance_min = tol_min->val;
-		fim->tolerance_max = tol_max->val;
 	}
 
-	/* disable tolerance range if max <= min */
-	if (fim->tolerance_max <= fim->tolerance_min)
-		fim->tolerance_max = 0;
-
-	/* num_skip must be >= 1 if input capture not used */
-	if (!icap_enabled(fim))
-		fim->num_skip = max_t(int, fim->num_skip, 1);
-
-	fim->counter = -fim->num_skip;
-	fim->sum = 0;
+	return icap_enabled(fim);
 }
 
-static void send_fim_event(struct imx_media_fim *fim, unsigned long error)
-{
-	static const struct v4l2_event ev = {
-		.type = V4L2_EVENT_IMX_FRAME_INTERVAL_ERROR,
-	};
-
-	v4l2_subdev_notify_event(fim->sd, &ev);
-}
-
-/*
- * Monitor an averaged frame interval. If the average deviates too much
- * from the nominal frame rate, send the frame interval error event. The
- * frame intervals are averaged in order to quiet noise from
- * (presumably random) interrupt latency.
- */
-static void frame_interval_monitor(struct imx_media_fim *fim,
-				   ktime_t timestamp)
-{
-	long long interval, error;
-	unsigned long error_avg;
-	bool send_event = false;
-
-	if (!fim->enabled || ++fim->counter <= 0)
-		goto out_update_ts;
-
-	/* max error is less than l00µs, so use 32-bit division or fail */
-	interval = ktime_to_ns(ktime_sub(timestamp, fim->last_ts));
-	error = abs(interval - NSEC_PER_USEC * (u64)fim->nominal);
-	if (error > U32_MAX)
-		error = U32_MAX;
-	else
-		error = abs((u32)error / NSEC_PER_USEC);
-
-	if (fim->tolerance_max && error >= fim->tolerance_max) {
-		dev_dbg(fim->sd->dev,
-			"FIM: %llu ignored, out of tolerance bounds\n",
-			error);
-		fim->counter--;
-		goto out_update_ts;
-	}
-
-	fim->sum += error;
-
-	if (fim->counter == fim->num_avg) {
-		error_avg = DIV_ROUND_CLOSEST(fim->sum, fim->num_avg);
-
-		if (error_avg > fim->tolerance_min)
-			send_event = true;
-
-		dev_dbg(fim->sd->dev, "FIM: error: %lu usec%s\n",
-			error_avg, send_event ? " (!!!)" : "");
-
-		fim->counter = 0;
-		fim->sum = 0;
-	}
-
-out_update_ts:
-	fim->last_ts = timestamp;
-	if (send_event)
-		send_fim_event(fim, error_avg);
-}
-
-/*
- * In case we are monitoring the first frame interval after streamon
- * (when fim->num_skip = 0), we need a valid fim->last_ts before we
- * can begin. This only applies to the input capture method. It is not
- * possible to accurately measure the first FI after streamon using the
- * EOF method, so fim->num_skip minimum is set to 1 in that case, so this
- * function is a noop when the EOF method is used.
- */
-static void fim_acquire_first_ts(struct imx_media_fim *fim)
+static void imx_fim_wait_first_timestamp(void *priv)
 {
+	struct imx_media_fim *fim = priv;
 	unsigned long ret;
 
-	if (!fim->enabled || fim->num_skip > 0)
-		return;
-
-	ret = wait_for_completion_timeout(
-		&fim->icap_first_event,
-		msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
+	ret = wait_for_completion_timeout(&fim->icap_first_event,
+					  msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
 	if (ret == 0)
 		v4l2_warn(fim->sd, "wait first icap event timeout\n");
 }
 
-/* FIM Controls */
 static int fim_s_ctrl(struct v4l2_ctrl *ctrl)
 {
-	struct imx_media_fim *fim = container_of(ctrl->handler,
-						 struct imx_media_fim,
-						 ctrl_handler);
-	unsigned long flags;
+	struct imx_media_fim *fim = ctrl->priv;
 	int ret = 0;
 
-	spin_lock_irqsave(&fim->lock, flags);
-
 	switch (ctrl->id) {
-	case V4L2_CID_IMX_FIM_ENABLE:
-		break;
 	case V4L2_CID_IMX_FIM_ICAP_EDGE:
-		if (fim->stream_on)
+		if (v4l2_fim_is_streaming(fim->core))
 			ret = -EBUSY;
 		break;
 	default:
 		ret = -EINVAL;
+		break;
 	}
 
 	if (!ret)
-		reset_fim(fim, false);
+		v4l2_fim_reset(fim->core, false, ctrl);
 
-	spin_unlock_irqrestore(&fim->lock, flags);
 	return ret;
 }
 
@@ -245,66 +89,13 @@ static const struct v4l2_ctrl_ops fim_ctrl_ops = {
 	.s_ctrl = fim_s_ctrl,
 };
 
-static const struct v4l2_ctrl_config fim_ctrl[] = {
-	[FIM_CL_ENABLE] = {
-		.ops = &fim_ctrl_ops,
-		.id = V4L2_CID_IMX_FIM_ENABLE,
-		.name = "FIM Enable",
-		.type = V4L2_CTRL_TYPE_BOOLEAN,
-		.def = FIM_CL_ENABLE_DEF,
-		.min = 0,
-		.max = 1,
-		.step = 1,
-	},
-	[FIM_CL_NUM] = {
-		.ops = &fim_ctrl_ops,
-		.id = V4L2_CID_IMX_FIM_NUM,
-		.name = "FIM Num Average",
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.def = FIM_CL_NUM_DEF,
-		.min =  1, /* no averaging */
-		.max = 64, /* average 64 frames */
-		.step = 1,
-	},
-	[FIM_CL_TOLERANCE_MIN] = {
-		.ops = &fim_ctrl_ops,
-		.id = V4L2_CID_IMX_FIM_TOLERANCE_MIN,
-		.name = "FIM Tolerance Min",
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.def = FIM_CL_TOLERANCE_MIN_DEF,
-		.min =    2,
-		.max =  200,
-		.step =   1,
-	},
-	[FIM_CL_TOLERANCE_MAX] = {
-		.ops = &fim_ctrl_ops,
-		.id = V4L2_CID_IMX_FIM_TOLERANCE_MAX,
-		.name = "FIM Tolerance Max",
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.def = FIM_CL_TOLERANCE_MAX_DEF,
-		.min =    0,
-		.max =  500,
-		.step =   1,
-	},
-	[FIM_CL_NUM_SKIP] = {
-		.ops = &fim_ctrl_ops,
-		.id = V4L2_CID_IMX_FIM_NUM_SKIP,
-		.name = "FIM Num Skip",
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.def = FIM_CL_NUM_SKIP_DEF,
-		.min =   0, /* skip no frames */
-		.max = 256, /* skip 256 frames */
-		.step =  1,
-	},
-};
-
 static const struct v4l2_ctrl_config fim_icap_ctrl[] = {
 	[FIM_CL_ICAP_EDGE] = {
 		.ops = &fim_ctrl_ops,
 		.id = V4L2_CID_IMX_FIM_ICAP_EDGE,
 		.name = "FIM Input Capture Edge",
 		.type = V4L2_CTRL_TYPE_INTEGER,
-		.def =  IRQ_TYPE_NONE, /* input capture disabled by default */
+		.def =  IRQ_TYPE_NONE,
 		.min =  IRQ_TYPE_NONE,
 		.max =  IRQ_TYPE_EDGE_BOTH,
 		.step = 1,
@@ -321,108 +112,66 @@ static const struct v4l2_ctrl_config fim_icap_ctrl[] = {
 	},
 };
 
-static int init_fim_controls(struct imx_media_fim *fim)
-{
-	struct v4l2_ctrl_handler *hdlr = &fim->ctrl_handler;
-	int i, ret;
-
-	v4l2_ctrl_handler_init(hdlr, FIM_NUM_CONTROLS + FIM_NUM_ICAP_CONTROLS);
-
-	for (i = 0; i < FIM_NUM_CONTROLS; i++)
-		fim->ctrl[i] = v4l2_ctrl_new_custom(hdlr,
-						    &fim_ctrl[i],
-						    NULL);
-	for (i = 0; i < FIM_NUM_ICAP_CONTROLS; i++)
-		fim->icap_ctrl[i] = v4l2_ctrl_new_custom(hdlr,
-							 &fim_icap_ctrl[i],
-							 NULL);
-	if (hdlr->error) {
-		ret = hdlr->error;
-		goto err_free;
-	}
-
-	v4l2_ctrl_cluster(FIM_NUM_CONTROLS, fim->ctrl);
-	v4l2_ctrl_cluster(FIM_NUM_ICAP_CONTROLS, fim->icap_ctrl);
-
-	return 0;
-err_free:
-	v4l2_ctrl_handler_free(hdlr);
-	return ret;
-}
-
-/*
- * Monitor frame intervals via EOF interrupt. This method is
- * subject to uncertainty errors introduced by interrupt latency.
- *
- * This is a noop if the Input Capture method is being used, since
- * the frame_interval_monitor() is called by the input capture event
- * callback handler in that case.
- */
 void imx_media_fim_eof_monitor(struct imx_media_fim *fim, ktime_t timestamp)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&fim->lock, flags);
-
-	if (!icap_enabled(fim))
-		frame_interval_monitor(fim, timestamp);
-
-	spin_unlock_irqrestore(&fim->lock, flags);
+	v4l2_fim_eof_monitor(fim->core, timestamp);
 }
 
-/* Called by the subdev in its s_stream callback */
 void imx_media_fim_set_stream(struct imx_media_fim *fim,
-			      const struct v4l2_fract *fi,
+			      const struct v4l2_fract *frame_interval,
 			      bool on)
 {
-	unsigned long flags;
-
-	v4l2_ctrl_lock(fim->ctrl[FIM_CL_ENABLE]);
-
-	if (fim->stream_on == on)
-		goto out;
-
-	if (on) {
-		spin_lock_irqsave(&fim->lock, flags);
-		reset_fim(fim, true);
-		update_fim_nominal(fim, fi);
-		spin_unlock_irqrestore(&fim->lock, flags);
-
-		if (icap_enabled(fim))
-			fim_acquire_first_ts(fim);
-	}
-
-	fim->stream_on = on;
-out:
-	v4l2_ctrl_unlock(fim->ctrl[FIM_CL_ENABLE]);
+	v4l2_fim_set_stream(fim->core, frame_interval, on);
 }
 
 int imx_media_fim_add_controls(struct imx_media_fim *fim)
 {
-	/* add the FIM controls to the calling subdev ctrl handler */
 	return v4l2_ctrl_add_handler(fim->sd->ctrl_handler,
 				     &fim->ctrl_handler, NULL, true);
 }
 
-/* Called by the subdev in its subdev registered callback */
 struct imx_media_fim *imx_media_fim_init(struct v4l2_subdev *sd)
 {
+	struct v4l2_fim_config config = {
+		.ctrl_base = V4L2_CID_IMX_FIM_ENABLE,
+		.event_type = V4L2_EVENT_IMX_FRAME_INTERVAL_ERROR,
+		.external_timestamp = imx_fim_external_timestamp,
+		.wait_first_timestamp = imx_fim_wait_first_timestamp,
+	};
 	struct imx_media_fim *fim;
-	int ret;
+	int i, ret;
 
 	fim = devm_kzalloc(sd->dev, sizeof(*fim), GFP_KERNEL);
 	if (!fim)
 		return ERR_PTR(-ENOMEM);
 
 	fim->sd = sd;
+	config.priv = fim;
+
+	v4l2_ctrl_handler_init(&fim->ctrl_handler,
+			       V4L2_FIM_NUM_CONTROLS + FIM_NUM_ICAP_CONTROLS);
+
+	fim->core = v4l2_fim_init(sd, &fim->ctrl_handler, &config);
+	if (IS_ERR(fim->core)) {
+		ret = PTR_ERR(fim->core);
+		goto err_free;
+	}
 
-	spin_lock_init(&fim->lock);
+	for (i = 0; i < FIM_NUM_ICAP_CONTROLS; i++)
+		fim->icap_ctrl[i] = v4l2_ctrl_new_custom(&fim->ctrl_handler,
+							 &fim_icap_ctrl[i], fim);
+	if (fim->ctrl_handler.error) {
+		ret = fim->ctrl_handler.error;
+		goto err_free;
+	}
 
-	ret = init_fim_controls(fim);
-	if (ret)
-		return ERR_PTR(ret);
+	v4l2_ctrl_cluster(FIM_NUM_ICAP_CONTROLS, fim->icap_ctrl);
 
 	return fim;
+
+err_free:
+	v4l2_ctrl_handler_free(&fim->ctrl_handler);
+	return ERR_PTR(ret);
 }
 
 void imx_media_fim_free(struct imx_media_fim *fim)
diff --git a/include/media/v4l2-fim.h b/include/media/v4l2-fim.h
new file mode 100644
index 000000000000..6d649a56b08f
--- /dev/null
+++ b/include/media/v4l2-fim.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * V4L2 frame interval monitor helpers
+ *
+ * Copyright (c) 2016 Mentor Graphics Inc.
+ */
+
+#ifndef _V4L2_FIM_H
+#define _V4L2_FIM_H
+
+#include <linux/ktime.h>
+#include <linux/types.h>
+
+struct v4l2_ctrl_handler;
+struct v4l2_fract;
+struct v4l2_subdev;
+
+struct v4l2_fim;
+
+#define V4L2_FIM_NUM_CONTROLS	5
+
+struct v4l2_fim_config {
+	u32 ctrl_base;
+	u32 event_type;
+	void *priv;
+	bool (*external_timestamp)(void *priv, bool curval, bool use_val);
+	void (*wait_first_timestamp)(void *priv);
+};
+
+struct v4l2_fim *v4l2_fim_init(struct v4l2_subdev *sd,
+			       struct v4l2_ctrl_handler *hdlr,
+			       const struct v4l2_fim_config *config);
+void v4l2_fim_reset(struct v4l2_fim *fim, bool curval, struct v4l2_ctrl *ctrl);
+void v4l2_fim_set_stream(struct v4l2_fim *fim,
+			 const struct v4l2_fract *frame_interval, bool on);
+void v4l2_fim_eof_monitor(struct v4l2_fim *fim, ktime_t timestamp);
+void v4l2_fim_monitor_timestamp(struct v4l2_fim *fim, ktime_t timestamp);
+bool v4l2_fim_is_streaming(struct v4l2_fim *fim);
+
+#endif
-- 
2.53.0

