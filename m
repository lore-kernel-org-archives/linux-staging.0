Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7CB36A
	for <linux-staging@lists.linux.dev>; Sat, 12 Mar 2022 09:22:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1647076943; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=G8N9+PQ1QyQWYLpWXR/Oo6Zsza1+E1wa8HwXdMbxyXhTzORI+9y1SpWyh2Vtu/qkjgw1J7oj0tkTzyIDHDwi8xfhB2ild+EIZv3SPtW8Ole1sEHjMQyGPMFdPsV9V+bZyjhJlG0KTuKXpxze+B/M/FZTUThwThSqvu90qV6O6ZA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1647076943; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=3U2bITQORR479vnVAyVxh1/s1ita8JhI0VuRWnNC1lk=; 
	b=ebYX33bDUQJtwR+N5kgJv4qEeHbG3/GY2lHU3uuDhNbDYmHD9lrrH+bJyG5LwJ393wMW+MLMthJ0EMwPLN6SYtg49Dsdh3jvaO/wlFLi55LMEFp+ed++BcHAJ6FHWak1jDNfKe7V7W0FOXsHpxMezyNmhT6l/uekojpsYbtg3/U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1647076943;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=3U2bITQORR479vnVAyVxh1/s1ita8JhI0VuRWnNC1lk=;
	b=jzduQ7OZBdi/bN27tmFF2hDh3vqf3EF6KOf8RtAXLjg5ENouWqsFjZL3KxhbNhpJ
	4cXeNp91A/jU9qCvMjNxBwcbop1j6Z0m+b+TT4YVNfbGeOHpZgF72sC6joHTXGvTZof
	ZeFlvIYaltUPVXylp55Y3tCOOSOeTpiV+SKYRKA4=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 164707694194273.07478804202856; Sat, 12 Mar 2022 01:22:21 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	NeilBrown <neil@brown.name>,
	erkin.bozoglu@xeront.com
Cc: linux-staging@lists.linux.dev,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH] staging: mt7621-dts: fix cpuintc and fixedregulator dtc warnings, fix xhci
Date: Sat, 12 Mar 2022 12:18:32 +0300
Message-Id: <20220312091832.6269-1-arinc.unal@arinc9.com>
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

Fix the cpuintc and fixedregulator dtc warnings:

Warning (unit_address_vs_reg): /cpuintc@0: node has a unit name, but no reg property
Warning (unit_address_vs_reg): /fixedregulator@0: node has a unit name, but no reg property
Warning (unit_address_vs_reg): /fixedregulator@1: node has a unit name, but no reg property
Warning (unique_unit_address): /cpuintc@0: duplicate unit-address (also used in node /fixedregulator@0)

Remove the unnecessary status = "okay" property from the xhci node.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 4da20da243e6..3222684915ac 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -26,7 +26,7 @@ cpu@1 {
 		};
 	};
 
-	cpuintc: cpuintc@0 {
+	cpuintc: cpuintc {
 		#address-cells = <0>;
 		#interrupt-cells = <1>;
 		interrupt-controller;
@@ -38,7 +38,7 @@ aliases {
 	};
 
 
-	mmc_fixed_3v3: fixedregulator@0 {
+	mmc_fixed_3v3: regulator-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "mmc_power";
 		regulator-min-microvolt = <3300000>;
@@ -47,7 +47,7 @@ mmc_fixed_3v3: fixedregulator@0 {
 		regulator-always-on;
 	};
 
-	mmc_fixed_1v8_io: fixedregulator@1 {
+	mmc_fixed_1v8_io: regulator-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "mmc_io";
 		regulator-min-microvolt = <1800000>;
@@ -263,8 +263,6 @@ sdhci: sdhci@1e130000 {
 	};
 
 	xhci: xhci@1e1c0000 {
-		status = "okay";
-
 		compatible = "mediatek,mt8173-xhci";
 		reg = <0x1e1c0000 0x1000
 		       0x1e1d0700 0x0100>;
-- 
2.25.1

