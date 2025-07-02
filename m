Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADAA28DF04
	for <linux-staging@lists.linux.dev>; Wed,  2 Jul 2025 13:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462505; cv=none; b=iEvr9S6bpP6dPlTFq3z2HHcWyOA2fD3waheP/MILsmhrI84wcBnwFT1xzgG979QPFmWjkn4lhgPXwXa/QiP9s1FcTi06tYVnLT2Iaqal3yCLR1tT7puvnkHzzH8oLTrBVwnrMpljXCBoHdUMq4U6SPj7vmdUdcYFk9GkaUtYULU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462505; c=relaxed/simple;
	bh=Mh8LKlWFv2aIRaZJ0PIrPQ8QGfIFlvbi3X0tie7EnzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=igcPLdn+IYK9wZzv5InQhfc/p+7BfpeNgcTCCUSJFylr9PBlmnLfxUC3h23cKh2uPZRMNpttZAGQhZGAzsu47KWt+FuiTmCN2ById2u3QPTgoqoqi3d2cl7UJO1v/Iolm/1Rv5RFDx90JnBrE16IgFK6yri1vxWU3Ygj/L6V9kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8muUZ9f; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8muUZ9f"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae360b6249fso891280866b.1
        for <linux-staging@lists.linux.dev>; Wed, 02 Jul 2025 06:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462502; x=1752067302; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQsDsouXGnTEHD/Y5a06yBAM+3Z7GZ4pZgoIjiS96B0=;
        b=K8muUZ9faG0Q4IN0OJk3Qf0QlGpG6jWqvknvgWRiXornQV48rWdUHz9VYAnweTi9Kx
         UBiph8ogUPUCO3/FanDkaMtv+vBjNIvfHoOzH2eCRnnhl3otPnNo5wiAHLlF67n/q00I
         oxuzPsvx5//NYrlkCowsMcUYrAOXOmeXljBTFg//CIJGEMcsq3v4QXEI/hhTCACtsB+9
         Wg8jV7fqmTNMJEvyiF5J7j4hasiMAY5Kk5Ru87C1V6jAPVAcDHbPHPGQz6avQbC/5DyA
         N2DJqAVuJImhvCXCZLOabcGZ1AawpJUahP5PPmbwkmmaxgOTBPt+DXDDMImTonKMq91Z
         YKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462502; x=1752067302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQsDsouXGnTEHD/Y5a06yBAM+3Z7GZ4pZgoIjiS96B0=;
        b=YN6PuiJ3CXs4WsRqk4mMoqCtGiTfnf0NizeRmxHJ19mHWDtzg3N1RAh5wtA3+JXVEE
         uG5j/AarkSEYE9tVUkjL3ONNrIo+iXQz1jIniZ10RsHxV+FxN51v6uCdUskYB1x1kJJX
         TRaVMX83Qir7yZdrVaWQ+IIT7pTUxgZH+ekc6PqpgeyHqpsZUCI/uZ2e3Zdl0RXNaowb
         nKxdiHX3jaesK7bRjJaPzLnkdA6bnGUXNOMh9klYK7hNJRqLXmMTfdgLSjnuGz4O94Oq
         xs3cucvhC7Ra/BSKzzlkL79pJryyeDhhVTgotitTXIwGGUfyvxS4+nKACegfFVvamXrv
         zVRw==
X-Forwarded-Encrypted: i=1; AJvYcCWODTUKMJHiQQZvRt54HQCkF9MxYXRl//hLFAdFwK/5Ax9xBiYZyzEmpCFPU18RwrPoMyrRVRvVTxS9orHJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzOtNyghIpywecWqhvryMRCU5BZqOscXyfLlUB77J9f5KzYhWFl
	/iO7FksYiT37s4fA23vBl7aj/CApdwZmT8Ymgw58JT+Ym3GzuPKe9Oeq
X-Gm-Gg: ASbGncs225ZfuegsiuceP/WRzvDiJk0ZbznLeGgogmb5x1VVvHA8BYGTDpUTLMDaQjk
	RyquJukd6HTa1BwCpeoyNqk4JkV60NHi+p+KLWt/JKGYp6mgtaZ+5nkeYTlqxfm3rc9yYp19LUa
	n3CvMOBBKfqbOzL8X19ktWSNfT+Qkiye6BkrvOmUi7cotI2M6+NT7GSBfVDWxqeejx4na88L/xM
	3FEzavaFKAEjS5TqYfAsB318jLeRhDyWvYhVc43dRZ1YYP6DD8wY6q/PIeOZ3TgbiYRTsw1UxkY
	bdAqf0artVrJayP8U7QHSWn7UeO7XgWGcI4JSjy1jKtI3mJ9ciN+HA/W59efxkqZ/3e86/F8+I0
	cAaaffRJzwQ==
X-Google-Smtp-Source: AGHT+IGQo1X2tG/+haFZYHCJIgDFrHhpayF4pnl9EavUV/pXr+ODu0WNrPTbhTs53mc+YL9D5CTAcQ==
X-Received: by 2002:a17:907:7ba3:b0:add:f62e:a300 with SMTP id a640c23a62f3a-ae3c2b12d95mr277375566b.2.1751462501873;
        Wed, 02 Jul 2025 06:21:41 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:41 -0700 (PDT)
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
Subject: [PATCH v5 14/24] dt-bindings: media: i2c: add MAX9296A, MAX96716A, MAX96792A
Date: Wed,  2 Jul 2025 16:20:40 +0300
Message-ID: <20250702132104.1537926-15-demonsingur@gmail.com>
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
index 2fd3edef879f..334195989c00 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14764,6 +14764,12 @@ S:	Maintained
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
2.50.0

