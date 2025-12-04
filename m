Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31A3398FAB
	for <linux-staging@lists.linux.dev>; Thu,  4 Dec 2025 23:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764890288; cv=none; b=TaYp6cWKp5dgVARaBa/rprfVCXtNKZjITBPfk1vnEIYrCKQFYrfoVnr/20dO8O5Cfl8rRQDI6L+obUQfwFaULfYoXI0cRKWCwaFDVv7n6k9J/9+hupqszie6PUZ0c8UBsp+6TqQsSt4vJDcWdpCObI/yfBgF+ybuslfyve5fVLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764890288; c=relaxed/simple;
	bh=vuBPTpEAuXyWcyMQDaP4RxcwNW++G9g8izMKoBAOQDA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tqSA0exuDM2MSTPK+KtEvwtIq7OSZrsKzngtrtj4g6OiV/e6CL0CGWgDzXuQto6EcaMD+zZJXcbwkluQEQAXsMGncMoBnY3zGvYZ5/jy9IHMEoUousQFX8IRK2utsJmHDJOpa8RHgBSdTl5GENEkJ90cHpJSvy1YuGKYnLRm63w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aePsBCEv; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aePsBCEv"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-340e525487eso1113150a91.3
        for <linux-staging@lists.linux.dev>; Thu, 04 Dec 2025 15:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764890286; x=1765495086; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AWEQlYDaUsxp7jmlyLpjxPDtRsxXkORcN5A8Xf/todk=;
        b=aePsBCEvVIeJrCkpiZUJ4J3PgSD0IPWLUME8iL0Cd99plf7aqteTZs6T2sREi33ovC
         12k9F/+T//q9ppl2pTEwLcObhiKEImFwD/4gV1BU4qSP2kwh+GPcxH397EPQCz796+ng
         5ZoNcmo6WNxFO9iDq3hTCywWtOzwq/rPxgUIWXty2G9/uCdxsC5/JY8SRIIMN+MtiOk4
         rXiIA9HM9wwa5DeYi3c442u5QteGdWSgkhghPasooXubz1SAHzzJyeA8CTu6lB7ULlZx
         Mn3K0nW7OkDxZy0GxLKnM1uYoynHkJeedDTupBHgETPoTUiPlulKJ9O9FeNaRW8UwQoL
         C6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764890286; x=1765495086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWEQlYDaUsxp7jmlyLpjxPDtRsxXkORcN5A8Xf/todk=;
        b=TLgLMxrCqZnmT8+EZMp/l0BSibAglX1f8SlJYgrk/6AVIZITKv99lB2smb+rB77JEO
         42vNzsfUX2RdOwjYKBck+4dYtR/8B+4qx3uPTg8XY/Y22afU+l8FADI8Lk2zQAgxOAFu
         CimlaC8CDwOpEJU1uD8JtXCDLuEoPmXy07jc1C4aNPlSF8sr0vqXKeOYL2nD9WKXghF4
         JlZwNHdRPRmvHJOKi02Nur/zKwpCK/1QXLqm6JZ5QKZvutga8I7A1HaEAnA6cKYWkluY
         wSexEpDH0Hg/g8+mXQzFUYkOUBZLr9xGpONz/3CXJYOz0cADOizRD4z9jrwl7Z8Zoj2s
         W3YA==
X-Forwarded-Encrypted: i=1; AJvYcCVhLfraouSVOi6V8uRL8ALGjSP578dnsMgukKO1T4Stln366LIqQKUdv+tKks55HKaMMopmRgPHyYKC1aCX@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8lmz1qreu7GYhcJmE4a3hJov0cNxNdYUlNGLgQuXxyon9Iooz
	fcBHYN70beYem5EfLsXEVNrVZAMMirrvbQ+CHMW7MctPf16kQRGqIKbk
X-Gm-Gg: ASbGncsl+IOYjFMy7oP6aq9mdzVsLMw//9w2Pri+ZzgT8SUKlsoMhD/yVTKE9pEzZg0
	FJFGmw754GGz1o0jhsI2DoPItDk/kPC3sJ8swf+BxYKDboiVvR5B/+QtdeUZwlyM04QcSZxs+Qr
	y4uE2hh2SPVDTsCCI/F+TLnA3elW3E66yMeNBmm1Djcz+Yfth67bfCAQGO3gFWm/oDa/2okksrV
	zAArRw/sS2ZyGsyb5ENB/pQIB/Umk6WK1MQKDbwNgI+hwvIVKrBkbVCI7Tfpu8D08Owrno88wAR
	gxx1MGltZS//ch2Ip/a9Q3Mv0PIBU9A0mwWR6XTAZ6vvQOTGAcQ9L+nwsA8dVeXXfVB3dQY8tJ+
	6ojVco6Lm0eXMz6JbVDTq9WYapa7wL9lkk6xRrwrMHpR2C/pY9MmEXo/sqCX8LnC+V9eKlBk388
	Ix9uYU0HrslK4J
X-Google-Smtp-Source: AGHT+IHxs1tQ1xeBAWh/tIWleP9GOEzT7NgHbhxODFuKWUB91u3R5HydNGSERen5RlQkjRsawkj7kQ==
X-Received: by 2002:a05:7022:23a4:b0:11a:962:99c2 with SMTP id a92af1059eb24-11df0cd9026mr6352423c88.38.1764890285862;
        Thu, 04 Dec 2025 15:18:05 -0800 (PST)
Received: from archlinux ([2804:1b2:9545:c615:2358:ef44:78a3:f69a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df749f8ddsm8406971c88.0.2025.12.04.15.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 15:18:05 -0800 (PST)
From: Julioccps <julio191096@gmail.com>
To: hvaibhav.linux@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Julioccps <julio191096@gmail.com>
Subject: [PATCH v4] staging: greybus: arche-apb-ctrl: switch to device_property_read_bool
Date: Thu,  4 Dec 2025 20:17:53 -0300
Message-ID: <20251204231753.66229-1-julio191096@gmail.com>
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

Changes in v4:
    -  Fixed a typo in the v3 commit

Changes in v3:
  - Added changelog history as requested by the maintainer bot.

Changes in v2:
  - Shortened the subject line to match subsystem standards.
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

