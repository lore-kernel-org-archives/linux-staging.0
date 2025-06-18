Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433722E4241
	for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 09:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240798; cv=none; b=bLym2+lXUidShXNGZ/KJlEDwbfa2eE5xLR04LvTN8WdyQnGAmti/utlm5BxgRLlYzZwmC0RZqWZ3Eoa6st8mhmhjcyHl/qOq43hfEHI59FCCgtVWwyitU9+27/rFvDhVMm322QCZT8NzuYpjwRZMwK3EFUywN+F7/hGUR28x+cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240798; c=relaxed/simple;
	bh=MCCDYaMRSRzuUF/JiK7cCNzXrPYMiVFmkitL5HL3KHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O5mIWJkV/vJOomh3U5Dhgj118OJ6LixqsVZaTwH317y1XxriqnzvaHYXwSQFWa/lxK7X4Y1FfGE8lrk0W+/ZP4psural+WbYzgjJ1lKZhbEvyOyXoLQ9Q3gL0gMaOhUinWJzBQYo5b91dVdTE+88hcI7O3CMdbBB8ZmepiJ10FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CO0XToDZ; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CO0XToDZ"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso11907474a12.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 02:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240794; x=1750845594; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itFlw7+tci92O6oUfcwXgDzQx9INhcSomr2YEtEf878=;
        b=CO0XToDZqUIeBPxO9WaWziXQiKDqCEKJWWcUBE7KgE7uXpvaqMAIrW20/DPqgo/w34
         Q+QzFR6pmM8RJ5ADugHVYkezOgzon1ljev0QDsO0ZM4FAdq5zD7bbqlsDs0wlL/a4Lww
         71pvJOmfLDvbPpmVamJJlkeWjlubCkFPLDkiiSbJAJsq/kfEBEcgIEdIyoJD0936GoGq
         GGJwhQyyV4mXR0tdZiXtkWnyOytk4/PW9fPY8Uo/uiO1CI12B4JTcJcAu6jFypFRge9/
         M3hfkR4KyAIj5/bHdlQpmCLo3bwCnDUyhclvhAiNGg7Df/7ktH7fSqLgq7mLZRcAMEWw
         zvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240794; x=1750845594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itFlw7+tci92O6oUfcwXgDzQx9INhcSomr2YEtEf878=;
        b=bE4mWmFi/MELIEw8MeFfVmfzidJEAful80QYEY7mtTvDPzaCKam8NZClSW2+Z5Qsx4
         MQlOJzi6SMEAHHJRjByFxli/VTJAt8bm/26dlvqUQWVy+hbKxxzLPTVWLm+d/NRmcHOL
         VhFF6O/5O69790wTz0bAFv1aQo1B3N4cC95DXjorZTsWkYbahIXANB6CxyMMDojQv2tE
         ze9zinFsk8C33P/ijY6Cs3Qflx0Bkw+T4G+6Vf3UfKGfyFaQy7njcZbonp1QMNLwvH5w
         5Ue2kMDdqPIWF/P2bh6eCd3Xde7z6ELIq2j0ZOKTnSKViPRmJOAShTQ9IPe/gTq6u6F3
         0wIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1UzvjKR5QwOFjLQebdbs94RynTgW1sGhILRbdYEBr4lhbEEV5i2oJJhRSXyrTNMje2FpTKAODwJWWnP8p@lists.linux.dev
X-Gm-Message-State: AOJu0YzleopuVxiGCMNNVjhByt/qyfegErkT4CNhTljsd75Gni1ORdWu
	jfalEaW9iiU2rMOtRM3cZ3IG0UfgWIonnUjskNA5RYEilRtPGrrg+sJm
X-Gm-Gg: ASbGncuccATpTIpTzBF33NNGF+tEChdR4gk8T3Ok5AyOw7dNslSRcIZIVw8o2baKwIg
	p52STdSufurFJIjKjaXtgVxPmBtJFYVXsIJfInzsPRNGV1xUikJTfhK+IJS7LJOsr592zZmwaX+
	9zSpWGzP4eMEAduKuIOGDRu3ko6DVkVhJck2CJM3HWJFyRbn2rQObXmfpRcgLffD7M0VkjlGzrE
	XM/RMlaftkeHyidT2/uqrZKqXEVh2SbyRNmDdEIKvM0gkcLTlVEJ59UHMJHdMmR8LSRYYDfxvmQ
	vrCaOPj/pnGAMBYqZP6xBF6IIVMKr3IGCiFgvCgboyn/TLCjrE4MrEBVZ1XPtC+vLKtmb4hQReY
	=
X-Google-Smtp-Source: AGHT+IEFnbvlNZXyuvcjcNw1++Gud2xgl1uGQdOQTbPsbxAJ/p6XvDu5B4UiVxhUC+sB3Owvy/D4Pg==
X-Received: by 2002:a17:907:9809:b0:ad8:96d2:f3a with SMTP id a640c23a62f3a-adfad365ca2mr1391292366b.8.1750240794043;
        Wed, 18 Jun 2025 02:59:54 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:53 -0700 (PDT)
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
Subject: [PATCH v4 14/19] dt-bindings: media: i2c: add MAX9296A, MAX96716A, MAX96792A
Date: Wed, 18 Jun 2025 12:58:50 +0300
Message-ID: <20250618095858.2145209-15-demonsingur@gmail.com>
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
index 000000000000..c0a8916353f6
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
index 423ef18ca693..5c8fc3374179 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14764,6 +14764,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.yaml
 F:	drivers/iio/proximity/mb1232.c
 
+MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
+
 MAXIM MAX11205 DRIVER
 M:	Ramona Bolboaca <ramona.bolboaca@analog.com>
 L:	linux-iio@vger.kernel.org
-- 
2.49.0

