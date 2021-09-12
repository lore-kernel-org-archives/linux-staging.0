Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA1C3FC3
	for <linux-staging@lists.linux.dev>; Sun, 12 Sep 2021 20:10:58 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id u19-20020a7bc053000000b002f8d045b2caso5138055wmc.1
        for <linux-staging@lists.linux.dev>; Sun, 12 Sep 2021 13:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eT76ZvUu/qGSCEQydcaCNX99s+R1UAGie3X1Yy7dR10=;
        b=M/JHpzSbQ/2wlUkwDBMgHTAmFAfUlPmri2QbZj/RUEBU4SEw/6lgfZVIqekNiEpiG+
         SNLaewsrhXM/6L2fOYs6NP4N+PojfNXz+YK720v/5Eqy5xtaXKIRXNbvJgfszd5qM9PZ
         5O64fcU4N/4PWECp7fpSTQlB4z0QOJSUppH5Vqb9Q6PjkHIRad2GOwjPpokGRnWEHafR
         YuJHYcg+zkd0lILRIc9Fjviz5rzd+VIvKxb251ipS5prIPDO8DTmrXkX2NNlgfqUiwtt
         jP59rDGMVurlkFCsuFbLtOj1tLg6Y/2DllKV9TK5LqqpsEd4s9t+wek6/kZFanhrRLgg
         JY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eT76ZvUu/qGSCEQydcaCNX99s+R1UAGie3X1Yy7dR10=;
        b=W2LmQDQWxTNSYXjppkbbi0riRnPeuP87Oek5LpTALCmaJ2/z+fAkWtP8G6ru+xXLnP
         BHhbKcNiO3dPGZ73SYel1pgN2gZngRNpUXzR3ji1Tzi0aqstIDEBe/WV2f6D3VnzjJ7m
         u01xPkNq1vsi5DJ0mGuFMKQqU6IXSvmN4BzH3+GeQiXGemnTWrpmkaAObHXex16q7lgl
         R1MyIGVGE7zyIAJL8mRV5zPs/U9OZckwP22CnKipmQKlLy9xtO3Pud7l5Yxk0/dPjAZe
         5ueevw4n/uRb5bsmKHYEM4dFJlpxpj5HCGsrxANBEQq1kZN+Ygy2TTiwZSjlxA2UhYv+
         0ntg==
X-Gm-Message-State: AOAM531379Iu/0ddDqyFsL0bFnrsN6ToOSSgH9SzTiynXnU7uxs/8JUA
	x+dmFsOgkDCt4GatlB7J4Z0=
X-Google-Smtp-Source: ABdhPJwEk11/Zbt2tol7gmW6xsSAh4csGofazTfbbaJkhV9+/S8OTC9w02L3t8w+lK2Gn9dJw/P9pQ==
X-Received: by 2002:a1c:f706:: with SMTP id v6mr7938044wmh.167.1631477456475;
        Sun, 12 Sep 2021 13:10:56 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru. [46.138.83.36])
        by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 13:10:56 -0700 (PDT)
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
Subject: [PATCH v11 34/34] ARM: tegra20/30: Disable unused host1x hardware
Date: Sun, 12 Sep 2021 23:08:32 +0300
Message-Id: <20210912200832.12312-35-digetx@gmail.com>
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

MPE, VI, EPP and ISP were never used and we don't have drivers for them.
Since these modules are enabled by default in a device-tree, a device is
created for them, blocking voltage scaling because there is no driver to
bind, and thus, state of PMC driver is never synced. Disable them.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 4 ++++
 arch/arm/boot/dts/tegra30.dtsi | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 8ab77583846b..6eb13da7f91f 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -59,6 +59,7 @@ mpe@54040000 {
 			reset-names = "mpe";
 			operating-points-v2 = <&mpe_dvfs_opp_table>;
 			power-domains = <&pd_mpe>;
+			status = "disabled";
 		};
 
 		vi@54080000 {
@@ -70,6 +71,7 @@ vi@54080000 {
 			reset-names = "vi";
 			operating-points-v2 = <&vi_dvfs_opp_table>;
 			power-domains = <&pd_venc>;
+			status = "disabled";
 		};
 
 		epp@540c0000 {
@@ -81,6 +83,7 @@ epp@540c0000 {
 			reset-names = "epp";
 			operating-points-v2 = <&epp_dvfs_opp_table>;
 			power-domains = <&pd_core>;
+			status = "disabled";
 		};
 
 		isp@54100000 {
@@ -91,6 +94,7 @@ isp@54100000 {
 			resets = <&tegra_car 23>;
 			reset-names = "isp";
 			power-domains = <&pd_venc>;
+			status = "disabled";
 		};
 
 		gr2d@54140000 {
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 58ef4983e511..61f74b7879bb 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -145,6 +145,8 @@ mpe@54040000 {
 			power-domains = <&pd_mpe>;
 
 			iommus = <&mc TEGRA_SWGROUP_MPE>;
+
+			status = "disabled";
 		};
 
 		vi@54080000 {
@@ -158,6 +160,8 @@ vi@54080000 {
 			power-domains = <&pd_venc>;
 
 			iommus = <&mc TEGRA_SWGROUP_VI>;
+
+			status = "disabled";
 		};
 
 		epp@540c0000 {
@@ -171,6 +175,8 @@ epp@540c0000 {
 			power-domains = <&pd_heg>;
 
 			iommus = <&mc TEGRA_SWGROUP_EPP>;
+
+			status = "disabled";
 		};
 
 		isp@54100000 {
@@ -183,6 +189,8 @@ isp@54100000 {
 			power-domains = <&pd_venc>;
 
 			iommus = <&mc TEGRA_SWGROUP_ISP>;
+
+			status = "disabled";
 		};
 
 		gr2d@54140000 {
-- 
2.32.0

