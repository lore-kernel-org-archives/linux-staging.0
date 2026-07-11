Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F312A2877DE;
	Sat, 11 Jul 2026 14:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783778414; cv=none; b=Hl20Jhn9l3YWYVoRaNA+q538inxHt1DGHpih51OyuXkZ3No61FvF6jDfwfKinQdN01wwzenYGR2/VSjnv8byz1Oc+8N8EAP4es0Y3YxrAanQ87f2Uxvp5TSAs/lH1FeYLpna5icYHNDsYVij5jmYDSBQqY19ljfcUB3hN28Z6iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783778414; c=relaxed/simple;
	bh=gW2V/cjtn2yP9PlGPvyWgig9cbcM95cWOOpoDOZuA24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YjAzrYDQDLIO5qVX7z7OelUSawgIrYth8mzl2yDRu3tkL82TkN9JsUvoq12D0sL2uSaSkD37Te8L3V4AZtBkTYD8zrCurmJHviH86EuZreH6YdAdBVq3GsKsfcAhPH4phCmh3qk/rY3/tfeGUY6bK8kKej0n9P01tTpavTN4fMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lz+dy0Es; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lz+dy0Es"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5038C1F00AC4;
	Sat, 11 Jul 2026 14:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783778411;
	bh=pzarCo0PiGEntl4cqzxyei11Yp87WevMdKTnQJP6EnQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Lz+dy0Es4Yygp/eB4qTmrqNxpdhw+CBv/MGfse2dLpCGqTnVX3UPHkXrx+7qIebP0
	 THClOlYed/0WxTPv2Pk6ApKj98IGtaPv4aA8GbfDb/8Wa1k5NAHmgDIRzHGUUSg58v
	 I5QjacFJu/Hu0bhVyYrZaSw4hMNSZz2t3vE/7slhOGitCt/+PTUIAyXXjpZdPaXoeD
	 6WPSWd35kZ03qRU7rYqeVOZ2aoONrcim1ULixOYAlVJtTEVlZ2/F96SLYZFF7sbyp+
	 k+XUt4JAXM6nMKJvoanY9YGDOesR/eoKs85/5pSUiLmi0n8XPSdZ5QbcF0yDzLmfIP
	 s8jRWlIL2h+UQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 84AB8601DD; Sat, 11 Jul 2026 22:00:06 +0800 (CST)
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 6/7] arm64: dts: allwinner: sun50i-h6: Add missing IOMMU for video engine
Date: Sat, 11 Jul 2026 21:59:57 +0800
Message-ID: <20260711135959.3616919-7-wens@kernel.org>
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

The video engine on the H6 actually has two IOMMU ports. The one already
listed is simply named "VE" in the user manual. The missing one is named
"VE_R" and is probably either read-only or used for reference frames.
Either way, it should be listed.

Add a reference to the "VE_R" IOMMU port to the video engine node.

Fixes: 62a8ccf3a248 ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 88c6e3e105c0..48c771223af4 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -206,7 +206,7 @@ video-codec@1c0e000 {
 			resets = <&ccu RST_BUS_VE>;
 			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
 			allwinner,sram = <&ve_sram 1>, <&de2_sram 1>;
-			iommus = <&iommu 3>;
+			iommus = <&iommu 3>, <&iommu 1>;
 		};
 
 		gpu: gpu@1800000 {
-- 
2.47.3

