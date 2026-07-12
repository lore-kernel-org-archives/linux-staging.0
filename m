Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37D21E0E14;
	Sun, 12 Jul 2026 03:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783825225; cv=none; b=YE8YI8kC7HxnUHcLiUbKkprlBuFZWidCcoxUhSPAXCkWU77JEN+eEAQ5XT2LTpXRFPRy1J54mD5PO5h4iyWhs6PHedduawxkwBJ1cV56CjJmaBFgk+7oWmlIFUmJlHD+NImKImz4HDl4xr07QfuaWoQymZOXhdV5OkOZ7rcCnqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783825225; c=relaxed/simple;
	bh=Vsplpc8zh8LJvWm986vVSNt4N+Il8O2d2af6uSuHqCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Szt96tKRcZfGqdsAMhOlOs8qYdfvwdpwEGCsk8/cCDO/Nk1Z2QTV9xA/Kjqxh75hqTqUHIcv+LnDjJk9WCa3W19yXqvgyOuy4QGYlt8FduRfpg69ethvq9nXzU3zG1zkhvx54t18lY7lRqMaLS24BZQQefZLbbWhHgNhuQ5vPsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EkARuxZy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EkARuxZy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1150E1F00ACF;
	Sun, 12 Jul 2026 03:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783825217;
	bh=dLNyCbS1Qr51ll3Io/f0Su8Vsd8z8WzVVb12Br+N0SA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EkARuxZyse0llGypKEzJKuSEfsbA29DP/ZzpQFqgxawUc1L5xAM/ZCt9n6qRlzgT2
	 DNaoR9nqihZcx0x4g7zfdBppHgiudJ1itdU/hVHGNb1Fr5mTERqQ7lOmn458jFAM4q
	 aJtkMJ/ndBtiR5MqxCqR/4+tkbM/Rbhvet41LntyITFR9yQFWt/O1JbUSZO8yRno9h
	 14vDehaQ+3OEH2q7znowLawvzqUnB2DzTUipANPRFOHxfH204fh7p3wkkcqtb8EHRf
	 HZgxrX6CObBNmXywW6znUFaxw9DfZoY/HjwRSX3C9h9zU55EInl6EADkfVB4ZYxDvq
	 8zrFSnlEfFesA==
Received: by wens.tw (Postfix, from userid 1000)
	id 290AA6019F; Sun, 12 Jul 2026 11:00:13 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v3 7/7] arm64: dts: allwinner: sun50i-h616: Add video engine
Date: Sun, 12 Jul 2026 11:00:10 +0800
Message-ID: <20260712030011.3778169-8-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260712030011.3778169-1-wens@kernel.org>
References: <20260712030011.3778169-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

The H616 SoC has a video engine, and two SRAM regions needed by it.

Add the video engine to the dtsi file.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
[wens@kernel.org: Add VE SRAM region and commit message]
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
Changes since v1:
- Corrected second IOMMU port
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 1598e86259ab..c6b3a3f8359a 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -175,6 +175,18 @@ crypto: crypto@1904000 {
 			resets = <&ccu RST_BUS_CE>;
 		};
 
+		video-codec@1c0e000 {
+			compatible = "allwinner,sun50i-h616-video-engine";
+			reg = <0x01c0e000 0x2000>;
+			clocks = <&ccu CLK_BUS_VE>, <&ccu CLK_VE>,
+				 <&ccu CLK_MBUS_VE>;
+			clock-names = "ahb", "mod", "ram";
+			resets = <&ccu RST_BUS_VE>;
+			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+			iommus = <&iommu 3>, <&iommu 2>;
+			allwinner,sram = <&ve_sram 1>, <&sram_c 1>;
+		};
+
 		syscon: syscon@3000000 {
 			compatible = "allwinner,sun50i-h616-system-control";
 			reg = <0x03000000 0x1000>;
-- 
2.47.3

