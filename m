Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5E4314B6D
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 14:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769782502; cv=none; b=um5P5ItYh/L/Xb9MrqpFOvYyh2ojDLclTDElaE85tpmSixirrwllTU99SDRptIKaKHUyokGzCgWiwcT7D00Q2mHLRoLEVBf09JDHlCozu0npWqYKXEztNGacM++NiBtqrqU/WkswNLkTVmR65uruwVEaqhf29bseJYKDW7xyW80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769782502; c=relaxed/simple;
	bh=ZQNLiLUufyo5YCPAJ7rq/9+z0iR/t+atuR1eiajnQxE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pTIf8sANjoZMm6FrGWvf5vFlC9HDLBHFIANTF1p9kGz5nBOHXhH0/JCqLjz3JgMuAY8jkmHllQFg0N0sMDhdKdXAhHPB7DnUMbHFPgy7RD2hq9Zd0VKzfyfuFlst+Q725zehjb1ErliN5XQF4OMtDnJRKdsXzo7K95nO57bN7XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/fr8/xZ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/fr8/xZ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a09a3bd9c5so14948815ad.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 06:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769782500; x=1770387300; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uQK1I5Ac6NF6GP/+rHIsUY33ZO05kpOE1J5MiW6DuqE=;
        b=U/fr8/xZ+owbjgDpPZCPcsUBxt+K4nELVi98hQwTBeEWz3/R5MgFtHF5VeCuRu1YBR
         cOzkE4R/S42RaOvSUEIaDidVTaloK23Y3mw7SeMxIXc0Jb3oVoUrZFfwqyBKvkc/I7Ec
         fbbhLb6WWOSY4y0pLzsmtAbu75L3u9KUS8+8nsr6fBZVJQ02brlu5vqO0Mr1PxvOyfhN
         mgQUmGenBvQwc+9PkRroT5ahRrwQ++8sryHX6OULfHwtzajShBGcE58I3+MbYXcSSzx8
         MsFxV17cBp7S+ehM9c2nZuQGYT6CxaiM5gdLPk43bPEzaiGqN6h6xH/b6HCZSiqo4bj2
         m4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769782500; x=1770387300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQK1I5Ac6NF6GP/+rHIsUY33ZO05kpOE1J5MiW6DuqE=;
        b=YC4voFqe5IHl+cwNwuVUgvG+tVzKZKzQqMvjfMFba8GzbfR8zFJ9jfbjBuSbsJgPUD
         n0kDMeemyciFJBThuc5Yy4Jvht/qwBEq5MeS97zC8CacAfWGBK6Rq60qtomYDDHMv8J/
         MBzHEc0v8H+lPEp2aKPX1lgmUMhnqpjwuVQGFTNSFX/ak9zgmbJAIQGbTBNxJkb9rD8X
         +W08RoF1knk/zLZicnbzcEjMxhOacuMIf231RIEPZTEnxcdXGkbVWWpwDdg1uuis1Jta
         S70rvCmtJ9x7Fj46zaj+7DRzHa94kwFCRFeyXcBNAW9EzM0mTZgF9TS51mjjP2FpUxez
         Abig==
X-Gm-Message-State: AOJu0YxfK9Q0vgoJ+Qets+M7nyIWs9tDmM4w1J9AE8wbFzf82M9cXK1n
	wU5G9Q611QzYTsHCNppEpHtV1oJ1HwXO9uyWV7OG+U8Rqdv4CBP+Af+e
X-Gm-Gg: AZuq6aJ8mCYXH0oNC5Tzxp6LBrhlaEdERSuJeGdlrY2e/3zn76seFIH/XywC33gulqv
	FMOngDG1IM3lELWrXfdOc5/qYuV/HsCUu2otJiwEq3jp3Y8OdE/1lzQDCJxTYMFAJYIpO4WCmNY
	G4TwdX5UIoRP6Cb8grBmkqgkiJ97yaEQwdZss/ZZRO0ZKXD79W9+3cJxgM1WRgbM3dxCnn4wc2q
	dPRtZ190kXHvy9kq/Yz6cpgrtQcasJXoXAcwC7PVYdOMki0Q5tQyMffCS2/tqh2jbQlsmpFit5k
	4EzaZHi/k8tz+MDFAMhzfupzlFtFXBJJFc1J/IjNz9xYID3uUTWpEm75A2qE6J47pXaxRn2KDEy
	kDju6XG78B966R6rknIyLbnOARheif7mOTVwGseOeFwhFLuvzZeR1aKLHYNwaMHjpJODuI0SS7M
	IMZuZDb8gd7nloc/uUoQ==
X-Received: by 2002:a17:902:d2cd:b0:2a0:c1f6:6bc2 with SMTP id d9443c01a7336-2a8d9a62841mr29266825ad.59.1769782499842;
        Fri, 30 Jan 2026 06:14:59 -0800 (PST)
Received: from fedora ([2401:4900:88bb:affb:d123:d77f:d55f:ab1d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3eecc5sm81195155ad.17.2026.01.30.06.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 06:14:59 -0800 (PST)
From: harshdaniel66356@gmail.com
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harsh Daniel <harshdaniel66356@gmail.com>
Subject: [PATCH] dt-bindings: media: Add bindings for dim2 compatible strings.
Date: Fri, 30 Jan 2026 19:44:42 +0530
Message-ID: <20260130141442.139640-1-harshdaniel66356@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Harsh Daniel <harshdaniel66356@gmail.com>

Add device tree bindings for the compatible strings used in the
staging/most/dim2 driver to resolve checkpatch warnings:
- fsl,imx6q-mlb150
- renesas,mlp and renesas,rcar-gen3-mlp
- xlnx,axi4-os62420_3pin-1.00.a and xlnx,axi4-os62420_6pin-1.00.a

These bindings document the MediaLB DIM2 module found in Freescale
i.MX6Q, Renesas R-Car, and Xilinx FPGA platforms.

Signed-off-by: Harsh Daniel <harshdaniel66356@gmail.com>
---
 .../bindings/media/fsl,imx6q-mlb150.yaml      | 73 +++++++++++++++++++
 .../bindings/media/renesas,mlp.yaml           | 65 +++++++++++++++++
 .../media/xilinx/xlnx,axi4-os62420.yaml       | 60 +++++++++++++++
 MAINTAINERS                                   |  3 +
 4 files changed, 201 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6q-mlb150.yaml
 create mode 100644 Documentation/devicetree/bindings/media/renesas,mlp.yaml
 create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,axi4-os62420.yaml

diff --git a/Documentation/devicetree/bindings/media/fsl,imx6q-mlb150.yaml b/Documentation/devicetree/bindings/media/fsl,imx6q-mlb150.yaml
new file mode 100644
index 000000000000..2d0aab3d2286
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx6q-mlb150.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx6q-mlb150.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX6Q MediaLB DIM2 Controller
+
+maintainers:
+  - Andrey Shvetsov <andrey.shvetsov@k2l.de>
+
+description: |
+  MediaLB DIM2 module found in Freescale i.MX6Q SoCs.
+
+properties:
+  compatible:
+    const: fsl,imx6q-mlb150
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: MediaLB Interrupt
+      - description: AHB0 Interrupt
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      - const: mlb
+      - const: pll8_mlb
+
+  microchip,clock-speed:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - 256fs
+      - 512fs
+      - 1024fs
+      - 2048fs
+      - 3072fs
+      - 4096fs
+      - 6144fs
+      - 8192fs
+    description: DIM2 clock speed.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - microchip,clock-speed
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mlb@218e000 {
+        compatible = "fsl,imx6q-mlb150";
+        reg = <0x0218e000 0x4000>;
+        interrupts = <0 150 IRQ_TYPE_LEVEL_HIGH>,
+                     <0 151 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks 1>, <&clks 2>;
+        clock-names = "mlb", "pll8_mlb";
+        microchip,clock-speed = "2048fs";
+    };
diff --git a/Documentation/devicetree/bindings/media/renesas,mlp.yaml b/Documentation/devicetree/bindings/media/renesas,mlp.yaml
new file mode 100644
index 000000000000..dfd9045d87f2
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/renesas,mlp.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/renesas,mlp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas MediaLB DIM2 Controller
+
+maintainers:
+  - Andrey Shvetsov <andrey.shvetsov@k2l.de>
+
+description: |
+  MediaLB DIM2 module found in Renesas R-Car Gen2 and Gen3 SoCs.
+
+properties:
+  compatible:
+    enum:
+      - renesas,mlp
+      - renesas,rcar-gen3-mlp
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: MediaLB Interrupt
+      - description: AHB0 Interrupt
+
+  clocks:
+    maxItems: 1
+
+  microchip,clock-speed:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - 256fs
+      - 512fs
+      - 1024fs
+      - 2048fs
+      - 3072fs
+      - 4096fs
+      - 6144fs
+      - 8192fs
+    description: DIM2 clock speed.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - microchip,clock-speed
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mlp@e6050000 {
+        compatible = "renesas,mlp";
+        reg = <0xe6050000 0x1000>;
+        interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg 123>;
+        microchip,clock-speed = "2048fs";
+    };
diff --git a/Documentation/devicetree/bindings/media/xilinx/xlnx,axi4-os62420.yaml b/Documentation/devicetree/bindings/media/xilinx/xlnx,axi4-os62420.yaml
new file mode 100644
index 000000000000..dd4ac5c6ccf3
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,axi4-os62420.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/xilinx/xlnx,axi4-os62420.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx MediaLB DIM2 Controller
+
+maintainers:
+  - Andrey Shvetsov <andrey.shvetsov@k2l.de>
+
+description: |
+  MediaLB DIM2 module found in Xilinx FPGAs.
+
+properties:
+  compatible:
+    enum:
+      - xlnx,axi4-os62420_3pin-1.00.a
+      - xlnx,axi4-os62420_6pin-1.00.a
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: MediaLB Interrupt
+      - description: AHB0 Interrupt
+
+  microchip,clock-speed:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - 256fs
+      - 512fs
+      - 1024fs
+      - 2048fs
+      - 3072fs
+      - 4096fs
+      - 6144fs
+      - 8192fs
+    description: DIM2 clock speed.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - microchip,clock-speed
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    dim2@e6050000 {
+        compatible = "xlnx,axi4-os62420_3pin-1.00.a";
+        reg = <0x43c00000 0x10000>;
+        interrupts = <0 144 IRQ_TYPE_LEVEL_HIGH>,
+                     <0 145 IRQ_TYPE_LEVEL_HIGH>;
+        microchip,clock-speed = "2048fs";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..914693621b3b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17650,6 +17650,9 @@ M:	Christian Gromm <christian.gromm@microchip.com>
 S:	Maintained
 F:	Documentation/ABI/testing/configfs-most
 F:	Documentation/ABI/testing/sysfs-bus-most
+F:	Documentation/devicetree/bindings/media/fsl,imx6q-mlb150.yaml
+F:	Documentation/devicetree/bindings/media/renesas,mlp.yaml
+F:	Documentation/devicetree/bindings/media/xilinx/xlnx,axi4-os62420.yaml
 F:	drivers/most/
 F:	drivers/staging/most/
 F:	include/linux/most.h
-- 
2.52.0

