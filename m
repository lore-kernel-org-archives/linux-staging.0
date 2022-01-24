Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EE92C82
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 13:02:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1643029336; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UdYWdi0qG4StOokBvt+2nBXIcce/ib7UqASoLIr5Iu2Qm6gux3gcfHLZWfxcAgWcSBKSI4fBvR6KVhPooc39Os+Bus+cZW6dCoG989VRyfgEod4iFq+/Acw6XILUMF4EP42yxDt+kXawueUW03OKbSglNltAjseORAIVSvkOmyk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1643029336; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=uIXZa/x2uQtFs7sWVctnPkAsGWGbs+goD+F0fUPfYBo=; 
	b=W0OpZvSCVwAWfQqv3ewT2LCNLTgN28odXMR7yiIIEouTbDaS0Mfuz7kPoLiudMLQTSL2W5CMrX4t9O9hYKxKxR1VsuLg9YXBUBpzNCRA5shcJmQqMyLTIYGeFLzvFKwBw32xD/Q6b3PUIX/xoTA4MPtXL8+AZJx2LOvkO+wL59s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1643029336;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=uIXZa/x2uQtFs7sWVctnPkAsGWGbs+goD+F0fUPfYBo=;
	b=e092NBegJWz4qJ9fUxNdXj8nkUzJXlKXhRBIHS+XuFCX01wGks34kkGl5iDVcedO
	hmMXz48ucE1r2L+NZzyIJJMATv2ler6D6qCYBYjhgz+y/2eyaL/i0TzqpUDPWikgX4K
	HelsJOEQsjO6NflUwJZ9piFvWZ+CpkAb4L0jva6I=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 164302933529316.6934989459603; Mon, 24 Jan 2022 05:02:15 -0800 (PST)
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
Subject: [PATCH v2 3/4] staging: mt7621-dts: use trgmii on gmac0 and enable flow control on port@6
Date: Mon, 24 Jan 2022 16:01:46 +0300
Message-Id: <20220124130147.8043-4-arinc.unal@arinc9.com>
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

Change phy-mode of gmac0 to trgmii to match the other side, port@6.

Flow control needs to be enabled on both sides to work.
It is already enabled on gmac0, enable it on port@6 too.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 35f19d6ae4bd..489754f6ed77 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -328,7 +328,7 @@ ethernet: ethernet@1e100000 {
 		gmac0: mac@0 {
 			compatible = "mediatek,eth-mac";
 			reg = <0>;
-			phy-mode = "rgmii";
+			phy-mode = "trgmii";
 
 			fixed-link {
 				speed = <1000>;
@@ -412,6 +412,7 @@ port@6 {
 						fixed-link {
 							speed = <1000>;
 							full-duplex;
+							pause;
 						};
 					};
 				};
-- 
2.25.1

