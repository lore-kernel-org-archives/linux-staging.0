Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F822C82
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 13:02:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1643029332; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NPkWR47Qr6DD8RBZG/rCMUPg6Li7z33gyTxVs5rq1EGDhdIEKR8HbH5V9AaTc5y1P6fBpTKlWZO2x5UyC7b3w4QveyKf4TFZ6+YZtIQ/Yv4EhCVipz23rqx7yYIRbI4ye8PYxQTny7dIwafzqUQaMxty5csk6eBAHvPFed7qKjs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1643029332; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=8nAeKDj1o/JjDbgA7o+65Lj/YUzWfdwclMGonlMI9u4=; 
	b=XiCqmBAuRIojfmQ9ctn4d7IkEAlv8Av297r/JMtAQjRkle2DS9QFAZuoWd6rtiepfRJ4Rj9FNcxjdLdK7wcZAVL6Xezc3GtkZCgvG9vZCnQgARcCn2bRkynTJTQKywzdoJ4xBMQIAZcYeulEI/sjxx4EX6EGTB096XnBzsZ67cE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1643029332;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=8nAeKDj1o/JjDbgA7o+65Lj/YUzWfdwclMGonlMI9u4=;
	b=LSomrxygw8edcLuArDkfIkBayeywtB5CmxqvdxvmbJkmspuBl/H2PFAZhfVfHdAo
	5wLY5YqSl7FwT4nqxoDad5lzY0Qz48+jfgMO4VXu54y8HVrrcJTRG8WOEEZNjqNtcdM
	YIV//+Pj/eKlUSAGt53Vy8gGuLLUnHEz2Dh3k+hM=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 1643029331496692.3999596990639; Mon, 24 Jan 2022 05:02:11 -0800 (PST)
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
Subject: [PATCH v2 2/4] staging: mt7621-dts: fix switch0@0 warnings
Date: Mon, 24 Jan 2022 16:01:45 +0300
Message-Id: <20220124130147.8043-3-arinc.unal@arinc9.com>
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

Remove reg property from ports node to fix this warning:

Warning (unit_address_vs_reg): /ethernet@1e100000/mdio-bus/switch0@0/ports: node has a reg or ranges property, but no unit name

Another warning surfaces afterwards. Remove #address-cells and #size-cells
from switch0@0 node to fix this warning:

Warning (avoid_unnecessary_addr_size): /ethernet@1e100000/mdio-bus/switch0@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index d120e5872165..35f19d6ae4bd 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -360,8 +360,6 @@ phy_external: ethernet-phy@5 {
 
 			switch0: switch0@0 {
 				compatible = "mediatek,mt7621";
-				#address-cells = <1>;
-				#size-cells = <0>;
 				reg = <0>;
 				mediatek,mcm;
 				resets = <&rstctrl 2>;
@@ -374,7 +372,6 @@ switch0: switch0@0 {
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
-					reg = <0>;
 
 					port@0 {
 						status = "off";
-- 
2.25.1

