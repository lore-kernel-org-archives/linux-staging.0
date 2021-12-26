Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F552C9C
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 15:34:25 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id bu9so29739692lfb.7
        for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 07:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WKOhgFA6EDwm88QeGjFMZpYe/CzCFPYOKrRLqO3vV1k=;
        b=SaKmJaAjNcM38WDeiEpQvB/UDGXuxDY9zScCFHrNM8tcwGHY+atfBHItPABb3EYyTE
         lnj03VfCWZ5yNBTzCfnBCzVDQ0fnfPrz1/wER+E30UP4333/2hY+86NABzb7R11k1OA1
         0k84s65GEGLtSGcU2VmZdBNcAnHesg7LGIANKwvN3rw29kYyVaGH/uhEoYqRwO8XpX+J
         b/Ix2TbNX9SLnPktJNZmQJ1jiR4gSDghVU7CV28AGC01u+LG4RI6gYze3wJyk8mCqTM8
         5/ZF32IgI1hIVVYP0M2PUH8nGf5Lu4Esa+WC7vG9CRVtI8GHohA+TgGa+rJSsmsPsDTD
         Bnbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WKOhgFA6EDwm88QeGjFMZpYe/CzCFPYOKrRLqO3vV1k=;
        b=GWOdo2LnkSdHgvQZXRy3aRpNymA7GSNoLKa4yCnKe6c8fAotmIOI8D+FACN39txD9T
         Bz5r0ZGBom93Fyx3Qksgcx5UVuwaAj+7qddAWAlmUVHvVNKjZgq3dRHOYxR0q23l9yut
         4lueJSNVL1HeUxOcot4qYlJFyRF8Tn8v8/isG/P55rU+XBfhGjqGcydTmqhcRcyqfEE+
         TqfBWxFCJ+ABzedbLqZx7cB79Bf9tAv5Xo+yKO1Ha+V2o7J8G0EvLHIftF+YHcTQe0eJ
         7zKiWzF3KcvzuRrKLwyJV33jntCZGTZ/QsKtZan3WFHBqY3HztxPfD0N9l2KFvr39oV3
         Sk8A==
X-Gm-Message-State: AOAM531RZXBNsyhKw1TaEImAw1zyKPJ9oREfG2HFkB+mqq/Kb1i6cnoQ
	wGQiU7IAZsyumyiJkVR2H2b0Fw==
X-Google-Smtp-Source: ABdhPJzKPNqyGHVcxaijR/QircqRFVi3vsCTgIQTUsGh2adgcNzCVL+1DsTHPd7iRHvAttj++G1Cjw==
X-Received: by 2002:a05:6512:15b:: with SMTP id m27mr9770330lfo.218.1640532863400;
        Sun, 26 Dec 2021 07:34:23 -0800 (PST)
Received: from cobook.home ([176.59.43.180])
        by smtp.gmail.com with ESMTPSA id p14sm1388402ljj.12.2021.12.26.07.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Dec 2021 07:34:22 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Gromm <christian.gromm@microchip.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH 3/3 v2] arm64: dts: renesas: add MOST device
Date: Sun, 26 Dec 2021 18:33:50 +0300
Message-Id: <20211226153349.2296024-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211226082530.2245198-4-nikita.yoush@cogentembedded.com>
References: <20211226082530.2245198-4-nikita.yoush@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds mlp device to dtsi files for R-Car Gen3 SoCs that have
it.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
Change from v1:
- fix power domain ids so all dtbs build properly

 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 13 +++++++++++++
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 13 +++++++++++++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 13 +++++++++++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 13 +++++++++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 13 +++++++++++++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 13 +++++++++++++
 6 files changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 1768a3e6bb8d..179d860ab9c3 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -2412,6 +2412,19 @@ ssi9: ssi-9 {
 			};
 		};
 
+		mlp: mlp@ec520000 {
+			compatible = "renesas,rcar-gen3-mlp";
+			reg = <0 0xec520000 0 0x800>;
+			interrupts = <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 802>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
 		audma0: dma-controller@ec700000 {
 			compatible = "renesas,dmac-r8a7795",
 				     "renesas,rcar-dmac";
diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 2bd8169735d3..1e90e848d2c8 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -2284,6 +2284,19 @@ ssiu97: ssiu-51 {
 			};
 		};
 
+		mlp: mlp@ec520000 {
+			compatible = "renesas,rcar-gen3-mlp";
+			reg = <0 0xec520000 0 0x800>;
+			interrupts = <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 802>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
 		audma0: dma-controller@ec700000 {
 			compatible = "renesas,dmac-r8a7796",
 				     "renesas,rcar-dmac";
diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index a34d5b1d6431..eb70b601191b 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -2128,6 +2128,19 @@ ssiu97: ssiu-51 {
 			};
 		};
 
+		mlp: mlp@ec520000 {
+			compatible = "renesas,rcar-gen3-mlp";
+			reg = <0 0xec520000 0 0x800>;
+			interrupts = <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 802>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
 		audma0: dma-controller@ec700000 {
 			compatible = "renesas,dmac-r8a77961",
 				     "renesas,rcar-dmac";
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 08df75606430..293021f59818 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -2147,6 +2147,19 @@ ssi9: ssi-9 {
 			};
 		};
 
+		mlp: mlp@ec520000 {
+			compatible = "renesas,rcar-gen3-mlp";
+			reg = <0 0xec520000 0 0x800>;
+			interrupts = <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 802>;
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
 		audma0: dma-controller@ec700000 {
 			compatible = "renesas,dmac-r8a77965",
 				     "renesas,rcar-dmac";
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 0ea300a8147d..232391fd0751 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1682,6 +1682,19 @@ ssi9: ssi-9 {
 			};
 		};
 
+		mlp: mlp@ec520000 {
+			compatible = "renesas,rcar-gen3-mlp";
+			reg = <0 0xec520000 0 0x800>;
+			interrupts = <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 802>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
 		audma0: dma-controller@ec700000 {
 			compatible = "renesas,dmac-r8a77990",
 				     "renesas,rcar-dmac";
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 16ad5fc23a67..33d9ed431d9c 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -1132,6 +1132,19 @@ ssi4: ssi-4 {
 			};
 		};
 
+		mlp: mlp@ec520000 {
+			compatible = "renesas,rcar-gen3-mlp";
+			reg = <0 0xec520000 0 0x800>;
+			interrupts = <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 802>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
 		audma0: dma-controller@ec700000 {
 			compatible = "renesas,dmac-r8a77995",
 				     "renesas,rcar-dmac";
-- 
2.30.2

