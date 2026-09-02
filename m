Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998404A8A13
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 14:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360864; cv=none; b=ogyNNtZsrLAHVfH3/ylVD82uy4kLBLTkVI6SDO9PC4S4X4YY4vry/1K3HkA83ggz7BdeNrXQt8WCvgYGl4Exikpegrwtc05bRonSPcTjWegOPAyW6mbsJQYW6c4WbUnbLparWphVBgZCRssZISqPaOKkLvzSq9cR7ub2osoU9bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360864; c=relaxed/simple;
	bh=7TpNIuEmLp+G5e+2SpK8ix5wNiH93X57SXsd3KUQO5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PiZaP5MD5qSaC8PjyhQ7mYhGygEOSyuVcRMdleZD+HMn7T39lRk++kYsUsKCEMrENLRJ4QOCHTcpzVEB04fs0EOhx37CfJrvtQP1D/GUw8f/Qd9VyIU6onzfXxtDdxoagYc8iLQCsyMzV+XylmwlG8f/nSYNJ6201n5VYS2YJEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTMn9DWf; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTMn9DWf"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4843e397f74so1369581f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 07:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360859; x=1788965659; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=06nDeaXmBzbafN8AxJnH0KVNHErvgEdljVUYQQyITT8=;
        b=GTMn9DWfdhPgMZMq6NTLzlv8HvgjrDLfLqRKqYFRubWBdZtIYuUy9L+YISwHwCYrmX
         yYCJNQ3tgxNrAu+OdVET+c+OjlvkRF+FnIAhuXElfKYk4kiTRzDE+BeVg5DUY0SDpEWW
         NGGr/Lp4G9kC9BbirLjkt21UMQaUn/itGGZ9XaretX/JTKwD/9YuaRrSkhz0xRM+2GEd
         sd6H+m5SGwiWo99Qx0rT/Ym8fM5Jdwb+cf0pRQ6Poq/Ztntc42Zsx6mNsCiKWdkV14tk
         wMe99+ipi3eqWNl/qRrB3hVOonn3Pd/QeT+2v35tF8kKmkyjg968j2EPYE1iokJZ+diA
         gi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360859; x=1788965659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=06nDeaXmBzbafN8AxJnH0KVNHErvgEdljVUYQQyITT8=;
        b=eZ5czWlD3FtD8CMoRo92AhbwH4o9R8Rv8vq/nB5EHGCpD1gcLEnUFNoEA2K4QfSOH1
         Qx7iUFz7qjBrV+qvX20UcS1x5RR91AnSknS1gQUUNO7macoAwd1k/c78d8zlHPBZIPlf
         fMdUEcGxLZsBLZptN+41CHCFy1WwFhKkPMb5HTXi1ijuG2IJvJNTuHnik5ICAXI1NsXX
         8xeiLIF6fXx9gdZ9oMZobmEqOduE+oLpyzmlpkCv9VUtuzaFGAl4NYPjh8ADbX+MkZ2m
         4SRuL5phR35j7dZkA8Voo4U1XaKb59x8x9uV/E4VHSprmsUdEY08JL31Sj9SFlnyW+NG
         poDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwT8BJ638MLSrA09Z/AZnneMVd26FkLBGu6qgyKO4qBii++eTEBP5iggwTf7BU6a//gxODhh8SaxluwoPXY@lists.linux.dev
X-Gm-Message-State: AFuF++nkuJScQ7IzMd+uaaMJAd0nHOXwJbFXpkFO28aWQXy0rLgFT7Iw
	t9fnnvgrlfFCmR4KB1XWOJe9cFOjHRrhQNgnaCy43KwyGTPQwpa89IYY
X-Gm-Gg: AYBFou1QqvR+dC9FZlsX2HeQaJAUzueLJy8WvEGW1XXaZQX0YxWdllWjjtHOkORBuwC
	f3aaRq0BCLSlxeVZCYZ1Oyb1Jc/HRy9OhF23Svg1+I+fcDe+CqwMcNuTGuVC8qnC610laW4/S3H
	lTxtiCI/5bkbdMdhkP2RXTAMIznZEbTjb4kaTxCpUQJzuuKG8IRq2M2PTrKrAr3XiEcB23KBw+O
	Uc74HlAGT+YL87pzuMor1naF3C/6Ifkly3O/uQRTJxLybeA327ASpphCfYJGPZjC2snm+MdlOWM
	A5EcU+xqwxNMu58PLl+Ao7Nb0KBdZlacrg0iEwcAWbD7GCUTBmkGNDTRzEYea+2eOeW5TYEdULM
	vzYD24dqpZ/IsTEoTqYkoUNHRr0lpSuapiA3QjvX18dee4gCWMU/FGhk+xIVWLOHCrMfHZpmsgr
	/tbuuWcsOeGBfK4ndYa/C+qN5HuonZP0HMepCPZi0sTr4H6bQc0uIUaSvIwXpPen1Da7+svzh4b
	RG8BQbfptD2MI7NZfFWbrGIxMY2+n0eaGqqse6sgNEC
X-Received: by 2002:a05:6000:4a03:b0:484:482d:dce4 with SMTP id ffacd0b85a97d-4856f8254d5mr7668524f8f.0.1788360859416;
        Wed, 02 Sep 2026 07:54:19 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:54:19 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 16/16] media: i2c: Add WV517S lens actuator driver
Date: Wed,  2 Sep 2026 16:53:45 +0200
Message-ID: <bbd81ef43dfb8ad92572cdfb51ab2781e9a4cd02.1788360629.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788360629.git.mauriziocasciano7@gmail.com>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91 rear camera contains a WV517S voice-coil
actuator. Add a V4L2 lens subdevice exposing the standard 10-bit
FOCUS_ABSOLUTE control and the device ringing-control mode.

Use regmap for register access and tie control updates to runtime PM so
the IPU bridge sensor link keeps shared power resources active. Propagate
PM acquisition failures and restore the drive mode and controls after
resume.

The register addresses and drive-mode value are derived from Intel's
GPL-2.0 WV517 driver. Retain the Intel copyright notice and document the
2026 copyright for this V4L2/regmap implementation.

Link: https://github.com/jekhor/yogabook-linux-android-kernel/blob/574bae692716f1b14093497bfab8a007fe8e460b/drivers/external_drivers/camera/drivers/media/i2c/wv517.c
Assisted-by: LLM sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 MAINTAINERS                |   1 +
 drivers/media/i2c/Kconfig  |  11 ++
 drivers/media/i2c/Makefile |   1 +
 drivers/media/i2c/wv517s.c | 206 +++++++++++++++++++++++++++++++++++++
 4 files changed, 219 insertions(+)
 create mode 100644 drivers/media/i2c/wv517s.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 55b3c2d7a78a..a4380be897e9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28555,6 +28555,7 @@ S:	Maintained
 F:	drivers/media/i2c/ak*
 F:	drivers/media/i2c/dw*
 F:	drivers/media/i2c/lm*
+F:	drivers/media/i2c/wv517s.c
 
 V4L2 CAMERA SENSOR DRIVERS
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 5c52007f9cbe..c5636e0cbecf 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -949,6 +949,17 @@ config VIDEO_DW9807_VCM
 	  capability. This is designed for linear control of
 	  voice coil motors, controlled via I2C serial interface.
 
+config VIDEO_WV517S
+	tristate "WV517S lens voice coil support"
+	select REGMAP_I2C
+	help
+	  This is a driver for the WV517S camera lens voice coil. The driver
+	  supports 10-bit focus control and exposes the actuator through the
+	  standard V4L2 lens sub-device interface.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called wv517s.
+
 endif
 
 menu "Flash devices"
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index d04bd5724552..e480932a9540 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -173,4 +173,5 @@ obj-$(CONFIG_VIDEO_VP27SMPX) += vp27smpx.o
 obj-$(CONFIG_VIDEO_VPX3220) += vpx3220.o
 obj-$(CONFIG_VIDEO_WM8739) += wm8739.o
 obj-$(CONFIG_VIDEO_WM8775) += wm8775.o
+obj-$(CONFIG_VIDEO_WV517S) += wv517s.o
 obj-$(CONFIG_VIDEO_INTEL_CVS) += cvs/
diff --git a/drivers/media/i2c/wv517s.c b/drivers/media/i2c/wv517s.c
new file mode 100644
index 000000000000..fa6c6d7524fb
--- /dev/null
+++ b/drivers/media/i2c/wv517s.c
@@ -0,0 +1,206 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * WV517S voice-coil motor driver
+ *
+ * Copyright (c) 2014 Intel Corporation.
+ * Copyright (C) 2026 Maurizio Casciano <mauriziocasciano7@gmail.com>
+ */
+
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+
+#define WV517S_MAX_FOCUS_POSITION	1023
+#define WV517S_DEFAULT_FOCUS_POSITION	300
+
+#define WV517S_REG_FOCUS		0x41
+#define WV517S_REG_DRIVE_MODE		0x43
+#define WV517S_DRIVE_MODE_12_6_MS	0x0211
+
+struct wv517s_device {
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct v4l2_subdev sd;
+	struct regmap *regmap;
+	bool resuming;
+};
+
+static inline struct wv517s_device *to_wv517s(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct wv517s_device, sd);
+}
+
+static const struct regmap_config wv517s_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 16,
+	.max_register = WV517S_REG_DRIVE_MODE,
+	.val_format_endian = REGMAP_ENDIAN_BIG,
+};
+
+static int wv517s_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct wv517s_device *wv517s =
+		container_of(ctrl->handler, struct wv517s_device, ctrl_handler);
+	struct device *dev = wv517s->sd.dev;
+	int pm_ret;
+	int ret;
+
+	if (ctrl->id != V4L2_CID_FOCUS_ABSOLUTE)
+		return -EINVAL;
+
+	/* Runtime resume restores controls while the PM state is RPM_RESUMING. */
+	pm_ret = pm_runtime_get_if_active(dev);
+	if (!pm_ret && !wv517s->resuming)
+		return 0;
+	if (pm_ret < 0)
+		return pm_ret;
+
+	ret = regmap_write(wv517s->regmap, WV517S_REG_FOCUS, ctrl->val);
+
+	if (pm_ret > 0)
+		pm_runtime_put(dev);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops wv517s_ctrl_ops = {
+	.s_ctrl = wv517s_set_ctrl,
+};
+
+static int wv517s_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	return pm_runtime_resume_and_get(sd->dev);
+}
+
+static int wv517s_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	pm_runtime_put(sd->dev);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_internal_ops wv517s_internal_ops = {
+	.open = wv517s_open,
+	.close = wv517s_close,
+};
+
+static const struct v4l2_subdev_ops wv517s_subdev_ops = { };
+
+static int wv517s_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct wv517s_device *wv517s = to_wv517s(sd);
+	int ret;
+
+	/* Restore the vendor-recommended 12.6 ms ringing-control mode. */
+	ret = regmap_write(wv517s->regmap, WV517S_REG_DRIVE_MODE,
+			   WV517S_DRIVE_MODE_12_6_MS);
+	if (ret)
+		return ret;
+
+	wv517s->resuming = true;
+	ret = v4l2_ctrl_handler_setup(&wv517s->ctrl_handler);
+	wv517s->resuming = false;
+
+	return ret;
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(wv517s_pm_ops, NULL, wv517s_resume, NULL);
+
+static int wv517s_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct wv517s_device *wv517s;
+	int ret;
+
+	wv517s = devm_kzalloc(dev, sizeof(*wv517s), GFP_KERNEL);
+	if (!wv517s)
+		return -ENOMEM;
+
+	wv517s->regmap = devm_regmap_init_i2c(client, &wv517s_regmap_config);
+	if (IS_ERR(wv517s->regmap))
+		return dev_err_probe(dev, PTR_ERR(wv517s->regmap),
+				     "failed to initialize regmap\n");
+
+	v4l2_i2c_subdev_init(&wv517s->sd, client, &wv517s_subdev_ops);
+	wv517s->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	wv517s->sd.internal_ops = &wv517s_internal_ops;
+	wv517s->sd.entity.function = MEDIA_ENT_F_LENS;
+
+	v4l2_ctrl_handler_init(&wv517s->ctrl_handler, 1);
+	v4l2_ctrl_new_std(&wv517s->ctrl_handler, &wv517s_ctrl_ops,
+			  V4L2_CID_FOCUS_ABSOLUTE, 0,
+			  WV517S_MAX_FOCUS_POSITION, 1,
+			  WV517S_DEFAULT_FOCUS_POSITION);
+	if (wv517s->ctrl_handler.error) {
+		ret = wv517s->ctrl_handler.error;
+		goto err_free_ctrl_handler;
+	}
+	wv517s->sd.ctrl_handler = &wv517s->ctrl_handler;
+
+	ret = media_entity_pads_init(&wv517s->sd.entity, 0, NULL);
+	if (ret)
+		goto err_free_ctrl_handler;
+
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
+	ret = wv517s_resume(dev);
+	if (ret)
+		goto err_disable_pm;
+
+	ret = v4l2_async_register_subdev(&wv517s->sd);
+	if (ret)
+		goto err_disable_pm;
+
+	pm_runtime_idle(dev);
+
+	return 0;
+
+err_disable_pm:
+	pm_runtime_disable(dev);
+	media_entity_cleanup(&wv517s->sd.entity);
+err_free_ctrl_handler:
+	v4l2_ctrl_handler_free(&wv517s->ctrl_handler);
+
+	return ret;
+}
+
+static void wv517s_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct wv517s_device *wv517s = to_wv517s(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	pm_runtime_disable(&client->dev);
+	v4l2_ctrl_handler_free(&wv517s->ctrl_handler);
+	media_entity_cleanup(&sd->entity);
+}
+
+static const struct i2c_device_id wv517s_id_table[] = {
+	{ .name = "wv517s" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, wv517s_id_table);
+
+static struct i2c_driver wv517s_i2c_driver = {
+	.driver = {
+		.name = "wv517s",
+		.pm = pm_ptr(&wv517s_pm_ops),
+	},
+	.probe = wv517s_probe,
+	.remove = wv517s_remove,
+	.id_table = wv517s_id_table,
+};
+module_i2c_driver(wv517s_i2c_driver);
+
+MODULE_AUTHOR("Maurizio Casciano <mauriziocasciano7@gmail.com>");
+MODULE_DESCRIPTION("WV517S VCM driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

