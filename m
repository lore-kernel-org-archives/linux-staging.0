Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB3F21D5BC
	for <linux-staging@lists.linux.dev>; Tue,  3 Feb 2026 04:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770092022; cv=none; b=un3CfvtSZJ3njHCKZAX+GBx5IVZB99Aie10WpxlsH2XecAy6JAClxoCB3OXsHETQtcqAjTQyBecASBxlCERSRl/rt3t/dJfJms18Gxph52ka7Hdkh4zElTTfi+apJeujIqba96MdmQzwItH0aNXRP3W3bpshgC1pHZned+ksI1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770092022; c=relaxed/simple;
	bh=qB81YucfOx5FS6ln9w/fZaVAkV+6bL3HcxUsK0YTnQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TLHlaWbe4eVEBML/flVv7KmdjtQQ/h4CU7Kjm4/gJVgjpEHYakvnfWHjY5YnITKccdlHXsAAy2X38cEWY2kN+I5Bu8gzw8peKTdA5CnqdKMtZAZ9UQmIOGcW2TzVu2rRPQXK3S0WuGx4pLhRu/Evp5pHKj6hac8Erp2FzWon/vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WgGqi74O; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WgGqi74O"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c2dc870e194so2304919a12.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 20:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770092021; x=1770696821; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dK8WXIcVHk0OfvOActR0X4+xNwaVImkR0mKuB/pTuLA=;
        b=WgGqi74OgkNa4ZiVcRb3Of+QeHP/ckK4Whvkd7wrdMeGzqHS2Td71lpT/KLWMH1Fvu
         IcSbop4al32KeVXextwQQIBnrMZHLglZD42b/yDfRVMHDDYQIaeUnFfZYVw8dRB5kVKR
         WXo/IeVURGIU+VtUifq8KLV/nlcr5DZCMV8rEYzbe1ZDGWD7bVp7d/KLuDoFzVZ5IBD4
         nxj0IEEzNGyzIlqf2UW9Xityle/HTvRvJsQ5oST3NCBV8qsS5z4YYz1zrcLDgfG+NH4O
         EImwsjeygSi/8n3/RHDD8pZixda8aK5uGp9GM5Hscprkhm258IpGvd3pVbA/pv9OG+nY
         KmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770092021; x=1770696821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dK8WXIcVHk0OfvOActR0X4+xNwaVImkR0mKuB/pTuLA=;
        b=NtlNxFs5UACEUuZQAaHR3qCDek6uXI9QgOcI7JBfk0iriSXlQhe/eUlgP1NV/W1xK0
         2EfhKLAZx38if/Fd3AALIa8NJhiq7jp1q+ao9VlhyWZnf+gsEUdQBq7LwVSrgolsWc62
         /6wg2Ac3dCmHW3pUSM0WRmVL1Gm9iP/5oePmiiL2WtO1NxMKV6Ps5Ac/MPdOWXePv0u6
         cDTzygI99sXwiF1ZjPB6sERXTDC0ghx+FcnsHi6JV9sQx9M5OuAGhoyV590KWPmmjagE
         FZwpDQ2nAigESny/rOg8h03D8SnHNgmN/M8nptiw0x+m7JH07FYwvoOKJfXhGojTI4FN
         tfiA==
X-Gm-Message-State: AOJu0YxMvPt6LEUIcG31/mC5DtShbUZa2KXteP74f7MqIR/uUZ17zkQq
	T/1cJMTrevaeH4+wrVeR7ZtEOdyS/+QmRdWu/3ICP1qFkj7gXxj76LtE
X-Gm-Gg: AZuq6aIe0P6UHDt8Fbom1wSen2gP4TXsPEAHs0WwXJ+9HsfJd+sYFIUfQTvx+oVX13x
	UdasOra9B9mfk6mSx0PkXSfHqczzLoG5tvkUByJoMgW8uj6kSAsdCCU4xOeCPu0Vw182+Wx3EyL
	egbKGWnW6zOm3rWXiz/1HVEVhAxdgCr2FM6JdXXpb488afbmbvUk+pGXpWMqZI16QbAA+tnvkKw
	QoHQPU2vodLIx+qDJ65EXjXISUZD0A9mT5jbygny0kUPdD8r5TZOtgpRyKR7ZRcn52Qe2hJqeRU
	KveXQ5/DHYAHGg0EfWteuZNF0Zhcr/SSkEN8rcgetuuP0WKj6G2v8MeXcHNmh+mu6ibEJUCr7Ng
	5d/i9WbbwiZQ+nSL7V92rHK4Eh/yBkTyUUoTr69pQ7VPnSl18TSd3tVhFzdbrvhfslohy7rpJs/
	ZUtwQcanMW/2iHZOXTA/s573Oh0XkH
X-Received: by 2002:a17:903:15cf:b0:2a0:d05c:7de3 with SMTP id d9443c01a7336-2a8d7ed6494mr135040035ad.15.1770092020496;
        Mon, 02 Feb 2026 20:13:40 -0800 (PST)
Received: from fedora ([2401:4900:88ba:bcfc:246e:b45f:7ef4:a424])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3eef44sm165547585ad.11.2026.02.02.20.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 20:13:39 -0800 (PST)
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
Subject: [PATCH v3] media: dt-bindings: media: microchip,dim2: Add MediaLB DIM2 binding
Date: Tue,  3 Feb 2026 09:43:25 +0530
Message-ID: <20260203041325.12419-1-harshdaniel66356@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Harsh Daniel <harshdaniel66356@gmail.com>

Add device tree binding documentation for the MediaLB DIM2 module found in
Microchip (formerly SMSC/K2L) IP, used in Freescale i.MX6Q, Renesas
R-Car Gen2/Gen3 SoCs, and Xilinx FPGAs.

This consolidates the previously proposed separate bindings into a single
document as they share the same hardware block.

Signed-off-by: Harsh Daniel <harshdaniel66356@gmail.com>
---
 .../bindings/media/microchip,dim2.yaml        | 136 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/microchip,dim2.yaml

diff --git a/Documentation/devicetree/bindings/media/microchip,dim2.yaml b/Documentation/devicetree/bindings/media/microchip,dim2.yaml
new file mode 100644
index 000000000000..c8cbee47ab1e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/microchip,dim2.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/microchip,dim2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip MediaLB DIM2 Controller
+
+maintainers:
+  - Andrey Shvetsov <andrey.shvetsov@k2l.de>
+
+description:
+  MediaLB DIM2 module found in Freescale i.MX6Q, Renesas R-Car Gen2 and
+  Gen3 SoCs, and Xilinx FPGAs.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx6q-mlb150
+      - renesas,rcar-gen3-mlp
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
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: core
+      - const: pll8_mlb
+
+  microchip,clock-frequency:
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
+    description:
+      DIM2 clock speed as a multiple of the frame sync frequency.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - microchip,clock-frequency
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx6q-mlb150
+    then:
+      required:
+        - clocks
+        - clock-names
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,rcar-gen3-mlp
+    then:
+      required:
+        - clocks
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - xlnx,axi4-os62420_3pin-1.00.a
+              - xlnx,axi4-os62420_6pin-1.00.a
+    then:
+      properties:
+        clocks: false
+        clock-names: false
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
+        clock-names = "core", "pll8_mlb";
+        microchip,clock-frequency = "2048fs";
+    };
+  - |
+    /* Renesas example */
+    mlp@e6050000 {
+        compatible = "renesas,rcar-gen3-mlp";
+        reg = <0xe6050000 0x1000>;
+        interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg 123>;
+        microchip,clock-frequency = "2048fs";
+    };
+  - |
+    /* Xilinx example */
+    dim2@43c00000 {
+        compatible = "xlnx,axi4-os62420_3pin-1.00.a";
+        reg = <0x43c00000 0x10000>;
+        interrupts = <0 144 IRQ_TYPE_LEVEL_HIGH>,
+                     <0 145 IRQ_TYPE_LEVEL_HIGH>;
+        microchip,clock-frequency = "2048fs";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..f002a1117ef8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17650,6 +17650,7 @@ M:	Christian Gromm <christian.gromm@microchip.com>
 S:	Maintained
 F:	Documentation/ABI/testing/configfs-most
 F:	Documentation/ABI/testing/sysfs-bus-most
+F:	Documentation/devicetree/bindings/media/microchip,dim2.yaml
 F:	drivers/most/
 F:	drivers/staging/most/
 F:	include/linux/most.h
-- 
2.52.0

