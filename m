Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C63B411F80
	for <linux-staging@lists.linux.dev>; Wed, 16 Sep 2026 20:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789589598; cv=none; b=Gdo6GgLNwuz264WK8/t4qgz+DqGL81dvI6DQgOhD3uJBuPUUQ5gYR2pIIVHtaxcVm/TARCOdo5y2r40ArJNd0/zRKHUiVaxdU/Bz7ujHyh7xaxkfri7sRm0fFovSGeqOf7SarZJKjtzCp7MZG6A0V1KCwUa2Ikg52nM17yRhAfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789589598; c=relaxed/simple;
	bh=uwMGDDuWtKUoJStwXibNUSxN2BNOlX8rRHbGS9jiREE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=IBW6+ecDAkmEzh77Tco9T+u9oZs80v8I5t3B1JktACb87i3hI8XtkRfT8xKO5rK1dX+vjEQ4kCT+u6oDqdfj4DlFq8qy9rBfUj8NgSUZFCNynTebqxPa7IAc7XhBHMNF4mWr1QqRPrCoHGq0vkX/CLjZTWyrB1uLKPz0cywL5TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DkE3W7Bo; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DkE3W7Bo"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so626145e9.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Sep 2026 13:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789589580; x=1790194380; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aYhx8ZxTsScYWYyqDbVe9Rlssw/WyreTZuU/4EjcUrc=;
        b=DkE3W7BoA2zSBB5Sp7GK6jqjCkhB/LZa9JabRmYpUq2EETBiE1DuL5HfUFq4rU7Bsz
         c0D4OcgLGp8VX8/g3aSAnVVIKpo5FaQohD6/x5OqPLWfIHXh6ldmG2KYC9efdhHjN73x
         SKgQHdNvcuGiA8C+yQIpwrGRt+mqLJY+ebG1IEcAdKuazneT47nRY9kfUZ4pisRLWCpy
         bhniZiOyp12msy6iAN9fyQuaET0f8mjGtpuOVOf0bwvhhpQIol+SOKu5NfW6PviHEW6I
         MRDdIzxW+2ZS8ORETw1Kb1RtKccOasoarLZQQrPXAbe6un0cQ6CGBb6K/VlzVl4c+AAE
         omHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789589580; x=1790194380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aYhx8ZxTsScYWYyqDbVe9Rlssw/WyreTZuU/4EjcUrc=;
        b=THb1xFsNzd2jcpZBKAzEWPHKljAAY23pgVtPDDPlgUbjBzc0tsVPHFYMBYXqVDyaC8
         w9TE77SsErJPGXddXvQqOccGSTEhj0LnKKHjDcNrjf1//NoF1hVasdpuil+qoBPbCjmU
         HWaHykWYwvahHGMcNwMwjOdKL2LfGNRPg9Nu6BAQVPhNUGwDA7pFEgVHu2DJfoKMbH8o
         etZdzHGrAnsPzrSEszmsTh0PO7JC8hC7cMXTiLMTM2Sx3DmLZfqAVoNyC1sXXdhT+aq+
         s7w4HvqyJVLzsTOkvx1ReEAgGPnO260uTAVugiVuu+coU8tvvNcR+vdQedsB1kszNRKT
         Sekw==
X-Forwarded-Encrypted: i=1; AKwUvByyPEYhBi4DMgrC/VC483gshp216w1MwEPjw/tqSRj5bPnbMXtTTib9l+Da5x7sIvuMVRcic0VQleLhiAAk@lists.linux.dev
X-Gm-Message-State: AFuF++mkb1la2E2E37LesLxVLiii0oGFg5MkYe8Q15BdC6TIlEEVh7jq
	PNPmkX04Ig8ib8lS8/hEgLt3YCn0CEWU0sXdF0NoF6stP//ZUTAZ5Q8Y
X-Gm-Gg: AYBFou0UbPAZ4iQ5kQCforjbMNLDgUHIJqA9cjrpmlR7FAHs/GUkq0Ig9Nau9FPt/XP
	9lHQyQ+W1GBzWvKMJwHh0VBIY2c9QOehpgdNerOvcXlGgfXNvohob4IsxZ2nyUYDUaTecA2HY2M
	o6CXXsUB2QVs8vw1/GSTG4sHu87k4nRUoNpkvhbxDR+KJfN1deFtErEwC+gww9r+NOUVyxKP9qc
	cDcUyv+D5idZlj0Ncp2SL3Ni2V3A9koKi+9nvpztiOqWGjGOWdhV8AbOq5Qgs9nXPvJ9WYw5GXA
	iJwRVNGJkoBeGiEgZgfRhBPtylb73iP2U8sTLK6FJQ86Hjt+pCLotQ2dHg3Lg0VS8f4bzfNWRqz
	0o2mKP0+E9YW1WmL9XE1KPl6lxcufeYQcBqqR5JWguiI1VFVn90hEd8ZLUmF+reQoRBCx12/Csa
	e8mRLtAx3/bYlP2KZGlyI8hKlKN7nhmCjItHXzhtdW5lRR8HBPTA7cP0qgbpz9ayMSLB7HcPqW2
	rIZSMR2uY7SBS6G
X-Received: by 2002:a05:600c:1f96:b0:49e:817a:ca7 with SMTP id 5b1f17b1804b1-49eb51902d9mr45307715e9.8.1789589580117;
        Wed, 16 Sep 2026 13:13:00 -0700 (PDT)
Received: from chicken.. ([2a02:2f02:5101:7300:ce1c:cd76:6ea7:d213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbda77d6fsm5484125e9.0.2026.09.16.13.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 13:12:59 -0700 (PDT)
From: Daniel Matyas <matyasdaniel005@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matyasdaniel005@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] dt-bindings: axis-fifo: Added missing binding
Date: Wed, 16 Sep 2026 23:11:50 +0300
Message-ID: <20260916201253.483877-1-matyasdaniel005@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drivers/staging/axis-fifo/axis-fifo.txt file described how the
devicetree of the driver should look like. Convert it to .yaml file.
Issue found by checkpatch.

Signed-off-by: Daniel Matyas <matyasdaniel005@gmail.com>
---
 .../axis-fifo/xlnx,axi-fifo-mm-s.yaml         | 257 ++++++++++++++++++
 1 file changed, 257 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/axis-fifo/xlnx,axi-fifo-mm-s.yaml

diff --git a/Documentation/devicetree/bindings/axis-fifo/xlnx,axi-fifo-mm-s.yaml b/Documentation/devicetree/bindings/axis-fifo/xlnx,axi-fifo-mm-s.yaml
new file mode 100644
index 000000000000..ef1e6bcf782d
--- /dev/null
+++ b/Documentation/devicetree/bindings/axis-fifo/xlnx,axi-fifo-mm-s.yaml
@@ -0,0 +1,257 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/axis-fifo/xlnx,axi-fifo-mm-s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx AXI-Stream FIFO v4.1 IP core
+
+maintainers:
+  - Daniel Matyas <matyasdaniel005@gmail.com>
+
+description: |
+  This IP core has read and write AXI-Stream FIFOs, the contents of which can
+  be accessed from the AXI4 memory-mapped interface. This is useful for
+  transferring data from a processor into the FPGA fabric. The driver creates
+  a character device that can be read/written to with standard
+  open/read/write/close.
+
+  See Xilinx PG080 document for IP details.
+
+  Currently supports only store-forward mode with a 32-bit AXI4-Lite
+  interface. DOES NOT support:
+    - cut-through mode
+    - AXI4 (non-lite)
+
+properties:
+  compatible:
+    enum:
+      - xlnx,axis-fifo-mm-s-4.1
+      - xlnx,axis-fifo-mm-s-4.2
+      - xlnx,axis-fifo-mm-s-4.3
+
+  interrupt-names:
+    const: interrupt
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  xlnx,axi-str-rxd-protocol:
+    $ref: /schemas/types.yaml#/definitions/string
+    const: XIL_AXI_STREAM_ETH_DATA
+    description: AXI4-Stream RX data protocol
+
+  xlnx,axi-str-rxd-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x20
+    description: AXI4-Stream RX data width
+
+  xlnx,axi-str-txc-protocol:
+    $ref: /schemas/types.yaml#/definitions/string
+    const: XIL_AXI_STREAM_ETH_CTRL
+    description: AXI4-Stream TX control protocol
+
+  xlnx,axi-str-txc-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x20
+    description: AXI4-Stream TX control data width
+
+  xlnx,axi-str-txd-protocol:
+    $ref: /schemas/types.yaml#/definitions/string
+    const: XIL_AXI_STREAM_ETH_DATA
+    description: AXI4-Stream TX data protocol
+
+  xlnx,axi-str-txd-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x20
+    description: AXI4-Stream TX data width
+
+  xlnx,axis-tdest-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: AXI-Stream TDEST width (ignored by the driver)
+
+  xlnx,axis-tid-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: AXI-Stream TID width (ignored by the driver)
+
+  xlnx,axis-tuser-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: AXI-Stream TUSER width (ignored by the driver)
+
+  xlnx,data-interface-type:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: ignored by the driver
+
+  xlnx,has-axis-tdest:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: this feature isn't supported
+
+  xlnx,has-axis-tid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: this feature isn't supported
+
+  xlnx,has-axis-tkeep:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: this feature isn't supported
+
+  xlnx,has-axis-tstrb:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: this feature isn't supported
+
+  xlnx,has-axis-tuser:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: this feature isn't supported
+
+  xlnx,rx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Depth of RX FIFO in words
+
+  xlnx,rx-fifo-pe-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: RX programmable empty interrupt threshold
+                 (ignored by the driver)
+
+  xlnx,rx-fifo-pf-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: RX programmable full interrupt threshold
+                 (ignored by the driver)
+
+  xlnx,s-axi-id-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x4
+    description: ignored by the driver
+
+  xlnx,s-axi4-data-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x20
+    description: ignored by the driver
+
+  xlnx,select-xpm:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: ignored by the driver
+
+  xlnx,tx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Depth of TX FIFO in words
+
+  xlnx,tx-fifo-pe-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: TX programmable empty interrupt threshold
+                 (ignored by the driver)
+
+  xlnx,tx-fifo-pf-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: TX programmable full interrupt threshold
+                 (ignored by the driver)
+
+  xlnx,use-rx-cut-through:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: this feature isn't supported
+
+  xlnx,use-rx-data:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0x0, 0x1]
+    description: <0x1> if RX FIFO is enabled, <0x0> otherwise
+
+  xlnx,use-tx-ctrl:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: this feature isn't supported
+
+  xlnx,use-tx-cut-through:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: this feature isn't supported
+
+  xlnx,use-tx-data:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0x0, 0x1]
+    description: <0x1> if TX FIFO is enabled, <0x0> otherwise
+
+required:
+  - compatible
+  - interrupt-names
+  - interrupts
+  - reg
+  - xlnx,axi-str-rxd-protocol
+  - xlnx,axi-str-rxd-tdata-width
+  - xlnx,axi-str-txc-protocol
+  - xlnx,axi-str-txc-tdata-width
+  - xlnx,axi-str-txd-protocol
+  - xlnx,axi-str-txd-tdata-width
+  - xlnx,axis-tdest-width
+  - xlnx,axis-tid-width
+  - xlnx,axis-tuser-width
+  - xlnx,data-interface-type
+  - xlnx,has-axis-tdest
+  - xlnx,has-axis-tid
+  - xlnx,has-axis-tkeep
+  - xlnx,has-axis-tstrb
+  - xlnx,has-axis-tuser
+  - xlnx,rx-fifo-depth
+  - xlnx,rx-fifo-pe-threshold
+  - xlnx,rx-fifo-pf-threshold
+  - xlnx,s-axi-id-width
+  - xlnx,s-axi4-data-width
+  - xlnx,select-xpm
+  - xlnx,tx-fifo-depth
+  - xlnx,tx-fifo-pe-threshold
+  - xlnx,tx-fifo-pf-threshold
+  - xlnx,use-rx-cut-through
+  - xlnx,use-rx-data
+  - xlnx,use-tx-ctrl
+  - xlnx,use-tx-cut-through
+  - xlnx,use-tx-data
+
+additionalProperties: false
+
+examples:
+  - |
+    axi_fifo_mm_s_0: axi_fifo_mm_s@43c00000 {
+      compatible = "xlnx,axi-fifo-mm-s-4.1";
+      interrupt-names = "interrupt";
+      interrupt-parent = <&intc>;
+      interrupts = <0 29 4>;
+      reg = <0x43c00000 0x10000>;
+      xlnx,axi-str-rxd-protocol = "XIL_AXI_STREAM_ETH_DATA";
+      xlnx,axi-str-rxd-tdata-width = <0x20>;
+      xlnx,axi-str-txc-protocol = "XIL_AXI_STREAM_ETH_CTRL";
+      xlnx,axi-str-txc-tdata-width = <0x20>;
+      xlnx,axi-str-txd-protocol = "XIL_AXI_STREAM_ETH_DATA";
+      xlnx,axi-str-txd-tdata-width = <0x20>;
+      xlnx,axis-tdest-width = <0x4>;
+      xlnx,axis-tid-width = <0x4>;
+      xlnx,axis-tuser-width = <0x4>;
+      xlnx,data-interface-type = <0x0>;
+      xlnx,has-axis-tdest = <0x0>;
+      xlnx,has-axis-tid = <0x0>;
+      xlnx,has-axis-tkeep = <0x0>;
+      xlnx,has-axis-tstrb = <0x0>;
+      xlnx,has-axis-tuser = <0x0>;
+      xlnx,rx-fifo-depth = <0x200>;
+      xlnx,rx-fifo-pe-threshold = <0x2>;
+      xlnx,rx-fifo-pf-threshold = <0x1fb>;
+      xlnx,s-axi-id-width = <0x4>;
+      xlnx,s-axi4-data-width = <0x20>;
+      xlnx,select-xpm = <0x0>;
+      xlnx,tx-fifo-depth = <0x8000>;
+      xlnx,tx-fifo-pe-threshold = <0x200>;
+      xlnx,tx-fifo-pf-threshold = <0x7ffb>;
+      xlnx,use-rx-cut-through = <0x0>;
+      xlnx,use-rx-data = <0x0>;
+      xlnx,use-tx-ctrl = <0x0>;
+      xlnx,use-tx-cut-through = <0x0>;
+      xlnx,use-tx-data = <0x1>;
+    };
+...
-- 
2.43.0

