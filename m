Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C66812
	for <linux-staging@lists.linux.dev>; Wed,  8 Mar 2023 07:35:28 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id cy23so61882010edb.12
        for <linux-staging@lists.linux.dev>; Tue, 07 Mar 2023 23:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678260926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sw6Zqne2z7YifJ5cyYa9t+wWI0sG16wXBTs6NvHN/Wk=;
        b=H5ySkeSBojKDLn9ziiQj/VN4R2TuGi3ptHrTGL5+4i5PLSHGhULRP4wKjh2za4ih0y
         f4ul79eEQClRwZ4ZnKbVfwJUnpet0B35mxxMelxp6jDpC+F4dGVRnRVk5keB25zkY/TJ
         DUnZM2M/Wa2cCVSY7KugZ4vC8fjO0wgOM6qWfcdkSuwqvw9FI/VP50LK5Bt0nTsDmCxm
         MqJmGjbOOg9OWnn4l4Vkq4K2ubOnb+Jv2KjkiHhX1UE38IH5XF0QQppUFdvIZI1zAd+I
         d1+CKSOIrsozHV55AVae1y4wcT7iN0iLucKtsptcPlfd7+Zxc1ULkF/DuceLxJHQR7td
         2UwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678260926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sw6Zqne2z7YifJ5cyYa9t+wWI0sG16wXBTs6NvHN/Wk=;
        b=TzRb4yj58LT2KM8pcDZwaOkHPQiDQvJ0dBCtDOFJ7A+4htktLVpDbs70iulEA9slZ+
         H3NWptk/HUpGuN9F11Kt+J338tF97XWI3i2RMOQIxeulT2dAQeNoOE5m3rZ5JBAh8ZwF
         BdMvvNFCeflI5obHMY47aCLA0BiHbAT4Fv3m3g25aZNAxeYALvlOUarmP/m44vKT2pqB
         xTS+XSUPTcLL3Vgz3NdXsFtcb7huLTWoLnca+FgC6p8ISP6wElT4oeKjrovK0uW8L3a4
         lczCdwwqHZUDtjZF03sY1GgmokQA91UNradgJj0tVjXRsv5hnJ3H4hUXyGZbTOU47h8N
         o40A==
X-Gm-Message-State: AO0yUKUEtli6g1AAYOik1Njd8c8V8pvBRzF27i2KZimWTk0UpVTrmRPG
	3KL2M5rZC8hd0vabsWVh3DU=
X-Google-Smtp-Source: AK7set8pPSSbDp1FRM8zW0XDN2Qq8wKkVkZoYOk4mWKDRu3FvSALDJN6E4fhJ33O8slvQmGDeYGYxQ==
X-Received: by 2002:a17:906:b007:b0:8aa:c038:974c with SMTP id v7-20020a170906b00700b008aac038974cmr16145441ejy.54.1678260926392;
        Tue, 07 Mar 2023 23:35:26 -0800 (PST)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id h15-20020a1709062dcf00b008dffda52d71sm7051880eji.124.2023.03.07.23.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 23:35:26 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
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
Subject: [PATCH v2 3/8] ARM: tegra: transformers: update sound nodes
Date: Wed,  8 Mar 2023 09:34:57 +0200
Message-Id: <20230308073502.5421-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230308073502.5421-1-clamor95@gmail.com>
References: <20230308073502.5421-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- fix headset detection in common device tree;
- diverge control and detect elements for mic;
- use GPIO mic detection on wm8903 devices;

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/tegra20-asus-tf101.dts               | 7 ++++---
 arch/arm/boot/dts/tegra30-asus-tf300t.dts              | 5 ++---
 arch/arm/boot/dts/tegra30-asus-transformer-common.dtsi | 9 +++++----
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-asus-tf101.dts b/arch/arm/boot/dts/tegra20-asus-tf101.dts
index c39ddb462ad0..4ed50b8300b1 100644
--- a/arch/arm/boot/dts/tegra20-asus-tf101.dts
+++ b/arch/arm/boot/dts/tegra20-asus-tf101.dts
@@ -1179,15 +1179,16 @@ sound {
 			"Int Spk", "RON",
 			"Int Spk", "LOP",
 			"Int Spk", "LON",
-			"Mic Jack", "MICBIAS",
-			"IN1L", "Mic Jack";
+			"IN1L", "Int Mic",
+			"IN2L", "Headset Mic";
 
 		nvidia,i2s-controller = <&tegra_i2s1>;
 		nvidia,audio-codec = <&wm8903>;
 
 		nvidia,spkr-en-gpios = <&wm8903 2 GPIO_ACTIVE_HIGH>;
 		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_LOW>;
-		nvidia,headset;
+		nvidia,mic-det-gpios = <&gpio TEGRA_GPIO(X, 1) GPIO_ACTIVE_LOW>;
+		nvidia,coupled-mic-hp-det;
 
 		clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
 			 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
diff --git a/arch/arm/boot/dts/tegra30-asus-tf300t.dts b/arch/arm/boot/dts/tegra30-asus-tf300t.dts
index f47434871a5c..78f78cca337a 100644
--- a/arch/arm/boot/dts/tegra30-asus-tf300t.dts
+++ b/arch/arm/boot/dts/tegra30-asus-tf300t.dts
@@ -1011,13 +1011,12 @@ sound {
 			"Int Spk", "RON",
 			"Int Spk", "LOP",
 			"Int Spk", "LON",
-			"IN1L", "Mic Jack",
-			"IN2L", "Mic Jack",
+			"IN1L", "Headset Mic",
+			"IN2L", "Headset Mic",
 			"DMICDAT", "Int Mic";
 
 		nvidia,audio-codec = <&wm8903>;
 		nvidia,spkr-en-gpios = <&wm8903 2 GPIO_ACTIVE_HIGH>;
-		nvidia,headset;
 	};
 };
 
diff --git a/arch/arm/boot/dts/tegra30-asus-transformer-common.dtsi b/arch/arm/boot/dts/tegra30-asus-transformer-common.dtsi
index 08ea9cb32d0e..42dae0f4759e 100644
--- a/arch/arm/boot/dts/tegra30-asus-transformer-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-transformer-common.dtsi
@@ -550,7 +550,7 @@ spi1_mosi_px4 {
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
 			};
 
-			spi2_cs1_n_pw2 {
+			hp_detect {
 				nvidia,pins = "spi2_cs1_n_pw2";
 				nvidia,function = "spi2";
 				nvidia,pull = <TEGRA_PIN_PULL_UP>;
@@ -558,10 +558,10 @@ spi2_cs1_n_pw2 {
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
 			};
 
-			spi2_sck_px2 {
+			mic_detect {
 				nvidia,pins = "spi2_sck_px2";
 				nvidia,function = "spi2";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
 			};
@@ -1674,7 +1674,8 @@ sound {
 		nvidia,i2s-controller = <&tegra_i2s1>;
 
 		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_LOW>;
-		nvidia,hp-mute-gpios = <&gpio TEGRA_GPIO(X, 2) GPIO_ACTIVE_LOW>;
+		nvidia,mic-det-gpios = <&gpio TEGRA_GPIO(X, 2) GPIO_ACTIVE_LOW>;
+		nvidia,coupled-mic-hp-det;
 
 		clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
 			 <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
-- 
2.37.2

