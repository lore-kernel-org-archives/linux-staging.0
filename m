Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D4D6D1B
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 01:30:37 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id i28so8908349ljm.7
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 18:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rnq9bkX2ixJQNv9BmFWVHuIOaPxB2jJGC7dZumDQ6+g=;
        b=OhTLO+vj1vm5lGE+851g2CFGzlzjt3nZpufwJ0JLRj5BVaJqOv5XpnZ4t6FIFykDTe
         R7eSI4+JQmpLfDJXNvkuLw20a6hVxyEOfc6fYX2JHLYC66lj/UMaHPoHD28QCWb7xsPE
         ck0QHLrINepJb4SHmmiAjfr61/w6aaL8rUWnwdaj04Gxb+CYF49kFSlCFhp+PAHjBiFv
         opz07XHUvGSevI2cEHAS1+ua6hVTgr3hXi+elnaFdC1tmCA2ewZFv2BBPNmmsu3P0OH+
         Lex80AN9h9VtBkYhMDTb94z7cxiyS9kXLrm7WgkKDh0hQquViNyco07WO4wrwg6WoGxn
         VOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rnq9bkX2ixJQNv9BmFWVHuIOaPxB2jJGC7dZumDQ6+g=;
        b=PG4eSOQkj1mdxx0l9cw/rLxFLyUwvHLG3v3/LbaXCcR98+2z7mjOkDbrWL8Q8WHAIv
         uCOJ+9yLma4cq6Tg8VkBWE4tXYW0WFR4wgaamdwP9GlvERjVLksbZljbwjX+x/W2mEr1
         e2yCMK5s74Bw/ck2cTerAHGrGiQIsl216fJOmjKCCY/kQAIVLDQ9/1mt+dAcJuByfRvs
         AUQxrIwsgsDr7sYLQcSJr1+UFUe7WVubsi+Se0vA0vOVsq7dTvnMOL05914UAt4kMl12
         j/Iw1kFieGFL+Z7DkussRQf4eIs1nhIKJdvnF+lvURvgq4NviMp5Y9FPHBIV8qduIozJ
         +BBA==
X-Gm-Message-State: AOAM530Vog89S2YAfQLRCAcNd1E9ITDi8aj3IN+i9t1CkPyR0wVrTMSw
	0TtGUanafPR/A57gWpSPobM=
X-Google-Smtp-Source: ABdhPJz00oZVpSy/+QIJGg2IFpP4EXHyPsIbmUOMC41xOAd6hpvBx6xCs96mwtqe7gvcDuDFogRMBg==
X-Received: by 2002:a2e:8191:: with SMTP id e17mr865236ljg.226.1629163835893;
        Mon, 16 Aug 2021 18:30:35 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru. [46.138.85.91])
        by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 18:30:35 -0700 (PDT)
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
Subject: [PATCH v8 29/34] soc/tegra: pmc: Enable core domain support for Tegra20 and Tegra30
Date: Tue, 17 Aug 2021 04:27:49 +0300
Message-Id: <20210817012754.8710-30-digetx@gmail.com>
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

All device drivers got runtime PM and OPP support. Flip the core domain
support status for Tegra20 and Tegra30 SoCs.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index fb8faf7b226a..caf9e72af246 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3042,7 +3042,7 @@ static void tegra20_pmc_setup_irq_polarity(struct tegra_pmc *pmc,
 }
 
 static const struct tegra_pmc_soc tegra20_pmc_soc = {
-	.supports_core_domain = false,
+	.supports_core_domain = true,
 	.num_powergates = ARRAY_SIZE(tegra20_powergates),
 	.powergates = tegra20_powergates,
 	.num_cpu_powergates = 0,
@@ -3103,7 +3103,7 @@ static const char * const tegra30_reset_sources[] = {
 };
 
 static const struct tegra_pmc_soc tegra30_pmc_soc = {
-	.supports_core_domain = false,
+	.supports_core_domain = true,
 	.num_powergates = ARRAY_SIZE(tegra30_powergates),
 	.powergates = tegra30_powergates,
 	.num_cpu_powergates = ARRAY_SIZE(tegra30_cpu_powergates),
-- 
2.32.0

