Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A002BDC1C
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 08:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778402725; cv=none; b=QgHJUqNAaiwXtX5CZn0Z4o+HmMIRvQVPmgSk47vOq4vmmnV5vKo7hbRCLbB9DCPdz5l3fVONzEgx8ZnFceat10//Y3wVWpTFD0gY7AQKA6YgpPDEKczvdALWhZa6B0G5YM558ChTH+hpTU5O137mEjdEbta/fOSmmF+FsnnO4Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778402725; c=relaxed/simple;
	bh=/A4kSukvshtu7mIpJv2Kvqy90NT1A78T7/s/GToOwQA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K+qdmnz69Jurl+nysWopWcZivgd8ayqPkmVQcSZpBH+FlzgLFxZWV/znbhmO+fjH5Q8J5+FSahFbk23CxqlMc2iufD2DOTfORzmrsg4iCY+lFBx21bQW0+bbppl0qf5kr81ayPCMLQiH/57L1eKXux2MJ5rPrtCBuKS/TLYjU7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sZ0uS7DN; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sZ0uS7DN"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36627a0ea23so1246756a91.0
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 01:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778402723; x=1779007523; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u5C0aikJ50ju2K2/SMrLNsFBq5S0U4suO2P5I3Z8DDE=;
        b=sZ0uS7DNsCRrG6OZsimNx9bC/JtPfnBqq2d1y4pglEYCunRcXIg53KvVnlEFW/HQKf
         OjZJAELAQIVp2jKCWsY8OY07H64OguovY4aD3aNvfXKDfRjZ81yZo77Y5pTMHK7DLaYQ
         qGu9k35kXvcu7+Yt9lW2fQvw4osUvB2CCLfEBncKinJ3thBEdHXaDXljLdB5JTW/ogQa
         m9hY06rzbueaze7ZbM3xzOHaCAFjX8VqBuE78isT/hW+uOE/Ow9zJxDmJKagkj5jNybF
         0uNauk6s6NFxwPhibuSTh0WKPTbMbZi04Imi59wVw91/+oLZKBZL+su6JlR6qdTfuP+k
         QXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778402723; x=1779007523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5C0aikJ50ju2K2/SMrLNsFBq5S0U4suO2P5I3Z8DDE=;
        b=YioRzTgfZshEhtJFF5Ydl1mJ8iT+GuM1s3J9h0xC/NCSbC2ZSKxWpV1TGzPjn3U668
         MJZOQpYDUIOEeCdPCNq17JTmmHe1GcgmSl5J57ev7ImtwXG9v3ENt2R6ytvs835xcnBv
         do4EbwIRzRzybALFtFftcsidd9HgL+5CW43HOLg6+AxoxKNzVAhb14GSLVMEGeQU56Eu
         q2Putg0+cc+DaoBee5Q8gE7rQc2v9nNt0jLAwQAahsOADiIEFthvC9++XSlENmsZtjSs
         x9r2q5Nxsb+b6ffttbbSAwbtMUQbu3GwirIN3tgjmwd/4FOk2cKgQxacclDUkDry4d97
         8FCA==
X-Forwarded-Encrypted: i=1; AFNElJ/jTwgi4HasGpegJi678IuLzbhbTNJc4pso12yUbgw6rZkcBRq5w3AXGRKkKc7JbhItO5WbDYUo6RW0bKcU@lists.linux.dev
X-Gm-Message-State: AOJu0YyHLfLtZD7ag9lyFYEzvNWUUMssseiXYEDnkb73eIyxaifnx7Dv
	gNcjFrvx/JmfYciyU9oYqHHRwQKRNodD7EaqgpqJGEDF9XUmIiGxyJTR
X-Gm-Gg: Acq92OFyGoW/GM+FWF5S5wkfGTEIPbT3s54VDxIPQUhzP4sTil3Ml5VbbFbLhi4CCJ2
	DsLWTdN53K9k8QD/P2CyuZG3YjQK5uIPj76q9Q4rzi918nSQs0PxIDua42sjzg2sZWbz7FYqRYY
	BpmISgxsR6WZ1gZ56LXTM/UKO6H849uDoTaxit4prhMZdzF9P7iLwYmeSFDzV41Ip4PhHYdWGOQ
	VRPxlaf8bjcw+dCh4Icf73l3uNqVYVw9jEWQgupplJuqJUpOQ9XM29TJ1XMWZaZKR58mcOah3nT
	j+OmjtGYPPJCtesPufbKqC1P/XMzsEpf/LJiztD9sOqgVjDmuPeFgHaKSyblzxXqwRGfRd9QoSg
	bcL2clBLl4LmWO2Kq1XkkLW4J7XcNcsfcamvhroMbTnc2x0bAgCb6YyKpntA8u3gQOQ+Qfiu4xm
	GZ+k9P4lhsZv5yp/3JKeMXD8XN2ApH6YkEicGjgXxw
X-Received: by 2002:a17:90b:48c9:b0:35e:5a24:3c43 with SMTP id 98e67ed59e1d1-3664c90197emr10443096a91.8.1778402722946;
        Sun, 10 May 2026 01:45:22 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d008:80b:a00:27ff:feb6:42dd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d684009esm4207187a91.11.2026.05.10.01.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 01:45:22 -0700 (PDT)
From: Pramod Maurya <pramod.nexgen@gmail.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jacobsfeder@gmail.com,
	gregkh@linuxfoundation.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	pramod.nexgen@gmail.com
Subject: [PATCH v2] dt-bindings: misc: Add binding for Xilinx AXI-Stream FIFO
Date: Sun, 10 May 2026 04:44:57 -0400
Message-ID: <20260510084458.73685-1-pramod.nexgen@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a YAML schema for the Xilinx AXI-Stream FIFO IP core (PG080).
The binding documents the three supported compatible strings and all
vendor-specific properties that the axis-fifo driver reads from the
device tree.

This resolves the following checkpatch.pl warnings in
drivers/staging/axis-fifo/axis-fifo.c:
  WARNING: DT compatible string "xlnx,axi-fifo-mm-s-4.1" appears un-documented
  WARNING: DT compatible string "xlnx,axi-fifo-mm-s-4.2" appears un-documented
  WARNING: DT compatible string "xlnx,axi-fifo-mm-s-4.3" appears un-documented

Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
---
Changes in v2:
- Delete drivers/staging/axis-fifo/axis-fifo.txt as part of the
  conversion (was missing from v1)
- Add all Vivado-generated properties to the schema so that real
  hardware DT nodes pass validation with additionalProperties: false
- Update example to match a realistic Vivado-generated DT node
  including all properties

 .../bindings/misc/xlnx,axi-fifo-mm-s.yaml     | 265 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 drivers/staging/axis-fifo/axis-fifo.txt       |  96 -------
 3 files changed, 271 insertions(+), 96 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
 delete mode 100644 drivers/staging/axis-fifo/axis-fifo.txt

diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
new file mode 100644
index 000000000000..264abb29dd5a
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
@@ -0,0 +1,265 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/xlnx,axi-fifo-mm-s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx AXI-Stream FIFO
+
+maintainers:
+  - Jacob Feder <jacobsfeder@gmail.com>
+
+description:
+  The Xilinx AXI-Stream FIFO (PG080) provides a memory-mapped interface to
+  an AXI-Stream FIFO IP core. It allows a processor to transmit and receive
+  AXI-Stream packets via simple MMIO register reads and writes.
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
+  interrupt-names:
+    maxItems: 1
+
+  xlnx,axi-str-rxd-protocol:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      AXI-Stream receive data protocol type. This property is generated by
+      Vivado and is not used by the driver.
+
+  xlnx,axi-str-rxd-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Width of the receive AXI-Stream data bus in bits. Currently only 32
+      is supported.
+    const: 32
+
+  xlnx,axi-str-txc-protocol:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      AXI-Stream transmit control protocol type. This property is generated
+      by Vivado and is not used by the driver.
+
+  xlnx,axi-str-txc-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Width of the transmit control AXI-Stream data bus in bits. This
+      property is generated by Vivado and is not used by the driver.
+
+  xlnx,axi-str-txd-protocol:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      AXI-Stream transmit data protocol type. This property is generated by
+      Vivado and is not used by the driver.
+
+  xlnx,axi-str-txd-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Width of the transmit AXI-Stream data bus in bits. Currently only 32
+      is supported.
+    const: 32
+
+  xlnx,axis-tdest-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      AXI-Stream TDEST signal width in bits. This property is generated by
+      Vivado and is not used by the driver.
+
+  xlnx,axis-tid-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      AXI-Stream TID signal width in bits. This property is generated by
+      Vivado and is not used by the driver.
+
+  xlnx,axis-tuser-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      AXI-Stream TUSER signal width in bits. This property is generated by
+      Vivado and is not used by the driver.
+
+  xlnx,data-interface-type:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Data interface type. This property is generated by Vivado and is not
+      used by the driver.
+
+  xlnx,has-axis-tdest:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Indicates if the AXI-Stream TDEST signal is present. Cut-through mode
+      is not supported by the driver; this value must be 0.
+    const: 0
+
+  xlnx,has-axis-tid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Indicates if the AXI-Stream TID signal is present. Cut-through mode
+      is not supported by the driver; this value must be 0.
+    const: 0
+
+  xlnx,has-axis-tkeep:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Indicates if the AXI-Stream TKEEP signal is present. This feature is
+      not supported by the driver; this value must be 0.
+    const: 0
+
+  xlnx,has-axis-tstrb:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Indicates if the AXI-Stream TSTRB signal is present. This feature is
+      not supported by the driver; this value must be 0.
+    const: 0
+
+  xlnx,has-axis-tuser:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Indicates if the AXI-Stream TUSER signal is present. This feature is
+      not supported by the driver; this value must be 0.
+    const: 0
+
+  xlnx,rx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Depth of the receive FIFO in words.
+
+  xlnx,rx-fifo-pe-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Receive FIFO programmable empty interrupt threshold in words. This
+      property is generated by Vivado and is not used by the driver.
+
+  xlnx,rx-fifo-pf-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Receive FIFO programmable full interrupt threshold in words. This
+      property is generated by Vivado and is not used by the driver.
+
+  xlnx,s-axi-id-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      AXI4 ID signal width in bits. This property is generated by Vivado
+      and is not used by the driver.
+
+  xlnx,s-axi4-data-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      AXI4 data bus width in bits. This property is generated by Vivado and
+      is not used by the driver.
+
+  xlnx,select-xpm:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Selects Xilinx Parameterized Macro (XPM) memory primitives. This
+      property is generated by Vivado and is not used by the driver.
+
+  xlnx,tx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Depth of the transmit FIFO in words.
+
+  xlnx,tx-fifo-pe-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Transmit FIFO programmable empty interrupt threshold in words. This
+      property is generated by Vivado and is not used by the driver.
+
+  xlnx,tx-fifo-pf-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Transmit FIFO programmable full interrupt threshold in words. This
+      property is generated by Vivado and is not used by the driver.
+
+  xlnx,use-rx-cut-through:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Enables receive cut-through mode. Cut-through mode is not supported
+      by the driver; this value must be 0.
+    const: 0
+
+  xlnx,use-rx-data:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Set to 1 if the receive data FIFO is enabled, 0 otherwise.
+    enum: [0, 1]
+
+  xlnx,use-tx-ctrl:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Enables the transmit control FIFO. This feature is not supported by
+      the driver; this value must be 0.
+    const: 0
+
+  xlnx,use-tx-cut-through:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Enables transmit cut-through mode. Cut-through mode is not supported
+      by the driver; this value must be 0.
+    const: 0
+
+  xlnx,use-tx-data:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Set to 1 if the transmit data FIFO is enabled, 0 otherwise.
+    enum: [0, 1]
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
+    axi_fifo: fifo@43c00000 {
+        compatible = "xlnx,axi-fifo-mm-s-4.1";
+        reg = <0x43c00000 0x10000>;
+        interrupt-parent = <&intc>;
+        interrupt-names = "interrupt";
+        interrupts = <0 29 4>;
+        xlnx,axi-str-rxd-protocol = "XIL_AXI_STREAM_ETH_DATA";
+        xlnx,axi-str-rxd-tdata-width = <32>;
+        xlnx,axi-str-txc-protocol = "XIL_AXI_STREAM_ETH_CTRL";
+        xlnx,axi-str-txc-tdata-width = <32>;
+        xlnx,axi-str-txd-protocol = "XIL_AXI_STREAM_ETH_DATA";
+        xlnx,axi-str-txd-tdata-width = <32>;
+        xlnx,axis-tdest-width = <4>;
+        xlnx,axis-tid-width = <4>;
+        xlnx,axis-tuser-width = <4>;
+        xlnx,data-interface-type = <0>;
+        xlnx,has-axis-tdest = <0>;
+        xlnx,has-axis-tid = <0>;
+        xlnx,has-axis-tkeep = <0>;
+        xlnx,has-axis-tstrb = <0>;
+        xlnx,has-axis-tuser = <0>;
+        xlnx,rx-fifo-depth = <0x200>;
+        xlnx,rx-fifo-pe-threshold = <2>;
+        xlnx,rx-fifo-pf-threshold = <0x1fb>;
+        xlnx,s-axi-id-width = <4>;
+        xlnx,s-axi4-data-width = <32>;
+        xlnx,select-xpm = <0>;
+        xlnx,tx-fifo-depth = <0x8000>;
+        xlnx,tx-fifo-pe-threshold = <0x200>;
+        xlnx,tx-fifo-pf-threshold = <0x7ffb>;
+        xlnx,use-rx-cut-through = <0>;
+        xlnx,use-rx-data = <0>;
+        xlnx,use-tx-ctrl = <0>;
+        xlnx,use-tx-cut-through = <0>;
+        xlnx,use-tx-data = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 9b107057ad8c..84be7c8ae257 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29130,6 +29130,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/xlnx,axi-ethernet.yaml
 F:	drivers/net/ethernet/xilinx/xilinx_axienet*
 
+XILINX AXI-STREAM FIFO DRIVER
+M:	Jacob Feder <jacobsfeder@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
+F:	drivers/staging/axis-fifo/
+
 XILINX CAN DRIVER
 M:	Appana Durga Kedareswara rao <appana.durga.rao@xilinx.com>
 L:	linux-can@vger.kernel.org
diff --git a/drivers/staging/axis-fifo/axis-fifo.txt b/drivers/staging/axis-fifo/axis-fifo.txt
deleted file mode 100644
index 413b81a53202..000000000000
--- a/drivers/staging/axis-fifo/axis-fifo.txt
+++ /dev/null
@@ -1,96 +0,0 @@
-Xilinx AXI-Stream FIFO v4.1 IP core
-
-This IP core has read and write AXI-Stream FIFOs, the contents of which can
-be accessed from the AXI4 memory-mapped interface. This is useful for
-transferring data from a processor into the FPGA fabric. The driver creates
-a character device that can be read/written to with standard
-open/read/write/close.
-
-See Xilinx PG080 document for IP details.
-
-Currently supports only store-forward mode with a 32-bit
-AXI4-Lite interface. DOES NOT support:
-	- cut-through mode
-	- AXI4 (non-lite)
-
-Required properties:
-- compatible: Should be one of:
-    "xlnx,axi-fifo-mm-s-4.1"
-    "xlnx,axi-fifo-mm-s-4.2"
-    "xlnx,axi-fifo-mm-s-4.3"
-- interrupt-names: Should be "interrupt"
-- interrupt-parent: Should be <&intc>
-- interrupts: Should contain interrupts lines.
-- reg: Should contain registers location and length.
-- xlnx,axi-str-rxd-protocol: Should be "XIL_AXI_STREAM_ETH_DATA"
-- xlnx,axi-str-rxd-tdata-width: Should be <0x20>
-- xlnx,axi-str-txc-protocol: Should be "XIL_AXI_STREAM_ETH_CTRL"
-- xlnx,axi-str-txc-tdata-width: Should be <0x20>
-- xlnx,axi-str-txd-protocol: Should be "XIL_AXI_STREAM_ETH_DATA"
-- xlnx,axi-str-txd-tdata-width: Should be <0x20>
-- xlnx,axis-tdest-width: AXI-Stream TDEST width (ignored by the driver)
-- xlnx,axis-tid-width: AXI-Stream TID width (ignored by the driver)
-- xlnx,axis-tuser-width: AXI-Stream TUSER width (ignored by the driver)
-- xlnx,data-interface-type: Should be <0x0> (ignored by the driver)
-- xlnx,has-axis-tdest: Should be <0x0> (this feature isn't supported)
-- xlnx,has-axis-tid: Should be <0x0> (this feature isn't supported)
-- xlnx,has-axis-tkeep: Should be <0x0> (this feature isn't supported)
-- xlnx,has-axis-tstrb: Should be <0x0> (this feature isn't supported)
-- xlnx,has-axis-tuser: Should be <0x0> (this feature isn't supported)
-- xlnx,rx-fifo-depth: Depth of RX FIFO in words
-- xlnx,rx-fifo-pe-threshold: RX programmable empty interrupt threshold
-	(ignored by the driver)
-- xlnx,rx-fifo-pf-threshold: RX programmable full interrupt threshold
-	(ignored by the driver)
-- xlnx,s-axi-id-width: Should be <0x4> (ignored by the driver)
-- xlnx,s-axi4-data-width: Should be <0x20> (ignored by the driver)
-- xlnx,select-xpm: Should be <0x0> (ignored by the driver)
-- xlnx,tx-fifo-depth: Depth of TX FIFO in words
-- xlnx,tx-fifo-pe-threshold: TX programmable empty interrupt threshold
-	(ignored by the driver)
-- xlnx,tx-fifo-pf-threshold: TX programmable full interrupt threshold
-	(ignored by the driver)
-- xlnx,use-rx-cut-through: Should be <0x0> (this feature isn't supported)
-- xlnx,use-rx-data: <0x1> if RX FIFO is enabled, <0x0> otherwise
-- xlnx,use-tx-ctrl: Should be <0x0> (this feature isn't supported)
-- xlnx,use-tx-cut-through: Should be <0x0> (this feature isn't supported)
-- xlnx,use-tx-data: <0x1> if TX FIFO is enabled, <0x0> otherwise
-
-Example:
-
-axi_fifo_mm_s_0: axi_fifo_mm_s@43c00000 {
-	compatible = "xlnx,axi-fifo-mm-s-4.1";
-	interrupt-names = "interrupt";
-	interrupt-parent = <&intc>;
-	interrupts = <0 29 4>;
-	reg = <0x43c00000 0x10000>;
-	xlnx,axi-str-rxd-protocol = "XIL_AXI_STREAM_ETH_DATA";
-	xlnx,axi-str-rxd-tdata-width = <0x20>;
-	xlnx,axi-str-txc-protocol = "XIL_AXI_STREAM_ETH_CTRL";
-	xlnx,axi-str-txc-tdata-width = <0x20>;
-	xlnx,axi-str-txd-protocol = "XIL_AXI_STREAM_ETH_DATA";
-	xlnx,axi-str-txd-tdata-width = <0x20>;
-	xlnx,axis-tdest-width = <0x4>;
-	xlnx,axis-tid-width = <0x4>;
-	xlnx,axis-tuser-width = <0x4>;
-	xlnx,data-interface-type = <0x0>;
-	xlnx,has-axis-tdest = <0x0>;
-	xlnx,has-axis-tid = <0x0>;
-	xlnx,has-axis-tkeep = <0x0>;
-	xlnx,has-axis-tstrb = <0x0>;
-	xlnx,has-axis-tuser = <0x0>;
-	xlnx,rx-fifo-depth = <0x200>;
-	xlnx,rx-fifo-pe-threshold = <0x2>;
-	xlnx,rx-fifo-pf-threshold = <0x1fb>;
-	xlnx,s-axi-id-width = <0x4>;
-	xlnx,s-axi4-data-width = <0x20>;
-	xlnx,select-xpm = <0x0>;
-	xlnx,tx-fifo-depth = <0x8000>;
-	xlnx,tx-fifo-pe-threshold = <0x200>;
-	xlnx,tx-fifo-pf-threshold = <0x7ffb>;
-	xlnx,use-rx-cut-through = <0x0>;
-	xlnx,use-rx-data = <0x0>;
-	xlnx,use-tx-ctrl = <0x0>;
-	xlnx,use-tx-cut-through = <0x0>;
-	xlnx,use-tx-data = <0x1>;
-};
-- 
2.52.0

