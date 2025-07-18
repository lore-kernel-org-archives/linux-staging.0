Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C4E2DECAD
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 15:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852323; cv=none; b=S3OpwY0RNGfAxxfqDNLCHKdd0Y2D1U/d2i38YJa7XyE/Vgt3Ybz5WUIIyUbsPNxUq8dnWLMkgVt2AUI9jFXccS8raA88TqVGgTlnT0SIB1KJ9tXIIsleOw8QalOl2w8uNMACJsHC3mjpAcRTs8mT3WTmjW/OctFgWye0CSzHrsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852323; c=relaxed/simple;
	bh=hb2tD74FkJ4Z/oLY/veC6PvS/+Yzd0YGgxrh+Xy6/FY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DjhAxoU/HlhNp3plKscA9mo348b/9Y/pXDagODJ4xHHvyY3i22kh+fMElG7AXZxxxYhK4lgL2/0q0JInF41baKV5EjWwUdBM5sDlulhp2fJn7eXz0VBcU6/tYYCaKJaobjzDrCpz/FDPv++UUKrBGPk42ZAJ6lyL3/z4glarxDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImhcFMcZ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImhcFMcZ"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ab112dea41so1323621f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 08:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852319; x=1753457119; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYu3gq0SvKezou7DSttLXa9MnM9KSDxmSDvAl9UefcY=;
        b=ImhcFMcZABGftAOmsgitTJKBiwhBQ2sCZbal2FICWLSjplyq3NSb2jH3uuWf/YOatR
         OmL6DaYgTwycVet7VD1AnLvEBNmVQHHF87eyc4tbUTUwzbFxdik2IaA7hzh/PiLiMw+6
         vbchUfTtqf0uvyp2TtrZfQogNbYslC24yXuC12GMXaBIjmmLN9ncYF6rI9MTtYtPmWiZ
         eIIGNy7z7FDSfm72ISmNgf4TCLX1lxb7POVB3jH8W7hVax7iy7p0shxjWNHdDnXX2QC1
         XqxskLaFRTXPqo/L7XzTTKGqf1VFyAUVE9ibLpUejeVKoFDdQwnm3wOC73xgoAQ1Ap73
         2lOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852319; x=1753457119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYu3gq0SvKezou7DSttLXa9MnM9KSDxmSDvAl9UefcY=;
        b=IZEbPv4cXWnR4GWA/ItfC/tLGSP1fR4k+ZBI4UZr6nWhoSeg0cydeBtumo3dXDauNq
         pjitB34D6plCPd5z5Rnmd0NVuSHF4RMW+EOHxQcNBbwkEuz0RoOx+AUrvTfJH0BHN+Ab
         9+JrWjd2H7BFiA+d/Rayg0okBJBZ6x0o2aHxhOoWAPovA1dh9DkeltfEYySGD4vDZolM
         w7rNpCysw0RHWD6s5o10muBCxV5oHmhmZocMGKkuG0pDzjlBadyNh67QXmxlVDBhI6HQ
         wemTz3rA4+vhhzpnpPxaY/3de0U9/lMGTdJfa2cPwTlmsuhVC5qpWot1Rj2YR5h4FZX2
         ve1w==
X-Forwarded-Encrypted: i=1; AJvYcCWrQQANL6JNOvznnpc93Ybk7eVLEJEyyISnfTaK5NMZutjOxV6i4dz4Qiw0V5USc9zMPI29DsBb7900GMH3@lists.linux.dev
X-Gm-Message-State: AOJu0YzWeuiJE6Uir2KRI1l1n/DdC8PIeBDFennzjMifzPLrLcDSEnyr
	C5RO6wVX+Kph6iMrUqaljEhvij1dh8HnDMVb0eaTyZ9fkb8syq40z/BF
X-Gm-Gg: ASbGncuXjCNL80xI0Iu2XxLuUy993mxKyY1gKyCc9VfJ7Qq3QTAb1qWymzwLfb0uk+/
	K/kwSs7SNZpxT/MWh5i5adgzSJci0xct0pU3zOGT0RgC5BLywYT4ExH4SSpf/BfGyz/4UV2Oahk
	erB+sO9J4luzzAOuy2OMDZlOeaBDY5Wci1J2JgWJ4Ly2QLzMtqksyPajREOz1UmWLQ09Q1bmNH5
	ZEnnRbOsdMcVNWsRfGo9kBFeAsQl0VnBDRQ5rOvv/5V2iNMD7j6WsdsfixhSEe9mJglri/YeIJ9
	k9nChKhXbZETvK02mbdLf+XpJaYukhWLFoSUzh3rTgxrT5ErqrGS6L6UnBdcaTQMRO8KRmeBtqu
	3WAVD6iauYSRUqhPfdOBq78aRbXNFcbv2q7RpAEF2EeyKVg==
X-Google-Smtp-Source: AGHT+IEnZaN4T1aWyiMymnwtrHibVFWNCN2EyngNMlWV8/LXD9E/fE3pkx0haNIPm6wkD38CJG7rJw==
X-Received: by 2002:a05:6000:2c06:b0:3a4:ee40:6c85 with SMTP id ffacd0b85a97d-3b60ddc61d8mr8989086f8f.54.1752852319055;
        Fri, 18 Jul 2025 08:25:19 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:18 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v7 03/24] dt-bindings: media: i2c: max96717: add support for I2C ATR
Date: Fri, 18 Jul 2025 18:24:39 +0300
Message-ID: <20250718152500.2656391-4-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
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
index 15ab37702a927..167c3dd50683c 100644
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
2.50.1

