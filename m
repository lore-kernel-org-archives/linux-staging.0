Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8024B3FCF
	for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 22:42:52 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id i4so68533530lfv.4
        for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 15:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xyfv+bs1PqRnjMFL4Pq5e7XkvADOaeyFEUXpxII4rIo=;
        b=izvFqpS38K4FCvT7p/zbvtPiyuSbxhHUIKmFwiK3flubJCAqcxp4mNup9FVUVBz10D
         BaZc9dN4ud4sqdRa9IoE73Rp8graQE+SahQXeY7IOPhoiS+N7m/KkaLm5SMLR/4w0aPj
         fg0tSmIcoWmarUWnmFwz5LastPqVxXfW5RPHers47MYDvxqf9Dfl+4Dzr9cGHY8HAHvi
         m1pK+t0poPBYPw4Zax6XbCAaoqMfiQU1/4WQ2Ay9/Kl6f34wy3fZuLPXoagHgox/5bTL
         A3v8DwV12vmHFdpkQGfAGPyI+CZr5nITAm+9lMD11iMI6Zznv2S5aOtjHIE18/Dsuru5
         Ijuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xyfv+bs1PqRnjMFL4Pq5e7XkvADOaeyFEUXpxII4rIo=;
        b=dCYFyQ3721rFXqWzBwTGf9Yz4alDn5sUuBGRAQFnbHj6VZN+H6zzu5JA40FieYI7GI
         /AI0C4Ab9GprwxX/V07xFg+pyYPg1BDpcZLCPDwMNz5FfzgmLVQpZnm6NS4DeDLOF7xG
         jlMSt5k892Qm6oHAqNVjGI/uJB0JZTLT2cDFVk4bNK92v5O/QiM4ix+pMB2oXVTfHgFZ
         M3yFgNjPO4S7L3gvC4+kdenbyxYZMFSgN/9mFxJYRjtybeMP87g4zleoQRvdANwcXsvt
         5qEkAn0cXAQk7KgoBAnGEAQnzjRz0IjhrYZCLX6nBUUMOV+ZvBtUTugIHPa5V4jbzGhn
         aQPw==
X-Gm-Message-State: AOAM530lADTk/WLB0NCgOeJnzO9byC1wKRhw60oHiylZyPA6ZJ5gxAZ1
	CXrmCcn2b8UQuc8che6JOao=
X-Google-Smtp-Source: ABdhPJwFcgY1e/EpRbZGqJyBjJ81B0If7emAzTEomlL5PaZAh/GdNeqs2BhIjIoVoXBk8gQvMR+6HA==
X-Received: by 2002:a2e:5005:: with SMTP id e5mr24744959ljb.471.1632696170675;
        Sun, 26 Sep 2021 15:42:50 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru. [46.138.80.108])
        by smtp.gmail.com with ESMTPSA id m10sm1408899lfr.272.2021.09.26.15.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 15:42:50 -0700 (PDT)
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
Subject: [PATCH v13 21/35] spi: tegra20-slink: Add OPP support
Date: Mon, 27 Sep 2021 01:40:44 +0300
Message-Id: <20210926224058.1252-22-digetx@gmail.com>
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
index 3226c4e1c7c0..eea1853010e8 100644
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

