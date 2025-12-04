Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB63B29C321
	for <linux-staging@lists.linux.dev>; Thu,  4 Dec 2025 16:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764865761; cv=none; b=ZENExkdN2DeF6K72bPrVjoQc+j0BBdtk9MzyxLI3zKG2vlyTBb08h1EsX5hsAO2MTnu/zF0ciF2hcuBBAON6daWI4KXd1kzXDkk7klhUd2KZ9pye8hjbfgNoqSZZmOxrEdynOoSidGRrsW8u3605EcONLz6S5KowU41bQYOMzJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764865761; c=relaxed/simple;
	bh=JmW6IfkNs6IQgXkkoQY6XBDJbkEtq06TJWwGCWOYDs4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aM4kYmkC+4+2aJuXew4oPDA+HW0GiT359wyO+DCU7sRGRfSQNs3sStPuZWx1AtoG3t6XqrcHxMe3vR8FwaXPMDL3yonoO5XZWH8xCXrqvMyhIQi1rh7LCFK9QeUPXyCNCGYv10bISbpxeLVctu+Xt3O264VYR3XYKdlbiMsMXaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cyeuw0jX; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cyeuw0jX"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29806bd47b5so7061425ad.3
        for <linux-staging@lists.linux.dev>; Thu, 04 Dec 2025 08:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764865758; x=1765470558; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p2EOKJaJr5DVsyfexp+IIbTVfdVI8+rHJ5+Gsh6Mpxw=;
        b=Cyeuw0jXCwTYPFJ/vxKRp4b06IdQxt5MA3fnA17e7km8dtawolmMcj6/AywNYq497B
         knSF9EYHzWQSSbchmO9QQcqAkEp3gGNpvUCTDb9NXSPS8uCgEmv9pMzctxQLMdZPFaZX
         NDS373cbHsCk6nYPktNJ3cD8hwMGbDaGSxjazb0/0C04rrYqQiDynIpH9z4k9jGy2T+C
         o/DFGYw3+T9niRDag1wSIXTHcmNQN3a14IU1sHz07/pRhAs2PuQLbFFrboROxSqnoGFk
         Eu2veaKlic1To5OTkwcHQpqpcqNPClXaoa56bs8S2T98c8rMJKnspdKVaaSD22cVaSY8
         9oHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764865758; x=1765470558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2EOKJaJr5DVsyfexp+IIbTVfdVI8+rHJ5+Gsh6Mpxw=;
        b=v1xbZhk9F33fyYOG4/He2TdNnMn8SD2p+DQTXF8eG4LcNqciHNM6NaWaOd4Yqq4/Fx
         dpGE5v4ok4b/3Ib/gtDGTxjsV9eWlkgyhGfqTi48R9lbJcU4wRBNo56AomOJgvBG55Xz
         a120op121yxqZEOC9CibbrO2UfPMCvrf3UWt5Dy4ewE9oP3pU6R7HQ3ApiSUpUjf/vv7
         3LDMDOcZDMaWCeGqiQYxcvm2A5iVhcgoDj+TCHMCC8FRwkM9tQeDWTOKs1pTjW0YXelh
         gD86L1PN8KqEUzzaDmHqN36NzKLpklaarKYtTSwDaa7/4KO/k2dHCjkVfG41bxh31ixc
         aB0A==
X-Forwarded-Encrypted: i=1; AJvYcCURsC/tt9YYlTV2Sg4mDA3oVhCkHiOfOqlYcreqxeLe4lFWv4nkOapUdG2Gp3P+qcbj8TxpoRjJvoBecGet@lists.linux.dev
X-Gm-Message-State: AOJu0YwMRAYZJornXtj4inIyX1P4W95isOEhxsi5xUsV2SXxv2D56uTu
	jizt8a3SHkpbYzcqwIok2K5Ko9LRU7ckX5T7KWuV0DYLknaJnXDELTzN
X-Gm-Gg: ASbGncvEfmIA4U/ZLV/Xc1v8077QLjmlaQ+nz+xeRA3y/3ncoJthYAKpNqeMGnyKMzw
	nOl3hWMM+W82dj5UjZv+m9tAO1Z859KyHInqvgp1izLd03L1kNTDjLJGOmvNq2sMN5nsXKNp6BU
	Od+2Ri9tubJYsiG8Jb8aw3PW5M1LTHlaQ2SrpDlnLm+T/RHztWqzYtUGuOzGpCW9zUR524PpPOD
	l3uQzJEsamVhvKPEJXAoE+qwSFzUIHhwu8OLQdrx2XNwoMZJXL9sAXZs3cpr+oGByh/GCK7ycAK
	l7YC7ZG9ZnRHl9g3zVnisGcWRFYETgjIMCGqh9oGcZqrF0dwwDkgf8GswhYG5iM2U+7RFL1AbNb
	u6Cv4dVMd4yBRv68OPm/lUfmfAhPuNpEDcb6oKtXt1QGCdXn/P13EJOXqNGnJulPT5lEU4Es3C0
	S6NfTlO6jgtAz2
X-Google-Smtp-Source: AGHT+IF8+Njgaeb1d/EncpVZ5EbXG3MJ+qNBAPIadQrubEDDyDmXTY/rcCmPXRT1WfIGcI0A1pBxsA==
X-Received: by 2002:a05:7022:f95:b0:119:e56b:91ed with SMTP id a92af1059eb24-11df0c2fc7fmr4599394c88.30.1764865758250;
        Thu, 04 Dec 2025 08:29:18 -0800 (PST)
Received: from archlinux ([2804:1b2:9545:c615:2358:ef44:78a3:f69a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba8395d99sm10106454eec.1.2025.12.04.08.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 08:29:17 -0800 (PST)
From: Julioccps <julio191096@gmail.com>
To: hvaibhav.linux@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Julioccps <julio191096@gmail.com>
Subject: [PATCH v2] staging: greybus: arche-apb-ctrl: switch to device_property_read_bool
Date: Thu,  4 Dec 2025 13:29:06 -0300
Message-ID: <20251204162906.45005-1-julio191096@gmail.com>
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

