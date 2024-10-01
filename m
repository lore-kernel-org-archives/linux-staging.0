Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBBF19AA68
	for <linux-staging@lists.linux.dev>; Tue,  1 Oct 2024 08:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727773080; cv=none; b=Lku/ollBkJXmzE8Rj8XYGmtv5nKS/e5DPclaXptGsDJM0YTqaWo6/makfySGSnFFwyW/PbhwnEW5FnNCEuw/Uox6/FA8fpl2J6/7xez26P30TEYYstuWSdS6du5nksRoLT7DGqupoXk6LjtuoJYvDSCSXpU/oDArxN/YiSZ5xtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727773080; c=relaxed/simple;
	bh=8R8jXDp3Rp6b35LyjTAA27ALkdha8BpDUuwB1DA8cns=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rT2xPbL1RSB/h8nMY1iGqM2O/w9tsTWJGhjz97z2So8vaJKufwv6PY94tXRp/r9p2BMBNYvmpMbWKPfU3ooM+hncxWZmPrCjopvPx45ytL8TspOj1ZU+rKVcrIJy7opAsMCCsZ4D25GerhDiNFTDmCBBf8pFTr5ZFYiPRhdiuQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnHE9r6a; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnHE9r6a"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42cba8340beso37101405e9.1
        for <linux-staging@lists.linux.dev>; Tue, 01 Oct 2024 01:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727773076; x=1728377876; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dlSzqbnF/9KYqrnBhCzGvhUqACGXfqsUh2AU7azO2QM=;
        b=dnHE9r6aSe+G9BIeqH7ow/hLJE3146mItKReACBmUx+W5ljOtbIphcEoRTspm5b4D0
         A6QNvFftfe92C8QaIfin/Axp4roGGmpRuHfCkrjEbo2NNcJGp7wfvxtuq4H2WT6mqWRV
         olJYfo3szHXN/MIB+wHImfBhQKqSihlghKnzGuUxQye2cjcJGbaXWkdWppMGdqcTtv9L
         diDsnrItwOJGiP/AVqUC8BHCl5iJWlsnb3SzLejlI2fEZUSSEWoN0fKmz3VGxG83zNsY
         TYiDAZFGiNwo//Qnka8VF0Sqmjk62rHoxTqvuw4c7yhNAOZYChURy6sv4PfFrHEwJLnO
         WBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727773076; x=1728377876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlSzqbnF/9KYqrnBhCzGvhUqACGXfqsUh2AU7azO2QM=;
        b=SzWjQpS4kRaaLIjLXYvfecAkHoXv0TG1fbj0BDTlcEHUdWchAyhnXRjekRx9skkE8Z
         GNoZ/HqrwGTy755Wl2XiY8X0ojq+BD492ApR0xaeqyZgORC+YAQNwJkVIvphdBNLmAHM
         uN6AL7xbVb52QCtNxe/z3cB4opCU0AEKK7UGmlUC/9pF6UDfwOAg6xdO2UYI9ABxnP2C
         JyDnVW2dsu8icaZR97B51mk3J4/PPfDZSnpGWzm9rfaWLTQttx+QDlWN0TgBV8Vkh/M1
         vjZxSP9hsGzXirPY/XtM+bVaaVyGDl2Dv3Q+WNeRtV8Y+DmBr/MUz4tj2oXjsY/hh4JY
         9Bzg==
X-Gm-Message-State: AOJu0Yzz+vX4qo+Do0AkNbpmbO0pJvUVyGAgyh9sP/kCqsI66wuS6IiR
	v40uSU7shUOZNmjQMtmS2e4awgx1Ecqr3lWnf/Id1W/kW4l9QxpBXutjow==
X-Google-Smtp-Source: AGHT+IFxwTtpa+Hjm9EsOfG/AbraRA7STXaTG/baMXfgpoqNx9gOrW87fqOqqgdf4VtBaBKEUqhbhg==
X-Received: by 2002:a05:6000:4106:b0:37c:f997:5b94 with SMTP id ffacd0b85a97d-37cf997631amr198541f8f.12.1727773075237;
        Tue, 01 Oct 2024 01:57:55 -0700 (PDT)
Received: from localhost.localdomain (158.red-88-11-182.dynamicip.rima-tde.net. [88.11.182.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a36597sm173974875e9.31.2024.10.01.01.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 01:57:53 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org
Subject: [PATCH] staging: Switch back to struct platform_driver::remove()
Date: Tue,  1 Oct 2024 10:57:51 +0200
Message-Id: <20241001085751.282113-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all staging drivers to use .remove(), with the eventual goal to
drop struct platform_driver::remove_new(). As .remove() and .remove_new()
have the same prototypes, conversion is done by just changing the structure
member name in the driver initializer.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c                         | 2 +-
 drivers/staging/fbtft/fbtft.h                                 | 2 +-
 drivers/staging/fieldbus/anybuss/arcx-anybus.c                | 2 +-
 drivers/staging/greybus/arche-apb-ctrl.c                      | 2 +-
 drivers/staging/greybus/arche-platform.c                      | 2 +-
 drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c    | 2 +-
 drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c    | 2 +-
 drivers/staging/media/imx/imx-media-csi.c                     | 2 +-
 drivers/staging/media/imx/imx-media-dev.c                     | 2 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c                    | 2 +-
 drivers/staging/media/meson/vdec/vdec.c                       | 2 +-
 drivers/staging/media/omap4iss/iss.c                          | 2 +-
 drivers/staging/media/rkvdec/rkvdec.c                         | 2 +-
 drivers/staging/media/starfive/camss/stf-camss.c              | 2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c                   | 2 +-
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c             | 2 +-
 drivers/staging/media/tegra-video/csi.c                       | 2 +-
 drivers/staging/media/tegra-video/vi.c                        | 2 +-
 drivers/staging/media/tegra-video/vip.c                       | 2 +-
 drivers/staging/most/dim2/dim2.c                              | 2 +-
 drivers/staging/nvec/nvec.c                                   | 2 +-
 drivers/staging/nvec/nvec_kbd.c                               | 2 +-
 drivers/staging/nvec/nvec_power.c                             | 2 +-
 drivers/staging/nvec/nvec_ps2.c                               | 2 +-
 drivers/staging/octeon/ethernet.c                             | 2 +-
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 2 +-
 26 files changed, 26 insertions(+), 26 deletions(-)

Hi Greg,

I am sending all of these together in the same patch since I though
is cleaner to do this at once as other subsystems already did. Let
me know if you prefer to send individual patches for this. I am also
just sending this patch to the staging list and to don't bother people
with a very big list of mail recipents.

Thanks,
   Sergio Paracuellos
diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 1bbb9a6db597..7540c20090c7 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -919,7 +919,7 @@ static struct platform_driver axis_fifo_driver = {
 		.of_match_table	= axis_fifo_of_match,
 	},
 	.probe		= axis_fifo_probe,
-	.remove_new	= axis_fifo_remove,
+	.remove		= axis_fifo_remove,
 };
 
 static int __init axis_fifo_init(void)
diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 3e00a26a29d5..317be17b95c1 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -330,7 +330,7 @@ static struct platform_driver fbtft_driver_platform_driver = {             \
 		.of_match_table = dt_ids,                                  \
 	},                                                                 \
 	.probe  = fbtft_driver_probe_pdev,                                 \
-	.remove_new = fbtft_driver_remove_pdev,				   \
+	.remove = fbtft_driver_remove_pdev,				   \
 };                                                                         \
 									   \
 static int __init fbtft_driver_module_init(void)                           \
diff --git a/drivers/staging/fieldbus/anybuss/arcx-anybus.c b/drivers/staging/fieldbus/anybuss/arcx-anybus.c
index fcd3e3722ae0..cda0d2cf84c5 100644
--- a/drivers/staging/fieldbus/anybuss/arcx-anybus.c
+++ b/drivers/staging/fieldbus/anybuss/arcx-anybus.c
@@ -343,7 +343,7 @@ MODULE_DEVICE_TABLE(of, controller_of_match);
 
 static struct platform_driver controller_driver = {
 	.probe = controller_probe,
-	.remove_new = controller_remove,
+	.remove = controller_remove,
 	.driver		= {
 		.name   = "arcx-anybus-controller",
 		.of_match_table	= controller_of_match,
diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
index aa6f266b62a1..90ab32638d3f 100644
--- a/drivers/staging/greybus/arche-apb-ctrl.c
+++ b/drivers/staging/greybus/arche-apb-ctrl.c
@@ -470,7 +470,7 @@ MODULE_DEVICE_TABLE(of, arche_apb_ctrl_of_match);
 
 static struct platform_driver arche_apb_ctrl_device_driver = {
 	.probe		= arche_apb_ctrl_probe,
-	.remove_new	= arche_apb_ctrl_remove,
+	.remove		= arche_apb_ctrl_remove,
 	.shutdown	= arche_apb_ctrl_shutdown,
 	.driver		= {
 		.name	= "arche-apb-ctrl",
diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index b33977ccd527..d48464390f58 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -623,7 +623,7 @@ MODULE_DEVICE_TABLE(of, arche_platform_of_match);
 
 static struct platform_driver arche_platform_device_driver = {
 	.probe		= arche_platform_probe,
-	.remove_new	= arche_platform_remove,
+	.remove		= arche_platform_remove,
 	.shutdown	= arche_platform_shutdown,
 	.driver		= {
 		.name	= "arche-platform-ctrl",
diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
index 712f916f0935..71e6e278a4b3 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
@@ -629,7 +629,7 @@ MODULE_DEVICE_TABLE(of, atmel_isc_of_match);
 
 static struct platform_driver atmel_isc_driver = {
 	.probe	= atmel_isc_probe,
-	.remove_new = atmel_isc_remove,
+	.remove = atmel_isc_remove,
 	.driver	= {
 		.name		= "atmel-sama5d2-isc",
 		.pm		= &atmel_isc_dev_pm_ops,
diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
index 9485167d5b7d..1f74c2dd044c 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
@@ -592,7 +592,7 @@ MODULE_DEVICE_TABLE(of, microchip_xisc_of_match);
 
 static struct platform_driver microchip_xisc_driver = {
 	.probe	= microchip_xisc_probe,
-	.remove_new = microchip_xisc_remove,
+	.remove = microchip_xisc_remove,
 	.driver	= {
 		.name		= "microchip-sama7g5-xisc",
 		.pm		= &microchip_xisc_dev_pm_ops,
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 785aac881922..3edbc57be2ca 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -2076,7 +2076,7 @@ MODULE_DEVICE_TABLE(platform, imx_csi_ids);
 
 static struct platform_driver imx_csi_driver = {
 	.probe = imx_csi_probe,
-	.remove_new = imx_csi_remove,
+	.remove = imx_csi_remove,
 	.id_table = imx_csi_ids,
 	.driver = {
 		.name = "imx-ipuv3-csi",
diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/staging/media/imx/imx-media-dev.c
index be54dca11465..a08389b99d14 100644
--- a/drivers/staging/media/imx/imx-media-dev.c
+++ b/drivers/staging/media/imx/imx-media-dev.c
@@ -129,7 +129,7 @@ MODULE_DEVICE_TABLE(of, imx_media_dt_ids);
 
 static struct platform_driver imx_media_pdrv = {
 	.probe		= imx_media_probe,
-	.remove_new	= imx_media_remove,
+	.remove		= imx_media_remove,
 	.driver		= {
 		.name	= "imx-media",
 		.of_match_table	= imx_media_dt_ids,
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 0d8b42061623..dd8c7b3233bc 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -836,7 +836,7 @@ static struct platform_driver csi2_driver = {
 		.of_match_table = csi2_dt_ids,
 	},
 	.probe = csi2_probe,
-	.remove_new = csi2_remove,
+	.remove = csi2_remove,
 };
 
 module_platform_driver(csi2_driver);
diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 5e5b296f93ba..6bf7ade0c6a1 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1119,7 +1119,7 @@ static void vdec_remove(struct platform_device *pdev)
 
 static struct platform_driver meson_vdec_driver = {
 	.probe = vdec_probe,
-	.remove_new = vdec_remove,
+	.remove = vdec_remove,
 	.driver = {
 		.name = "meson-vdec",
 		.of_match_table = vdec_dt_match,
diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
index 0c4283bb48ad..61cea89c042b 100644
--- a/drivers/staging/media/omap4iss/iss.c
+++ b/drivers/staging/media/omap4iss/iss.c
@@ -1340,7 +1340,7 @@ MODULE_DEVICE_TABLE(platform, omap4iss_id_table);
 
 static struct platform_driver iss_driver = {
 	.probe		= iss_probe,
-	.remove_new	= iss_remove,
+	.remove		= iss_remove,
 	.id_table	= omap4iss_id_table,
 	.driver = {
 		.name	= "omap4iss",
diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index ac398b5a9736..433df4778c95 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -1103,7 +1103,7 @@ static const struct dev_pm_ops rkvdec_pm_ops = {
 
 static struct platform_driver rkvdec_driver = {
 	.probe = rkvdec_probe,
-	.remove_new = rkvdec_remove,
+	.remove = rkvdec_remove,
 	.driver = {
 		   .name = "rkvdec",
 		   .of_match_table = of_rkvdec_match,
diff --git a/drivers/staging/media/starfive/camss/stf-camss.c b/drivers/staging/media/starfive/camss/stf-camss.c
index b6d34145bc19..259aaad010d2 100644
--- a/drivers/staging/media/starfive/camss/stf-camss.c
+++ b/drivers/staging/media/starfive/camss/stf-camss.c
@@ -422,7 +422,7 @@ static const struct dev_pm_ops stfcamss_pm_ops = {
 
 static struct platform_driver stfcamss_driver = {
 	.probe = stfcamss_probe,
-	.remove_new = stfcamss_remove,
+	.remove = stfcamss_remove,
 	.driver = {
 		.name = "starfive-camss",
 		.pm = &stfcamss_pm_ops,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index f52df6836045..52a9588462ce 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -705,7 +705,7 @@ static const struct dev_pm_ops cedrus_dev_pm_ops = {
 
 static struct platform_driver cedrus_driver = {
 	.probe		= cedrus_probe,
-	.remove_new	= cedrus_remove,
+	.remove		= cedrus_remove,
 	.driver		= {
 		.name		= CEDRUS_NAME,
 		.of_match_table	= cedrus_dt_match,
diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
index 58f8ae92320d..6877f2beee8c 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
@@ -536,7 +536,7 @@ MODULE_DEVICE_TABLE(of, sun6i_isp_of_match);
 
 static struct platform_driver sun6i_isp_platform_driver = {
 	.probe	= sun6i_isp_probe,
-	.remove_new = sun6i_isp_remove,
+	.remove = sun6i_isp_remove,
 	.driver	= {
 		.name		= SUN6I_ISP_NAME,
 		.of_match_table	= sun6i_isp_of_match,
diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 255cccd0c5fd..604185c00a1a 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -858,5 +858,5 @@ struct platform_driver tegra_csi_driver = {
 		.pm		= &tegra_csi_pm_ops,
 	},
 	.probe			= tegra_csi_probe,
-	.remove_new		= tegra_csi_remove,
+	.remove			= tegra_csi_remove,
 };
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 57a856a21e90..c068dfedd97a 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1979,5 +1979,5 @@ struct platform_driver tegra_vi_driver = {
 		.pm = &tegra_vi_pm_ops,
 	},
 	.probe = tegra_vi_probe,
-	.remove_new = tegra_vi_remove,
+	.remove = tegra_vi_remove,
 };
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index 8504b9ea9cea..5ec717f3afd5 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -281,5 +281,5 @@ struct platform_driver tegra_vip_driver = {
 		.of_match_table	= tegra_vip_of_id_table,
 	},
 	.probe			= tegra_vip_probe,
-	.remove_new		= tegra_vip_remove,
+	.remove			= tegra_vip_remove,
 };
diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index ed6a9cc88541..dad2abe6c0c9 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -1090,7 +1090,7 @@ MODULE_DEVICE_TABLE(of, dim2_of_match);
 
 static struct platform_driver dim2_driver = {
 	.probe = dim2_probe,
-	.remove_new = dim2_remove,
+	.remove = dim2_remove,
 	.driver = {
 		.name = "hdm_dim2",
 		.of_match_table = dim2_of_match,
diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 977f8fc29e63..263774e6a78c 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -952,7 +952,7 @@ MODULE_DEVICE_TABLE(of, nvidia_nvec_of_match);
 
 static struct platform_driver nvec_device_driver = {
 	.probe   = tegra_nvec_probe,
-	.remove_new = tegra_nvec_remove,
+	.remove = tegra_nvec_remove,
 	.driver  = {
 		.name = "nvec",
 		.pm = &nvec_pm_ops,
diff --git a/drivers/staging/nvec/nvec_kbd.c b/drivers/staging/nvec/nvec_kbd.c
index d0259c80f810..d2b91318f151 100644
--- a/drivers/staging/nvec/nvec_kbd.c
+++ b/drivers/staging/nvec/nvec_kbd.c
@@ -175,7 +175,7 @@ static void nvec_kbd_remove(struct platform_device *pdev)
 
 static struct platform_driver nvec_kbd_driver = {
 	.probe  = nvec_kbd_probe,
-	.remove_new = nvec_kbd_remove,
+	.remove = nvec_kbd_remove,
 	.driver = {
 		.name = "nvec-kbd",
 	},
diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
index 9943b1fff190..e0e67a3eb722 100644
--- a/drivers/staging/nvec/nvec_power.c
+++ b/drivers/staging/nvec/nvec_power.c
@@ -433,7 +433,7 @@ static void nvec_power_remove(struct platform_device *pdev)
 
 static struct platform_driver nvec_power_driver = {
 	.probe = nvec_power_probe,
-	.remove_new = nvec_power_remove,
+	.remove = nvec_power_remove,
 	.driver = {
 		   .name = "nvec-power",
 	}
diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_ps2.c
index f34016c4a26b..575233fa1677 100644
--- a/drivers/staging/nvec/nvec_ps2.c
+++ b/drivers/staging/nvec/nvec_ps2.c
@@ -175,7 +175,7 @@ static SIMPLE_DEV_PM_OPS(nvec_mouse_pm_ops, nvec_mouse_suspend,
 
 static struct platform_driver nvec_mouse_driver = {
 	.probe  = nvec_mouse_probe,
-	.remove_new = nvec_mouse_remove,
+	.remove = nvec_mouse_remove,
 	.driver = {
 		.name = "nvec-mouse",
 		.pm = &nvec_mouse_pm_ops,
diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index a5e99cc78a45..eadb74fc14c8 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -977,7 +977,7 @@ MODULE_DEVICE_TABLE(of, cvm_oct_match);
 
 static struct platform_driver cvm_oct_driver = {
 	.probe		= cvm_oct_probe,
-	.remove_new	= cvm_oct_remove,
+	.remove		= cvm_oct_remove,
 	.driver		= {
 		.name	= KBUILD_MODNAME,
 		.of_match_table = cvm_oct_match,
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 3dbeffc650d3..e09642a19243 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1799,7 +1799,7 @@ static struct platform_driver vchiq_driver = {
 		.of_match_table = vchiq_of_match,
 	},
 	.probe = vchiq_probe,
-	.remove_new = vchiq_remove,
+	.remove = vchiq_remove,
 };
 
 static int __init vchiq_driver_init(void)
-- 
2.25.1

