Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4156D19
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 01:30:29 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id z2so38242115lft.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 18:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XL4BVrLk7WYd6afEPPAKr2OvrAlyWTvGqySuaSzvsoU=;
        b=akMX2IQiN5C+wsFejbQ7AaZ+aEU812b5i7ElnI7gcJqxm1qRG/X5nkz7zPNl/SEuMH
         QYUoyowBTGQltjI7rFnyUsvx1P3XCb2OTN8HMc5ZVPvu356dI6iNPo+FE1gI3G2skcAZ
         zA06NlaJ0U14aSpiH7ZYOwXfSia2rN6scqCmOQTUapIIluAVOffKIxK+c1yKDRTvbUY2
         3HH/mdwiEU/wLbJGKSQojE13f0Fb0t1wG+JFucgpENZr3k6Vt8XgEIqnJmTsyJD5X4NS
         LYXnAFgRsIPnmTCV8x/cfPZl/+PqCsMY81oJpWDePTLH7Xxhs3PQ8mSYbT1yqTQ/4Y3Y
         RO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XL4BVrLk7WYd6afEPPAKr2OvrAlyWTvGqySuaSzvsoU=;
        b=H0w01y1PYUMrSWnm/c9jYL/yc7Jz9JJFmJXsbBVMgfeb2ZD6tMaOpXMBl2wSgQI+Ui
         GZHCuoG+JEZo0n44phiypEIURzrgCy2apCGlpVty+tKaZI4bPMllm/ynmODm/eGz4foL
         67C9lKT8EVV+7Ad6FInrhGwRQKuxPnhHj6ToEQKLDQjz7/0j24Qjt2fapwpBudI088kW
         0T+ySLJW8RZIVWlzqLoZikp1GfspxHpyRbDFO1uhHv8jWK9j9SsPr048zN7tLrnJHi+u
         VhtiP5S8KeAlSbRIVTQeIncfGBuI33EHijaC6MVpEJ9rkQxUuxdqmOahEntk3BkuV4/r
         VY1Q==
X-Gm-Message-State: AOAM531+7srYFY1apL35Dr31ZJ4YQ5De3r7Zx+VpOYh8EhtOCWknBPU5
	9Vix/tTNB01JNucMn9kVHvw=
X-Google-Smtp-Source: ABdhPJw02p9RsEdccY59vWAtODBKBNtEXdwRJ/qwlwTWkchrOt3IUpFpHFlVjjDlgZH5cc57idRxWQ==
X-Received: by 2002:a19:f009:: with SMTP id p9mr516594lfc.227.1629163827643;
        Mon, 16 Aug 2021 18:30:27 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru. [46.138.85.91])
        by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 18:30:27 -0700 (PDT)
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
Subject: [PATCH v8 22/34] spi: tegra20-slink: Add OPP support
Date: Tue, 17 Aug 2021 04:27:42 +0300
Message-Id: <20210817012754.8710-23-digetx@gmail.com>
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

The SPI on Tegra belongs to the core power domain and we're going to
enable GENPD support for the core domain. Now SPI driver must use OPP
API for driving the controller's clock rate because OPP API takes care
of reconfiguring the domain's performance state in accordance to the
rate. Add OPP support to the driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/spi/spi-tegra20-slink.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-tegra20-slink.c b/drivers/spi/spi-tegra20-slink.c
index deff16ba6d58..37cb15dc59f7 100644
--- a/drivers/spi/spi-tegra20-slink.c
+++ b/drivers/spi/spi-tegra20-slink.c
@@ -18,12 +18,15 @@
 #include <linux/kthread.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/reset.h>
 #include <linux/spi/spi.h>
 
+#include <soc/tegra/common.h>
+
 #define SLINK_COMMAND			0x000
 #define SLINK_BIT_LENGTH(x)		(((x) & 0x1f) << 0)
 #define SLINK_WORD_SIZE(x)		(((x) & 0x1f) << 5)
@@ -683,7 +686,7 @@ static int tegra_slink_start_transfer_one(struct spi_device *spi,
 	bits_per_word = t->bits_per_word;
 	speed = t->speed_hz;
 	if (speed != tspi->cur_speed) {
-		clk_set_rate(tspi->clk, speed * 4);
+		dev_pm_opp_set_rate(tspi->dev, speed * 4);
 		tspi->cur_speed = speed;
 	}
 
@@ -1054,6 +1057,10 @@ static int tegra_slink_probe(struct platform_device *pdev)
 		goto exit_free_master;
 	}
 
+	ret = devm_tegra_core_dev_init_opp_table_simple(&pdev->dev);
+	if (ret)
+		return ret;
+
 	/* disabled clock may cause interrupt storm upon request */
 	tspi->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(tspi->clk)) {
@@ -1205,6 +1212,12 @@ static int tegra_slink_runtime_resume(struct device *dev)
 	struct tegra_slink_data *tspi = spi_master_get_devdata(master);
 	int ret;
 
+	ret = dev_pm_opp_sync(dev);
+	if (ret) {
+		dev_err(dev, "failed to sync OPP: %d\n", ret);
+		return ret;
+	}
+
 	ret = clk_prepare_enable(tspi->clk);
 	if (ret < 0) {
 		dev_err(tspi->dev, "clk_prepare failed: %d\n", ret);
-- 
2.32.0

