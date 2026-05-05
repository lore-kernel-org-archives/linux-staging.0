Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0B047ECD2;
	Tue,  5 May 2026 13:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777988903; cv=none; b=h+9ioKrggjL756thJz//4aCWY+pkiEdQwmfovAdYBO6Rzmc+DZAPy065NLkE8BzjC2IvIjWvXGiMs/3tZxazTJyQ18BVBAlHPxwq2pTHqqVYbkuVndKd4gT1r1E4UcetHpPa3b5FcjxzzrrJhPAU+Vj1/54XWlpfmxkZYv0yVrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777988903; c=relaxed/simple;
	bh=wQgoGnngpTZW96/wSsSOQkYRjEid39CqoW4AdwUk8c8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nkITKp0jhWMWHx9BCQzn2eIzmxuk1pMPoWRjhiWfE6C8H1GdZxYrEs21uqN2D4S80drMwTU/R0cxTQuOQyzsGX5xztGOC6OJDDQpXOo28PDWjyFUBzP+fASDa7LYV0/Xk1pCe2zD3WwVxBF8dRv00/sebFIcvw+pZGZ6vBU9tco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qY0vU1hD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qY0vU1hD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AEFAC2BCB4;
	Tue,  5 May 2026 13:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777988903;
	bh=wQgoGnngpTZW96/wSsSOQkYRjEid39CqoW4AdwUk8c8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qY0vU1hDz1VGwqEpu4PenJ508SsBSxkOb1qgmmPdpiJ2EfsOm1pO609+2NfbE8JoM
	 pQbhf+pZsGm7MebPGD3iRGI83ydhaddTYGDgZ2PlEQi+K8pz1JStqeUSfiU163lo1D
	 WBxsFpK6f+bTzjtioTM53vpnatbL2ZMwwD1md5VsZgTkbiDCSO//vPE1H3iTNMioah
	 ItKyfJoWunJyYNxO62qtVRmnxMrSyaLY3TtFtFZ+Vf3dfJih8dOG6dWbLB0BfE0p8r
	 iM4MMD1z17jqpB/8TKvd0mftJgY9vJLkfLAopSeIf0EXWNYZMl2Ctbp7j4nYrvdWoD
	 dOSzIKAgXOEsw==
Received: by wens.tw (Postfix, from userid 1000)
	id 61B5A5FFEA; Tue, 05 May 2026 21:48:19 +0800 (CST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] arm64: dts: allwinner: sun50i-h6: Add missing IOMMU for video engine
Date: Tue,  5 May 2026 21:48:10 +0800
Message-ID: <20260505134812.408316-7-wens@kernel.org>
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

The video engine on the H6 actually has two IOMMU ports. The one already
listed is simply named "VE" in the user manual. The missing one is named
"VE_R" and is probably either read-only or used for reference frames.
Either way, it should be listed.

Add a reference to the "VE_R" IOMMU port to the video engine node.

Fixes: 62a8ccf3a248 ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
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

