Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EAF2CB8
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 12:45:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1643028336; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TIsx9UCy8wf7u8jYs8p6tgROrDdHk9JRJjNAkQOC0lTu3ErW17b7WfLPSgNM+WS883uMnor/XCsceScSbnwvlEKbwQ5CgmxEtsm42kVKjC/zYxCZyI+8SO1zkvB6fGaabpPMCV4B5COdNB2AqCgr//NdFTObk685LnbS3+y12z0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1643028336; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=uIXZa/x2uQtFs7sWVctnPkAsGWGbs+goD+F0fUPfYBo=; 
	b=mgqA7Odal3o0ovEWOOjJ6izC0fiPstEKUpp4ghOSAJ44JCzeU+FReak961tEVixBGxS4UxcJR5nfKlDjjh3Qb7XFshR99ayp9ZJK0aoNhTmMp56cE/J7DxHjuG7+Diji0zaaH2MjU6VY5CJPb5x4TPZtzF6w69+q/ZwiudvK2xw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1643028336;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=uIXZa/x2uQtFs7sWVctnPkAsGWGbs+goD+F0fUPfYBo=;
	b=Hi/d96syPzQFTHJAckvtuoMKXxWukKe3/u7S6bKEf9j6zUqJ4LttMQv0h3wcOdaW
	b27hjmD5elHThx8njl60eT5GZPY16LSNTHjHU2JXWjDvp9A/CjY5N9fo0nyb237HKxC
	xKk0NmsG1i3k5AGjN0+ggk1/CcNQqrcCWBStUKwo=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 1643028305938337.1756676118903; Mon, 24 Jan 2022 04:45:05 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	NeilBrown <neil@brown.name>,
	DENG Qingfang <dqfext@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: linux-staging@lists.linux.dev,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH 3/4] staging: mt7621-dts: use trgmii on gmac0 and enable flow control on port@6
Date: Mon, 24 Jan 2022 15:43:50 +0300
Message-Id: <20220124124351.4604-4-arinc.unal@arinc9.com>
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

