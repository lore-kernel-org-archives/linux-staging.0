Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B1A6D18
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 01:30:22 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id x27so38184959lfu.5
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 18:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=798UaN2O7BsVLG2b7m1c5jRBaYmhXVVyGNLo4voHgAg=;
        b=kvVJK68rK2YZFnYH8LrFoceFEfWX8v2ppJhtJN3FQtc/XATIT5s9S++aE6VkEC9DYG
         pPWSlJsOJO1b8DlywD0Isw2szPQhLAalyo/vn4NIId4qqB70lZRXqyD99GHeDF20S2+e
         s4FCcdFSP2sZOlaAe1yaHa3/lSK7TBLCfTc1rhYcwZgeWTO0SGJw1L1+hW41irMlRuiO
         7GyUipnboEW5APuePEelNLTy6r4iWOw3fauB5LOn9xOqBTJzmU+qHr0EiHewqV6In+qF
         z9UYR5Iz3M/DDK0jPFJUiTaEyXhln+hqNTZk67UhWbAETTV8Q2N46Uq2ruOz+21d/skT
         2qmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=798UaN2O7BsVLG2b7m1c5jRBaYmhXVVyGNLo4voHgAg=;
        b=SSuyNUj6kR2ZxTX8d07YBXkCRcBY6VJWEGDC6/H9TvQFrkYzAZBvApOj7h7H3HWu02
         5t8lKniObfAOEhurGXxCtIMuXz6A+ANlLuxvw2pUbwkLi6C2EiJTVJhP+9yizM78qK8H
         4icz75ynsUoLJgrSQ86D6NDu8uTPpJ3P8RqTCo42Cx2Aec0gR2pZIVeIelH0zxcMWz7F
         FBAK93JkTZFz5LPMPT1H5EeYl4+0c7SQXlbDiOyiu2Uau3h1t7QWIDNnx5pRa/6eqSLl
         l54jQ73mqDwivbcY/sLyDywNgtjbdU6PfqPJbG+qaTYUkkTR1KBb3utzw6fcw9zMeZhN
         O55g==
X-Gm-Message-State: AOAM533yKiFwKCWGA4+8dsbJasVQz6IfTaiLiUTijGkVRFCvLzcHVDdz
	cMHltQyfj46mfw4HS7V/jAI=
X-Google-Smtp-Source: ABdhPJyYy8hUiWmuOExv2ofTHn5i3TqgWVouaLyBH4QsjrVfyVuz3wXI+GZKIfHGO5W1gt6UIhmJEg==
X-Received: by 2002:a05:6512:3190:: with SMTP id i16mr508725lfe.340.1629163820646;
        Mon, 16 Aug 2021 18:30:20 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru. [46.138.85.91])
        by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 18:30:20 -0700 (PDT)
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
Subject: [PATCH v8 16/34] drm/tegra: vic: Support system suspend
Date: Tue, 17 Aug 2021 04:27:36 +0300
Message-Id: <20210817012754.8710-17-digetx@gmail.com>
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

Hardware must be stopped before system is suspended. Add suspend-resume
callbacks.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/vic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index c02010ff2b7f..359dd77f8b85 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -315,6 +315,8 @@ static int vic_runtime_suspend(struct device *dev)
 	struct vic *vic = dev_get_drvdata(dev);
 	int err;
 
+	host1x_channel_stop(vic->channel);
+
 	err = reset_control_assert(vic->rst);
 	if (err < 0)
 		return err;
@@ -517,6 +519,8 @@ static int vic_remove(struct platform_device *pdev)
 
 static const struct dev_pm_ops vic_pm_ops = {
 	SET_RUNTIME_PM_OPS(vic_runtime_suspend, vic_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 struct platform_driver tegra_vic_driver = {
-- 
2.32.0

