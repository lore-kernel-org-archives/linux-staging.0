Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A11369D71;
	Sun, 12 Jul 2026 03:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783825220; cv=none; b=nLZBuA6s7TncTiooD5csejqq6iCxPoDnW3gyc3dKNkGB1unMptw4Scj2t0pxshA6Sa1IeRqYBRxbMlih2kCcPRG7fEAA8YfW3sGeBKFZ+fL2UBPT+vRu71vzWDHZ1mUJqvbscw/06auMMS7vHRP+4rrsdLQqPI6uM4WoROCfqus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783825220; c=relaxed/simple;
	bh=eYBnTZ5HKkGWeLXchZhY3cgtIf3nlD6Kr1/ecwKnd14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pq1brnPHPcYNCLk1d8u67TdJoMwuzfSs8chwP23gIvWuZFi1evLZOdm2W0N7oNdXCD75CW5SBD6eD5J+zTbhJW4Ig7iPaB1s30CL/fTKBozPz3CRquQI3ur9yv5Ss2Stcf7w16L7T2dPt9AnymQg59j2iNZNucVcQpc/2rfulpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e2XDoclE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e2XDoclE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0157C1F000E9;
	Sun, 12 Jul 2026 03:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783825215;
	bh=/qCsV/vqShpGar2CdE6+oSzfHojJA4x7ZwJRazSD1MM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e2XDoclEhrjcVXWvh1B880XUPV66a/sOIoLIrOoFelZVtLPr/wUYWsLyZrlKRu581
	 0O9NHLai3WeFMS/3jZeBqPVEogdIvl5wCdN3aKBoh5tYGft3DEwSWmoshmmUmRd/kQ
	 k+Du1QevYvtZVwb8BSzkvAyGbVu9jriVr9tmU3rG8DPvItNNqd2GQfdVqvf6lxAeDH
	 uJITsVjef9Dz4j0oylJOyQuV3b+ZnC23fR8I0WSag+l/fuqTdzFRDpNbyjhoYTID+w
	 gd4QpTZucdCndzrFVIjiN/yF/qZrqZy0plb9VoGPnHUJ0HlhL1GsbkOdtEmb9KFyYR
	 Gotp95BSe0iNw==
Received: by wens.tw (Postfix, from userid 1000)
	id D7B8A5FBF9; Sun, 12 Jul 2026 11:00:12 +0800 (CST)
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
Subject: [PATCH v3 1/7] dt-bindings: media: sun4i-a10-video-engine: Fix IOMMU count for H6
Date: Sun, 12 Jul 2026 11:00:04 +0800
Message-ID: <20260712030011.3778169-2-wens@kernel.org>
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

