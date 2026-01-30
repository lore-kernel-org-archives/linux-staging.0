Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0B8361641
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 17:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769794404; cv=none; b=KLaSRYzc5iIwQivMg8ZEqhaCGSvf23t/4PgF3CnX4vKTgTSp8QNIt8kIsxchypjfSCpPiwEEZ3R9G8vL/tn/lFbh5T1BWff913zrAmM2u6mgNYv/PNBstEubxEXLJ9ulqCPCXH5ZmOkLKdiMz3B90ICrjsYG2Q7iYKf4Vjbm+Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769794404; c=relaxed/simple;
	bh=kQVuUgbt2ozvCbKdJn7tDwqs9Letf6gSbigdyyJxZyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bgxbA1+Osc5+uEYbDNAMo4RxnutJNhqxrQFoDudrxC7cMJXCAvP/F4CI9uKmzniKE84wO1LFdEiLFa1XF8aYRuVle5XjCGAZQWahxbTGAfQZ46pj37Ka3N7XsbL5NSoFg7X772VIFn5xsTb/1/wyKo/dId/CSY/FWqcfRVAoTCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fT7XKEoW; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fT7XKEoW"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a09d981507so17268015ad.1
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 09:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769794402; x=1770399202; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GFr2zqCvYMkzUxl5+vLx5OGto1Kl2Kpg4MiPy8HCJU8=;
        b=fT7XKEoWRTiH/Z23sumOQ0BouHPK43uA/TEReUckShqZYwJpFVxQ3ur98jEUeiFh5k
         fYQLe1j4pNhCrE27R7YY+yowDbNOWeALA2dwPZt9ieAzxFvKASJJVq+DV6OVGH/dG6PG
         +yH4SdK3gkL4Qai8ZThPm/LkDKh75264c7dl98texPB80tU+c0kgkIU5eVC3DlBG0zpN
         HWGseqRaN2EpllGkhpWeilDLjRNVlRJtufAyoAEZ6cMjhZBFZ99v/YtdmPAL8DS5+AAP
         3u0H9T0kEaGs8UsHSJIFgQWHL1M1wtOQznJ9S4TwQTTsH31xQ4PxHlhh0UlQ0nDbWBxi
         ITQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769794402; x=1770399202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFr2zqCvYMkzUxl5+vLx5OGto1Kl2Kpg4MiPy8HCJU8=;
        b=KoGkc7G5Bv5jrQX5K9SbeY3aRfIYTGMeZ3CxfTaMYCYOG9UFrcQN9XhDFk1rWkFvZe
         qC2tNBfJRw0KZ2hQ1PfXsF+qdVLquWzvbGQzAm0fDtlx5dYdw9gCV9taFenHxGhjKO63
         WYkU7S2FgBOO/CjX/g942Zag71esAS4uE8CpVIoZ+RguIY+haGp0JiWYLzzMXKqavQz3
         cDj+11dtBoZTWWAvbzqa06wFp/cXdymn1uoE5IZrERxuRPSlDXnpbTgJ2Y68NDJ2ER1t
         1qmpK1awnuxpZgy0iUfkYlNUljlUrCvvK4Vh/D7KilOQe9peJ5pVAfQf20rPlShppQ8B
         ybLQ==
X-Gm-Message-State: AOJu0YxYtrXSU8sM8qyDhacC90TZH0fLfGs1wagupvyVGhZ7zAGPj7cZ
	oGU9A0tseEtSXHMHY4S1UNVy4sAMxn4nznLX7vsCRyQOHRJkiZmlEu27WiG3s2Y2fRMU7A==
X-Gm-Gg: AZuq6aLSxOiIAd1WztSzaVUNVSKu4GHJp7yilhHYXX4nxUT6PSBaptDKJVHztrsLMSU
	2h9xxK/WIeIU0kN/GRgxXA/WfiedSuIeeySicanuqVmqcXttFSN5L3KBTmYEZbmNQeiVXjpU4x+
	ro3W43tYS+dN32oXE9QwyuS+tk2pq6POYl9MBAOSqmgdC0J8RuSURB8W3tXSxj81kpox0/PtgVv
	jV0zo2sQu9xFAjJ7ic2tbZGsxnYplcEJZwEpMtaZfBXqiofHSMhA95RMK9s3dSA/J81N4D4ptZ/
	57Y+imDl0Mfr56Bt+eNe2NO3tsSn95+YqcT9BTUMA+tWUs2QPCrWEeGlFmXnWmk0CfpmdBz5xC0
	AyB0B9lA5/cM2FkK54baxa6cAW0sIkomG/xuG4WUE1jTGdH3IAmM9PQGYDmnSEe1h3nQvRyz4nz
	IBgZh9xbxJp/L9Q07npw==
X-Received: by 2002:a17:903:283:b0:2a0:7f8b:c0cb with SMTP id d9443c01a7336-2a8d96cb4c0mr40982605ad.4.1769794401744;
        Fri, 30 Jan 2026 09:33:21 -0800 (PST)
Received: from fedora ([2401:4900:88bb:affb:d123:d77f:d55f:ab1d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d9a70sm83046055ad.77.2026.01.30.09.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 09:33:21 -0800 (PST)
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
Subject: [PATCH v2] media: dt-bindings: fsl,imx6q-mlb150: Fix clock-names schema
Date: Fri, 30 Jan 2026 23:03:02 +0530
Message-ID: <20260130173302.281984-1-harshdaniel66356@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Harsh Daniel <harshdaniel66356@gmail.com>

The error was due to minItems and maxItems defined twice 
in file fsl,imx6q-mlb150.yaml. It was defined both in clocks and
clock-names.

I've removed minItems and maxItems from clock-names and 
run "make dt_binding_check" and yamllint to check for errors in
all three created files.

Signed-off-by: Harsh Daniel <harshdaniel66356@gmail.com>
---
 .../bindings/media/fsl,imx6q-mlb150.yaml      | 71 +++++++++++++++++++
 .../bindings/media/renesas,mlp.yaml           | 65 +++++++++++++++++
 .../media/xilinx/xlnx,axi4-os62420.yaml       | 60 ++++++++++++++++
 MAINTAINERS                                   |  3 +
 4 files changed, 199 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6q-mlb150.yaml
 create mode 100644 Documentation/devicetree/bindings/media/renesas,mlp.yaml
 create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,axi4-os62420.yaml

diff --git a/Documentation/devicetree/bindings/media/fsl,imx6q-mlb150.yaml b/Documentation/devicetree/bindings/media/fsl,imx6q-mlb150.yaml
new file mode 100644
index 000000000000..b4e538cdb8cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx6q-mlb150.yaml
@@ -0,0 +1,71 @@
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

