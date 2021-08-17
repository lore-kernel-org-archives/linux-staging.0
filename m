Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5FF6D18
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 01:30:18 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id f2so8517218ljn.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 18:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OiZ4j31PBjUgj6NMuu1gRDwGRqT/foQN2QYxiwSoqj4=;
        b=kn4kT2Hz//hHPdVcdZ/vDzNa1AeB3fmoQ2KajKAe8K7HeAMLN9J+RLJn4O28AknXce
         O2Uwz+3Yl0HQPwUdJJ7gnzB+AAvuNYEvsVKU5gzzehu4Ot/microMtTIcN2BWF9rXCaz
         B8yn4zAA/jxH8Gy0lwR0fopTYPFhuNd2yvKwuGedIegQZfEuPz+7R7Lfy/3hj0LXXZRu
         /2zacj4fZCA9HTFFaFNhgAdlvb+Sffe0y/0KJLEluMiCSdWTI1ZcpPIFPI8Lfvx35l+v
         IjrIHeypjpz8Nd6Z+KW5WqXJWbCNUfPhk2W6I1nnjI74cdD5bp9O6HY8in4VjsotEekV
         Tl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OiZ4j31PBjUgj6NMuu1gRDwGRqT/foQN2QYxiwSoqj4=;
        b=UPBfAsTvvtwUvNE3j8VD2fgyFGNkpV0neL3PnOGn7CNOV+X2SFVNuTCojbCLihRB+p
         wEZiyMm5QuywVTHql3og1jhvz3yZXSbgET7htTQQo0pHegG7N2uKJF1eEN8Rf8Y1h3vj
         IU+oVoe1rAW3F3RHoMe+TmDcDOCPj+R7qgcqYgWHTDLTmD++JiTpyI1lU3zWlA/hlHEI
         4B7VzBlBTFOlqe0mlZ8agJSLMNDe/RRk/1oMT1iIUzcIs/wHkOoRa20XeMmtdCn87HXL
         /Z3cCto0YAAokQPpU56K6RynSyc3I4a2Gd2lSrUJHZIxPCh/JofU/STzp4X2GhKDVcTB
         sNZA==
X-Gm-Message-State: AOAM532vLYXvM5GlUZuIbLct2iuWGIkFT8fZgvqOXl0v5hxAQcvACdga
	HZvds2QQc1WwKdZb/8cGdYE=
X-Google-Smtp-Source: ABdhPJzs3U6yU/CHeEWumMqhudKOiOVdPxHW87EZcifX16I4zyesaHC8qzahhba2hNw8USFhBY7eAw==
X-Received: by 2002:a2e:9593:: with SMTP id w19mr836879ljh.323.1629163817004;
        Mon, 16 Aug 2021 18:30:17 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru. [46.138.85.91])
        by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 18:30:16 -0700 (PDT)
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
Subject: [PATCH v8 13/34] drm/tegra: hdmi: Add OPP support
Date: Tue, 17 Aug 2021 04:27:33 +0300
Message-Id: <20210817012754.8710-14-digetx@gmail.com>
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

The HDMI on Tegra belongs to the core power domain and we're going to
enable GENPD support for the core domain. Now HDMI driver must use
OPP API for driving the controller's clock rate because OPP API takes
care of reconfiguring the domain's performance state based on HDMI clock
rate. Add OPP support to the HDMI driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/hdmi.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index e5d2a4026028..aa13028480f7 100644
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
@@ -1516,6 +1519,12 @@ static int tegra_hdmi_runtime_resume(struct host1x_client *client)
 		return err;
 	}
 
+	err = dev_pm_opp_sync(dev);
+	if (err) {
+		dev_err(dev, "failed to sync OPP: %d\n", err);
+		goto put_rpm;
+	}
+
 	err = clk_prepare_enable(hdmi->clk);
 	if (err < 0) {
 		dev_err(dev, "failed to enable clock: %d\n", err);
@@ -1708,6 +1717,10 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 
 	hdmi->output.dev = &pdev->dev;
 
+	err = devm_tegra_core_dev_init_opp_table_simple(&pdev->dev);
+	if (err)
+		return err;
+
 	err = tegra_output_probe(&hdmi->output);
 	if (err < 0)
 		return err;
-- 
2.32.0

