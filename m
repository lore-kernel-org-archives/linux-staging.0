Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849DC369D6D;
	Sun, 12 Jul 2026 03:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783825221; cv=none; b=cyWC4CerK7xehKdYxW1ihcto/d4fmDMVvrQQh1lME2Y4Zrbtbz+6KL5/VL/D9zNiLUD62KuEG7aXISs6WnTICe4ZCuFzFfBHG9ivfC7SbgV7WOWLODNNB4o6uCOfGojbemF5r/JE35dzOY9jB5DnpcdO9Ja81e+LZ30Hnp79LeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783825221; c=relaxed/simple;
	bh=Q7sOoB3VrXS4zjRLNEjueSh8nOAfFRmn+saoy9jpSTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mR/m+SgILLIWWr0PgXPzBd9XKkX3m+lplADo439IWZoX9ZhGgG/2EnRb+e3wEc3k6+7AHCJnoG4g7u8kW9doLNH0HEPBqkBUgWNICkZ9VXy94oTXtSJE4qI6KGRLDJLP3M249MvwxysMH56AWrlRYonRjtaqjg2NsVVFmNhJylI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JyzhDnQp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JyzhDnQp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 212F81F00A3F;
	Sun, 12 Jul 2026 03:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783825215;
	bh=68XIjv3oMF74stzxvIJ/Qs/DZ1vupGwuNZ5/TScVAvA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JyzhDnQptnp796Jt8cIQNA2igTmFyWjk5uOuM7cPCPEy2loMVoyEBQBPfLvzgJJAZ
	 mpj0wuyY9JZNWgV8QlTPF/kN9Ylsyuj6D2ARjSCQ88uKm5wbWbomImHRFVr6fnZDXw
	 OLOmzAnyzH9fkEhodd8nd8c05v2t+BQo3NoLy7HZQ/Ts8/n04krPk5V2mWGuUHFJmv
	 a5umP4t2zgQkaub3l1oVFxzYYTLys7MUCqhWa4FLlMNiQZKx/3SZ1R1W8g/Dszmk6x
	 hepWeRF+XURJZry173jlwV81Ldvd6lW6tovSG+y/0XuPpqK8cQqbPSj/IHX6FyeVHV
	 q6r3padp8Id4w==
Received: by wens.tw (Postfix, from userid 1000)
	id EA7F95FEEE; Sun, 12 Jul 2026 11:00:12 +0800 (CST)
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
Subject: [PATCH v3 3/7] dt-bindings: media: sun4i-a10-video-engine: Add H616 compatible
Date: Sun, 12 Jul 2026 11:00:06 +0800
Message-ID: <20260712030011.3778169-4-wens@kernel.org>
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

