Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5D829CA
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 15:39:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1643125160; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EzZrCQHmpw3ftxYqhhacL26Ibpgc9GtKc7vFWGO1E3pWPgqeRkiom1umO2U2ecZvfIq/Pw99hRAREt+u1IuFf+G79uTNvG7geL0BK/IvuMz3cQHqTrX5qL9z39MBjnUdIbtaPGqYD/XF0cA3XGbXH09hyX7g2QNImbfXqG81LMY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1643125160; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=Fwh0I5sWGhTOPGQQPoPPd7KAhBhrbzIehqe8Fj7ffrw=; 
	b=W+Y3sgfwVehY9RwcbCVA6tjJ4ZDB637kjEzfyknm7L7Xt+oKrdzQwMgdAE2CpVG+MgKEaCjYKLZPY26mKCjMX57v2zAzpAUcgicjH322B/S578r4Knx5uJ5DrZuojSKBxo6hy7hYsZdEGXElnPrMEV8vIZRbNWSQa8TXswMYEqk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1643125160;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Fwh0I5sWGhTOPGQQPoPPd7KAhBhrbzIehqe8Fj7ffrw=;
	b=QstITAPqEwiSCVpYbZgVzuHVzL0r3Rkp/MJuM8YpFwCxxRaLBUBscX+EZGXZfXp8
	en5KUZYYA6bGiR5uB/2CBOvQV1NzLyHZWb9X+6bJRbRSzZPEotPVpOuFKpJshgFcC3j
	VbpmOa/4IOz5y3zZOd5AOcXk0CwiKNE+oxyTCT7k=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 1643125157966658.5974853193; Tue, 25 Jan 2022 07:39:17 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	NeilBrown <neil@brown.name>,
	DENG Qingfang <dqfext@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	erkin.bozoglu@xeront.com
Cc: linux-staging@lists.linux.dev
Subject: [PATCH v3 0/4] staging: mt7621-dts: fix formatting, dtc warning, links and pinctrl
Date: Tue, 25 Jan 2022 18:38:59 +0300
Message-Id: <20220125153903.1469-1-arinc.unal@arinc9.com>
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
switch0@0 node, phy-mode, flow control and pinctrl properties for ethernet
node on the mt7621.dtsi.
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

v3: add body to the first patch and add Sergio's Reviewed by: tag
v2: add subject to the first mail

Arınç ÜNAL (4):
      staging: mt7621-dts: fix formatting
      staging: mt7621-dts: fix switch0@0 warnings
      staging: mt7621-dts: use trgmii on gmac0 and enable flow control on port@6
      staging: mt7621-dts: fix pinctrl properties for ethernet

 drivers/staging/mt7621-dts/gbpc2.dts   | 16 +++++++++++-----
 drivers/staging/mt7621-dts/mt7621.dtsi | 32 ++++++++++++++++----------------
 2 files changed, 27 insertions(+), 21 deletions(-)

