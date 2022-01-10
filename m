Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2012CA4
	for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 11:49:37 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id p1-20020a1c7401000000b00345c2d068bdso9547104wmc.3
        for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 03:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MQX3WExGOS3qStO9Hx8ccBSuVV1T9JyvQiyN4+V/nRc=;
        b=PogcFR9W1HoqcfZ20kfe+5S9ByTka/NL24Zh7qDZn7hfe/LF5EJZJ0OBRFMcKUe/Hx
         OfSxOcSXT66vQnF2Nx4TFoiAT9Azweigo6rr7MzBnKeTUZIk3sUXEniHkEasCtbxLcxh
         jdhnB/S3XApCCaulQTNJ1NpohN+hecwmWVshKc3sFst9Nii1N9XgkP+kzBH+k+nXDOto
         vtNtkU38xCsGuwWnFu23ndOxsBgG/9aqYqoqFXVJAPDPVEFLYKBpAo9UaG6WM9770APZ
         eWsfPn4HLeQB4iMqu/wAlZgQtskc29rHcpODK+gF+GjG/Bsw2/uGc32oPCJg6Clo0ToI
         Xbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MQX3WExGOS3qStO9Hx8ccBSuVV1T9JyvQiyN4+V/nRc=;
        b=O+3BMVuxuIMpwSdh8BLdtMPDCYdkkhYUzhnaYhAQ2JyMLUPhc4ehP/OW0dPSGmbDwL
         gqCR4oSR+BZfqsPV++dIUvQapIjr3v+xQ9lyIJAChQMrKI++fPrYk9/EGIMmclTypvUm
         scLbV6sZ41kvHexB15JDMO/GFYdytRbaisn+Ew43MeyxobNyirX0MbdzmO3QnsWQdHNs
         yfeOlB8VxNVkL4bqJw6PnX3i4NWUvbyMnk5TjZLspwRJJb/IAUuw+To5f02Im67FFufj
         RqXAwJjGdGy3lhcnLNG1acoaxFx3362Po47O/Q2hZI30OVPWultokSmNzMZ/2CCsQ0Qq
         8Eug==
X-Gm-Message-State: AOAM532VyoJ55i3iqj+kibVnbIZ6KTzpKTFVKxbLRe3lK5PI2ASCIO4u
	lOIhK8jXc3hNti9dbL9sPg0=
X-Google-Smtp-Source: ABdhPJy5rMFXGoG/k0FjA6pDF7/FfquNZhZpzmCKcHzd+PjnCx3jj2I4s+Aq58cmupYcO+HfEN6h9A==
X-Received: by 2002:a05:600c:287:: with SMTP id 7mr754217wmk.98.1641815375956;
        Mon, 10 Jan 2022 03:49:35 -0800 (PST)
Received: from localhost.localdomain (198.red-81-44-130.dynamicip.rima-tde.net. [81.44.130.198])
        by smtp.gmail.com with ESMTPSA id 9sm8090252wrz.90.2022.01.10.03.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 03:49:35 -0800 (PST)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-clk@vger.kernel.org
Cc: john@phrozen.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	p.zabel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	sboyd@kernel.org
Subject: [PATCH v8 4/4] staging: mt7621-dts: align resets with binding documentation
Date: Mon, 10 Jan 2022 12:49:30 +0100
Message-Id: <20220110114930.1406665-5-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220110114930.1406665-1-sergio.paracuellos@gmail.com>
References: <20220110114930.1406665-1-sergio.paracuellos@gmail.com>
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
 drivers/staging/mt7621-dts/mt7621.dtsi | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 644a65d1a6a1..d72673c91dc2 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -2,6 +2,7 @@
 #include <dt-bindings/interrupt-controller/mips-gic.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/mt7621-clk.h>
+#include <dt-bindings/reset/mt7621-reset.h>
 
 / {
 	#address-cells = <1>;
@@ -67,6 +68,7 @@ sysc: syscon@0 {
 			compatible = "mediatek,mt7621-sysc", "syscon";
 			reg = <0x0 0x100>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 			ralink,memctl = <&memc>;
 			clock-output-names = "xtal", "cpu", "bus",
 					     "50m", "125m", "150m",
@@ -96,7 +98,7 @@ i2c: i2c@900 {
 
 			clocks = <&sysc MT7621_CLK_I2C>;
 			clock-names = "i2c";
-			resets = <&rstctrl 16>;
+			resets = <&sysc MT7621_RST_I2C>;
 			reset-names = "i2c";
 
 			#address-cells = <1>;
@@ -137,7 +139,7 @@ spi0: spi@b00 {
 			clocks = <&sysc MT7621_CLK_SPI>;
 			clock-names = "spi";
 
-			resets = <&rstctrl 18>;
+			resets = <&sysc MT7621_RST_SPI>;
 			reset-names = "spi";
 
 			#address-cells = <1>;
@@ -234,11 +236,6 @@ pinmux {
 		};
 	};
 
-	rstctrl: rstctrl {
-		compatible = "ralink,rt2880-reset";
-		#reset-cells = <1>;
-	};
-
 	sdhci: sdhci@1e130000 {
 		status = "disabled";
 
@@ -317,7 +314,7 @@ ethernet: ethernet@1e100000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		resets = <&rstctrl 6 &rstctrl 23>;
+		resets = <&sysc MT7621_RST_FE &sysc MT7621_RST_ETH>;
 		reset-names = "fe", "eth";
 
 		interrupt-parent = <&gic>;
@@ -362,7 +359,7 @@ switch0: switch0@0 {
 				#size-cells = <0>;
 				reg = <0>;
 				mediatek,mcm;
-				resets = <&rstctrl 2>;
+				resets = <&sysc MT7621_RST_MCM>;
 				reset-names = "mcm";
 				interrupt-controller;
 				#interrupt-cells = <1>;
@@ -448,7 +445,7 @@ pcie@0,0 {
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0>;
 			interrupt-map = <0 0 0 0 &gic GIC_SHARED 4 IRQ_TYPE_LEVEL_HIGH>;
-			resets = <&rstctrl 24>;
+			resets = <&sysc MT7621_RST_PCIE0>;
 			clocks = <&sysc MT7621_CLK_PCIE0>;
 			phys = <&pcie0_phy 1>;
 			phy-names = "pcie-phy0";
@@ -463,7 +460,7 @@ pcie@1,0 {
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0>;
 			interrupt-map = <0 0 0 0 &gic GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>;
-			resets = <&rstctrl 25>;
+			resets = <&sysc MT7621_RST_PCIE1>;
 			clocks = <&sysc MT7621_CLK_PCIE1>;
 			phys = <&pcie0_phy 1>;
 			phy-names = "pcie-phy1";
@@ -478,7 +475,7 @@ pcie@2,0 {
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0>;
 			interrupt-map = <0 0 0 0 &gic GIC_SHARED 25 IRQ_TYPE_LEVEL_HIGH>;
-			resets = <&rstctrl 26>;
+			resets = <&sysc MT7621_RST_PCIE2>;
 			clocks = <&sysc MT7621_CLK_PCIE2>;
 			phys = <&pcie2_phy 0>;
 			phy-names = "pcie-phy2";
-- 
2.25.1

