Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23F747ECCA;
	Tue,  5 May 2026 13:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777988901; cv=none; b=pa5xmXxpFhAiJObhDYziIxQgaum3Cck0R40Cy6IXZh6Cw9exV5wiZCnErgevjKTRybL4yWh2ndt6Q4Q4ZQRZk0d5tNj5xCOcBQMds+miTFOU6aJWMesijHZTNg8gKEBFxUYpYwnUaJ+yU/yTWSh+dlISPT7YnF8yeIiUGtmIRTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777988901; c=relaxed/simple;
	bh=41aAwkaRzDArZ2/BUER3ytgPMD/yUeLsP1zzcXu+P7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DInb7B7Riw8eWVL4vmtdnjxlAu5CaaEB8Gtlhxc7dm2y/FqWhi3H8TUv+Czw9gZTnoUpWna25iUx1pMuH4oq/djI25P202LpQAbxvvR6NGS1OHR8YoW+YHmiFkf8zVrsgvQW/xzCEb4N/jPhYeGHSeJgM/AKH3jukDx2pbRttcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pr7RAkwJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pr7RAkwJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E312C2BCC7;
	Tue,  5 May 2026 13:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777988901;
	bh=41aAwkaRzDArZ2/BUER3ytgPMD/yUeLsP1zzcXu+P7Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pr7RAkwJ/OuNJ4iFRuwgPOUqr5/X2gNfeBNEI5jDSh/jpDawzZ3oWjxF2t/z0Pw0+
	 +MHVJhCyfK6IZ33s054r4LAg7lTQCd/kX6s6oxK/jbtk4jEzrQTAxvix+OpsK85XSZ
	 bXOx4h0x92dn7/bBQF8JoH03dm4VG413J9opE22tKuJ4wN8GOOpd4VgH2GxkXjtvFv
	 6QQwRvQdJcKdbIlV9xJSUCyb/sHt0A1sRyX0zVWxDj0k/OT0nRukAI+8XnBzuS4XKS
	 5C1kDABrdGS0YkrANP65UnyK6HV72gI1t5Ar6BvS5qmYpe+CcCJw20VSD2eE0kkSZa
	 aZD5EfwfhHoEg==
Received: by wens.tw (Postfix, from userid 1000)
	id 4A7455FF94; Tue, 05 May 2026 21:48:19 +0800 (CST)
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
Subject: [PATCH 3/7] dt-bindings: media: sun4i-a10-video-engine: Add H616 compatible
Date: Tue,  5 May 2026 21:48:07 +0800
Message-ID: <20260505134812.408316-4-wens@kernel.org>
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

The H616 contains a video engine similar to past SoCs.

Add a new compatible for it.

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

