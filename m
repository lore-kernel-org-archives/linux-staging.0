Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3979D2C82
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 12:45:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1643028338; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=O9OcWwR1IAeO4eLt25TkvgZsL34+2j8ylogo0g38wMFT145BcJP09MqrVWZ6+wU9wPDU/X3gX52edxwQijbgWHxUZIrH6jwGXR/YXegVtsw9S8WjqlRWF/+QMFDGZPtOqpErHMu3XqvskZN0UUfX3uxzp7Ay6n4EuvkfbsP40A4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1643028338; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=m8YqoVp25S994BPcuNFbPKVmwC/AY4m4bDgbC/f45w8=; 
	b=SvDYTy2tNy48OZVkpOmT5O2RJjYtD90QldCPBcvPwksBPOlmiXOGLP6oh7L+KNugCTKQG3BIDMqlYLecAcRpDVxVrq2JyC6qYuw8bCLR35aRgQRyM0iN0Z33UzjnUdaXbLM6sGaEKWq6ExxjVwIt3YarDhcPj2OrxC3YL0c3I/w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1643028338;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=m8YqoVp25S994BPcuNFbPKVmwC/AY4m4bDgbC/f45w8=;
	b=bJKrKXSYADdHu7J7S1lHScBm/cHC5Dx1LThvXk8a30k6ryJcDNpL04RV/lSnmnbe
	5XqaPwuVvXBjItHJN3bYjWjnNbL9TeaFfc0e9TfwJkyQVnbXBQlfcPEQylmYfvfZBHd
	v2JW844vnf1mhgTAJ/Iy2eBf/jqFUABBDqdzFGPc=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 1643028308354151.4291158575346; Mon, 24 Jan 2022 04:45:08 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	NeilBrown <neil@brown.name>,
	DENG Qingfang <dqfext@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: linux-staging@lists.linux.dev,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH 4/4] staging: mt7621-dts: fix pinctrl properties for ethernet
Date: Mon, 24 Jan 2022 15:43:51 +0300
Message-Id: <20220124124351.4604-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124124351.4604-1-arinc.unal@arinc9.com>
References: <20220124124351.4604-1-arinc.unal@arinc9.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add pinctrl properties with rgmii1 & mdio pins under ethernet node which
was wrongfully put under an external phy node.
GMAC1 will start working with this fix.

Link: https://lore.kernel.org/netdev/02ecce91-7aad-4392-c9d7-f45ca1b31e0b@arinc9.com/T/

Move GB-PC2 specific phy_external node to its own device tree.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/staging/mt7621-dts/gbpc2.dts   | 16 +++++++++++-----
 drivers/staging/mt7621-dts/mt7621.dtsi | 13 +++----------
 2 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/mt7621-dts/gbpc2.dts b/drivers/staging/mt7621-dts/gbpc2.dts
index 6fe603c7711d..03d6bb6735ac 100644
--- a/drivers/staging/mt7621-dts/gbpc2.dts
+++ b/drivers/staging/mt7621-dts/gbpc2.dts
@@ -13,10 +13,16 @@ &default_gpio {
 	function = "gpio";
 };
 
-&gmac1 {
-	status = "ok";
-};
+&ethernet {
+	gmac1: mac@1 {
+		status = "ok";
+		phy-handle = <&phy_external>;
+	};
 
-&phy_external {
-	status = "ok";
+	mdio-bus {
+		phy_external: ethernet-phy@5 {
+			reg = <5>;
+			phy-mode = "rgmii-rxid";
+		};
+	};
 };
diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 489754f6ed77..38ab6447756a 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -325,6 +325,9 @@ ethernet: ethernet@1e100000 {
 
 		mediatek,ethsys = <&sysc>;
 
+		pinctrl-names = "default";
+		pinctrl-0 = <&rgmii1_pins &rgmii2_pins &mdio_pins>;
+
 		gmac0: mac@0 {
 			compatible = "mediatek,eth-mac";
 			reg = <0>;
@@ -342,22 +345,12 @@ gmac1: mac@1 {
 			reg = <1>;
 			status = "off";
 			phy-mode = "rgmii-rxid";
-			phy-handle = <&phy_external>;
 		};
 
 		mdio-bus {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			phy_external: ethernet-phy@5 {
-				status = "off";
-				reg = <5>;
-				phy-mode = "rgmii-rxid";
-
-				pinctrl-names = "default";
-				pinctrl-0 = <&rgmii2_pins>;
-			};
-
 			switch0: switch0@0 {
 				compatible = "mediatek,mt7621";
 				reg = <0>;
-- 
2.25.1

