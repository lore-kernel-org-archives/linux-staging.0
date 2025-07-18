Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6EC2DECD8
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852325; cv=none; b=SxgtyOwUuxUrUNyxPTfa/W5p+D99/zjPaKOBl8MVeh1TaH7VHo9JF8/Tb0V4oSb1ukhHuQtzoLq/hE8BpkrpTjF0kL+UjqKFSDVggJlAw4itaIF7C+7U+vC83P3JljEkoi/uYegLtJ+zj6PE1AxlszSg0KyF+4LqMQ2I0J4Nw4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852325; c=relaxed/simple;
	bh=JfCjVDpNvj/yX5XnYKoO6JDnWfyHITSwgdVL+4kNl1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hdNqv42cw31WPQ01cVtp0QZ/eBZ+47i4Kl8X4C3oRlZsWQVgLh5Kq4d7wHNiPH27VWdCWC8hHsxDhv6Caw+yS24GtEdkx/cZ5yfclcmKpK0qgErn2KwqbrruP4Ao4+1BdoInV961/azZMCYMhmuWgAYq+2rJ2tILTLP+kus/tsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e5uW5ZHb; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5uW5ZHb"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4563cfac19cso7442605e9.2
        for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 08:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852321; x=1753457121; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VY2xY+2Dp3KHgbNVnY+ylp9yfgQzMwwh8U848dtuhZE=;
        b=e5uW5ZHbzHijW9HP2lyJROeEly5yTKNtXzjfONht05HB3Pi6OFUjzRTk7AwSkkQoJb
         moE6LFKE0KDtIR7mt/e5th1naBk+c5BV8Uvigfx9vehW2mPY2NNomuSDOTZ3v7sXTKRa
         cO0SMjGa4m0l6RdT9jtSMqorgh7eGEBtb6J0B2oT+f/gS3DPAM7+9JxNTkIIbYRpkwWR
         ORjyyBonUxgF0OzQfRO7wcLUgtDoX5E3gChOZtR2IHrIQA4kewpV2w/CW8M8G7rCl1aZ
         I77+MUPtaFOa6jLnD4PhhfA74X/hVe6u8xh3vvNjHkTzQBevjlPRiqR9D7lNwaTQjaU4
         GtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852321; x=1753457121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VY2xY+2Dp3KHgbNVnY+ylp9yfgQzMwwh8U848dtuhZE=;
        b=KA/rhEiZ82Ls65y9+4q3VyiiR0dtXlfHf/XfpyhA3a3gk6bKBmlKzJvD2ivURmV40P
         W+jziwZJzQZgXhPOcsivkIb1nvpC/RKJDGRr4LT+FxgFkwgFtF3Z34e8rVbi8JQSH44l
         FeobRk3F22UlL1F635LwsmxNv33riUPH1ALwR4WHPgRFJQ28ta0CcmN1TDuoDrXxgRoi
         lpynV0XcBHzf25bzA+cFJyYHusYjfgzAWsDJEr+ggZl9Pak2B1KP48CpH+EWf3k2afvX
         zNXJHeX8p55BeU/YNut0a8W2gEQUoAJKEQuT9y/Bymz4bWfF/vml3Dr3kzUZ0P/7pqbE
         KzEA==
X-Forwarded-Encrypted: i=1; AJvYcCWaC4CWVjWkEoNiGBy3nPS6iD5S0GT0V/ShRDRrTrsHl49LtKOU8jL5IV/uDCK5N54ipcCFkMKgltBJEytG@lists.linux.dev
X-Gm-Message-State: AOJu0YzDJ2J9eewF2jRtrQ373Wj/zPSc1m0JFEqQlsPuwOuHHdwVTsD3
	UBmpz1yhD5qd+R6SF6TkanlXQ+E2mdpTSKPmmpkCX4F32GLacX71cWb+
X-Gm-Gg: ASbGncuAaWk0CpXSCx/P4rUlpN935IiJQLJmkey7Os/P53ID0Z4nrV16Hm+8nLeEa0y
	ahsB9oCu4xvKpp9M2TRIbcp7LQaNY1blMmKnj9rdif/DcCM32dqxaSUmzgD8LErNg+8ndGXbJby
	2HYZP3devMckX+3Tb1yJzwg7Xl9W19uQCJc8DnFYg034+XOl/0G9JBgOKDXXKx/6uLPsGYjc17j
	xnww/nyyCcBd3Ha4LYnpB6Di+wlYgPp9wb+yfDInaHJNGqIBrU9EIIJsja11z9/Uob2XMyuwPGW
	E7aLftUPessBxEBUzj3HDc9cgAQ/D/XEt7OwQ84D7H/hZYULMiqtYWfv+/qjs0nt/1RknBV1jGe
	mvTbuK2Un32OGwsHb19xGp1zGRgKGo0W6t5I=
X-Google-Smtp-Source: AGHT+IFosEa8A5/jx/kIbHSrM7rulfvNRKcdtZAvt/wouq2stq+zX6XaLcWYGLbx0MAHp8UNK5rpaQ==
X-Received: by 2002:a05:6000:4911:b0:3b5:db54:c68e with SMTP id ffacd0b85a97d-3b60dd4aa3dmr11399941f8f.9.1752852321306;
        Fri, 18 Jul 2025 08:25:21 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:20 -0700 (PDT)
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
Subject: [PATCH v7 04/24] dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
Date: Fri, 18 Jul 2025 18:24:40 +0300
Message-ID: <20250718152500.2656391-5-demonsingur@gmail.com>
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

