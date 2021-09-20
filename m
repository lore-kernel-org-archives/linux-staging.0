Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE3C3FC0
	for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 18:12:39 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id b15so52887250lfe.7
        for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 11:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZDRA8PLugfMxJpXAqa8RlnWxOlWeZ2QqIDIb0I+7p08=;
        b=d8JLoar86bYdDuwtQzzRDeL3gNf4SPuMkjOSsa4ZW0BwNFo4Vptre58TdAYXzOFfft
         N88mtW3eOJjL9PzzPZwdpQOZP2h92XNYDl7oCYQAy+uRAnYUYMGh84D8wjiSgRRjr6o6
         R4uproNyfEKfji3ZBxslJOC7pOcUDZfRsV72sVWBsbiG6LA+hzL7CvXf6O0GGDX5sqOV
         m1ZwS5N0DgYSLEdRUs2uIkAC/XFlYLrTASvHL+RoKcH+90V/64UbgL99gBCiQjWHJkuY
         ixiR5TmkTPK6OaD2X4gyjhsCgaBgnd//ZCiWmp6QWfrZOQTcxCcfq7IVc3KdB97xHTQS
         W+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZDRA8PLugfMxJpXAqa8RlnWxOlWeZ2QqIDIb0I+7p08=;
        b=rfRZI3PmTplUeyK5/XkpbN+m+hcW2Z3A4aWEOKLBYosrthknPV9642reg3WcZXkhHM
         4erur1WelPQd8YTuNi1tZoZ/SHGnaGKpC54g5oxFmdpizCHXqAY+Jc9YNR2VhpjTrvTn
         1AYbbbl/DV/41JSAl8syhuBLOttNzfnfZWV0WV3r3u3NSTuNjz87jaFqnX4oXJHM8WU6
         Dv6K4hNI14sm350C03pZuKiumVKm62iyUspQuNCkQNthkC+SScaYnwlrX/XozC7jH/Pg
         cnsp27ks1FCM3+LKosqHSqmvENv+0mvCZo+9qjqd2F2cV4nSeuK1TywQCre9Y+RfU0FF
         uuew==
X-Gm-Message-State: AOAM533OERjs+KSXnI3sQtRhZKaJXFwU3a+y9D6e0g2sFMwx0R/VSD3D
	+wFIWVMrVj0BaClxPtzNIfc=
X-Google-Smtp-Source: ABdhPJxzOGQYFhwdTUUpL6T5q6kwkHiReYiDhT778cfXm1Qm6lqbC0qsXVxcjixUC0s1KeSzgwzafA==
X-Received: by 2002:a2e:8546:: with SMTP id u6mr24113878ljj.185.1632161557840;
        Mon, 20 Sep 2021 11:12:37 -0700 (PDT)
Received: from localhost.localdomain (46-138-151-206.dynamic.spd-mgts.ru. [46.138.151.206])
        by smtp.gmail.com with ESMTPSA id u3sm1775677lju.107.2021.09.20.11.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 11:12:37 -0700 (PDT)
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
Subject: [PATCH v12 30/35] soc/tegra: pmc: Enable core domain support for Tegra20 and Tegra30
Date: Mon, 20 Sep 2021 21:11:40 +0300
Message-Id: <20210920181145.19543-31-digetx@gmail.com>
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

All device drivers got runtime PM and OPP support. Flip the core domain
support status for Tegra20 and Tegra30 SoCs.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 3e52ceada60c..7c7aff8120d4 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3042,7 +3042,7 @@ static void tegra20_pmc_setup_irq_polarity(struct tegra_pmc *pmc,
 }
 
 static const struct tegra_pmc_soc tegra20_pmc_soc = {
-	.supports_core_domain = false,
+	.supports_core_domain = true,
 	.num_powergates = ARRAY_SIZE(tegra20_powergates),
 	.powergates = tegra20_powergates,
 	.num_cpu_powergates = 0,
@@ -3103,7 +3103,7 @@ static const char * const tegra30_reset_sources[] = {
 };
 
 static const struct tegra_pmc_soc tegra30_pmc_soc = {
-	.supports_core_domain = false,
+	.supports_core_domain = true,
 	.num_powergates = ARRAY_SIZE(tegra30_powergates),
 	.powergates = tegra30_powergates,
 	.num_cpu_powergates = ARRAY_SIZE(tegra30_cpu_powergates),
-- 
2.32.0

