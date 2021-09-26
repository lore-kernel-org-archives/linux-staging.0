Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA223FD4
	for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 22:42:45 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id b20so68763931lfv.3
        for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 15:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=798UaN2O7BsVLG2b7m1c5jRBaYmhXVVyGNLo4voHgAg=;
        b=pUEPNMkJQr5NWNa19a7ZyiLQA/ce5o3cooLHQciCTfn7GDvRH6VTTTdD6JKIL4UrmV
         rrVbAP/wvZWx2J0K2faasFGjzdi1o5y8ezrQGpvdeJIrszdl8ecw8YwEyqDA1MvPawmp
         0PJ6yycgmc045AsLdgLtVuy8KAgDTFddIzR6xi7P9lXt8qD3EuLmDuxPVs1BY89/wIsV
         /jXKmHsXeSDJelnpvglMhN0zjnmKIQw2G47uxtN2JI6M3VthPUoP+q02lvNETHoucFHI
         /JiJckf1QnJt46IeCFDl4rZymcy/0KL5Fowewmc53xoffriJ72cInIZPrF2f831BKUnf
         nYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=798UaN2O7BsVLG2b7m1c5jRBaYmhXVVyGNLo4voHgAg=;
        b=cOG+Tl2G55GoYgWnO09fIT1zVzWAKvN6mru/yjj1bP+KLR7U1HhLQ/4gnbJDpXlTwe
         qLfqhMZ+M/pHLrXKx3AUkFbKP2/sJKror+ePtz4bwuSqQzcYbmxL5xlWi6tjC1FNAqhZ
         Vnsmwvbw4AG0w11ADHioKm9ZpTHEwZqFTrm2hs+7dvVUidAjPtNRUSCtr3P0VsQeC2IJ
         3YkkPtm+uDspOCJu70zkz1u31DMFurx06aGBLTbQlkXo3m83JSGaeb8IGhVCaRKUCit6
         a10R/V128BuM86hES5p7deBTVa4zk+vB4q8SjFN6d/8tK82cbBgmoTUfJNyM6O5QStfr
         Vq4Q==
X-Gm-Message-State: AOAM531zSUvqKUIWhcIsMY3WY4UH47+H1muyunaWm4FSN7ifp4o2nUJn
	jpmgLHTth8Yrhfd8PP4Y0OI=
X-Google-Smtp-Source: ABdhPJy2rzvcK/EpmNkU06oa1ux+Bax5jzq0bb0T3/Dhw3FjdBPfDZTPA9CjLuSUJfe3zuDn+9yAGA==
X-Received: by 2002:a2e:585c:: with SMTP id x28mr25230381ljd.508.1632696163660;
        Sun, 26 Sep 2021 15:42:43 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru. [46.138.80.108])
        by smtp.gmail.com with ESMTPSA id m10sm1408899lfr.272.2021.09.26.15.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 15:42:43 -0700 (PDT)
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
Subject: [PATCH v13 15/35] drm/tegra: vic: Support system suspend
Date: Mon, 27 Sep 2021 01:40:38 +0300
Message-Id: <20210926224058.1252-16-digetx@gmail.com>
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

