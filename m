Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216753FE3
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 12:45:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1643028338; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Qeh1ymsdV6l0XvKGGwvFAvY3B7U6heOjG5s+LqF79KLLXPUC7QxglNWDV48UId74FdAcl9SE23FDgjVOj/PQdrKXbUwMYqbEleD9dmW0IQxGlq/qTshj54uTUoRoyougegLhcSbM27Lgf40a/ODWeTa75H/bJQpQg2VnADaQzXY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1643028338; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=jXEta8bRT6adelJpCv7cwykY6jivxW3kxfL6WPg8Y1U=; 
	b=i9muOmfBGahrcGHyWeO0AFV88FbFZ4kgFqQXzIziwaQgJ9TNuRsFaDjeF4KDCCUEH1pq16OLM7xz8Y837W1J8O/LeGOh4JYK6xC2+2Cq4uWcSdKjBtPu0TOXHwLUPg8X6buSPAQJLhABDUcWvJ9059GppuyyO2OyHrhTkU8BXfo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1643028338;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=jXEta8bRT6adelJpCv7cwykY6jivxW3kxfL6WPg8Y1U=;
	b=UXV7oFxNIgNyYYriwgc/UH6X9SChQee+iqtiXyAn0ISYZbLKjTspyEMyUygRQYmR
	/qjyWCnK3jzfhD99mKxuVje1HlmpcdKtiWAh2ruOCMnnGFTg40rTA0dFdue2kyzkgxk
	2Qagz/HqFVAnRaYZIXpNHuAmqWzENHPVDIHPl340=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 1643028300969729.6980528831361; Mon, 24 Jan 2022 04:45:00 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	NeilBrown <neil@brown.name>,
	DENG Qingfang <dqfext@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: linux-staging@lists.linux.dev,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH 1/4] staging: mt7621-dts: fix formatting
Date: Mon, 24 Jan 2022 15:43:48 +0300
Message-Id: <20220124124351.4604-2-arinc.unal@arinc9.com>
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

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 644a65d1a6a1..d120e5872165 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -44,9 +44,9 @@ mmc_fixed_3v3: fixedregulator@0 {
 		regulator-max-microvolt = <3300000>;
 		enable-active-high;
 		regulator-always-on;
-	  };
+	};
 
-	  mmc_fixed_1v8_io: fixedregulator@1 {
+	mmc_fixed_1v8_io: fixedregulator@1 {
 		compatible = "regulator-fixed";
 		regulator-name = "mmc_io";
 		regulator-min-microvolt = <1800000>;
@@ -325,17 +325,18 @@ ethernet: ethernet@1e100000 {
 
 		mediatek,ethsys = <&sysc>;
 
-
 		gmac0: mac@0 {
 			compatible = "mediatek,eth-mac";
 			reg = <0>;
 			phy-mode = "rgmii";
+
 			fixed-link {
 				speed = <1000>;
 				full-duplex;
 				pause;
 			};
 		};
+
 		gmac1: mac@1 {
 			compatible = "mediatek,eth-mac";
 			reg = <1>;
@@ -343,6 +344,7 @@ gmac1: mac@1 {
 			phy-mode = "rgmii-rxid";
 			phy-handle = <&phy_external>;
 		};
+
 		mdio-bus {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -373,36 +375,43 @@ ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <0>;
+
 					port@0 {
 						status = "off";
 						reg = <0>;
 						label = "lan0";
 					};
+
 					port@1 {
 						status = "off";
 						reg = <1>;
 						label = "lan1";
 					};
+
 					port@2 {
 						status = "off";
 						reg = <2>;
 						label = "lan2";
 					};
+
 					port@3 {
 						status = "off";
 						reg = <3>;
 						label = "lan3";
 					};
+
 					port@4 {
 						status = "off";
 						reg = <4>;
 						label = "lan4";
 					};
+
 					port@6 {
 						reg = <6>;
 						label = "cpu";
 						ethernet = <&gmac0>;
 						phy-mode = "trgmii";
+
 						fixed-link {
 							speed = <1000>;
 							full-duplex;
-- 
2.25.1

