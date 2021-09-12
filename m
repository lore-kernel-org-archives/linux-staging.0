Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAA43FC3
	for <linux-staging@lists.linux.dev>; Sun, 12 Sep 2021 20:09:44 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id l7-20020a1c2507000000b002e6be5d86b3so5125805wml.3
        for <linux-staging@lists.linux.dev>; Sun, 12 Sep 2021 13:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=azJO16PBS0aaEX5vOfJpmf9jn1x1mJqiJpQpMZ0azY4=;
        b=dgfruC3Cp7h5J9EBqCGafMKFXt20sGTs0YsYPkR7d1TWRr8oLswsvyCKcBSxy4nulu
         0ZbxVa4QFZQfmClH9qJ+sj0/aqr1Oj4x/2i4oRtkgdsKe6uRyet4NtuDNfxNskm/LaL3
         8G3liXSQkeLLElx3zNZ5Jg4yey7pZ9YhZxU9IXTtiBUnML34vHWNB7u27oXvTml/Yx+T
         nKYVv/4i3YYIKnpQV2d8M+QJSBaCu5P1QMYCVCbFOiXdv/zaOWdhIPOBsiZBvSYznQTm
         1cx/B8qabHGSZgtGF8U4kZD8Mq0cMv4HZzfWjRheyzvnTcjs6shxv/6yp7El7CNX7MWp
         awFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=azJO16PBS0aaEX5vOfJpmf9jn1x1mJqiJpQpMZ0azY4=;
        b=UvYmTNQNwrL2D0ytxITQVLsbHkQ4KxkfWzRk6W5+pMtoH1SihGvQO4cYMX1fM1Amix
         G5rn7J1hZDJ+0tM0Uw38YYz1aPmrx3qJYZLaQyYOj4qvjljJB2A8zE1Hh3rBl/if6NzB
         q29nX40ymqKJvVI/vEamXtxhNU2iC/JJIRBZjLbkYI0j4i0qI3dwPql0t9md4lg8MmWs
         peMumwtYU6AzQLvId2OlLCyzO6vene+44n4u4A8U4wUWT8j2js4XL7tj5FWfgd2kbbN5
         NE5do5pDzb8ix8lIXH5kltp6PIdzaRwKTMvcIcvZ8VBWNyhm0VpCFBgM7xPAtWgL6Veb
         f1kQ==
X-Gm-Message-State: AOAM533PU9Hpsqshl2myLGk/izBOrRn3EFWYfkNzyIM2Zcq1GAPzV2M2
	zTgYpRDRVuk1c+YjsdVEdvc=
X-Google-Smtp-Source: ABdhPJwmxULcCBMXR6BD0JLAazGByGQYAT6BgoTu1ONDbXSqkFAZZJt5z69GiuVGoP2Im9fwPD+HbA==
X-Received: by 2002:a7b:c3cc:: with SMTP id t12mr7819882wmj.68.1631477382665;
        Sun, 12 Sep 2021 13:09:42 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru. [46.138.83.36])
        by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 13:09:42 -0700 (PDT)
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
Subject: [PATCH v11 04/34] soc/tegra: Don't print error message when OPPs not available
Date: Sun, 12 Sep 2021 23:08:02 +0300
Message-Id: <20210912200832.12312-5-digetx@gmail.com>
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

Previously we assumed that devm_tegra_core_dev_init_opp_table() will
be used only by drivers that will always have device with OPP table,
but this is not true anymore. For example now Tegra30 will have OPP table
for PWM, but Tegra20 not and both use the same driver. Hence let's not
print the error message about missing OPP table in the common helper,
we can print it elsewhere.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/common.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index cd33e99249c3..a42d4f98c078 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -111,9 +111,7 @@ int devm_tegra_core_dev_init_opp_table(struct device *dev,
 	 */
 	err = devm_pm_opp_of_add_table(dev);
 	if (err) {
-		if (err == -ENODEV)
-			dev_err_once(dev, "OPP table not found, please update device-tree\n");
-		else
+		if (err != -ENODEV)
 			dev_err(dev, "failed to add OPP table: %d\n", err);
 
 		return err;
-- 
2.32.0

