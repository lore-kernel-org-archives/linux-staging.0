Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18F51BBBDD
	for <linux-staging@lists.linux.dev>; Sun,  9 Mar 2025 08:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741510132; cv=none; b=ILDbTDAkwvbWluw5HZ8Ypvsd4pH5g1D3/xywJdpLcvQAwGQZcWsv4oAvim+/KFXM7EFe2cRs9YmbO4D9DA9f+yLsQMpVltuClZfrgwzDTQU8+BpHxVif/GVc5sSRUBDCr93btEJZIkx/2VAv/d0hzB3+EgPXth3J5iUaj8ara8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741510132; c=relaxed/simple;
	bh=ZLEVbgIgj5wrAWs4Zhn6rr/9m3Q09MuxUivARR4TQPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oJ/NvcPYDHcb6RQ/JkMAkO1gjseuQCt+jEERCvLgIVku/5x66EdV1teopfEZUf6/pEKfg8G9gDCO9MX1wXVY+OPqfEYWhn0+qKVgGYD2czzIGd0Fs0YOm4k+9PcKa9c4f2k57WJd6SLk4Mng+49D3uU98oBsKwB52lRnw+32nj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k570ooGK; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k570ooGK"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso662410666b.3
        for <linux-staging@lists.linux.dev>; Sun, 09 Mar 2025 00:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510129; x=1742114929; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRFND54pfWCeCgjcI3QhzMAI2iu+uBF4oELfUtwbQW4=;
        b=k570ooGKG21ARpa6Fx/zqVTv1Vjc9wPMZvUSFtXi/cUV1hC/NhRIiTWbhAqQso7uUi
         dw9rcuXTHrvfsEf2kzC1yO9xnFhjSczrgZGumyN8YpVLW3zIpg33X36pieHjgWc3/Ff+
         /gKgB76IYxfHm7t5uYubcpFdlYJJBNN4c2XHZcPCYbeCEmoU2locOWFaK2uqrkE4sl2j
         kVDJN92koLYVy1bVFhbZktLsos9jcr8tZcI1aB5M67bawOO3+pnmOX184JTB7kyT/kz2
         D0Aj8CMB0HIf6k6WwNb0MTTIIePT61y2u1SRdLwEQJpbYOfTpVvkvW4WNHkjPWIAXiuY
         EC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510129; x=1742114929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MRFND54pfWCeCgjcI3QhzMAI2iu+uBF4oELfUtwbQW4=;
        b=QTU0u0XWm7yJs/+TQz2DjEAN7mixMlmTPq22B/FZBBR/6Bnqoem6+E5NHYKGlVm4TE
         TZNV8qPfC4wUuBksg+oQXZddKzs1gW0Xsl882KP6On49+J01LqCGMoL1CXJ/Pc8bxcwl
         a1LKEzGT/28i6wAdZAl/FCoK0N/pHEjaz+t6n8pPiDKBGj6sAveSbG0s9gmfSjRS3A8H
         XCh2MqJo3wAE1cb/UmI3/9wp1H6OkAnEqcB7ZGS5mkCq3bMn/fDim5ZyBLeYRfm2zo1c
         TuOnHy6VhL5Rv6HGVujwkACox0ce8y6vPiImS02lnS5HBkIgLPovnxpK0DCU6bKbuLIl
         kb/w==
X-Forwarded-Encrypted: i=1; AJvYcCWgL6luR2uGA92FwBNtlAXZUo3W/W17czfTHCtakJhfKhle4s4tnmMqkRJi1l4dT4BI8N0onnSIfrOMmQzk@lists.linux.dev
X-Gm-Message-State: AOJu0YxFDHuG0yk1RVJpASRPb+rHoYbSEnggn7dHpxz6ns6TGPrvYBBX
	eJyCq7t5rbgboLtbqVDzvaN6q7Y7+hP777L32LCT/bnGKeaS/vP2
X-Gm-Gg: ASbGncuA1UuXmvPjh5eM5DleuqpggdPjXFFrbVciJIfrL/aF2ZKbKYQZh/xb+B0QsyY
	Ox4ple18oT43M0mkeEHLe8ZO5y3gydAN1xOSIA/aDt3hPBuMUUfVBweAKb6MWy2ZBps/P0e6rBi
	6Ra61hVm/rPZAwCbC5n10McqndBnICT7UveTDtfYlHJgHUsEoTCx6DZhpeF3pLRNSu6rOAxACNB
	23g1bvRdta4r1ISQjJ6otefI1M8u5nfd2+ymv41XGS2UbG1UvQVxonVjlb1SvKWs6Cgl1BWUf12
	mtRhqcEq5d8ByIsKO/JAL3eAyoSaN2BMDsjTZjHMkIT19Yk3BU2y2zZsrw==
X-Google-Smtp-Source: AGHT+IEQtmKUVV88EQYf1nXCbrxWnIHZsl/uXnzZPIJH7g+3jAJsdmu+BnkfQ0xHlYuHu8xDJYCjTQ==
X-Received: by 2002:a17:907:3f1b:b0:ac2:7bd9:b2f with SMTP id a640c23a62f3a-ac27bd90f23mr491776566b.9.1741510129117;
        Sun, 09 Mar 2025 00:48:49 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:48 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
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
	Arnd Bergmann <arnd@arndb.de>,
	Taniya Das <quic_tdas@quicinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH v2 08/16] dt-bindings: media: i2c: max96712: use pattern properties for ports
Date: Sun,  9 Mar 2025 10:48:00 +0200
Message-ID: <20250309084814.3114794-9-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309084814.3114794-1-demonsingur@gmail.com>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MAX96712 and MAX96724 support up to 4 separate PHYs, depending on
the selected PHY configuration. Use patternProperties to document this.

The input ports are all the same, use patternProperties for them.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96712.yaml    | 29 +++++++------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index efdece2b33b9..bf8c861c836b 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -40,27 +40,15 @@ properties:
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-    properties:
-      port@0:
+    patternProperties:
+      '^port@[0-3]$':
         $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 0
+        description: GMSL Input port
 
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
-
-      port@4:
+      '^port@[4-7]$':
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
-        description: CSI-2 Output
+        description: CSI-2 Output port
 
         properties:
           endpoint:
@@ -78,8 +66,11 @@ properties:
               - data-lanes
               - bus-type
 
-    required:
-      - port@4
+    anyOf:
+      - required: [port@4]
+      - required: [port@5]
+      - required: [port@6]
+      - required: [port@7]
 
 required:
   - compatible
-- 
2.48.1

