Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB81D36654C;
	Sun, 12 Jul 2026 03:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783825221; cv=none; b=ADvmvfFH5AGR+d4ffv7jxyl963dpg6BgExojqemmbGo7695XRQRCKFD/4O/v+ElFkD3cbQopTI2ntDETelZDUweq+UnnX3FijqKrlmuzxWyjn4pC2J1mHvTD9CnpSRQ9RMK1ymKqLmqAOku21VvT8WmJurJbJvIwwa1h2tTjrco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783825221; c=relaxed/simple;
	bh=Cc3iXIe7vA6bWvZE/goaLJXnEVxUk1J4/yD+9CVPv6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ctEliKPc/AqAXHdoz3ubXXopFaCCBaK5qHQCO1uI4gYrJTwl56Vbz1S+CZ1XsRIV0GGwIsr9/CJbmfmrvm3Ot8suwDggVlFVg7HukDws5UvZCfDgn/ifhLjpZcYqMWj+OHwjgREXZSX65udv9kkafDObweL2sKSJTOrDWhICotc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M3ViGUJD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M3ViGUJD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1097D1F00A3D;
	Sun, 12 Jul 2026 03:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783825215;
	bh=4OuezE/moo5Tppqmye8t2PqCkPAk1kmw20Fa1p80Uak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M3ViGUJDdOiDRTiVtWE163GhjLsJEZern531YSS1D5os1zFDHYIvLNbuqrR2Ev8PP
	 RAEOpFlhoxoWnZvZWEMGKj1lfMbM+WbhqgfZ8fNpN5kr8mid/ABCNeOCMB+Q5Hb8Mo
	 RFmEW7NRCjPNhVXH3I+Bg4cbGESorTC/GXDFrHMgvG3Y+2Qgmb4yUxkK5URber0DFY
	 F8wT9k0tB0pd5MkP5i3xquo1ZlmzvD9+lRdGfEP06GHHgeyDy/E22GifI17e/BL5yb
	 CKkLrUm9/T1DyQuFvNJyEWnVGrhXyl359afP5EqyeMBwaRYw26d8cgkRMAulPJzgss
	 tlXGLCKPEcCuA==
Received: by wens.tw (Postfix, from userid 1000)
	id E2AB55FE73; Sun, 12 Jul 2026 11:00:12 +0800 (CST)
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
Subject: [PATCH v3 2/7] dt-bindings: media: sun4i-a10-video-engine: Fix SRAM count for H6
Date: Sun, 12 Jul 2026 11:00:05 +0800
Message-ID: <20260712030011.3778169-3-wens@kernel.org>
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

On the H6, the SRAM C region includes an alias of part of the VE SRAM
used by the video engine. This region should also be claimed so that no
access happens through the alias window.

Add a second SRAM region phandle to the video engine for the H6.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
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

