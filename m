Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B13A286406
	for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 09:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240779; cv=none; b=YqG+s4Bf7s95C/fPJXHEK9k/8VRBTMwiSwemukFm2M33Z1KFABFOn1iO1mUCQFXaWk4CoLsMxSb7kHUrS04e+CAZVuh12bmiboCFcBPQtT9Nta89BLVbgtK3dTlDL1d6sgiBavAm+2OHVgxBKqbNbLVUbPvfCGjoT+gbgh8srQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240779; c=relaxed/simple;
	bh=BiOk7hVTh1ixk4r74A8SvY1QiZzDTb5HmWA7wk75IJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GgURILk362pzDrp7o54Jjr9Le5GtWN+8Rrpe5144bc2lNPQrJZKYTOWJpuIFMX8LAYA4aEHiw1Hgj50g12BCcsETbUYxrEz5i8RckV1NuXZqmCnXiZtcSJGXHIjO/X+awEsiEro3AU578orbVGA+ZTPcb+yTuBfLbWoQU6LYvyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zr97UFoQ; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zr97UFoQ"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so9741223a12.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 02:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240775; x=1750845575; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZK4rBTVhiBqQApt0cL1lNv3FadsT8p0opBD4ApBw6s=;
        b=Zr97UFoQQFEQH2ohuaB+DoVLivHXIHSdHRb0HwGUbRdyl6Qgw/HTSKGC+WtBxqkXRK
         8L06WoHYfGyUGoc4RsbpoekQhBkGeSzdtQ0Pduf9EzKM3Z5eNkj09X6gDpDIut47ezle
         w+mEPXFm4fzVMe4Q6MHTHvx5OrRvKU41SMPg/7qDcacWEw969Qr0NDSClDa6dXpVFwKe
         /NBdG54xZEvc5f8rb+ePU4TjR6wlcjtM7oUfiD5Df8SYhDwxkB3APzvy2rMkfHqsfc3M
         bX2bteFYSE8185XRLYJCGztcBnapMpX0TDoGsTcxSe0GALPMOqPTEoSagowZgv3PgHLs
         ntGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240775; x=1750845575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZK4rBTVhiBqQApt0cL1lNv3FadsT8p0opBD4ApBw6s=;
        b=Y6bjt2z9+HO3qNGRZ2o5nAiFh8Q52+o8/l8I+Begzo6SH0bveea+RBEtH1mT5bmOSn
         E1v1vkadV53X73WJtGDF9+soz98PsOlhNmbAsHWdxLaE2L2d/2wK+LdKM5cf9i02vPVE
         v6xEDbvzOw+P6sRwYZB7wtvu6nUm1Fce7WdnVZe3sn11AM4ts658wxX6cEB09AIyImUE
         tisqqOpM7dScZ0MeOJMKNuV6iwFxgcih+fZeE3CoiwSkQKorJWLYSRknIDUzAxFHfP7u
         s8hVU5moGU1ppQaGpf7HwHDqJWiqlopdlTk5LH2hQwLpwONneHq8NxMO037N/fHOsFFY
         Q6lA==
X-Forwarded-Encrypted: i=1; AJvYcCXIEu6UzJdHfEf9MCR/0eec9xhNT+BZ9z5TkAnJAAhi7R9AoHxKlsQGG/4IISK3ZibTsmXWmbHJse35p1hA@lists.linux.dev
X-Gm-Message-State: AOJu0YwXyDs7sRzmGmz4KssdVZkCKIl4mGn06/uPVYbuLQsS4MMuFarA
	4J01xQW/Hu9da7j4PgxUnGjtkAoiTLCTqgbsJBmbbcyPkrg8+5esd1hi
X-Gm-Gg: ASbGncsyhjcT8qPIZJXbmVCj0M21W1OYIYveV5Gz246OUItalA/BNayBWb9jf0/qCt+
	BKxwO8lVvaOT8IabyGA2SyiD+T2UOtSItgpcMzR0BiBhwxpKxbb2A91V65P9Zc6AXl3+/SDTocM
	SBgezluBBlfnz9wehLHgtdVcqaPVZgITQa4kOl1XgGqtChHeMtUrQQI6ULRFzT0GPUREN5tovTL
	b4f4OWeqs4dle7Dn5PHogMKjnhkzSI/8P+BuJKADcUV9lfJ1JGSwvAgJyefUCh8M7PGM1OCb5NX
	lOSogg7DgUHGwgBh0BGfQqvaVLfezLV1qF+wf/V3tqirfoWeSEECX9p1/QchflUV2mWMXWACHQK
	qYw+1ZYsmXg==
X-Google-Smtp-Source: AGHT+IF0O7yEFrSOOVfL1bKSJ2JPMdbGKHpONY0dvJ6BBwm5Ud3g1NaD5PYEDD7Z6R13gCb1KZocCQ==
X-Received: by 2002:a05:6402:278c:b0:608:6734:7744 with SMTP id 4fb4d7f45d1cf-608d083806cmr16928493a12.7.1750240774425;
        Wed, 18 Jun 2025 02:59:34 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:34 -0700 (PDT)
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
Subject: [PATCH v4 03/19] dt-bindings: media: i2c: max96717: add support for I2C ATR
Date: Wed, 18 Jun 2025 12:58:39 +0300
Message-ID: <20250618095858.2145209-4-demonsingur@gmail.com>
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

MAX96717 is capable of address translation for the connected I2C slaves.

Add support for I2C ATR while keeping I2C gate for compatibility to
support this usecase.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 15ab37702a92..167c3dd50683 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -92,6 +92,30 @@ properties:
       incoming GMSL2 link. Therefore, it supports an i2c-gate
       subnode to configure a sensor.
 
+  i2c-alias-pool:
+    maxItems: 2
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
+      '^i2c@[01]$':
+        $ref: /schemas/i2c/i2c-controller.yaml#
+        unevaluatedProperties: false
+        properties:
+          reg:
+            items:
+              minimum: 0
+              maximum: 1
+
 required:
   - compatible
   - reg
@@ -99,6 +123,21 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
+  - anyOf:
+      - oneOf:
+          - required: [i2c-atr]
+          - required: [i2c-gate]
+
+      - not:
+          required: [i2c-atr, i2c-gate]
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

