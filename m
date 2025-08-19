Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA32F3570A9
	for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 12:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605836; cv=none; b=XC6e9hKvAqrxAFvd84g23MkBdFs3l8e/Uo3E2QQ3FBZQfEAmgEr9xQ7Ds61igfAU485xezzaqoDreP5yJcTyMt77qYOR5Cb5E+LUQ3zk7qxUXT5cY1kUB7LwFMUzi3p0TRHPNoCD393WPuxeb3Rvdry6aut6n/5sTyBZ6E7hr3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605836; c=relaxed/simple;
	bh=KaBfRdSVp1n4M7D9JKIPTPYpipa5lq4m/RS9a3/MFYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d6JtUldRHM+rYtKvkbJBBJbu4GF+TknUz9s/lbRVpfjif+0CsOg0C7vrk/bUig3iHldaICMV8nFW5t1+9jh/Z0AGlZ3fPxH4eXtJ+PG9CYy6JKpO99cOr7g3YZ/+Zyv8r5CebE//tCw5Csizs0Bec3Z4j+SzQ6TpAMkvShvmjCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCPfYI9h; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCPfYI9h"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb732eee6so849841066b.0
        for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 05:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605833; x=1756210633; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpAJrdDioA3K7/+UDEGCcZqVfZOD6D2E3R2fJlZANzE=;
        b=YCPfYI9hssSc2B51RX++aetjR3k+WFUimAJtBMme+d16ZhRvMe34tz4HDcQd5ZyYlE
         KVsBb3OUzna4IHt2QEqDzCtZ4C5ZfIgMB3QpSdetun9s29nwFWISIH2cq/IUAbdW8nW3
         JJB1621SsAdVDejS1oT7Npr7hFZal+hLRJnJw1JwbSmGeySbKX9NrOesn+u5LUnLQEwZ
         26K/ZLRAbSOKFr1s9l3gVK0Bd5RXx1V0HrxVi9HsK2DO5+tUJJxEGlQ92+v2c5WMWT8+
         KbocZGw9GzD37kn6pCPi+zJGxEcdDX5Qf7HLEzvDJmk7Mr/VoH57iJGMFMF0j4ZdI6HS
         GV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605833; x=1756210633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WpAJrdDioA3K7/+UDEGCcZqVfZOD6D2E3R2fJlZANzE=;
        b=vUyVTpPUEUHZ3P/6CaaWrSVZV20i2jJjIA/3ahmInEXKxk7zMY/EldfR43plXS5mlp
         EfEa5tltQ7HUY8mxUZZBYrEOx6Fep97s0xibnzml1HDlZeBC0r7aETQg5YvyEYLeXqO2
         vRsIhEV8ai7il95MxKHOnQoTUkBFQRLlHVOFqeWIffOrr6IMQzU/7bOxTKcr5ZodaS+7
         sczV+42/IKr6PljuVZ0tJr4RoGMq84p2+HeEQZkLzhoQSaB2FcoWtaQBObgcoOLpA1VG
         faAu+PI84DiI9qMbVIZsdqHYe3iZvFCxLNBPKiqqMcabvJjcLcmBnM5NeocOIyekSSwl
         55rw==
X-Forwarded-Encrypted: i=1; AJvYcCUgk4V9z5qpwoq4lGT8YcUSMm8pLlRPVVLgfzbBaegN1oRLhxZC5nYYILXPyS5DVrVOga+H/VDOtKIhbJMo@lists.linux.dev
X-Gm-Message-State: AOJu0Yy36WXg5S8niQROTlMNcgMbJjWZ9s/lTELKkCjKkLQhdTnxvcip
	jdgMTXEhGI9TMqC/4II5qBVtrr0Xfzl6GEwTFIa+0yVXWiIL234Ehsgo
X-Gm-Gg: ASbGncsJMJJXz5eoEzTYpNHngPzo+HPCbtoVa0CfjvPPpixoJ91Gbm+R9TUf5WmCK+Y
	SoIri4s9uezEkOwPLURxYxJZkmG7KRntj8YWlF7FqwQy+ADrxytb1818B1GAlTrbqAWieSbhZg8
	Q6HmGLY/bL9my+iRyIKHz+pP6aFXcsJxbWWtVnMjDAq8CtcjsO1BfQk+pRxhBxdQ69WTeqPTesK
	MAKbDty8+tfdO+lIg3Ro13l4Wkbn+DpBVRJnLeOiXpi5WdP4VEWt58HHTM3VEYZoPo3bwuQw3T+
	S4yGQa1gPsjewIx37wINNMk8ucx3MLx03h70ZwR7aFcQQc0t95hk/vcRxhnshP/Fn70hHXYImBY
	snwOopRBkCOfrRM3nZrw30/dr
X-Google-Smtp-Source: AGHT+IHvM5DccqskpaOVZxNfX6lgCDdNfDK3EqRTSS9p/z8kmF7PIsdXdNlSir76MBljF1I98Xhy5g==
X-Received: by 2002:a17:907:7f0e:b0:af4:12f6:420 with SMTP id a640c23a62f3a-afddcb4db40mr234210466b.13.1755605833042;
        Tue, 19 Aug 2025 05:17:13 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:17:12 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 18/19] ARM: tegra: add CSI binding for Tegra20 and Tegra30
Date: Tue, 19 Aug 2025 15:16:30 +0300
Message-ID: <20250819121631.84280-19-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CSI node to Tegra20 and Tegra30 device trees.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra20.dtsi | 17 ++++++++++++++++-
 arch/arm/boot/dts/nvidia/tegra30.dtsi | 19 ++++++++++++++++++-
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra20.dtsi b/arch/arm/boot/dts/nvidia/tegra20.dtsi
index 606839fd40bb..d00786368115 100644
--- a/arch/arm/boot/dts/nvidia/tegra20.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra20.dtsi
@@ -64,7 +64,7 @@ mpe@54040000 {
 
 		vi@54080000 {
 			compatible = "nvidia,tegra20-vi";
-			reg = <0x54080000 0x00040000>;
+			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA20_CLK_VI>;
 			resets = <&tegra_car 20>;
@@ -72,6 +72,21 @@ vi@54080000 {
 			power-domains = <&pd_venc>;
 			operating-points-v2 = <&vi_dvfs_opp_table>;
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x54080000 0x4000>;
+
+			csi@800 {
+				compatible = "nvidia,tegra20-csi";
+				reg = <0x800 0x200>;
+				clocks = <&tegra_car TEGRA20_CLK_CSI>;
+				clock-names = "csi";
+				power-domains = <&pd_venc>;
+
+				status = "disabled";
+			};
 		};
 
 		/* DSI MIPI calibration logic is a part of VI/CSI */
diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nvidia/tegra30.dtsi
index d9223bd7cf3b..c3e9212d5edf 100644
--- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
@@ -151,7 +151,7 @@ mpe@54040000 {
 
 		vi@54080000 {
 			compatible = "nvidia,tegra30-vi";
-			reg = <0x54080000 0x00040000>;
+			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA30_CLK_VI>;
 			resets = <&tegra_car 20>;
@@ -162,6 +162,23 @@ vi@54080000 {
 			iommus = <&mc TEGRA_SWGROUP_VI>;
 
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x54080000 0x4000>;
+
+			csi@800 {
+				compatible = "nvidia,tegra30-csi";
+				reg = <0x800 0x200>;
+				clocks = <&tegra_car TEGRA30_CLK_CSI>,
+					 <&tegra_car TEGRA30_CLK_CSIA_PAD>,
+					 <&tegra_car TEGRA30_CLK_CSIB_PAD>;
+				clock-names = "csi", "csia_pad", "csib_pad";
+				power-domains = <&pd_venc>;
+
+				status = "disabled";
+			};
 		};
 
 		/* DSI MIPI calibration logic is a part of VI/CSI */
-- 
2.48.1

