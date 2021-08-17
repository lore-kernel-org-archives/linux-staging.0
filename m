Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB8B6D18
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 01:30:07 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id s3so1180122ljp.11
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 18:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wojn7XneOlcjLQTZlMLpcmbGjIOEPaqexo+f2WGyphI=;
        b=Xq17kIc6GM80MD2xhnYjU7c3bLn4H5tuMTvcdBwNy9/g5psmoz3S1gVRRgj0w10xku
         S/OHY+MF1OPdTYbYPPJFPFeY4WU63WLX4lpEqf+XHRBxzSyKtJkRoLEZsNrLQUD3aJsJ
         hyYwTr0Z48Wws5sZA3cunYGug92vOCdPP0286zyvF+xLx0QRLRMNonrX8WWxK9M03w18
         x2KNq+2YuwXI/DgRg4TCi8S5zBrr/YRsvFRqgRHtf1EkBhMZn+P2C2QCgMgcjYbkv0RV
         MYPdW+7zuuviGgSMO06r+pSAqvsVA5K8VmFJ2RBZodvpwXKzfElGK+ZIvdNgJ/4RFBSg
         0SYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wojn7XneOlcjLQTZlMLpcmbGjIOEPaqexo+f2WGyphI=;
        b=W7LeQRB++MfHK6kIRxRlTQ8+Nri5IA1Mq8peYLdh6QXCtj3098rxBtDBezjZFgrJsV
         exbMdg4Gi0TkcpfgStqPUZCFRZzmrqPUBhhL/73ZZMmrUOD2TPdy3TfU9uf1pdC01cA+
         wj38xS6OTporwOT8Vj1kGlEJ48rBH1DKiqvxzFbozQESKxikL2xW2rBV0pp47yi9SkK1
         yNa7DazbZRf7pl585qj2HtQjbJgXWU4tvYE4xTpd8MBop8pf0NU9Xab9GQO0yUzDfoCH
         Y/wTCbXW3ec8IzB3qvFBcNoe2rR3wESQqsj+tyoLhjXNWbbzHSR1uw5MNt4frjpay2ct
         HrkA==
X-Gm-Message-State: AOAM531zOq64zMgg3sW1JbmV9nO7JvgK/66W+2pqSxrbbLEMX7yGGlhL
	4zGDati9MD7oVQ0s99/5scI=
X-Google-Smtp-Source: ABdhPJzrAiKknpayvUXn0AhIlpxoa1tdB8UGRkYEeNvPAIQMKmclxsnV8VxQdGuN29ZUiGnqlWbG1A==
X-Received: by 2002:a2e:b0e2:: with SMTP id h2mr848215ljl.23.1629163806184;
        Mon, 16 Aug 2021 18:30:06 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru. [46.138.85.91])
        by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 18:30:05 -0700 (PDT)
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
Subject: [PATCH v8 04/34] soc/tegra: Add devm_tegra_core_dev_init_opp_table_simple()
Date: Tue, 17 Aug 2021 04:27:24 +0300
Message-Id: <20210817012754.8710-5-digetx@gmail.com>
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

Only couple drivers need to get the -ENODEV error code and explicitly
initialize the performance state. Add new helper that allows to avoid
the extra boilerplate code in majority of drivers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/soc/tegra/common.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/soc/tegra/common.h b/include/soc/tegra/common.h
index af41ad80ec21..265ad90e45a2 100644
--- a/include/soc/tegra/common.h
+++ b/include/soc/tegra/common.h
@@ -39,4 +39,17 @@ devm_tegra_core_dev_init_opp_table(struct device *dev,
 }
 #endif
 
+static inline int
+devm_tegra_core_dev_init_opp_table_simple(struct device *dev)
+{
+	struct tegra_core_opp_params params = {};
+	int err;
+
+	err = devm_tegra_core_dev_init_opp_table(dev, &params);
+	if (err != -ENODEV)
+		return err;
+
+	return 0;
+}
+
 #endif /* __SOC_TEGRA_COMMON_H__ */
-- 
2.32.0

