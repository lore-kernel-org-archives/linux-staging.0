Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733BA71
	for <linux-staging@lists.linux.dev>; Fri,  7 May 2021 05:35:05 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id m9so7837224wrx.3
        for <linux-staging@lists.linux.dev>; Thu, 06 May 2021 22:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jz/TlbprL0h8nikAm0l4AeI/5/NdOVeovwtsF+UVjsg=;
        b=R1VByBYby8ZhBt1AjzhA8YgIb4mM1bP0i/0qJy0c2GtwaYjYIRVAipP8fI+oM+WEff
         vvMXHeMlSzgTo8oXdWpwB2GkbEpa19goWoXEbxG4K+wspdQojIqzk3aYAiT5aiTCHxnB
         ZyZitlDtwu6GgPLjS+bURYjH/OhrJy+CVmqQHKPhjlqLNIXYt8X9LXZiJCyEDV/QZbPg
         csZrAxmI8MRpqDm9sNySUA6axwt+AU8N22/18x69VttKlHVbsnO7Ov8d860tH62awkez
         VqLb0Woaid3l4Irg2GmnrjS6ySF8W0bCFt0/1FAP7kbMtUMtGnmYblSXgGR+FHB7jiqU
         jxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jz/TlbprL0h8nikAm0l4AeI/5/NdOVeovwtsF+UVjsg=;
        b=mf+p/6/EYg4UZGZ/R1c70Zytcq3ejosc2Cn5MImgXdq5itWMevVijrKXc4jCYHYwCr
         4udSdKxH5mz/La+j1lLrfCvhFQUE0P2vnVdlpPwDcCdL3UoDYFHNhxSqsFNQMg18tnHu
         PsBBOSciZxpqCa3rL5yH7UW24V5bZ5tfmFidc0Uu3seyIaysyECzWXw6fYCCQzQJH50B
         ub11s9Q5DMW4BSr+0WBr1cPD+ifpfYrxsDxErnEfUjsQQJfvsMF2SB0bglnsGO1AZzs3
         sI7ezm0wDCaBV9bTl3vv6YusNkEMRUvwg5cwo/f6s8A+W7ogajRqLi4CBrcI/aXe2XZT
         MEeg==
X-Gm-Message-State: AOAM533pJC0fNkSvoJjaoLHxaT07LxrCkbucanXIxXOoIHDeh9F2oiWJ
	yUagESu/lK4Fr1mdp445JN4=
X-Google-Smtp-Source: ABdhPJxNxV1DHn3HIxZydfofC32SRqSmyJkrSc0/jdc/4t7zbT667zB+yR8qb8A+RnfZUwnxXopDjg==
X-Received: by 2002:a05:6000:18a:: with SMTP id p10mr9948479wrx.345.1620365703981;
        Thu, 06 May 2021 22:35:03 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id p5sm5807727wma.45.2021.05.06.22.35.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 May 2021 22:35:03 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: devicetree@vger.kernel.org
Cc: robh+dt@kernel.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] dt-bindings: staging: mt7621-pci: PCIe binding documentation for MT76721 SoCs
Date: Fri,  7 May 2021 07:35:01 +0200
Message-Id: <20210507053501.24180-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding documentation for PCIe in MT7621 SoCs.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---

Changes in v3:
    - Make use of 'interrupt-map' and 'interrupt-map-mask'
    - Remove bus-range from parent and child nodes

Changes in v2:
    - fix SoC name from subject line

 .../bindings/pci/mediatek,mt7621-pci.yaml     | 149 ++++++++++++++++++
 .../mt7621-pci/mediatek,mt7621-pci.txt        | 104 ------------
 2 files changed, 149 insertions(+), 104 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek,mt7621-pci.yaml
 delete mode 100644 drivers/staging/mt7621-pci/mediatek,mt7621-pci.txt

diff --git a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pci.yaml b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pci.yaml
new file mode 100644
index 000000000000..7f5f9d583032
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pci.yaml
@@ -0,0 +1,149 @@
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
+  resets:
+    items:
+      - description: pcie port 0 reset.
+      - description: pcie port 1 reset.
+      - description: pcie port 2 reset.
+
+  reset-names:
+    items:
+      - const: pcie0
+      - const: pcie1
+      - const: pcie2
+
+  clocks:
+    items:
+      - description: pcie port 0 clock.
+      - description: pcie port 1 clock.
+      - description: pcie port 2 clock.
+
+  clock-names:
+    items:
+      - const: pcie0
+      - const: pcie1
+      - const: pcie2
+
+  phys:
+    items:
+      - description: Dual-ported phy for pcie port 0 and 1.
+      - description: Phy for pcie port 2.
+
+  phy-names:
+    items:
+      - const: pcie-phy0
+      - const: pcie-phy2
+
+required:
+  - compatible
+  - reg
+  - ranges
+  - "#interrupt-cells"
+  - interrupt-map-mask
+  - interrupt-map
+  - resets
+  - reset-names
+  - clocks
+  - clock-names
+  - phys
+  - phy-names
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
+        ranges = <0x02000000 0 0x00000000 0x60000000 0 0x10000000>,  /* pci memory */
+                 <0x01000000 0 0x00000000 0x1e160000 0 0x00010000>;  /* io space */
+        #interrupt-cells = <1>;
+        interrupt-map-mask = <0xF800 0 0 0>;
+        interrupt-map = <0x0000 0 0 0 &gic GIC_SHARED 4 IRQ_TYPE_LEVEL_HIGH>,
+                        <0x0800 0 0 0 &gic GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>,
+                        <0x1000 0 0 0 &gic GIC_SHARED 25 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&rstctrl 24>, <&rstctrl 25>, <&rstctrl 26>;
+        reset-names = "pcie0", "pcie1", "pcie2";
+        clocks = <&clkctrl 24>, <&clkctrl 25>, <&clkctrl 26>;
+        clock-names = "pcie0", "pcie1", "pcie2";
+        phys = <&pcie0_phy 1>, <&pcie2_phy 0>;
+        phy-names = "pcie-phy0", "pcie-phy2";
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
+            ranges;
+        };
+    };
+...
diff --git a/drivers/staging/mt7621-pci/mediatek,mt7621-pci.txt b/drivers/staging/mt7621-pci/mediatek,mt7621-pci.txt
deleted file mode 100644
index 327a68267309..000000000000
--- a/drivers/staging/mt7621-pci/mediatek,mt7621-pci.txt
+++ /dev/null
@@ -1,104 +0,0 @@
-MediaTek MT7621 PCIe controller
-
-Required properties:
-- compatible: "mediatek,mt7621-pci"
-- device_type: Must be "pci"
-- reg: Base addresses and lengths of the PCIe subsys and root ports.
-- bus-range: Range of bus numbers associated with this controller.
-- #address-cells: Address representation for root ports (must be 3)
-- pinctrl-names : The pin control state names.
-- pinctrl-0: The "default" pinctrl state.
-- #size-cells: Size representation for root ports (must be 2)
-- ranges: Ranges for the PCI memory and I/O regions.
-- #interrupt-cells: Must be 1
-- interrupt-map-mask and interrupt-map: Standard PCI IRQ mapping properties.
-  Please refer to the standard PCI bus binding document for a more detailed
-  explanation.
-- status: either "disabled" or "okay".
-- resets: Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names: Must be "pcie0", "pcie1", "pcieN"... based on the number of
-  root ports.
-- clocks: Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names: Must be "pcie0", "pcie1", "pcieN"... based on the number of
-  root ports.
-- reset-gpios: GPIO specs for the reset pins.
-
-In addition, the device tree node must have sub-nodes describing each PCIe port
-interface, having the following mandatory properties:
-
-Required properties:
-- reg: Only the first four bytes are used to refer to the correct bus number
-      and device number.
-- #address-cells: Must be 3
-- #size-cells: Must be 2
-- ranges: Sub-ranges distributed from the PCIe controller node. An empty
-  property is sufficient.
-- bus-range: Range of bus numbers associated with this port.
-
-Example for MT7621:
-
-	pcie: pcie@1e140000 {
-		compatible = "mediatek,mt7621-pci";
-        reg = <0x1e140000 0x100    /* host-pci bridge registers */
-               0x1e142000 0x100    /* pcie port 0 RC control registers */
-               0x1e143000 0x100    /* pcie port 1 RC control registers */
-               0x1e144000 0x100>;  /* pcie port 2 RC control registers */
-
-		#address-cells = <3>;
-		#size-cells = <2>;
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&pcie_pins>;
-
-		device_type = "pci";
-
-		bus-range = <0 255>;
-		ranges = <
-			0x02000000 0 0x00000000 0x60000000 0 0x10000000 /* pci memory */
-			0x01000000 0 0x00000000 0x1e160000 0 0x00010000 /* io space */
-		>;
-
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0xF0000 0 0 1>;
-		interrupt-map = <0x10000 0 0 1 &gic GIC_SHARED 4 IRQ_TYPE_LEVEL_HIGH>,
-				<0x20000 0 0 1 &gic GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>,
-				<0x30000 0 0 1 &gic GIC_SHARED 25 IRQ_TYPE_LEVEL_HIGH>;
-
-		status = "disabled";
-
-		resets = <&rstctrl 24 &rstctrl 25 &rstctrl 26>;
-		reset-names = "pcie0", "pcie1", "pcie2";
-		clocks = <&clkctrl 24 &clkctrl 25 &clkctrl 26>;
-		clock-names = "pcie0", "pcie1", "pcie2";
-
-		reset-gpios = <&gpio 19 GPIO_ACTIVE_LOW>,
-				<&gpio 8 GPIO_ACTIVE_LOW>,
-				<&gpio 7 GPIO_ACTIVE_LOW>;
-
-		pcie@0,0 {
-			reg = <0x0000 0 0 0 0>;
-			#address-cells = <3>;
-			#size-cells = <2>;
-			ranges;
-			bus-range = <0x00 0xff>;
-		};
-
-		pcie@1,0 {
-			reg = <0x0800 0 0 0 0>;
-			#address-cells = <3>;
-			#size-cells = <2>;
-			ranges;
-			bus-range = <0x00 0xff>;
-		};
-
-		pcie@2,0 {
-			reg = <0x1000 0 0 0 0>;
-			#address-cells = <3>;
-			#size-cells = <2>;
-			ranges;
-			bus-range = <0x00 0xff>;
-		};
-	};
-
-- 
2.25.1

