Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F143FCF
	for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 22:42:35 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id t10so68464596lfd.8
        for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 15:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+TXI1PsD2CP95PVSZQdBoUU6aVsve75rwezr3hbKqQc=;
        b=AEzo2grBWd8RtPGCYLgW37xohRbafUJexvpBchhhjQfHpYuCWl/du5G6kPX2izR/VG
         UwFgzA7nnZusQEnA+2WqMECKyp60I7oO+exN38s649kgWl3Grh5i7Yb2OMPPBxTKqK5B
         avlMc362cvH44d9vADu6Gw0F6oVVybwhBWK0AG9Ik+fhI3N3XH9K1+/nHep0OYpODI14
         txqBFw76potS/8mOSFI0woenVwQhMGpkpT8JUF7XbY53UfHLtpal/wSfXuiXSDP3VXuD
         Ddsno/46Y3Lb7jy9MTZxiP8kSSi4BgKqX8DyjGBLBXEXDhuU3F3Zhw9i/C3V6giVXMfM
         rmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+TXI1PsD2CP95PVSZQdBoUU6aVsve75rwezr3hbKqQc=;
        b=ybJ7+DyHh+EOP/uhv/BAJRcDs2y1EOsJgwc4li+tikWlXQotDLTBIRDlg/x9qcu7g2
         419c2GRULcolThORAJZ8Fj+IMpf8ZAnJVzncrTmQA2zm/es6NvuO6yZB8r6y/Fw5OfXc
         CEljDbwo6afMmbTFrmWwTqvlrJnAnyWlELTYMtX3AMxFbQVrtoJOS6WtGeGhL9h9ZHKK
         TRR/r7/RaMJMusqVZbAtDO3W2nEoaHUao/BCTmBsYkU6o8pnQK5gDtwLc8VheZu7Cjgu
         7w+y9txRjsUGviWc0AuG0/eCcYHq0RdG6eth9amfAD130feaNEy3NrfsYic4byp+yKFI
         xbog==
X-Gm-Message-State: AOAM53113n3lXYMz53HHe4MXVeRKg8xgWkKSIOt1zmqkm19VPlyVqVVh
	r5aTgxLD7jeExDdBW6f8y2A=
X-Google-Smtp-Source: ABdhPJxsFrmAZfn97FgJhfq3KFba8PBYSffykkTrTZoQA7ZqhmERKvPxL2bYanLEm2Nd7lYlyl65KA==
X-Received: by 2002:a05:6512:118a:: with SMTP id g10mr21807169lfr.206.1632696154129;
        Sun, 26 Sep 2021 15:42:34 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru. [46.138.80.108])
        by smtp.gmail.com with ESMTPSA id m10sm1408899lfr.272.2021.09.26.15.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 15:42:33 -0700 (PDT)
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
Subject: [PATCH v13 07/35] dt-bindings: host1x: Document OPP and power domain properties
Date: Mon, 27 Sep 2021 01:40:30 +0300
Message-Id: <20210926224058.1252-8-digetx@gmail.com>
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

Document new DVFS OPP table and power domain properties of the Host1x bus
and devices sitting on the bus.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../display/tegra/nvidia,tegra20-host1x.txt   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 8a6d3e1ee306..62861a8fb5c6 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -20,6 +20,18 @@ Required properties:
 - reset-names: Must include the following entries:
   - host1x
 
+Optional properties:
+- operating-points-v2: See ../bindings/opp/opp.txt for details.
+  - power-domains: Phandle to HEG or core power domain.
+
+For each opp entry in 'operating-points-v2' table of host1x and its modules:
+- opp-supported-hw: One bitfield indicating:
+	On Tegra20: SoC process ID mask
+	On Tegra30+: SoC speedo ID mask
+
+	A bitwise AND is performed against the value and if any bit
+	matches, the OPP gets enabled.
+
 Each host1x client module having to perform DMA through the Memory Controller
 should have the interconnect endpoints set to the Memory Client and External
 Memory respectively.
@@ -45,6 +57,8 @@ of the following host1x client modules:
   - interconnect-names: Must include name of the interconnect path for each
     interconnect entry. Consult TRM documentation for information about
     available memory clients, see MEMORY CONTROLLER section.
+  - operating-points-v2: See ../bindings/opp/opp.txt for details.
+  - power-domains: Phandle to MPE power domain.
 
 - vi: video input
 
@@ -128,6 +142,8 @@ of the following host1x client modules:
   - interconnect-names: Must include name of the interconnect path for each
     interconnect entry. Consult TRM documentation for information about
     available memory clients, see MEMORY CONTROLLER section.
+  - operating-points-v2: See ../bindings/opp/opp.txt for details.
+  - power-domains: Phandle to VENC power domain.
 
 - epp: encoder pre-processor
 
@@ -147,6 +163,8 @@ of the following host1x client modules:
   - interconnect-names: Must include name of the interconnect path for each
     interconnect entry. Consult TRM documentation for information about
     available memory clients, see MEMORY CONTROLLER section.
+  - operating-points-v2: See ../bindings/opp/opp.txt for details.
+  - power-domains: Phandle to HEG or core power domain.
 
 - isp: image signal processor
 
@@ -166,6 +184,7 @@ of the following host1x client modules:
   - interconnect-names: Must include name of the interconnect path for each
     interconnect entry. Consult TRM documentation for information about
     available memory clients, see MEMORY CONTROLLER section.
+  - power-domains: Phandle to VENC or core power domain.
 
 - gr2d: 2D graphics engine
 
@@ -185,6 +204,8 @@ of the following host1x client modules:
   - interconnect-names: Must include name of the interconnect path for each
     interconnect entry. Consult TRM documentation for information about
     available memory clients, see MEMORY CONTROLLER section.
+  - operating-points-v2: See ../bindings/opp/opp.txt for details.
+  - power-domains: Phandle to HEG or core power domain.
 
 - gr3d: 3D graphics engine
 
@@ -209,6 +230,8 @@ of the following host1x client modules:
   - interconnect-names: Must include name of the interconnect path for each
     interconnect entry. Consult TRM documentation for information about
     available memory clients, see MEMORY CONTROLLER section.
+  - operating-points-v2: See ../bindings/opp/opp.txt for details.
+  - power-domains: Phandles to 3D or core power domain.
 
 - dc: display controller
 
@@ -241,6 +264,8 @@ of the following host1x client modules:
   - interconnect-names: Must include name of the interconnect path for each
     interconnect entry. Consult TRM documentation for information about
     available memory clients, see MEMORY CONTROLLER section.
+  - operating-points-v2: See ../bindings/opp/opp.txt for details.
+  - power-domains: Phandle to core power domain.
 
 - hdmi: High Definition Multimedia Interface
 
@@ -267,6 +292,7 @@ of the following host1x client modules:
   - nvidia,hpd-gpio: specifies a GPIO used for hotplug detection
   - nvidia,edid: supplies a binary EDID blob
   - nvidia,panel: phandle of a display panel
+  - operating-points-v2: See ../bindings/opp/opp.txt for details.
 
 - tvo: TV encoder output
 
@@ -277,6 +303,10 @@ of the following host1x client modules:
   - clocks: Must contain one entry, for the module clock.
     See ../clocks/clock-bindings.txt for details.
 
+  Optional properties:
+  - operating-points-v2: See ../bindings/opp/opp.txt for details.
+  - power-domains: Phandle to core power domain.
+
 - dsi: display serial interface
 
   Required properties:
@@ -305,6 +335,7 @@ of the following host1x client modules:
   - nvidia,panel: phandle of a display panel
   - nvidia,ganged-mode: contains a phandle to a second DSI controller to gang
     up with in order to support up to 8 data lanes
+  - operating-points-v2: See ../bindings/opp/opp.txt for details.
 
 - sor: serial output resource
 
@@ -408,6 +439,8 @@ Example:
 		clocks = <&tegra_car TEGRA20_CLK_HOST1X>;
 		resets = <&tegra_car 28>;
 		reset-names = "host1x";
+		operating-points-v2 = <&dvfs_opp_table>;
+		power-domains = <&domain>;
 
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -421,6 +454,8 @@ Example:
 			clocks = <&tegra_car TEGRA20_CLK_MPE>;
 			resets = <&tegra_car 60>;
 			reset-names = "mpe";
+			operating-points-v2 = <&dvfs_opp_table>;
+			power-domains = <&domain>;
 		};
 
 		vi@54080000 {
@@ -429,6 +464,7 @@ Example:
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			assigned-clocks = <&tegra_car TEGRA210_CLK_VI>;
 			assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
+			operating-points-v2 = <&dvfs_opp_table>;
 
 			clocks = <&tegra_car TEGRA210_CLK_VI>;
 			power-domains = <&pd_venc>;
@@ -510,6 +546,8 @@ Example:
 			clocks = <&tegra_car TEGRA20_CLK_EPP>;
 			resets = <&tegra_car 19>;
 			reset-names = "epp";
+			operating-points-v2 = <&dvfs_opp_table>;
+			power-domains = <&domain>;
 		};
 
 		isp {
@@ -528,6 +566,8 @@ Example:
 			clocks = <&tegra_car TEGRA20_CLK_GR2D>;
 			resets = <&tegra_car 21>;
 			reset-names = "2d";
+			operating-points-v2 = <&dvfs_opp_table>;
+			power-domains = <&domain>;
 		};
 
 		gr3d {
@@ -536,6 +576,8 @@ Example:
 			clocks = <&tegra_car TEGRA20_CLK_GR3D>;
 			resets = <&tegra_car 24>;
 			reset-names = "3d";
+			operating-points-v2 = <&dvfs_opp_table>;
+			power-domains = <&domain>;
 		};
 
 		dc@54200000 {
@@ -547,6 +589,8 @@ Example:
 			clock-names = "dc", "parent";
 			resets = <&tegra_car 27>;
 			reset-names = "dc";
+			operating-points-v2 = <&dvfs_opp_table>;
+			power-domains = <&domain>;
 
 			interconnects = <&mc TEGRA20_MC_DISPLAY0A &emc>,
 					<&mc TEGRA20_MC_DISPLAY0B &emc>,
@@ -571,6 +615,8 @@ Example:
 			clock-names = "dc", "parent";
 			resets = <&tegra_car 26>;
 			reset-names = "dc";
+			operating-points-v2 = <&dvfs_opp_table>;
+			power-domains = <&domain>;
 
 			interconnects = <&mc TEGRA20_MC_DISPLAY0AB &emc>,
 					<&mc TEGRA20_MC_DISPLAY0BB &emc>,
@@ -596,6 +642,7 @@ Example:
 			resets = <&tegra_car 51>;
 			reset-names = "hdmi";
 			status = "disabled";
+			operating-points-v2 = <&dvfs_opp_table>;
 		};
 
 		tvo {
@@ -604,6 +651,7 @@ Example:
 			interrupts = <0 76 0x04>;
 			clocks = <&tegra_car TEGRA20_CLK_TVO>;
 			status = "disabled";
+			operating-points-v2 = <&dvfs_opp_table>;
 		};
 
 		dsi {
@@ -615,6 +663,7 @@ Example:
 			resets = <&tegra_car 48>;
 			reset-names = "dsi";
 			status = "disabled";
+			operating-points-v2 = <&dvfs_opp_table>;
 		};
 	};
 
-- 
2.32.0

