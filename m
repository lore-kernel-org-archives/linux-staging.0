Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0B86D0E
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 18:50:15 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id v70so6838474qkb.8
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 11:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TxCHjocfvolgLMKcJMUAXR2MQWXiJcrJ6XGdnV3UFSQ=;
        b=ojboIib+LAJLAK2R8WPLMMcSqk+duxlFCwkfYsg9J1bKE8gUkzMQqCqRLq0H6K+yl3
         pbhzBrbhRrg6OuSvzamOvj6kwcyqFhGPnfTfXTZOQ8/PpbL/S1gukY53VzZZUY+U0Md3
         XB2U82/29krHpOWRH35hesUBKWShbwez+UJeH72RQq8HdVJHcFcP9+HJlIJpHON3K/Qw
         iGyLrK9p9Wk9re3dsgV3XuZPokr00Ip5i9zdmB/vnZ79OitE6rM1fS84og6tFNKwGYPl
         J2RF1mzWKZ3GKtfSMcQIUulzby/dxVaiYssy+l0C7k1BvA/YDXW42KV9VW4lD0v2N/Ih
         E1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TxCHjocfvolgLMKcJMUAXR2MQWXiJcrJ6XGdnV3UFSQ=;
        b=of3Izv4cnn2otkyNyzfyCq986CfQuIr0UfRAYIeKqluYSfxx+7ztUSNytNDcW4tTTu
         60butLzW12euznAbdEe5chTbPDqc+/YIkhTHq5L2SZ0HW+NZ1cQQxwnIpd/rdsSI/egC
         LSJG5hGBVmwabP1owB2eLYijFUl0VXQiLlCKGWycgT68OBj48yopBmBQ1iRL/9y7Sgzj
         nyh4B8eejDT+Nw/NZr7slA/I436ZKhNeSE1o/R+deJTnJR7PivuKBvJsjVR6TKxqAIal
         cbpQMdes+SBeeRJ0y/sRtLJVQHdIOCst7T2M1DpuEqZ0xLJREVcrTquzif4Ji+PdVqO4
         SmWg==
X-Gm-Message-State: AOAM530aOAOdiQQy1c0JmMNvq9JNgJLYgmJRmprktFQu1LZNVD0q9o2/
	RSeBh6vSZCppuwnptxkou+Q=
X-Google-Smtp-Source: ABdhPJwplwfUkzNEF2GL+6/qzxFO2fQsmh1/BJO08c880AYwwprUUfBzaG8l2b2S9+xiMJaqpqpNyQ==
X-Received: by 2002:a37:7147:: with SMTP id m68mr14899919qkc.286.1617994214783;
        Fri, 09 Apr 2021 11:50:14 -0700 (PDT)
Received: from smtp.gmail.com ([2804:14c:73:9a01:86f3:17eb:e23c:86fd])
        by smtp.gmail.com with ESMTPSA id h62sm2347198qkf.116.2021.04.09.11.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 11:50:14 -0700 (PDT)
Date: Fri, 9 Apr 2021 15:50:10 -0300
From: Lucas Stankus <lucas.p.stankus@gmail.com>
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: staging: iio: cdc: ad7746: add binding
 documentation for AD7746
Message-ID: <4be8e3e40794474d8622192c6a5ea0fb4af527e1.1617993776.git.lucas.p.stankus@gmail.com>
References: <cover.1617993776.git.lucas.p.stankus@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617993776.git.lucas.p.stankus@gmail.com>

Add device tree binding documentation for AD7746 cdc in YAML format.

Signed-off-by: Lucas Stankus <lucas.p.stankus@gmail.com>
---
 .../bindings/iio/cdc/adi,ad7746.yaml          | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/cdc/adi,ad7746.yaml

diff --git a/Documentation/devicetree/bindings/iio/cdc/adi,ad7746.yaml b/Documentation/devicetree/bindings/iio/cdc/adi,ad7746.yaml
new file mode 100644
index 000000000000..5de86f4374e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/cdc/adi,ad7746.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/cdc/adi,ad7746.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AD7746 24-Bit Capacitance-to-Digital Converter with Temperature Sensor
+
+maintainers:
+  - Michael Hennerich <michael.hennerich@analog.com>
+
+description: |
+  AD7746 24-Bit Capacitance-to-Digital Converter with Temperature Sensor
+
+  Specifications about the part can be found at:
+  https://www.analog.com/media/en/technical-documentation/data-sheets/ad7291.pdf
+
+properties:
+  compatible:
+    enum:
+      - adi,ad7745
+      - adi,ad7746
+      - adi,ad7747
+
+  reg:
+    description: |
+      Physiscal address of the EXC set-up register.
+    maxItems: 1
+
+  adi,excitation-voltage-level:
+    description: |
+      Select the reference excitation voltage level used by the device.
+      With VDD being the power supply voltage, valid values are:
+      0: +-VDD / 8
+      1: +-VDD / 4
+      2: +-VDD * 3 / 8
+      3: +-VDD / 2
+      If left empty option 3 is selected.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+
+  adi,exca-output:
+    description: |
+      Sets the excitation output in the exca pin.
+      Valid values are:
+      0: Disables output in the EXCA pin.
+      1: Enables EXCA pin as the excitation output.
+      2: Enables EXCA pin as the inverted excitation output.
+      If left empty the output is disabled.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2]
+
+  adi,excb-output:
+    description: |
+      Analoguos to the adi,exca-output for the EXCB pin.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2]
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      ad7746: cdc@0 {
+        compatible = "adi,ad7746";
+        reg = <0>;
+        adi,excitation-voltage-level = <3>;
+        adi,exca-output = <0>;
+        adi,excb-output = <0>;
+      };
+    };
+...
-- 
2.31.1

