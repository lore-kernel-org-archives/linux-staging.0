Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511B43FC0
	for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 18:12:38 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id i4so71811477lfv.4
        for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 11:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=myD2habKvt7RXAHJbtKPfyU4WLnqnb1bLB54hjelw1E=;
        b=Wwh5Bp61loEgevDUFcsNB1xPMhR1XTpK+N5ivwKy3o+MQreoLkBZiSjBr1jHTPesp/
         y/RfPU1kIhmHBS4vZnv1ofR8MSrfOTaVskrC+CjJ/iyi3SBAtlMhN/5K8QIbifnjOkuu
         Dh97HFATcsIjwx7rWqSro8j+RixDozr05vXauDn4codyUtrpkPAL8OacgXCjMiw9sU6H
         hrJ4bNYPWROFg+PHVRJTKZ6aEWK/3UsIAIkJtdyUrIhQx3KUJx5sHmCOuzEu7Je3Fd8E
         k+UQaoNQXUCMSbxKpQfnFFK1bid7z+ov06RC5SgaW3u6UB/EwwGVRrTWh9dh9YT+vmxe
         5cHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=myD2habKvt7RXAHJbtKPfyU4WLnqnb1bLB54hjelw1E=;
        b=JO6BS1ftoKPKFH7ccnNEMqL700TOO3ZHWCtdRX9vCdeigGKBvawRcOwi6kNfFGO/GF
         XNChjKF3dGfo7TF7akCTrSkU0FBziCylPS/LadDO/bqUzx5br0RsnKOMMyE+8PTH77Hj
         PCS6K+7WCEsAVKanJXQduZdJlpZJZNyw/RBmKfyXplsaSelQfdIDIi1O+v14dWh/vAtO
         5z0JzFbDbKM3mwEIBwMB4wDwamYUcD/UW3nfSiNXlev8mHGZcg2qZYHzjyqljceTiAnZ
         DsPpdAtrvQIwCPdsV5jH+7Hw9Wwca320dw5mPf7YNdEBJzfMqEDhO1SOPtwzqhlmkYBl
         ucpw==
X-Gm-Message-State: AOAM530mpVxuKq6kbzm6t4KTWRCxzAw6F+rICWCYYWp01XgiK7X9WqIl
	9s6M0PeCgb7WlHevxvgmm0Q=
X-Google-Smtp-Source: ABdhPJx0jdF0TRfniBGFptMPciVnLNS38vWQMz2X5dyyfZ8CmknMYMYEDaHex2CJkph6/kiivPojgA==
X-Received: by 2002:a2e:2243:: with SMTP id i64mr16693903lji.333.1632161556519;
        Mon, 20 Sep 2021 11:12:36 -0700 (PDT)
Received: from localhost.localdomain (46-138-151-206.dynamic.spd-mgts.ru. [46.138.151.206])
        by smtp.gmail.com with ESMTPSA id u3sm1775677lju.107.2021.09.20.11.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 11:12:36 -0700 (PDT)
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
Subject: [PATCH v12 29/35] soc/tegra: pmc: Rename core power domain
Date: Mon, 20 Sep 2021 21:11:39 +0300
Message-Id: <20210920181145.19543-30-digetx@gmail.com>
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

CORE power domain uses name of device-tree node, which is inconsistent with
the names of PMC domains. Set the name to "core" to make it consistent.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 6759f19b9cd6..3e52ceada60c 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1353,7 +1353,7 @@ static int tegra_pmc_core_pd_add(struct tegra_pmc *pmc, struct device_node *np)
 	if (!genpd)
 		return -ENOMEM;
 
-	genpd->name = np->name;
+	genpd->name = "core";
 	genpd->set_performance_state = tegra_pmc_core_pd_set_performance_state;
 	genpd->opp_to_performance_state = tegra_pmc_core_pd_opp_to_performance_state;
 
-- 
2.32.0

