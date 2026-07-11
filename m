Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9562BE7BE;
	Sat, 11 Jul 2026 14:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783778414; cv=none; b=UG3tcKwwIV4Az/Us8MUm4disZslQ1HWmhYEXpBGinvxpbd7V2U7hATNgUupbErZ10J2WHwDGJdNuwpghLYBXDiPDRfCTyJU/bXbQbNkkoD58+BP84XQPa06ZBinR1wSHTiCodgZdg+U6XJEq3j28e5ZXdjFH1/8h9dFtjGTMm/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783778414; c=relaxed/simple;
	bh=5xxodZPCRBKAyTJ6mq4Tdy+Kg7/mU7ZXT1w7S3VhpEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tXGiFx74tKPQl9gFdPifRF40cCDcpqM8NlgEtqi2Ffm70K+IFdyVecUinUBPOLwuk8AGl7ErkJMBj6V27dvKWnH1COx0EC6wmTFlrBJAtxTIpe5wK38VeesP6jGBBD/ybKefIbZv5tWxQcTiOoTsakitStgoKV4OFI9pcm1S6ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YFuVTviT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YFuVTviT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 584E91F00ACF;
	Sat, 11 Jul 2026 14:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783778411;
	bh=1NrQxFr7A8kE1ao+WVW0sT4zAPOI0r5GcxHRRjiYX0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YFuVTviT14c26brRNe4Lk8WKoTkT5M4/jh6w+sN6W/YGmJ9780eBhkb7H1IS4FGIu
	 eKaR6Eyx4ND9AB5JekaEaBvfNnV9rSs/W0ALgnYCT1tLjdBKJpb2W2OCH6yEL6qaNA
	 TDix53agHl0FBtX0Y1Rhy2W8iUk3WWJw37Yvb2dGAJS3FEsOh3eItr+a9b176m9TxZ
	 5qXj57tZad+/OUQ2RWeMWcSE/64bbWsZRC0G9xGWzwUbC65qsys3PTQBdrQXIyUfTp
	 +xXIBAeerQszAfNMDZYQ4Ape8n2VkjqyBbMTLwNK7sQHpVWCDtN/ALnVa78tRF8eaR
	 s5X7xsc9gqRAQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 8F3FF60209; Sat, 11 Jul 2026 22:00:06 +0800 (CST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] arm64: dts: allwinner: sun50i-h616: Add video engine
Date: Sat, 11 Jul 2026 21:59:58 +0800
Message-ID: <20260711135959.3616919-8-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260711135959.3616919-1-wens@kernel.org>
References: <20260711135959.3616919-1-wens@kernel.org>
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

