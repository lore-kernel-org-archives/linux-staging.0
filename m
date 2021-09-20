Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EEB3FCC
	for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 18:12:25 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id b15so52884325lfe.7
        for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 11:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bHhQzalkL4HJ+6Pj2vchyrjPmLkUiKGrqSO4eo7D4QI=;
        b=QX2xNvQxTCFlcCP6Bb7nyEQFApx252nqY8XkhXt5afJ7eILF0NjCF5276aoYGDyN/X
         CoDF9iuNmMvhBtq7X3z7G5x7uGmdkkdae1Osq34IMXvihfWpEsdJ6dsR3EVMYEuC4d21
         AMXfB+7Ir5NUcPdRcWelpzJi6rcKBGnUwoQW4zBRpDwUmiRoVbpxdoHxd9rx1vd1BRgJ
         xeDw6QiJE0XZjZcRHYa6y5PO0lUG5N0F2HdMeePLVwtu9Tdb+JOWLrI4UbGzur9p5L4S
         6/TqbIIxoSz/qzUOR79UswnauYFph5CtUoojh3/I4bbQJGoejmV9p009PJhMR10BpcQ4
         1U6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bHhQzalkL4HJ+6Pj2vchyrjPmLkUiKGrqSO4eo7D4QI=;
        b=MA8Afra5Y0Up71WuPCimBSVIsRDoBn78LNp8iZS7AED2NyNgYGfLRjumDG1xfE8axc
         pD6ntCOicUMkaXvnXbmDa2+YalQfoiDAyYTxp0FFdnZ79PAqYpElSFIykVkX8+yF8w8v
         igTeUOWNew+xivLyHvC6GJEyRxUR5IxuhNgvzvtNPVoJj/aTRQ5LHdbYngwCpjBntSAO
         fizL8vScCacRp2jPPZeisPjmYtCvhBfiUkocI8MrZ5Dpm+wTeDYdoX3XaY/OXW7vRFsi
         0qFA8lbuICtsSaqncQRM6I7cbp91ap0aGIEwoHOuHNvWIYbqzvhSsQNG/uXrwNAZityR
         TsQw==
X-Gm-Message-State: AOAM532JJ4PAPGpZ3fnhDA3LwAl9GWx1kkx3mD7HssZR1qm7+8gNxoLi
	ciTSuMhU3VoKHddPvL6JoOw=
X-Google-Smtp-Source: ABdhPJxl8ZXALhmfr8D/lOOzfy/DiAFlumABJ3V1PTBrwbfqBGWBRN8X326HimyKQrX9JgL1vOVkPA==
X-Received: by 2002:ac2:484e:: with SMTP id 14mr21015703lfy.140.1632161543269;
        Mon, 20 Sep 2021 11:12:23 -0700 (PDT)
Received: from localhost.localdomain (46-138-151-206.dynamic.spd-mgts.ru. [46.138.151.206])
        by smtp.gmail.com with ESMTPSA id u3sm1775677lju.107.2021.09.20.11.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 11:12:23 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Peter Chen <peter.chen@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Nishanth Menon <nm@ti.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-pwm@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Lucas Stach <dev@lynxeye.de>,
	Stefan Agner <stefan@agner.ch>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	David Heidelberg <david@ixit.cz>
Subject: [PATCH v12 19/35] mmc: sdhci-tegra: Add runtime PM and OPP support
Date: Mon, 20 Sep 2021 21:11:29 +0300
Message-Id: <20210920181145.19543-20-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210920181145.19543-1-digetx@gmail.com>
References: <20210920181145.19543-1-digetx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SDHCI on Tegra belongs to the core power domain and we're going to
enable GENPD support for the core domain. Now SDHCI must be resumed using
runtime PM API in order to initialize the SDHCI power state. The SDHCI
clock rate must be changed using OPP API that will reconfigure the power
domain performance state in accordance to the rate. Add runtime PM and OPP
support to the SDHCI driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mmc/host/sdhci-tegra.c | 80 +++++++++++++++++++++++++++-------
 1 file changed, 64 insertions(+), 16 deletions(-)

diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index a5001875876b..71955150dc43 100644
--- a/drivers/mmc/host/sdhci-tegra.c
+++ b/drivers/mmc/host/sdhci-tegra.c
@@ -15,6 +15,8 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/mmc/card.h>
@@ -24,6 +26,8 @@
 #include <linux/gpio/consumer.h>
 #include <linux/ktime.h>
 
+#include <soc/tegra/common.h>
+
 #include "sdhci-pltfm.h"
 #include "cqhci.h"
 
@@ -760,7 +764,9 @@ static void tegra_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_tegra *tegra_host = sdhci_pltfm_priv(pltfm_host);
+	struct device *dev = mmc_dev(host->mmc);
 	unsigned long host_clk;
+	int err;
 
 	if (!clock)
 		return sdhci_set_clock(host, clock);
@@ -778,7 +784,12 @@ static void tegra_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 	 * from clk_get_rate() is used.
 	 */
 	host_clk = tegra_host->ddr_signaling ? clock * 2 : clock;
-	clk_set_rate(pltfm_host->clk, host_clk);
+
+	err = dev_pm_opp_set_rate(dev, host_clk);
+	if (err)
+		dev_err(dev, "failed to set clk rate to %luHz: %d\n",
+			host_clk, err);
+
 	tegra_host->curr_clk_rate = host_clk;
 	if (tegra_host->ddr_signaling)
 		host->max_clk = host_clk;
@@ -1705,7 +1716,6 @@ static int sdhci_tegra_probe(struct platform_device *pdev)
 				   "failed to get clock\n");
 		goto err_clk_get;
 	}
-	clk_prepare_enable(clk);
 	pltfm_host->clk = clk;
 
 	tegra_host->rst = devm_reset_control_get_exclusive(&pdev->dev,
@@ -1716,15 +1726,25 @@ static int sdhci_tegra_probe(struct platform_device *pdev)
 		goto err_rst_get;
 	}
 
+	pm_runtime_enable(&pdev->dev);
+
+	rc = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
+	if (rc)
+		goto err_pm_get;
+
+	rc = pm_runtime_resume_and_get(&pdev->dev);
+	if (rc)
+		goto err_pm_get;
+
 	rc = reset_control_assert(tegra_host->rst);
 	if (rc)
-		goto err_rst_get;
+		goto err_rst_assert;
 
 	usleep_range(2000, 4000);
 
 	rc = reset_control_deassert(tegra_host->rst);
 	if (rc)
-		goto err_rst_get;
+		goto err_rst_assert;
 
 	usleep_range(2000, 4000);
 
@@ -1736,8 +1756,11 @@ static int sdhci_tegra_probe(struct platform_device *pdev)
 
 err_add_host:
 	reset_control_assert(tegra_host->rst);
+err_rst_assert:
+	pm_runtime_put(&pdev->dev);
+err_pm_get:
+	pm_runtime_disable(&pdev->dev);
 err_rst_get:
-	clk_disable_unprepare(pltfm_host->clk);
 err_clk_get:
 	clk_disable_unprepare(tegra_host->tmclk);
 err_power_req:
@@ -1756,19 +1779,37 @@ static int sdhci_tegra_remove(struct platform_device *pdev)
 
 	reset_control_assert(tegra_host->rst);
 	usleep_range(2000, 4000);
-	clk_disable_unprepare(pltfm_host->clk);
-	clk_disable_unprepare(tegra_host->tmclk);
 
+	pm_runtime_put(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+
+	clk_disable_unprepare(tegra_host->tmclk);
 	sdhci_pltfm_free(pdev);
 
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int __maybe_unused sdhci_tegra_suspend(struct device *dev)
+static int __maybe_unused sdhci_tegra_runtime_suspend(struct device *dev)
 {
 	struct sdhci_host *host = dev_get_drvdata(dev);
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+
+	clk_disable_unprepare(pltfm_host->clk);
+
+	return 0;
+}
+
+static int __maybe_unused sdhci_tegra_runtime_resume(struct device *dev)
+{
+	struct sdhci_host *host = dev_get_drvdata(dev);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+
+	return clk_prepare_enable(pltfm_host->clk);
+}
+
+static int __maybe_unused sdhci_tegra_suspend(struct device *dev)
+{
+	struct sdhci_host *host = dev_get_drvdata(dev);
 	int ret;
 
 	if (host->mmc->caps2 & MMC_CAP2_CQE) {
@@ -1783,17 +1824,22 @@ static int __maybe_unused sdhci_tegra_suspend(struct device *dev)
 		return ret;
 	}
 
-	clk_disable_unprepare(pltfm_host->clk);
+	ret = pm_runtime_force_suspend(dev);
+	if (ret) {
+		sdhci_resume_host(host);
+		cqhci_resume(host->mmc);
+		return ret;
+	}
+
 	return 0;
 }
 
 static int __maybe_unused sdhci_tegra_resume(struct device *dev)
 {
 	struct sdhci_host *host = dev_get_drvdata(dev);
-	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	int ret;
 
-	ret = clk_prepare_enable(pltfm_host->clk);
+	ret = pm_runtime_force_resume(dev);
 	if (ret)
 		return ret;
 
@@ -1812,13 +1858,15 @@ static int __maybe_unused sdhci_tegra_resume(struct device *dev)
 suspend_host:
 	sdhci_suspend_host(host);
 disable_clk:
-	clk_disable_unprepare(pltfm_host->clk);
+	pm_runtime_force_suspend(dev);
 	return ret;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(sdhci_tegra_dev_pm_ops, sdhci_tegra_suspend,
-			 sdhci_tegra_resume);
+static const struct dev_pm_ops sdhci_tegra_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(sdhci_tegra_runtime_suspend, sdhci_tegra_runtime_resume,
+			   NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(sdhci_tegra_suspend, sdhci_tegra_resume)
+};
 
 static struct platform_driver sdhci_tegra_driver = {
 	.driver		= {
-- 
2.32.0

