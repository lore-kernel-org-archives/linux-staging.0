Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAEF201113
	for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 13:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782048923; cv=none; b=NhPLqr7TEwx0p0XCL3+LHDZ0qaxtF2HdTriAV4wbumu3sjVSFsE4n4npofHwL3+56cZupRg9VI5R+P0UKBSWJIOlwBPgwaIJTRIuXzMAHZhbYhIsWOm0llJbcOma26+Jrm87BrKK3dZ4TCxWtaFLYvXZYTRkBHtF1vYwANTQL2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782048923; c=relaxed/simple;
	bh=7JCnVAFhFlMcb0l+PNAP37agEA9T5pW/doTDbUhu+Mg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D0URcC1QlpfzhhqPMmdf488dfTjX/QTf4+BluEzBd3CZooU6Km9+0zutlcT5THXpuJXSpxa9NORBlPhf+kTD2Q1HXON4jwWYyx7WKRuYKvVpLNhgQqLGQAtcEEajVzHZ+ZqkEMh29juV89MU8qjDcP9VyyCSs4MKMBTR97YHHxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8sgOgg0; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8sgOgg0"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8424b00710aso2419512b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 06:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782048921; x=1782653721; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B2yda05V6cTcWFnExOApx6SpU7sKiC7KgPbiEUoNzwo=;
        b=S8sgOgg0vT9BuTbkcWBwOfXuY+cags8siv82scNyUICwQhDto8fBuieWgIDdQxeJDa
         MhJVYcKtdeA9WfkJQP7SB27v5iCedqIUGTuUHAjy/nQNBPO4akPQyxllu3RBdaMCJPGu
         ZQEEIQEpe5yje418wF22TdoqqEDfJGra+ILmFtVlcIBJRqpeA5Hf15eKqyEoUCSApKwr
         XETRiVqEk1yv2/j2GMxK4PbbAyF0UeDhyQjyy/EqTYTtscTp4sN8DWES3RSYOCxfxbYy
         MFn56tPRLw8MqPoTe2XAhTlVHV3x+vubIBia5Nwx+eDAvBLa0U9Li0uzePe73OZCepk7
         D34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782048921; x=1782653721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2yda05V6cTcWFnExOApx6SpU7sKiC7KgPbiEUoNzwo=;
        b=BZ5y6lVHkbBVlS//Cwh7c1bS2oQRV66lTVNHbW42ViZ15P0TV1qyaNpIcpOo//QF9s
         9jRn10dYXaU6n7N4srIbicVIaI9BqU5B9dh68WtbTrE9ErBIZG8Bj7fcV7z400SC/Rlj
         thru6VuX3KcPc9BpH/p2wL1d0wQaQwcI+fmrjfwyfotx0jyQAHaJmpKATp9Cdkmjkx/H
         rM2d+2Xj1jRQ+/QYPTIu/t24RP1NmhVit+IqVyCIGfxH9lvuLE7MAKgYAfuQxVgLrC0F
         6NJSc0yUFU/qDpyILa8jElGf5N1t4LTsLm7mVg1YqLyJFjgValGhz5GhJFtrx9ezhKoi
         R7tA==
X-Forwarded-Encrypted: i=1; AFNElJ+oUyJwritACAqtHDrMteeZUPJd7tGLi1wQ6+VkD1t/GqLXEQi94C26ZTSyeAgaiPunnMxOH0Xdd4qyF1hW@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8RbrBKeBQZWQkxF8Vv9Pnt19+vKKjZLAA6twH+9IrI9Mb7haI
	V7b08w16vXPfmb1LjlD9vAxEv4S8MvQnaAYC358+IV4DyK5YNdBXACiR
X-Gm-Gg: AfdE7clImhw8xJWkuERMbhjUBdYEchkcg09wfvhyNBXbPs1pP6nNlthj2fh2KmCo5Yz
	+Iat1Uo1IgnV8FfCFx2RFhOIuydMggd6u/YnvTgRW5HFpz/A8lkHwnQM/HZJ59xSrn2ARZjqndu
	rZRUB5egzKsU6Cztt/WDir3USA0katpk/pBEdJrt/n9qFkdoCZlbJxpeQ/xl9p7ZQiOYoYc0oIw
	j8PNEQq5vItv5usQylzla5RPx/LWDJOhD+8u/2XZorFddXrnrIRngcFTs7l8aTegzklYoaKoUHK
	i0yD1uhwAczHia7FEsiQ0xOnRSpHpDxL368uQEJKZhc2UTfFgLBzIGlrrsdbaLMujdPcjAHEuEx
	426uWI8w6BWahNOYZn+b2ge3rpB7yYqwGb9HOsozwYwbELDyvbsIabbnIuO78Fyhg96wx9sITRA
	oEzJC61md4/KCqCh7qwByIe9O/EnG4mi6hl/Fct3JyGg==
X-Received: by 2002:a05:6a00:2789:b0:842:6fec:1297 with SMTP id d2e1a72fcca58-8455078a336mr11186859b3a.9.1782048921205;
        Sun, 21 Jun 2026 06:35:21 -0700 (PDT)
Received: from kernel-dev ([49.36.101.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d6c5dbsm4502601b3a.12.2026.06.21.06.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 06:35:20 -0700 (PDT)
From: Aditya Chari <adi25charis@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org
Cc: jacobsfeder@gmail.com,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aditya Chari <adi25charis@gmail.com>
Subject: [PATCH] dt-bindings: misc: add binding for Xilinx AXI-Stream FIFO
Date: Sun, 21 Jun 2026 14:22:09 +0530
Message-ID: <20260621085209.52651-1-adi25charis@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The axis-fifo driver's compatible strings were undocumented, flagged
by checkpatch.pl as UNDOCUMENTED_DT_STRING. Add a devicetree
binding document describing the required properties
for drivers/staging/axis-fifo, derived from the properties
the driver reads via of_property_read_u32()
in axis_fifo_parse_dt().

Signed-off-by: Aditya Chari <adi25charis@gmail.com>
---
 .../bindings/misc/xlnx,axi-fifo-mm-s.yaml     | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml

diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
new file mode 100644
index 000000000..8ef0adde3
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/xlnx,axi-fifo-mm-s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx AXI-Stream FIFO (axis-fifo)
+
+maintainers:
+  - Jacob Feder <jacobsfeder@gmail.com>
+
+description:
+  The AXI-Stream FIFO (AXIS-FIFO) IP core provides a memory-mapped AXI4-Lite
+  interface for sending and receiving data over an AXI4-Stream interface
+  using FIFO buffers. See Xilinx PG080 for IP details.
+
+properties:
+  compatible:
+    enum:
+      - xlnx,axi-fifo-mm-s-4.1
+      - xlnx,axi-fifo-mm-s-4.2
+      - xlnx,axi-fifo-mm-s-4.3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  xlnx,axi-str-rxd-tdata-width:
+    description:
+      Width in bits of the AXI4-Stream receive data interface. Only a
+      width of 32 is currently supported by the driver.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 32
+
+  xlnx,axi-str-txd-tdata-width:
+    description:
+      Width in bits of the AXI4-Stream transmit data interface. Only a
+      width of 32 is currently supported by the driver.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 32
+
+  xlnx,rx-fifo-depth:
+    description:
+      Depth in bytes of the receive FIFO, as configured in the IP core.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  xlnx,tx-fifo-depth:
+    description:
+      Depth in bytes of the transmit FIFO, as configured in the IP core.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  xlnx,use-rx-data:
+    description:
+      Indicates whether the receive data path is present, as configured
+      in the IP core. A value of 1 enables the receive path, 0 disables it.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 0, 1 ]
+
+  xlnx,use-tx-data:
+    description:
+      Indicates whether the transmit data path is present, as configured
+      in the IP core. A value of 1 enables the transmit path, 0 disables it.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 0, 1 ]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - xlnx,axi-str-rxd-tdata-width
+  - xlnx,axi-str-txd-tdata-width
+  - xlnx,rx-fifo-depth
+  - xlnx,tx-fifo-depth
+  - xlnx,use-rx-data
+  - xlnx,use-tx-data
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    axi_fifo_mm_s_0: axi-fifo-mm-s@40000000 {
+        compatible = "xlnx,axi-fifo-mm-s-4.1";
+        reg = <0x40000000 0x10000>;
+        interrupts = <0 29 IRQ_TYPE_LEVEL_HIGH>;
+        xlnx,axi-str-rxd-tdata-width = <32>;
+        xlnx,axi-str-txd-tdata-width = <32>;
+        xlnx,rx-fifo-depth = <2048>;
+        xlnx,tx-fifo-depth = <2048>;
+        xlnx,use-rx-data = <1>;
+        xlnx,use-tx-data = <1>;
+    };
-- 
2.53.0

