Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273453FC3
	for <linux-staging@lists.linux.dev>; Sun, 12 Sep 2021 20:10:19 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id b6so11291354wrh.10
        for <linux-staging@lists.linux.dev>; Sun, 12 Sep 2021 13:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TplqdteIbqpMA+cRsM4zt2txSdRrivaAa9SZu7q2V5k=;
        b=G0spcEnCzOQCkuNQgfrt9aJ1s9cBMwbonJ21TiGcPfDH6BwdcSAKB34wnjhKexl1aX
         l4QKGmRZilMs7SIMnsyw/rzMW6Tq89W0VtF00UUpWh39GqdRIeJlpORK0Sm6pzwg12UU
         A9ns1EUAcijc8JvCglvlpmlJp8eB5LZeDDHQQe4+0e/fcg+b75UHm/se/iYa5CJAyyvO
         g/Bv0tRIsHs06qgWJ49GwtSqQp0iStg29EIqZA8Iv1iGZ+DC2i7FLd9aX8PKc82j9r5K
         N4R9eOcakSQ2dMJpvhQ6vKuDg6bAPiCCyUoMFFFgJoc3QG11NvM5MKSucOKzgHCGn6Ed
         gZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TplqdteIbqpMA+cRsM4zt2txSdRrivaAa9SZu7q2V5k=;
        b=HEXxquF9LAAajN99Z6nxamVYQnR03XfpVtfCcsnppOoDZJr88uDbsP4riXKuDpFy6j
         Fa7LPlTVVM/phL/OZ/3K9mnaNYMeYn7HZvCBFGqJbGxPem/Ln7v8HLPVOndZijktgOtZ
         UiN2fhv7AJRfNCSsX4R/4/L9lqBG8goLi+OKa6BA1S7q6VlwjE7kOh6lO53Ejm6WYBqJ
         t5udVor3xJ91pRbwBdj0M8l4OsxTApZgJKSWXot4Oirm/ipG4lq+yro1Nde4Xu/EFdvV
         ltuPgvG9YTET6k8lqvHS+zY6GLzJ10SnXsptyhk4rGm/CQcggg+H+/UrcDafm9nFmCx/
         X1UA==
X-Gm-Message-State: AOAM5300ZqoyoZ93OCQCv84QgLmV921tIH2pO8gFZZmuZEQdXJnDm6DP
	548tSFAS61fYumQq1UF/bGk=
X-Google-Smtp-Source: ABdhPJygGmsQdbqJ3F8jYp9/me38locbgNBHzvCseDlDLbb0hvBjdzuJidprL1L6Sn7B6LE3nPX+FA==
X-Received: by 2002:adf:c18d:: with SMTP id x13mr8991443wre.380.1631477417535;
        Sun, 12 Sep 2021 13:10:17 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru. [46.138.83.36])
        by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 13:10:17 -0700 (PDT)
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
Subject: [PATCH v11 18/34] pwm: tegra: Add runtime PM and OPP support
Date: Sun, 12 Sep 2021 23:08:16 +0300
Message-Id: <20210912200832.12312-19-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912200832.12312-1-digetx@gmail.com>
References: <20210912200832.12312-1-digetx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PWM on Tegra belongs to the core power domain and we're going to
enable GENPD support for the core domain. Now PWM must be resumed using
runtime PM API in order to initialize the PWM power state. The PWM clock
rate must be changed using OPP API that will reconfigure the power domain
performance state in accordance to the rate. Add runtime PM and OPP
support to the PWM driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/pwm/pwm-tegra.c | 88 ++++++++++++++++++++++++++++++++---------
 1 file changed, 70 insertions(+), 18 deletions(-)

diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c
index 11a10b575ace..afb5ecde007e 100644
--- a/drivers/pwm/pwm-tegra.c
+++ b/drivers/pwm/pwm-tegra.c
@@ -42,12 +42,16 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/pm_opp.h>
 #include <linux/pwm.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/reset.h>
 
+#include <soc/tegra/common.h>
+
 #define PWM_ENABLE	(1 << 31)
 #define PWM_DUTY_WIDTH	8
 #define PWM_DUTY_SHIFT	16
@@ -145,7 +149,7 @@ static int tegra_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		required_clk_rate =
 			(NSEC_PER_SEC / period_ns) << PWM_DUTY_WIDTH;
 
-		err = clk_set_rate(pc->clk, required_clk_rate);
+		err = dev_pm_opp_set_rate(pc->dev, required_clk_rate);
 		if (err < 0)
 			return -EINVAL;
 
@@ -181,8 +185,8 @@ static int tegra_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	 * before writing the register. Otherwise, keep it enabled.
 	 */
 	if (!pwm_is_enabled(pwm)) {
-		err = clk_prepare_enable(pc->clk);
-		if (err < 0)
+		err = pm_runtime_resume_and_get(pc->dev);
+		if (err)
 			return err;
 	} else
 		val |= PWM_ENABLE;
@@ -193,7 +197,7 @@ static int tegra_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	 * If the PWM is not enabled, turn the clock off again to save power.
 	 */
 	if (!pwm_is_enabled(pwm))
-		clk_disable_unprepare(pc->clk);
+		pm_runtime_put(pc->dev);
 
 	return 0;
 }
@@ -204,8 +208,8 @@ static int tegra_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
 	int rc = 0;
 	u32 val;
 
-	rc = clk_prepare_enable(pc->clk);
-	if (rc < 0)
+	rc = pm_runtime_resume_and_get(pc->dev);
+	if (rc)
 		return rc;
 
 	val = pwm_readl(pc, pwm->hwpwm);
@@ -224,7 +228,7 @@ static void tegra_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
 	val &= ~PWM_ENABLE;
 	pwm_writel(pc, pwm->hwpwm, val);
 
-	clk_disable_unprepare(pc->clk);
+	pm_runtime_put_sync(pc->dev);
 }
 
 static const struct pwm_ops tegra_pwm_ops = {
@@ -256,11 +260,23 @@ static int tegra_pwm_probe(struct platform_device *pdev)
 	if (IS_ERR(pwm->clk))
 		return PTR_ERR(pwm->clk);
 
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
+
 	/* Set maximum frequency of the IP */
-	ret = clk_set_rate(pwm->clk, pwm->soc->max_frequency);
+	ret = dev_pm_opp_set_rate(pwm->dev, pwm->soc->max_frequency);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to set max frequency: %d\n", ret);
-		return ret;
+		goto put_pm;
 	}
 
 	/*
@@ -278,7 +294,7 @@ static int tegra_pwm_probe(struct platform_device *pdev)
 	if (IS_ERR(pwm->rst)) {
 		ret = PTR_ERR(pwm->rst);
 		dev_err(&pdev->dev, "Reset control is not found: %d\n", ret);
-		return ret;
+		goto put_pm;
 	}
 
 	reset_control_deassert(pwm->rst);
@@ -291,34 +307,67 @@ static int tegra_pwm_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		dev_err(&pdev->dev, "pwmchip_add() failed: %d\n", ret);
 		reset_control_assert(pwm->rst);
-		return ret;
+		goto put_pm;
 	}
 
+	pm_runtime_put(&pdev->dev);
+
 	return 0;
+put_pm:
+	pm_runtime_put(&pdev->dev);
+	return ret;
 }
 
 static int tegra_pwm_remove(struct platform_device *pdev)
 {
 	struct tegra_pwm_chip *pc = platform_get_drvdata(pdev);
+	int err;
 
 	pwmchip_remove(&pc->chip);
 
+	err = pm_runtime_resume_and_get(pc->dev);
+	if (err)
+		return err;
+
 	reset_control_assert(pc->rst);
+	pm_runtime_put(pc->dev);
 
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int tegra_pwm_suspend(struct device *dev)
+static int __maybe_unused tegra_pwm_runtime_suspend(struct device *dev)
 {
-	return pinctrl_pm_select_sleep_state(dev);
+	struct tegra_pwm_chip *pc = dev_get_drvdata(dev);
+	int err;
+
+	clk_disable_unprepare(pc->clk);
+
+	err = pinctrl_pm_select_sleep_state(dev);
+	if (err) {
+		clk_prepare_enable(pc->clk);
+		return err;
+	}
+
+	return 0;
 }
 
-static int tegra_pwm_resume(struct device *dev)
+static int __maybe_unused tegra_pwm_runtime_resume(struct device *dev)
 {
-	return pinctrl_pm_select_default_state(dev);
+	struct tegra_pwm_chip *pc = dev_get_drvdata(dev);
+	int err;
+
+	err = pinctrl_pm_select_default_state(dev);
+	if (err)
+		return err;
+
+	err = clk_prepare_enable(pc->clk);
+	if (err) {
+		pinctrl_pm_select_sleep_state(dev);
+		return err;
+	}
+
+	return 0;
 }
-#endif
 
 static const struct tegra_pwm_soc tegra20_pwm_soc = {
 	.num_channels = 4,
@@ -344,7 +393,10 @@ static const struct of_device_id tegra_pwm_of_match[] = {
 MODULE_DEVICE_TABLE(of, tegra_pwm_of_match);
 
 static const struct dev_pm_ops tegra_pwm_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(tegra_pwm_suspend, tegra_pwm_resume)
+	SET_RUNTIME_PM_OPS(tegra_pwm_runtime_suspend, tegra_pwm_runtime_resume,
+			   NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static struct platform_driver tegra_pwm_driver = {
-- 
2.32.0

