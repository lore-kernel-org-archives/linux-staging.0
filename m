Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC0A2C3271
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 19:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694293; cv=none; b=rvFj0O37D3rFeBraUmXUp5ppluO1VU8+a0oxG1yQk9SqBGV6CYdabt64ouSGTEJlTj8QpVG/KxrnP5lf41HCin4U9QYDpTHlp76qtVZGbuVY2xF4pcQn1ftNfw9c5L345SC6iuULZYYkA6s2+2BrRMAthJWaFFi3BxZhUqUmWak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694293; c=relaxed/simple;
	bh=JfCjVDpNvj/yX5XnYKoO6JDnWfyHITSwgdVL+4kNl1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bQOZoy1oVJgTzQWUPRq+5U0iBNE4t4XO0996b9c7e9qEY1tw/hqBGa0Ma91dNVLRP5/Dzw4y0WLxQlu0cXQbMS2oHvoH6s6K0Q459pLNgoWRvOAnaGY0jPYXBqNLThzxjSuFakqWDJo+KmS/yuGjLk5+hdfIFOELPXiwfIDTGO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtVKFOVg; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtVKFOVg"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ae0c571f137so40815366b.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 12:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694290; x=1753299090; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VY2xY+2Dp3KHgbNVnY+ylp9yfgQzMwwh8U848dtuhZE=;
        b=HtVKFOVgeR6rNTO8tDJS82XyKPvIEOVe5HwmT0pHx3oOQXfMGfsBVuBhRUCrDF8wDD
         5lHgKwQ/roAAWm98jhS5/bEdvMTUuzYlAhs4SWz4NmQIh6XhPpAaP24ySo0sMw9n1NFe
         tZDjICF0qkn2/2/FZ4YcksfwBIR9Vk5wqi01BjToAaTzV/qPkimrzqictGrd27XWiVO1
         Lun8J+fWB2I+WY+Q5LMiYDwqjmp/fOLKUqS93y350llLJf0/ckuMxxNST2SUQSh0PO9P
         +QXTyK1Vobym8fyTtWXbqHXR//74WOQumU23mTHWIWkV/E/TEvRFGQm/vxO61g0kt8Dn
         2pCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694290; x=1753299090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VY2xY+2Dp3KHgbNVnY+ylp9yfgQzMwwh8U848dtuhZE=;
        b=Eantu1LC8s+6y4cVKquAE/ksz7kYVwj7bDfUMb8QZLMcLyhzqjuDU9U7c8Egr9K8D9
         ACB1GgWhdYnt2Z+flosSBlbWTFIByjdj8V/uHsRxdK9UhL4BGxNpL6CVTTpTXSP/Brda
         KNiX7RdROGpn2f9CvG7ZRwwSMh6powtF5miNTCH02P+5ZXW+w4b80U+htwL3DjeE0Vdr
         pxmZPoxq1L6R8n3uK4YsFmUGQ+8CLrVbjCxakrLnbWxwf1wl1AJGK/myp4kMD64MJ+4F
         ULcEKy9yhokzRX6TVHEK473Ak4fvwGuj62xtYGDU/VxfpoTEBNdyPCCXAXFCs+bOprCd
         7SWg==
X-Forwarded-Encrypted: i=1; AJvYcCW6Z5yHm+Akn0H932gpNiRnfbZwq+369OgRoiUSvtIwQRtfL5Ltyuz9HQ82j9HmH2Bgv4g6cAflu89kCOpB@lists.linux.dev
X-Gm-Message-State: AOJu0YyQ1qAgyhJPSbGHQhln5wansbL9ZS6KEDUHq+C+ZaiJIvi9F7Zf
	FGtUNriXcOUn27hKtAekD0bC3IbtT/MtI7qzlVwxeYN1rgQOJwKGZ49B
X-Gm-Gg: ASbGnctmQQ6+p4SCWPxM8nFtD20gnvcoF2t5AS9dcVOyE3MRylcyfsAx2ES+e0wXP3q
	Bkh+WGk8iyYOPmbcY+U2pZW846hr8gbo729BUfVKJ/b0mJS1wYVEggvK2maZ2NLumlq9KwWA+68
	U0laqbrbzeLFMG5RZ1ICoh3dSOWk7u6Ox/o5zwhTPVPw9daybp419YU6Xze9Qj/UAd0p0ZrFkEM
	xZxAhGKqV1tpROnA3TgkmC3jwyf9kko3bftbhZNyfwaFpaAyJDvo3aXW1+1TRaeUm2UXBuS4gTe
	2+Zf6Z6OXgcyyElOuiVJrKjD8YyOamZRErqhTl+Q1Gh0DP/ImkbS2/70VQMSMu983nIaugjXkWQ
	JpSEz9sMW1rFCMoxoQiWofnFtxp5SIiepFcg=
X-Google-Smtp-Source: AGHT+IFbzmjXPORehx4gBLWL6nDKMc2K1Ww4NbN3ka9kvo8IrUO2+Ra0huOSILfblCFzf0Qzb5YuyQ==
X-Received: by 2002:a17:906:3b05:b0:ae2:a7aa:7efe with SMTP id a640c23a62f3a-ae9c9bbc69cmr330143766b.58.1752694289556;
        Wed, 16 Jul 2025 12:31:29 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:29 -0700 (PDT)
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
Subject: [PATCH v6 04/24] dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
Date: Wed, 16 Jul 2025 22:30:49 +0300
Message-ID: <20250716193111.942217-5-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX96717 is capable of configuring various pin properties.

Add pinctrl/pinconf properties to support this usecase.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 167c3dd50683c..9afaa8a7a3f52 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -121,6 +121,111 @@ required:
   - reg
   - ports
 
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    properties:
+      function:
+        enum: [gpio, rclkout]
+
+      pins: true
+      drive-open-drain: true
+      drive-push-pull: true
+      bias-disable: true
+      output-disable: true
+      output-enable: true
+      output-low: true
+      output-high: true
+      input-enable: true
+
+      slew-rate:
+        description: |
+          Slew rate.
+          Rise and fall times represent the time needed for a GPIO to go
+          from 20% to 80% of VDDIO.
+          0 - Fastest
+              rise:  1.0ns @ 1.8V,  0.6ns @ 3.3V,
+              fall:  0.8ns @ 1.8V,  0.5ns @ 3.3V
+          1 - Fast
+              rise:  2.1ns @ 1.8V,  1.1ns @ 3.3V,
+              fall:  2.0ns @ 1.8V,  1.1ns @ 3.3V
+          2 - Slow
+              rise:  4.0ns @ 1.8V, 2.3ns @3.3V,
+              fall: 10.0ns @ 1.8V, 5.0ns @3.3V
+          3 - Slowest
+              rise:  9.0ns @ 1.8V, 5.0ns @3.3V,
+              fall: 10.0ns @ 1.8V, 5.0ns @3.3V
+        maximum: 3
+
+      bias-pull-up:
+        oneOf:
+          - type: boolean
+            description: Enable regular 40kOhm pull-up
+          - enum: [ 40000, 1000000 ]
+            description: Enable either the 40kOhm or the 1MOhm pull-up
+
+      bias-pull-down:
+        oneOf:
+          - type: boolean
+            description: Enable regular 40kOhm pull-down
+          - enum: [ 40000, 1000000 ]
+            description: Enable either the 40kOhm or the 1MOhm pull-down
+
+      maxim,jitter-compensation:
+        type: boolean
+        description: |
+          Enables jitter compensation.
+          Jitter compensation is used to minimize the jitter of the
+          signals transmitted from the deserializer to the serializer
+          by adding a fixed delay to every transition on the serializer
+          side. This can be used for pulse generation where timing is
+          critical.
+
+      maxim,tx-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Enable transmission of the pin state from the serializer to
+          the deserializer using the specified identifier.
+        maximum: 31
+
+      maxim,rx-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Enable transmission of the pin state from the deserializer to
+          the serializer using the specified identifier.
+        maximum: 31
+
+    required:
+      - pins
+      - function
+
+    allOf:
+      - $ref: /schemas/pinctrl/pincfg-node.yaml#
+      - $ref: /schemas/pinctrl/pinmux-node.yaml#
+
+      - if:
+          properties:
+            function:
+              const: gpio
+        then:
+          properties:
+            pins:
+              items:
+                enum: [mfp0, mfp1, mfp2, mfp3, mfp4, mfp5, mfp6, mfp7,
+                       mfp8, mfp9, mfp10]
+
+      - if:
+          properties:
+            function:
+              const: rclkout
+        then:
+          properties:
+            pins:
+              items:
+                enum: [mfp2, mfp4]
+
 additionalProperties: false
 
 allOf:
-- 
2.50.1

