Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7F87F
	for <linux-staging@lists.linux.dev>; Thu, 14 Sep 2023 03:19:07 +0000 (UTC)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 07BDA24E25D;
	Thu, 14 Sep 2023 11:16:11 +0800 (CST)
Received: from EXMBX073.cuchost.com (172.16.6.83) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 14 Sep
 2023 11:16:10 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX073.cuchost.com
 (172.16.6.83) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 14 Sep
 2023 11:16:10 +0800
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
Subject: [PATCH v9 4/8] media: staging: media: starfive: camss: Add video driver
Date: Thu, 14 Sep 2023 11:16:03 +0800
Message-ID: <20230914031607.34877-5-jack.zhu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914031607.34877-1-jack.zhu@starfivetech.com>
References: <20230914031607.34877-1-jack.zhu@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX073.cuchost.com
 (172.16.6.83)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable

Add video driver for StarFive Camera Subsystem.

Signed-off-by: Jack Zhu <jack.zhu@starfivetech.com>
---
 drivers/staging/media/starfive/camss/Makefile |   3 +-
 .../staging/media/starfive/camss/stf-video.c  | 571 ++++++++++++++++++
 .../staging/media/starfive/camss/stf-video.h  | 100 +++
 3 files changed, 673 insertions(+), 1 deletion(-)
 create mode 100644 drivers/staging/media/starfive/camss/stf-video.c
 create mode 100644 drivers/staging/media/starfive/camss/stf-video.h

diff --git a/drivers/staging/media/starfive/camss/Makefile b/drivers/stag=
ing/media/starfive/camss/Makefile
index 78211e30550f..7d320b9317c8 100644
--- a/drivers/staging/media/starfive/camss/Makefile
+++ b/drivers/staging/media/starfive/camss/Makefile
@@ -4,6 +4,7 @@
 #
=20
 starfive-camss-objs +=3D \
-		stf-camss.o
+		stf-camss.o \
+		stf-video.o
=20
 obj-$(CONFIG_VIDEO_STARFIVE_CAMSS) +=3D starfive-camss.o
diff --git a/drivers/staging/media/starfive/camss/stf-video.c b/drivers/s=
taging/media/starfive/camss/stf-video.c
new file mode 100644
index 000000000000..bb21aa04482b
--- /dev/null
+++ b/drivers/staging/media/starfive/camss/stf-video.c
@@ -0,0 +1,571 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * stf_video.c
+ *
+ * StarFive Camera Subsystem - V4L2 device node
+ *
+ * Copyright (C) 2021-2023 StarFive Technology Co., Ltd.
+ */
+
+#include <linux/pm_runtime.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-mc.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "stf-camss.h"
+#include "stf-video.h"
+
+/* ---------------------------------------------------------------------=
--------
+ * Helper functions
+ */
+
+static inline struct stfcamss_buffer *
+to_stfcamss_buffer(struct vb2_v4l2_buffer *vbuf)
+{
+	return container_of(vbuf, struct stfcamss_buffer, vb);
+}
+
+static const struct stfcamss_format_info *
+video_g_fi_by_index(struct stfcamss_video *video, int index)
+{
+	if (index >=3D video->nformats)
+		return NULL;
+
+	return &video->formats[index];
+}
+
+static const struct stfcamss_format_info *
+video_g_fi_by_mcode(struct stfcamss_video *video, u32 mcode)
+{
+	unsigned int i;
+
+	for (i =3D 0; i < video->nformats; i++) {
+		if (video->formats[i].code =3D=3D mcode)
+			return &video->formats[i];
+	}
+
+	return NULL;
+}
+
+static const struct stfcamss_format_info *
+video_g_fi_by_pfmt(struct stfcamss_video *video, u32 pixelformat)
+{
+	unsigned int i;
+
+	for (i =3D 0; i < video->nformats; i++) {
+		if (video->formats[i].pixelformat =3D=3D pixelformat)
+			return &video->formats[i];
+	}
+
+	return NULL;
+}
+
+static int __video_try_fmt(struct stfcamss_video *video, struct v4l2_for=
mat *f)
+{
+	struct v4l2_pix_format *pix =3D &f->fmt.pix;
+	const struct stfcamss_format_info *fi;
+	u32 width, height;
+	u32 bpl;
+	unsigned int i;
+
+	fi =3D video_g_fi_by_pfmt(video, pix->pixelformat);
+	if (!fi)
+		fi =3D &video->formats[0]; /* default format */
+
+	width =3D pix->width;
+	height =3D pix->height;
+
+	memset(pix, 0, sizeof(*pix));
+
+	pix->pixelformat =3D fi->pixelformat;
+	pix->width =3D clamp_t(u32, width, STFCAMSS_FRAME_MIN_WIDTH,
+			     STFCAMSS_FRAME_MAX_WIDTH);
+	pix->height =3D clamp_t(u32, height, STFCAMSS_FRAME_MIN_HEIGHT,
+			      STFCAMSS_FRAME_MAX_HEIGHT);
+	bpl =3D pix->width * fi->bpp / 8;
+	bpl =3D ALIGN(bpl, video->bpl_alignment);
+	pix->bytesperline =3D bpl;
+
+	for (i =3D 0; i < fi->planes; ++i)
+		pix->sizeimage +=3D bpl * pix->height / fi->vsub[i];
+
+	pix->field =3D V4L2_FIELD_NONE;
+	pix->colorspace =3D V4L2_COLORSPACE_SRGB;
+	pix->flags =3D 0;
+	pix->ycbcr_enc =3D
+		V4L2_MAP_YCBCR_ENC_DEFAULT(pix->colorspace);
+	pix->quantization =3D V4L2_MAP_QUANTIZATION_DEFAULT(true,
+							  pix->colorspace,
+							  pix->ycbcr_enc);
+	pix->xfer_func =3D V4L2_MAP_XFER_FUNC_DEFAULT(pix->colorspace);
+
+	return 0;
+}
+
+static int stf_video_init_format(struct stfcamss_video *video)
+{
+	int ret;
+	struct v4l2_format format =3D {
+		.type =3D video->type,
+		.fmt.pix =3D {
+			.width =3D 1920,
+			.height =3D 1080,
+			.pixelformat =3D V4L2_PIX_FMT_NV12,
+		},
+	};
+
+	ret =3D __video_try_fmt(video, &format);
+
+	if (ret < 0)
+		return ret;
+
+	video->active_fmt =3D format;
+
+	return 0;
+}
+
+/* ---------------------------------------------------------------------=
--------
+ * Video queue operations
+ */
+
+static int video_queue_setup(struct vb2_queue *q,
+			     unsigned int *num_buffers,
+			     unsigned int *num_planes,
+			     unsigned int sizes[],
+			     struct device *alloc_devs[])
+{
+	struct stfcamss_video *video =3D vb2_get_drv_priv(q);
+	const struct v4l2_pix_format *format =3D &video->active_fmt.fmt.pix;
+
+	if (*num_planes) {
+		if (*num_planes !=3D 1)
+			return -EINVAL;
+
+		if (sizes[0] < format->sizeimage)
+			return -EINVAL;
+	}
+
+	*num_planes =3D 1;
+	sizes[0] =3D format->sizeimage;
+	if (!sizes[0]) {
+		dev_dbg(video->stfcamss->dev,
+			"%s: error size is zero.\n", __func__);
+		return -EINVAL;
+	}
+
+	dev_dbg(video->stfcamss->dev, "planes =3D %d, size =3D %d\n",
+		*num_planes, sizes[0]);
+
+	return 0;
+}
+
+static int video_buf_init(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
+	struct stfcamss_video *video =3D vb2_get_drv_priv(vb->vb2_queue);
+	struct stfcamss_buffer *buffer =3D to_stfcamss_buffer(vbuf);
+	const struct v4l2_pix_format *fmt =3D &video->active_fmt.fmt.pix;
+	dma_addr_t *paddr;
+
+	paddr =3D vb2_plane_cookie(vb, 0);
+	buffer->addr[0] =3D *paddr;
+
+	if (fmt->pixelformat =3D=3D V4L2_PIX_FMT_NV12)
+		buffer->addr[1] =3D
+			buffer->addr[0] + fmt->bytesperline * fmt->height;
+
+	return 0;
+}
+
+static int video_buf_prepare(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
+	struct stfcamss_video *video =3D vb2_get_drv_priv(vb->vb2_queue);
+	const struct v4l2_pix_format *fmt =3D &video->active_fmt.fmt.pix;
+
+	if (fmt->sizeimage > vb2_plane_size(vb, 0)) {
+		dev_dbg(video->stfcamss->dev,
+			"sizeimage =3D %u, plane size =3D %u\n",
+			fmt->sizeimage, (unsigned int)vb2_plane_size(vb, 0));
+		return -EINVAL;
+	}
+	vb2_set_plane_payload(vb, 0, fmt->sizeimage);
+
+	vbuf->field =3D V4L2_FIELD_NONE;
+
+	return 0;
+}
+
+static void video_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
+	struct stfcamss_video *video =3D vb2_get_drv_priv(vb->vb2_queue);
+	struct stfcamss_buffer *buffer =3D to_stfcamss_buffer(vbuf);
+
+	video->ops->queue_buffer(video, buffer);
+}
+
+static int video_get_subdev_format(struct stfcamss_video *video,
+				   struct v4l2_subdev_format *fmt)
+{
+	struct v4l2_subdev *subdev;
+	struct media_pad *pad;
+	struct media_entity *entity;
+	int ret;
+
+	entity =3D &video->vdev.entity;
+	while (1) {
+		pad =3D &entity->pads[0];
+		if (!(pad->flags & MEDIA_PAD_FL_SINK))
+			break;
+
+		pad =3D media_pad_remote_pad_first(pad);
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+			break;
+
+		entity =3D pad->entity;
+		subdev =3D media_entity_to_v4l2_subdev(entity);
+
+		fmt->pad =3D pad->index;
+
+		ret =3D v4l2_subdev_call_state_active(subdev, pad, get_fmt, fmt);
+		if (ret < 0 && ret !=3D -ENOIOCTLCMD)
+			return ret;
+		else if (!ret)
+			break;
+	}
+
+	return 0;
+}
+
+static int stf_video_check_format(struct stfcamss_video *video)
+{
+	struct v4l2_pix_format *pix =3D &video->active_fmt.fmt.pix;
+	const struct stfcamss_format_info *fi;
+	int ret;
+	struct v4l2_subdev_format sd_fmt =3D {
+		.which =3D V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+
+	ret =3D video_get_subdev_format(video, &sd_fmt);
+	if (ret < 0)
+		return ret;
+
+	fi =3D video_g_fi_by_mcode(video, sd_fmt.format.code);
+	if (!fi)
+		return -EINVAL;
+
+	if (pix->pixelformat !=3D fi->pixelformat ||
+	    pix->height !=3D sd_fmt.format.height ||
+	    pix->width !=3D sd_fmt.format.width ||
+	    pix->field !=3D sd_fmt.format.field)
+		return -EPIPE;
+
+	return 0;
+}
+
+static int video_start_streaming(struct vb2_queue *q, unsigned int count=
)
+{
+	struct stfcamss_video *video =3D vb2_get_drv_priv(q);
+	struct video_device *vdev =3D &video->vdev;
+	int ret;
+
+	ret =3D video_device_pipeline_start(vdev, &video->stfcamss->pipe);
+	if (ret < 0) {
+		dev_err(video->stfcamss->dev,
+			"Failed to media_pipeline_start: %d\n", ret);
+		goto err_ret_buffers;
+	}
+
+	ret =3D pm_runtime_resume_and_get(video->stfcamss->dev);
+	if (ret < 0) {
+		dev_err(video->stfcamss->dev, "power up failed %d\n", ret);
+		goto err_pipeline_stop;
+	}
+
+	video->ops->start_streaming(video);
+
+	ret =3D v4l2_subdev_call(video->source_subdev, video, s_stream, true);
+	if (ret) {
+		dev_err(video->stfcamss->dev, "stream on failed\n");
+		goto err_pm_put;
+	}
+
+	return 0;
+
+err_pm_put:
+	pm_runtime_put(video->stfcamss->dev);
+err_pipeline_stop:
+	video_device_pipeline_stop(vdev);
+err_ret_buffers:
+	video->ops->flush_buffers(video, VB2_BUF_STATE_QUEUED);
+	return ret;
+}
+
+static void video_stop_streaming(struct vb2_queue *q)
+{
+	struct stfcamss_video *video =3D vb2_get_drv_priv(q);
+	struct video_device *vdev =3D &video->vdev;
+
+	video->ops->stop_streaming(video);
+
+	v4l2_subdev_call(video->source_subdev, video, s_stream, false);
+
+	pm_runtime_put(video->stfcamss->dev);
+
+	video_device_pipeline_stop(vdev);
+	video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
+}
+
+static const struct vb2_ops stf_video_vb2_q_ops =3D {
+	.queue_setup     =3D video_queue_setup,
+	.wait_prepare    =3D vb2_ops_wait_prepare,
+	.wait_finish     =3D vb2_ops_wait_finish,
+	.buf_init        =3D video_buf_init,
+	.buf_prepare     =3D video_buf_prepare,
+	.buf_queue       =3D video_buf_queue,
+	.start_streaming =3D video_start_streaming,
+	.stop_streaming  =3D video_stop_streaming,
+};
+
+/* ---------------------------------------------------------------------=
--------
+ * V4L2 ioctls
+ */
+
+static int video_querycap(struct file *file, void *fh,
+			  struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, "stf camss", sizeof(cap->driver));
+	strscpy(cap->card, "Starfive Camera Subsystem", sizeof(cap->card));
+
+	return 0;
+}
+
+static int video_enum_fmt(struct file *file, void *fh, struct v4l2_fmtde=
sc *f)
+{
+	struct stfcamss_video *video =3D video_drvdata(file);
+	const struct stfcamss_format_info *fi;
+
+	if (f->index >=3D video->nformats)
+		return -EINVAL;
+
+	if (f->mbus_code) {
+		/* Each entry in formats[] table has unique mbus_code */
+		if (f->index > 0)
+			return -EINVAL;
+
+		fi =3D video_g_fi_by_mcode(video, f->mbus_code);
+	} else {
+		fi =3D video_g_fi_by_index(video, f->index);
+	}
+
+	if (!fi)
+		return -EINVAL;
+
+	f->pixelformat =3D fi->pixelformat;
+
+	return 0;
+}
+
+static int video_enum_framesizes(struct file *file, void *fh,
+				 struct v4l2_frmsizeenum *fsize)
+{
+	struct stfcamss_video *video =3D video_drvdata(file);
+	unsigned int i;
+
+	if (fsize->index)
+		return -EINVAL;
+
+	for (i =3D 0; i < video->nformats; i++) {
+		if (video->formats[i].pixelformat =3D=3D fsize->pixel_format)
+			break;
+	}
+
+	if (i =3D=3D video->nformats)
+		return -EINVAL;
+
+	fsize->type =3D V4L2_FRMSIZE_TYPE_CONTINUOUS;
+	fsize->stepwise.min_width =3D STFCAMSS_FRAME_MIN_WIDTH;
+	fsize->stepwise.max_width =3D STFCAMSS_FRAME_MAX_WIDTH;
+	fsize->stepwise.min_height =3D STFCAMSS_FRAME_MIN_HEIGHT;
+	fsize->stepwise.max_height =3D STFCAMSS_FRAME_MAX_HEIGHT;
+	fsize->stepwise.step_width =3D 1;
+	fsize->stepwise.step_height =3D 1;
+
+	return 0;
+}
+
+static int video_g_fmt(struct file *file, void *fh, struct v4l2_format *=
f)
+{
+	struct stfcamss_video *video =3D video_drvdata(file);
+
+	*f =3D video->active_fmt;
+
+	return 0;
+}
+
+static int video_s_fmt(struct file *file, void *fh, struct v4l2_format *=
f)
+{
+	struct stfcamss_video *video =3D video_drvdata(file);
+	int ret;
+
+	if (vb2_is_busy(&video->vb2_q))
+		return -EBUSY;
+
+	ret =3D __video_try_fmt(video, f);
+	if (ret < 0)
+		return ret;
+
+	video->active_fmt =3D *f;
+
+	return 0;
+}
+
+static int video_try_fmt(struct file *file, void *fh, struct v4l2_format=
 *f)
+{
+	struct stfcamss_video *video =3D video_drvdata(file);
+
+	return __video_try_fmt(video, f);
+}
+
+static const struct v4l2_ioctl_ops stf_vid_ioctl_ops =3D {
+	.vidioc_querycap                =3D video_querycap,
+	.vidioc_enum_fmt_vid_cap        =3D video_enum_fmt,
+	.vidioc_enum_framesizes         =3D video_enum_framesizes,
+	.vidioc_g_fmt_vid_cap           =3D video_g_fmt,
+	.vidioc_s_fmt_vid_cap           =3D video_s_fmt,
+	.vidioc_try_fmt_vid_cap         =3D video_try_fmt,
+	.vidioc_reqbufs                 =3D vb2_ioctl_reqbufs,
+	.vidioc_querybuf                =3D vb2_ioctl_querybuf,
+	.vidioc_qbuf                    =3D vb2_ioctl_qbuf,
+	.vidioc_expbuf                  =3D vb2_ioctl_expbuf,
+	.vidioc_dqbuf                   =3D vb2_ioctl_dqbuf,
+	.vidioc_create_bufs             =3D vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf             =3D vb2_ioctl_prepare_buf,
+	.vidioc_streamon                =3D vb2_ioctl_streamon,
+	.vidioc_streamoff               =3D vb2_ioctl_streamoff,
+};
+
+/* ---------------------------------------------------------------------=
--------
+ * V4L2 file operations
+ */
+
+static const struct v4l2_file_operations stf_vid_fops =3D {
+	.owner          =3D THIS_MODULE,
+	.unlocked_ioctl =3D video_ioctl2,
+	.open           =3D v4l2_fh_open,
+	.release        =3D vb2_fop_release,
+	.poll           =3D vb2_fop_poll,
+	.mmap           =3D vb2_fop_mmap,
+	.read           =3D vb2_fop_read,
+};
+
+/* ---------------------------------------------------------------------=
--------
+ * STFCAMSS video core
+ */
+
+static int stf_link_validate(struct media_link *link)
+{
+	struct video_device *vdev =3D
+		media_entity_to_video_device(link->sink->entity);
+	struct stfcamss_video *video =3D video_get_drvdata(vdev);
+	int ret;
+
+	ret =3D stf_video_check_format(video);
+
+	return ret;
+}
+
+static const struct media_entity_operations stf_media_ops =3D {
+	.link_validate =3D stf_link_validate,
+};
+
+static void stf_video_release(struct video_device *vdev)
+{
+	struct stfcamss_video *video =3D video_get_drvdata(vdev);
+
+	media_entity_cleanup(&vdev->entity);
+
+	mutex_destroy(&video->q_lock);
+	mutex_destroy(&video->lock);
+}
+
+int stf_video_register(struct stfcamss_video *video,
+		       struct v4l2_device *v4l2_dev, const char *name)
+{
+	struct video_device *vdev =3D &video->vdev;
+	struct vb2_queue *q;
+	struct media_pad *pad =3D &video->pad;
+	int ret;
+
+	mutex_init(&video->q_lock);
+	mutex_init(&video->lock);
+
+	q =3D &video->vb2_q;
+	q->drv_priv =3D video;
+	q->mem_ops =3D &vb2_dma_contig_memops;
+	q->ops =3D &stf_video_vb2_q_ops;
+	q->type =3D video->type;
+	q->io_modes =3D VB2_DMABUF | VB2_MMAP;
+	q->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->buf_struct_size =3D sizeof(struct stfcamss_buffer);
+	q->dev =3D video->stfcamss->dev;
+	q->lock =3D &video->q_lock;
+	q->min_buffers_needed =3D STFCAMSS_MIN_BUFFERS;
+	ret =3D vb2_queue_init(q);
+	if (ret < 0) {
+		dev_err(video->stfcamss->dev,
+			"Failed to init vb2 queue: %d\n", ret);
+		goto err_mutex_destroy;
+	}
+
+	pad->flags =3D MEDIA_PAD_FL_SINK;
+	ret =3D media_entity_pads_init(&vdev->entity, 1, pad);
+	if (ret < 0) {
+		dev_err(video->stfcamss->dev,
+			"Failed to init video entity: %d\n", ret);
+		goto err_mutex_destroy;
+	}
+
+	ret =3D stf_video_init_format(video);
+	if (ret < 0) {
+		dev_err(video->stfcamss->dev,
+			"Failed to init format: %d\n", ret);
+		goto err_media_cleanup;
+	}
+
+	vdev->fops =3D &stf_vid_fops;
+	vdev->ioctl_ops =3D &stf_vid_ioctl_ops;
+	vdev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	vdev->entity.ops =3D &stf_media_ops;
+	vdev->vfl_dir =3D VFL_DIR_RX;
+	vdev->release =3D stf_video_release;
+	vdev->v4l2_dev =3D v4l2_dev;
+	vdev->queue =3D &video->vb2_q;
+	vdev->lock =3D &video->lock;
+	strscpy(vdev->name, name, sizeof(vdev->name));
+
+	video_set_drvdata(vdev, video);
+
+	ret =3D video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret < 0) {
+		dev_err(video->stfcamss->dev,
+			"Failed to register video device: %d\n", ret);
+		goto err_media_cleanup;
+	}
+
+	return 0;
+
+err_media_cleanup:
+	media_entity_cleanup(&vdev->entity);
+err_mutex_destroy:
+	mutex_destroy(&video->lock);
+	mutex_destroy(&video->q_lock);
+	return ret;
+}
+
+void stf_video_unregister(struct stfcamss_video *video)
+{
+	vb2_video_unregister_device(&video->vdev);
+}
diff --git a/drivers/staging/media/starfive/camss/stf-video.h b/drivers/s=
taging/media/starfive/camss/stf-video.h
new file mode 100644
index 000000000000..8052b77e3ad8
--- /dev/null
+++ b/drivers/staging/media/starfive/camss/stf-video.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * stf_video.h
+ *
+ * StarFive Camera Subsystem - V4L2 device node
+ *
+ * Copyright (C) 2021-2023 StarFive Technology Co., Ltd.
+ */
+
+#ifndef STF_VIDEO_H
+#define STF_VIDEO_H
+
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/videodev2.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-v4l2.h>
+
+#define STFCAMSS_FRAME_MIN_WIDTH		64
+#define STFCAMSS_FRAME_MAX_WIDTH		1920
+#define STFCAMSS_FRAME_MIN_HEIGHT		64
+#define STFCAMSS_FRAME_MAX_HEIGHT		1080
+#define STFCAMSS_FRAME_WIDTH_ALIGN_8		8
+#define STFCAMSS_FRAME_WIDTH_ALIGN_128		128
+#define STFCAMSS_MIN_BUFFERS			2
+
+#define STFCAMSS_MAX_ENTITY_NAME_LEN		27
+
+enum stf_v_line_id {
+	STF_V_LINE_WR =3D 0,
+	STF_V_LINE_ISP,
+	STF_V_LINE_MAX,
+};
+
+enum stf_capture_type {
+	STF_CAPTURE_RAW =3D 0,
+	STF_CAPTURE_YUV,
+	STF_CAPTURE_NUM,
+};
+
+struct stfcamss_buffer {
+	struct vb2_v4l2_buffer vb;
+	dma_addr_t addr[2];
+	struct list_head queue;
+};
+
+struct fract {
+	u8 numerator;
+	u8 denominator;
+};
+
+/*
+ * struct stfcamss_format_info - ISP media bus format information
+ * @code: V4L2 media bus format code
+ * @pixelformat: V4L2 pixel format FCC identifier
+ * @planes: Number of planes
+ * @vsub: Vertical subsampling (for each plane)
+ * @bpp: Bits per pixel when stored in memory (for each plane)
+ */
+struct stfcamss_format_info {
+	u32 code;
+	u32 pixelformat;
+	u8 planes;
+	u8 vsub[3];
+	u8 bpp;
+};
+
+struct stfcamss_video {
+	struct stfcamss *stfcamss;
+	struct vb2_queue vb2_q;
+	struct video_device vdev;
+	struct media_pad pad;
+	struct v4l2_format active_fmt;
+	enum v4l2_buf_type type;
+	const struct stfcamss_video_ops *ops;
+	struct mutex lock;	 /* serialize device access */
+	struct mutex q_lock;	 /* protects the queue */
+	unsigned int bpl_alignment;
+	const struct stfcamss_format_info *formats;
+	unsigned int nformats;
+	struct v4l2_subdev *source_subdev;
+};
+
+struct stfcamss_video_ops {
+	int (*queue_buffer)(struct stfcamss_video *video,
+			    struct stfcamss_buffer *buf);
+	int (*flush_buffers)(struct stfcamss_video *video,
+			     enum vb2_buffer_state state);
+	void (*start_streaming)(struct stfcamss_video *video);
+	void (*stop_streaming)(struct stfcamss_video *video);
+};
+
+int stf_video_register(struct stfcamss_video *video,
+		       struct v4l2_device *v4l2_dev, const char *name);
+
+void stf_video_unregister(struct stfcamss_video *video);
+
+#endif /* STF_VIDEO_H */
--=20
2.34.1

