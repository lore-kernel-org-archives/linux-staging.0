Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCD03FCC
	for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 18:12:45 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id z24so45178868lfu.13
        for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 11:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4IPwObfWulEsKCCQvVJQw75R0yqfJKS73cbuEDacqBA=;
        b=LISu7mlXcT2tM+RNjzV++qoN96WgfrBy1m4cFGoWWjdIXCiuwlfw9bNX9aHfPxmrLk
         ikRGrGu4priRVLU0NTVvxGwIpPLQdJLplhx66WIYoVMgKb8MTMQ+dxyALVGHGTwl1hDy
         vX+ZnUMTxW8wUvWvpZh5gJ+xDUCwsSHDXPKRQ1XZnUC8dtQfI40onXrJQckYikjqYtpu
         KxHSm4tKsYUiFunMWuBt2eIH5qL3MGmXUUDXO8jeY5TBvHOSZ3lCVutKtfWl+0FjrBWh
         HaqMU+NKlVaRtOhZXFeluzRWYCfrGh4K6wCDV8WMhuXVpeEilKkoRcOvdvPD40DmNtYF
         S6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4IPwObfWulEsKCCQvVJQw75R0yqfJKS73cbuEDacqBA=;
        b=sMcGDhNI18JlQy5CFToJAFG2m6bP7FCiiTv9aozxvILGnnGYn+Xk9P1CeKR/txhh/M
         NTSNLFyWMUXH2bfxnNDtd+k2MpXfC20z5YCt6nNJc+nWhVuHGuch2tsScaxFk2GlXi+i
         Ie1z1M4LZjaD1Uf7hJW15vWI8ZvKwT6MOpgE/blNVIm38lGdedfxMR3nkXebFL9LvY1T
         fOzPL5p2TJm3S7q05gr/YQ5f16IEa2g6wx0B1iD75mPW09YsOY3KRU5ONpF/tmtvgEXy
         BZk6PUpbTLGuSDc5Iy091yjEcnC8agQBo+twHDs5lY/UcXGliQ3h/zuMr/eWXx+/AEdO
         Nn+w==
X-Gm-Message-State: AOAM5317iZ5wOGWcTe55JqqZHuGxtzqXeBbqaO8U5pAtTHkG9yjyd0R9
	byVpgUUX08pdu9oDaAmGZ8I=
X-Google-Smtp-Source: ABdhPJyCAzs075RdONJPYQgmcqdeEB3ypUUw5h5hpWvfLUZQc7Wv9IeLuSOQcbardmTM1UEHfLaplw==
X-Received: by 2002:a2e:9e83:: with SMTP id f3mr14183599ljk.309.1632161563819;
        Mon, 20 Sep 2021 11:12:43 -0700 (PDT)
Received: from localhost.localdomain (46-138-151-206.dynamic.spd-mgts.ru. [46.138.151.206])
        by smtp.gmail.com with ESMTPSA id u3sm1775677lju.107.2021.09.20.11.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 11:12:43 -0700 (PDT)
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
Subject: [PATCH v12 34/35] ARM: tegra: Add Memory Client resets to Tegra30 GR2D, GR3D and Host1x
Date: Mon, 20 Sep 2021 21:11:44 +0300
Message-Id: <20210920181145.19543-35-digetx@gmail.com>
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

