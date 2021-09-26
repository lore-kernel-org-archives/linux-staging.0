Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DD03FCF
	for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 22:42:41 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id b15so67583537lfe.7
        for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 15:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=31z6ju9IxXkuW5YuopLRzoIoj/otNjt9+lw55F7t8U0=;
        b=LLfiLqLR3Uv7MtvTYWmjc+gcUe3dYi7j5vfpS6/nXEonrzdADV499jnt5g3VHYmD2P
         IaJ9zQyJW0W//HcMG4bBA5YT4Fr5lc1ID60Ts+UOEA9GovTWKNfpdh0YDJCPL44Z6Fg3
         fJxIp994pumpxP8I7tQp1FOAcJkOoFY2+usFlO+SvVbk1/LGRkkmiMG3iaGgF4UAC2ql
         0Ri9qBnHW1OOaczmHUjlOfjPGmyKdENaX5Dw0spWFIN7YfCE4HgZSBe2T0njdEUSsEJZ
         nuNGVhBSXtbuozBRSxrfynWwPezZ2KvPJ2V+KcepW/7yyNDq4dqvqfngbeBJJgDmQpw2
         /6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=31z6ju9IxXkuW5YuopLRzoIoj/otNjt9+lw55F7t8U0=;
        b=P/ueGJFtGwZRMd2Fk6jRBkuJR2rJwSQLbyWUQefHROVXjLeApxhvqYT1/aI770fT4A
         g6DGlVxL8l5Go00UC7CACE+qhIt557jVJDYG8FiYymFyblK9XDH1bGpLRSXUXqw0MkrP
         tEKeHUUO3nq/IfuW1KUgm+xr8GmSRU8wi5oKg6bvHbwNhd8gRI2fJIEPVGbb9H0PXmlf
         l+sy948BQj2uPyTYDySuBp8zkWFq7QNboGuXJEZbmBLuX21FJEDN7pGPyDw0Spf/H/xF
         mJzGTNzRkuYXp9ttaDFpLpIAJOUtzmJf/x9wAbTCJWNPwOqfKN40UB31sTo6lxGxWH50
         DiTA==
X-Gm-Message-State: AOAM531buEPkf7hAPE6mnep4Pir3YPt0YYeZXRWtb+3xmyKJ9vcDjYgv
	hRIf2kzioI0MB6GSuHM42Pk=
X-Google-Smtp-Source: ABdhPJylJVQRDOfsnswWdBhvajz1HdfChCZWUg3V/0pQG3UKT9LOlK10u4P3TFgY9egIg+K11N0IHA==
X-Received: by 2002:a05:6512:3c92:: with SMTP id h18mr20860545lfv.656.1632696160164;
        Sun, 26 Sep 2021 15:42:40 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru. [46.138.80.108])
        by smtp.gmail.com with ESMTPSA id m10sm1408899lfr.272.2021.09.26.15.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 15:42:39 -0700 (PDT)
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
Subject: [PATCH v13 12/35] drm/tegra: hdmi: Add OPP support
Date: Mon, 27 Sep 2021 01:40:35 +0300
Message-Id: <20210926224058.1252-13-digetx@gmail.com>
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

The HDMI on Tegra belongs to the core power domain and we're going to
enable GENPD support for the core domain. Now HDMI driver must use
OPP API for driving the controller's clock rate because OPP API takes
care of reconfiguring the domain's performance state based on HDMI clock
rate. Add OPP support to the HDMI driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/hdmi.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index e5d2a4026028..9a87d351a828 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -11,10 +11,13 @@
 #include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 
+#include <soc/tegra/common.h>
+
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_debugfs.h>
@@ -1195,7 +1198,7 @@ static void tegra_hdmi_encoder_enable(struct drm_encoder *encoder)
 	h_back_porch = mode->htotal - mode->hsync_end;
 	h_front_porch = mode->hsync_start - mode->hdisplay;
 
-	err = clk_set_rate(hdmi->clk, hdmi->pixel_clock);
+	err = dev_pm_opp_set_rate(hdmi->dev, hdmi->pixel_clock);
 	if (err < 0) {
 		dev_err(hdmi->dev, "failed to set HDMI clock frequency: %d\n",
 			err);
@@ -1732,7 +1735,14 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, hdmi);
-	pm_runtime_enable(&pdev->dev);
+
+	err = devm_pm_runtime_enable(&pdev->dev);
+	if (err)
+		return err;
+
+	err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
+	if (err)
+		return err;
 
 	INIT_LIST_HEAD(&hdmi->client.list);
 	hdmi->client.ops = &hdmi_client_ops;
@@ -1753,8 +1763,6 @@ static int tegra_hdmi_remove(struct platform_device *pdev)
 	struct tegra_hdmi *hdmi = platform_get_drvdata(pdev);
 	int err;
 
-	pm_runtime_disable(&pdev->dev);
-
 	err = host1x_client_unregister(&hdmi->client);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
-- 
2.32.0

