Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4B23FCA
	for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 18:12:35 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id b15so52886512lfe.7
        for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 11:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ao2JLfYPSHHhEgaGHBXF51D99ohQhpgr3//KrDL4XpQ=;
        b=funfhmIi0TbO+1smMB+qO0aF0O6ZOqIxqtzekHWoFAr7H7BPVioR91aM4tp8c0ifw8
         AfFlZa7d6spQJXvsse0S6Wp/vbd8UUlKX+FsggZpmcOwtN7vt0/UGNOghtVTz/ZjaZgB
         M9ZbYdhvCUjk9QDDNW7OaA2SPvYj1E7QegWtM4CEbI2Q7s+ZZ28j0TIfik0PKT4nO+AN
         nGB9wPpX1r3WcRZdvvbSaJXaPwSf3mTXbHqNclVJBBPlhZu4wHVeHDS5+ckdUfgivSKU
         nhG/SwGkZZNZOkDS4kPqIadVkcOd8deOgESChrFT5E54YwjqiF9duRTuoLBPS7IlEh8K
         KrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ao2JLfYPSHHhEgaGHBXF51D99ohQhpgr3//KrDL4XpQ=;
        b=MvjbXRaU7td0Zf2iqb0lmTMkCC5OiFmxXlfHwJOiPKbo71Se13s7LrA3tNK+D1wKJY
         NNlI3A7UZRQ9+uztygEl4Uxl0JvihzMFCR9G12Fh8S0QXvIZQufz27fcuyEqEthOLQ9e
         PryFtaxXnHk/5U9k97gQxvOvFVo98c0U5Qonm2rh19q2Rskd/X7C71UTccqClo6rOfqh
         QX4ioFTzbPN0D6xF5yrjTQo/RNIO+vHcpEaYi5KcNDU2kS4qfGuF6znqdUv5nho+odfc
         Xph0ghiUO2mMJSKvrBsBCri307WwffrZYniBrfnTwUt1G/sh87IX3k8ZaBWD09hREO3R
         kpjg==
X-Gm-Message-State: AOAM530xHUKPveMcLy37iEsV9YSkLiusffSlT1WkgNdbxvMbZWS6qAIr
	Pl/PTjFW/kOgqx75t3Bx08k=
X-Google-Smtp-Source: ABdhPJxqM8+eh3rYh3254j2nFy+UXfWSMWI+oYBsbJWEasZTugYQrzBKZrgARJmU1cc1AvTwAgCEBA==
X-Received: by 2002:a2e:a7c7:: with SMTP id x7mr24510614ljp.406.1632161553897;
        Mon, 20 Sep 2021 11:12:33 -0700 (PDT)
Received: from localhost.localdomain (46-138-151-206.dynamic.spd-mgts.ru. [46.138.151.206])
        by smtp.gmail.com with ESMTPSA id u3sm1775677lju.107.2021.09.20.11.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 11:12:33 -0700 (PDT)
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
Subject: [PATCH v12 27/35] soc/tegra: regulators: Prepare for suspend
Date: Mon, 20 Sep 2021 21:11:37 +0300
Message-Id: <20210920181145.19543-28-digetx@gmail.com>
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

Depending on hardware version, Tegra SoC may require a higher voltages
during resume from system suspend, otherwise hardware will crash. Set
SoC voltages to a nominal levels during suspend.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/regulators-tegra20.c |  99 ++++++++++++++++++++
 drivers/soc/tegra/regulators-tegra30.c | 122 +++++++++++++++++++++++++
 2 files changed, 221 insertions(+)

diff --git a/drivers/soc/tegra/regulators-tegra20.c b/drivers/soc/tegra/regulators-tegra20.c
index b8ce9fd0650d..6a2f90ab9d3e 100644
--- a/drivers/soc/tegra/regulators-tegra20.c
+++ b/drivers/soc/tegra/regulators-tegra20.c
@@ -16,7 +16,9 @@
 #include <linux/regulator/coupler.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
+#include <linux/suspend.h>
 
+#include <soc/tegra/fuse.h>
 #include <soc/tegra/pmc.h>
 
 struct tegra_regulator_coupler {
@@ -25,9 +27,12 @@ struct tegra_regulator_coupler {
 	struct regulator_dev *cpu_rdev;
 	struct regulator_dev *rtc_rdev;
 	struct notifier_block reboot_notifier;
+	struct notifier_block suspend_notifier;
 	int core_min_uV, cpu_min_uV;
 	bool sys_reboot_mode_req;
 	bool sys_reboot_mode;
+	bool sys_suspend_mode_req;
+	bool sys_suspend_mode;
 };
 
 static inline struct tegra_regulator_coupler *
@@ -105,6 +110,28 @@ static int tegra20_core_rtc_max_spread(struct regulator_dev *core_rdev,
 	return 150000;
 }
 
+static int tegra20_cpu_nominal_uV(void)
+{
+	switch (tegra_sku_info.soc_speedo_id) {
+	case 0:
+		return 1100000;
+	case 1:
+		return 1025000;
+	default:
+		return 1125000;
+	}
+}
+
+static int tegra20_core_nominal_uV(void)
+{
+	switch (tegra_sku_info.soc_speedo_id) {
+	default:
+		return 1225000;
+	case 2:
+		return 1300000;
+	}
+}
+
 static int tegra20_core_rtc_update(struct tegra_regulator_coupler *tegra,
 				   struct regulator_dev *core_rdev,
 				   struct regulator_dev *rtc_rdev,
@@ -144,6 +171,11 @@ static int tegra20_core_rtc_update(struct tegra_regulator_coupler *tegra,
 	if (err)
 		return err;
 
+	/* prepare voltage level for suspend */
+	if (tegra->sys_suspend_mode)
+		core_min_uV = clamp(tegra20_core_nominal_uV(),
+				    core_min_uV, core_max_uV);
+
 	core_uV = regulator_get_voltage_rdev(core_rdev);
 	if (core_uV < 0)
 		return core_uV;
@@ -279,6 +311,11 @@ static int tegra20_cpu_voltage_update(struct tegra_regulator_coupler *tegra,
 	if (tegra->sys_reboot_mode)
 		cpu_min_uV = max(cpu_min_uV, tegra->cpu_min_uV);
 
+	/* prepare voltage level for suspend */
+	if (tegra->sys_suspend_mode)
+		cpu_min_uV = clamp(tegra20_cpu_nominal_uV(),
+				   cpu_min_uV, cpu_max_uV);
+
 	if (cpu_min_uV > cpu_uV) {
 		err = tegra20_core_rtc_update(tegra, core_rdev, rtc_rdev,
 					      cpu_uV, cpu_min_uV);
@@ -320,6 +357,7 @@ static int tegra20_regulator_balance_voltage(struct regulator_coupler *coupler,
 	}
 
 	tegra->sys_reboot_mode = READ_ONCE(tegra->sys_reboot_mode_req);
+	tegra->sys_suspend_mode = READ_ONCE(tegra->sys_suspend_mode_req);
 
 	if (rdev == cpu_rdev)
 		return tegra20_cpu_voltage_update(tegra, cpu_rdev,
@@ -334,6 +372,63 @@ static int tegra20_regulator_balance_voltage(struct regulator_coupler *coupler,
 	return -EPERM;
 }
 
+static int tegra20_regulator_prepare_suspend(struct tegra_regulator_coupler *tegra,
+					     bool sys_suspend_mode)
+{
+	int err;
+
+	if (!tegra->core_rdev || !tegra->rtc_rdev || !tegra->cpu_rdev)
+		return 0;
+
+	/*
+	 * All power domains are enabled early during resume from suspend
+	 * by GENPD core.  Domains like VENC may require a higher voltage
+	 * when enabled during resume from suspend.  This also prepares
+	 * hardware for resuming from LP0.
+	 */
+
+	WRITE_ONCE(tegra->sys_suspend_mode_req, sys_suspend_mode);
+
+	err = regulator_sync_voltage_rdev(tegra->cpu_rdev);
+	if (err)
+		return err;
+
+	err = regulator_sync_voltage_rdev(tegra->core_rdev);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static int tegra20_regulator_suspend(struct notifier_block *notifier,
+				     unsigned long mode, void *arg)
+{
+	struct tegra_regulator_coupler *tegra;
+	int ret = 0;
+
+	tegra = container_of(notifier, struct tegra_regulator_coupler,
+			     suspend_notifier);
+
+	switch (mode) {
+	case PM_HIBERNATION_PREPARE:
+	case PM_RESTORE_PREPARE:
+	case PM_SUSPEND_PREPARE:
+		ret = tegra20_regulator_prepare_suspend(tegra, true);
+		break;
+
+	case PM_POST_HIBERNATION:
+	case PM_POST_RESTORE:
+	case PM_POST_SUSPEND:
+		ret = tegra20_regulator_prepare_suspend(tegra, false);
+		break;
+	}
+
+	if (ret)
+		pr_err("failed to prepare regulators: %d\n", ret);
+
+	return notifier_from_errno(ret);
+}
+
 static int tegra20_regulator_prepare_reboot(struct tegra_regulator_coupler *tegra,
 					    bool sys_reboot_mode)
 {
@@ -444,6 +539,7 @@ static struct tegra_regulator_coupler tegra20_coupler = {
 		.balance_voltage = tegra20_regulator_balance_voltage,
 	},
 	.reboot_notifier.notifier_call = tegra20_regulator_reboot,
+	.suspend_notifier.notifier_call = tegra20_regulator_suspend,
 };
 
 static int __init tegra_regulator_coupler_init(void)
@@ -456,6 +552,9 @@ static int __init tegra_regulator_coupler_init(void)
 	err = register_reboot_notifier(&tegra20_coupler.reboot_notifier);
 	WARN_ON(err);
 
+	err = register_pm_notifier(&tegra20_coupler.suspend_notifier);
+	WARN_ON(err);
+
 	return regulator_coupler_register(&tegra20_coupler.coupler);
 }
 arch_initcall(tegra_regulator_coupler_init);
diff --git a/drivers/soc/tegra/regulators-tegra30.c b/drivers/soc/tegra/regulators-tegra30.c
index e74bbc9c7859..8fd43c689134 100644
--- a/drivers/soc/tegra/regulators-tegra30.c
+++ b/drivers/soc/tegra/regulators-tegra30.c
@@ -16,6 +16,7 @@
 #include <linux/regulator/coupler.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
+#include <linux/suspend.h>
 
 #include <soc/tegra/fuse.h>
 #include <soc/tegra/pmc.h>
@@ -25,9 +26,12 @@ struct tegra_regulator_coupler {
 	struct regulator_dev *core_rdev;
 	struct regulator_dev *cpu_rdev;
 	struct notifier_block reboot_notifier;
+	struct notifier_block suspend_notifier;
 	int core_min_uV, cpu_min_uV;
 	bool sys_reboot_mode_req;
 	bool sys_reboot_mode;
+	bool sys_suspend_mode_req;
+	bool sys_suspend_mode;
 };
 
 static inline struct tegra_regulator_coupler *
@@ -113,6 +117,52 @@ static int tegra30_core_cpu_limit(int cpu_uV)
 	return -EINVAL;
 }
 
+static int tegra30_cpu_nominal_uV(void)
+{
+	switch (tegra_sku_info.cpu_speedo_id) {
+	case 10 ... 11:
+		return  850000;
+
+	case 9:
+		return  912000;
+
+	case 1 ...  3:
+	case 7 ...  8:
+		return 1050000;
+
+	default:
+		return 1125000;
+
+	case  4 ...  6:
+	case 12 ... 13:
+		return 1237000;
+	}
+}
+
+static int tegra30_core_nominal_uV(void)
+{
+	switch (tegra_sku_info.soc_speedo_id) {
+	case 0:
+		return 1200000;
+
+	case 1:
+		if (tegra_sku_info.cpu_speedo_id != 7 &&
+		    tegra_sku_info.cpu_speedo_id != 8)
+			return 1200000;
+
+		fallthrough;
+
+	case 2:
+		if (tegra_sku_info.cpu_speedo_id != 13)
+			return 1300000;
+
+		return 1350000;
+
+	default:
+		return 1250000;
+	}
+}
+
 static int tegra30_voltage_update(struct tegra_regulator_coupler *tegra,
 				  struct regulator_dev *cpu_rdev,
 				  struct regulator_dev *core_rdev)
@@ -168,6 +218,11 @@ static int tegra30_voltage_update(struct tegra_regulator_coupler *tegra,
 	if (err)
 		return err;
 
+	/* prepare voltage level for suspend */
+	if (tegra->sys_suspend_mode)
+		core_min_uV = clamp(tegra30_core_nominal_uV(),
+				    core_min_uV, core_max_uV);
+
 	core_uV = regulator_get_voltage_rdev(core_rdev);
 	if (core_uV < 0)
 		return core_uV;
@@ -223,6 +278,11 @@ static int tegra30_voltage_update(struct tegra_regulator_coupler *tegra,
 	if (tegra->sys_reboot_mode)
 		cpu_min_uV = max(cpu_min_uV, tegra->cpu_min_uV);
 
+	/* prepare voltage level for suspend */
+	if (tegra->sys_suspend_mode)
+		cpu_min_uV = clamp(tegra30_cpu_nominal_uV(),
+				   cpu_min_uV, cpu_max_uV);
+
 	if (core_min_limited_uV > core_uV) {
 		pr_err("core voltage constraint violated: %d %d %d\n",
 		       core_uV, core_min_limited_uV, cpu_uV);
@@ -292,10 +352,68 @@ static int tegra30_regulator_balance_voltage(struct regulator_coupler *coupler,
 	}
 
 	tegra->sys_reboot_mode = READ_ONCE(tegra->sys_reboot_mode_req);
+	tegra->sys_suspend_mode = READ_ONCE(tegra->sys_suspend_mode_req);
 
 	return tegra30_voltage_update(tegra, cpu_rdev, core_rdev);
 }
 
+static int tegra30_regulator_prepare_suspend(struct tegra_regulator_coupler *tegra,
+					     bool sys_suspend_mode)
+{
+	int err;
+
+	if (!tegra->core_rdev || !tegra->cpu_rdev)
+		return 0;
+
+	/*
+	 * All power domains are enabled early during resume from suspend
+	 * by GENPD core.  Domains like VENC may require a higher voltage
+	 * when enabled during resume from suspend.  This also prepares
+	 * hardware for resuming from LP0.
+	 */
+
+	WRITE_ONCE(tegra->sys_suspend_mode_req, sys_suspend_mode);
+
+	err = regulator_sync_voltage_rdev(tegra->cpu_rdev);
+	if (err)
+		return err;
+
+	err = regulator_sync_voltage_rdev(tegra->core_rdev);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static int tegra30_regulator_suspend(struct notifier_block *notifier,
+				     unsigned long mode, void *arg)
+{
+	struct tegra_regulator_coupler *tegra;
+	int ret = 0;
+
+	tegra = container_of(notifier, struct tegra_regulator_coupler,
+			     suspend_notifier);
+
+	switch (mode) {
+	case PM_HIBERNATION_PREPARE:
+	case PM_RESTORE_PREPARE:
+	case PM_SUSPEND_PREPARE:
+		ret = tegra30_regulator_prepare_suspend(tegra, true);
+		break;
+
+	case PM_POST_HIBERNATION:
+	case PM_POST_RESTORE:
+	case PM_POST_SUSPEND:
+		ret = tegra30_regulator_prepare_suspend(tegra, false);
+		break;
+	}
+
+	if (ret)
+		pr_err("failed to prepare regulators: %d\n", ret);
+
+	return notifier_from_errno(ret);
+}
+
 static int tegra30_regulator_prepare_reboot(struct tegra_regulator_coupler *tegra,
 					    bool sys_reboot_mode)
 {
@@ -395,6 +513,7 @@ static struct tegra_regulator_coupler tegra30_coupler = {
 		.balance_voltage = tegra30_regulator_balance_voltage,
 	},
 	.reboot_notifier.notifier_call = tegra30_regulator_reboot,
+	.suspend_notifier.notifier_call = tegra30_regulator_suspend,
 };
 
 static int __init tegra_regulator_coupler_init(void)
@@ -407,6 +526,9 @@ static int __init tegra_regulator_coupler_init(void)
 	err = register_reboot_notifier(&tegra30_coupler.reboot_notifier);
 	WARN_ON(err);
 
+	err = register_pm_notifier(&tegra30_coupler.suspend_notifier);
+	WARN_ON(err);
+
 	return regulator_coupler_register(&tegra30_coupler.coupler);
 }
 arch_initcall(tegra_regulator_coupler_init);
-- 
2.32.0

