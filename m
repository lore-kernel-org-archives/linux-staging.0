Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D226B480955;
	Tue,  5 May 2026 13:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777988903; cv=none; b=VnFOShKXjetS2AVCMvYD08ze2cJSr+Y6nXa9EtUQsvXFVZe6nOvHD5zvcjres4keK9n0Rg3GHweX0eONOvodQN2MLDFYt+jq6ui2I3NCM3YoymKyMEWlWNgrO9XrXXWLAaHS5SVkOI8xmbUyBZNwJuEnlCJlwCRITlTAgQVjZJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777988903; c=relaxed/simple;
	bh=xIvBj6hevsJHw2j0MVGJKKmBTt9OLC6z57UMc3zYwzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XEn713nnjrHQ+yWNvcEygtPRaVk+wCWNwPhj4Mcq+or4u1cfmQEScaURdSO/PzamSMrMUQW5xiFaEOvsKTklrjdS8JibhcAVlzO0yl8lTxLYWiWJsCKoEOHEcVgZmzwvNNske1+cGnE93ssUXN94sITvX5b5kaoAJ4NZKHIhxlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sYnaEkUM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sYnaEkUM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C6F0C2BCC9;
	Tue,  5 May 2026 13:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777988903;
	bh=xIvBj6hevsJHw2j0MVGJKKmBTt9OLC6z57UMc3zYwzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sYnaEkUML//txH/xY59GXC0uSPaRY0h5JQtdz1MN64IW+rD4HFt1weJ1OkRQsKMMM
	 wkb5JMDu8l+GzstMWOJVFBU/DZZLUnYOrsyhCFg7N5nkLtvKiRU1dOLrU9FyfhOkLr
	 Mm2xuoq+ksc0hA5o+onsmpp0jY6a9bpMTIoU2LOP9almZ2/gXE8NeybrGW3aouiKgk
	 agWBWMjyckMu+A0W/yyfbnqAnLtOiVoFMFxCA+4VQKippPpnXEvJiFFsyLOcVWi9Vk
	 VEyP10YmDucOsmIUy1GEBlhlFgzVJ77/KlQj02lOGu+GA7wNzNadpGBr/fg8hxyw2i
	 uxQjPrkT55wLg==
Received: by wens.tw (Postfix, from userid 1000)
	id 6D8D25FF56; Tue, 05 May 2026 21:48:19 +0800 (CST)
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
Subject: [PATCH 7/7] arm64: dts: allwinner: sun50i-h616: Add video engine
Date: Tue,  5 May 2026 21:48:11 +0800
Message-ID: <20260505134812.408316-8-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505134812.408316-1-wens@kernel.org>
References: <20260505134812.408316-1-wens@kernel.org>
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
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index b116d3c12881..6272c9a947a3 100644
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
+			iommus = <&iommu 3>, <&iommu 1>;
+			allwinner,sram = <&ve_sram 1>, <&sram_c 1>;
+		};
+
 		syscon: syscon@3000000 {
 			compatible = "allwinner,sun50i-h616-system-control";
 			reg = <0x03000000 0x1000>;
-- 
2.47.3

