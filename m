Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CFE46AF25
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 20:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772222967; cv=none; b=Bm3SQj/hdupbg4bu+ZaJTfmLIZ3HpQmNWSnaIlLiGTkx17OuvhWuzhrj2xuIOOW+Zo9YmCT4j8pnaS2z/22MMUiLsQzZgXAA9M5lC4wJJnq71SI6xfoQHP6HTGsJXTcCe0mzz++VYed8nOTFAVIV/t8lVkqQ3YgOUItxLqfhvsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772222967; c=relaxed/simple;
	bh=vSZQQRG/U3IqpVWyqxBg5ON/SaXSy+ijC6dy2tk6QNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EenxsOf3ySp9BUDPTiRde4aqePSCPq614NF5U+ikzwUrLEueu6yVIuDLg0iCSp79lbnb9yAaqZPiXPfxBsujaQznCJwHC9nEyRQRrTODOXFR4WkzN5Jt4lhFx1ldiXFkPH1xCypnfenx+FfMC1l5LGOkSv5bFZbIb6t315u4ylw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SnY8Wik4; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SnY8Wik4"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5ff0c095b69so1518652137.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 12:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772222955; x=1772827755; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1dJmF9hqgVYfbfdMZ4xY0oiqyHg2iwadEH7EM4qB1U=;
        b=SnY8Wik4Ial4Wz6bFjBh1t0IydAfUHfBlanJRlwb8SX5N7fgTsqKDteWJ6HvVz7qHV
         KtG0wdAp0GkFKcrVWKdAbnx0QG7jI97EvD1L/yVDYFYwT0zuaEJPN9LzBY/uEamXfqz/
         E0jxi4NX9zPqR3Slu8H7pEGNJgjWlYbI76Ts0JQnJt5udqVfEGK5+tVJZK3hG6t9e4YZ
         Z7ehuyFLDR7Oy96mSCIEOHMOSyETyMhfERDijY4B5kl7GsVIWxoopTWnqRkzFgtTDHto
         z1QfLAlDTA2MOPyHKkAodDGQV7ovFcxUtL8ZBC08RpI5Xc+5gRTyDShBM92KDtaVqBio
         AGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772222955; x=1772827755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X1dJmF9hqgVYfbfdMZ4xY0oiqyHg2iwadEH7EM4qB1U=;
        b=SmB3SQKhjUE00p8sKAoRy20A85DT5io0p9KL7iooSceX7O+TRKPFAQQo9/0fapbSZx
         x+TZNhOkJ4suxKsyGmMGIfC8GoBalPcqR/6QoGa4kbLIhAaWrDmJeIpWfCE4o5KPIoYp
         xubY3noWTtVGzwrcscoEZnlWhyw7xGSPZZhg1BmsxaBMz1jXu81l91duVYPM3PVapBHt
         0nLnMNK7iiVIbhl8sOS0lotB4NHgyLailuLtCG5vYY0SpTFIqaW9rrp+0yIRjDVe0hiR
         IXhLcvD8Dj9MaijcVenIFAmTO3vCnCCBDydIO669HFd7DWnnmLskd89Pe2gGledVz/NS
         CMvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzpEFfLxoWGqQbcFTMGLBibCPNHe1n5n0OAYcyvYMshVa8Dj+g1ATuc4rKx9tHk9wdyNV1TejhRaeR6TZQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzadolX91zAsfCtvCWi+yCWRqrjhqmPh6MOCThjklMCGmfgINzG
	m69hhabyZJiPquZjRB3n2jeEIRfavIB6uD4dT+s/8/lBT32sFaD+FQlE
X-Gm-Gg: ATEYQzzdBOku794GJkxI70Cyq3zt9j1zi6KOgPgiZpkLZScHvtO2/TSxGt4UtZzmUJG
	Y3Zm00K3GC2QzSGdf3/ya8IACRW6hKmA3i/UyXvhW3oSBvBACwN2q0Y6Ce1qBFqCeTE+rksPKda
	Fwro+6DwtLOGEwu8gpAMn7N/FeY80PDhrg/SE25aP6IFvh5AVZSURSHirwecOvEh4k4SIyCfGfq
	iPAg0aKiFqmZFKsXh9j3MdAjZ1vl7Q0tQR1HuPGcY0zTGwMTHptkWw+HixXlZKsmkQ9T53dBZCw
	O2vrok/KFZPSeK6KSTQ09OhSAeZlhdb2BQitjrC+t0Q/r4Ep7x1FsmhjWbg7NsEuC9yilgB91is
	sgh0iLah02X2AaYklbkiHr4UEGJwkf2lVysbki/YzReRarM8TzVIAQ+dmuSNX90HA4PXy1B2AEG
	snNcUV1w+XN55FldpoMxlBfRHJ
X-Received: by 2002:a05:6102:32d1:b0:5f5:3dbd:7007 with SMTP id ada2fe7eead31-5ff3227404cmr2552886137.4.1772222954939;
        Fri, 27 Feb 2026 12:09:14 -0800 (PST)
Received: from nixos ([2804:1b1:b880:4e06:554b:5779:2074:421f])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1ea6f7fesm6479027137.13.2026.02.27.12.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 12:09:14 -0800 (PST)
From: Lucas Faria Mendes <lucas.fariamo08@gmail.com>
To: gregkh@linuxfoundation.org,
	ovidiu.panait.oss@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Lucas Faria Mendes <lucas.fariamo08@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: misc: xlnx,axi-fifo-mm-s: convert to json-schema
Date: Fri, 27 Feb 2026 17:08:43 -0300
Message-ID: <20260227200857.50880-2-lucas.fariamo08@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227200857.50880-1-lucas.fariamo08@gmail.com>
References: <20260227200857.50880-1-lucas.fariamo08@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Xilinx AXI-Stream FIFO IP core bindings from legacy text
format to modern YAML json-schema.

While converting, the following changes were made:
- Updated property types for 'xlnx,use-rx-data' and 'xlnx,use-tx-data'
  from uint32 to boolean, as they represent hardware features.
- Removed the rigid 32-bit constraint on data width properties to
  better reflect hardware capabilities.
- Renamed the example node to "fifo" to follow generic naming conventions.
- Removed the legacy text binding file.

Signed-off-by: Lucas Faria Mendes <lucas.fariamo08@gmail.com>
---
 .../bindings/misc/xlnx,axi-fifo-mm-s.yaml     | 95 ++++++++++++++++++
 drivers/staging/axis-fifo/axis-fifo.txt       | 96 -------------------
 2 files changed, 95 insertions(+), 96 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
 delete mode 100644 drivers/staging/axis-fifo/axis-fifo.txt

diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
new file mode 100644
index 000000000000..b3e6a2189289
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/xlnx,axi-fifo-mm-s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx AXI-Stream FIFO IP core
+
+maintainers:
+  - Jacob Feder <jacobsfeder@gmail.com>
+
+description: |
+  The Xilinx AXI-Stream FIFO IP core has read and write AXI-Stream FIFOs,
+  the contents of which can be accessed from the AXI4 memory-mapped interface.
+  This is useful for transferring data from a processor into the FPGA fabric.
+
+  See Xilinx PG080 document for IP details.
+
+  Currently supports only store-forward mode with a 32-bit AXI4-Lite
+  interface.
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
+    items:
+      - const: interrupt
+
+  xlnx,axi-str-rxd-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 32
+    description:
+      AXI-Stream RX data width in bits. Only 32-bit is supported.
+
+  xlnx,axi-str-txd-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 32
+    description:
+      AXI-Stream TX data width in bits. Only 32-bit is supported.
+
+  xlnx,rx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Depth of RX FIFO in words.
+
+  xlnx,tx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Depth of TX FIFO in words.
+
+  xlnx,use-rx-data:
+    type: boolean
+    description: RX FIFO is enabled.
+
+  xlnx,use-tx-data:
+    type: boolean
+    description: TX FIFO is enabled.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - xlnx,axi-str-rxd-tdata-width
+  - xlnx,axi-str-txd-tdata-width
+  - xlnx,rx-fifo-depth
+  - xlnx,tx-fifo-depth
+  - xlnx,use-tx-data
+
+additionalProperties: false
+
+examples:
+  - |
+    fifo@43c00000 {
+        compatible = "xlnx,axi-fifo-mm-s-4.1";
+        reg = <0x43c00000 0x10000>;
+        interrupt-names = "interrupt";
+        interrupt-parent = <&intc>;
+        interrupts = <0 29 4>;
+        xlnx,axi-str-rxd-tdata-width = <0x20>;
+        xlnx,axi-str-txd-tdata-width = <0x20>;
+        xlnx,rx-fifo-depth = <0x200>;
+        xlnx,tx-fifo-depth = <0x8000>;
+        xlnx,use-tx-data;
+    };
+
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
2.53.0

