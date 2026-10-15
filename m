Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92588472F75
	for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 08:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052571; cv=none; b=LemeDR6DAotQQNzY2Ck6f7/W/IpX8muwAuD/sEbIUGyngU9q+BGBoR8LnxRT+hiF1WJXm/WwMWq5AHjFS+Qjfh7nA8G/NT/2zQ45V+E5hL/FkCI+7ipVKUhoqC9gNSe9qmrs3l7GaVYxuiuAM3NcYaWlFVPY/z87CWmiauh3Luw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052571; c=relaxed/simple;
	bh=tivYpWGaLAT33m5esem/EoR3Bvjxuk+1Oas+5V5uYkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=STosy2+9gJgZQhBnQar2Bx0kFwwzbzXpObogKlIlDiZDriYOZWYbpkIFVsprC7tGSIrewXnZA8u8aXYXN9zMiGrBBVugtqcFXXVP2f3gTqEs0HWeLegaZO2YUKlRPDH2fRlAByx4RPDMzZJc/NKPnRMuK9PNr37RkLQOJumOf48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+3PJwe+; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+3PJwe+"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-157fe9d771bso2393254c88.0
        for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 01:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792052567; x=1792657367; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TcZt7Qvk7+v3cat0JxOTXru0H5LpefDJps5uH3TVt8g=;
        b=O+3PJwe+ZlYlvMJJoLtwDr/ZWNA47j1++e7ZmrSY+RyoCXS/LscAhgqieW2G33xj5A
         PHchLjN7eWPRRDj+PWLo2f2z9wpH2sHuO32/0mflIe9FX0gT3E2VfX7hEepYimpefBvj
         XtH9KMfGBU+hPYIala6MSlq2vweys5M5VBFfwTprUkVaPojd2ApKR5lDkpyeLQpzv4Vq
         kJMHuCkVaQiHUyVTt2cvGvD0Elx0n6HATI1MohZTsIiJkrrhm2cFrumUzqMxEwKmz41o
         Bhj2iq30Riynag1zrt/sbqqaFP0ns5cp0KuW9gLu9n44iCRcSVNrlmVBUpSWqWd9nZa5
         Gh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792052567; x=1792657367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TcZt7Qvk7+v3cat0JxOTXru0H5LpefDJps5uH3TVt8g=;
        b=nssDfiAt7zgpV9e2kyofP3lNAIPtqpv74G3nD5pQ6ffGp4DTXNjj6zIdNQ768igzve
         vWNG+mImxob5WuB3Jikhb+VBZA9bE4J3ifuTN/a4RTvOwgrW8urDiLL0GpYXRhJqlSh0
         Rjzjt6B6pGcZz3vqDMUeKS5cEFzvDLZp5JLlB+2+5Dgdd8H4cXAm/TjsLHqHczy3pxKu
         DynirUhWo7dKQKtvnrjHH1oJz/WZlkFgD65f/4tX0RfzG12LnT6vYVU+tdII4PhXhdOR
         lQZYtsNQ5AxqI5bDiiRUpNm6hEC38xpFH8c2wZDm6ehG6aUL3IIdsaAAOSuRWzRVtatH
         W3ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEuvw1n19AKho7zg+zNWnwpWZ2XzQQ/OIBOqfdDL0pvBkChRIX7tldZOEAx3PKxJTqJWv9LRn9ahCouAoq@lists.linux.dev
X-Gm-Message-State: AFq9FYIemib5skfMJ5mo6DkgcUtl3su/C2oDX2d8W/UfyyMAHR1j/Im5
	6Hrgc5ARKDHeraEo9x9w0EnkWxCBBKawBTaGtFbkw32emhiSC2l6a+4v
X-Gm-Gg: AYBFou3tHV5QmnU0A0tmMv0Ev7JFrzGHG32Vo2TCKxeKdatTeoR/z3O2Y5FkFFxUS9R
	7PKc4z0xPF/XAkKs3YkM71EIx5MEb+p1N8VS6pYeDLIB9yXD1n0zSxyVpk1xEyUL7PdOS5aeljU
	WZlpwYWibG5EuaXoIdPYAZRPud3RB33RyARR+eOz8FUeaXLSoLcTcVn2Ra92Tjxn00EYLLmzb9D
	oPFy+xDVhis8ximw9PSj4QHK5U7ZVLmJtsa94Eg8BuLFr7meWv8HlAhVHB3Rv8h5GrFDY+K+IjT
	k+AmSwRymK06wwmeWwawh18HPQRgIJgldPEz0E31oktbKnZEJse5JHJT1NXKx79tD5s4nI3EsOU
	wvjnqrZWiP4vMU1Ox1sATJ7ExfaV2TPtsW9LnpAUhl5lYWIvmuutIuDZVVYP1OpwfZ+LNeSV58U
	erNgNiqF5Bop/nmfl6xRTSEBt5LfKk+SGHHGVoTYMKB3Xzdzl1qBmV0FGG6QrB/4HXEdRyH6nvv
	972ag==
X-Received: by 2002:a05:701b:4212:20b0:168:e942:4e62 with SMTP id a92af1059eb24-16a61789c56mr25359603c88.40.1792052567428;
        Thu, 15 Oct 2026 01:22:47 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:a490:42fc:1e02:1d0b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a32eb7ebsm63977236c88.12.2026.10.15.01.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:22:46 -0700 (PDT)
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
Subject: [PATCH v4] staging: greybus: replace PTR_ERR() with %pe in error messages
Date: Thu, 15 Oct 2026 13:52:38 +0530
Message-ID: <20261015082238.65187-1-pavankumaryalagada@gmail.com>
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
v4:
- Return error codes directly instead of storing them in ret,
  as suggested by Julia Lawall.
- Remove the unused ret variable.

v3:
- Extend the %pe conversion throughout Greybus, as suggested by Alex Elder.

v2:
- Use %pe in the firmware management case, as suggested by Jeremy Clifton,
  to match the other cases.

v1: https://lore.kernel.org/outreachy/as0nhVbagZa8Birm@user/T/#t
---
 drivers/staging/greybus/arche-apb-ctrl.c | 37 ++++++++++--------------
 drivers/staging/greybus/arche-platform.c | 26 +++++++----------
 drivers/staging/greybus/fw-core.c        | 16 +++++-----
 drivers/staging/greybus/uart.c           |  2 +-
 4 files changed, 35 insertions(+), 46 deletions(-)

diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
index 4302c2226126..d30174310828 100644
--- a/drivers/staging/greybus/arche-apb-ctrl.c
+++ b/drivers/staging/greybus/arche-apb-ctrl.c
@@ -144,10 +144,9 @@ static int fw_flashing_seq(struct platform_device *pdev)
 
 		apb->spi_en = devm_gpiod_get(dev, "spi-en", flags);
 		if (IS_ERR(apb->spi_en)) {
-			ret = PTR_ERR(apb->spi_en);
-			dev_err(dev, "Failed requesting SPI bus en GPIO: %d\n",
-				ret);
-			return ret;
+			dev_err(dev, "Failed requesting SPI bus en GPIO: %pe\n",
+				apb->spi_en);
+			return PTR_ERR(apb->spi_en);
 		}
 	}
 
@@ -318,43 +317,37 @@ static int apb_ctrl_get_fw_data(struct platform_device *pdev,
 				struct arche_apb_ctrl_drvdata *apb)
 {
 	struct device *dev = &pdev->dev;
-	int ret;
 
 	apb->resetn = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(apb->resetn)) {
-		ret = PTR_ERR(apb->resetn);
-		dev_err(dev, "Failed requesting reset GPIO: %d\n", ret);
-		return ret;
+		dev_err(dev, "Failed requesting reset GPIO: %pe\n", apb->resetn);
+		return PTR_ERR(apb->resetn);
 	}
 
 	apb->boot_ret = devm_gpiod_get(dev, "boot-ret", GPIOD_OUT_LOW);
 	if (IS_ERR(apb->boot_ret)) {
-		ret = PTR_ERR(apb->boot_ret);
-		dev_err(dev, "Failed requesting bootret GPIO: %d\n", ret);
-		return ret;
+		dev_err(dev, "Failed requesting bootret GPIO: %pe\n", apb->boot_ret);
+		return PTR_ERR(apb->boot_ret);
 	}
 
 	/* It's not mandatory to support power management interface */
 	apb->pwroff = devm_gpiod_get_optional(dev, "pwr-off", GPIOD_IN);
 	if (IS_ERR(apb->pwroff)) {
-		ret = PTR_ERR(apb->pwroff);
-		dev_err(dev, "Failed requesting pwroff_n GPIO: %d\n", ret);
-		return ret;
+		dev_err(dev, "Failed requesting pwroff_n GPIO: %pe\n", apb->pwroff);
+		return PTR_ERR(apb->pwroff);
 	}
 
 	/* Do not make clock mandatory as of now (for DB3) */
 	apb->clk_en = devm_gpiod_get_optional(dev, "clock-en", GPIOD_OUT_LOW);
 	if (IS_ERR(apb->clk_en)) {
-		ret = PTR_ERR(apb->clk_en);
-		dev_err(dev, "Failed requesting APB clock en GPIO: %d\n", ret);
-		return ret;
+		dev_err(dev, "Failed requesting APB clock en GPIO: %pe\n", apb->clk_en);
+		return PTR_ERR(apb->clk_en);
 	}
 
 	apb->pwrdn = devm_gpiod_get(dev, "pwr-down", GPIOD_OUT_LOW);
 	if (IS_ERR(apb->pwrdn)) {
-		ret = PTR_ERR(apb->pwrdn);
-		dev_warn(dev, "Failed requesting power down GPIO: %d\n", ret);
-		return ret;
+		dev_warn(dev, "Failed requesting power down GPIO: %pe\n", apb->pwrdn);
+		return PTR_ERR(apb->pwrdn);
 	}
 
 	/* Regulators are optional, as we may have fixed supply coming in */
@@ -368,12 +361,12 @@ static int apb_ctrl_get_fw_data(struct platform_device *pdev,
 
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
index de5de59ea8ab..8e75accc34b6 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -444,35 +444,32 @@ static int arche_platform_probe(struct platform_device *pdev)
 
 	arche_pdata->svc_reset = devm_gpiod_get(dev, "svc,reset", flags);
 	if (IS_ERR(arche_pdata->svc_reset)) {
-		ret = PTR_ERR(arche_pdata->svc_reset);
-		dev_err(dev, "failed to request svc-reset GPIO: %d\n", ret);
-		return ret;
+		dev_err(dev, "failed to request svc-reset GPIO: %pe\n", arche_pdata->svc_reset);
+		return PTR_ERR(arche_pdata->svc_reset);
 	}
 	arche_platform_set_state(arche_pdata, ARCHE_PLATFORM_STATE_OFF);
 
 	arche_pdata->svc_sysboot = devm_gpiod_get(dev, "svc,sysboot",
 						  GPIOD_OUT_LOW);
 	if (IS_ERR(arche_pdata->svc_sysboot)) {
-		ret = PTR_ERR(arche_pdata->svc_sysboot);
-		dev_err(dev, "failed to request sysboot0 GPIO: %d\n", ret);
-		return ret;
+		dev_err(dev, "failed to request sysboot0 GPIO: %pe\n", arche_pdata->svc_sysboot);
+		return PTR_ERR(arche_pdata->svc_sysboot);
 	}
 
 	/* setup the clock request gpio first */
 	arche_pdata->svc_refclk_req = devm_gpiod_get(dev, "svc,refclk-req",
 						     GPIOD_IN);
 	if (IS_ERR(arche_pdata->svc_refclk_req)) {
-		ret = PTR_ERR(arche_pdata->svc_refclk_req);
-		dev_err(dev, "failed to request svc-clk-req GPIO: %d\n", ret);
-		return ret;
+		dev_err(dev, "failed to request svc-clk-req GPIO: %pe\n",
+			arche_pdata->svc_refclk_req);
+		return PTR_ERR(arche_pdata->svc_refclk_req);
 	}
 
 	/* setup refclk2 to follow the pin */
 	arche_pdata->svc_ref_clk = devm_clk_get(dev, "svc_ref_clk");
 	if (IS_ERR(arche_pdata->svc_ref_clk)) {
-		ret = PTR_ERR(arche_pdata->svc_ref_clk);
-		dev_err(dev, "failed to get svc_ref_clk: %d\n", ret);
-		return ret;
+		dev_err(dev, "failed to get svc_ref_clk: %pe\n", arche_pdata->svc_ref_clk);
+		return PTR_ERR(arche_pdata->svc_ref_clk);
 	}
 
 	platform_set_drvdata(pdev, arche_pdata);
@@ -483,9 +480,8 @@ static int arche_platform_probe(struct platform_device *pdev)
 	arche_pdata->wake_detect = devm_gpiod_get(dev, "svc,wake-detect",
 						  GPIOD_IN);
 	if (IS_ERR(arche_pdata->wake_detect)) {
-		ret = PTR_ERR(arche_pdata->wake_detect);
-		dev_err(dev, "Failed requesting wake_detect GPIO: %d\n", ret);
-		return ret;
+		dev_err(dev, "Failed requesting wake_detect GPIO: %pe\n", arche_pdata->wake_detect);
+		return PTR_ERR(arche_pdata->wake_detect);
 	}
 
 	arche_platform_set_wake_detect_state(arche_pdata, WD_STATE_IDLE);
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

