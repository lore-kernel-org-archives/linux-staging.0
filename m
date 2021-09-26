Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEDE3FC7
	for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 22:42:29 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id x27so68577174lfu.5
        for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 15:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b3yXsdmsWJbu2CaukGByuPBPrpPUHlzf8e1vIPRsAi8=;
        b=ipithlZ1tm1MVGl7JpUknjdb7x6HalsbDPFYbcGd1ZEKet3JA9Wwn1RW3eJfFSk8tT
         unIyb95ZWbDM+eIcLls04SAQcrgSB23VZzJCrGqyA7dYq6lG9E1w1Q/gdqZPnMlboyP/
         dKSiX8FvgteVLLaauMYVKUTE5tPww16vAzwgJkLXOkbpbRoJRs95t5DDFYKEaKqUZpCr
         KsuCf1uxkGD1FctrItdkb1PU0r2w5Lq0NlUWPVNh5REmgXLNIELWeU4FH5ozC8h1UPSv
         7j8QB1njjZnrBGcUIV5pAChur4aZGtuCrEX0rXEma37p5JweFFEo214W+0AHEDXH2TEe
         9FPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b3yXsdmsWJbu2CaukGByuPBPrpPUHlzf8e1vIPRsAi8=;
        b=Uo3tDwEag49e2PlhrKpZYBXHIPVN7PMS1fhIOSDg5WnzvHXV/oXUV2Xpjipe6s8KV8
         ZGNU51n+7xtQaL3AX+aUoZ9EjZ/6s3K/VFDhWVL2Ba8ivgF/uP+Wna5mzeyaLQGRibbx
         5ecBix//fIx5BuVMk7DxfBAO3dYeY2tV54lHfNNuOMuHxrwcu5qBYc19kPWlu6+0vvxc
         khoAaNBaU+5aT79lyxUby1IRqHRnYh0A5FSojXUBba6Xh8kvokz/bZhIUFMPMZvOZtdf
         vlq/gaKZtbYNC4v7Wb3hYm6S8fbv2OK9a8ZbTniZEB1hNMgKRWr0ipPLobQ3GF6BTDVX
         wJJQ==
X-Gm-Message-State: AOAM533j8/Q2bYuaUPpWPPMx/qytLLBPFC3h42t1FsTo3o9uRcps7xRA
	pvZodPzOOJydPpcEXKWr9Bo=
X-Google-Smtp-Source: ABdhPJw+KOZ6Qf0oXnKXaMV8UXztvPDFJ7iD/97DIKCC8FM8OYDKt8V3/9Xjutnqj4BqimYX0e0Jtg==
X-Received: by 2002:a05:651c:290:: with SMTP id b16mr26341556ljo.178.1632696147847;
        Sun, 26 Sep 2021 15:42:27 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru. [46.138.80.108])
        by smtp.gmail.com with ESMTPSA id m10sm1408899lfr.272.2021.09.26.15.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 15:42:27 -0700 (PDT)
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
Subject: [PATCH v13 02/35] soc/tegra: Add devm_tegra_core_dev_init_opp_table_common()
Date: Mon, 27 Sep 2021 01:40:25 +0300
Message-Id: <20210926224058.1252-3-digetx@gmail.com>
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

