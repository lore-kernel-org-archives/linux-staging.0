Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1688036B07C;
	Sun, 12 Jul 2026 03:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783825226; cv=none; b=omc91x4EeMp5uKNYaYIyEZrsgpqeEg2OjLFg5A2rpuplb5C2N6WXo2edU6pCEHMWfrJ1/G3UHIS/UioRb7WXlR43PKMOaTxgiFDMU32p+yt6PWXxtFL9j35C+YGWT4zHyfsWITMIAS4iBOa8MyJG4OIstQVNJ3Y+zv3DLy3FsWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783825226; c=relaxed/simple;
	bh=h8HnPa9jPNT9KN5lGEI/AtSgYlDiW6l80zMgBH26b/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xe3chNhtHtfie+k5jL6MzB8IpFt7bGxXBE1d0mz14sUnl8SysiekX/PiiOMhzFgd3blAT56bgNTXxVolNI6ZRimBZyRlEiHvO93pMNrkZb2ugN0hHdBQXvRWHDFi79w9vsvps8xk/wgeu03n0l1gu4GY+dj/s/PZgXD/LA+bEXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vy8zoUDN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vy8zoUDN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE1B81F00AC4;
	Sun, 12 Jul 2026 03:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783825217;
	bh=lHn+VlrPP8+DG9eMf2EHuMFbxRRlTlKli3GayR7WGoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Vy8zoUDNas+vvG0c2LmFKZew4UfK+SSk56tXC0Fg46ambpKU2CcLCEQEapdMGuJso
	 RkVe97ZOQL5eMAlMX8gyaerTuDB6oCuHmW6eld8HD7KMgK582JOcs9zdMF+FKSAEGm
	 UN9y79Qoo/obqfiZ+xwvgueP3WNMjil1T27f8ubXOBq3RGVyiWBye77Ibw37JpIolE
	 PpvlwyjgWpcOIML36+DlC15b2xqDcsYrRro+ioOY3jcBWkyU1dix2U7TepybWGKyYF
	 qv8LuD+BdIIfT3lm+r0rNgZmuCsjGZS3CfxKZmmwJr4JDnN65E4Nx/4P70/eXdQCss
	 A/EX6AmbO9WFA==
Received: by wens.tw (Postfix, from userid 1000)
	id 1245460176; Sun, 12 Jul 2026 11:00:13 +0800 (CST)
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
Subject: [PATCH v3 5/7] arm64: dts: allwinner: sun50i-h6: Add missing SRAM region for video engine
Date: Sun, 12 Jul 2026 11:00:08 +0800
Message-ID: <20260712030011.3778169-6-wens@kernel.org>
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

The SRAM C region contains a partial alias to the VE SRAM already
referenced by the video engine. To avoid access through this alias
window, the region should also be claimed by the video engine.

Add a reference to the SRAM C region to the video engine node.

Fixes: b542570e5605 ("arm64: dts: allwinner: h6: Add Video Engine node")
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 72ce1a75647b..88c6e3e105c0 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -205,7 +205,7 @@ video-codec@1c0e000 {
 			clock-names = "ahb", "mod", "ram";
 			resets = <&ccu RST_BUS_VE>;
 			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
-			allwinner,sram = <&ve_sram 1>;
+			allwinner,sram = <&ve_sram 1>, <&de2_sram 1>;
 			iommus = <&iommu 3>;
 		};
 
-- 
2.47.3

