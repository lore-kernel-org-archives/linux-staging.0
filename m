Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D102CA3
	for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 08:39:17 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id r10so17578231wrc.3
        for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 00:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MQX3WExGOS3qStO9Hx8ccBSuVV1T9JyvQiyN4+V/nRc=;
        b=c9netRRW2LxFeVBediKeE6YWZo/dm+CKFboPq2WcnKK8AMUGmiQywSVslJX+pyn5u4
         qrj3sYUa5amTZrQ41Cz/G7fQqglIBXZGXYV7CRBrbqX4uynhV5hKv1BhI2FGe7slVDF2
         WPx3crRxcejxuvRm9RN8DZjaLxS8iX12+zVx0EveQgCnGTMYErjZuekUW6pOXEC3sMWA
         +MrT23eRKoSMiWrtNs9crtEuI6SyUjO3dv96hglh7NXHkF1hk74BbFEXjgjpRvqOGZkM
         xdJnlz8KZumk2LAPJIzA7oATEB29hI4kc2hZ4zFIk++AOofEjH6XWauf5zRNmxEKnbvg
         tVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MQX3WExGOS3qStO9Hx8ccBSuVV1T9JyvQiyN4+V/nRc=;
        b=rmlv7tS+BvsPFYXE/Qnv0bp/9sOvPjwjiWmaWYTspNEyLRFwEw5pvwEes37ImDbRqb
         Oyv6Lvc/2j4ij4E5MVoXFFLpODiQcFt1vk5A0s1UMbQccefJEGQatRSc39u1HlTyp4PL
         p2cEnZgI8CWFMkbUGRBmH98VkEJTbyjYq/dqGsYycs2K6QJnZTJojXbDB/X4CafGFOXh
         xj2Uzr+4id0mNMvVlUHkbWcqWkmPDgDqZoeFsSjjzqmrrXpJErpbN0SqiEK6RSH0RI9D
         abHaDxCbCZG2TPVfydLGQXILpqMzR7/QezDNFIvP4EVWROHhMxl2FMRDVxlfvb4bE1pD
         hDRg==
X-Gm-Message-State: AOAM532aRkqUsWU8CM7Ox20nLVVy9+kK3iqLUVBALgghSzOCrZkJn0zt
	QGQ1wKdXNBN94ew54jywfYg=
X-Google-Smtp-Source: ABdhPJyJj/1wWKt72t/GoFO0JYub5kLiVdHSZg3NSmH2Ct9SZoL9OLrgpdgKk5fjGQoRg2StoUqDJw==
X-Received: by 2002:a5d:588c:: with SMTP id n12mr64663636wrf.56.1641803955860;
        Mon, 10 Jan 2022 00:39:15 -0800 (PST)
Received: from localhost.localdomain (198.red-81-44-130.dynamicip.rima-tde.net. [81.44.130.198])
        by smtp.gmail.com with ESMTPSA id m7sm508926wmi.13.2022.01.10.00.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 00:39:15 -0800 (PST)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-clk@vger.kernel.org
Cc: john@phrozen.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	p.zabel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	sboyd@kernel.org
Subject: [PATCH v6 4/4] staging: mt7621-dts: align resets with binding documentation
Date: Mon, 10 Jan 2022 09:39:10 +0100
Message-Id: <20220110083910.1351020-5-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220110083910.1351020-1-sergio.paracuellos@gmail.com>
References: <20220110083910.1351020-1-sergio.paracuellos@gmail.com>
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

