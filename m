Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5B43FC0
	for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 18:12:45 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id b15so52888034lfe.7
        for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 11:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bHV0bQfFsqKEqBYRxEIpvsDc8HNhAwowLE0FplFjNDU=;
        b=jhLz4xJJJl3o4CnHV/WWFHveesLRTYHP/y51fodUc6bAFZeehkqTwpgxUWNB/+AkGl
         NWqpxXlXP79XwEvP+M0FC3+zznHJAC2xsB9laQ9/+dJ7O4zAV+yEDB7HmUHt0FmXNWFw
         70tr/z8wfOPyuMZIu7Hbi4b/YveaSRil95gm5EhLWrP7iktkDJUkAIBCUyOfF7rP+JOb
         Wf56BF+S67tVtnVTAGOCvqBBICz8AiqkiQ+f9aisWd9Su93dOwHb/QPr05caXlTE2w5i
         Tnc+93odYgQjUzp8zpOim0INAF2uVkAeeZl98pTJOu10T5/RiHjv1M5hF0L0we5/cF9D
         6GdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bHV0bQfFsqKEqBYRxEIpvsDc8HNhAwowLE0FplFjNDU=;
        b=Xk3AhBKN2QPHJvyDTC+SmwQmwI7qg+hwtRecUnyTmcJdfSzDXazWpjjUM9hM0fEqQy
         MO7L4lhF0cFFcn6OtMQDVQZvG/0gb2Fl2hpEJ/yqeV4wQ+espA7gGd1nJsS1zSrNtC24
         KoEacll+GKdtqMDQSTiB8iIox+rjoLrJ6D2sReAMKCvaBCfrzDzfPFXlKq1IvhKC7MG2
         ROqlHzHErUtZ1Fzp1PrhBlOFqvCpF+3IFYqyiStG4FeyblLtddr4Eo9naNkzsqNLZP9U
         T6SjG3yuymV2QEZ1W5t13AxVnjLvo5aNFCAbKaKfQQGgwZwQriXj7co7bcnvQ6PnnMQc
         khXA==
X-Gm-Message-State: AOAM532mVi57fXnV+wBkZICdFNjzSshg1kfgrDT461qOCW9Wffyqm1J+
	uySof1B4LgSWoOiS5CUSV/I=
X-Google-Smtp-Source: ABdhPJwTyaGYqlfvaTEz6scN32KAKYSEpXA0rZGM7IsqAJ/oOZlQM/8o9VVgFKeh99CV9X35abqZAw==
X-Received: by 2002:a05:6512:3d0a:: with SMTP id d10mr19891828lfv.481.1632161562304;
        Mon, 20 Sep 2021 11:12:42 -0700 (PDT)
Received: from localhost.localdomain (46-138-151-206.dynamic.spd-mgts.ru. [46.138.151.206])
        by smtp.gmail.com with ESMTPSA id u3sm1775677lju.107.2021.09.20.11.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 11:12:41 -0700 (PDT)
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
Subject: [PATCH v12 33/35] ARM: tegra: Add Memory Client resets to Tegra20 GR2D, GR3D and Host1x
Date: Mon, 20 Sep 2021 21:11:43 +0300
Message-Id: <20210920181145.19543-34-digetx@gmail.com>
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

