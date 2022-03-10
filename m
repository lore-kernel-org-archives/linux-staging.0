Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DD25A1F
	for <linux-staging@lists.linux.dev>; Thu, 10 Mar 2022 20:06:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1646942799; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cC0fEq/Zs3LkAxbo+G7Ahop9m3o96OvQsaoK5cgxf9c2Kua6+hTY19naa2Pnz3OTVdwZZdhBvqb9KM4njalV9tlStTVdch44Cgh1iJ9/pkZ4osSQ+zpph6nPLO/iDJUi7uhIYYrcPkmbfjm50b8e5jsmIv2dLJMBZaLA2+jj2lA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1646942799; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=E2HYzxiU06S9rlZpnQulqVx8R83OC31K7RONYJzcO8A=; 
	b=G6laBB4m8tcj1wuULiWuyND29KWlVzENCuJjOmUq7Z4kN/3jzK5//Y8UE9meVnYfIolv9m4ROfvdUzf7QXP11ivniahVYSQOZayXFgcYWP6ilmSXqvs9seesI8ttSVKcjlxXk4+HatjTrVahPnoBfG4XpEmf3jVpQOtM/M4ZAqE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1646942799;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=E2HYzxiU06S9rlZpnQulqVx8R83OC31K7RONYJzcO8A=;
	b=XYSCkibDVjUhX7fkEnOz4JXwNhRzKtvGPS6uC2r3EunvjAhnMeUm97OFIFaRl8oy
	Kp60HdvYtafMdYf9ry8tDMiwcMz6UPkOCJVZsTXMFn1KoBFkVSSNNApQQCSGxIJEqe+
	KCedjEP3SWMAZifFw0x+jeGTaqDu9Da4UuiWxxdk=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 1646942797076169.4301950853901; Thu, 10 Mar 2022 12:06:37 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	NeilBrown <neil@brown.name>,
	erkin.bozoglu@xeront.com
Cc: linux-staging@lists.linux.dev,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH v2 2/2] staging: mt7621-dts: fix GB-PC2 devicetree
Date: Thu, 10 Mar 2022 23:06:15 +0300
Message-Id: <20220310200615.14484-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310200615.14484-1-arinc.unal@arinc9.com>
References: <20220310200615.14484-1-arinc.unal@arinc9.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Fix the GB-PC2 devicetree. Refer to the schematics of the device for more
information.

GB-PC2 devicetree fixes:
- Include mt7621.dtsi instead of gbpc1.dts. Add the missing definitions.
- Remove gpio-leds node as the system LED is not wired to anywhere on
the board and the power LED is directly wired to GND.
- Remove uart3 pin group from gpio-pinmux node as it's not used as GPIO.
- Use reg 7 for the external phy to be on par with
Documentation/devicetree/bindings/net/dsa/mt7530.txt.
- Use the status value "okay".

Link: https://github.com/ngiger/GnuBee_Docs/blob/master/GB-PCx/Documents/GB-PC2_V1.1_schematic.pdf
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
v2: Use the status value "okay" as it's the official proper spelling.

---
 drivers/staging/mt7621-dts/gbpc2.dts | 109 +++++++++++++++++++++++++--
 1 file changed, 101 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/mt7621-dts/gbpc2.dts b/drivers/staging/mt7621-dts/gbpc2.dts
index 03d6bb6735ac..5753c678783d 100644
--- a/drivers/staging/mt7621-dts/gbpc2.dts
+++ b/drivers/staging/mt7621-dts/gbpc2.dts
@@ -1,28 +1,121 @@
 // SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 /dts-v1/;
 
-#include "gbpc1.dts"
+#include "mt7621.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 
 / {
 	compatible = "gnubee,gb-pc2", "mediatek,mt7621-soc";
 	model = "GB-PC2";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x1c000000>, <0x20000000 0x4000000>;
+	};
+
+	chosen {
+		bootargs = "console=ttyS0,57600";
+	};
+
+	palmbus: palmbus@1e000000 {
+		i2c@900 {
+			status = "okay";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		reset {
+			label = "reset";
+			gpios = <&gpio 18 GPIO_ACTIVE_HIGH>;
+			linux,code = <KEY_RESTART>;
+		};
+	};
 };
 
-&default_gpio {
-	groups = "wdt", "uart3";
-	function = "gpio";
+&sdhci {
+	status = "okay";
+};
+
+&spi0 {
+	status = "okay";
+
+	m25p80@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		broken-flash-reset;
+
+		partition@0 {
+			label = "u-boot";
+			reg = <0x0 0x30000>;
+			read-only;
+		};
+
+		partition@30000 {
+			label = "u-boot-env";
+			reg = <0x30000 0x10000>;
+			read-only;
+		};
+
+		factory: partition@40000 {
+			label = "factory";
+			reg = <0x40000 0x10000>;
+			read-only;
+		};
+
+		partition@50000 {
+			label = "firmware";
+			reg = <0x50000 0x1FB0000>;
+		};
+	};
+};
+
+&pcie {
+	status = "okay";
+};
+
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&state_default>;
+
+	state_default: state-default {
+		gpio-pinmux {
+			groups = "wdt";
+			function = "gpio";
+		};
+	};
 };
 
 &ethernet {
 	gmac1: mac@1 {
-		status = "ok";
-		phy-handle = <&phy_external>;
+		status = "okay";
+		phy-handle = <&ethphy7>;
 	};
 
 	mdio-bus {
-		phy_external: ethernet-phy@5 {
-			reg = <5>;
+		ethphy7: ethernet-phy@7 {
+			reg = <7>;
 			phy-mode = "rgmii-rxid";
 		};
 	};
 };
+
+&switch0 {
+	ports {
+		port@0 {
+			status = "okay";
+			label = "ethblack";
+		};
+
+		port@4 {
+			status = "okay";
+			label = "ethblue";
+		};
+	};
+};
-- 
2.25.1

