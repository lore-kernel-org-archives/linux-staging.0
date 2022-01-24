Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156802CB8
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 13:02:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1643029340; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ri4ihh6OH3mtRoCGc7TDPEbW0cOGT3nqpBa7qeTJ1PeUPTzf5TasOkWIbqmfYkRZTA72/HO2OcxJQl5QxMoBLUpIoweexOYWxFFOPz8DbTvPdNfwnHfV3jywSnUoH9z53kBqXO/YAzu7B684N/NR+HDK65XI/ym+U1AC2/V11YM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1643029340; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=m8YqoVp25S994BPcuNFbPKVmwC/AY4m4bDgbC/f45w8=; 
	b=ZLMEE1uJa3+lHB7I+Pc7EXERHLVU1setFIxlW3mTF8pEInZwukx//54oI+UDiNFueZRhJRfsosJ2ARdbmcr9BaMxPLkpXg+f8TX9Zvbq2dc6R5dVgP9BLUZB+cVbNVxdu45FZDwgt9dTiCK6VuGnVj0CSyUf468rpJ9Ienp8kIE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1643029340;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=m8YqoVp25S994BPcuNFbPKVmwC/AY4m4bDgbC/f45w8=;
	b=Qel5w48WS6DQvE7/XvQrfQJA3G1gEhO6Dr8VXxzHcq9sx5+tq1ncWhXzHbQiDLKL
	BrTdNtFJhgSBtBfBJApA8rrlbcVagv1piEDYxYACq7ETrTsbssaxjDF0bYScb/uBhht
	dxH0jLY2B2/eHFuMI2NpQC3JuYz9gHeiUXk6E8io=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 1643029339083379.77231906722295; Mon, 24 Jan 2022 05:02:19 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	NeilBrown <neil@brown.name>,
	DENG Qingfang <dqfext@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	erkin.bozoglu@xeront.com
Cc: linux-staging@lists.linux.dev,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH v2 4/4] staging: mt7621-dts: fix pinctrl properties for ethernet
Date: Mon, 24 Jan 2022 16:01:47 +0300
Message-Id: <20220124130147.8043-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124130147.8043-1-arinc.unal@arinc9.com>
References: <20220124130147.8043-1-arinc.unal@arinc9.com>
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

