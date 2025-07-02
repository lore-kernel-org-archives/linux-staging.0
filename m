Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A581288C1A
	for <linux-staging@lists.linux.dev>; Wed,  2 Jul 2025 13:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462483; cv=none; b=tFuCq1Zsk7Ux9yELHKu/lqbnUEYTr68/MBJG8TLIKyo3VWfIoLQKs22cwodUNLC9kITQExuDw9aUbg1NgZjLGRBfm34cQtC7I9rzH7+Rn4VNskl/hm4Rj13K5OCFHOg4DJyhpVJsp6y3p/c4jBZBLaP26fvxvzy/GlveyUpdGZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462483; c=relaxed/simple;
	bh=TE3k2eV/hH/Mt3GOBJgmYXBl9jXtatuAw/Bc11fhydc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dJFuzGIdPsH+1JTxnP+sCjvVGvcsWl2y+uwA921fvkdPKl4Pe7ni6YfS10ogqhiyD9sxIJAjF5FNnFoGXLTYddctZDEtTSTChb+GSdv1ZYgLHBKesOAcKRYAxBVJwMM7b5AbJ/Zru8s+0Z54RvZbZy7hc+O1nv5XzYSLigVt4NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZO5hWgZQ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZO5hWgZQ"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae0de0c03e9so1026679766b.2
        for <linux-staging@lists.linux.dev>; Wed, 02 Jul 2025 06:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462480; x=1752067280; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wwEKc5F7Hqp81pD5zW4YT9WxlrKCAXN/iB/acg9N9g=;
        b=ZO5hWgZQ5L+CyZ31l5L+NuOYvAd9EOXhXQtrUyTQ/WsMk+R+gLMeds1Ro6bWoImiLO
         pH8WhzIGe0e9KCaKfNEg9TqRbqcJPO45x4PoBaeMalkkWGTrhqDo7IiQUu3pIF7+em6e
         RK3H2iW/2CaLBMsSRApQiCmGL6sbE/TH6tTfaDlf5RoD6sBsrNUVYeM4J9XuPFfR0+xm
         5oqEBrr0dtnp/QsKI5X+Z9jBul06QdcdyZWybPXnFQE05/v+RNFdGubjc2m/2ZJGOu88
         foRg1fuDmWEnU8YAQedOG2QmyyOGDe9BJ/i2CYXdFkkRnpaEDigabUX0mqPtTDTXLHk2
         FqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462480; x=1752067280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wwEKc5F7Hqp81pD5zW4YT9WxlrKCAXN/iB/acg9N9g=;
        b=O84sWFP4mYbEuf4FVGZqcuvh5UCtrsPIS7yCLzcAyONoeZai6LOAWKVNcZ+vn1ZvqO
         aGDXe0b4i9RS5w7pAnw3GW7Uf5GcisyqmzVKyhii1BHef+nmzUVUIWWOD/+ZWUJTkreI
         rrNTMUPlSbeIR0OUgxQoZMGb0w/GCNHSRU91vB6DolWqiAsqYlZ/GqhkktSTdn+yZ0Qe
         5oCVWT2R6zMmuyKf9HzenLYpJ6Mr2LlmaP54lSc7UeaDOzIkJf+P3498fw8nc0e/Zkg9
         MGwljQnuFh5J+CholckHJysiFthMFHrhpOZeGvFdCXq5OJB2ePHAt7jd/M9WGWVfToUh
         4BIw==
X-Forwarded-Encrypted: i=1; AJvYcCWfwv3dv4M2FpSfbHG214S++6zWsuKQBnJmX4kVGG9DWT/3syn8Y2oTlmsqKoinlL0nzHEd3xz8mF/GFaWD@lists.linux.dev
X-Gm-Message-State: AOJu0YyEAJUeY5RDDVMjSsmR+8D5kxWePJvhQuussjOo0Af9hlMYTyuG
	brk1WQlq12rfSDcpEmbU8CBjBDR+BHjNUDfn1IjKtQ67j/x8S+HUmO+W
X-Gm-Gg: ASbGncsl73pOmEAiIJOwOryGNxCkzbCCgZDQ3sFTqO/rDyshg4Xa1d6ZMtoG/Bl0FM9
	iboMiZ/2QAQQOO0hy9IBngw+07KsxFw5ZfWTInM8yg5zjKZuOChySBQwD/N9w2wlA47lY1gK9+h
	kxQr/XmWP/hyizIvs2OrkYMRnH0idRvJ5ERU5lSbCUIGF+qyiYjjuOSPBZsSDMoWVCCKZ2ljJJ8
	bHzosR2CTNNwTLSihxDag0nd/JjpKpVnjiqu6Aw2VKM0GZvOUzR+noayErdwEgx9YznTcaKV9jl
	Q82dtAc0GUryKfOjtTKFE0PWFD9E6wpd2Xu4dFzKkxQtsc9hNS64w5zNWrpanYpK7/txvEMgGMc
	=
X-Google-Smtp-Source: AGHT+IHvtWJAofgeCW5hFh4rua7c197JsMsYxoyHXe9CLnAs+7Hh4VVKnq6/7oDPTZuf7PtT37kJfg==
X-Received: by 2002:a17:907:3f1d:b0:ae3:b9c3:ddd7 with SMTP id a640c23a62f3a-ae3c2d5fcbemr280701266b.45.1751462479504;
        Wed, 02 Jul 2025 06:21:19 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:19 -0700 (PDT)
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
Subject: [PATCH v5 04/24] dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
Date: Wed,  2 Jul 2025 16:20:30 +0300
Message-ID: <20250702132104.1537926-5-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
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
index 167c3dd50683..9afaa8a7a3f5 100644
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
2.50.0

