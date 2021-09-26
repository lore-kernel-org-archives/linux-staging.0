Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDBC3FCF
	for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 22:43:03 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id x27so68581668lfu.5
        for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 15:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZDRA8PLugfMxJpXAqa8RlnWxOlWeZ2QqIDIb0I+7p08=;
        b=kC+icNnnM68LagyRGGEkOQupTcNBYuDcSG0HFicRtIiTyC+plFKn3cvHTRDvYVnmx9
         9V4KSaIw9OcWGcRp6dmsMjSj9hx8CjuFfzL+aBrmDRxvrIkmsHFwUroFsNPYCxkIr0W8
         Un6+DO2AsKkUFSkduTD433sBrILi5ewzXGddooCqW4ze81GkzdjBtSNDQGSoiUnym8ad
         N1NgQZMznEOZqBWAmCG8OIxTMeHgaW+T04Wpx7xvrjBn5mZ7xdlGJNzEihb1INyGjhjm
         6frWTQTuXWYuHOzKv5qBDKA9bVBzQoAr3sO+ErQOFjvj+4iubRb1QmKTf0pI6PZjV3U+
         NDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZDRA8PLugfMxJpXAqa8RlnWxOlWeZ2QqIDIb0I+7p08=;
        b=ePP3G+i3Wg+PzVP3GS5hlI+xDABUDtnOtRAEk32rZ7OdGIBWV6P5TIcwL/++mWBb/n
         IffnGhuwgAp4LJKQC65P/UEoJfwZpcfeYGgBwVE3hTXp5Mwr88mWnnV6GI2abggLapTy
         qFUCqT3tfcrXM9KYpTi/014CTrW1YIm5WfwHf0Ioy3tprNrAfG+CgIYsBxpANyTxiQ1P
         QLjWwz64eETSY8QD+bKSiJgD4aPujs1YCfGNHrrlt5d9o/01w8zTH/0lXdZAj9KPTri+
         /6+HlF0uYPIHI2P7gc5i7ri+z14m9G1tlZug7otYHSoJpuqCypKBENUlO5S4WiP3OjO/
         LwqQ==
X-Gm-Message-State: AOAM533tscDp/iL5d+VKK0M/H4/dfBC3xLi4UZdDUhuDTbJ2vkPDXIyo
	AyDMbrecvFuA1EUcvNAowOU=
X-Google-Smtp-Source: ABdhPJxIGYEdLSAtK2lqAJBv7v5bdPEvftQGTGQC471A9Kq4ApP2a2tRiygRkUZI8l152v5eb2O61w==
X-Received: by 2002:a2e:7d15:: with SMTP id y21mr25671483ljc.70.1632696181602;
        Sun, 26 Sep 2021 15:43:01 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru. [46.138.80.108])
        by smtp.gmail.com with ESMTPSA id m10sm1408899lfr.272.2021.09.26.15.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 15:43:01 -0700 (PDT)
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
Subject: [PATCH v13 30/35] soc/tegra: pmc: Enable core domain support for Tegra20 and Tegra30
Date: Mon, 27 Sep 2021 01:40:53 +0300
Message-Id: <20210926224058.1252-31-digetx@gmail.com>
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

All device drivers got runtime PM and OPP support. Flip the core domain
support status for Tegra20 and Tegra30 SoCs.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 3e52ceada60c..7c7aff8120d4 100644
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

