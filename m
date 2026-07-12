Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E3C36A342;
	Sun, 12 Jul 2026 03:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783825226; cv=none; b=TQDPrTUlkqDQr2QR70uhhWln0SnH33ZMqnHY0jDL59wImrehR9d3N1C6XK5wJUlrXX6LKNvz4myh9x9lTIt6MnYVIaBvVuqIyKu9dBPbyEcq4QuGqeOfzWecpzqznnJIDPO7VhS8DlqA0GkT0tZI3Pnih+O0HaxOUyPZF30qdYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783825226; c=relaxed/simple;
	bh=gW2V/cjtn2yP9PlGPvyWgig9cbcM95cWOOpoDOZuA24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Smxg1/dXN17/PMngXi9qfl21mbdXTCQu/grNgNtt2fTiN9AGiFGhGHcbaR4sTEyJrGO9cnlQdQB4m89nfgVje5p+6ERN1k39r7fyFwUvonr99QdhkIilUhBD/M9nXWNvxCwBZX2zJ0K6Y6JOOqMuSAsUyOvX5HpfgzGgRysH/mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OYM8XCBb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OYM8XCBb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF64D1F00ACA;
	Sun, 12 Jul 2026 03:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783825217;
	bh=pzarCo0PiGEntl4cqzxyei11Yp87WevMdKTnQJP6EnQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OYM8XCBbxH2+vtUBrUayX17GxvMN8/27b2gaHlDRqN4BFjlUSiSfcyRcyW2TF8L+C
	 vJ/S7W5M2KREywFteL4VjSd0hyKmPkQLDRlnsfmSJEanKbffe/hgGc2A4R1+jwEXak
	 Rm04jfGDdXLNsyiNVXV7FiOS4PGmd9p3PLOomY5JxFC+x1eQmRWshRJxb1cFPD2+8H
	 4O4aMvip/0wXtkLaXk34Z3fGGxj8exBqW1dsOcrAtkmYJu56IT/aUtWi0aVtbQmkg7
	 Gn/1q/xI0kevfc2inifGuVog2LzxvhHUyLWvX9wbF8gcCSzT+j+Gp4PvvrY8KN1SkP
	 nCaqGfOWmlRjQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 1BABE60169; Sun, 12 Jul 2026 11:00:13 +0800 (CST)
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
Subject: [PATCH v3 6/7] arm64: dts: allwinner: sun50i-h6: Add missing IOMMU for video engine
Date: Sun, 12 Jul 2026 11:00:09 +0800
Message-ID: <20260712030011.3778169-7-wens@kernel.org>
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

