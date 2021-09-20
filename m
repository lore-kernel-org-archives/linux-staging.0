Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A473FCB
	for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 18:12:27 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id g41so38690228lfv.1
        for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 11:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i9QYtupMPLyzQnqOhwfXP4oUoMqt4gxj3ewFZ5B73Ts=;
        b=FLondlZAByswkCx76NUTut2FKe5HTLd6RMUKRjGcVS5xrGzeF4n55ShR0KiVsRbPKS
         xAPy+xlX3OUlHnUtXOFxwCN+8d5gJs2a2z0WdqOsIedoGjefZRbmdyux39rTxexL89cO
         Oajkf7cwNhOKm3ecjfD489L8XHwLcw8uMdMLgeD9tRdTKa0md7Xrvw+UUV66F+XDzklb
         kg3rGsoaIptbGC7oXHOx3h0d9BWGJ53uW38q7qiKdQ9PH5r0DsKUpkJM0PowNppUniFU
         p1HEvNelypwSp0k0w0BFnLTWa5S8F1mgxziNA7Ia3Jv1I1/5V6DwYtvbiYnbQuWV2CWf
         c/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i9QYtupMPLyzQnqOhwfXP4oUoMqt4gxj3ewFZ5B73Ts=;
        b=Ikltxip80tVBYtWoqLmSO2SsJ3MsYKUDVM8IvAtNl0YSDnlXTPAWaMadaImqFnxuhl
         HeVPHy96D28tyY8MVC9DPJo+i+hYN1kEWxVGOBvqoFeONmR65sHVuijrWpCPQdSuqmIi
         lQG9Zjzuwg56ZLH2LtVXvYExkTOCgcp39zK6Tv/v88aMB0nossmt5Z8u0tqf75nJs6pF
         nQZDzvlYoFjDNT6byPY7+dw2sjlchW0h81+Zy/rwPLxw/t0pAsP+fmMTaR/rJwvZP/Ba
         WeDNrYP4NudUNJ76lYCSD3pGw8udsPcTyslX8xrKX3JPCdkL0+CVQTc1ECJGbuP2RJci
         Haxw==
X-Gm-Message-State: AOAM532MD89XjmK64E53dklInJxbkEIsKXC24XkggLIac9HjE/Nnvo07
	WNCaCZV6r5pQf2Rr7fAtL60=
X-Google-Smtp-Source: ABdhPJx9TGtvBZ/IypK8WLsx2yRQVD/sNzzkimN7hcbYTGAHJuhtbGsTO+/Kb00HqQOXbH0CjLvTpA==
X-Received: by 2002:a05:651c:206:: with SMTP id y6mr9048284ljn.98.1632161545955;
        Mon, 20 Sep 2021 11:12:25 -0700 (PDT)
Received: from localhost.localdomain (46-138-151-206.dynamic.spd-mgts.ru. [46.138.151.206])
        by smtp.gmail.com with ESMTPSA id u3sm1775677lju.107.2021.09.20.11.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 11:12:25 -0700 (PDT)
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
Subject: [PATCH v12 21/35] spi: tegra20-slink: Add OPP support
Date: Mon, 20 Sep 2021 21:11:31 +0300
Message-Id: <20210920181145.19543-22-digetx@gmail.com>
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

The SPI on Tegra belongs to the core power domain and we're going to
enable GENPD support for the core domain. Now SPI driver must use OPP
API for driving the controller's clock rate because OPP API takes care
of reconfiguring the domain's performance state in accordance to the
rate. Add OPP support to the driver.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/spi/spi-tegra20-slink.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-tegra20-slink.c b/drivers/spi/spi-tegra20-slink.c
index 8ce840c7ecc8..1a92978d2120 100644
--- a/drivers/spi/spi-tegra20-slink.c
+++ b/drivers/spi/spi-tegra20-slink.c
@@ -18,12 +18,15 @@
 #include <linux/kthread.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/reset.h>
 #include <linux/spi/spi.h>
 
+#include <soc/tegra/common.h>
+
 #define SLINK_COMMAND			0x000
 #define SLINK_BIT_LENGTH(x)		(((x) & 0x1f) << 0)
 #define SLINK_WORD_SIZE(x)		(((x) & 0x1f) << 5)
@@ -680,7 +683,7 @@ static int tegra_slink_start_transfer_one(struct spi_device *spi,
 	bits_per_word = t->bits_per_word;
 	speed = t->speed_hz;
 	if (speed != tspi->cur_speed) {
-		clk_set_rate(tspi->clk, speed * 4);
+		dev_pm_opp_set_rate(tspi->dev, speed * 4);
 		tspi->cur_speed = speed;
 	}
 
@@ -1082,6 +1085,11 @@ static int tegra_slink_probe(struct platform_device *pdev)
 	init_completion(&tspi->xfer_completion);
 
 	pm_runtime_enable(&pdev->dev);
+
+	ret = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
+	if (ret)
+		goto exit_pm_disable;
+
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "pm runtime get failed, e = %d\n", ret);
-- 
2.32.0

