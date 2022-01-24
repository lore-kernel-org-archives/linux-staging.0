Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D3F2FB3
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 12:45:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1643028336; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TjgCRw09X253I5KhTfz2qOb+WDBsrx4Cz6ssqlvCFTMPfx6gCSaHgFvad5FLBpJARXwHKeT8tK+t3CH+kbzNB3xXq25VQCgU1ellnYEc5mDigVv3r5VGMfrspQVvzApP7sfEvlnyIEQcFYAhM3DOxqAbAK0KEihoPPZIhoSoWqc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1643028336; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:To; 
	bh=9vBInTg0x7meXbS+fElZ2oZY9VxA0PWCfjQHeIt8lWY=; 
	b=ncDD5EyRTF/BUcWiaEX267/EmidXyjOCQdEgdSUBqhOxLxyjM7UCAq4KEXOtfAW0kJ471VYItKn2EdKdopL+/+bR/T0ruJQl8PNMKNUmNE2J17wC5qV8phr2XgwB9OnQf6PJEZLYkdSmrZ9XS5YJuNH55O55QmsAT3LadMGQqD4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1643028336;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9vBInTg0x7meXbS+fElZ2oZY9VxA0PWCfjQHeIt8lWY=;
	b=T+e0Skz9HrijaybX+hAu3accbrIJa5nc/Et6adqCDwzk/bRoulfjjFWnOCSnvH4V
	j0SSb+jUY2HImZuuxG3esbA4EDr/XAdLcjgMBqQgVbBhn2D+ezJ6xFXqfOED/nbWsg+
	mejo0io4MsGwo0lb7GcsKlKTsjMKSraV8FF2+93Q=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 1643028298129936.2348469762973; Mon, 24 Jan 2022 04:44:58 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	NeilBrown <neil@brown.name>,
	DENG Qingfang <dqfext@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: 
Date: Mon, 24 Jan 2022 15:43:47 +0300
Message-Id: <20220124124351.4604-1-arinc.unal@arinc9.com>
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

Hey everyone,

In preperation to mainline mt7621-dts; fix formatting, dtc warning on
switch0@0 node and pinctrl properties for ethernet node on the mt7621.dtsi.
Move the GB-PC2 specific external phy configuration on the main dtsi to
GB-PC2's devicetree, gbpc2.dts.

Now that pinctrl properties are properly defined on the ethernet node,
GMAC1 will start working.

Traffic flow on GMAC1 was tested on a mt7621a board with these modes:
External phy <-> GMAC1
PHY 0/4 <-> GMAC1

Cheers.
Arınç

[0]: https://lore.kernel.org/netdev/83a35aa3-6cb8-2bc4-2ff4-64278bbcd8c8@arinc9.com/T/

Arınç ÜNAL (4):
      staging: mt7621-dts: fix formatting
      staging: mt7621-dts: fix switch0@0 warnings
      staging: mt7621-dts: use trgmii on gmac0 and enable flow control on port@6
      staging: mt7621-dts: fix pinctrl properties for ethernet

 drivers/staging/mt7621-dts/gbpc2.dts   | 16 +++++++++++-----
 drivers/staging/mt7621-dts/mt7621.dtsi | 32 ++++++++++++++++----------------
 2 files changed, 27 insertions(+), 21 deletions(-)

