Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25F52E090E
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 19:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694317; cv=none; b=bUcDuIGQZ115duk6MiWpVgtNbbxs7qJ/a5yRxGqG8lvFtGA5pqSWjCvZOOFh+jqexGYx45+OHNLmUoE9eNPE8QLKRbSADRnvVPuilEUj6R5JJ9LXIwoVGWXFOZDAlG/8RrA3CRmZI+sDRFy12BasB2GMc8CfSDTfi8Bw2sk5AYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694317; c=relaxed/simple;
	bh=PYdrzdyyoX+qFtzk00HDX2VIPKqewRQ8tiJnoeGslNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tJKPE0oyUnUtvPjAta9nz63823XxwsJbyHaBYdV2ElrEMoISUEBPDcvECetVxRgVzkgyTCVwdxKV9jWNVPdso9/EMEbvFpgD+iR1YE5z0JIKj+MOBAb5LGzQ5g11Qb9UndsrxDvpcvinE4HuZTPb0eBh/f6+pAkU7QGuC1Xip44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZzOGRmP4; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZzOGRmP4"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae0b2ead33cso46269366b.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 12:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694314; x=1753299114; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wzny4taQLj1D3V6dnzLdhCUE6QI8w+14ASroQ3LbmuQ=;
        b=ZzOGRmP4DJ9mklRrbS0bCPrK5P/V/8tsJoTbshwmo+rE51GXbbP/7QA24FTtMyAQC+
         CMBGCd/Re7u1dDKCVcBZM0vNxCZFscScsZg6S8xn13XwJZohyGDvnai/EG+gjfVV60Cr
         qVNvWs7TfElq5QkrOSTtYL3T83EeloM+cnoYDfKwKXq9MvlejpGe7OclX5M0NgQ9WLL+
         eoELNL+LGnu07W/8el4kKUY1XT0aG7wuTdopkd0lfQVcMhZLvL0zrk2bgEbOlu4HX2Ek
         5X0jQZtGo5vnz8mKpfhg/35AvsgMauFUnOPvll+d9npw+gyIDlR5N0ItJqdHnn+ZwNBF
         OqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694314; x=1753299114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wzny4taQLj1D3V6dnzLdhCUE6QI8w+14ASroQ3LbmuQ=;
        b=MZfwWiJSCiNn63o0R1+KBSFBeswQvSoJPDQwZueIZiejYYM6PrDIOkfwu9CIar7U+0
         nESqywULpi4e8fURXaimkRpTpmHxXizJIwEK37o+JUhQ5pUZ9m7UM6yqLJg26KZb3SOU
         8sBWQSsPWPRmJPRt+4SWeE8DvOSXD5HvWjV+0Kr4bZvd88NSiPUQKIttIg36QztQTrB3
         YEbGDgAr1GfIbG7bN55CQQyFgXPEVW9JntMPGOPAYrZXzLWsk2F9sRZzh6HH5bX+gbmm
         9Qcb+N+Wt8+Z8Z7KapkHpnY6m2Jk3wGv4Pz4mB0ZxZdnnqQic0OJlQO09J875XmLGDd6
         GFLw==
X-Forwarded-Encrypted: i=1; AJvYcCUx5sQL13E0DQ3rVIhA1tvLgpwOzFbs/BuhIuaVUABRJoq8lhuvWxFynYVEP8cmp77Phnpqme37dNQJmX0d@lists.linux.dev
X-Gm-Message-State: AOJu0YydHxx04xBCBg2//555gY5Fsvba4OU7kK3W1O9/7VFmW/CL8Xb8
	9tgKmdCrHUSTYUjyEXfjxm218d3WfjM3mF6+ykrrPSkwLJYtrDfUBDy4
X-Gm-Gg: ASbGnctvogZEHLHf0h9lx4uoigqeq/QAmVflU6FoIg2r0eUHtzgCNJb9+0xNXniJoyj
	XlKt0MmEw0RjWPRZ0cllIWf60pQmzaClFzZ97f9EoHfxEsHoMnZ/82doRF2dlNmyUIG3k7h8wL0
	9LYebh4UzuM/YZXMxl9imWQ4UZvUPWM86vTBkzKff+75qSiT/lz0FtaJQ98oS2yAROkM4mppoJW
	3xQurzYsSxPkh5bOLF2BEm4qwpM0/ePErA5KO0fiTMhrdlAOxGhz6xG16oKeU8Yufvwz0j7BGwP
	w2GGt9aOUXiC/ruaWurqsZkEdJHZoqC+OBdtdih6XjCpldHojaYp6ZSx2S4sfev1dp4GEK5F+3b
	A1OkhviZvzZIH/MmnTSlcZr5A+cdgtBVbIHOvzpZDgWqsKg==
X-Google-Smtp-Source: AGHT+IH59Jx/aoQ0zsOYKfIm8cr4n+ymlaW8F/b0YB09smct8JEhsygHq1XYVtPngtMYuVhz/99i7Q==
X-Received: by 2002:a17:907:b816:b0:ad8:e448:6c64 with SMTP id a640c23a62f3a-aec4d7ec638mr49736766b.24.1752694313829;
        Wed, 16 Jul 2025 12:31:53 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:53 -0700 (PDT)
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
Subject: [PATCH v6 14/24] dt-bindings: media: i2c: add MAX9296A, MAX96716A, MAX96792A
Date: Wed, 16 Jul 2025 22:30:59 +0300
Message-ID: <20250716193111.942217-15-demonsingur@gmail.com>
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

The MAX9296A deserializer converts single or dual serial inputs to MIPI
CSI-2 outputs. The GMSL2 links operate at a fixed rate of 3Gbps or 6Gbps
in the forward direction and 187.5Mbps in the reverse direction.
In GMSL1 mode, each serial link can be paired with 3.12Gbps or 1.5Gbps
GMSL1 serializers or operate up to 4.5Gbps with GMSL2 serializers with
GMSL1 backward compatibility. The MAX9296A supports mixed GMSL2 and
GMSL1 links. The serial inputs operate independently, allowing videos
with different timings and resolutions to be received on each input.

MAX96716A supports both tunnel and pixel mode.
MAX96792A supports both tunnel and pixel mode, and has two GMSL3 links.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/media/i2c/maxim,max9296a.yaml    | 242 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 248 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
new file mode 100644
index 0000000000000..c0a8916353f6a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
@@ -0,0 +1,242 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024 Collabora Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/maxim,max9296a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX9296A GMSL2 to CSI-2 Deserializer
+
+maintainers:
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
+
+description: >
+  The MAX9296A deserializer converts single or dual serial inputs to
+  MIPI CSI-2 outputs. The GMSL2 links operate at a fixed rate of 3Gbps
+  or 6Gbps in the forward direction and 187.5Mbps in the reverse
+  direction. In GMSL1 mode, each serial link can be paired with 3.12Gbps
+  or 1.5Gbps GMSL1 serializers or operate up to 4.5Gbps with GMSL2
+  serializers with GMSL1 backward compatibility. The MAX9296A supports
+  mixed GMSL2 and GMSL1 links. The serial inputs operate independently,
+  allowing videos with different timings and resolutions to be received
+  on each input.
+
+  MAX96716A supports both tunnel and pixel mode.
+
+  MAX96792A supports both tunnel and pixel mode, and has two GMSL3 links.
+
+properties:
+  compatible:
+    enum:
+      - maxim,max9296a
+      - maxim,max96716a
+      - maxim,max96792a
+
+  reg:
+    maxItems: 1
+
+  powerdown-gpios:
+    maxItems: 1
+    description: Specifier for the GPIO connected to the PWDNB pin.
+
+  port0-poc-supply:
+    description: Regulator providing Power over Coax for GMSL port 0
+
+  port1-poc-supply:
+    description: Regulator providing Power over Coax for GMSL port 1
+
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
+      '^i2c@[0-1]$':
+        $ref: /schemas/i2c/i2c-controller.yaml#
+        unevaluatedProperties: false
+        properties:
+          reg:
+            items:
+              minimum: 0
+              maximum: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    patternProperties:
+      '^port@[0-1]$':
+        $ref: /schemas/graph.yaml#/properties/port
+        description: GMSL Input ports 0-1
+
+      '^port@[2-3]$':
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: CSI-2 Output ports 0-1
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              lane-polarities:
+                minItems: 1
+                maxItems: 5
+
+              link-frequencies:
+                maxItems: 1
+
+            required:
+              - data-lanes
+
+    anyOf:
+      - required:
+          - port@2
+      - required:
+          - port@3
+
+required:
+  - compatible
+  - reg
+  - ports
+
+additionalProperties: false
+
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
+dependentRequired:
+  i2c-atr: [i2c-alias-pool]
+  i2c-alias-pool: [i2c-atr]
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interfaces.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        deserializer@28 {
+            compatible = "maxim,max9296a";
+            reg = <0x28>;
+            powerdown-gpios = <&main_gpio0 37 GPIO_ACTIVE_LOW>;
+
+            i2c-alias-pool = <0x40 0x41>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    des_gmsl_in_0: endpoint {
+                        remote-endpoint = <&ser_0_gmsl_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    des_gmsl_in_1: endpoint {
+                        remote-endpoint = <&ser_1_gmsl_out>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+                    des_csi_out: endpoint {
+                        data-lanes = <1 2 3 4>;
+                        link-frequencies = /bits/ 64 <400000000>;
+                        remote-endpoint = <&csi_in>;
+                    };
+                };
+            };
+
+            i2c-atr {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                i2c@0 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    reg = <0>;
+
+                    serializer@40 {
+                        compatible = "maxim,max96717";
+                        reg = <0x40>;
+                        gpio-controller;
+                        #gpio-cells = <2>;
+                        #clock-cells = <0>;
+
+                        ports {
+                            #address-cells = <1>;
+                            #size-cells = <0>;
+
+                            port@0 {
+                                reg = <0>;
+                                ser_0_csi_in: endpoint {
+                                    data-lanes = <1 2>;
+                                    remote-endpoint = <&sensor_0_out>;
+                                };
+                            };
+
+                            port@1 {
+                                reg = <1>;
+                                ser_0_gmsl_out: endpoint {
+                                    remote-endpoint = <&des_gmsl_in_0>;
+                                };
+                            };
+                        };
+                    };
+                };
+
+                i2c@1 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    reg = <1>;
+
+                    serializer@40 {
+                        compatible = "maxim,max96717";
+                        reg = <0x40>;
+                        gpio-controller;
+                        #gpio-cells = <2>;
+                        #clock-cells = <0>;
+
+                        ports {
+                            #address-cells = <1>;
+                            #size-cells = <0>;
+
+                            port@0 {
+                                reg = <0>;
+                                ser_1_csi_in: endpoint {
+                                    data-lanes = <1 2>;
+                                    remote-endpoint = <&sensor_1_out>;
+                                };
+                            };
+
+                            port@1 {
+                                reg = <1>;
+                                ser_1_gmsl_out: endpoint {
+                                    remote-endpoint = <&des_gmsl_in_1>;
+                                };
+                            };
+                        };
+                    };
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 93e22dfd61c17..0eb1729ae1647 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14783,6 +14783,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.yaml
 F:	drivers/iio/proximity/mb1232.c
 
+MAXIM GMSL2/3 SERIALIZERS AND DESERIALIZERS
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
+
 MAXIM MAX11205 DRIVER
 M:	Ramona Bolboaca <ramona.bolboaca@analog.com>
 L:	linux-iio@vger.kernel.org
-- 
2.50.1

