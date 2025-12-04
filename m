Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985D1260566
	for <linux-staging@lists.linux.dev>; Thu,  4 Dec 2025 23:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764889887; cv=none; b=MF0lwmZoK5GLL0gZ0AulaCdgWRqg42aSJoONeiMdP3kOc2tlwtALCQAZPaTJYX+uSs6GyF+WP2QJz05fgTGWIt5x1ZHboDBJi0Z0KT8V7oB34bPu2tzPbOgcFoSKDRg2MnIc0sB/e9FgHS69b27/OVwZSZ6eZ9ZgMb0MpL/RREk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764889887; c=relaxed/simple;
	bh=bFvuyYFVmH9syKJ4auimlQMoVSnOXpq5CEyPKV4xf0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E6yjLZn89Pf3MU8qGirtwcHU5z2lC+EKIuwAt26gAGxAjqdYJ+e3BQHg18RbsnMijSFuVcGNo1X2h9ZVp5R4A9S0ioyOabpL6aixp5C4c3jpHXWLe/s60rFUXTLQk3TBvKLGQtniUHjx4MKRDi7Mr6aTdSkbaZ3ylJOIF+oi7EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FIhnpH2x; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIhnpH2x"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-bc09b3d3afeso863114a12.0
        for <linux-staging@lists.linux.dev>; Thu, 04 Dec 2025 15:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764889885; x=1765494685; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xqy3wcsk4O+DQIbyxqEYo0Dly3qr2S6LsCBX00uMEIk=;
        b=FIhnpH2xoAZ0FHmFEFgcNjQsUVkEpC8g6RYy0jDFdLIOHVAFUaW9oIOHdZQqkNXwKs
         90wLqBpfHvYdLs418hcZ3RxckxzKKH5rf1GGhCpBtrEbAKFCgn2JdLVbQAhjlY+8OE3R
         EziX8SxU5i7s70A7nRQZP72DVmO8/XPpVFSTTQ2r2P10Hcha86G/LzW5b+CjYDLfp7RP
         KBoX95Fly08RsfafBdQxzBR9becKkqtVllcD1I2ZCCY82z3wXeErRhG/gPtzJk5g0dpS
         QPem2fcpjDxKnp8JskJ0cvWyDYTrm+2Y3vRsJyzBWs+SaPWLS1qakO/sUKZecEG6jxXW
         Wqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764889885; x=1765494685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqy3wcsk4O+DQIbyxqEYo0Dly3qr2S6LsCBX00uMEIk=;
        b=u1kqyjYldWh0SVIFJ11q0+fKYBCUv47284/iNobnM5q7CQog/8L0+4R3Nhcx/mg0RD
         +7HJcQfUrpZR/tO41eKc10+As76IVCjTO1fpzUUPIdLRPij3xPudwlZwRqdEnSfR46Rw
         Vq1LcdY9vwJD7TrhXaDRQWYBTg7+lW9DYVn3ugAWaIP509qphbHyze6kJXcV02cMn7LC
         eSFoJ2Zv5ETZmxRI2IZkA8RyxdjjaINnKnAqsgwMYe7rs06XrNSaBKjjIWvm/rZH4pRS
         d5WfkUCfxUi040/7Sb4UPoOpkNJFfK294Ma/SLnH8+2zniEHL8D5L0Jebn3oBRoMBbaa
         +D9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWv0ldR09geH/lfmD7kTWSDXLy1t90WoWMu+CFuva0FvKab5XAC1XVxnbc5/uBARatCy67UiPPmf833ixw7@lists.linux.dev
X-Gm-Message-State: AOJu0YxSkIILfZjG/Fv9KZ/UaH7QNcmzTOmvloqRu50gkRlzOcuwLiOH
	1Hf5fmKt75Q2wB54L44Nlo+T2w3JBw+MUlHmtApG+m6LmSyh+E0N5k6k
X-Gm-Gg: ASbGncu/3H5APGhdRaXhhKknEmGLgzxGvbl7aX+/BldAqzxPU1RhAp0en1/58vgos7Q
	doVWjffc/iBzm8FHSgvRLquWwyu61WnH5SbwMNmx4SYpn8DEEXxFm1fTG1AQx4+BRSeObw6W+lu
	ia5k1hREiSDjsmgPUyepL7g9hxoGTsVtRw0hWKpj6ubWMeChlLYbu6Gi8z749pSjv5uWNYz2fpw
	1tnx5oAPT2HOQdU9FLx0XlBR1wJHEN/AxxXf0s6BW6Vaobp9uCx6IvfEHatzgfwAShZZXHXop+1
	bDNOAAxvYOGScBT3ANDAPT5IAP1H3K9KdcLFDAyFzSwwX8gBaH3+ewMbW7+hcozC+XNvhQv9UEL
	I5qqbOaiunezn+nXS/KNUK7IuvUuCg44BAs8fIGbkifkCnuxbfuxxBW42xLNynijDA+ZmFs6gFv
	r4QE/4i/E2xazy
X-Google-Smtp-Source: AGHT+IGChwRhiuJpt1m7HWoo3n75LeO2jMMDnp2qXu4+IWXfmH04+yQWZYyW7q8gk/r2FK9JKF9qDg==
X-Received: by 2002:a05:7300:8b86:b0:2a4:3593:ddd8 with SMTP id 5a478bee46e88-2ab92d4fd2amr5006514eec.5.1764889884665;
        Thu, 04 Dec 2025 15:11:24 -0800 (PST)
Received: from archlinux ([2804:1b2:9545:c615:2358:ef44:78a3:f69a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba87aa5fcsm8000962eec.3.2025.12.04.15.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 15:11:24 -0800 (PST)
From: Julioccps <julio191096@gmail.com>
To: hvaibhav.linux@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Julioccps <julio191096@gmail.com>
Subject: [PATCH v3] staging: greybus: arche-apb-ctrl: switch to device_property_read_bool
Date: Thu,  4 Dec 2025 20:11:10 -0300
Message-ID: <20251204231110.65847-1-julio191096@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch from the deprecated of_property_read_bool() to the common
device_property_read_bool() API. This makes the driver agnostic to
the underlying firmware interface (DT or ACPI) and simplifies the
logic.

Since the driver is no longer strictly dependent on Device Tree,
include <linux/mod_devicetable.h> directly for the struct
of_device_id definition, instead of relying on implicit inclusion
via <linux/of_irq.h>, which has been removed as it is unused.

Also rename apb_ctrl_get_devtree_data() to apb_ctrl_get_fw_data()
to better reflect the agnostic nature of the new implementation.

Signed-off-by: Julio Cesar Carvalho de Paula Souza <julio191096@gmail.com>
---
hanges in v3:
  - Added version history (changelog) required by the subsystem maintainer.

Changes in v2:
  - Updated the subject line to match the subsystem standard.
  - Updated Signed-off-by to use full real name.

 drivers/staging/greybus/arche-apb-ctrl.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
index 90ab32638d3f..eea9648a461c 100644
--- a/drivers/staging/greybus/arche-apb-ctrl.c
+++ b/drivers/staging/greybus/arche-apb-ctrl.c
@@ -10,13 +10,14 @@
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
-#include <linux/of_irq.h>
 #include <linux/module.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
+#include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/spinlock.h>
+#include <linux/mod_devicetable.h>
 #include "arche_platform.h"
 
 static void apb_bootret_deassert(struct device *dev);
@@ -314,7 +315,7 @@ static ssize_t state_show(struct device *dev,
 
 static DEVICE_ATTR_RW(state);
 
-static int apb_ctrl_get_devtree_data(struct platform_device *pdev,
+static int apb_ctrl_get_fw_data(struct platform_device *pdev,
 				     struct arche_apb_ctrl_drvdata *apb)
 {
 	struct device *dev = &pdev->dev;
@@ -378,7 +379,7 @@ static int apb_ctrl_get_devtree_data(struct platform_device *pdev,
 	}
 
 	/* Only applicable for platform >= V2 */
-	if (of_property_read_bool(pdev->dev.of_node, "gb,spi-en-active-high"))
+	if (device_property_read_bool(&pdev->dev, "gb,spi-en-active-high"))
 		apb->spi_en_polarity_high = true;
 
 	return 0;
@@ -394,7 +395,7 @@ static int arche_apb_ctrl_probe(struct platform_device *pdev)
 	if (!apb)
 		return -ENOMEM;
 
-	ret = apb_ctrl_get_devtree_data(pdev, apb);
+	ret = apb_ctrl_get_fw_data(pdev, apb);
 	if (ret) {
 		dev_err(dev, "failed to get apb devicetree data %d\n", ret);
 		return ret;
@@ -403,7 +404,7 @@ static int arche_apb_ctrl_probe(struct platform_device *pdev)
 	/* Initially set APB to OFF state */
 	apb->state = ARCHE_PLATFORM_STATE_OFF;
 	/* Check whether device needs to be enabled on boot */
-	if (of_property_read_bool(pdev->dev.of_node, "arche,init-disable"))
+	if (device_property_read_bool(&pdev->dev, "arche,init-disable"))
 		apb->init_disabled = true;
 
 	platform_set_drvdata(pdev, apb);
-- 
2.52.0

