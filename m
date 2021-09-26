Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21693FCF
	for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 22:43:00 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id b20so68766133lfv.3
        for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 15:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3cNnrDCgyIBL/irFJrBQOLNlmfmIoiosnZsoOoMlXuE=;
        b=TsdJMXHsHfNpbWVT9gV90yQiA5oV2D6BAkDJcGD/x14RCxHeGcHH7Eypefd8jtDvwp
         fi16k07+eB5cwLk6V/14S+KypNPA4ZyipRQwfKQGO9oicD2VxaLlskzRNDvpSmVHJuJh
         RTUYJc+yrtgrRs8DQomrPUEXtBevu/40wv/fwFYS1AP5EfNy+4QFukgyDwi5nTMYZonY
         KgSnmjDucf18iJ5WJ5R7dV+xz1LNwFCLbRiWLIK1vTjkOyEc1KX9s13MoiHJAm4QTYHl
         Swq8VIIZhvwm7o/alKd0IiwbwEc2tBAtUOqDVZs1hmZieTZzvI8nHlKXXN4Mw5WWKzXJ
         SyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3cNnrDCgyIBL/irFJrBQOLNlmfmIoiosnZsoOoMlXuE=;
        b=gw2UkFRdgUP+mR60WAKV4dHfN1/b18rtb2+Y07MBF191q0TA5rLsEYXyT3NSOXKDvz
         XYhgijgToeRONDKFw0DDQGU2FCS7WJ2ar5JE6fEPKctd+RqjDWY32wQcAPRsAVnjV7SH
         ZFOSLl2wTKcZpr1YqrS7vu2kWq4Sx/mZEQ4/jFtfR++aH7FKoYBv41Px96nqK0jksxi/
         4gM6sdmENcdHB9qEQ8ZYn8m+0owJBoJWRsKwY4AE1xemZNU5BlpA/A75vWsdkrPaIelA
         KaIAwDpx0SXtFWlK9dKfUEVTPLoPTQ4lmpTHCbaEWeYUJOj3dnjdX0sa1lCKb5MfomJO
         GbYQ==
X-Gm-Message-State: AOAM533Ulx5FslKE+S63IyPhr+NjT/E0qMA+bmhw5bcuccsW0JJAsuXg
	5lyYyIE0KgQ9KjeQyHWBCVI=
X-Google-Smtp-Source: ABdhPJzd/49nMsK5usWLYvGqM2QqzsB+PEKiiDaBLoazsQ4m3oZNMQtOdX9oLzlhVvUKUqWoFkl5eg==
X-Received: by 2002:a2e:bf21:: with SMTP id c33mr14194334ljr.101.1632696179179;
        Sun, 26 Sep 2021 15:42:59 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru. [46.138.80.108])
        by smtp.gmail.com with ESMTPSA id m10sm1408899lfr.272.2021.09.26.15.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 15:42:58 -0700 (PDT)
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
Subject: [PATCH v13 28/35] soc/tegra: pmc: Rename 3d power domains
Date: Mon, 27 Sep 2021 01:40:51 +0300
Message-Id: <20210926224058.1252-29-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210926224058.1252-1-digetx@gmail.com>
References: <20210926224058.1252-1-digetx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device-tree schema doesn't allow domain name to start with a number.
We don't use 3d domain yet in device-trees, so rename it to the name
used by Tegra TRMs: TD, TD2.

Reported-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index fb8faf7b226a..6759f19b9cd6 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -2964,7 +2964,7 @@ static SIMPLE_DEV_PM_OPS(tegra_pmc_pm_ops, tegra_pmc_suspend, tegra_pmc_resume);
 
 static const char * const tegra20_powergates[] = {
 	[TEGRA_POWERGATE_CPU] = "cpu",
-	[TEGRA_POWERGATE_3D] = "3d",
+	[TEGRA_POWERGATE_3D] = "td",
 	[TEGRA_POWERGATE_VENC] = "venc",
 	[TEGRA_POWERGATE_VDEC] = "vdec",
 	[TEGRA_POWERGATE_PCIE] = "pcie",
@@ -3072,7 +3072,7 @@ static const struct tegra_pmc_soc tegra20_pmc_soc = {
 
 static const char * const tegra30_powergates[] = {
 	[TEGRA_POWERGATE_CPU] = "cpu0",
-	[TEGRA_POWERGATE_3D] = "3d0",
+	[TEGRA_POWERGATE_3D] = "td",
 	[TEGRA_POWERGATE_VENC] = "venc",
 	[TEGRA_POWERGATE_VDEC] = "vdec",
 	[TEGRA_POWERGATE_PCIE] = "pcie",
@@ -3084,7 +3084,7 @@ static const char * const tegra30_powergates[] = {
 	[TEGRA_POWERGATE_CPU2] = "cpu2",
 	[TEGRA_POWERGATE_CPU3] = "cpu3",
 	[TEGRA_POWERGATE_CELP] = "celp",
-	[TEGRA_POWERGATE_3D1] = "3d1",
+	[TEGRA_POWERGATE_3D1] = "td2",
 };
 
 static const u8 tegra30_cpu_powergates[] = {
@@ -3133,7 +3133,7 @@ static const struct tegra_pmc_soc tegra30_pmc_soc = {
 
 static const char * const tegra114_powergates[] = {
 	[TEGRA_POWERGATE_CPU] = "crail",
-	[TEGRA_POWERGATE_3D] = "3d",
+	[TEGRA_POWERGATE_3D] = "td",
 	[TEGRA_POWERGATE_VENC] = "venc",
 	[TEGRA_POWERGATE_VDEC] = "vdec",
 	[TEGRA_POWERGATE_MPE] = "mpe",
-- 
2.32.0

