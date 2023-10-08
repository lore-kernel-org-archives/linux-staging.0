Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5754401
	for <linux-staging@lists.linux.dev>; Sun,  8 Oct 2023 09:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 9A4AB24E296;
	Sun,  8 Oct 2023 16:52:02 +0800 (CST)
Received: from EXMBX073.cuchost.com (172.16.6.83) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sun, 8 Oct
 2023 16:52:00 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX073.cuchost.com
 (172.16.6.83) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sun, 8 Oct
 2023 16:52:00 +0800
From: Jack Zhu <jack.zhu@starfivetech.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Foss
	<rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	<bryan.odonoghue@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-staging@lists.linux.dev>,
	<jack.zhu@starfivetech.com>, <changhuang.liang@starfivetech.com>
Subject: [PATCH v10 6/8] media: staging: media: starfive: camss: Add capture driver
Date: Sun, 8 Oct 2023 16:51:52 +0800
Message-ID: <20231008085154.6757-7-jack.zhu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231008085154.6757-1-jack.zhu@starfivetech.com>
References: <20231008085154.6757-1-jack.zhu@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX073.cuchost.com
 (172.16.6.83)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable

Add capture driver for StarFive Camera Subsystem. It contains two video
devices: capture_yuv and capture_raw.

Signed-off-by: Jack Zhu <jack.zhu@starfivetech.com>
---
 drivers/staging/media/starfive/camss/Makefile |   1 +
 .../staging/media/starfive/camss/stf-camss.h  |   2 +
 .../media/starfive/camss/stf-capture.c        | 603 ++++++++++++++++++
 .../media/starfive/camss/stf-capture.h        |  87 +++
 4 files changed, 693 insertions(+)
 create mode 100644 drivers/staging/media/starfive/camss/stf-capture.c
 create mode 100644 drivers/staging/media/starfive/camss/stf-capture.h

diff --git a/drivers/staging/media/starfive/camss/Makefile b/drivers/stag=
ing/media/starfive/camss/Makefile
index 97e1522b21ae..005790202e7b 100644
--- a/drivers/staging/media/starfive/camss/Makefile
+++ b/drivers/staging/media/starfive/camss/Makefile
@@ -5,6 +5,7 @@
=20
 starfive-camss-objs +=3D \
 		stf-camss.o \
+		stf-capture.o \
 		stf-isp.o \
 		stf-isp-hw-ops.o \
 		stf-video.o
diff --git a/drivers/staging/media/starfive/camss/stf-camss.h b/drivers/s=
taging/media/starfive/camss/stf-camss.h
index c7b0a34cd29b..e2b0cfb437bd 100644
--- a/drivers/staging/media/starfive/camss/stf-camss.h
+++ b/drivers/staging/media/starfive/camss/stf-camss.h
@@ -19,6 +19,7 @@
 #include <media/v4l2-device.h>
=20
 #include "stf-isp.h"
+#include "stf-capture.h"
=20
 enum stf_port_num {
 	STF_PORT_DVP =3D 0,
@@ -52,6 +53,7 @@ struct stfcamss {
 	struct media_pipeline pipe;
 	struct device *dev;
 	struct stf_isp_dev isp_dev;
+	struct stf_capture captures[STF_CAPTURE_NUM];
 	struct v4l2_async_notifier notifier;
 	void __iomem *syscon_base;
 	void __iomem *isp_base;
diff --git a/drivers/staging/media/starfive/camss/stf-capture.c b/drivers=
/staging/media/starfive/camss/stf-capture.c
new file mode 100644
index 000000000000..70c24b050a1b
--- /dev/null
+++ b/drivers/staging/media/starfive/camss/stf-capture.c
@@ -0,0 +1,603 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * stf_capture.c
+ *
+ * StarFive Camera Subsystem - capture device
+ *
+ * Copyright (C) 2021-2023 StarFive Technology Co., Ltd.
+ */
+
+#include "stf-camss.h"
+
+static const char * const stf_cap_names[] =3D {
+	"capture_raw",
+	"capture_yuv",
+};
+
+static const struct stfcamss_format_info stf_wr_fmts[] =3D {
+	{
+		.code =3D MEDIA_BUS_FMT_SRGGB10_1X10,
+		.pixelformat =3D V4L2_PIX_FMT_SRGGB10,
+		.planes =3D 1,
+		.vsub =3D { 1 },
+		.bpp =3D 10,
+	},
+	{
+		.code =3D MEDIA_BUS_FMT_SGRBG10_1X10,
+		.pixelformat =3D V4L2_PIX_FMT_SGRBG10,
+		.planes =3D 1,
+		.vsub =3D { 1 },
+		.bpp =3D 10,
+	},
+	{
+		.code =3D MEDIA_BUS_FMT_SGBRG10_1X10,
+		.pixelformat =3D V4L2_PIX_FMT_SGBRG10,
+		.planes =3D 1,
+		.vsub =3D { 1 },
+		.bpp =3D 10,
+	},
+	{
+		.code =3D MEDIA_BUS_FMT_SBGGR10_1X10,
+		.pixelformat =3D V4L2_PIX_FMT_SBGGR10,
+		.planes =3D 1,
+		.vsub =3D { 1 },
+		.bpp =3D 10,
+	},
+};
+
+static const struct stfcamss_format_info stf_isp_fmts[] =3D {
+	{
+		.code =3D MEDIA_BUS_FMT_YUYV8_1_5X8,
+		.pixelformat =3D V4L2_PIX_FMT_NV12,
+		.planes =3D 2,
+		.vsub =3D { 1, 2 },
+		.bpp =3D 8,
+	},
+};
+
+static inline struct stf_capture *to_stf_capture(struct stfcamss_video *=
video)
+{
+	return container_of(video, struct stf_capture, video);
+}
+
+static void stf_set_raw_addr(struct stfcamss *stfcamss, dma_addr_t addr)
+{
+	stf_syscon_reg_write(stfcamss, VIN_START_ADDR_O, (long)addr);
+	stf_syscon_reg_write(stfcamss, VIN_START_ADDR_N, (long)addr);
+}
+
+static void stf_set_yuv_addr(struct stfcamss *stfcamss,
+			     dma_addr_t y_addr, dma_addr_t uv_addr)
+{
+	stf_isp_reg_write(stfcamss, ISP_REG_Y_PLANE_START_ADDR, y_addr);
+	stf_isp_reg_write(stfcamss, ISP_REG_UV_PLANE_START_ADDR, uv_addr);
+}
+
+static void stf_init_addrs(struct stfcamss_video *video)
+{
+	struct stf_capture *cap =3D to_stf_capture(video);
+	struct stf_v_buf *output =3D &cap->buffers;
+	dma_addr_t addr0, addr1;
+
+	output->active_buf =3D 0;
+
+	if (!output->buf[0])
+		return;
+
+	addr0 =3D output->buf[0]->addr[0];
+	addr1 =3D output->buf[0]->addr[1];
+
+	if (cap->type =3D=3D STF_CAPTURE_RAW)
+		stf_set_raw_addr(video->stfcamss, addr0);
+	else if (cap->type =3D=3D STF_CAPTURE_YUV)
+		stf_set_yuv_addr(video->stfcamss, addr0, addr1);
+}
+
+static struct stfcamss_buffer *stf_buf_get_pending(struct stf_v_buf *out=
put)
+{
+	struct stfcamss_buffer *buffer =3D NULL;
+
+	if (!list_empty(&output->pending_bufs)) {
+		buffer =3D list_first_entry(&output->pending_bufs,
+					  struct stfcamss_buffer,
+					  queue);
+		list_del(&buffer->queue);
+	}
+
+	return buffer;
+}
+
+static void stf_cap_s_cfg(struct stfcamss_video *video)
+{
+	struct stf_capture *cap =3D to_stf_capture(video);
+	struct stf_v_buf *output =3D &cap->buffers;
+	unsigned long flags;
+
+	spin_lock_irqsave(&output->lock, flags);
+
+	output->state =3D STF_OUTPUT_IDLE;
+	output->buf[0] =3D stf_buf_get_pending(output);
+
+	if (!output->buf[0] && output->buf[1]) {
+		output->buf[0] =3D output->buf[1];
+		output->buf[1] =3D NULL;
+	}
+
+	if (output->buf[0])
+		output->state =3D STF_OUTPUT_SINGLE;
+
+	output->sequence =3D 0;
+	stf_init_addrs(video);
+
+	spin_unlock_irqrestore(&output->lock, flags);
+}
+
+static int stf_cap_s_cleanup(struct stfcamss_video *video)
+{
+	struct stf_capture *cap =3D to_stf_capture(video);
+	struct stf_v_buf *output =3D &cap->buffers;
+	unsigned long flags;
+
+	spin_lock_irqsave(&output->lock, flags);
+
+	output->state =3D STF_OUTPUT_OFF;
+
+	spin_unlock_irqrestore(&output->lock, flags);
+
+	return 0;
+}
+
+static void stf_wr_data_en(struct stfcamss_video *video)
+{
+	struct stf_capture *cap =3D to_stf_capture(video);
+	struct stfcamss *stfcamss =3D cap->video.stfcamss;
+
+	stf_syscon_reg_set_bit(stfcamss, VIN_CHANNEL_SEL_EN, U0_VIN_AXIWR0_EN);
+}
+
+static void stf_wr_irq_enable(struct stfcamss_video *video)
+{
+	struct stf_capture *cap =3D to_stf_capture(video);
+	struct stfcamss *stfcamss =3D cap->video.stfcamss;
+
+	stf_syscon_reg_clear_bit(stfcamss, VIN_INRT_PIX_CFG, U0_VIN_INTR_M);
+}
+
+static void stf_wr_irq_disable(struct stfcamss_video *video)
+{
+	struct stf_capture *cap =3D to_stf_capture(video);
+	struct stfcamss *stfcamss =3D cap->video.stfcamss;
+
+	stf_syscon_reg_set_bit(stfcamss, VIN_INRT_PIX_CFG, U0_VIN_INTR_CLEAN);
+	stf_syscon_reg_clear_bit(stfcamss, VIN_INRT_PIX_CFG, U0_VIN_INTR_CLEAN)=
;
+	stf_syscon_reg_set_bit(stfcamss, VIN_INRT_PIX_CFG, U0_VIN_INTR_M);
+}
+
+static void stf_channel_set(struct stfcamss_video *video)
+{
+	struct stf_capture *cap =3D to_stf_capture(video);
+	struct stfcamss *stfcamss =3D cap->video.stfcamss;
+	u32 val;
+
+	if (cap->type =3D=3D STF_CAPTURE_RAW) {
+		val =3D stf_syscon_reg_read(stfcamss, VIN_CHANNEL_SEL_EN);
+		val &=3D ~U0_VIN_CHANNEL_SEL_MASK;
+		val |=3D CHANNEL(0);
+		stf_syscon_reg_write(stfcamss, VIN_CHANNEL_SEL_EN, val);
+
+		val =3D stf_syscon_reg_read(stfcamss, VIN_INRT_PIX_CFG);
+		val &=3D ~U0_VIN_PIX_CT_MASK;
+		val |=3D PIX_CT(1);
+
+		val &=3D ~U0_VIN_PIXEL_HEIGH_BIT_SEL_MAKS;
+		val |=3D PIXEL_HEIGH_BIT_SEL(0);
+
+		val &=3D ~U0_VIN_PIX_CNT_END_MASK;
+		val |=3D PIX_CNT_END(IMAGE_MAX_WIDTH / 4 - 1);
+
+		stf_syscon_reg_write(stfcamss, VIN_INRT_PIX_CFG, val);
+	} else if (cap->type =3D=3D STF_CAPTURE_YUV) {
+		val =3D stf_syscon_reg_read(stfcamss, VIN_CFG_REG);
+		val &=3D ~U0_VIN_MIPI_BYTE_EN_ISP0_MASK;
+		val |=3D U0_VIN_MIPI_BYTE_EN_ISP0(0);
+
+		val &=3D ~U0_VIN_MIPI_CHANNEL_SEL0_MASK;
+		val |=3D U0_VIN_MIPI_CHANNEL_SEL0(0);
+
+		val &=3D ~U0_VIN_PIX_NUM_MASK;
+		val |=3D U0_VIN_PIX_NUM(0);
+
+		val &=3D ~U0_VIN_P_I_MIPI_HAEDER_EN0_MASK;
+		val |=3D U0_VIN_P_I_MIPI_HAEDER_EN0(1);
+
+		stf_syscon_reg_write(stfcamss, VIN_CFG_REG, val);
+	}
+}
+
+static void stf_capture_start(struct stfcamss_video *video)
+{
+	struct stf_capture *cap =3D to_stf_capture(video);
+
+	stf_channel_set(video);
+	if (cap->type =3D=3D STF_CAPTURE_RAW) {
+		stf_wr_irq_enable(video);
+		stf_wr_data_en(video);
+	}
+
+	stf_cap_s_cfg(video);
+}
+
+static void stf_capture_stop(struct stfcamss_video *video)
+{
+	struct stf_capture *cap =3D to_stf_capture(video);
+
+	if (cap->type =3D=3D STF_CAPTURE_RAW)
+		stf_wr_irq_disable(video);
+
+	stf_cap_s_cleanup(video);
+}
+
+static void stf_capture_init(struct stfcamss *stfcamss, struct stf_captu=
re *cap)
+{
+	cap->buffers.state =3D STF_OUTPUT_OFF;
+	cap->buffers.buf[0] =3D NULL;
+	cap->buffers.buf[1] =3D NULL;
+	cap->buffers.active_buf =3D 0;
+	atomic_set(&cap->buffers.frame_skip, 4);
+	INIT_LIST_HEAD(&cap->buffers.pending_bufs);
+	INIT_LIST_HEAD(&cap->buffers.ready_bufs);
+	spin_lock_init(&cap->buffers.lock);
+
+	cap->video.type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	cap->video.stfcamss =3D stfcamss;
+	cap->video.bpl_alignment =3D 16 * 8;
+
+	if (cap->type =3D=3D STF_CAPTURE_RAW) {
+		cap->video.formats =3D stf_wr_fmts;
+		cap->video.nformats =3D ARRAY_SIZE(stf_wr_fmts);
+		cap->video.bpl_alignment =3D 8;
+	} else if (cap->type =3D=3D STF_CAPTURE_YUV) {
+		cap->video.formats =3D stf_isp_fmts;
+		cap->video.nformats =3D ARRAY_SIZE(stf_isp_fmts);
+		cap->video.bpl_alignment =3D 1;
+	}
+}
+
+static void stf_buf_add_ready(struct stf_v_buf *output,
+			      struct stfcamss_buffer *buffer)
+{
+	INIT_LIST_HEAD(&buffer->queue);
+	list_add_tail(&buffer->queue, &output->ready_bufs);
+}
+
+static struct stfcamss_buffer *stf_buf_get_ready(struct stf_v_buf *outpu=
t)
+{
+	struct stfcamss_buffer *buffer =3D NULL;
+
+	if (!list_empty(&output->ready_bufs)) {
+		buffer =3D list_first_entry(&output->ready_bufs,
+					  struct stfcamss_buffer,
+					  queue);
+		list_del(&buffer->queue);
+	}
+
+	return buffer;
+}
+
+static void stf_buf_add_pending(struct stf_v_buf *output,
+				struct stfcamss_buffer *buffer)
+{
+	INIT_LIST_HEAD(&buffer->queue);
+	list_add_tail(&buffer->queue, &output->pending_bufs);
+}
+
+static void stf_buf_update_on_last(struct stf_v_buf *output)
+{
+	switch (output->state) {
+	case STF_OUTPUT_CONTINUOUS:
+		output->state =3D STF_OUTPUT_SINGLE;
+		output->active_buf =3D !output->active_buf;
+		break;
+	case STF_OUTPUT_SINGLE:
+		output->state =3D STF_OUTPUT_STOPPING;
+		break;
+	default:
+		break;
+	}
+}
+
+static void stf_buf_update_on_next(struct stf_v_buf *output)
+{
+	switch (output->state) {
+	case STF_OUTPUT_CONTINUOUS:
+		output->active_buf =3D !output->active_buf;
+		break;
+	case STF_OUTPUT_SINGLE:
+	default:
+		break;
+	}
+}
+
+static void stf_buf_update_on_new(struct stfcamss_video *video,
+				  struct stfcamss_buffer *new_buf)
+{
+	struct stf_capture *cap =3D to_stf_capture(video);
+	struct stf_v_buf *output =3D &cap->buffers;
+
+	switch (output->state) {
+	case STF_OUTPUT_SINGLE:
+		stf_buf_add_pending(output, new_buf);
+		break;
+	case STF_OUTPUT_IDLE:
+		if (!output->buf[0]) {
+			output->buf[0] =3D new_buf;
+			stf_init_addrs(video);
+			output->state =3D STF_OUTPUT_SINGLE;
+		} else {
+			stf_buf_add_pending(output, new_buf);
+		}
+		break;
+	case STF_OUTPUT_STOPPING:
+		if (output->last_buffer) {
+			output->buf[output->active_buf] =3D output->last_buffer;
+			output->last_buffer =3D NULL;
+		}
+
+		output->state =3D STF_OUTPUT_SINGLE;
+		stf_buf_add_pending(output, new_buf);
+		break;
+	case STF_OUTPUT_CONTINUOUS:
+	default:
+		stf_buf_add_pending(output, new_buf);
+		break;
+	}
+}
+
+static void stf_buf_flush(struct stf_v_buf *output, enum vb2_buffer_stat=
e state)
+{
+	struct stfcamss_buffer *buf;
+	struct stfcamss_buffer *t;
+
+	list_for_each_entry_safe(buf, t, &output->pending_bufs, queue) {
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+		list_del(&buf->queue);
+	}
+	list_for_each_entry_safe(buf, t, &output->ready_bufs, queue) {
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+		list_del(&buf->queue);
+	}
+}
+
+static void stf_buf_done(struct stf_v_buf *output)
+{
+	struct stfcamss_buffer *ready_buf;
+	u64 ts =3D ktime_get_ns();
+	unsigned long flags;
+
+	if (output->state =3D=3D STF_OUTPUT_OFF ||
+	    output->state =3D=3D STF_OUTPUT_RESERVED)
+		return;
+
+	spin_lock_irqsave(&output->lock, flags);
+
+	while ((ready_buf =3D stf_buf_get_ready(output))) {
+		ready_buf->vb.vb2_buf.timestamp =3D ts;
+		ready_buf->vb.sequence =3D output->sequence++;
+
+		vb2_buffer_done(&ready_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+	}
+
+	spin_unlock_irqrestore(&output->lock, flags);
+}
+
+static void stf_change_buffer(struct stf_v_buf *output)
+{
+	struct stf_capture *cap =3D container_of(output, struct stf_capture,
+					       buffers);
+	struct stfcamss *stfcamss =3D cap->video.stfcamss;
+	struct stfcamss_buffer *ready_buf;
+	dma_addr_t *new_addr;
+	unsigned long flags;
+	u32 active_index;
+
+	if (output->state =3D=3D STF_OUTPUT_OFF ||
+	    output->state =3D=3D STF_OUTPUT_STOPPING ||
+	    output->state =3D=3D STF_OUTPUT_RESERVED ||
+	    output->state =3D=3D STF_OUTPUT_IDLE)
+		return;
+
+	spin_lock_irqsave(&output->lock, flags);
+
+	active_index =3D output->active_buf;
+
+	ready_buf =3D output->buf[active_index];
+	if (!ready_buf) {
+		dev_dbg(stfcamss->dev, "missing ready buf %d %d.\n",
+			active_index, output->state);
+		active_index =3D !active_index;
+		ready_buf =3D output->buf[active_index];
+		if (!ready_buf) {
+			dev_dbg(stfcamss->dev,
+				"missing ready buf2 %d %d.\n",
+				active_index, output->state);
+			goto out_unlock;
+		}
+	}
+
+	/* Get next buffer */
+	output->buf[active_index] =3D stf_buf_get_pending(output);
+	if (!output->buf[active_index]) {
+		new_addr =3D ready_buf->addr;
+		stf_buf_update_on_last(output);
+	} else {
+		new_addr =3D output->buf[active_index]->addr;
+		stf_buf_update_on_next(output);
+	}
+
+	if (output->state =3D=3D STF_OUTPUT_STOPPING) {
+		output->last_buffer =3D ready_buf;
+	} else {
+		if (cap->type =3D=3D STF_CAPTURE_RAW)
+			stf_set_raw_addr(stfcamss, new_addr[0]);
+		else if (cap->type =3D=3D STF_CAPTURE_YUV)
+			stf_set_yuv_addr(stfcamss, new_addr[0], new_addr[1]);
+
+		stf_buf_add_ready(output, ready_buf);
+	}
+
+out_unlock:
+	spin_unlock_irqrestore(&output->lock, flags);
+}
+
+irqreturn_t stf_wr_irq_handler(int irq, void *priv)
+{
+	struct stfcamss *stfcamss =3D priv;
+	struct stf_capture *cap =3D &stfcamss->captures[STF_CAPTURE_RAW];
+
+	if (atomic_dec_if_positive(&cap->buffers.frame_skip) < 0) {
+		stf_change_buffer(&cap->buffers);
+		stf_buf_done(&cap->buffers);
+	}
+
+	stf_syscon_reg_set_bit(stfcamss, VIN_INRT_PIX_CFG, U0_VIN_INTR_CLEAN);
+	stf_syscon_reg_clear_bit(stfcamss, VIN_INRT_PIX_CFG, U0_VIN_INTR_CLEAN)=
;
+
+	return IRQ_HANDLED;
+}
+
+irqreturn_t stf_isp_irq_handler(int irq, void *priv)
+{
+	struct stfcamss *stfcamss =3D priv;
+	struct stf_capture *cap =3D &stfcamss->captures[STF_CAPTURE_YUV];
+	u32 status;
+
+	status =3D stf_isp_reg_read(stfcamss, ISP_REG_ISP_CTRL_0);
+	if (status & ISPC_ISP) {
+		if (status & ISPC_ENUO)
+			stf_buf_done(&cap->buffers);
+
+		stf_isp_reg_write(stfcamss, ISP_REG_ISP_CTRL_0,
+				  (status & ~ISPC_INT_ALL_MASK) |
+				  ISPC_ISP | ISPC_CSI | ISPC_SC);
+	}
+
+	return IRQ_HANDLED;
+}
+
+irqreturn_t stf_line_irq_handler(int irq, void *priv)
+{
+	struct stfcamss *stfcamss =3D priv;
+	struct stf_capture *cap =3D &stfcamss->captures[STF_CAPTURE_YUV];
+	u32 status;
+
+	status =3D stf_isp_reg_read(stfcamss, ISP_REG_ISP_CTRL_0);
+	if (status & ISPC_LINE) {
+		if (atomic_dec_if_positive(&cap->buffers.frame_skip) < 0) {
+			if ((status & ISPC_ENUO))
+				stf_change_buffer(&cap->buffers);
+		}
+
+		stf_isp_reg_set_bit(stfcamss, ISP_REG_CSIINTS,
+				    CSI_INTS_MASK, CSI_INTS(0x3));
+		stf_isp_reg_set_bit(stfcamss, ISP_REG_IESHD,
+				    SHAD_UP_M | SHAD_UP_EN, 0x3);
+
+		stf_isp_reg_write(stfcamss, ISP_REG_ISP_CTRL_0,
+				  (status & ~ISPC_INT_ALL_MASK) | ISPC_LINE);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int stf_queue_buffer(struct stfcamss_video *video,
+			    struct stfcamss_buffer *buf)
+{
+	struct stf_capture *cap =3D to_stf_capture(video);
+	struct stf_v_buf *v_bufs =3D &cap->buffers;
+	unsigned long flags;
+
+	spin_lock_irqsave(&v_bufs->lock, flags);
+	stf_buf_update_on_new(video, buf);
+	spin_unlock_irqrestore(&v_bufs->lock, flags);
+
+	return 0;
+}
+
+static int stf_flush_buffers(struct stfcamss_video *video,
+			     enum vb2_buffer_state state)
+{
+	struct stf_capture *cap =3D to_stf_capture(video);
+	struct stf_v_buf *v_bufs =3D &cap->buffers;
+	unsigned long flags;
+	unsigned int i;
+
+	spin_lock_irqsave(&v_bufs->lock, flags);
+
+	stf_buf_flush(v_bufs, state);
+
+	for (i =3D 0; i < ARRAY_SIZE(v_bufs->buf); i++) {
+		if (v_bufs->buf[i])
+			vb2_buffer_done(&v_bufs->buf[i]->vb.vb2_buf, state);
+
+		v_bufs->buf[i] =3D NULL;
+	}
+
+	if (v_bufs->last_buffer) {
+		vb2_buffer_done(&v_bufs->last_buffer->vb.vb2_buf, state);
+		v_bufs->last_buffer =3D NULL;
+	}
+
+	spin_unlock_irqrestore(&v_bufs->lock, flags);
+	return 0;
+}
+
+static const struct stfcamss_video_ops stf_capture_ops =3D {
+	.queue_buffer =3D stf_queue_buffer,
+	.flush_buffers =3D stf_flush_buffers,
+	.start_streaming =3D stf_capture_start,
+	.stop_streaming =3D stf_capture_stop,
+};
+
+static void stf_capture_unregister_one(struct stf_capture *cap)
+{
+	if (!video_is_registered(&cap->video.vdev))
+		return;
+
+	media_entity_cleanup(&cap->video.vdev.entity);
+	vb2_video_unregister_device(&cap->video.vdev);
+}
+
+void stf_capture_unregister(struct stfcamss *stfcamss)
+{
+	struct stf_capture *cap_raw =3D &stfcamss->captures[STF_CAPTURE_RAW];
+	struct stf_capture *cap_yuv =3D &stfcamss->captures[STF_CAPTURE_YUV];
+
+	stf_capture_unregister_one(cap_raw);
+	stf_capture_unregister_one(cap_yuv);
+}
+
+int stf_capture_register(struct stfcamss *stfcamss,
+			 struct v4l2_device *v4l2_dev)
+{
+	unsigned int i;
+	int ret;
+
+	for (i =3D 0; i < ARRAY_SIZE(stfcamss->captures); i++) {
+		struct stf_capture *capture =3D &stfcamss->captures[i];
+
+		capture->type =3D i;
+		capture->video.ops =3D &stf_capture_ops;
+		stf_capture_init(stfcamss, capture);
+
+		ret =3D stf_video_register(&capture->video, v4l2_dev,
+					 stf_cap_names[i]);
+		if (ret < 0) {
+			dev_err(stfcamss->dev,
+				"Failed to register video node: %d\n", ret);
+			stf_capture_unregister(stfcamss);
+			return ret;
+		}
+	}
+
+	return 0;
+}
diff --git a/drivers/staging/media/starfive/camss/stf-capture.h b/drivers=
/staging/media/starfive/camss/stf-capture.h
new file mode 100644
index 000000000000..4a6c8f9b779b
--- /dev/null
+++ b/drivers/staging/media/starfive/camss/stf-capture.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * stf_capture.h
+ *
+ * Starfive Camera Subsystem driver
+ *
+ * Copyright (C) 2021-2023 StarFive Technology Co., Ltd.
+ */
+
+#ifndef STF_CAPTURE_H
+#define STF_CAPTURE_H
+
+#include "stf-video.h"
+
+#define VIN_CHANNEL_SEL_EN			0x14
+#define VIN_START_ADDR_N			0x18
+#define VIN_INRT_PIX_CFG			0x1c
+#define VIN_START_ADDR_O			0x20
+#define VIN_CFG_REG				0x24
+
+#define U0_VIN_CNFG_AXI_DVP_EN			BIT(2)
+
+#define U0_VIN_CHANNEL_SEL_MASK			GENMASK(3, 0)
+#define U0_VIN_AXIWR0_EN			BIT(4)
+#define CHANNEL(x)				((x) << 0)
+
+#define U0_VIN_INTR_CLEAN			BIT(0)
+#define U0_VIN_INTR_M				BIT(1)
+#define U0_VIN_PIX_CNT_END_MASK			GENMASK(12, 2)
+#define U0_VIN_PIX_CT_MASK			GENMASK(14, 13)
+#define U0_VIN_PIXEL_HEIGH_BIT_SEL_MAKS		GENMASK(16, 15)
+
+#define PIX_CNT_END(x)				((x) << 2)
+#define PIX_CT(x)				((x) << 13)
+#define PIXEL_HEIGH_BIT_SEL(x)			((x) << 15)
+
+#define U0_VIN_CNFG_DVP_HS_POS			BIT(1)
+#define U0_VIN_CNFG_DVP_SWAP_EN			BIT(2)
+#define U0_VIN_CNFG_DVP_VS_POS			BIT(3)
+#define U0_VIN_CNFG_GEN_EN_AXIRD		BIT(4)
+#define U0_VIN_CNFG_ISP_DVP_EN0			BIT(5)
+#define U0_VIN_MIPI_BYTE_EN_ISP0(n)		((n) << 6)
+#define U0_VIN_MIPI_CHANNEL_SEL0(n)		((n) << 8)
+#define U0_VIN_P_I_MIPI_HAEDER_EN0(n)		((n) << 12)
+#define U0_VIN_PIX_NUM(n)			((n) << 13)
+#define U0_VIN_MIPI_BYTE_EN_ISP0_MASK		GENMASK(7, 6)
+#define U0_VIN_MIPI_CHANNEL_SEL0_MASK		GENMASK(11, 8)
+#define U0_VIN_P_I_MIPI_HAEDER_EN0_MASK		BIT(12)
+#define U0_VIN_PIX_NUM_MASK			GENMASK(16, 13)
+
+enum stf_v_state {
+	STF_OUTPUT_OFF,
+	STF_OUTPUT_RESERVED,
+	STF_OUTPUT_SINGLE,
+	STF_OUTPUT_CONTINUOUS,
+	STF_OUTPUT_IDLE,
+	STF_OUTPUT_STOPPING
+};
+
+struct stf_v_buf {
+	int active_buf;
+	struct stfcamss_buffer *buf[2];
+	struct stfcamss_buffer *last_buffer;
+	struct list_head pending_bufs;
+	struct list_head ready_bufs;
+	enum stf_v_state state;
+	unsigned int sequence;
+	/* protects the above member variables */
+	spinlock_t lock;
+	atomic_t frame_skip;
+};
+
+struct stf_capture {
+	struct stfcamss_video video;
+	struct stf_v_buf buffers;
+	enum stf_capture_type type;
+};
+
+irqreturn_t stf_wr_irq_handler(int irq, void *priv);
+irqreturn_t stf_isp_irq_handler(int irq, void *priv);
+irqreturn_t stf_line_irq_handler(int irq, void *priv);
+int stf_capture_register(struct stfcamss *stfcamss,
+			 struct v4l2_device *v4l2_dev);
+void stf_capture_unregister(struct stfcamss *stfcamss);
+
+#endif
+
--=20
2.34.1

