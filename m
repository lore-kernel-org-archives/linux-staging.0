Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3D86D19
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 01:30:24 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id x27so38185135lfu.5
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 18:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kVewrQPLqMIzX/eUr1ccRXf6dVPwW04CHGi9g8P6H2I=;
        b=Ngw0q21CDl+yxQ7xI6sFiWFDLy1/jXJWCzDmmHgTyR7UHFdWvRHsZx+fwwbTxV2Cyv
         gN6KKIyDdmn9trt+zxJhnrKxJcVQ+dnkic/3q9GtmrOvXqnunqZ+3rLOZ5UuPH5SKRXQ
         wHnnssBODCzWhAf3IXJsR51tcgLbdYamJQnd58q7DpKGQ4YxYliB2agkeVrrv0VQH3WD
         yX57PPPDbCytK20teu7FFGxH65vic3f2b3gEAv0Mzw0Wl85PutrUYT2zIxxGhQmXSuej
         il2Sc7DptAVhnwSP4QkipTWxTtJR6TstiShQkQRUQrPcr1noWm9NKLF1HbC63QkYiuH+
         PRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kVewrQPLqMIzX/eUr1ccRXf6dVPwW04CHGi9g8P6H2I=;
        b=iI8lQsROBlRKX3+0Rplp/DBKqt36byrLE5LwIcY8I4fIiAfFgI9qbi4Xe9pAvZoyRI
         qblhLZOYHjlgnIHzXfiNqZrmMRiqURWvJ4Xle3zTIw62DQsBfUWjhP6ob1c3tjMBLVbM
         kxZVOiZP/5DUAxffHEldB656hUXo5ivaGO+H3rW6DOQZWL7KpNRZ2dsKKX+sZrxoYM9W
         rg82sz75/xPVsaRBoG0KX0hMBcn+AyEqWhUYxjqw5Ve/kqF/j0BdMV3MHflilqO7CPLR
         BAFEr97QiC0jrAKgzBYY8sQJ7jZ/8pKmk2C4YXUHhbSgWHAPkuGLXVyrW0mkEcssCNWy
         IFlQ==
X-Gm-Message-State: AOAM530lqK5xFeiaFhuYkO1FflN2IWZBIdIdJ9j1jt3dE2Gp9AxdPcRu
	ucprGnM16AhlXXmiSIgiEGs=
X-Google-Smtp-Source: ABdhPJwQhGPy+Iac60Z/w+/X1SqDXqcJNZewEFmLnX1JN/Qye3BOu6cFpYRzvaojzNHG7UQlI4Pj5A==
X-Received: by 2002:a05:6512:304a:: with SMTP id b10mr522160lfb.442.1629163823026;
        Mon, 16 Aug 2021 18:30:23 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru. [46.138.85.91])
        by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 18:30:22 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Peter Chen <peter.chen@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Lucas Stach <dev@lynxeye.de>,
	Stefan Agner <stefan@agner.ch>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-spi@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v8 18/34] bus: tegra-gmi: Add runtime PM and OPP support
Date: Tue, 17 Aug 2021 04:27:38 +0300
Message-Id: <20210817012754.8710-19-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GMI bus on Tegra belongs to the core power domain and we're going to
enable GENPD support for the core domain. Now GMI must be resumed using
runtime PM API in order to initialize the GMI power state. Add runtime PM
and OPP support to the GMI driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/bus/tegra-gmi.c | 92 ++++++++++++++++++++++++++++++-----------
 1 file changed, 68 insertions(+), 24 deletions(-)

diff --git a/drivers/bus/tegra-gmi.c b/drivers/bus/tegra-gmi.c
index a6570789f7af..51cac6822f20 100644
--- a/drivers/bus/tegra-gmi.c
+++ b/drivers/bus/tegra-gmi.c
@@ -13,8 +13,12 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
+#include <soc/tegra/common.h>
+
 #define TEGRA_GMI_CONFIG		0x00
 #define TEGRA_GMI_CONFIG_GO		BIT(31)
 #define TEGRA_GMI_BUS_WIDTH_32BIT	BIT(30)
@@ -54,36 +58,20 @@ static int tegra_gmi_enable(struct tegra_gmi *gmi)
 {
 	int err;
 
-	err = clk_prepare_enable(gmi->clk);
-	if (err < 0) {
-		dev_err(gmi->dev, "failed to enable clock: %d\n", err);
+	pm_runtime_enable(gmi->dev);
+	err = pm_runtime_resume_and_get(gmi->dev);
+	if (err) {
+		pm_runtime_disable(gmi->dev);
 		return err;
 	}
 
-	reset_control_assert(gmi->rst);
-	usleep_range(2000, 4000);
-	reset_control_deassert(gmi->rst);
-
-	writel(gmi->snor_timing0, gmi->base + TEGRA_GMI_TIMING0);
-	writel(gmi->snor_timing1, gmi->base + TEGRA_GMI_TIMING1);
-
-	gmi->snor_config |= TEGRA_GMI_CONFIG_GO;
-	writel(gmi->snor_config, gmi->base + TEGRA_GMI_CONFIG);
-
 	return 0;
 }
 
 static void tegra_gmi_disable(struct tegra_gmi *gmi)
 {
-	u32 config;
-
-	/* stop GMI operation */
-	config = readl(gmi->base + TEGRA_GMI_CONFIG);
-	config &= ~TEGRA_GMI_CONFIG_GO;
-	writel(config, gmi->base + TEGRA_GMI_CONFIG);
-
-	reset_control_assert(gmi->rst);
-	clk_disable_unprepare(gmi->clk);
+	pm_runtime_put(gmi->dev);
+	pm_runtime_disable(gmi->dev);
 }
 
 static int tegra_gmi_parse_dt(struct tegra_gmi *gmi)
@@ -213,6 +201,7 @@ static int tegra_gmi_probe(struct platform_device *pdev)
 	if (!gmi)
 		return -ENOMEM;
 
+	platform_set_drvdata(pdev, gmi);
 	gmi->dev = dev;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -232,6 +221,10 @@ static int tegra_gmi_probe(struct platform_device *pdev)
 		return PTR_ERR(gmi->rst);
 	}
 
+	err = devm_tegra_core_dev_init_opp_table_simple(&pdev->dev);
+	if (err)
+		return err;
+
 	err = tegra_gmi_parse_dt(gmi);
 	if (err)
 		return err;
@@ -247,8 +240,6 @@ static int tegra_gmi_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	platform_set_drvdata(pdev, gmi);
-
 	return 0;
 }
 
@@ -262,6 +253,58 @@ static int tegra_gmi_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int __maybe_unused tegra_gmi_runtime_resume(struct device *dev)
+{
+	struct tegra_gmi *gmi = dev_get_drvdata(dev);
+	int err;
+
+	err = dev_pm_opp_sync(gmi->dev);
+	if (err) {
+		dev_err(gmi->dev, "failed to sync OPP: %d\n", err);
+		return err;
+	}
+
+	err = clk_prepare_enable(gmi->clk);
+	if (err < 0) {
+		dev_err(gmi->dev, "failed to enable clock: %d\n", err);
+		return err;
+	}
+
+	reset_control_assert(gmi->rst);
+	usleep_range(2000, 4000);
+	reset_control_deassert(gmi->rst);
+
+	writel(gmi->snor_timing0, gmi->base + TEGRA_GMI_TIMING0);
+	writel(gmi->snor_timing1, gmi->base + TEGRA_GMI_TIMING1);
+
+	gmi->snor_config |= TEGRA_GMI_CONFIG_GO;
+	writel(gmi->snor_config, gmi->base + TEGRA_GMI_CONFIG);
+
+	return 0;
+}
+
+static int __maybe_unused tegra_gmi_runtime_suspend(struct device *dev)
+{
+	struct tegra_gmi *gmi = dev_get_drvdata(dev);
+	u32 config;
+
+	/* stop GMI operation */
+	config = readl(gmi->base + TEGRA_GMI_CONFIG);
+	config &= ~TEGRA_GMI_CONFIG_GO;
+	writel(config, gmi->base + TEGRA_GMI_CONFIG);
+
+	reset_control_assert(gmi->rst);
+
+	clk_disable_unprepare(gmi->clk);
+
+	return 0;
+}
+
+static const struct dev_pm_ops tegra_gmi_pm = {
+	SET_RUNTIME_PM_OPS(tegra_gmi_runtime_suspend, tegra_gmi_runtime_resume,
+			   NULL)
+};
+
 static const struct of_device_id tegra_gmi_id_table[] = {
 	{ .compatible = "nvidia,tegra20-gmi", },
 	{ .compatible = "nvidia,tegra30-gmi", },
@@ -275,6 +318,7 @@ static struct platform_driver tegra_gmi_driver = {
 	.driver = {
 		.name		= "tegra-gmi",
 		.of_match_table	= tegra_gmi_id_table,
+		.pm = &tegra_gmi_pm,
 	},
 };
 module_platform_driver(tegra_gmi_driver);
-- 
2.32.0

