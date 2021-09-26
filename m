Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA74F3FC7
	for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 22:42:31 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id x27so68577506lfu.5
        for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 15:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=azJO16PBS0aaEX5vOfJpmf9jn1x1mJqiJpQpMZ0azY4=;
        b=CoucEmqsnHASEscWTvzWVMvPJx/TXgnqdGGuNIJPcO7mu88S+vh9AL8t1Ns9UQxBZI
         XYyLpgOhCbVihPd7RcTvlnEoo65EfnV9OkGmOWggm/JcV3T1Fkb0hoAtZ6o6YKD3Npjs
         H//NAJ7gp0wGVNHcKIrcVsCMNFUeMp9gBjixftFjxRLmL/Z2XsgUHsToJoIsQ91a9Rqp
         oV4EC8FnuEN/OmtmYdJoT+oiy2ExskpbLunYJ0pVQgGZEgVTuEE0BW+mpUw7+stYklh+
         wmG9/SuwJ+Co+IWoOjaOCa7e/0oMC36ZRTjBUO3zNyO8S7/jRGHaFUs2KkxQteQZYgcd
         hiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=azJO16PBS0aaEX5vOfJpmf9jn1x1mJqiJpQpMZ0azY4=;
        b=W4JEWqMHj/YkhqOlPQ18HxvBQb71IXogPx3NqenVRRG/I5s35vB5Ql4bBPigo8beW2
         7P+ZV2O5R/jgblMYKYrBRPwUaFpzroGtBqtDz31mAh7jhKLwasLRsqEo294NG1dObA4v
         54/2rSFL2i39U51gmHaz7aOoesGiNQVB8O4jkxpx8slZ1KRccm88gOiWGfMbj+btymg8
         2huhVG1BKZ7NGXZZeuNq0WI4j51uIacQaqlXnNWNv3EVETs8+/eYQ+9wksT4HkDaxGxH
         +MpJSzdZ8CVr2AfziosGwADNz8e4CEjMdnIx0eo+hphfR1XGatiOfQwdEldjptfruG+S
         UsGQ==
X-Gm-Message-State: AOAM532Rf5z+yi6xL/LoydS0RV99nG5SfGBQGDBA+74NDLftqtQGZbii
	WBDOG122p/MDy8dLy0vkamI=
X-Google-Smtp-Source: ABdhPJz0FoBQucMxJTKUygz8qqUX0VYeANYjoqsIq2ZxRXzP7B+OIO/7ur7ISRYBXcphepoeMGZavA==
X-Received: by 2002:ac2:5458:: with SMTP id d24mr20907289lfn.385.1632696150192;
        Sun, 26 Sep 2021 15:42:30 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru. [46.138.80.108])
        by smtp.gmail.com with ESMTPSA id m10sm1408899lfr.272.2021.09.26.15.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 15:42:29 -0700 (PDT)
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
Subject: [PATCH v13 04/35] soc/tegra: Don't print error message when OPPs not available
Date: Mon, 27 Sep 2021 01:40:27 +0300
Message-Id: <20210926224058.1252-5-digetx@gmail.com>
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

