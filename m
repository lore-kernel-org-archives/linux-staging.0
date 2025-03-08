Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C4220E00D
	for <linux-staging@lists.linux.dev>; Sat,  8 Mar 2025 18:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458942; cv=none; b=GA5t6t45pKFB/lfrfq8IQy5xEWsFghNMg7HloKT2I/LZjShl4sFVIgcVHdWNcQR3U9bRpyZXcHgONGUFy1xq7qDN2NyTGX2xwjghHrUWCz7LUOaqwIp2eWc4UpFdD2PLQXhGa7yxxQwteW40Rdq367UhbQM0EUD+f+gH1FUkdYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458942; c=relaxed/simple;
	bh=PSA5fazrZYGh2STXG+59g+TiLDvJm5XnM9PxyZImEvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UQzsHVZmvuKO55XGUjbyOcqoqlH+iJNc0vXqgoUCPaXBxtmmsCQ9xFT6VauxwkLPAkV0d/CgqZ1SAzHNO2kAstKB8LobfM+bN6YBAFTLomaAK8drKOPy+ZHiTsaWqlGUnInv/FtdDaNClqIY00u1gxf56rJTtx9H/COqNC0yDJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WeLJTLCy; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeLJTLCy"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac286d4ed05so25166666b.3
        for <linux-staging@lists.linux.dev>; Sat, 08 Mar 2025 10:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458939; x=1742063739; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cOgPHAoL12m9EBozXzMPJw28vDXvvK81+CTquR3Aqw=;
        b=WeLJTLCySZiJ4NT4fTysVdYpWc6blSutaq6sLQYwMbHaivePLkMLWFS44dFO7kC3gO
         AlDKENDZN+QbmuMxRJUFY/70V9Td0Svz1FbeVOZkO+WaR0GXmGwTsV0Md8G02nvfSw64
         X5YuB+4Q7vmLgrJOXPjlfdMOGqvHsHjsbizNfOEBcntmuPVwi5zQIv7kbHi9L27tX38K
         ehZshBCTtTgmSxLJTRaTG8KzgnnIP81/euBJHTQuc1XfCWzSMKi/scgY2tMhAl8Sertp
         hpD7q8Vxfzs8T/wPMoEKCH7UHTDmzQ0q0PkZqsB9wfvkfgKZxDk50AkTgyPu8rp5GczK
         qqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458939; x=1742063739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2cOgPHAoL12m9EBozXzMPJw28vDXvvK81+CTquR3Aqw=;
        b=MVKAxWVdLFWuzh9L62XAurVbTNU1Kr+V0tMg2fJ21EInDrTGHVAZHAD6C/amwZ0kF1
         xQRXWY/UuJjzC+lgWvlHCObZQoqmWCnvfQwOTciaHEa5wxILGtGNSU43TUDj+0wnxyHo
         QeAG9QREDJOL6QoKSmT8lsfu5RP2sECM/VnBXrsyut8kLWE8RcHv6edjGL4LhMWyxtRQ
         b+ICFcuoh3dYDZ0lJuxQJGhVQYOFkZ8Pnaq4viYoP0j/x1fUAvdJg2Ayfiq4IceVTpnX
         3tiuGXJJyM5kzWMdm5g4UFNe8Zx8lREd7gHh7o8dNkay0nzAIT5uMZ9q0QJHk6gkKpPC
         UQbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4Vt8whvj45NNVs0AaRUNw2uZebzGPJgB2nr9hPmHAl/q16lMNA3oY3Tos+YtiyIkg/IO0u+4hnHdtOwCM@lists.linux.dev
X-Gm-Message-State: AOJu0YzxvsnFyC3hGCKlVKTQbdx5CLnUZn47fbLhP4ezwjs2c/loobBk
	IHWjOnsPgKJvgijbbgp+ks7Pv8k6R8kIHBYGr6z30julEaPMfckj
X-Gm-Gg: ASbGncv8UOVpvtJiYMQgYh0x8/4za1FZto3kHZuBpvJ1tWH42M1phVrMNw7xzne7f4k
	gpb22Ls5fnTlSHIiGSK6xhUbFZ0VGC85WURpMS9WaGmfhV7DdEBmVK/KA4kNaNBLVIUJZePt136
	OZZCvp94kmQX0h0KV1BX3V+smXNqqp8XV6dsRjVkvXZNhShg/WOeaYf2hdyIfAlE6KUd/ViUKJs
	jLWZY4SCKKHYOBY+vBJbxbMVqcoTdgAPY72KuGrnFMAubol/pDf8L/fIuVV0JISuIcvgzKsmTQR
	LNqAzpfrzDN3uA6agPUxj3dTso18BVXNpA9ObwDtLq9XbeN+XQJa6kpv6w==
X-Google-Smtp-Source: AGHT+IHcPwKF5eB7VgOS8H61Ng0ywU+slTryB/Bsve8lxLP4Zc7Uc+Ntz4kGcsZJIup2zLzGgH7gHw==
X-Received: by 2002:a17:906:5ac8:b0:ac2:7a6d:c918 with SMTP id a640c23a62f3a-ac27a6dd696mr229761566b.57.1741458939203;
        Sat, 08 Mar 2025 10:35:39 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:38 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH 16/24] dt-bindings: media: i2c: max96712: use pattern properties for input ports
Date: Sat,  8 Mar 2025 20:33:45 +0200
Message-ID: <20250308183410.3013996-17-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The input ports are all the same, use patternProperties for them.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96712.yaml     | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index efdece2b33b9..148d196b9acc 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -40,22 +40,10 @@ properties:
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-    properties:
-      port@0:
+    patternProperties:
+      port@[0-3]:
         $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 0
-
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 1
-
-      port@2:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 2
-
-      port@3:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 3
+        description: GMSL Input port
 
       port@4:
         $ref: /schemas/graph.yaml#/$defs/port-base
-- 
2.48.1

