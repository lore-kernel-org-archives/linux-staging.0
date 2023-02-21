Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B1A8C0B
	for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 18:32:35 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id f13so20464610edz.6
        for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 10:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQSmh32OKE33I5420mu9+Fe2dybwDMzPyqZp98Es5A0=;
        b=NWW0loock5oBID3QFLzVq8K9EpVNYl+ZYmsU652aRgHtxBKeNfj8DPn7GmSYs/ttfZ
         sewS3t7yAWMaLsrLFpM20K9bzEbiga0bMCN6Q1YEmbwN0DCnD4VYXFRhq0Bf22glKT3j
         9ehzd27SMlkUawFEBbW1dlxeCo9EH52YqwvgwEjhMURX18dliuMncwqZStFByf6z9OA7
         6aUSJy1Kfwi2nwHPIG21i5UQo4g2uyHqY012/k1DuJVB57C2RAMteAafi9GTxvY8YmgD
         cMuLN9PWNsYrvyaNfhFkaE/89jEpoSXltkVWUB0ugYGreMFxCMpS62PuwvebAs3GujFe
         +8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQSmh32OKE33I5420mu9+Fe2dybwDMzPyqZp98Es5A0=;
        b=kfUfN3WlVV6PDVQY620MysDP/iDagYsOr2vBYU9DQUIGiPeWbBuk4D0BZq7CNQzzON
         bs85wz+AYTSvoMYfzkwRUH/0JcGGfm/zBgv8Wh8BMs4a6fnTStDhLhLR7h5bmbEikv+i
         H0QRYKFUxLZXjk9p9WvBExupuCfsaqYp0bUVf3DX9NOQnXuDPbC5qJ+M8meBXfg9ICZK
         XCKo/Ko+JE+6RGqTZ1RI+7yjusVxfEcOcYJGjleRBgsPY3p6cpQOAZjrPi+1P1UNe59r
         4Oor7QTKwvhjclGZYYnBTuX0f+9UKD1NlCwYS4SOIiWXAdzPyeuGGovn+ItGGbM6b8kG
         NXaw==
X-Gm-Message-State: AO0yUKX+kz6OkOpQCWP3t1v/h5JfrbQmiGFcMGGsnQRJmWUvPHuMwUGi
	5FgbaDnr8otHn57FrgMR7ANyfsJaVX3cLQ==
X-Google-Smtp-Source: AK7set+fSmOPE7HCxYwmGeNARvkMtewnxLHluxAnobePLwdWIIZgbTWFuCdB66FrKtK6B5zRmhBjXg==
X-Received: by 2002:a05:6402:516e:b0:474:a583:2e1a with SMTP id d14-20020a056402516e00b00474a5832e1amr5711519ede.12.1677004355491;
        Tue, 21 Feb 2023 10:32:35 -0800 (PST)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id i3-20020a50c3c3000000b004af5aa16fcasm169102edf.66.2023.02.21.10.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:32:35 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 10/10] ARM: tegra: transformers: bind FM34NE DSP on supported devices
Date: Tue, 21 Feb 2023 20:32:11 +0200
Message-Id: <20230221183211.21964-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230221183211.21964-1-clamor95@gmail.com>
References: <20230221183211.21964-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FM34NE is mandatory for correct sound work on ASUS Transformers.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/tegra20-asus-tf101.dts      | 14 +++++++++
 arch/arm/boot/dts/tegra30-asus-tf201.dts      | 29 +++++++++++++++++++
 arch/arm/boot/dts/tegra30-asus-tf300t.dts     | 29 +++++++++++++++++++
 arch/arm/boot/dts/tegra30-asus-tf300tg.dts    | 19 ++++++++++++
 arch/arm/boot/dts/tegra30-asus-tf700t.dts     | 19 ++++++++++++
 .../arm/boot/dts/tegra30-pegatron-chagall.dts | 27 +++++++++++++++++
 6 files changed, 137 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-asus-tf101.dts b/arch/arm/boot/dts/tegra20-asus-tf101.dts
index 8d0613567e82..8a51a4c53014 100644
--- a/arch/arm/boot/dts/tegra20-asus-tf101.dts
+++ b/arch/arm/boot/dts/tegra20-asus-tf101.dts
@@ -493,6 +493,20 @@ i2c@7000c000 {
 		status = "okay";
 		clock-frequency = <400000>;
 
+		/* Fortemedia FM34NE voice processor */
+		dsp@60 {
+			compatible = "asus,tf101-dsp", "fortemedia,fm34";
+			reg = <0x60>;
+
+			bypass-gpios = <&gpio TEGRA_GPIO(H, 3) GPIO_ACTIVE_HIGH>;
+			reset-gpios = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_LOW>;
+
+			vdd-supply = <&vdd_1v8_sys>;
+
+			clocks = <&tegra_car TEGRA20_CLK_CDEV1>;
+			clock-names = "mclk";
+		};
+
 		/* Aichi AMI306 digital compass */
 		magnetometer@e {
 			compatible = "asahi-kasei,ak8974";
diff --git a/arch/arm/boot/dts/tegra30-asus-tf201.dts b/arch/arm/boot/dts/tegra30-asus-tf201.dts
index 47865deeb88a..e214fc23609e 100644
--- a/arch/arm/boot/dts/tegra30-asus-tf201.dts
+++ b/arch/arm/boot/dts/tegra30-asus-tf201.dts
@@ -60,6 +60,25 @@ bluetooth {
 		};
 	};
 
+	i2c@7000c000 {
+		/* Fortemedia FM34NE voice processor */
+		dsp@60 {
+			compatible = "asus,tf201-dsp", "fortemedia,fm34";
+			reg = <0x60>;
+
+			bypass-gpios = <&gpio TEGRA_GPIO(BB, 6) GPIO_ACTIVE_HIGH>;
+			reset-gpios = <&gpio TEGRA_GPIO(O, 3) GPIO_ACTIVE_LOW>;
+
+			vdd-supply = <&vdd_1v8_dsp>;
+
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+			clock-names = "mclk";
+
+			assigned-clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_EXTERN1>;
+		};
+	};
+
 	i2c@7000c400 {
 		/* Atmel MXT768E touchscreen */
 		touchscreen@4d {
@@ -606,6 +625,16 @@ haptic-feedback {
 		vcc-supply = <&vdd_3v3_sys>;
 	};
 
+	vdd_1v8_dsp: regulator-dsp {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v8_dsp";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&gpio TEGRA_GPIO(U, 5) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_1v8_vio>;
+	};
+
 	sound {
 		compatible = "asus,tegra-audio-rt5631-tf201",
 			     "nvidia,tegra-audio-rt5631";
diff --git a/arch/arm/boot/dts/tegra30-asus-tf300t.dts b/arch/arm/boot/dts/tegra30-asus-tf300t.dts
index 78f78cca337a..2dcf0e1f6ca2 100644
--- a/arch/arm/boot/dts/tegra30-asus-tf300t.dts
+++ b/arch/arm/boot/dts/tegra30-asus-tf300t.dts
@@ -68,6 +68,25 @@ bluetooth {
 		};
 	};
 
+	i2c@7000c000 {
+		/* Fortemedia FM34NE voice processor */
+		dsp@60 {
+			compatible = "asus,tf300t-dsp", "fortemedia,fm34";
+			reg = <0x60>;
+
+			bypass-gpios = <&gpio TEGRA_GPIO(BB, 6) GPIO_ACTIVE_HIGH>;
+			reset-gpios = <&gpio TEGRA_GPIO(O, 3) GPIO_ACTIVE_LOW>;
+
+			vdd-supply = <&vdd_1v8_dsp>;
+
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+			clock-names = "mclk";
+
+			assigned-clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_EXTERN1>;
+		};
+	};
+
 	i2c@7000c400 {
 		/* Elantech EKTH1036 touchscreen */
 		touchscreen@10 {
@@ -999,6 +1018,16 @@ display-panel {
 		compatible = "innolux,g101ice-l01";
 	};
 
+	vdd_1v8_dsp: regulator-dsp {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v8_dsp";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&gpio TEGRA_GPIO(P, 3) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_1v8_vio>;
+	};
+
 	sound {
 		compatible = "asus,tegra-audio-wm8903-tf300t",
 			     "nvidia,tegra-audio-wm8903";
diff --git a/arch/arm/boot/dts/tegra30-asus-tf300tg.dts b/arch/arm/boot/dts/tegra30-asus-tf300tg.dts
index 82c51e177a70..7f23021611a4 100644
--- a/arch/arm/boot/dts/tegra30-asus-tf300tg.dts
+++ b/arch/arm/boot/dts/tegra30-asus-tf300tg.dts
@@ -164,6 +164,25 @@ bluetooth {
 		};
 	};
 
+	i2c@7000c000 {
+		/* Fortemedia FM34NE voice processor */
+		dsp@60 {
+			compatible = "asus,tf300t-dsp", "fortemedia,fm34";
+			reg = <0x60>;
+
+			bypass-gpios = <&gpio TEGRA_GPIO(BB, 6) GPIO_ACTIVE_HIGH>;
+			reset-gpios = <&gpio TEGRA_GPIO(O, 3) GPIO_ACTIVE_LOW>;
+
+			vdd-supply = <&vdd_1v8_vio>;
+
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+			clock-names = "mclk";
+
+			assigned-clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_EXTERN1>;
+		};
+	};
+
 	i2c@7000c400 {
 		/* Elantech EKTH1036 touchscreen */
 		touchscreen@10 {
diff --git a/arch/arm/boot/dts/tegra30-asus-tf700t.dts b/arch/arm/boot/dts/tegra30-asus-tf700t.dts
index 766225ebdeab..bbb33119780e 100644
--- a/arch/arm/boot/dts/tegra30-asus-tf700t.dts
+++ b/arch/arm/boot/dts/tegra30-asus-tf700t.dts
@@ -85,6 +85,25 @@ bluetooth {
 		};
 	};
 
+	i2c@7000c000 {
+		/* Fortemedia FM34NE voice processor */
+		dsp@60 {
+			compatible = "asus,tf700t-dsp", "fortemedia,fm34";
+			reg = <0x60>;
+
+			bypass-gpios = <&gpio TEGRA_GPIO(BB, 6) GPIO_ACTIVE_HIGH>;
+			reset-gpios = <&gpio TEGRA_GPIO(O, 3) GPIO_ACTIVE_LOW>;
+
+			vdd-supply = <&vdd_1v8_vio>;
+
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+			clock-names = "mclk";
+
+			assigned-clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_EXTERN1>;
+		};
+	};
+
 	i2c@7000c400 {
 		/* Elantech ELAN-3024-7053 or 5184N FPC-1 REV: 2/3 touchscreen */
 		touchscreen@10 {
diff --git a/arch/arm/boot/dts/tegra30-pegatron-chagall.dts b/arch/arm/boot/dts/tegra30-pegatron-chagall.dts
index 6e24b095713b..007ba3f3e95e 100644
--- a/arch/arm/boot/dts/tegra30-pegatron-chagall.dts
+++ b/arch/arm/boot/dts/tegra30-pegatron-chagall.dts
@@ -1145,6 +1145,23 @@ lcd_ddc: i2c@7000c000 {
 		status = "okay";
 		clock-frequency = <400000>;
 
+		/* Fortemedia FM34NE voice processor */
+		dsp@60 {
+			compatible = "pegatron,chagall-dsp", "fortemedia,fm34";
+			reg = <0x60>;
+
+			bypass-gpios = <&gpio TEGRA_GPIO(N, 3) GPIO_ACTIVE_HIGH>;
+			reset-gpios = <&gpio TEGRA_GPIO(N, 0) GPIO_ACTIVE_LOW>;
+
+			vdd-supply = <&vdd_1v8_dsp>;
+
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+			clock-names = "mclk";
+
+			assigned-clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_EXTERN1>;
+		};
+
 		/* Wolfson Microelectronics WM8903 audio codec */
 		wm8903: audio-codec@1a {
 			compatible = "wlf,wm8903";
@@ -1500,6 +1517,16 @@ vdd_vbus_usb3: regulator-usb3 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
+	vdd_1v8_dsp: regulator-dsp {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v8_dsp";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&gpio TEGRA_GPIO(N, 1) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_1v8_vio>;
+	};
+
 	pmc@7000e400 {
 		status = "okay";
 		nvidia,invert-interrupt;
-- 
2.37.2

