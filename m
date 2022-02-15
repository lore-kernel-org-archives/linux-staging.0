Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D62E1365
	for <linux-staging@lists.linux.dev>; Tue, 15 Feb 2022 08:18:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1644913099; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Rw6arVHAVfvZqvUL2JFbSPcz86d45aeNnqypzGBk3Of+6ykyraMoC0oN9jYn5hBbaLLgxp+9AayYHDuU8o51Gbxe2rK67xrslAGq+yX06YSjsxBRThUaYyIQ54V4QgEp361L9rK9kacj8hVQvm/ovfZQ/yTAKdaWJi+By9uMJE8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1644913099; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=+aKsvfW62+7QG7JYB+WbaPDxx5vJ3dq21vqo0iPXxi8=; 
	b=IXgnMd2ahCSGdn4vsgIB0GtBlpHcrko69tEtam8bfk/OCPA/3c2+VareL5DetVT16ZO0FW0ATai3Zm+rMHvPWx/EKiGBy6X67RYWnhftetnSPPsV4KYI1jluMGLjQbWVQTSXeo17imsmR0hutqRPyEsIvcx2lC3/pQBzgyYrq1c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1644913099;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=+aKsvfW62+7QG7JYB+WbaPDxx5vJ3dq21vqo0iPXxi8=;
	b=QJtDr542Ig6u1bBoNJSUQoGG/MVQttCbwBbulCNJmEKj1rXprE3nEEWuw5sCtQ+J
	ZrbuBylqewZdHmP7GVqI1LUg+YuaviofiAHZuzfj20ObU3Nh8HssVacMNAIxh7h6t9f
	5oMnPQecKouGurAWhaaJ4ukIbQ2PTVTFtEh3G3TQ=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 164491309663829.986815774288175; Tue, 15 Feb 2022 00:18:16 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Sander Vanheule <sander@svanheule.net>,
	NeilBrown <neil@brown.name>,
	DENG Qingfang <dqfext@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	erkin.bozoglu@xeront.com
Cc: linux-staging@lists.linux.dev,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH 2/2] staging: mt7621-dts: do not use rgmii2_pins for ethernet on GB-PC1
Date: Tue, 15 Feb 2022 11:17:25 +0300
Message-Id: <20220215081725.3463-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220215081725.3463-1-arinc.unal@arinc9.com>
References: <20220215081725.3463-1-arinc.unal@arinc9.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

GB-PC1 uses some of the rgmii2 pins (22 - 33) as GPIO. Therefore, the
rgmii2 bus cannot be used on this device.
Overwrite pinctrl-0 property under the ethernet node without rgmii2_pins on
the GB-PC1 devicetree.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/staging/mt7621-dts/gbpc1.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/mt7621-dts/gbpc1.dts b/drivers/staging/mt7621-dts/gbpc1.dts
index e38a083811e5..1b5175e6ccf3 100644
--- a/drivers/staging/mt7621-dts/gbpc1.dts
+++ b/drivers/staging/mt7621-dts/gbpc1.dts
@@ -114,6 +114,10 @@ default_gpio: gpio {
 	};
 };
 
+&ethernet {
+	pinctrl-0 = <&mdio_pins>, <&rgmii1_pins>;
+};
+
 &switch0 {
 	ports {
 		port@0 {
-- 
2.25.1

