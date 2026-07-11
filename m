Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D2C2877DA;
	Sat, 11 Jul 2026 14:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783778411; cv=none; b=Enl07gLIj5ELCX/mt0RA8evsDxhHz9p3CEeO8WrAeMPV7gyYUGYAmabhYpRBYOBwDu9i28jxZBIXIF0hBcOgUxH+FbHAB11FuBkf4kZPy7mXmxfdLsRvTQ/XvzrHZXiDbHA0GQs/VF9a+Q+IIxLY98croQ2WxAQTe9HsIMnIfZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783778411; c=relaxed/simple;
	bh=Q7sOoB3VrXS4zjRLNEjueSh8nOAfFRmn+saoy9jpSTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h6zRDVQyPsMce4c5uHaCNUsSvjl/FbWoytYEmaApAGU3QXNsOoaKUZMy5ZRecxZBNClniciG/Dz45lqu6VK0MJnitxWQeW3IG61QJqVVNeC/rsUn0Tt79P7zVMJV1ZrDnmgqI2j4TkTfI0JhZAIV+zQttQyTVOx9JbNoPV2Me/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iN2TDt0S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iN2TDt0S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469F81F00A3D;
	Sat, 11 Jul 2026 14:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783778409;
	bh=68XIjv3oMF74stzxvIJ/Qs/DZ1vupGwuNZ5/TScVAvA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iN2TDt0S4biyCk8WOcxwnVlb7psB5khRO/3zJd+1StlxchyMgu6w81SUhBVK0H168
	 P+cAljV3Kqzc8Rt5TOZf1kx8Z9g2RGBdWsYtcmiDP4tSU5QDRzUfetPRaqWuroYqbD
	 1NpdXbB20qsJG0kBGzplXT8KS95iGzA1dDGqn4mDVO9Zu3b456D5RnG83IIIUB7I4c
	 0voVYyvaOzL5ti1iDPR7mz7yaj79ULglU28/PeMg9H/GsMpkP/L5f+UjnIcND4dwJl
	 +qil9nxOTI59bWE7pOeMibs53l3DuQki0WdOSV7jly46oZwybUxPZtfq7153iWXJYl
	 G7wIwrNaDw3Ew==
Received: by wens.tw (Postfix, from userid 1000)
	id 20A725FBBD; Sat, 11 Jul 2026 22:00:06 +0800 (CST)
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
Subject: [PATCH v2 3/7] dt-bindings: media: sun4i-a10-video-engine: Add H616 compatible
Date: Sat, 11 Jul 2026 21:59:54 +0800
Message-ID: <20260711135959.3616919-4-wens@kernel.org>
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

The H616 contains a video engine similar to past SoCs.

Add a new compatible for it.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../bindings/media/allwinner,sun4i-a10-video-engine.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
index 818d815d4732..20c430795134 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
@@ -24,6 +24,7 @@ properties:
       - allwinner,sun50i-a64-video-engine
       - allwinner,sun50i-h5-video-engine
       - allwinner,sun50i-h6-video-engine
+      - allwinner,sun50i-h616-video-engine
 
   reg:
     maxItems: 1
@@ -96,6 +97,7 @@ allOf:
           contains:
             enum:
               - allwinner,sun50i-h6-video-engine
+              - allwinner,sun50i-h616-video-engine
     then:
       properties:
         iommus:
@@ -111,6 +113,7 @@ allOf:
           contains:
             enum:
               - allwinner,sun50i-h6-video-engine
+              - allwinner,sun50i-h616-video-engine
     then:
       properties:
         allwinner,sram:
-- 
2.47.3

