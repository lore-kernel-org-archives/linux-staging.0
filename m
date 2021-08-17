Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC006D22
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 01:30:42 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id y7so30270114ljp.3
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 18:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=60J1zKMGqQClpjAlwfYK3w3hOCvKtUPwW+X62rifSl4=;
        b=nZrs0079PTPS3BljR7ivklSfIKMYjzJRwaLKLnOuwvosKUmsst450ETTKnKhG3Cbdf
         ra7TeqHqIiw3U3vQ9t6qZsok2irD3NpgBOk1kU5WPn31ddlj/R4HImbc0+Lx2DQB2e2a
         c7oXkBau4gvZYaogfRuy0ONWH+vNFr8Ao4O3xvasenwyHjAkGDL8H5FTCvahAXYMcmUo
         8btctGRo+i3ZlQXEJQBfD7UDZOQqXUPR3Tg4XciA4KhhyOv28kv7soFvX+fEoFyZNFoB
         dyFEQXO25dh527x4rMe4SwiLvdM5EEKAYSIGA4SC241Oh25xPixJnfAF9dgYPOpWDoEF
         pyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=60J1zKMGqQClpjAlwfYK3w3hOCvKtUPwW+X62rifSl4=;
        b=laNIbhmdETwOMZhgTxzpGh36Hnecm0/+LwWHDee1Pi0L8oKJme16S9IkbRilDm4yDK
         2mbp8Ufjmx90qp7oOODGhFkVshKBU/Ow8S+6k79wsYKs5i/VlrqioBsSpZW6nP7kz/cF
         tp0cn2bb2io951OvSKmIeuNtppZM55o99Mw3uDOZuh6o85FHMAhsPEMqh4BGYe5QR6t3
         3SLcAbezHTPjtXnSjqksO4zpLA0qFV4mYTd2e5las/qsDfYkw+CM7BAKAtZAesQa9BVO
         j/2mxBHjmNI6C2bmem8Ufs5xuh8BhcGiwyy+txBzSILPW9iLQBJMplFOd31by8JpCU8y
         4CYQ==
X-Gm-Message-State: AOAM532zwfOYlGFz0fxIApxR7X6jC30MR/dUg5JbZEbXcxPpO7wV9Sjp
	8p5TokG4pcfsCHYIK4X6Ygk=
X-Google-Smtp-Source: ABdhPJwuvwD1gib4BDhWflO433FhV9Cf3uhsE1hmVRkKHj0DPugMv1U9RdezbdxuyL2MZzrg/itOlw==
X-Received: by 2002:a05:651c:1549:: with SMTP id y9mr841295ljp.335.1629163840772;
        Mon, 16 Aug 2021 18:30:40 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru. [46.138.85.91])
        by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 18:30:40 -0700 (PDT)
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
Subject: [PATCH v8 33/34] ARM: tegra: Add Memory Client resets to Tegra30 GR2D, GR3D and Host1x
Date: Tue, 17 Aug 2021 04:27:53 +0300
Message-Id: <20210817012754.8710-34-digetx@gmail.com>
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

Memory access must be blocked before hardware reset is asserted and before
power is gated, otherwise a serious hardware fault is inevitable. Add
reset for memory clients to the GR2D, GR3D and Host1x nodes.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30.dtsi | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 46e7bfa1e894..be6fd700838c 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -123,8 +123,8 @@ host1x@50000000 {
 		interrupt-names = "syncpt", "host1x";
 		clocks = <&tegra_car TEGRA30_CLK_HOST1X>;
 		clock-names = "host1x";
-		resets = <&tegra_car 28>;
-		reset-names = "host1x";
+		resets = <&tegra_car 28>, <&mc TEGRA30_MC_RESET_HC>;
+		reset-names = "host1x", "mc";
 		iommus = <&mc TEGRA_SWGROUP_HC>;
 		operating-points-v2 = <&host1x_dvfs_opp_table>;
 		power-domains = <&pd_heg>;
@@ -190,8 +190,8 @@ gr2d@54140000 {
 			reg = <0x54140000 0x00040000>;
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA30_CLK_GR2D>;
-			resets = <&tegra_car 21>;
-			reset-names = "2d";
+			resets = <&tegra_car 21>, <&mc TEGRA30_MC_RESET_2D>;
+			reset-names = "2d", "mc";
 			operating-points-v2 = <&gr2d_dvfs_opp_table>;
 			power-domains = <&pd_heg>;
 
@@ -205,8 +205,10 @@ gr3d@54180000 {
 				 <&tegra_car TEGRA30_CLK_GR3D2>;
 			clock-names = "3d", "3d2";
 			resets = <&tegra_car 24>,
-				 <&tegra_car 98>;
-			reset-names = "3d", "3d2";
+				 <&tegra_car 98>,
+				 <&mc TEGRA30_MC_RESET_3D>,
+				 <&mc TEGRA30_MC_RESET_3D2>;
+			reset-names = "3d", "3d2", "mc", "mc2";
 			operating-points-v2 = <&gr3d_dvfs_opp_table>;
 			power-domains = <&pd_3d0>, <&pd_3d1>;
 			power-domain-names = "3d0", "3d1";
-- 
2.32.0

