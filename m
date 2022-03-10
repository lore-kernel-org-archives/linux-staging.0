Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19E47A
	for <linux-staging@lists.linux.dev>; Thu, 10 Mar 2022 11:41:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1646912464; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Y1rh9526WHof0vUmb+DuZP7iIaSyJntTyWsS1uy4HlldZkTCsOivgV3vYnrMnhwvnrZfdZf1hcDtEo/JY8xrQfDC1+K71nncCI3o6d2DIVcbAiIbIAlP6/n1sNBkksg9vh446uc8HdIC4kYZ8XuRgsASNJIOBm5eyksIUjjrIPQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1646912464; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=GO93XcETzd7HvN2GW0q1ucpQxqY5PnrTd3N3Efl+gHk=; 
	b=YQz99Cpgc1nrgxc7W0hJq0FzQRxr1g+mG0bi2nHvURNKG938nAL+cU/LufKHuzoElcHBawkLqx1TCpsU4kSSstH2s7lt9mNydYGhF2/hxFPrqI03dg3v/FbjI8dxswXZAkVAfwPqYMfuRtbwGer5w4FY+rZxmq+doqBbOgDOFoc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1646912464;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=GO93XcETzd7HvN2GW0q1ucpQxqY5PnrTd3N3Efl+gHk=;
	b=b2TDujcr6rGqc+2nHlzODmxM+/CwxIpPZUaAzm88DmsgD5dUMd1DOl+kXvkhnXXS
	KLSd3jQN94lg+lLv6QO23EuegJOK4d6P1w0HfvkoEVFZEA/GedZ3vBVZg1wyb/ddOtr
	oOr9to+Ci51ZAdA2r9J1fgPVvsdm5sn9LoLiD//I=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 1646912462522577.9910577534476; Thu, 10 Mar 2022 03:41:02 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	NeilBrown <neil@brown.name>,
	erkin.bozoglu@xeront.com
Cc: linux-staging@lists.linux.dev,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH 1/2] staging: mt7621-dts: fix LEDs and pinctrl on GB-PC1 devicetree
Date: Thu, 10 Mar 2022 14:39:39 +0300
Message-Id: <20220310113939.6601-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Fix LED and pinctrl definitions on the GB-PC1 devicetree. Refer to the
schematics of the device for more information.

LED fixes:
- Change GPIO6 LED label from system to power as GPIO6 is connected to
PLED.
- Add default-on default-trigger to power LED.
- Change GPIO8 LED label from status to system as GPIO8 is connected to
SYS_LED.
- Add disk-activity default-trigger to system LED.
- Switch to the color:function naming scheme.
- Remove lan1 and lan2 LEDs as they don't exist.

Pinctrl fixes:
- Claim state_default node under pinctrl node.
- Change pinctrl0 node name to state-default.
- Change gpio node name to gpio-pinmux to respect
Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml.
- Sort pin groups alphabetically.

Misc fixes:
- Fix formatting.

Link: https://github.com/ngiger/GnuBee_Docs/blob/master/GB-PCx/Documents/GB-PC1_V1.0_Schematic.pdf
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/staging/mt7621-dts/gbpc1.dts | 31 ++++++++++++----------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/mt7621-dts/gbpc1.dts b/drivers/staging/mt7621-dts/gbpc1.dts
index 1b5175e6ccf3..4a05254af0a8 100644
--- a/drivers/staging/mt7621-dts/gbpc1.dts
+++ b/drivers/staging/mt7621-dts/gbpc1.dts
@@ -38,24 +38,16 @@ reset {
 	gpio-leds {
 		compatible = "gpio-leds";
 
-		system {
-			label = "gb-pc1:green:system";
+		power {
+			label = "green:power";
 			gpios = <&gpio 6 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "default-on";
 		};
 
-		status {
-			label = "gb-pc1:green:status";
+		system {
+			label = "green:system";
 			gpios = <&gpio 8 GPIO_ACTIVE_LOW>;
-		};
-
-		lan1 {
-			label = "gb-pc1:green:lan1";
-			gpios = <&gpio 24 GPIO_ACTIVE_LOW>;
-		};
-
-		lan2 {
-			label = "gb-pc1:green:lan2";
-			gpios = <&gpio 25 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "disk-activity";
 		};
 	};
 };
@@ -97,7 +89,6 @@ partition@50000 {
 			label = "firmware";
 			reg = <0x50000 0x1FB0000>;
 		};
-
 	};
 };
 
@@ -106,9 +97,12 @@ &pcie {
 };
 
 &pinctrl {
-	state_default: pinctrl0 {
-		default_gpio: gpio {
-			groups = "wdt", "rgmii2", "uart3";
+	pinctrl-names = "default";
+	pinctrl-0 = <&state_default>;
+
+	state_default: state-default {
+		gpio-pinmux {
+			groups = "rgmii2", "uart3", "wdt";
 			function = "gpio";
 		};
 	};
@@ -124,6 +118,7 @@ port@0 {
 			label = "ethblack";
 			status = "ok";
 		};
+
 		port@4 {
 			label = "ethblue";
 			status = "ok";
-- 
2.25.1

