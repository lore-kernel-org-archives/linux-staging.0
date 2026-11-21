Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795270482;
	b=UMcZ/qsjQxBMHEGz2a2gUGI18SxXJxDIzRdZTaYB9EH4FLeMDwha22DmEoo47Xg+LGGu
	 O3GsPxMEV+aSAGT6ZFAPhSqiiYOf7baObulabH8lUnjiu0Yr03CQ3PCNvVMwc18wgah22
	 HxwvoA8jHeJxWsWricao0zq8lXxX2A7A0xEEOP2FcTBSXsqxSP3NM3kkxhEOFt8CpZVrw
	 cSmz4RnMBwP61voATDdc3/6NcrHEDiUo7Tu6dlgsG8re2CmgQ+U9NmA5Y6Wic5lqHcfOM
	 dIw5ZlzCUeIxpiVZUxoj9txP5SwtnbEyT3j8KCOcaiYjtUlMR+Jx6IsbI7TzAv6S7Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795270482;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=1HMY/zerrLaVODF7isC+LZZRfY3H0/yyQQHwk+Gq+G0=;
	b=4rQ8HEbIzj4EtcMflWitWndptoaPSJLhEzz2dy8h2kXFSoN518u5ZGttWjmb1rArzJJD
	 Z4fGvr6bmW12bfKIJECS8HQ/eVEvVxJNB8wsAsI333+E/H3H85jakjsjnqS/VUsgKZdkp
	 m09KiC7GLCD9+Z8YoTaJ1l2YTIUhTHFo+lgWJfjtiA5/C+wl8qycPyr3H0g8bfXjsnV1i
	 yB5lFuHxmi3w3Yt+CEfC9GxwxpT1TfpKDkdGSem8hOFxDAiqGGRnxzXcHs5sG0W/g+G6C
	 8JF2yhcPBUrbW0eNDHqrN7TIs03OlLnDYvz0uRWzQDn4BdCTrIwKHMF7OFOZmihH72w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=AtfFz19D;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF713606A32C;
	Sat, 21 Nov 2026 14:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF713606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=AtfFz19D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=1H
	MY/zerrLaVODF7isC+LZZRfY3H0/yyQQHwk+Gq+G0=; b=AtfFz19DQQdtmxAT3C
	xg2x3ZVerQEVe1QiWCz2hReJ87jCz8ANOICP2ptr4/r917+Lh+nZd8mScZAKKRRS
	8n83+VmS1/HB2cbno4IqzVbwRg0r1sxYF0FQHMceWdxOW1yUgME4Y/DH2iNr1YaI
	qI4hFCoNLW7Cg/BbAvhw02tJA=
Received: from Ubuntu26.04LTS (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3B5c2pwFrJohbJQ--.61736S3;
	Sat, 21 Nov 2026 22:14:16 +0800 (CST)
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
Subject: [PATCH 1/3] media: imx: remove legacy video node control and format handling
Date: Sat, 21 Nov 2026 22:14:09 +0800
Message-ID: <20261121141412.319802-2-shijiaqi_develop@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121141412.319802-1-shijiaqi_develop@163.com>
References: <20261121141412.319802-1-shijiaqi_develop@163.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3B5c2pwFrJohbJQ--.61736S3
X-Coremail-Antispam: 1Uf129KBjvAXoW3ur4DWr48Xr1xtr1fCF18uFg_yoW8CryfKo
	Z3W3ZxAw4rGry8XFWkJrn7JFy3XFnYgan7Z34vyrWvkw43Za1jq34fC3ZIqF1aqrs0ka98
	ZF17XrWUJF4fX3W8n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RFkshDUUUU
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbCzRgTZmsBpzg8KgAA3D

Remove control inheritance from pipeline subdevices to video nodes.
Userspace should access controls through subdev nodes instead.

Use source-independent format ioctls for all capture nodes and
initialize them to the existing UYVY 640x480 default instead of the
source subdev active format. Keep stream-time format validation.

Update the usage documentation and remove the completed TODO entries.

Signed-off-by: Jiaqi Shi <shijiaqi_develop@163.com>
---
 Documentation/admin-guide/media/imx.rst       |  10 +-
 drivers/staging/media/imx/TODO                |  10 -
 drivers/staging/media/imx/imx-ic-prpencvf.c   |   5 +-
 drivers/staging/media/imx/imx-media-capture.c | 192 ++----------------
 drivers/staging/media/imx/imx-media-csi.c     |   5 +-
 .../staging/media/imx/imx-media-dev-common.c  | 113 +----------
 drivers/staging/media/imx/imx-media.h         |   7 +-
 7 files changed, 21 insertions(+), 321 deletions(-)

diff --git a/Documentation/admin-guide/media/imx.rst b/Documentation/admin-guide/media/imx.rst
index bb68100d8acb..b1c5fecfaef7 100644
--- a/Documentation/admin-guide/media/imx.rst
+++ b/Documentation/admin-guide/media/imx.rst
@@ -394,13 +394,9 @@ scaling up to 1024x1024, CSC, flip, and rotation:
 Usage Notes
 -----------
 
-To aid in configuration and for backward compatibility with V4L2
-applications that access controls only from video device nodes, the
-capture device interfaces inherit controls from the active entities
-in the current pipeline, so controls can be accessed either directly
-from the subdev or from the active capture device interface. For
-example, the FIM controls are available either from the ipuX_csiY
-subdevs or from the active capture device.
+Controls for pipeline entities are accessed through their subdev device
+nodes. For example, the FIM controls are available from the ipuX_csiY
+subdevs.
 
 The following are specific usage notes for the Sabre* reference
 boards:
diff --git a/drivers/staging/media/imx/TODO b/drivers/staging/media/imx/TODO
index 11c9e10d34ae..43cd030d4bbd 100644
--- a/drivers/staging/media/imx/TODO
+++ b/drivers/staging/media/imx/TODO
@@ -1,13 +1,3 @@
 
 - The Frame Interval Monitor could be exported to v4l2-core for
   general use.
-
-- This media driver supports inheriting V4L2 controls to the
-  video capture devices, from the subdevices in the capture device's
-  pipeline. The controls for each capture device are updated in the
-  link_notify callback when the pipeline is modified. This feature should be
-  removed, userspace should use the subdev-based userspace API instead.
-
-- Similarly to the legacy control handling, legacy format handling where
-  formats on the video nodes are influenced by the active format of the
-  connected subdev should be removed.
diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 3430ddeac356..b3f2177e1a5d 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -1286,7 +1286,7 @@ static int prp_registered(struct v4l2_subdev *sd)
 
 	ret = imx_media_capture_device_register(priv->vdev, 0);
 	if (ret)
-		goto remove_vdev;
+		return ret;
 
 	ret = prp_init_controls(priv);
 	if (ret)
@@ -1296,8 +1296,6 @@ static int prp_registered(struct v4l2_subdev *sd)
 
 unreg_vdev:
 	imx_media_capture_device_unregister(priv->vdev);
-remove_vdev:
-	imx_media_capture_device_remove(priv->vdev);
 	return ret;
 }
 
@@ -1306,7 +1304,6 @@ static void prp_unregistered(struct v4l2_subdev *sd)
 	struct prp_priv *priv = sd_to_priv(sd);
 
 	imx_media_capture_device_unregister(priv->vdev);
-	imx_media_capture_device_remove(priv->vdev);
 
 	v4l2_ctrl_handler_free(&priv->ctrl_hdlr);
 }
diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 9216a221b72f..93d05cd96798 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -12,7 +12,6 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
-#include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
@@ -41,10 +40,6 @@ struct capture_priv {
 	struct vb2_queue q;			/* The videobuf2 queue */
 	struct list_head ready_q;		/* List of queued buffers */
 	spinlock_t q_lock;			/* Protect ready_q */
-
-	struct v4l2_ctrl_handler ctrl_hdlr;	/* Controls inherited from subdevs */
-
-	bool legacy_api;			/* Use the legacy (pre-MC) API */
 };
 
 #define to_capture_priv(v) container_of(v, struct capture_priv, vdev)
@@ -346,133 +341,6 @@ static int capture_legacy_enum_frameintervals(struct file *file, void *fh,
 	return 0;
 }
 
-static int capture_legacy_enum_fmt_vid_cap(struct file *file, void *fh,
-					   struct v4l2_fmtdesc *f)
-{
-	struct capture_priv *priv = video_drvdata(file);
-	const struct imx_media_pixfmt *cc_src;
-	struct v4l2_subdev_format fmt_src = {
-		.pad = priv->src_sd_pad,
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
-	u32 fourcc;
-	int ret;
-
-	ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL, &fmt_src);
-	if (ret) {
-		dev_err(priv->dev, "failed to get src_sd format\n");
-		return ret;
-	}
-
-	cc_src = imx_media_find_ipu_format(fmt_src.format.code,
-					   PIXFMT_SEL_YUV_RGB);
-	if (cc_src) {
-		enum imx_pixfmt_sel fmt_sel =
-			(cc_src->cs == IPUV3_COLORSPACE_YUV) ?
-			PIXFMT_SEL_YUV : PIXFMT_SEL_RGB;
-
-		ret = imx_media_enum_pixel_formats(&fourcc, f->index, fmt_sel,
-						   0);
-		if (ret)
-			return ret;
-	} else {
-		cc_src = imx_media_find_mbus_format(fmt_src.format.code,
-						    PIXFMT_SEL_ANY);
-		if (WARN_ON(!cc_src))
-			return -EINVAL;
-
-		if (f->index != 0)
-			return -EINVAL;
-		fourcc = cc_src->fourcc;
-	}
-
-	f->pixelformat = fourcc;
-
-	return 0;
-}
-
-static const struct imx_media_pixfmt *
-__capture_legacy_try_fmt(struct capture_priv *priv,
-			 struct v4l2_subdev_format *fmt_src,
-			 struct v4l2_pix_format *pixfmt)
-{
-	const struct imx_media_pixfmt *cc;
-
-	cc = capture_find_format(fmt_src->format.code, pixfmt->pixelformat);
-	if (WARN_ON(!cc))
-		return NULL;
-
-	/* allow IDMAC interweave but enforce field order from source */
-	if (V4L2_FIELD_IS_INTERLACED(pixfmt->field)) {
-		switch (fmt_src->format.field) {
-		case V4L2_FIELD_SEQ_TB:
-			fmt_src->format.field = V4L2_FIELD_INTERLACED_TB;
-			break;
-		case V4L2_FIELD_SEQ_BT:
-			fmt_src->format.field = V4L2_FIELD_INTERLACED_BT;
-			break;
-		default:
-			break;
-		}
-	}
-
-	imx_media_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src->format, cc);
-
-	return cc;
-}
-
-static int capture_legacy_try_fmt_vid_cap(struct file *file, void *fh,
-					  struct v4l2_format *f)
-{
-	struct capture_priv *priv = video_drvdata(file);
-	struct v4l2_subdev_format fmt_src = {
-		.pad = priv->src_sd_pad,
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
-	int ret;
-
-	ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL, &fmt_src);
-	if (ret)
-		return ret;
-
-	if (!__capture_legacy_try_fmt(priv, &fmt_src, &f->fmt.pix))
-		return -EINVAL;
-
-	return 0;
-}
-
-static int capture_legacy_s_fmt_vid_cap(struct file *file, void *fh,
-					struct v4l2_format *f)
-{
-	struct capture_priv *priv = video_drvdata(file);
-	struct v4l2_subdev_format fmt_src = {
-		.pad = priv->src_sd_pad,
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
-	const struct imx_media_pixfmt *cc;
-	int ret;
-
-	if (vb2_is_busy(&priv->q)) {
-		dev_err(priv->dev, "%s queue busy\n", __func__);
-		return -EBUSY;
-	}
-
-	ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL, &fmt_src);
-	if (ret)
-		return ret;
-
-	cc = __capture_legacy_try_fmt(priv, &fmt_src, &f->fmt.pix);
-	if (!cc)
-		return -EINVAL;
-
-	priv->vdev.cc = cc;
-	priv->vdev.fmt = f->fmt.pix;
-	priv->vdev.compose.width = fmt_src.format.width;
-	priv->vdev.compose.height = fmt_src.format.height;
-
-	return 0;
-}
-
 static int capture_legacy_querystd(struct file *file, void *fh,
 				   v4l2_std_id *std)
 {
@@ -553,8 +421,6 @@ static int capture_legacy_subscribe_event(struct v4l2_fh *fh,
 		return v4l2_event_subscribe(fh, sub, 0, NULL);
 	case V4L2_EVENT_SOURCE_CHANGE:
 		return v4l2_src_change_event_subscribe(fh, sub);
-	case V4L2_EVENT_CTRL:
-		return v4l2_ctrl_subscribe_event(fh, sub);
 	default:
 		return -EINVAL;
 	}
@@ -566,10 +432,10 @@ static const struct v4l2_ioctl_ops capture_legacy_ioctl_ops = {
 	.vidioc_enum_framesizes		= capture_legacy_enum_framesizes,
 	.vidioc_enum_frameintervals	= capture_legacy_enum_frameintervals,
 
-	.vidioc_enum_fmt_vid_cap	= capture_legacy_enum_fmt_vid_cap,
+	.vidioc_enum_fmt_vid_cap	= capture_enum_fmt_vid_cap,
 	.vidioc_g_fmt_vid_cap		= capture_g_fmt_vid_cap,
-	.vidioc_try_fmt_vid_cap		= capture_legacy_try_fmt_vid_cap,
-	.vidioc_s_fmt_vid_cap		= capture_legacy_s_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap		= capture_try_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap		= capture_s_fmt_vid_cap,
 
 	.vidioc_querystd		= capture_legacy_querystd,
 	.vidioc_g_std			= capture_legacy_g_std,
@@ -869,36 +735,21 @@ void imx_media_capture_device_error(struct imx_media_video_dev *vdev)
 }
 EXPORT_SYMBOL_GPL(imx_media_capture_device_error);
 
-static int capture_init_format(struct capture_priv *priv)
+static void capture_init_format(struct capture_priv *priv)
 {
-	struct v4l2_subdev_format fmt_src = {
-		.pad = priv->src_sd_pad,
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
 	struct imx_media_video_dev *vdev = &priv->vdev;
-	int ret;
-
-	if (priv->legacy_api) {
-		ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL,
-				       &fmt_src);
-		if (ret) {
-			dev_err(priv->dev, "failed to get source format\n");
-			return ret;
-		}
-	} else {
-		fmt_src.format.code = MEDIA_BUS_FMT_UYVY8_2X8;
-		fmt_src.format.width = IMX_MEDIA_DEF_PIX_WIDTH;
-		fmt_src.format.height = IMX_MEDIA_DEF_PIX_HEIGHT;
-	}
+	struct v4l2_mbus_framefmt fmt_src = {
+		.code = MEDIA_BUS_FMT_UYVY8_2X8,
+		.width = IMX_MEDIA_DEF_PIX_WIDTH,
+		.height = IMX_MEDIA_DEF_PIX_HEIGHT,
+	};
 
-	imx_media_mbus_fmt_to_pix_fmt(&vdev->fmt, &fmt_src.format, NULL);
-	vdev->compose.width = fmt_src.format.width;
-	vdev->compose.height = fmt_src.format.height;
+	imx_media_mbus_fmt_to_pix_fmt(&vdev->fmt, &fmt_src, NULL);
+	vdev->compose.width = fmt_src.width;
+	vdev->compose.height = fmt_src.height;
 
 	vdev->cc = imx_media_find_pixel_format(vdev->fmt.pixelformat,
 					       PIXFMT_SEL_ANY);
-
-	return 0;
 }
 
 int imx_media_capture_device_register(struct imx_media_video_dev *vdev,
@@ -916,9 +767,7 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev,
 	vfd->v4l2_dev = v4l2_dev;
 
 	/* Initialize the default format and compose rectangle. */
-	ret = capture_init_format(priv);
-	if (ret < 0)
-		return ret;
+	capture_init_format(priv);
 
 	/* Register the video device. */
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
@@ -974,7 +823,6 @@ imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
 	priv->src_sd = src_sd;
 	priv->src_sd_pad = pad;
 	priv->dev = dev;
-	priv->legacy_api = legacy_api;
 
 	mutex_init(&priv->mutex);
 	INIT_LIST_HEAD(&priv->ready_q);
@@ -1031,24 +879,10 @@ imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
 		return ERR_PTR(ret);
 	}
 
-	if (legacy_api) {
-		/* Initialize the control handler. */
-		v4l2_ctrl_handler_init(&priv->ctrl_hdlr, 0);
-		vfd->ctrl_handler = &priv->ctrl_hdlr;
-	}
-
 	return &priv->vdev;
 }
 EXPORT_SYMBOL_GPL(imx_media_capture_device_init);
 
-void imx_media_capture_device_remove(struct imx_media_video_dev *vdev)
-{
-	struct capture_priv *priv = to_capture_priv(vdev);
-
-	v4l2_ctrl_handler_free(&priv->ctrl_hdlr);
-}
-EXPORT_SYMBOL_GPL(imx_media_capture_device_remove);
-
 MODULE_DESCRIPTION("i.MX5/6 v4l2 video capture interface driver");
 MODULE_AUTHOR("Steve Longerbeam <steve_longerbeam@mentor.com>");
 MODULE_LICENSE("GPL");
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 43c637b333f2..3a285fd10ac9 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1823,12 +1823,10 @@ static int csi_registered(struct v4l2_subdev *sd)
 
 	ret = imx_media_capture_device_register(priv->vdev, 0);
 	if (ret)
-		goto remove_vdev;
+		goto free_fim;
 
 	return 0;
 
-remove_vdev:
-	imx_media_capture_device_remove(priv->vdev);
 free_fim:
 	if (priv->fim)
 		imx_media_fim_free(priv->fim);
@@ -1842,7 +1840,6 @@ static void csi_unregistered(struct v4l2_subdev *sd)
 	struct csi_priv *priv = v4l2_get_subdevdata(sd);
 
 	imx_media_capture_device_unregister(priv->vdev);
-	imx_media_capture_device_remove(priv->vdev);
 
 	if (priv->fim)
 		imx_media_fim_free(priv->fim);
diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
index 0d0ee8627a2d..8a0ce7e394ae 100644
--- a/drivers/staging/media/imx/imx-media-dev-common.c
+++ b/drivers/staging/media/imx/imx-media-dev-common.c
@@ -6,7 +6,6 @@
  * Copyright (c) 2016 Mentor Graphics Inc.
  */
 
-#include <media/v4l2-ctrls.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mc.h>
@@ -189,116 +188,6 @@ int imx_media_probe_complete(struct v4l2_async_notifier *notifier)
 }
 EXPORT_SYMBOL_GPL(imx_media_probe_complete);
 
-/*
- * adds controls to a video device from an entity subdevice.
- * Continues upstream from the entity's sink pads.
- */
-static int imx_media_inherit_controls(struct imx_media_dev *imxmd,
-				      struct video_device *vfd,
-				      struct media_entity *entity)
-{
-	int i, ret = 0;
-
-	if (is_media_entity_v4l2_subdev(entity)) {
-		struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
-
-		dev_dbg(imxmd->md.dev,
-			"adding controls to %s from %s\n",
-			vfd->entity.name, sd->entity.name);
-
-		ret = v4l2_ctrl_add_handler(vfd->ctrl_handler,
-					    sd->ctrl_handler,
-					    NULL, true);
-		if (ret)
-			return ret;
-	}
-
-	/* move upstream */
-	for (i = 0; i < entity->num_pads; i++) {
-		struct media_pad *pad, *spad = &entity->pads[i];
-
-		if (!(spad->flags & MEDIA_PAD_FL_SINK))
-			continue;
-
-		pad = media_pad_remote_pad_first(spad);
-		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
-			continue;
-
-		ret = imx_media_inherit_controls(imxmd, vfd, pad->entity);
-		if (ret)
-			break;
-	}
-
-	return ret;
-}
-
-static int imx_media_link_notify(struct media_link *link, u32 flags,
-				 unsigned int notification)
-{
-	struct imx_media_dev *imxmd = container_of(link->graph_obj.mdev,
-						   struct imx_media_dev, md);
-	struct media_entity *source = link->source->entity;
-	struct imx_media_pad_vdev *pad_vdev;
-	struct list_head *pad_vdev_list;
-	struct video_device *vfd;
-	struct v4l2_subdev *sd;
-	int pad_idx, ret;
-
-	ret = v4l2_pipeline_link_notify(link, flags, notification);
-	if (ret)
-		return ret;
-
-	/* don't bother if source is not a subdev */
-	if (!is_media_entity_v4l2_subdev(source))
-		return 0;
-
-	sd = media_entity_to_v4l2_subdev(source);
-	pad_idx = link->source->index;
-
-	pad_vdev_list = to_pad_vdev_list(sd, pad_idx);
-	if (!pad_vdev_list) {
-		/* nothing to do if source sd has no pad vdev list */
-		return 0;
-	}
-
-	/*
-	 * Before disabling a link, reset controls for all video
-	 * devices reachable from this link.
-	 *
-	 * After enabling a link, refresh controls for all video
-	 * devices reachable from this link.
-	 */
-	if (notification == MEDIA_DEV_NOTIFY_PRE_LINK_CH &&
-	    !(flags & MEDIA_LNK_FL_ENABLED)) {
-		list_for_each_entry(pad_vdev, pad_vdev_list, list) {
-			vfd = pad_vdev->vdev->vfd;
-			if (!vfd->ctrl_handler)
-				continue;
-			dev_dbg(imxmd->md.dev,
-				"reset controls for %s\n",
-				vfd->entity.name);
-			v4l2_ctrl_handler_free(vfd->ctrl_handler);
-			v4l2_ctrl_handler_init(vfd->ctrl_handler, 0);
-		}
-	} else if (notification == MEDIA_DEV_NOTIFY_POST_LINK_CH &&
-		   (link->flags & MEDIA_LNK_FL_ENABLED)) {
-		list_for_each_entry(pad_vdev, pad_vdev_list, list) {
-			vfd = pad_vdev->vdev->vfd;
-			if (!vfd->ctrl_handler)
-				continue;
-			dev_dbg(imxmd->md.dev,
-				"refresh controls for %s\n",
-				vfd->entity.name);
-			ret = imx_media_inherit_controls(imxmd, vfd,
-							 &vfd->entity);
-			if (ret)
-				break;
-		}
-	}
-
-	return ret;
-}
-
 static void imx_media_notify(struct v4l2_subdev *sd, unsigned int notification,
 			     void *arg)
 {
@@ -326,7 +215,7 @@ static const struct v4l2_async_notifier_operations imx_media_notifier_ops = {
 };
 
 static const struct media_device_ops imx_media_md_ops = {
-	.link_notify = imx_media_link_notify,
+	.link_notify = v4l2_pipeline_link_notify,
 };
 
 struct imx_media_dev *imx_media_dev_init(struct device *dev,
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index 537558a7bece..832c9d292353 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -125,10 +125,8 @@ static inline struct imx_media_buffer *to_imx_media_vb(struct vb2_buffer *vb)
 }
 
 /*
- * to support control inheritance to video devices, this
- * retrieves a pad's list_head of video devices that can
- * be reached from the pad. Note that only the lists in
- * source pads get populated, sink pads have empty lists.
+ * Retrieve a pad's list of video devices reachable from the pad for
+ * subdev event forwarding. Only source pad lists are populated.
  */
 static inline struct list_head *
 to_pad_vdev_list(struct v4l2_subdev *sd, int pad_index)
@@ -271,7 +269,6 @@ int imx_media_ic_unregister(struct v4l2_subdev *sd);
 struct imx_media_video_dev *
 imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
 			      int pad, bool legacy_api);
-void imx_media_capture_device_remove(struct imx_media_video_dev *vdev);
 int imx_media_capture_device_register(struct imx_media_video_dev *vdev,
 				      u32 link_flags);
 void imx_media_capture_device_unregister(struct imx_media_video_dev *vdev);
-- 
2.53.0

