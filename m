Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F79CBA2D
	for <linux-staging@lists.linux.dev>; Fri, 11 Oct 2024 07:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728630522; cv=none; b=b3D5HkvLl4vXiNvA6m47Qb/RIPbl+Gdsqbu+698eeywiNfJKvNCOcPACfe9ugoSFZn+qAMbjWB17i6miwyzqDtw/IZmbHalAceIl3skkxv7vT28o0sqXjrWEDwNBFx7BblkOvAuOPxIO4JzpybU/RbAICeSKeQJUyD72ilXK1MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728630522; c=relaxed/simple;
	bh=40wYFZBcZ/Te1mbbzlNsq6UqMGnE/MY0olWXqzd3wUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lrwGFRV2W3liURspbNhxG2ka5rzhT9b2PBr90PKvfwBmRb43FCPAkSB4fEUwg7rQxtFGPts0QhgWtfXS+duM3pitwwUJFO/efdrEOUj0FWnph6hLD/Up7CVqFhYGBynt3cmfwbLT/9Lyx4QZS/GfMcubRXm/nLhehmRt37E8RSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=3bdn8VAF; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3bdn8VAF"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9977360f9fso225905666b.0
        for <linux-staging@lists.linux.dev>; Fri, 11 Oct 2024 00:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728630517; x=1729235317; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7VI4KHP9U51D6NEqmqYWaYC/FRMc55B2SsfTAfcfm8g=;
        b=3bdn8VAFCTeCFADiSuddfq2QvbLdwj8f09auJ7zlLw7zGAivQ4A1KwGtCheVZkI5UA
         hDN7THOusrgHDUyYGXVHBg3LMtDc6h6FPnDTRyw0ayNDE/577LqB6+fwfjxWx1wJivcs
         T1lhk/zcQH6H/rVV15YlJ4+9n6du7HOFXD6So2vt7tSxxHbUY/msue3nJRVZEThVhqrc
         gtpeekHDdPY/1+jc5zKQNuALFSg4xDwWcH9YzgjdWtZ1V8gXEoHUeYD/wUPPoTXqt4xY
         llhHOi5UJHu7HT+y5mjx/bjzTREOmXAiZjl2k03NsjI5BFErCyihvm95nA6uyozBlXxQ
         2JWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728630517; x=1729235317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VI4KHP9U51D6NEqmqYWaYC/FRMc55B2SsfTAfcfm8g=;
        b=ffJ63QgthGcKpjbg0s/R8KrM2zcgCsVF+VrqojxkvEnaPnEGkkhxt5DSOl4Nsf5w1J
         FnIhbhIZdeM8LR41BxwgJiCn/jsPyDVQQs2zmsQ3Y9cZUzXulghoQl1p6yzHGZrGn1Ot
         ucevQCODz3ol5m1yCRrzOvRSGoUEY3hQnKkMZ/y31iGYa7Sc89F7omlqT14MIkScT+0f
         Je46vFv+/4kNxahui6xkTJvr5APj9aZzSSS3wTygzxsm5mI/p+3X+4wqw/otd/9tfhoq
         XsAtrDYJOqiMc6iyEXjrH9xorvZ8JvgKh7nr8kEU+h6S+Sbqmymk+6wzrQmCCo74cPn7
         p0bA==
X-Forwarded-Encrypted: i=1; AJvYcCW71dt58D6uawTQsWiK3sfWjxSCKXsF3PP8ulJzWIRxwwXz7m/5NZ6ifKvRf/tBJg13z7FGT7J2aOvHC26E@lists.linux.dev
X-Gm-Message-State: AOJu0YxUn9rg+He36ivxAS7iXmRn+PT1bAMf1jVuMgLyA3IE8QErSHpG
	TGuAig/BBblXHfX6Q5IuSH0c6YNJKK5vbingKfDcTCQy17UMb5H7S9u7vjEwBgw4dH0YJmxUY3o
	B
X-Google-Smtp-Source: AGHT+IEZslF3NGC0nGSGq7OftwMgboriVGVfT4Scg1kbCqjVL4BDUS6eSKayekjyYeoVF55yyenE6Q==
X-Received: by 2002:a17:907:d847:b0:a99:4b63:f810 with SMTP id a640c23a62f3a-a99b9604801mr131333066b.46.1728630516586;
        Fri, 11 Oct 2024 00:08:36 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7ec5747sm179759566b.37.2024.10.11.00.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 00:08:36 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2] staging: media: Switch back to struct platform_driver::remove()
Date: Fri, 11 Oct 2024 09:08:29 +0200
Message-ID: <20241011070828.851449-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=8777; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=40wYFZBcZ/Te1mbbzlNsq6UqMGnE/MY0olWXqzd3wUI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnCM7sVOl8GsJ83/sU5zXAr5GICuKp3zpN6YIrb 5SQJS7DYjCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZwjO7AAKCRCPgPtYfRL+ TstDB/wJcZvOdbNHYarXkzj3sSNxuMD6MUY4puG5Nyctoc1/ZMZAgOcZZMWFfiY4b9E8UG+IWs2 tLpcIu0QaSINnn7irLeVU60bGCaVpuVJIul8x4pmBjveRnQ8PDMLN26YqtXfBvf0FAxPahW5X+C iWghz3Ptsf2o6K1WZMt/FWwsaXViJj9uOzolBJrDAXpEGY7Y5ZCAUbVgXYDl93hHfK4666xzuew uhKG6sEg7qi6lPkJDLAW+nwl4bmYFVQlZEE8uqu5qvdmp8fWrSf+nl9XZY7g3OY6Vx95tixzlmN a3vZZTwsf+A4nV7lP6z/2TUIJK1WajuiZD8Nr9fKtEMWrpuB
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/staging/media/ to use
.remove(), with the eventual goal to drop struct
platform_driver::remove_new(). As .remove() and .remove_new() have the
same prototypes, conversion is done by just changing the structure
member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

just rebase to
https://gitlab.freedesktop.org/linux-media/media-committers.git next
to make the CI happy. The only change is that the adaption for
drivers/staging/media/omap4iss/iss.c is dropped from v2 as this file was
deleted in above branch (since yesterday's next).

v1 available at https://lore.kernel.org/linux-media/20241011055540.844629-2-u.kleine-koenig@baylibre.com

Best regards
Uwe

 drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c | 2 +-
 drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c | 2 +-
 drivers/staging/media/imx/imx-media-csi.c                  | 2 +-
 drivers/staging/media/imx/imx-media-dev.c                  | 2 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c                 | 2 +-
 drivers/staging/media/meson/vdec/vdec.c                    | 2 +-
 drivers/staging/media/rkvdec/rkvdec.c                      | 2 +-
 drivers/staging/media/starfive/camss/stf-camss.c           | 2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c                | 2 +-
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c          | 2 +-
 drivers/staging/media/tegra-video/csi.c                    | 2 +-
 drivers/staging/media/tegra-video/vi.c                     | 2 +-
 drivers/staging/media/tegra-video/vip.c                    | 2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
index 712f916f0935..bc360875516c 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
@@ -629,7 +629,7 @@ MODULE_DEVICE_TABLE(of, atmel_isc_of_match);
 
 static struct platform_driver atmel_isc_driver = {
 	.probe	= atmel_isc_probe,
-	.remove_new = atmel_isc_remove,
+	.remove	= atmel_isc_remove,
 	.driver	= {
 		.name		= "atmel-sama5d2-isc",
 		.pm		= &atmel_isc_dev_pm_ops,
diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
index 9485167d5b7d..c62985e502e4 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
@@ -592,7 +592,7 @@ MODULE_DEVICE_TABLE(of, microchip_xisc_of_match);
 
 static struct platform_driver microchip_xisc_driver = {
 	.probe	= microchip_xisc_probe,
-	.remove_new = microchip_xisc_remove,
+	.remove	= microchip_xisc_remove,
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
index 58f8ae92320d..f087643ea2cb 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
@@ -536,7 +536,7 @@ MODULE_DEVICE_TABLE(of, sun6i_isp_of_match);
 
 static struct platform_driver sun6i_isp_platform_driver = {
 	.probe	= sun6i_isp_probe,
-	.remove_new = sun6i_isp_remove,
+	.remove	= sun6i_isp_remove,
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

base-commit: 4115edeff98f2ce9f821a8bddcd7a646cfdde77a
-- 
2.45.2

