Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359C13FC7
	for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 22:43:02 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id i25so68980416lfg.6
        for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 15:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=myD2habKvt7RXAHJbtKPfyU4WLnqnb1bLB54hjelw1E=;
        b=mIfxe0TF/9Pcmy48yz0Fsm9ZchpGfpzi0SLlaP45hHx+C8LQ6p9xMjB3D70WA9M6r4
         f9Aargip+FhmIUdB55HLiFKB+j0CuPHT9193U5qmsrnbn/Shc1W+Vlq4RScSptQph0b2
         zgkvwA9uw/jspllbPLhMek7qZa3C+M4uXTPhgu+iJy9ui2A9cQvS5x86VDhpjfBZa516
         68hec1KCKBc+8zQLs7jcGuH8GoDG8SM6R1dQGUDeR7s+JPShQDnHP4x9Fz7CwQzH2hyu
         MW3MHHj7ACUbOHnjE0xhpImyVDrgU2Fi29vssm/QIqucYYRqM4SuFJTS04LbgtjS8oZZ
         51Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=myD2habKvt7RXAHJbtKPfyU4WLnqnb1bLB54hjelw1E=;
        b=V/Y5sWOwzicAoK8mKC6bBcJrQyFOKkx08wH0KHX/A6K1IqvbF9CG35JV+9t88Z067O
         GLQQkC9QGqzinlAutP1NRhNg41bHiLNkYHYupw0NrKiu/iWQ1ANvIwsyUN2uEuXrBfb/
         awVGwjKwcYQBhOdJo/NnwG2AoZmmxeVTXYj1Z6KbCijPpDk1goX+EBS0GjvJY2Jhw5sM
         3wlGEbqQzuFfSl8TmvJ9+Q4/kJ27TEnPqr7pdv1DIeV1m64lGefIwzmInr8Ncujt+xnJ
         WjJz0BMm02TH3kDmT6ZNCl6yletBW9tSpmGORTLIB2tfMh4nBqKgqodMKUrx4CHlPUmB
         Zlcw==
X-Gm-Message-State: AOAM531yZ2Ren9OceG6X3u97wUDXI1SXIX+cfc6fMcHVokW1GxAmmIaQ
	MDh2YT92gGjCc3tQH4fzAfE=
X-Google-Smtp-Source: ABdhPJz2GN71oCn5sxPfcYLYhElIbf9KK/DAi0VeYmiU+Ndj/lzTslJMlCVfBT6aWvUUtQxHZElN8g==
X-Received: by 2002:a2e:88ce:: with SMTP id a14mr24867181ljk.96.1632696180464;
        Sun, 26 Sep 2021 15:43:00 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru. [46.138.80.108])
        by smtp.gmail.com with ESMTPSA id m10sm1408899lfr.272.2021.09.26.15.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 15:43:00 -0700 (PDT)
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
Subject: [PATCH v13 29/35] soc/tegra: pmc: Rename core power domain
Date: Mon, 27 Sep 2021 01:40:52 +0300
Message-Id: <20210926224058.1252-30-digetx@gmail.com>
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

