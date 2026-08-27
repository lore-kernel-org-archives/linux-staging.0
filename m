Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4774DB568
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 18:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854709; cv=none; b=HDEEu+AkotjK+ggVa2rlPD6rVGffjpf5qoJKkScdbojYtDFq+Gbq5j9ZBBWSPCPafGGhEHWKWvlmJKv5OmrFUKsRD4j0tE31XVjHA/ZIk/Ft3nerN/iXbE8WoXmwCya2xJQJcDBS4Zhzdc1gHuimo0QOd0Z7vFSWPiP2V8CjDjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854709; c=relaxed/simple;
	bh=LFCRKjervLVX9EGGqaNjNl+m0rlZR6NsJDlFIzG0EAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ncWuXwFQI8DWDY1ujs/9rvQYWRT2+EJf5P8JGF1kXjTi4Cgs8ScCAxemI9x+VLWncuQfJy/26XDSD2vVibtxf/lJ7C99bqaYYtW/Qp0R2itNmAKIIbClQ7NuNYe9tgMTGUSeX/E7gnI+RdLsb4VHOa6am0ojgUZHZeID1F56e8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJxaUepA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJxaUepA"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49954b88fffso342055e9.0
        for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 11:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854706; x=1788459506; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZPDHV0axtte8ociQQpFpf2qJ4hiAvGZjDsg76zUsBfA=;
        b=iJxaUepAYjrBCwKuFoOynO2fqJ/tdefgktdTM5mchOZWdf+t7/pox7N49uypdS4yg5
         j/lx441QLF7eop6rohYLdEc1uuR4aeWXcWQW9UOCzeGw9HRS19NAsAGtyc8kXDTl9ae3
         jGCdMliTX59lzSSWfkRPje0bdLdHmeQeZGhHhqg+BUVj2M2OcHRdimhp0NWO+0kOUMDp
         ix/QcL9kielx2aMLXp8KIJJHEWe7hhhN+PtjIvFJxkyuM1UTgAQFxSu32PaEIvMOb3gH
         +l5MtmWehEzFpw2lmv9Fkywrlp3Qo8ylJQ79JJ3rzKd3AwMUdx4UJEKVZKxiZcY6gMXy
         FWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854706; x=1788459506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZPDHV0axtte8ociQQpFpf2qJ4hiAvGZjDsg76zUsBfA=;
        b=U/yxLI38Fs5osdFCF1qdn9igeBWzP+kCE4ipBYpiU6bcvDUNtpyg1GCrojTtwFASud
         e+G1wiW56EeSKDoyiCQQca34kKdfAIYt0jXf3rsNZQof81pLbG3Gi72669ZunDK69nLs
         1fnrrULRoFC83AAwYCNStNS5uE+5m/CcsgTjEEEVsShU0TPtsaiUFL7tDGVCVco3spQK
         miEr89F7uOEsca84HtgL8wvL7ouTeYMYJ3J/QhBlBr+FXj+xc4/Sk0M2qWhHvGsiJmab
         gLkzEAzSF+4yOO5AFBu2z2LT6Cnt4LTCtgeToBtHRtC1qQI/emsOjw6kt33PkUvwoIc3
         9c2Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrr81T+c+XK0yVQdMdz27FKE5rHr65464taupSr5pHDW7DM+4ED2bd5fXoFWfpnSo0r4YNhoj4Ywen4vGcp@lists.linux.dev
X-Gm-Message-State: AFuF++kb3Cs/HMX7jUxKq3GEz0cEx+xWM6WdB0vT4EyLODrIh99J6akW
	F+3SPf60DF1P+V61mczuvsrmRllrEdKqObQAsSga++1LCNkVUwzj7EJd
X-Gm-Gg: AR+sD11FIwoRcIZjTxwJJoZ0QTApPj2LfKcTy5p5dgkt/zF4AWtH9VT/9cQRkI9WEEb
	UVk9P94CSa5Il2C4MgqpqY6+rYS70K90XCHlSEvOz4ECmL7DSRaaLaE7fDEG4l57se9nssouDDa
	iduCoVWePgywi3FKW3oSztDb0csgftVTW305lPyVbAo0gARlAFKQpozt5Q+XFRIM4XNlpWCLbiP
	SJubRv2q9egYz7H38QmTATA3OyskhKSPYX/7sXCyuToZFfRkz7pqTPnStVg1XDd+GIjtk7XsLAV
	h4zH25hW6EsMfcCR9eiYYshHVBVQsM278LF24SKsvH8NevNl1kqmFeyxQYr7B5EiFq+3VhPbUdB
	CaC4cCEOrJGrGtB8ngFf3MaPEhMUgbHMOD8ytEeP0at2THbLxn1sVwyJJ3jIEhseWHAIZ8S0P8+
	XYdg0bOgPKkoK57jPfg3hpQP4h+GOytpKowlLOEH67eQX9OgEXHQy/6voW+VNZUfn8xNo1ur2YF
	dA4YF6eL4H13c+44peK0KuEUxe0EfxG+cbn7x+a7x6Y
X-Received: by 2002:a05:600c:3155:b0:49b:910c:7703 with SMTP id 5b1f17b1804b1-49b91c3dcb4mr12368255e9.9.1787854705384;
        Thu, 27 Aug 2026 11:18:25 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm66270655e9.4.2026.08.27.11.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:18:24 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 11/11] media: i2c: Add WV517S lens actuator driver
Date: Thu, 27 Aug 2026 20:17:56 +0200
Message-ID: <20260827181756.2430054-12-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
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
Assisted-by: Codex:gpt-5.6-sol sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 MAINTAINERS                |   1 +
 drivers/media/i2c/Kconfig  |  11 ++
 drivers/media/i2c/Makefile |   1 +
 drivers/media/i2c/wv517s.c | 204 +++++++++++++++++++++++++++++++++++++
 4 files changed, 217 insertions(+)
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
index 000000000000..2b45a09ce879
--- /dev/null
+++ b/drivers/media/i2c/wv517s.c
@@ -0,0 +1,204 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * WV517S voice-coil motor driver
+ *
+ * Copyright (c) 2014 Intel Corporation.
+ * Copyright (C) 2026 Maurizio Casciano <mauriziocasciano7@gmail.com>
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
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
+	struct wv517s_device *wv517s = container_of(ctrl->handler,
+						      struct wv517s_device,
+						      ctrl_handler);
+	struct device *dev = wv517s->sd.dev;
+	int pm_ret;
+	int ret;
+
+	/* Runtime resume restores controls while the PM state is RPM_RESUMING. */
+	pm_ret = pm_runtime_get_if_active(dev);
+	if (!pm_ret && !wv517s->resuming)
+		return 0;
+	if (pm_ret < 0)
+		return pm_ret;
+
+	if (ctrl->id == V4L2_CID_FOCUS_ABSOLUTE)
+		ret = regmap_write(wv517s->regmap, WV517S_REG_FOCUS,
+				   ctrl->val);
+	else
+		ret = -EINVAL;
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
+static int wv517s_probe(struct i2c_client *client)
+{
+	struct wv517s_device *wv517s;
+	int ret;
+
+	wv517s = devm_kzalloc(&client->dev, sizeof(*wv517s), GFP_KERNEL);
+	if (!wv517s)
+		return -ENOMEM;
+
+	wv517s->regmap = devm_regmap_init_i2c(client, &wv517s_regmap_config);
+	if (IS_ERR(wv517s->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(wv517s->regmap),
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
+	pm_runtime_set_active(&client->dev);
+	pm_runtime_enable(&client->dev);
+
+	ret = wv517s_resume(&client->dev);
+	if (ret)
+		goto err_disable_pm;
+
+	ret = v4l2_async_register_subdev(&wv517s->sd);
+	if (ret)
+		goto err_disable_pm;
+
+	pm_runtime_idle(&client->dev);
+
+	return 0;
+
+err_disable_pm:
+	pm_runtime_disable(&client->dev);
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
+	{ "wv517s" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, wv517s_id_table);
+
+static DEFINE_RUNTIME_DEV_PM_OPS(wv517s_pm_ops, NULL, wv517s_resume, NULL);
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

