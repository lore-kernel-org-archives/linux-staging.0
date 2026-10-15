Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715D933939C
	for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 01:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792029396; cv=none; b=TftYE497WwQI7eNFXOn2zIIwCeOdttNyjK4xJ6OHMIakyT4RBWG43NAt3G+UdOfqRJ+OoPUikgbdbn7juS4xUoJxaWuam2efWfDqOB/FMFBzYVMCvke5unJbB/QL7ACBP8TXIXiGsMeZN+faO0AKOOpwSeI4XtacYP2qKl7Sg48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792029396; c=relaxed/simple;
	bh=rEr0SuVn7nZ9MjGQg/bSCKwbMj++w/gb0WSIVoNsmao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kchuhxe0LoO/30Lc7tA/njuhKKKW35qCNKStzWxwBK19+x8AP5BQIuAt6ZPt5Jz0hLgasWCHeOhznUVY+pBhP8Wy2ff4iPCHmxQQkYDnJJGECLPJfevik2XcZIb3H/NuMRUiRWtX6MvMMa6QRpiIPebO3iqn31sxCf5X1Q12xfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huZrippi; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huZrippi"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3535a54bed9so2340166eec.1
        for <linux-staging@lists.linux.dev>; Wed, 14 Oct 2026 18:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792029394; x=1792634194; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F1FsLNvJbfAGqqWf52h0nbW4N3/eLeJk37u/bFcrI00=;
        b=huZrippiueCZiNSuhgXDUNDLNC1t+Ucx2XzwCXkTVHCPQ+S9kIhuGG32GjYkZcVjib
         SBAsnx+P7DG/pIy0GhnBDUlq58ehsYK/tLLCJzUtOSBTQz0FjmXAjXKKNzbU1n1XM2Qk
         HmNCQ3obNM8y6OnPkDWfza1afLSOB1yFDXWFZacS7XwCAEpE+FouvNmDHB5OuD7c/3yR
         bX7YI0OAkMRdRGfjDUPI/00f4GV8qfGQtX7hTUJxMAoRFBpZw/Vgw9jl9nXlS1ZyCdRJ
         ZMFjL/9AX2sDyFhbK1f6Uz0T9P1sjZZNOA/YUkAAiuP1FjDpLwt9HI8LRq15kjn59iuT
         wXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792029394; x=1792634194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F1FsLNvJbfAGqqWf52h0nbW4N3/eLeJk37u/bFcrI00=;
        b=BRwnsFwTp8nJmj4lMsxIWUngJR9sEVJTBl7GVwOpvfV/0VQthTabEZbgTVr/Hh8cfj
         tv1kK3jjMkCKlsIQ3h/FB2JV46qRz6tkZS5zkhb/W+NbiG5H+KMWT8Wy5yV2GsCFcoy7
         4kUwBQyyNCCMoWRWl8ccne5+0wOj5LRWFYXJntNacBhZUwlpjFjcubrgRK53mcgeIO1K
         5lZxe/73PA3QPDvEE1mm6B+8GK8+cBLEfQ3fbSFUHu9Weeu7LlluvrXkwZsJS0+uEoMp
         ctSb7/NE+ToHwT7pDKnQ2wqgn/ZbifTKCIWIV3N79Dyy/IETwT2hJQwieq3Qxvd6a+Z9
         NzyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEAPJ/lf1jgkDxh9JBaE8uZsYFyOzlWgnx5C0kQXPiSACglm3KeZ7U0EepDldCn+dL+8nIQ2Hmy3qX7kJd@lists.linux.dev
X-Gm-Message-State: AFq9FYLuCM1q/zZAQiL+XwmykuQDei582/oiIrolM9OZKZ0raJeBb1sD
	CnMTCuE4GfixD40WYo8NABbxqI9xDhygf8z7Z8XR1CVqjlv/aPjseHZs
X-Gm-Gg: AYBFou1Pw1RnbrCpIMoPlIIS4JEul8+440idO7MqupIiD/RkgKlivnU24YFUit8QNGL
	f9dc8ey6pb8+anytyZBy5wGPIhce0b/uvUQqpeSa2F8srNAGcgDMWRndwWTfQ3HAKSOCfSleeRU
	TAQFDvXE01a6hYpkJ9/TMxTdQph2gvh5+PyOtwLY7yTJwWWs5lZTSj02PgMNaJqcf+XsbMRhioK
	N/wd+mGCM7KnpFv3FGcJOzrKyF6JtJ5AzIDj8efbSDC8Wc8wLhZkVgQVTLA1f+RNI8wfSN5mHiW
	4CbOd2uR+CfuPRMW89pkBqM33k6ZiwQYFgYro0RHjqv0G95wS2PE2EjwZf8kDNDNqIni4tcUQXh
	8s1M30iKYQa8zG8C0rtNIT2RhefS1MLTbjLVabh6cC4pVU11IQIFg7e8gGQwn90vTXokdJU2AtI
	VpzSfGfFxvUTPzqd1w8eEHzrmv0prLZGbApC5hPoSznIMJW0NGJx2aof756PtHb3950zFd+YhEt
	rTWWjk=
X-Received: by 2002:a05:693c:2a04:b0:35e:1807:cedf with SMTP id 5a478bee46e88-35e18171411mr4108373eec.1.1792029394233;
        Wed, 14 Oct 2026 18:56:34 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:a490:42fc:1e02:1d0b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b690af3easm27111347eec.1.2026.10.14.18.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:56:33 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: vireshk@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
Subject: [PATCH v3] staging: greybus: replace PTR_ERR() with %pe in error messages
Date: Thu, 15 Oct 2026 07:26:24 +0530
Message-ID: <20261015015624.22031-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

Use %pe to print error pointers directly and display their
error names.

Keep PTR_ERR() calls when the numeric error value is needed
for returning the error code.

Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
v3:
- Extend the %pe conversion throughout Greybus, as suggested by Alex Elder.

v2:
- Use %pe in the firmware management case, as suggested by Jeremy Clifton,
  to match the other cases.

v1: https://lore.kernel.org/outreachy/as0nhVbagZa8Birm@user/T/#t
---
 drivers/staging/greybus/arche-apb-ctrl.c | 18 +++++++++---------
 drivers/staging/greybus/arche-platform.c |  8 ++++----
 drivers/staging/greybus/fw-core.c        | 16 ++++++++--------
 drivers/staging/greybus/uart.c           |  2 +-
 4 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
index 4302c2226126..fa4d2d88dc3f 100644
--- a/drivers/staging/greybus/arche-apb-ctrl.c
+++ b/drivers/staging/greybus/arche-apb-ctrl.c
@@ -145,8 +145,8 @@ static int fw_flashing_seq(struct platform_device *pdev)
 		apb->spi_en = devm_gpiod_get(dev, "spi-en", flags);
 		if (IS_ERR(apb->spi_en)) {
 			ret = PTR_ERR(apb->spi_en);
-			dev_err(dev, "Failed requesting SPI bus en GPIO: %d\n",
-				ret);
+			dev_err(dev, "Failed requesting SPI bus en GPIO: %pe\n",
+				apb->spi_en);
 			return ret;
 		}
 	}
@@ -323,14 +323,14 @@ static int apb_ctrl_get_fw_data(struct platform_device *pdev,
 	apb->resetn = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(apb->resetn)) {
 		ret = PTR_ERR(apb->resetn);
-		dev_err(dev, "Failed requesting reset GPIO: %d\n", ret);
+		dev_err(dev, "Failed requesting reset GPIO: %pe\n", apb->resetn);
 		return ret;
 	}
 
 	apb->boot_ret = devm_gpiod_get(dev, "boot-ret", GPIOD_OUT_LOW);
 	if (IS_ERR(apb->boot_ret)) {
 		ret = PTR_ERR(apb->boot_ret);
-		dev_err(dev, "Failed requesting bootret GPIO: %d\n", ret);
+		dev_err(dev, "Failed requesting bootret GPIO: %pe\n", apb->boot_ret);
 		return ret;
 	}
 
@@ -338,7 +338,7 @@ static int apb_ctrl_get_fw_data(struct platform_device *pdev,
 	apb->pwroff = devm_gpiod_get_optional(dev, "pwr-off", GPIOD_IN);
 	if (IS_ERR(apb->pwroff)) {
 		ret = PTR_ERR(apb->pwroff);
-		dev_err(dev, "Failed requesting pwroff_n GPIO: %d\n", ret);
+		dev_err(dev, "Failed requesting pwroff_n GPIO: %pe\n", apb->pwroff);
 		return ret;
 	}
 
@@ -346,14 +346,14 @@ static int apb_ctrl_get_fw_data(struct platform_device *pdev,
 	apb->clk_en = devm_gpiod_get_optional(dev, "clock-en", GPIOD_OUT_LOW);
 	if (IS_ERR(apb->clk_en)) {
 		ret = PTR_ERR(apb->clk_en);
-		dev_err(dev, "Failed requesting APB clock en GPIO: %d\n", ret);
+		dev_err(dev, "Failed requesting APB clock en GPIO: %pe\n", apb->clk_en);
 		return ret;
 	}
 
 	apb->pwrdn = devm_gpiod_get(dev, "pwr-down", GPIOD_OUT_LOW);
 	if (IS_ERR(apb->pwrdn)) {
 		ret = PTR_ERR(apb->pwrdn);
-		dev_warn(dev, "Failed requesting power down GPIO: %d\n", ret);
+		dev_warn(dev, "Failed requesting power down GPIO: %pe\n", apb->pwrdn);
 		return ret;
 	}
 
@@ -368,12 +368,12 @@ static int apb_ctrl_get_fw_data(struct platform_device *pdev,
 
 	apb->pinctrl = devm_pinctrl_get(&pdev->dev);
 	if (IS_ERR(apb->pinctrl)) {
-		dev_err(&pdev->dev, "could not get pinctrl handle\n");
+		dev_err(&pdev->dev, "could not get pinctrl handle: %pe\n", apb->pinctrl);
 		return PTR_ERR(apb->pinctrl);
 	}
 	apb->pin_default = pinctrl_lookup_state(apb->pinctrl, "default");
 	if (IS_ERR(apb->pin_default)) {
-		dev_err(&pdev->dev, "could not get default pin state\n");
+		dev_err(&pdev->dev, "could not get default pin state: %pe\n", apb->pin_default);
 		return PTR_ERR(apb->pin_default);
 	}
 
diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index de5de59ea8ab..a97ac59c6f01 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -445,7 +445,7 @@ static int arche_platform_probe(struct platform_device *pdev)
 	arche_pdata->svc_reset = devm_gpiod_get(dev, "svc,reset", flags);
 	if (IS_ERR(arche_pdata->svc_reset)) {
 		ret = PTR_ERR(arche_pdata->svc_reset);
-		dev_err(dev, "failed to request svc-reset GPIO: %d\n", ret);
+		dev_err(dev, "failed to request svc-reset GPIO: %pe\n", arche_pdata->svc_reset);
 		return ret;
 	}
 	arche_platform_set_state(arche_pdata, ARCHE_PLATFORM_STATE_OFF);
@@ -454,7 +454,7 @@ static int arche_platform_probe(struct platform_device *pdev)
 						  GPIOD_OUT_LOW);
 	if (IS_ERR(arche_pdata->svc_sysboot)) {
 		ret = PTR_ERR(arche_pdata->svc_sysboot);
-		dev_err(dev, "failed to request sysboot0 GPIO: %d\n", ret);
+		dev_err(dev, "failed to request sysboot0 GPIO: %pe\n", arche_pdata->svc_sysboot);
 		return ret;
 	}
 
@@ -471,7 +471,7 @@ static int arche_platform_probe(struct platform_device *pdev)
 	arche_pdata->svc_ref_clk = devm_clk_get(dev, "svc_ref_clk");
 	if (IS_ERR(arche_pdata->svc_ref_clk)) {
 		ret = PTR_ERR(arche_pdata->svc_ref_clk);
-		dev_err(dev, "failed to get svc_ref_clk: %d\n", ret);
+		dev_err(dev, "failed to get svc_ref_clk: %pe\n", arche_pdata->svc_ref_clk);
 		return ret;
 	}
 
@@ -484,7 +484,7 @@ static int arche_platform_probe(struct platform_device *pdev)
 						  GPIOD_IN);
 	if (IS_ERR(arche_pdata->wake_detect)) {
 		ret = PTR_ERR(arche_pdata->wake_detect);
-		dev_err(dev, "Failed requesting wake_detect GPIO: %d\n", ret);
+		dev_err(dev, "Failed requesting wake_detect GPIO: %pe\n", arche_pdata->wake_detect);
 		return ret;
 	}
 
diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
index 2016a74f137f..78321be80013 100644
--- a/drivers/staging/greybus/fw-core.c
+++ b/drivers/staging/greybus/fw-core.c
@@ -93,8 +93,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			if (IS_ERR(connection)) {
 				ret = PTR_ERR(connection);
 				dev_err(&bundle->dev,
-					"failed to create management connection (%d)\n",
-					ret);
+					"failed to create management connection (%pe)\n",
+					connection);
 				goto err_destroy_connections;
 			}
 
@@ -112,8 +112,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			connection = gb_connection_create(bundle, cport_id,
 							  gb_fw_download_request_handler);
 			if (IS_ERR(connection)) {
-				dev_err(&bundle->dev, "failed to create download connection (%ld)\n",
-					PTR_ERR(connection));
+				dev_err(&bundle->dev, "failed to create download connection (%pe)\n",
+					connection);
 			} else {
 				fw_core->download_connection = connection;
 			}
@@ -131,8 +131,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			connection = gb_connection_create(bundle, cport_id,
 							  NULL);
 			if (IS_ERR(connection)) {
-				dev_err(&bundle->dev, "failed to create SPI connection (%ld)\n",
-					PTR_ERR(connection));
+				dev_err(&bundle->dev, "failed to create SPI connection (%pe)\n",
+					connection);
 			} else {
 				fw_core->spi_connection = connection;
 			}
@@ -149,8 +149,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			connection = gb_connection_create(bundle, cport_id,
 							  NULL);
 			if (IS_ERR(connection)) {
-				dev_err(&bundle->dev, "failed to create Authentication connection (%ld)\n",
-					PTR_ERR(connection));
+				dev_err(&bundle->dev, "failed to create Authentication connection (%pe)\n",
+					connection);
 			} else {
 				fw_core->cap_connection = connection;
 			}
diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 172cf900eaf0..59a112cf47a0 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -951,7 +951,7 @@ static int gb_tty_init(void)
 					 TTY_DRIVER_DYNAMIC_DEV |
 					 TTY_DRIVER_RESET_SAVED_TERMIOS);
 	if (IS_ERR(gb_tty_driver)) {
-		pr_err("Can not allocate tty driver\n");
+		pr_err("Can not allocate tty driver: %pe\n", gb_tty_driver);
 		retval = PTR_ERR(gb_tty_driver);
 		goto fail_unregister_dev;
 	}
-- 
2.43.0

