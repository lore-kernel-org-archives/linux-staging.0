Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310E52CA9
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 15:39:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1643125168; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=O1pQZDlt1JpUfbema1dTgoCLY2QaJUY0KrtQR93ev5qrX8zn5YrOK5ec6E3F+PSYlwCqk4L5y6P8dROaPzlEzpRvPVGxBHXZniARhhVUMk+qWiWmWcnvG2raJZPqJnxbV7hOmEoAyOJCVfN+bz4s0lyVtxzNc0TK4GgH0ZRmAI0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1643125168; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=LpuI1u/Qv92Z2SYM1KWBWMSdcjTpvlNGeRVlv5JACSI=; 
	b=TE+opRFNSjhQr0JKFwItajZg3pMXfGOv7f4WtI+pyj8NSEbh/rpw3qgihI4WCM9kfaugPeu0KdV8gh3x+8DBqneRrQ3G2ISH89zMWDy35InxzWu9nQQXCtlwNaU0NP8dfhjCRCfN1HPu04AlOo/xngjDu17QBhjEpWyaYfuAieA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1643125168;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=LpuI1u/Qv92Z2SYM1KWBWMSdcjTpvlNGeRVlv5JACSI=;
	b=X0mvfnRq+o1cdMV2+v7mC1jxDvGYIGVYDItpghbBRywNjabpRbGzF8TycJMdqhCP
	jsRnr+jCIWCHWXnVdf0LDNQnTdgGkVOHl8plMOpeVUf1H/WdwU8XZtGp4TAg063goK6
	sTnJ0Eofvwwf5C6ygDtDmy+tPE1583OJbmkoZJys=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 1643125166013950.0022495662134; Tue, 25 Jan 2022 07:39:26 -0800 (PST)
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
Subject: [PATCH v3 3/4] staging: mt7621-dts: use trgmii on gmac0 and enable flow control on port@6
Date: Tue, 25 Jan 2022 18:39:02 +0300
Message-Id: <20220125153903.1469-4-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125153903.1469-1-arinc.unal@arinc9.com>
References: <20220125153903.1469-1-arinc.unal@arinc9.com>
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
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
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

