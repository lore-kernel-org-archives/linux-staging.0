Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCC71372
	for <linux-staging@lists.linux.dev>; Tue, 15 Feb 2022 08:18:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1644913095; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OqWgTOYL6gjJCYpJWajf3P+F9gFxT+PhPTwkERMsD3RmhjSDBERGwuKHoUD1ZERMzxPdmdIuPAxnfixtBr2D9WK15GW4Mhpl4RYIJKmkeQYVivZuM7Q/W1G5PtXMvP7J3S3iOCse7gHiO3EH2aMDU+jtUduvElPS+arEqN/kDUo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1644913095; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=EXfsaTxvlzBYK5huY7lR8lxgWwGdugQl+DwEt6BrShw=; 
	b=fiiC/RbbWHQQVzYMiWkNYJ5DY6VuIX+1GsK5I9xSG1g6PqbfDdxMyrOA1y0csqcqy9ukPVltQD0WiPm13waHSGHekzDB3/dhsHguqO9cPAENTzzNffOm7fw3y28RdEPWD015tozCKoDte2zHETyQQFRyw5cadhJVixIw9cO15J8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1644913095;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=EXfsaTxvlzBYK5huY7lR8lxgWwGdugQl+DwEt6BrShw=;
	b=V2Uv8r1bqKzyVZSJn1JfEJjTTtHdNTgtGg4LLxI/uCTyyQ3VZL1cSid/hq5fX99h
	RMUdTDcC5S942I+2+ZQH0YtHZIf4wehx3hh2oCpjNA+R1icgcH5Vkaidr7viiTV5+TH
	YhgbbE8c4CXS8jZlDZPxz49MvQ+MxSFnkz3sjmuw=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 164491309394184.82283084814128; Tue, 15 Feb 2022 00:18:13 -0800 (PST)
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
Subject: [PATCH 1/2] staging: mt7621-dts: fix pinctrl-0 items to be size-1 items on ethernet
Date: Tue, 15 Feb 2022 11:17:24 +0300
Message-Id: <20220215081725.3463-1-arinc.unal@arinc9.com>
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

Fix pinctrl-0 items under the ethernet node to be size-1 items.
Current notation would be used on specifications with non-zero cells.

Fixes: 0a93c0d75809 ("staging: mt7621-dts: fix pinctrl properties for ethernet")
Reported-by: Sander Vanheule <sander@svanheule.net>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 4ae744b96464..4da20da243e6 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -323,7 +323,7 @@ ethernet: ethernet@1e100000 {
 		mediatek,ethsys = <&sysc>;
 
 		pinctrl-names = "default";
-		pinctrl-0 = <&rgmii1_pins &rgmii2_pins &mdio_pins>;
+		pinctrl-0 = <&mdio_pins>, <&rgmii1_pins>, <&rgmii2_pins>;
 
 		gmac0: mac@0 {
 			compatible = "mediatek,eth-mac";
-- 
2.25.1

