Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D91C3FCF
	for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 22:43:08 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id x27so68582296lfu.5
        for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 15:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4IPwObfWulEsKCCQvVJQw75R0yqfJKS73cbuEDacqBA=;
        b=Qo/kaiAYLMAIUjkOYkgCZvKf+2pXbbtGsaY36IIynMFsr4QZ32GqPUgXiWipPLWZ1k
         5qo9qb2rsGJRqYTKaXaWW9l81sGayHwsYLcV3CSKlfyASs7pxHjGXrLVVBdmgmDTNept
         sH9wNPBS63tohJ5IV+cMxcHeYwGI/Q8Y6xocpejvdWaTR3FYfF44uBn6Xw7q8VbBTknL
         X5FF66mN6rcMJltq5qzVo0zwlh05cXrUx1WhMlReVdfkWCstg5U9drSNEXeIZHha5vlx
         waKQfU/ZSnamoeKh5lIWyMa+JI1g6ehB6yCyEDCnhHJ0TV3RY3XY4yWdDdDCUvLBL9s0
         KkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4IPwObfWulEsKCCQvVJQw75R0yqfJKS73cbuEDacqBA=;
        b=ZkF0g69timLvaLjjaygDEPBTXCuYGmrLFQzp1ZcYnYYzSyUmp5goFJtPmge6bdeN8p
         6E9ALEBV5k83H0pJ8dbjWqAripuKyfV3Tk5oWJN04YfSCIVWupe2KqkCYnhORueOGvqT
         rDG+Wi7PIsU4epQAgHZdLUlICDfmloDhepF8E4HLg6Ir0iUjdOOgErRXb3dw2NCs6jF/
         dCnq+q0ah/kh07UFRo/30kVjJLGe25uduM6ZAg9jqq+qcxTV8vTt/AoKV4ivYWthV1Ee
         /+gZswVw3OBNsTiSeRtM/jOYkg5wsgV5wWq2OQJSWvgWxUIljlv7SmfNvDR7hyMBB1CP
         togA==
X-Gm-Message-State: AOAM533AHnTAQI5yWi5kgTPneeZH5trWIUkWgmQWoB1SLEdP5hlcbU36
	RA9ZfGcAX5X1jLzfqlXMuFU=
X-Google-Smtp-Source: ABdhPJwe5xUKZVsnVCXMxWYGWWffwzKGoU9EVrFwGggnVkslkzOKFfdCW9pEHEGbQLNjA0N5ogn19A==
X-Received: by 2002:ac2:4157:: with SMTP id c23mr20725163lfi.184.1632696186533;
        Sun, 26 Sep 2021 15:43:06 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru. [46.138.80.108])
        by smtp.gmail.com with ESMTPSA id m10sm1408899lfr.272.2021.09.26.15.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 15:43:06 -0700 (PDT)
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
Subject: [PATCH v13 34/35] ARM: tegra: Add Memory Client resets to Tegra30 GR2D, GR3D and Host1x
Date: Mon, 27 Sep 2021 01:40:57 +0300
Message-Id: <20210926224058.1252-35-digetx@gmail.com>
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
index c8130f8f680e..09cb1ab75312 100644
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

