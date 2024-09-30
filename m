Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DEA18EFF1
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 12:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697851; cv=none; b=qwkCtRh10mVsJw/1rGPmKF/xwnhuxtPaSBe3J7clQXNgP68LyEP7UJNs8kR+OfthM3croSsxJPZIvNNsDlVpjMkLJaShEx7+tPKQkxrVAADVtw/AnHS5205mL9axubvtmlWAR0ny0UFX0pAVi+aOzWE8AQ9QYjo5OqnOETElRHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697851; c=relaxed/simple;
	bh=JRVPAXt8pgkLV9kf8+kVySmbvl1AqLOgaMkZBH8WTjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RMICrFuraMd99tXa3tLl9SpxE0roBgYRirypviDIK9/feTBNoILATnksPcxK0fA/oBqMda/s4MvQxYloFymAKP7PiC9eEZlSYV6WuZkrKIJsV4epbIymIAxUDU1I9RPpK0Y4L7PyDNFgbcDZluGnKLynxt1cu4KFeoFthPnNR3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DWs8xvLm; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DWs8xvLm"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4581ec0e00eso34629991cf.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 05:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697849; x=1728302649; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4cqERgoR9OlhV9bZcAYTWgDv58ZKeW9/q+4TIB0lCLc=;
        b=DWs8xvLmWh/dIxNX98UGLJ5+tvpzRYntdC8I1sjznbJgTwD3GbY7NV7Z7v5Wd4L6Dx
         DZEjkukABMyxtM1EzfGvM1PEcujGH7+GKEg2FkO7RiyZ6J/qXPYODSSaUtmG0M5GYABC
         uNur+YGwyttN7nKMvxsUKrMqHHCfwLw/QN/K4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697849; x=1728302649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cqERgoR9OlhV9bZcAYTWgDv58ZKeW9/q+4TIB0lCLc=;
        b=V4CQeSOijDSjsVJAp/ODf734iEmI4g6fOKsTFhez4lXUFT+N0OrkkPQp1Ja8/wbDzC
         yuEmUOMpZ+Oeg2cGy0KzraRgt4XNMfCjiIzieSu2sY1iFSOR7vDZn+BAfzrejKthlcp/
         vma4kKtnfbf3n7XpmJrqeTZJEZzmo5J1nnLVTyxJ9kV7JfOO1JydSEd1cMT3nGG5iBBJ
         Y4Y8iNih24iOLjWO+21iIsvehoPwVigK1hkIxVUcu+0nmam3A4qv+Bree6fzWCfCsvh9
         pd/DaADAGmjweG7bL+rNgzsMMtPhu9IN607Bz2Wn/sXQMeYAE5EPTrqWbdtR1WtACQ2w
         OrPg==
X-Forwarded-Encrypted: i=1; AJvYcCVveCMchmtbAUB1OmqoixATWBt9Bhux8JCoWFw228GBuu5/Y0OU4SdhaqhpSf/VV6rpXJrH5ylUxd/2meAS@lists.linux.dev
X-Gm-Message-State: AOJu0YylLbL7lZzRX/77jbG5Lc5Xqa+ztxU2m9imgveL4R51d6ms/qq4
	4R2V2AmGpNek91nWe5atMtmJXvqH5aHGRkaE+hYsYlJ5uju8VH4FZJBJ9PcY/Q==
X-Google-Smtp-Source: AGHT+IGdCSwCLQh27OqCiMv81An8yCyEXTlCQao91e2evQ6yJY9lhvUOeYdfvxJFC6O2qm9bRDYGaQ==
X-Received: by 2002:a05:6214:5247:b0:6c5:166e:566c with SMTP id 6a1803df08f44-6cb3b5f06c1mr193464746d6.28.1727697848951;
        Mon, 30 Sep 2024 05:04:08 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:07 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:03:58 +0000
Subject: [PATCH 03/45] media: core: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-3-81e137456ce0@chromium.org>
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
In-Reply-To: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Mike Isely <isely@pobox.com>, 
 Olli Salonen <olli.salonen@iki.fi>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young <sean@mess.org>, 
 Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
 Jemma Denson <jdenson@gmail.com>, 
 Patrick Boettcher <patrick.boettcher@posteo.de>, 
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
 Andy Walls <awalls@md.metrocast.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Tim Harvey <tharvey@gateworks.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, openbmc@lists.ozlabs.org, 
 linux-aspeed@lists.ozlabs.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The following cocci warnings are fixed:
drivers/media/v4l2-core/v4l2-fwnode.c:282:32-33: opportunity for str_high_low(v)
drivers/media/v4l2-core/v4l2-fwnode.c:290:32-33: opportunity for str_high_low(v)
drivers/media/v4l2-core/v4l2-fwnode.c:298:37-38: opportunity for str_high_low(v)
drivers/media/v4l2-core/v4l2-fwnode.c:329:31-32: opportunity for str_high_low(v)
drivers/media/v4l2-core/v4l2-fwnode.c:356:40-41: opportunity for str_high_low(v)
drivers/media/v4l2-core/v4l2-fwnode.c:364:38-39: opportunity for str_high_low(v)
drivers/media/v4l2-core/v4l2-ctrls-core.c:272:16-26: opportunity for str_true_false(* ptr . p_s32)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c |  3 ++-
 drivers/media/v4l2-core/v4l2-fwnode.c     | 12 ++++++------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index eeab6a5eb7ba..f303c70dffae 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -8,6 +8,7 @@
 #include <linux/export.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
@@ -269,7 +270,7 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 		pr_cont("%d", *ptr.p_s32);
 		break;
 	case V4L2_CTRL_TYPE_BOOLEAN:
-		pr_cont("%s", *ptr.p_s32 ? "true" : "false");
+		pr_cont("%s", str_true_false(*ptr.p_s32));
 		break;
 	case V4L2_CTRL_TYPE_MENU:
 		pr_cont("%s", ctrl->qmenu[*ptr.p_s32]);
diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index f19c8adf2c61..92dc17179018 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -279,7 +279,7 @@ v4l2_fwnode_endpoint_parse_parallel_bus(struct fwnode_handle *fwnode,
 			   V4L2_MBUS_HSYNC_ACTIVE_LOW);
 		flags |= v ? V4L2_MBUS_HSYNC_ACTIVE_HIGH :
 			V4L2_MBUS_HSYNC_ACTIVE_LOW;
-		pr_debug("hsync-active %s\n", v ? "high" : "low");
+		pr_debug("hsync-active %s\n", str_high_low(v));
 	}
 
 	if (!fwnode_property_read_u32(fwnode, "vsync-active", &v)) {
@@ -287,7 +287,7 @@ v4l2_fwnode_endpoint_parse_parallel_bus(struct fwnode_handle *fwnode,
 			   V4L2_MBUS_VSYNC_ACTIVE_LOW);
 		flags |= v ? V4L2_MBUS_VSYNC_ACTIVE_HIGH :
 			V4L2_MBUS_VSYNC_ACTIVE_LOW;
-		pr_debug("vsync-active %s\n", v ? "high" : "low");
+		pr_debug("vsync-active %s\n", str_high_low(v));
 	}
 
 	if (!fwnode_property_read_u32(fwnode, "field-even-active", &v)) {
@@ -295,7 +295,7 @@ v4l2_fwnode_endpoint_parse_parallel_bus(struct fwnode_handle *fwnode,
 			   V4L2_MBUS_FIELD_EVEN_LOW);
 		flags |= v ? V4L2_MBUS_FIELD_EVEN_HIGH :
 			V4L2_MBUS_FIELD_EVEN_LOW;
-		pr_debug("field-even-active %s\n", v ? "high" : "low");
+		pr_debug("field-even-active %s\n", str_high_low(v));
 	}
 
 	if (!fwnode_property_read_u32(fwnode, "pclk-sample", &v)) {
@@ -326,7 +326,7 @@ v4l2_fwnode_endpoint_parse_parallel_bus(struct fwnode_handle *fwnode,
 			   V4L2_MBUS_DATA_ACTIVE_LOW);
 		flags |= v ? V4L2_MBUS_DATA_ACTIVE_HIGH :
 			V4L2_MBUS_DATA_ACTIVE_LOW;
-		pr_debug("data-active %s\n", v ? "high" : "low");
+		pr_debug("data-active %s\n", str_high_low(v));
 	}
 
 	if (fwnode_property_present(fwnode, "slave-mode")) {
@@ -353,7 +353,7 @@ v4l2_fwnode_endpoint_parse_parallel_bus(struct fwnode_handle *fwnode,
 			   V4L2_MBUS_VIDEO_SOG_ACTIVE_LOW);
 		flags |= v ? V4L2_MBUS_VIDEO_SOG_ACTIVE_HIGH :
 			V4L2_MBUS_VIDEO_SOG_ACTIVE_LOW;
-		pr_debug("sync-on-green-active %s\n", v ? "high" : "low");
+		pr_debug("sync-on-green-active %s\n", str_high_low(v));
 	}
 
 	if (!fwnode_property_read_u32(fwnode, "data-enable-active", &v)) {
@@ -361,7 +361,7 @@ v4l2_fwnode_endpoint_parse_parallel_bus(struct fwnode_handle *fwnode,
 			   V4L2_MBUS_DATA_ENABLE_LOW);
 		flags |= v ? V4L2_MBUS_DATA_ENABLE_HIGH :
 			V4L2_MBUS_DATA_ENABLE_LOW;
-		pr_debug("data-enable-active %s\n", v ? "high" : "low");
+		pr_debug("data-enable-active %s\n", str_high_low(v));
 	}
 
 	switch (bus_type) {

-- 
2.46.1.824.gd892dcdcdd-goog

