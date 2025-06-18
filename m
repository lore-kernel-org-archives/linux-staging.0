Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADDF286D45
	for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 09:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240781; cv=none; b=ljLE46yT660kP9PMq5KPsREHuLdX9gj3FMVxgzGXDmrMZEATaH0p94Bo+yW2rBJfbC98qUSUTy3ApCugly3xzlCtF3vnILlm9bUQepQ/No9ZdtG6YjnHU/sizqJ3jWnma3ZapiTuxcI/NkH6bYtujiu5aXCh56v0JdFqSEYSucw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240781; c=relaxed/simple;
	bh=MgUWD9YQsxn5/C/R+JCffVZSwSVCSnac14bnAmk2/hs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z8P0qkfnv/T+fih9kYDXhUgYLXr6afPBWs2+f7LXtckepjJZWhcg2MDTSwh2s8+21JM1Cy38vZxgQvHcOGxv4CVvZwB9iW+CTmKOxG9j/BII+25aDLvCSyK7VAeL8QBh6uFq64pGsIMqednpZXmIwDGRJkamEMu+V/drx6y2soU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gu5Ev7Xo; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gu5Ev7Xo"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60768f080d8so12494550a12.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 02:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240776; x=1750845576; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twt3VukJmsfIxQG6dHkPe+c3TLZqJ4r3UnWmT1EUVdc=;
        b=Gu5Ev7XoqwOZFFzqL6Ym8/gseXZEwTcEcJ0dGkmvGNgG+VbaFTcdfP2KVIJ5gj6Cj+
         6O5UY68ySVLGlfgamoATCmHk/8eRUADGOSdFKDhuwvqC8Sgwl9tsmUq4umw8mUzjWDcT
         q8mF1Ce6G5ouS98VkDdb9cyh3Agqj+zh3OB3ultMHHpOFGFJ5r9TcFpvdmQ9LZ+DW1o/
         5WAgXMZvORkt1Rs6Xy5mJnNC4A2IpeY9ynLSXEC8+bQlh0Gl3Gq9QDlYUXvRi+QztYiN
         G0A57sb3QhHgFjDxyNBe1+m2uLXdzHMysy2XaX5kQFtUppWCBSayInexevLCIQmL5njm
         dpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240776; x=1750845576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twt3VukJmsfIxQG6dHkPe+c3TLZqJ4r3UnWmT1EUVdc=;
        b=YKXe/8oThBGaPMfb+KdbJaiL6bJm8wNfcaulA+Z56f3+vvpbG8SNYQ4qVt3xwhmqEj
         4gsrS4FQpYjY7MI/PJE05wCUg/avhDee/h5bHPizhh1kPDxtmH92FrFQy7WRTDoi2vDV
         0viHzbeEyqTZggAFh6yIOh4IY+zudMF1kHTA56khlv/563iZPJhdqJIE2oITS++nR7li
         svmILLVvlEZfEoh0t+3NWZ9DCGg47k47Mubm65EFW2LEcaGZsq7+tqCasTGS2vKDMT4d
         yQ4nYCrPUWfHEqS+EOZlXqa3K0dg+ilOMgZTvJFZpFSlQaj3mmrbJ1+1SEV2+yUdItLZ
         8b5g==
X-Forwarded-Encrypted: i=1; AJvYcCW748XJW1sPI9GHns0PACD8WKRmvAqKTkrkt5xflD93SXtCm8kIFj3sEN4gCIJDau7+PmCV4XUfCWBC1aji@lists.linux.dev
X-Gm-Message-State: AOJu0YyehIxRZQ9+95R33IViafpCqwlcT/cWOxDrm6rrfxpAj2hNhjba
	4VYUhqRHnYT09i27owW7lYTaO0S1oACO5gS04Fj5phW64joOyrOlFobK
X-Gm-Gg: ASbGnctPCWNb1enBvmKfcxDjxTo9kK0PlITv8nzu10dP6BcM3P1rrsL/nIcfe0L4DCM
	ErXtFGpqKukq1jOng3Yq0TwLrgMN3RAAKycdBt8gTgp7xuYCjGWb/6BiwvHdXQNSAWxqb741Bug
	ZU7M9UZHm20Vg9YHEHWSjdKRr5/RFF6jMgj+40d9XRGcVEu1pIgBPDdl5GIM1cQlxL3m9mdK/Hg
	c1cT0SaosxDlJ2eHAkZD1qRaxpO48iILKfxLD7LCCx1mHPXN6yx6TqFU4JeQBjUh+PenKtMrzHT
	BIiNj2vFzqh8wUmqf+RXQ4wYiDBYxVFOWxdny9WIdbhGKQE8eiLspZ/c8Meu6z1/QuAmgCXZrYA
	=
X-Google-Smtp-Source: AGHT+IFklX81xslJPt+iowLT+1k9njV2LQ7x0hO+cU7atbAXLMnFNCP53dDd5nC929uAPOjrypa8Yg==
X-Received: by 2002:a05:6402:2803:b0:608:1670:efe6 with SMTP id 4fb4d7f45d1cf-608d09c137emr16021790a12.22.1750240776014;
        Wed, 18 Jun 2025 02:59:36 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:35 -0700 (PDT)
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
Subject: [PATCH v4 04/19] dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
Date: Wed, 18 Jun 2025 12:58:40 +0300
Message-ID: <20250618095858.2145209-5-demonsingur@gmail.com>
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

MAX96717 is capable of configuring various pin properties.

Add pinctrl/pinconf properties to support this usecase.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 167c3dd50683..5998e2518be9 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -121,6 +121,116 @@ required:
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
+          0 - Fastest
+          1 - Fast
+          2 - Slow
+          3 - Slowest
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
+        description: Enables jitter compensation.
+
+      maxim,gmsl-tx:
+        type: boolean
+        description: Enable transmitting pin value to GMSL link.
+
+      maxim,gmsl-rx:
+        type: boolean
+        description: Enable receiving pin value from GMSL link.
+
+      maxim,gmsl-tx-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Identifier used while transmitting value to GMSL link.
+          Default value matches the pin number.
+        minimum: 0
+        maximum: 31
+
+      maxim,gmsl-rx-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Identifier used while receiving value from GMSL link.
+          Default value matches the pin number.
+        minimum: 0
+        maximum: 31
+
+      maxim,rclkout-clock:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Clock value.
+          0 - XTAL / 1 = 25MHz
+          1 - XTAL / 2 = 12.5MHz
+          2 - XTAL / 4 = 6.25MHz
+          3 - Reference PLL output
+        minimum: 0
+        maximum: 3
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
+                enum: [mfp0, mfp1, mfp2, mfp3, mfp4, mfp7, mfp8]
+
 additionalProperties: false
 
 allOf:
-- 
2.49.0

