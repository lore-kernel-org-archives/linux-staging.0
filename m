Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B3B3FC0
	for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 18:12:04 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id z24so45170841lfu.13
        for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 11:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=azJO16PBS0aaEX5vOfJpmf9jn1x1mJqiJpQpMZ0azY4=;
        b=JWg3p713BIkRQCTRGaoUEi5JC50MDq8wqQyGmvOxgt/Gx0+uRrbbGTC6klgxI0l8Jg
         9ky4dBsBvVte/Nm5TTUfutW8bf/X9pvsJRx1XEfGFMrhKtHcGMxeT1uKrrZkMnMWhJmV
         BLZOPJt87+eOSbKmvhmCbBjQvdmqbKHsCaGwHUegBIYlZ8yZAAUIu+39rodNLIXUk+8X
         G83TV+DyIfbW9xWEVYXLbkZIRJ19L5fjcOLNsIC1WnVrdwL4nOfnENybYCKOw3JM80ep
         XivsGBWZxIyD/VSF+sgY622lG6h5a63NIzpnyDDEVIvkcP7bU4VCpnwpeKu8QY7Ay0wV
         fitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=azJO16PBS0aaEX5vOfJpmf9jn1x1mJqiJpQpMZ0azY4=;
        b=m8rJYhFzjLRLoU739YeU7i+rQbvEPFMyrs99zkOSHrfWdudw87WPkil0NZ+/q6wnqZ
         B1E0/Rdu9RnjWb3WfFulLE3NOePu1kflUii+a1jlSQGGxRIKGNjXaxuxBMzdIx5MG7Re
         8oWqK8cmK/rd1YO+gfea6FriutTa50H+eUx71saX/q8ubTIQO+v+NflKBG9Utcon6Y+B
         vHBTCJYvzGbTxne6LdusW6yWm6XhegMgJBeCmHd9TiWJ9mh6RGh4KPCYC/cevZpmVr7q
         UBnJzmH88taOgJPl3Im2JBxqxBwU+2zY8/colo4fMNHejX1ZFRN6GWdMO0+tjpvieW/W
         ce5w==
X-Gm-Message-State: AOAM533Sbc8VfHrINPmWhVRRWi/VanI6mVaOOUesFWA1BqAL1c7vVeWb
	DZ7A+CyU2bWS6M+FgG+DJoI=
X-Google-Smtp-Source: ABdhPJz3P9KrsvRrtZRLBfMiI9cU2UmfIpkQbidKkjFChQc06aWwDZ92cX26PW8bKiuB9zGdNqj9yA==
X-Received: by 2002:a05:6512:3699:: with SMTP id d25mr19990583lfs.380.1632161523114;
        Mon, 20 Sep 2021 11:12:03 -0700 (PDT)
Received: from localhost.localdomain (46-138-151-206.dynamic.spd-mgts.ru. [46.138.151.206])
        by smtp.gmail.com with ESMTPSA id u3sm1775677lju.107.2021.09.20.11.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 11:12:02 -0700 (PDT)
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
Subject: [PATCH v12 04/35] soc/tegra: Don't print error message when OPPs not available
Date: Mon, 20 Sep 2021 21:11:14 +0300
Message-Id: <20210920181145.19543-5-digetx@gmail.com>
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

