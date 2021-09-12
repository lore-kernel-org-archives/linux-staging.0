Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026DC3FD6
	for <linux-staging@lists.linux.dev>; Sun, 12 Sep 2021 20:10:03 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id m9so11321905wrb.1
        for <linux-staging@lists.linux.dev>; Sun, 12 Sep 2021 13:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=31z6ju9IxXkuW5YuopLRzoIoj/otNjt9+lw55F7t8U0=;
        b=HtNwU5moSZLbupfrh1mjCc3qBe/kZqTY8qlU6quK0SzbZ5vdWVPTxBi5dEcLK6FFy0
         1rtspR+ZfkSNxvaockdG4orN+G0qp0hUssJduwu44DMI8YsdC0aXp17NLRIYSG889eeg
         yKk14dqqUsrkjAV2M1D7pNQ+K0oUa9Vbz+drs+UpAsj+sEZT/QbA21Ngq4BoziDlEyUt
         3HTUJOapgElv8X2Muzai3w6/+Rwzl4/4YVR5QeDcoFoY8I7GMEwHkyH8jB+anD4AAGva
         jsUdDJSbQNqZWWXYZBY3H6x0+inIjeDUo5G5Pqhv4Stewl2OtmKGnlPEahPoiRDVgqef
         B3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=31z6ju9IxXkuW5YuopLRzoIoj/otNjt9+lw55F7t8U0=;
        b=vx3IDpdovqT0ANT8HRze0hvLH+aFMK+rJD3jwTueOOWWPCJX/Pp8FDPxBywZLb9E/m
         105Xs3WEXDueJHt+dWPp2ha9aEdsnCmPlDW0uolYq7KW+cQQkqsJLVK1jCmu9fTayO6N
         u3+IdcoFAtK7FJfeis9EZWs4Q9tvU82NMKlh7EOR+x+jkFVwnKEdtJ97Y9c+oTo+7TOk
         CAGIfc49Znsqec4Vd6+PmqpmSLfxhGrp5afYU5HXJ87e032eMITfhkhnwsg0aKmoRQLD
         xC60lYwXMjnJQDbh9k2M8B+mSlIKyUqiP/YdDgiP+3ubg6es80aSMkJhbTEtzGgmFlrU
         fBuA==
X-Gm-Message-State: AOAM531qJkh1Dx/oUsfD5Aq4G4PM58OZ2km8kILkJlIQu45U+ZA1E7wF
	U59fSnTDLKjtx8+DW+pk50M=
X-Google-Smtp-Source: ABdhPJxyAh0xDl8VbJgGOKzs3XwtC+3Dy5PUSEoPS1dO/j/BI6qSozlV91moyVljJeuCo04R4zAy4A==
X-Received: by 2002:a5d:4212:: with SMTP id n18mr9051432wrq.37.1631477402451;
        Sun, 12 Sep 2021 13:10:02 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru. [46.138.83.36])
        by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 13:10:02 -0700 (PDT)
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
Subject: [PATCH v11 12/34] drm/tegra: hdmi: Add OPP support
Date: Sun, 12 Sep 2021 23:08:10 +0300
Message-Id: <20210912200832.12312-13-digetx@gmail.com>
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

