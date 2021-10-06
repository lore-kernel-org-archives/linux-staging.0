Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1842C85
	for <linux-staging@lists.linux.dev>; Wed,  6 Oct 2021 06:12:12 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id j8so5207295wro.7
        for <linux-staging@lists.linux.dev>; Tue, 05 Oct 2021 23:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ffRV1lgCZH4SUcwisTjt7KS+V4NY1XyWgQczanLiSKI=;
        b=qi1ALPM0XaBZwFKZd19WunT/AwGxj6bjgOnr+K3kM8QIBoy9JMsbUbzTWczOXCYxAS
         NJIdPdbjU2xov0ZU47bIDnoqqmgyPLQADhVbXmbxIJ5aa6j9CWR0pj35MNoND2sMHUmX
         6/eYpdOHQgC2WHHVli5vkW9pBZnILDKMQjFWlRRrjTZvg4uLNR2M5lLr+lGIcGGcNrMq
         sPw3egVwqyfC0VEfLmrRV0Ph1Bf4WdTu1Kis82DAkFrI0QwyctRFJ5EVRZ18HfRTs02Z
         lnsj9ERkg9TahPVDvwzXYuf1H+YXYjXOy12tEpDxvENpJLdngFJHWmjy4mGAnHF+UWC8
         uVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ffRV1lgCZH4SUcwisTjt7KS+V4NY1XyWgQczanLiSKI=;
        b=rydv4uk1BYA3JyiWFsUnUAEba5yHFUkc0bfcvNG6ISLVV33gc2e0+0kLmq5smNdQLX
         YWiEBJ6kR+ujVElF2u/2FzpBicCBMldJVkMDWGKPwSFY1/PCl9dNfeWZ8BMvORqznt/4
         J0Ld0nFowcCwAeU+tvVv+CdeOHtzLokiJIdzXwPLP4m2xQDlRuCkeKgnn0H+GE01t538
         LI/GEnsqjgfVtXE4gzS89Q2TC0SNg+At6AURX52+F/2nolN5En+3qn4RVTNz8rRH92qM
         ia24nhEAZAC3FvXejKgtyb63MCRjQAHSzYO3uosrzZ0g5ZK1n1ejEGOVlvmerjQeLZkt
         lQBQ==
X-Gm-Message-State: AOAM533R0KyMzWQtOe5R2tab3J66h5ZhyCvpUgzleqiTWLS+aAx2mZkD
	hpJyN7dsli3cuU8+9n9e/ng=
X-Google-Smtp-Source: ABdhPJyf+4z6TTXUkFWGer/Ad1T21KbbOpC1mUtM/48fmv/kGpfqQGCWOiFrCmRzOqYK29zda42oZw==
X-Received: by 2002:a1c:f310:: with SMTP id q16mr8158405wmq.145.1633500730622;
        Tue, 05 Oct 2021 23:12:10 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id e8sm3893071wme.46.2021.10.05.23.12.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Oct 2021 23:12:10 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: sboyd@kernel.org
Cc: linux-clk@vger.kernel.org,
	gregkh@linuxfoundation.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	linux-staging@lists.linux.dev,
	neil@brown.name,
	linux-kernel@vger.kernel.org,
	john@phrozen.org
Subject: [PATCH 4/4] staging: mt7621-dts: align resets with binding documentation
Date: Wed,  6 Oct 2021 08:12:04 +0200
Message-Id: <20211006061204.2854-5-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006061204.2854-1-sergio.paracuellos@gmail.com>
References: <20211006061204.2854-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Binding documentation for compatible 'mediatek,mt7621-sysc' has been updated
to be used as a reset provider. Align reset related bits and system controller
node with binding documentation along the dtsi file.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 27 ++++++++++++--------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 719ef28171f4..72b99d8b4647 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -1,6 +1,7 @@
 #include <dt-bindings/interrupt-controller/mips-gic.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/mt7621-clk.h>
+#include <dt-bindings/reset/mt7621-reset.h>
 
 / {
 	#address-cells = <1>;
@@ -59,6 +60,7 @@ sysc: syscon@0 {
 			compatible = "mediatek,mt7621-sysc", "syscon";
 			reg = <0x0 0x100>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 			ralink,memctl = <&memc>;
 			clock-output-names = "xtal", "cpu", "bus",
 					     "50m", "125m", "150m",
@@ -88,7 +90,7 @@ i2c: i2c@900 {
 
 			clocks = <&sysc MT7621_CLK_I2C>;
 			clock-names = "i2c";
-			resets = <&rstctrl 16>;
+			resets = <&sysc MT7621_RST_I2C>;
 			reset-names = "i2c";
 
 			#address-cells = <1>;
@@ -106,7 +108,7 @@ i2s: i2s@a00 {
 
 			clocks = <&sysc MT7621_CLK_I2S>;
 			clock-names = "i2s";
-			resets = <&rstctrl 17>;
+			resets = <&sysc MT7621_RST_I2S>;
 			reset-names = "i2s";
 
 			interrupt-parent = <&gic>;
@@ -151,7 +153,7 @@ spi0: spi@b00 {
 			clocks = <&sysc MT7621_CLK_SPI>;
 			clock-names = "spi";
 
-			resets = <&rstctrl 18>;
+			resets = <&sysc MT7621_RST_SPI>;
 			reset-names = "spi";
 
 			#address-cells = <1>;
@@ -167,7 +169,7 @@ gdma: gdma@2800 {
 
 			clocks = <&sysc MT7621_CLK_GDMA>;
 			clock-names = "gdma";
-			resets = <&rstctrl 14>;
+			resets = <&sysc MT7621_RST_GDMA>;
 			reset-names = "dma";
 
 			interrupt-parent = <&gic>;
@@ -186,7 +188,7 @@ hsdma: hsdma@7000 {
 
 			clocks = <&sysc MT7621_CLK_HSDMA>;
 			clock-names = "hsdma";
-			resets = <&rstctrl 5>;
+			resets = <&sysc MT7621_RST_HSDMA>;
 			reset-names = "hsdma";
 
 			interrupt-parent = <&gic>;
@@ -286,11 +288,6 @@ pinmux {
 		};
 	};
 
-	rstctrl: rstctrl {
-		compatible = "ralink,rt2880-reset";
-		#reset-cells = <1>;
-	};
-
 	sdhci: sdhci@1E130000 {
 		status = "disabled";
 
@@ -383,7 +380,7 @@ ethernet: ethernet@1e100000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		resets = <&rstctrl 6 &rstctrl 23>;
+		resets = <&sysc MT7621_CLK_FE &sysc MT7621_CLK_ETH>;
 		reset-names = "fe", "eth";
 
 		interrupt-parent = <&gic>;
@@ -428,7 +425,7 @@ switch0: switch0@0 {
 				#size-cells = <0>;
 				reg = <0>;
 				mediatek,mcm;
-				resets = <&rstctrl 2>;
+				resets = <&sysc MT7621_RST_MCM>;
 				reset-names = "mcm";
 				interrupt-controller;
 				#interrupt-cells = <1>;
@@ -514,7 +511,7 @@ pcie@0,0 {
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0>;
 			interrupt-map = <0 0 0 0 &gic GIC_SHARED 4 IRQ_TYPE_LEVEL_HIGH>;
-			resets = <&rstctrl 24>;
+			resets = <&sysc MT7621_RST_PCIE0>;
 			clocks = <&sysc MT7621_CLK_PCIE0>;
 			phys = <&pcie0_phy 1>;
 			phy-names = "pcie-phy0";
@@ -529,7 +526,7 @@ pcie@1,0 {
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0>;
 			interrupt-map = <0 0 0 0 &gic GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>;
-			resets = <&rstctrl 25>;
+			resets = <&sysc MT7621_RST_PCIE1>;
 			clocks = <&sysc MT7621_CLK_PCIE1>;
 			phys = <&pcie0_phy 1>;
 			phy-names = "pcie-phy1";
@@ -544,7 +541,7 @@ pcie@2,0 {
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0>;
 			interrupt-map = <0 0 0 0 &gic GIC_SHARED 25 IRQ_TYPE_LEVEL_HIGH>;
-			resets = <&rstctrl 26>;
+			resets = <&sysc MT7621_RST_PCIE2>;
 			clocks = <&sysc MT7621_CLK_PCIE2>;
 			phys = <&pcie2_phy 0>;
 			phy-names = "pcie-phy2";
-- 
2.33.0

