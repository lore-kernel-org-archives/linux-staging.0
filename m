Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267995;
	b=sG92/OQM0GE2Wf4sOafrgnbutZpyjaZXeHmDFVwfI1KK69fMaL63urLij9Nmg+W3GdA2
	 6gkCvElqu2Cc04DVnDjupQOQ1DYBk4XtKpzRLq7Kzh220j85hDMMXWz45vNcq7YHjN8NI
	 7qbYTm/AgL4YdwyAFg7WmDpzTBJ27ZOCkM62r97ypGJ7cMBOR+I5uNsO11lCCVbSzaFTf
	 R6Vr+mivIE2rN3FaN0iSVFsYzmRvVK9UxCtfRtKXb8BRJx8Bd3XHW1DYWODq3OjWK3r5A
	 1FJIKlJnAXZDqttNrXfqJrMJPgah4zAqu4C/59jZy1Ae0VbNuwYTbkxxQLzKplFCQEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vTsyG6CBV6GHsxoCcPyb4V/kZMTCzFbL0EIUb0hLao0=;
	b=MQdZU9oHtka6JSaeOuXrqEbc1XXKOWM+9jCC3Ax/ihMC+mjD7MUv3G15fc6jOsD+Zz+4
	 S6WycMhl3r59gskNJBBplT/7DEvLkRDQ1sUH882ADkMk1KFkLYr1JwlfBR4Rq8bN0qggh
	 ZQKs/oXR/a3wD8GU260qR7qvPJxwfDFuXYehXfNnXSlaWDmT28ChyDxgfDHgOFnOuz0M6
	 w9084SY99ceTxFeLAIuPgiWGCm76AbT4S5WCWUi0tD+QB7x0Avvpc6iGncIyF3ja3GnfF
	 7+6iVil6lrmgi85J/R+AGIi9WzgupBdpYDSsmR37f5gsI2CcyBVdJksnQSnka1/EEMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sPMo+5eE;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789D7606A33C
	for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 13:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 789D7606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sPMo+5eE
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so15154965e9.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 05:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267994; x=1795872794; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTsyG6CBV6GHsxoCcPyb4V/kZMTCzFbL0EIUb0hLao0=;
        b=sPMo+5eE+Lr7xHPQ0ne0vQWUwXfQpo6Xu/TA/eLBE3+cTdLWvCTAzTt3tiF+0lBaMs
         ysq/YiJGZBjJP9uBsOr+Jc+6Qjby+JHOI7owDZPTaZEVU4H+rs7gZkT/oCCpOcpkRWdD
         KuiLMQmMNech6g+D9h/aCFE6s3scXEqw0B0nN7R6Yev3NWV1DrvafvRaNfc7EWCfz1KC
         /Njk1NV1o2BpZ87eu1n7GFhG90Zdm9lcoJJVE+T4JYdgM1ck2PuIrZCFWC9q205PgAN9
         egleblzIVT/XK82Oz0HkMWqxRPghm0KhaQRhsRumAUPn42Q38ejNM5bhErcg6v4406Dv
         jgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267994; x=1795872794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vTsyG6CBV6GHsxoCcPyb4V/kZMTCzFbL0EIUb0hLao0=;
        b=Wo5FzwiH3dSQXxIThcUb9khLhmkBtwYg+zLtcp0h0/uYDe3ihjwXwS0DkRICjh4WjK
         +16l9SDVioPzva1ICn7rD18XTITzvW+BQFFT2NmKHD0K0Zb1Vxu2YXIVnwb5elmn99Gc
         95BsExh3Xo8XxuaN+7kZfFVndz40VZQqIyh5CoCOFk2sNSHImjvVw30jGMQXzgMj1oXp
         UHFxv2uJRwRKrkAZquHxYS9mpwcMbH5HpPC4IVGoUEGkVS9HRMrsHNEEjZTSx8RiwBMV
         pTXAa8SBEFP6zlbe4dktmkzH9hKtp67+aqTxH4oGh4L1VkC2FdEYLlQkS7BUS0lJTRxj
         KrVg==
X-Forwarded-Encrypted: i=1; AL+hErFdiRiYDwiCy9WO4nZdNA+h1JAENoP9njurnnlo1focWirPvTLWzopAxdckffDxuR3gW6qAYw1zdz68xXPz@lists.linux.dev
X-Gm-Message-State: APuU4Z/41lsWL3JFomXMaVkrDUHFI4QCZfzIYfXpDDbbKwR7lPlv4UTS
	+6qi7pEs9oyLw6cj3frKKRusWKn8eDRMYARBG9RWLYxEOVq3qAps0ISp
X-Gm-Gg: AZFdTZfAtQtSUVMVN9R/LABdiBzKVelxNvvsLcTOONac/p7zb14F+MVqojZvR3vx6Nk
	7NQMvLlpY7M81pLx64HuU8sTAhScP6iQsX+k+QzB2vrEmJIgonQrwoHD18kBYEa5btXRdicLwrD
	JbpjWTls9e82ohCluaWQkmsRd4bwjzRBXhbvorUvMh9FLWK/3sn+JL+KJjs4PIWGn07cNcDdBTW
	MspG1z+WWM+Pco3r0T+jOFn6c4A5sEvF+lzWYdOANFPuMgDV47Adm9PFp/Ca4izOmfCAIe4o4ul
	PHMu4QlfHGuCp2CKPvYTRAt/eFAQdNzWJn+MX/UFgknTk6EII2JvQp5SbmrTeB3+EP3gQGqwmIX
	smRGUPEIzOcY1n2pS9IKDTSRphI0fj+RoEQzJQvBuu4EeBbetBPU2jgb5qeAAsnB5RWt8HVcGL1
	KLnusPCnjv1hYkCcuZGvvM5tSsATZRylKtkdck/5qE+52bLqStQglT3NaEJoQ7xgE/Fk5idVRek
	or3A3x9+da+6Ou/l2SCHZyn2QNQ03HQ+VT425DGRqbzPvINMh2+yWG2hVx5x9rs/i76X7SfY9sZ
	Fh3qdoZO1Mn/3Q6XC0BSI1I4rc0r70JKslo5S7yVlFz6VskBa4WGrA0Dqgv1LPnYrTbZJwoIIiX
	R0ScUm736mXh6
X-Received: by 2002:a05:600c:4e0b:b0:4bb:6f45:2a79 with SMTP id 5b1f17b1804b1-4bb88817920mr154138415e9.22.1795267993545;
        Sat, 21 Nov 2026 05:33:13 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:33:13 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 13/14] media: i2c: Add WV517S lens actuator driver
Date: Sat, 21 Nov 2026 14:31:43 +0100
Message-ID: <2de582af71f93147e034bea2dddd0718b4f3a308.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795267528.git.mauriziocasciano7@gmail.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
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

The Lenovo Yoga Book YB1-X91 rear camera has a WV517S voice-coil
actuator. Add a V4L2 lens subdevice with a standard 10-bit
FOCUS_ABSOLUTE control. Set the ringing-control mode internally.

Defer register I/O until open or a focus request so runtime PM can
use the IPU bridge sensor link to power the actuator. Use regmap
and restore the last successfully written focus position on resume.
With PM disabled, initialize the device on first use.

Hold a reference for each V4L2 registration until final subdevice
release. Remove access to the hardware and balance the open runtime
PM reference before unregistering the device. This depends on
David Heidelberg's V4L2 core fix, which clears the devnode pointer
before invoking the subdevice release callback.

Retain the Intel copyright notice for the register addresses and
drive-mode value from the vendor WV517 driver. Sashiko identified
the runtime PM and lifetime issues. Codex drafted the follow-up.

Link: https://github.com/jekhor/yogabook-linux-android-kernel/blob/574bae692716f1b14093497bfab8a007fe8e460b/drivers/external_drivers/camera/drivers/media/i2c/wv517.c
Link: https://lore.kernel.org/r/20260917-v4l2-release-fix-v1-1-acbac7f9b78e@ixit.cz/
Link: https://linuxtv.org/mailman3/hyperkitty/list/media-ci@linuxtv.org/message/2PUHZIDBEIGQKGXTJJOUXXJS2EOEMJGD/
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 MAINTAINERS                |   1 +
 drivers/media/i2c/Kconfig  |  11 ++
 drivers/media/i2c/Makefile |   1 +
 drivers/media/i2c/wv517s.c | 320 +++++++++++++++++++++++++++++++++++++
 4 files changed, 333 insertions(+)
 create mode 100644 drivers/media/i2c/wv517s.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f72ce07a4..2491353d8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29324,6 +29324,7 @@ S:	Maintained
 F:	drivers/media/i2c/ak*
 F:	drivers/media/i2c/dw*
 F:	drivers/media/i2c/lm*
+F:	drivers/media/i2c/wv517s.c
 
 V4L2 CAMERA SENSOR DRIVERS
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 162b8ea02..e97ef7749 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1046,6 +1046,17 @@ config VIDEO_DW9807_VCM
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
index a750942e9..9a40d0dbc 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -181,4 +181,5 @@ obj-$(CONFIG_VIDEO_VP27SMPX) += vp27smpx.o
 obj-$(CONFIG_VIDEO_VPX3220) += vpx3220.o
 obj-$(CONFIG_VIDEO_WM8739) += wm8739.o
 obj-$(CONFIG_VIDEO_WM8775) += wm8775.o
+obj-$(CONFIG_VIDEO_WV517S) += wv517s.o
 obj-$(CONFIG_VIDEO_INTEL_CVS) += cvs/
diff --git a/drivers/media/i2c/wv517s.c b/drivers/media/i2c/wv517s.c
new file mode 100644
index 000000000..5f2da0a29
--- /dev/null
+++ b/drivers/media/i2c/wv517s.c
@@ -0,0 +1,320 @@
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
+#include <linux/kref.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
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
+enum wv517s_registration {
+	WV517S_UNBOUND,
+	WV517S_REGISTERED,
+	WV517S_RELEASE_PENDING,
+};
+
+struct wv517s_device {
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct v4l2_subdev sd;
+	struct regmap *regmap;
+	struct kref ref;
+	/* Serialize hardware access and open/close against driver removal. */
+	struct mutex lock;
+	enum wv517s_registration registration;
+	unsigned int users;
+	u16 focus;
+	bool initialized;
+	bool removed;
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
+static int wv517s_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct wv517s_device *wv517s = to_wv517s(sd);
+	int ret;
+
+	ret = regmap_write(wv517s->regmap, WV517S_REG_DRIVE_MODE,
+			   WV517S_DRIVE_MODE_12_6_MS);
+	if (ret)
+		return ret;
+
+	/*
+	 * Every update of focus holds a runtime PM reference. Do not acquire
+	 * the driver's mutex here: the caller may hold it while resuming.
+	 */
+	return regmap_write(wv517s->regmap, WV517S_REG_FOCUS,
+			    READ_ONCE(wv517s->focus));
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(wv517s_pm_ops, NULL, wv517s_resume, NULL);
+
+static int wv517s_power_get(struct wv517s_device *wv517s)
+{
+	struct device *dev = wv517s->sd.dev;
+	int ret;
+
+	if (IS_ENABLED(CONFIG_PM))
+		return pm_runtime_resume_and_get(dev);
+
+	if (wv517s->initialized)
+		return 0;
+
+	ret = wv517s_resume(dev);
+	if (!ret)
+		wv517s->initialized = true;
+
+	return ret;
+}
+
+static int wv517s_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct wv517s_device *wv517s =
+		container_of(ctrl->handler, struct wv517s_device, ctrl_handler);
+	int ret;
+
+	if (ctrl->id != V4L2_CID_FOCUS_ABSOLUTE)
+		return -EINVAL;
+
+	guard(mutex)(&wv517s->lock);
+	if (wv517s->removed)
+		return -ENODEV;
+
+	ret = wv517s_power_get(wv517s);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(wv517s->regmap, WV517S_REG_FOCUS, ctrl->val);
+	if (!ret)
+		WRITE_ONCE(wv517s->focus, ctrl->val);
+
+	pm_runtime_put(wv517s->sd.dev);
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops wv517s_ctrl_ops = {
+	.s_ctrl = wv517s_set_ctrl,
+};
+
+static void wv517s_free(struct kref *ref)
+{
+	struct wv517s_device *wv517s = container_of(ref, struct wv517s_device, ref);
+
+	v4l2_ctrl_handler_free(&wv517s->ctrl_handler);
+	media_entity_cleanup(&wv517s->sd.entity);
+	mutex_destroy(&wv517s->lock);
+	kfree(wv517s);
+}
+
+static int wv517s_registered(struct v4l2_subdev *sd)
+{
+	struct wv517s_device *wv517s = to_wv517s(sd);
+
+	guard(mutex)(&wv517s->lock);
+	if (wv517s->removed || wv517s->registration != WV517S_UNBOUND)
+		return -EBUSY;
+
+	kref_get(&wv517s->ref);
+	wv517s->registration = WV517S_REGISTERED;
+	return 0;
+}
+
+static void wv517s_unregistered(struct v4l2_subdev *sd)
+{
+	struct wv517s_device *wv517s = to_wv517s(sd);
+
+	guard(mutex)(&wv517s->lock);
+	wv517s->registration = WV517S_RELEASE_PENDING;
+}
+
+static void wv517s_release(struct v4l2_subdev *sd)
+{
+	struct wv517s_device *wv517s = to_wv517s(sd);
+
+	scoped_guard(mutex, &wv517s->lock) {
+		/* Node-registration rollback can run before unregistration. */
+		if (wv517s->registration != WV517S_RELEASE_PENDING)
+			return;
+
+		wv517s->registration = WV517S_UNBOUND;
+	}
+
+	kref_put(&wv517s->ref, wv517s_free);
+}
+
+static int wv517s_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	struct wv517s_device *wv517s = to_wv517s(sd);
+	int ret;
+
+	guard(mutex)(&wv517s->lock);
+	if (wv517s->removed || wv517s->registration != WV517S_REGISTERED)
+		return -ENODEV;
+
+	if (!wv517s->users) {
+		ret = wv517s_power_get(wv517s);
+		if (ret)
+			return ret;
+	}
+
+	wv517s->users++;
+	return 0;
+}
+
+static int wv517s_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	struct wv517s_device *wv517s = to_wv517s(sd);
+
+	guard(mutex)(&wv517s->lock);
+	if (!wv517s->removed && !--wv517s->users)
+		pm_runtime_put(sd->dev);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_internal_ops wv517s_internal_ops = {
+	.registered = wv517s_registered,
+	.unregistered = wv517s_unregistered,
+	.open = wv517s_open,
+	.close = wv517s_close,
+	.release = wv517s_release,
+};
+
+static const struct v4l2_subdev_ops wv517s_subdev_ops = { };
+
+static void wv517s_stop(struct wv517s_device *wv517s)
+{
+	struct device *dev = wv517s->sd.dev;
+
+	scoped_guard(mutex, &wv517s->lock) {
+		wv517s->removed = true;
+		if (wv517s->users)
+			pm_runtime_put_noidle(dev);
+	}
+
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+}
+
+static int wv517s_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct wv517s_device *wv517s;
+	int ret;
+
+	wv517s = kzalloc_obj(*wv517s);
+	if (!wv517s)
+		return -ENOMEM;
+
+	wv517s->regmap = devm_regmap_init_i2c(client, &wv517s_regmap_config);
+	if (IS_ERR(wv517s->regmap)) {
+		ret = dev_err_probe(dev, PTR_ERR(wv517s->regmap),
+				    "failed to initialize regmap\n");
+		kfree(wv517s);
+		return ret;
+	}
+
+	kref_init(&wv517s->ref);
+	mutex_init(&wv517s->lock);
+	wv517s->focus = WV517S_DEFAULT_FOCUS_POSITION;
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
+	/* Leave the actuator suspended until a consumer requests focus. */
+	pm_runtime_enable(dev);
+
+	ret = v4l2_async_register_subdev(&wv517s->sd);
+	if (ret) {
+		wv517s_stop(wv517s);
+		kref_put(&wv517s->ref, wv517s_free);
+		return ret;
+	}
+
+	return 0;
+
+err_free_ctrl_handler:
+	v4l2_ctrl_handler_free(&wv517s->ctrl_handler);
+	mutex_destroy(&wv517s->lock);
+	kfree(wv517s);
+	return ret;
+}
+
+static void wv517s_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct wv517s_device *wv517s = to_wv517s(sd);
+
+	wv517s_stop(wv517s);
+	v4l2_async_unregister_subdev(sd);
+	kref_put(&wv517s->ref, wv517s_free);
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


