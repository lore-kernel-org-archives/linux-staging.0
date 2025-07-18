Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920C12E11CC
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 15:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852336; cv=none; b=B8Mu9BO4DaH5Hyg+Zx/OulawONVUH25bqdcXA8NRWmBMNDF57ja7zp1mJHD0j9ppPpGhyzoNVDgCWuz7r9SsfV0wXcdraCZjRUogMF3X8sDFrBJttkq9TYU7x00q8sGAASjqPr6x3TKmC0bU+MnOLid4nkcUsL4rvZxfyJvccZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852336; c=relaxed/simple;
	bh=NSiAFSJxTXVeWHTLdSPMG/Gzwe3s9N0ySr8pok5YgEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nOBWpfx/cN18fiTA/CNv4QPCXurLVEvKWHeH5b3iqdN54wdJ+RdbsZjLF4m5kqD3VEtJwB8+6bFIL+uYNEz+hGLYRaChtNSEaEae2s6i0seRYqmiAGmaKzD6YAafpYQwnQRaRO8BZIvlZCpgsz7me7fkBvPsDpqTCH0v2T9Z5pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAFic+Vu; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAFic+Vu"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45617887276so15951775e9.2
        for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 08:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852333; x=1753457133; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9ZjlAULE2F6JwrtpvzjiapTBh1bKC7bsQfwLuPPxcE=;
        b=ZAFic+VuUM9BhCV4BKJk3ohS+469KdC8r/9Ktw0jTnwykrQudMWKJOy88sQykiv44C
         DexihMNPKakCf9swX1DlN0o8vLotbflgH4E/RQ2D2LG9LogKLPXAqwV4y8WhkTyHep7O
         BfJcDRgyvqLI1fPh55IenChkxY3Dk45bMoizXLaPXLWi6Dxb1dL/sdThwNR35dZ4256D
         IyvK9LJ6T5hqygDtH95KZq6P7oEAiu1nrHp2apwnulW/x5nQgFT1xg9KxhDacKcW59s2
         w+/YFwsArK+HG8rjZZj7EmzzA5v09GXGrdnBISMMG5SC7vvmrPoo/Fja4YDjKN/9b7qL
         21Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852333; x=1753457133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9ZjlAULE2F6JwrtpvzjiapTBh1bKC7bsQfwLuPPxcE=;
        b=nB772IqepHOfV1f2tyrIh94NMxxIKV1J7zU+XfhQEDfBscG7jWSZPz1plCog9oT4p1
         RHkL5O+z7KDfGcoZsk5NgWaKCPtzAItK+ra4RG1ywbgCSFZ9uihgN8EtruMvCc9xl5hi
         BBqrU9wUJ02LxAJ2EsAz2qG/IrvEcVGxcld1A9r3lf2u+xy4FhvMd6CLeuOwIoRYXS9t
         ZAQS51EQN7tKsnXyOJ65RWhApWWj/sJ9dYeKTc2fHxLN5uU8wDMTu+JGwQE/YQPXdwZR
         dy9aEP5EQ2lV9BBt2tpRChUirDorRGudkI5uUH2/YuGY1dMLEscqDEtPvbBMiYD8fyLl
         wiKg==
X-Forwarded-Encrypted: i=1; AJvYcCWfWWKwwc+1Lxl3Ve5XzmRNoGhAZWiGoWKL7i7jJUBLc/L7uxCJNlwohSGyZCr5y86Lv8s3oawo5yV7O/vy@lists.linux.dev
X-Gm-Message-State: AOJu0YyZjJT5DOmm8eLVv8hR3iDyYfLq68uBdkp3ssTqFFcZ1Qa2B1gl
	M+4l6Q965YnIpWYNafY6RZSM18w7DhwLia5vSF/uqHEKyIv2hEKc0rMX
X-Gm-Gg: ASbGncvvRjfqFt7MR2KzeRQ+248gmkuIDQu0loXg3ZC1JIcnipwfpv0lU3x7ehvhUV0
	WKPpzdvGrfafCw4yGCrTCQOSdlPZEB1xfdRD1xO1mlsGF4UAxp9SPts6ZcbT86x8SheADdvwQnR
	I+I8kK9Md3/h3NlVRJAfgKAf7QnZzYzECeCH3GPJyb75XylNAoWZMWn/JynpnSO5SBk2o2KoPs4
	tSipcgd2IrGCO3uYtbAYe9xfyYTmbRfVbj79yc0Wgbzv5s1lJzmf0EbxxtMgCaQbypSX682zPg3
	+6vEU7fmbVZqan7F1u6K5evxxxD5fPJgfuO0L+cZHQMFfYFQZC3R6Q9BjmILfAJxuVZ3I+ETUX5
	0jXbXTJT5rUOjYDX2afnLTCNX+e3snWwUNKg=
X-Google-Smtp-Source: AGHT+IFzz7pc5wk5uj/Vf6ChAPu/I9C+4m2I7UOzrY/KOAIRiI890eR3XGmgZ+/8iVZZm+uqUyK+nA==
X-Received: by 2002:adf:b650:0:b0:3b6:136d:55de with SMTP id ffacd0b85a97d-3b6136d55efmr5039614f8f.7.1752852332639;
        Fri, 18 Jul 2025 08:25:32 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:32 -0700 (PDT)
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
Subject: [PATCH v7 09/24] dt-bindings: media: i2c: max96712: add support for I2C ATR
Date: Fri, 18 Jul 2025 18:24:45 +0300
Message-ID: <20250718152500.2656391-10-demonsingur@gmail.com>
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
index f712d7cfc35f5..758c0223977d4 100644
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
2.50.1

