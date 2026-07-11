Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C7428726E;
	Sat, 11 Jul 2026 14:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783778411; cv=none; b=RgqtBxy6IB1yO1xyaRQJ8t6wPGZroaL8uQpUn5LcVqLYbVsLZxULhbPTIe9emOVL8+gA+4jqx+jjmvTA6+m+X8aRYsbmOiDVqQux6+ZcVuc9yGQeFbCI7PpHtQ9BnaDe8P/luXiBohMAILTaKkCXfsU/xDeJUAugho25bJq4m00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783778411; c=relaxed/simple;
	bh=h8HnPa9jPNT9KN5lGEI/AtSgYlDiW6l80zMgBH26b/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Br88QggPQq4RJZh8sHIO591+BwDjJZC7jbWmCK1ClPTV1kwyMexSg17UErMRSwPFIRUunCxaAUmfuJZU+4xsQoVmumKeAIwkAKfvjjssr3WK88jgGStQLUB/us9vEkxdoE25AZyxMzh7edCDG2fWkzrWqwrD13D5lV/BKzWZ7Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hL2iwygs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hL2iwygs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496841F00A3E;
	Sat, 11 Jul 2026 14:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783778409;
	bh=lHn+VlrPP8+DG9eMf2EHuMFbxRRlTlKli3GayR7WGoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hL2iwygst/9gzBKYB3gR43vvXyMtPra1B9ErC5aSzTvxX6k4t83pD2fsU0jrX5ez9
	 02o/BWBEz8SMjpfhcU4yoUpo8zGAYfb+JBGF+TPxMR1IOP0IxuLgR6jPHsACHJ2QYQ
	 pLVz6Syx2bvGSzhtYeduRL9T60iirIJL6czgoWXqVqsf/Jj3y/W6Km7oUnOQ088O3g
	 T9L/3zjDGvMu0wxO2g/wmgj00Wn/Iyg4kL0UcKS5Tb26lYBT82KSL/eDD9pCqqNZaD
	 LcY+v141/EYqUct2Up0Nt6FiJ+3VZDuOoJBNYrVWq90PQH9cLL3+FmhgF0h2yHVrxI
	 JwGqvyYV+yqNg==
Received: by wens.tw (Postfix, from userid 1000)
	id 65CBB6018D; Sat, 11 Jul 2026 22:00:06 +0800 (CST)
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
Subject: [PATCH v2 5/7] arm64: dts: allwinner: sun50i-h6: Add missing SRAM region for video engine
Date: Sat, 11 Jul 2026 21:59:56 +0800
Message-ID: <20260711135959.3616919-6-wens@kernel.org>
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

