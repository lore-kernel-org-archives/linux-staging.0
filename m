Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B23B2C87
	for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 14:40:22 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id f7-20020a1c1f07000000b0032ee11917ceso5128981wmf.0
        for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 07:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n0RL45OoJsxDqII6WqqJzrCBAIvt4D77cElanpVHtTc=;
        b=gtuhSz4DAGYUE712H91wWENxla1s2GyGMB+QURPtuQaMUIMsoKzuIsaq4h+Rm0RXCa
         g9jASJulvUeM2C4HfO5V3C/zXeY5p8BnVXggF9ySsenxGOxq7CSzlCD9271wNThigu92
         06nFEYFeLWE5J/EQ9iloJJw3yBOtSmCZogmkAyb2QFIHO0MttRfvr//foyhlwmPU39yB
         3G9xiexsV53ifxEHjRKa/BlGUDKvza8wY19XxQSmTI8YLNUu3cdwbPVOHOBux9254Wdu
         S2aWMkQgm6DaupV55PnCx1BSzPbnl4hMwjxCvf/81ICwm3U5gBrplfdLlxgUMhYsu6Cd
         I1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n0RL45OoJsxDqII6WqqJzrCBAIvt4D77cElanpVHtTc=;
        b=ribGeRVWtL9hZDxfD7DJi3SYETeXajdjuKZXKNU9s+82g+cbyBUPD+9nRt9J90jQsF
         nRhdNHfLuA5HiTf6yGZQYF2YOXExswyHXtXS4FGvHCYmwGNY8VuQoLnNL7AVmQ04C5x/
         iUPwFcCgRjV6i5dVOUvLUqv6a9FfesbLPvb10+HvsWGUAjiIoA+EcsGjTnNCuhNmQIm/
         hcaBkhG0PUe1Zb/J4ZHn5pG0/k9sFYRZmJvzAjEB2PMzUcFQF0gIyrJjP792dDLK1OYQ
         LZB2xpQpbo7wG6StaV1C9tebp8P8vxpc2g9HvHLmAqnbCVyG1nKo2/ALX0spovwkNM6o
         4f3g==
X-Gm-Message-State: AOAM533bMlvNjrGSW5B+ueBqQsKDHeYIPJLYaRXW3IuZ1BEfSw485c8y
	EnZeA8b9exhMVS+kZfMAJvA=
X-Google-Smtp-Source: ABdhPJx2hq+eEvZoJMailx3TGWPP3TPqnuSTZCJMY7Vs54/FoHb4RmJi9YCTlTlshjjn+dgPJhqySA==
X-Received: by 2002:a1c:21d7:: with SMTP id h206mr4744868wmh.60.1635604820785;
        Sat, 30 Oct 2021 07:40:20 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id u19sm483602wmm.5.2021.10.30.07.40.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 30 Oct 2021 07:40:20 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: sboyd@kernel.org
Cc: linux-clk@vger.kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	neil@brown.name,
	linux-kernel@vger.kernel.org,
	john@phrozen.org
Subject: [PATCH v4 4/4] staging: mt7621-dts: align resets with binding documentation
Date: Sat, 30 Oct 2021 16:40:14 +0200
Message-Id: <20211030144014.26315-5-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211030144014.26315-1-sergio.paracuellos@gmail.com>
References: <20211030144014.26315-1-sergio.paracuellos@gmail.com>
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
 drivers/staging/mt7621-dts/mt7621.dtsi | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 6d158e4f4b8c..2bf74468d495 100644
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
@@ -153,7 +155,7 @@ gdma: gdma@2800 {
 
 			clocks = <&sysc MT7621_CLK_GDMA>;
 			clock-names = "gdma";
-			resets = <&rstctrl 14>;
+			resets = <&sysc MT7621_RST_GDMA>;
 			reset-names = "dma";
 
 			interrupt-parent = <&gic>;
@@ -172,7 +174,7 @@ hsdma: hsdma@7000 {
 
 			clocks = <&sysc MT7621_CLK_HSDMA>;
 			clock-names = "hsdma";
-			resets = <&rstctrl 5>;
+			resets = <&sysc MT7621_RST_HSDMA>;
 			reset-names = "hsdma";
 
 			interrupt-parent = <&gic>;
@@ -272,11 +274,6 @@ pinmux {
 		};
 	};
 
-	rstctrl: rstctrl {
-		compatible = "ralink,rt2880-reset";
-		#reset-cells = <1>;
-	};
-
 	sdhci: sdhci@1e130000 {
 		status = "disabled";
 
@@ -355,7 +352,7 @@ ethernet: ethernet@1e100000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		resets = <&rstctrl 6 &rstctrl 23>;
+		resets = <&sysc MT7621_CLK_FE &sysc MT7621_CLK_ETH>;
 		reset-names = "fe", "eth";
 
 		interrupt-parent = <&gic>;
@@ -400,7 +397,7 @@ switch0: switch0@0 {
 				#size-cells = <0>;
 				reg = <0>;
 				mediatek,mcm;
-				resets = <&rstctrl 2>;
+				resets = <&sysc MT7621_RST_MCM>;
 				reset-names = "mcm";
 				interrupt-controller;
 				#interrupt-cells = <1>;
@@ -486,7 +483,7 @@ pcie@0,0 {
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0>;
 			interrupt-map = <0 0 0 0 &gic GIC_SHARED 4 IRQ_TYPE_LEVEL_HIGH>;
-			resets = <&rstctrl 24>;
+			resets = <&sysc MT7621_RST_PCIE0>;
 			clocks = <&sysc MT7621_CLK_PCIE0>;
 			phys = <&pcie0_phy 1>;
 			phy-names = "pcie-phy0";
@@ -501,7 +498,7 @@ pcie@1,0 {
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0>;
 			interrupt-map = <0 0 0 0 &gic GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>;
-			resets = <&rstctrl 25>;
+			resets = <&sysc MT7621_RST_PCIE1>;
 			clocks = <&sysc MT7621_CLK_PCIE1>;
 			phys = <&pcie0_phy 1>;
 			phy-names = "pcie-phy1";
@@ -516,7 +513,7 @@ pcie@2,0 {
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

