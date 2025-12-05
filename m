Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9BD27A91D
	for <linux-staging@lists.linux.dev>; Fri,  5 Dec 2025 11:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764932783; cv=none; b=R4R+7S1VcgVcVyBZ8YoNpmN1PNrwpSBcRb/foOenmuB8CvaFMlejA+9w3r7+j2l+dMaOF/HGR+4M/OSQFNPkKZ3ZD9tNggKMi9hsHusyYVY3JrEWikTnjE9cZNZhqbbcUjVRAPJsgIQ8uBhNvVj9e1pbXiY63fKQwimJnks0lgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764932783; c=relaxed/simple;
	bh=VYSDlK+wO3E5LHx9wHLxp5XNwDhXtCkLn4TZNQfl3Mk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iy1nyDmGIWNOvZqu7GLU956DbyCLouoRIwoYsVrPU4z129ulczE6E+TBslH/xTtYNOPtFiTP4P+Ys6zMhRgXAU5eWwTyvco6wpALdcXFNnMzvIznF9dVbb0DxuKuTq0Cd7e4BVuiEDJSLJv6FxYuqbGTVaCVGXCh9rp4DrueYrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NK7t+h7X; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NK7t+h7X"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5599688d574so618270e0c.2
        for <linux-staging@lists.linux.dev>; Fri, 05 Dec 2025 03:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764932780; x=1765537580; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KZhvelUTNVQjpCwZjkIiRYWFFb4bmI4pkoHsXqQN7X4=;
        b=NK7t+h7X32oaoSFV5A1U3qXb/A4Fe0Q2r9RhN8ZLqLRXLrjNzPOGYIzVDJ5aRfaI1q
         GLPwN+lezo9iyMPp5U0kQ+zXJgpZoACXl9CjysUcKos0GVPm68Oieu4kYJ+cn+rB0ilX
         YuOvQF2M9vgkMEmcJTkM+h0zsAPuz+N41CrDY5BqgFFN9+qWVsJPzwWAFuAJbzR0JiT5
         4twiKHxft7BkbCewKfhhhU8NdAlTdtco2q+vcLCqUZVOOotC1sUeoorwnkNvs3RKlLHq
         2WDnzq5Y3JXCXPhr0ft47ATYhYsKH99GbFDEtmELotRyvE7EPQXn0ERi1Ic/YoLx4ms7
         eVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764932780; x=1765537580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZhvelUTNVQjpCwZjkIiRYWFFb4bmI4pkoHsXqQN7X4=;
        b=jm3edMfBgMjzHEnRBtRjR4RwnbHrfO8E1cEfQfSxem6mNfuVQs/sEp+Ke/wH22XbJE
         /apBdXwrcVujNCfwGM6EfM3xuwUP5/wYgB9E3y2JCjJqasUCnpQ7h8lDBdLK8kXQDoFK
         qr5orgWOJ+ieZPr8rZBvT+A6GZ14MbtWBLbOZSo6bTrCjAHbipeyvVdO2+1v5JjYWd4N
         VMj/VJvY0b9r3u0TqYXzcYbUAZbWGhpway9EXhdjZWaeI9LISaigRMuO7PApUhAi+Z4m
         88Ht0friSRi1N73tf1IWkKR8Ghk5R6m4ZVKGyBHLqMFL98HMd/XefWw/7B5K/KzYfYbE
         1WNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBO3okLQJFNtu6KZKcB/k/6TFXVXGifH4zgZ44rtymLDUBFPBSxDsIJuXA5CTdomOQXBYs5uB2RPEX1mcf@lists.linux.dev
X-Gm-Message-State: AOJu0YwjGOPgGfOTraH51FvY9vwrDuYJWfzVSdErZVyhjKEw6lLfmUYQ
	lxYV35GYFr51PWm9HZEah0NH295/ZgKmpL0+TCR4NlvalXmoWHsxDHyo
X-Gm-Gg: ASbGncu14IavVo5Iehpz8tyUTNbERp+f003jTDTrIeZe28W+isvQn3NLzZ7ZFmkEM7/
	Wgtmx/yyG8zE86In1hsBlIeBs3Cu3brz4+8S5554CfTKNfNW2Ubev7wWLULTTMurT6I30/Y8sxw
	SkdCialFHw7HOoyUiw/WAliWNzBJKIYv/FUJKDHyWPx58hdERYDJyyD8B/CMCLj9lr0mii/11Ai
	u8DBjBNx0oRHcECg9YfjxiyRmQT29mxImAA5uB+Xe0fAAg2lKERBomH+/eKK7z4Z7xKkfEeXG3K
	hxWbV6ry/aOb8eDSBLVD4ULbvl8bGlNWdw6NUjfFx6b4ka4tneYA09MlufCEhc/4mxDgJWU6EIZ
	r7X9Li8rz6T1LcCKIhsX2SatA89nA33adxuDTLgqF9b/hb4MqTrNiZk8Pd8jyZR4/Zf5DOA/KF9
	zHnN7MTZ2CY8jcTeYxPwWHrkc=
X-Google-Smtp-Source: AGHT+IEkt8HW36gyLR1l2wdTY0ESpus9ypRrB4cqHbD2NMCLXH7kTrxq5PT359t4Ljci47BAN9TkQA==
X-Received: by 2002:a05:6122:660d:b0:55b:305b:4e3d with SMTP id 71dfb90a1353d-55e5c043be0mr3726432e0c.19.1764932779670;
        Fri, 05 Dec 2025 03:06:19 -0800 (PST)
Received: from archlinux ([2804:1b2:9545:c615:2358:ef44:78a3:f69a])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93f01d022a4sm245598241.3.2025.12.05.03.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 03:06:19 -0800 (PST)
From: Julio Cesar Carvalho de Paula Souza <julio191096@gmail.com>
To: hvaibhav.linux@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Julio Cesar Carvalho de Paula Souza <julio191096@gmail.com>
Subject: [PATCH v5] staging: greybus: arche-apb-ctrl: switch to device_property_read_bool
Date: Fri,  5 Dec 2025 08:06:07 -0300
Message-ID: <20251205110607.2438-1-julio191096@gmail.com>
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

Changes in v5:
    - Fixed 'From' header mismatch(updated git config user.name)
    - Fixed indentation aligment in function declaration as pointed out
    by Dan Carpenter

Changes in v4:
    -  Fixed a typo in the v3 commit

Changes in v3:
  - Added changelog history as requested by the maintainer bot.

Changes in v2:
  - Shortened the subject line to match subsystem standards.
  - Updated Signed-off-by to use full real name.
 drivers/staging/greybus/arche-apb-ctrl.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
index 90ab32638d3f..6a4efa9a9e0e 100644
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
@@ -314,8 +315,8 @@ static ssize_t state_show(struct device *dev,
 
 static DEVICE_ATTR_RW(state);
 
-static int apb_ctrl_get_devtree_data(struct platform_device *pdev,
-				     struct arche_apb_ctrl_drvdata *apb)
+static int apb_ctrl_get_fw_data(struct platform_device *pdev,
+			        struct arche_apb_ctrl_drvdata *apb)
 {
 	struct device *dev = &pdev->dev;
 	int ret;
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

