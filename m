Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F66728FA85
	for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 09:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240788; cv=none; b=TXI4ZrjEmUXY23DW8S2UJQT8sk5AgHIhzw7GUZ8ZA3vYNaEwZbJ2CzJNtk3ICSQSiYSP/Yh29EPDT7KnkKM7klGz2Ig5EocTHR8PaLdO1xG+MoXJ5VMAvJC7VRwh4tDjycNaUh4MjkuBPTJIJc63BlYf//BkYqQK0SiPctzWWJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240788; c=relaxed/simple;
	bh=lYKegvXEPP5UHua70hCOeKWQf4WN41EUv+Ge+hvOKNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sip3X6YKnDbEV5+uYx8iSqnDq4/5mF2oTv+1Sqm0oSInkoUhfERzOpoZKC7oo7sk+XKgSX4dr8fIK5lEWJNcxBAF50NRPcfk2kCG4hHaVcOCpZKI9jbhrilNwx/mN3PRa8PR8rDXD+Q1mkvMwPCDue27F5dAUBN9QGO9113BnKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwvQtLsh; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwvQtLsh"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-607cf70b00aso13212736a12.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 02:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240785; x=1750845585; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76TSauQPafZc1MT0mTUL25sTdCTwST3vHLDDnjzxqa8=;
        b=ZwvQtLshL122nNkS11mhvzo/I5MxNAlapXI1U6TIbozrr+gd6kE/Ze+rv4ICZfHP1e
         e3+QK+7sA3HLoFnShnZROMXuJ2vQwmSAqS0T2XvKlnDyJOo2ToQmkuZi//bO/gqXcXLS
         2icfYWUkaSztHIqJQYcbmF1v+4kazcyuq0Ecw/+I09wO1O9xl49PSoQCNJ3OUH4ZiA8T
         LN89Y7ikG0EBXZ4fFqFOuburpQ6DzeimvY98nbs/qxmbxvAkGqu8oNdR8DpMlQ4iFXIK
         tQ/EJIMm1OdUmN+/xaL0/Shal9otHAe5l32TRdLfo8l/hpBtjrp1uxg5MIqVToCNKmFA
         akWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240785; x=1750845585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76TSauQPafZc1MT0mTUL25sTdCTwST3vHLDDnjzxqa8=;
        b=MBCmSJzPZR2c2PUHHJ65O+4gEas1Yhxtb1rkMAoLIGD+T9JJgosY7Z+rUW/P3cx/eT
         BAts97fFxAZoyUJFJwx1W5iBRZhnzEcCQYr0VQSClYdSP0sEdSnkPzgREejdd7A8J8Xf
         rMaIN265a2n+o6mhYHupoNh4fJF/PVtlYbQ7KlQvcI/oMM6/kHat81QH4MPlRGaRLbFH
         PkM0jUiPxBm5rXmvMJtT6lhumzEOnVV879QsM1QzUTpFBD2n65f7FAF+FelhdQIREeHW
         yQeWfKXk0Zx5y+aMKZ6KYmRN0yKOq2eUZFGTLxXsb5bGtK+TA0qPpLYHZVo0inOF85Ja
         bbXg==
X-Forwarded-Encrypted: i=1; AJvYcCXMgJTBRavxS6y7iL8L5sTD/3hGg4DwBVZ1UVOTdytnh5mk/5XZa2zjSbbPzyb3T7yXpVMnbYWVxcUqLydB@lists.linux.dev
X-Gm-Message-State: AOJu0YyNNelaHr7Oh7hPCFaqIvscvh/yHzBIdsh4cZ4Mwf0bkkH8goKW
	CqgNxmmybwfDh9NK9Q83z6s784wgBArpoTQkj7wOVZCxEoiH4qGkA75W
X-Gm-Gg: ASbGnctutU/vOOrEPpmmbt6T6zrtfB77nYfOTWso95cfTeN+GQIgRCjwDaaw5oAwC1z
	pO/18oX9iUa8S0emHk02dusgtyDqzAn262tXuyPOv2d6FHzKViBrS61HKGaeYcbepl3GEMoLnkk
	CtoHdTglPXlomEnSFrsxkNsZeFF3mfNGlIZwqSMlKNkl9dqlZSBTSqO3wYPrzOQNUIp0zd740Oy
	kAjU+FnLWnVvQ+sEEfu9/O3njVnkdu/NnpdcSzgq5E44zFlOgKOY4aSk9f99A+3wPGXUtPQ01tx
	FSp9hblNsBDvi+yzJC5VUqQ2r/wbZh9qzl3hyseZkxtZV9upNF44jlcezZJ9AM5ZI9gWwB6+jhc
	=
X-Google-Smtp-Source: AGHT+IGcJ/3EJ96nlb0xfxLZsuz0PFAwjNNvmaF1G6tPL9/xfE5cjh445Nq7XLGFdsd0S8fSuFLJzw==
X-Received: by 2002:a05:6402:4402:b0:609:d685:e831 with SMTP id 4fb4d7f45d1cf-609d685eecemr570244a12.12.1750240784498;
        Wed, 18 Jun 2025 02:59:44 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:44 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org (open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)),
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 09/19] dt-bindings: media: i2c: max96712: add support for I2C ATR
Date: Wed, 18 Jun 2025 12:58:45 +0300
Message-ID: <20250618095858.2145209-10-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX96712 and MAX96724 have more than one GMSL2 link, and each link is
capable of connecting to a separate serializer. If these serializers
have the same CFG pins configuration, they will also have the same I2C
address, causing conflicts unless the deserializer changes the address
of the connected serializers.

The MAX96712 and MAX96724 support changing the I2C address of the
connected serializers.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/media/i2c/maxim,max96712.yaml    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index f712d7cfc35f..758c0223977d 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -37,6 +37,30 @@ properties:
 
   enable-gpios: true
 
+  i2c-alias-pool:
+    maxItems: 4
+
+  i2c-atr:
+    type: object
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^i2c@[0-3]$':
+        $ref: /schemas/i2c/i2c-controller.yaml#
+        unevaluatedProperties: false
+        properties:
+          reg:
+            items:
+              minimum: 0
+              maximum: 3
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -79,6 +103,13 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
+dependentRequired:
+  i2c-atr: [i2c-alias-pool]
+  i2c-alias-pool: [i2c-atr]
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.49.0

