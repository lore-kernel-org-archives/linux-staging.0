Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A12C3FD4
	for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 22:43:07 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id y26so29090904lfa.11
        for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 15:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bHV0bQfFsqKEqBYRxEIpvsDc8HNhAwowLE0FplFjNDU=;
        b=DDEEPH8BmaeUnAE0HaGtKS6sW6v5mh6xOxJAP+LIFsY9ZgRH95LRVaiagrO/ua0Noh
         aaxszGCtNSWoMbBuyScz2Bj7IxmezI5ElDuYTT8SyI8AiVLADPdAAo1F9Nz8K2Pb8dXP
         u13JjlLmT6USU7UPBc5FnsmEMj35MxD+svAXsCU9j+NlQF87fSsIWEn+x4SMGSAAUdcM
         R01NuN0F0iPZD6lahvqSw+F51vxyYL/0pUqGxxNW0/dIm8gH2P149YshAlxjudVxE9+F
         vB27mB2/jJ5yyZ7TJVdUwAGW/GiYRAReDuHRQs8D24oyAVcCSeawGHepzN7cHXvbgMEg
         V28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bHV0bQfFsqKEqBYRxEIpvsDc8HNhAwowLE0FplFjNDU=;
        b=Sl6WSp3Fn/TCIfamoWybW3eZidXz4xYDLSav8iRhxtD6a7QyGLMdSEc2q53DIYhbTf
         8se44s5M3xG6ZhDNWPSLVmUt+lLX7UVJ0Dzn2wK7uRy/n95zn3KgnSOG+B639cWv2D9d
         mWrX7znZcIsJGe1xc8aDerOjLHj5ZecwdL2UmO+5OXWte8hmc1iLlJExde6VbA24h62r
         TE77oiepeW0TGRG13TQPA11KWC3FC1qNydx6aNWvH4f7YDX3JOXyFskB/9gCCSgVrtWH
         uwZdG6OgsD8I/s//cOZXm1SIvhyozotL981VvdeNFG0nDuDLEB9+IB9xqR7IhjaDhCdN
         g8SQ==
X-Gm-Message-State: AOAM530Sl6EvbVgyNRCCf7irmN1FWl4cJqu0fMybJXIGjY04qNhOjpMq
	hly1BugR7B/j0sJpIKUuYFgUA3n4rOM=
X-Google-Smtp-Source: ABdhPJyjuTmJf1cAS/KQzQ996vS/jIJO7M1myKsBt0eWrlM77NTh5lI01MtIvz1ELE2g7Xha85WxAw==
X-Received: by 2002:ac2:48b2:: with SMTP id u18mr21302659lfg.583.1632696185299;
        Sun, 26 Sep 2021 15:43:05 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru. [46.138.80.108])
        by smtp.gmail.com with ESMTPSA id m10sm1408899lfr.272.2021.09.26.15.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 15:43:05 -0700 (PDT)
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
Subject: [PATCH v13 33/35] ARM: tegra: Add Memory Client resets to Tegra20 GR2D, GR3D and Host1x
Date: Mon, 27 Sep 2021 01:40:56 +0300
Message-Id: <20210926224058.1252-34-digetx@gmail.com>
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

Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index ce38055a8952..eb6e5518fb5f 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -40,8 +40,8 @@ host1x@50000000 {
 		interrupt-names = "syncpt", "host1x";
 		clocks = <&tegra_car TEGRA20_CLK_HOST1X>;
 		clock-names = "host1x";
-		resets = <&tegra_car 28>;
-		reset-names = "host1x";
+		resets = <&tegra_car 28>, <&mc TEGRA20_MC_RESET_HC>;
+		reset-names = "host1x", "mc";
 		operating-points-v2 = <&host1x_dvfs_opp_table>;
 		power-domains = <&pd_core>;
 
@@ -98,8 +98,8 @@ gr2d@54140000 {
 			reg = <0x54140000 0x00040000>;
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA20_CLK_GR2D>;
-			resets = <&tegra_car 21>;
-			reset-names = "2d";
+			resets = <&tegra_car 21>, <&mc TEGRA20_MC_RESET_2D>;
+			reset-names = "2d", "mc";
 			operating-points-v2 = <&gr2d_dvfs_opp_table>;
 			power-domains = <&pd_core>;
 		};
@@ -108,8 +108,8 @@ gr3d@54180000 {
 			compatible = "nvidia,tegra20-gr3d";
 			reg = <0x54180000 0x00040000>;
 			clocks = <&tegra_car TEGRA20_CLK_GR3D>;
-			resets = <&tegra_car 24>;
-			reset-names = "3d";
+			resets = <&tegra_car 24>, <&mc TEGRA20_MC_RESET_3D>;
+			reset-names = "3d", "mc";
 			operating-points-v2 = <&gr3d_dvfs_opp_table>;
 			power-domains = <&pd_3d>;
 		};
-- 
2.32.0

