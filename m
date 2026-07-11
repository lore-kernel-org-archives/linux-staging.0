Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A6528DB54;
	Sat, 11 Jul 2026 14:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783778412; cv=none; b=JIO+9QxMLS+trC1uPq+JP28ezF5FwY2jxsrKN7+AJ2Bkeq9L3yC1+dCLDMhJf9vP7CAzycbz96M2lNTGULalpbqr7E+ew8iUtUhjR0jKK/TqucRVewyD6VVz+XTwajewAX5f6ror6ZcuEi+DoiT/97oq8w40lmzpsMf2Bh2a1Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783778412; c=relaxed/simple;
	bh=eYBnTZ5HKkGWeLXchZhY3cgtIf3nlD6Kr1/ecwKnd14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZPFeDbatSLYJ2MEoWGEEw60WYIJ183n3wFOqigBAdBbAEkKK/vc92vd5SOo9ZgO3C+E3e8trxiq5+CSiJWbh/37v8l+zhkRdAbg/9MHJruI8TmAmOLr7N8xI03z2ZrMWl75ibyZvWuGJDc70F6NSS2zJozDyvXIWMLiBlLDZQDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqvoZmeZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqvoZmeZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 448421F00A3A;
	Sat, 11 Jul 2026 14:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783778409;
	bh=/qCsV/vqShpGar2CdE6+oSzfHojJA4x7ZwJRazSD1MM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TqvoZmeZyNYpuRTxFcr+p7IlzfKrp8ktfhRLiYx8FXlxphTNrhBwtEeqHQzYUQiMj
	 xcZhlr3iQUZUz5qABbz0wINEVdNk+mTswo/3Qn+hcMcaaanE+6JzWOpKTYiHpZ4iea
	 hDWL42FmBHmN8cyMJdmVQgsjxyfqk7ip3laU1gr8tS07RyJg1SojK7keUXdoLyZkxm
	 +r454dde6PU+UVXApe9oTRlHNtk1GxCBJ4VO7LiHfxC3iUoh/BOjWkO/XHQZ2qQvwU
	 c8sVz9OU3xJry2ap5uM4jskFww9Z2pbiw1DBZqcbLAV7uj84Kgq1UWBpeZ2jRXxu3N
	 oGw08pHFxVRMQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 2E5B060194; Sat, 11 Jul 2026 22:00:06 +0800 (CST)
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
Subject: [PATCH v2 1/7] dt-bindings: media: sun4i-a10-video-engine: Fix IOMMU count for H6
Date: Sat, 11 Jul 2026 21:59:52 +0800
Message-ID: <20260711135959.3616919-2-wens@kernel.org>
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

On the H6 SoC, the Video Engine has two memory ports, thus two IOMMU
connections. The secondary one that is missing is likely used for
reading reference frames. The newer H616 is the same. On the other
hand, the D1 only has one memory port.

Add the missing IOMMU connection for the Video Engine.

Fixes: 62a8ccf3a248 ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../allwinner,sun4i-a10-video-engine.yaml     | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
index 01f2afa023f0..932043d7f0cc 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
@@ -55,7 +55,10 @@ properties:
     description: Phandle to the device SRAM
 
   iommus:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: VE port on IOMMU
+      - description: VE_R port on IOMMU
 
   memory-region:
     maxItems: 1
@@ -82,6 +85,22 @@ required:
   - resets
   - allwinner,sram
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun50i-h6-video-engine
+    then:
+      properties:
+        iommus:
+          minItems: 2
+    else:
+      properties:
+        iommus:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.47.3

