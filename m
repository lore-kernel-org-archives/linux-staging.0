Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B565472777;
	Tue,  5 May 2026 13:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777988901; cv=none; b=Bst6wMrcCH9yAXF5gaLhsx7U6u2/YO7pt+uNBmMSx6ecSW7Cvl8ivCsVBKNXWvT/I8eeuU90DGQ2z89ZIfsrAf/EUI0MdDEnnqyCIn5bs+0H0vO78FZnaZHBHoHt3ssXxn8eoYt/kdvzilp1JkirUumFpl/lYA0TQosPQ1t7bts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777988901; c=relaxed/simple;
	bh=ZsY5XFzqNVQiSeNyF6uBu+6Xjl7uvw0cAdRVeaRm5ko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ABQnmN8QfErLmblr3R3foKvajRUehjMl3+BiPZvkswX9zUBUTk+cK2YXs7aGPKpVTrp2Ue9K0KOAyeXCuNOa2L8xWBFSSp526i43I1I41M/xJZJsMWjvRZDE7HV5lX7zGgAUaf9Ye3cmoRcnqo1hxQDjrjgpk8GG2MGu0PeXNJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rPhIC7V5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rPhIC7V5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511D1C2BCC9;
	Tue,  5 May 2026 13:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777988901;
	bh=ZsY5XFzqNVQiSeNyF6uBu+6Xjl7uvw0cAdRVeaRm5ko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rPhIC7V5uSFfU6H3ewavI8bj7W4vnj0Qa9g0HpjN7D3qCd6ayeQIl0i0NenzYx2zx
	 t8btSZtPMK39vZd5C5TfHwt68gRynqfUHkE3+FLvn8cteRg2kb85Z7j9VNSEMP5vsD
	 oYVk/es+nrVCQ1WGuHUXfhdfPF2FsdG4DPEPz725r919LpeSPUjSzrSSaLd5dHjr46
	 i4KBu+okDn2nN1y6rm9URDfSLU6mdZiX8l4O81UvexScwayCkX4jI6RGvKtzKKO6dn
	 MxVb7JWIiLVt+PVkBCeDYIkmQyD4wKQxC+cQur3uaZYjYBs7005rbval/0KM3/Pv0C
	 VlWaENvCdpJqg==
Received: by wens.tw (Postfix, from userid 1000)
	id 3D8735FF5E; Tue, 05 May 2026 21:48:19 +0800 (CST)
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
Subject: [PATCH 2/7] dt-bindings: media: sun4i-a10-video-engine: Fix SRAM count for H6
Date: Tue,  5 May 2026 21:48:06 +0800
Message-ID: <20260505134812.408316-3-wens@kernel.org>
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

On the H6, the SRAM C region includes an alias of part of the VE SRAM
used by the video engine. This region should also be claimed so that no
access happens through the alias window.

Add a second SRAM region phandle to the video engine for the H6.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../allwinner,sun4i-a10-video-engine.yaml     | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
index 932043d7f0cc..818d815d4732 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
@@ -48,11 +48,15 @@ properties:
 
   allwinner,sram:
     $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
     items:
       - items:
           - description: phandle to SRAM
           - description: register value for device
-    description: Phandle to the device SRAM
+      - items:
+          - description: phandle to SRAM alias
+          - description: register value for device
+    description: Phandle to the device SRAM(s)
 
   iommus:
     minItems: 1
@@ -101,6 +105,21 @@ allOf:
         iommus:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun50i-h6-video-engine
+    then:
+      properties:
+        allwinner,sram:
+          minItems: 2
+    else:
+      properties:
+        allwinner,sram:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.47.3

