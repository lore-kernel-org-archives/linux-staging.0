Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0FB3FC5
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 05:00:40 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id g16so3047685wrb.3
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 22:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IqrGXKng08jm9js9qyDgkH26zCZ0BEWYuMRxSYoOlzE=;
        b=onLzIPf0IVX+pmKzX0CqwAindzEC0qnnpq5SSZ81pM2k8mOSCNdu0+grM5vfsTejcQ
         9RIlpQyb4Xclf6dPnhujICpBhwCJEr431wS2jIncQz4SfYWjYJm/wQWegoMipQanQKk0
         xZIIsStUrXLyKEJLqMGSApwyOaKceI92ANXppIG+RvhRB7H4Yd3c1CK3e9twqLzjyMlD
         igz4nIo9RyGUhL9N2c0eUvgytTVmt/j2yEUOA0jn+5OqJx4Nzsg1oBN/UeCdhsrKn3Et
         lOZkXLtqAbP2n8gM4zQ5zY7mAEe6u3n+jEdYZrw3heB7xYSMmv/rAlnJz0L5ewYbpeVz
         cjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IqrGXKng08jm9js9qyDgkH26zCZ0BEWYuMRxSYoOlzE=;
        b=maPxqO6W1zI/YtX4Ib9AS7N9+airpDtRxujHl07kxxd6uADIKcM9G/UxSLmsm8jePc
         niK6XzTTtAAr0CZQcDfxgw4QKqt1Kj0l6WY6B9LfmDOm8wpxUCEaBKnoS67jL6hJMcmG
         U8MxHhBAifVY8EuPlihTvKtIZj5KuOQ/WnJvf31gJZPqFt0ro/grSsBvhhS+pIe1MtG0
         6Z2LQK6KV1W7rLnAJwEDjlBM/db1/TDS3nwRXI0u+iR8DxYgVZuqEmu/rNwqCl1+4bmt
         tow7pW+23neg3hong6LryTvtYNT3zatFL7dEBOJaGZ/FNj3lnG/zJKjUejOfZuB4WR8m
         Dnwg==
X-Gm-Message-State: AOAM533gPJX1wPaz/6ZmjHTHakkIbQw+6c2QuVuFSlr12qsyAQhKVkL7
	kPmu6o2EdqxQYXnEOuHiugs=
X-Google-Smtp-Source: ABdhPJzYmxatjY5+DLW1KGP7H6s3SxDTiZNmYPHuVOlEEOxrankyRSCwPehsaPkeSYxDhQ79Oug4fQ==
X-Received: by 2002:a05:600c:4f54:: with SMTP id m20mr8529791wmq.96.1632286839037;
        Tue, 21 Sep 2021 22:00:39 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id b187sm4811625wmd.33.2021.09.21.22.00.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Sep 2021 22:00:38 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-pci@vger.kernel.org
Cc: lorenzo.pieralisi@arm.com,
	john@phrozen.org,
	devicetree@vger.kernel.org,
	tsbogend@alpha.franken.de,
	bhelgaas@google.com,
	matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org,
	linux-mips@vger.kernel.org,
	linux-staging@lists.linux.dev,
	neil@brown.name,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/3] dt-bindings: mt7621-pci: PCIe binding documentation for MT7621 SoCs
Date: Wed, 22 Sep 2021 07:00:33 +0200
Message-Id: <20210922050035.18162-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922050035.18162-1-sergio.paracuellos@gmail.com>
References: <20210922050035.18162-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding documentation for PCIe in MT7621 SoCs.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../bindings/pci/mediatek,mt7621-pci.yaml     | 142 ++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek,mt7621-pci.yaml

diff --git a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pci.yaml b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pci.yaml
new file mode 100644
index 000000000000..d7359d0ee935
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pci.yaml
@@ -0,0 +1,142 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/mediatek,mt7621-pci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT7621 PCIe controller
+
+maintainers:
+  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
+
+description: |+
+  MediaTek MT7621 PCIe subsys supports single Root complex (RC)
+  with 3 Root Ports. Each Root Ports supports a Gen1 1-lane Link
+
+allOf:
+  - $ref: /schemas/pci/pci-bus.yaml#
+
+properties:
+  compatible:
+    const: mediatek,mt7621-pci
+
+  reg:
+    items:
+      - description: host-pci bridge registers
+      - description: pcie port 0 RC control registers
+      - description: pcie port 1 RC control registers
+      - description: pcie port 2 RC control registers
+
+  ranges:
+    maxItems: 2
+
+patternProperties:
+  'pcie@[0-2],0':
+    type: object
+    $ref: /schemas/pci/pci-bus.yaml#
+
+    properties:
+      resets:
+        maxItems: 1
+
+      clocks:
+        maxItems: 1
+
+      phys:
+        maxItems: 1
+
+    required:
+      - "#interrupt-cells"
+      - interrupt-map-mask
+      - interrupt-map
+      - resets
+      - clocks
+      - phys
+      - phy-names
+      - ranges
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - ranges
+  - "#interrupt-cells"
+  - interrupt-map-mask
+  - interrupt-map
+  - reset-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+
+    pcie: pcie@1e140000 {
+        compatible = "mediatek,mt7621-pci";
+        reg = <0x1e140000 0x100>,
+              <0x1e142000 0x100>,
+              <0x1e143000 0x100>,
+              <0x1e144000 0x100>;
+
+        #address-cells = <3>;
+        #size-cells = <2>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pcie_pins>;
+        device_type = "pci";
+        ranges = <0x02000000 0 0x60000000 0x60000000 0 0x10000000>,  /* pci memory */
+                 <0x01000000 0 0x1e160000 0x1e160000 0 0x00010000>;  /* io space */
+        #interrupt-cells = <1>;
+        interrupt-map-mask = <0xF800 0 0 0>;
+        interrupt-map = <0x0000 0 0 0 &gic GIC_SHARED 4 IRQ_TYPE_LEVEL_HIGH>,
+                        <0x0800 0 0 0 &gic GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>,
+                        <0x1000 0 0 0 &gic GIC_SHARED 25 IRQ_TYPE_LEVEL_HIGH>;
+        reset-gpios = <&gpio 19 GPIO_ACTIVE_LOW>;
+
+        pcie@0,0 {
+            reg = <0x0000 0 0 0 0>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            device_type = "pci";
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 0>;
+            interrupt-map = <0 0 0 0 &gic GIC_SHARED 4 IRQ_TYPE_LEVEL_HIGH>;
+            resets = <&rstctrl 24>;
+            clocks = <&clkctrl 24>;
+            phys = <&pcie0_phy 1>;
+            phy-names = "pcie-phy0";
+            ranges;
+        };
+
+        pcie@1,0 {
+            reg = <0x0800 0 0 0 0>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            device_type = "pci";
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 0>;
+            interrupt-map = <0 0 0 0 &gic GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>;
+            resets = <&rstctrl 25>;
+            clocks = <&clkctrl 25>;
+            phys = <&pcie0_phy 1>;
+            phy-names = "pcie-phy1";
+            ranges;
+        };
+
+        pcie@2,0 {
+            reg = <0x1000 0 0 0 0>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            device_type = "pci";
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 0>;
+            interrupt-map = <0 0 0 0 &gic GIC_SHARED 25 IRQ_TYPE_LEVEL_HIGH>;
+            resets = <&rstctrl 26>;
+            clocks = <&clkctrl 26>;
+            phys = <&pcie2_phy 0>;
+            phy-names = "pcie-phy2";
+            ranges;
+        };
+    };
+...
-- 
2.25.1

