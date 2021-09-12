Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B172A3FC3
	for <linux-staging@lists.linux.dev>; Sun, 12 Sep 2021 20:09:39 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id r128-20020a1c4486000000b003065f0bc631so760129wma.0
        for <linux-staging@lists.linux.dev>; Sun, 12 Sep 2021 13:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b3yXsdmsWJbu2CaukGByuPBPrpPUHlzf8e1vIPRsAi8=;
        b=mJdQKdvw/T1WHD6bQEjVMmBbN7DaWLQ8lzGUjo1vlIU+1gEWKCVQWRn15g/gnhI8W5
         d2pStakMymWHTlgQZEJHbhgK7eIg/4Z+gQ1F1i8DAkWUmGISTIcu5/80zCjHmEb8+e8y
         ODX+Ol6dM5QbrfOAs1Ajm/+NiMAlCsnZjSritBeeQfqYaEaZSvmlUbCmovGhHren2/dS
         tV8Fm+3jKIXee5Yg+FuL2/hKt3ljmIbae8PatNYP9JAdrpNquETwVaTVy5uDSMdwlNWd
         FZr+634a/OJXxW5Jx8TJnOhM2IWEVvUwyJg8neySduMfcuUOEaOSwCWfy9EUg59oTHhR
         2zyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b3yXsdmsWJbu2CaukGByuPBPrpPUHlzf8e1vIPRsAi8=;
        b=C3zwSCZJhoKkQgM2kSWxWLIqhLT9ArInIpVTRyUDk/20vY22CGUorn3oxkiPfZ+zfw
         8EQtRX80Tq1VHbRF8XsZBSP8I4xy8SIQulqFu5Y+UolbiGNUB9aNP8H1K79knjPG59T6
         /yxko/3YipAY3+yEojpYaJVLDdlG282CsypXa14cWb7vSBDjE0/YXE95wXbfVBjECa3m
         y63wlw6JCdC9+KB+AZnO/z+ekp5HSsOjE5/h9s+TcoVywlCBodi66Nf3fBT/I+4Xn+xA
         bUKPi57uM+s6wx7MK8yNkl66TsyXNXQ6Izt3R69Uo5lHTJx7ttUt6FyNa2yRyGG+pNrS
         D2XQ==
X-Gm-Message-State: AOAM531Q9rLG67JpmHKLYmgJ71zMRGbE8dozQ1ewUzCa4NyjdTRw2lE4
	FXovtejXYTSCRi/i51LLdcg=
X-Google-Smtp-Source: ABdhPJwk0yn5bxHilmKllDmuRSmM3W8zuYlcPQEH5ywYTDKziHKI7nEbRLuXvtmZG0hMnn6QbSlSww==
X-Received: by 2002:a1c:ed13:: with SMTP id l19mr8072480wmh.48.1631477378162;
        Sun, 12 Sep 2021 13:09:38 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru. [46.138.83.36])
        by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 13:09:37 -0700 (PDT)
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
Subject: [PATCH v11 02/34] soc/tegra: Add devm_tegra_core_dev_init_opp_table_common()
Date: Sun, 12 Sep 2021 23:08:00 +0300
Message-Id: <20210912200832.12312-3-digetx@gmail.com>
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

Only couple drivers need to get the -ENODEV error code and majority of
drivers need to explicitly initialize the performance state. Add new
common helper which sets up OPP table for these drivers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/soc/tegra/common.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/soc/tegra/common.h b/include/soc/tegra/common.h
index af41ad80ec21..5b4a042f60fb 100644
--- a/include/soc/tegra/common.h
+++ b/include/soc/tegra/common.h
@@ -39,4 +39,28 @@ devm_tegra_core_dev_init_opp_table(struct device *dev,
 }
 #endif
 
+/*
+ * This function should be invoked with the enabled runtime PM of the device
+ * in order to initialize performance state properly. Most of Tegra devices
+ * are assumed to be suspended at a probe time and GENPD require RPM to be
+ * enabled to set up the rpm-resume state, otherwise device is active and
+ * performance state is applied immediately. Note that it will initialize
+ * OPP bandwidth if it's wired in a device-tree for this device, which is
+ * undesirable for a suspended device.
+ */
+static inline int
+devm_tegra_core_dev_init_opp_table_common(struct device *dev)
+{
+	struct tegra_core_opp_params opp_params = {};
+	int err;
+
+	opp_params.init_state = true;
+
+	err = devm_tegra_core_dev_init_opp_table(dev, &opp_params);
+	if (err != -ENODEV)
+		return err;
+
+	return 0;
+}
+
 #endif /* __SOC_TEGRA_COMMON_H__ */
-- 
2.32.0

