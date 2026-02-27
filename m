Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B05346769
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 18:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772215906; cv=none; b=KUsrRXRc3CoFe1CbSXo+1jlRBRt9VQmZQCtF77SOEVx2bqU+oOaC3vlzaAUdD+SIgQB4igHL1zQVHS7xtfDN1WN6wulDTzZEW54vlNKSoiQDyf5xo0s7e3n+gl03OmFn9wtJBirDOjb1DAF+M8p9AG0AVLZj+y0R4fLO9oQFVWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772215906; c=relaxed/simple;
	bh=XWAiaEg3giyCSNqohDrR9hxdHZQYG1FpYSsqZ8vIro8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HtKvb2fn8Ij9u9BF0jqKX3Dtl4eoI+Tw0BmGMnzWEkYSFxaPSHHMHVYSrNM5TyTIBEXeE1Tb7kgDlY+c0Sq8ewe89FC+yVO7H+5lZoRJZmboIlBYrYMC43NLGBME87Y0kp+jRkHMt22oLtlyb/NQ7d2yzyoFfxq5/Hf/kdF9msE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cgtvGQ9N; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cgtvGQ9N"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56a8fdaddebso900941e0c.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 10:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772215904; x=1772820704; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sdc/44WGBox2HUFd0bST1/tq3dm9mCbBuKtI65dJSE=;
        b=cgtvGQ9N9FOoQNh0p8pTBe/b/E86W85idGpD9gEGGnne0UrpUsXKpd0HNNGKonuyj7
         z0tyHo/7NHKumsb9WoNEgJdYd0EhvxRZjqYMO8SZeI6RCycdVLp4af3cbvz8gJLY1f7n
         3GawwnfQdWYQFnpHIXddaZv8PLoZl2fyu65WzyjcyU0fXClfuQa8ZOT/xyY04aT1SgLa
         FfOVyAmUz0A/E9Rf/ewc1xTKCMbMaj0PQcpMr0Llw+vX1q46Gsfn2oWFK7oVTYMu7Duq
         4aQLSgyuzMwIm7HrXK/3mDJUKOMbP2faDPWqBr6TS5aO7PV1IqndXUbEJUsKftLiQjJI
         b6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772215904; x=1772820704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2sdc/44WGBox2HUFd0bST1/tq3dm9mCbBuKtI65dJSE=;
        b=HudytpKR95fabrfO2bb6+9/ceBkBRM1z1JAC9zniYYewlAl0ulCiWP7xukqZXkmClI
         OtwxKz4coGbQN5t3o5Wd8dv8+oAtJ2hOGSvLd22CLXvJXlw+VQa182xc/ZDXpMqfWA8c
         h24yTpoFxI9NWrxwmCsH/Ap8aWSPJmntvhVghBSoXEcw5ci3UzOQOmkM2RVpWsH8fKJd
         ZBkvmy6vT0dBVU/HUxie6DjyZW4QoSMIzp8OwOPY+3U77r6MGjv1ipV2UApIJlgqAN8R
         T2xM3DiwjhvDXI/R29H6fcAGnt1OpTsW8kkQJiqmgmIggw2Y3Uawvacwyx+H9DC0eke3
         KlEg==
X-Forwarded-Encrypted: i=1; AJvYcCV3MVkWBJp3ZWKlfxfVp4cNvbWAr7DV2mo1NygtAhCKOoPipU+83oyFQ4QBGENjVb1Q14mESPga+xhsIYIv@lists.linux.dev
X-Gm-Message-State: AOJu0YwWp0ttVbSI/GefBAWkDZ1o2X1v6UzWeP9KGr5KyVG5jXnE7Qyp
	YumZkJ/Ha1VEEVYINvMXD+PiaUrr2UxcJXISarXdiFrqPOLJelBQlSLAqptyJ/tNXyc=
X-Gm-Gg: ATEYQzygHSgy8T7PcvPPkPGkbNcryCx+jYmAwD8CzfHOrKhPJsCjFBQpw4jsgHd3XO0
	cyciUwzEWMVC4SI56KBFyq4tpQDD00v/7YxSKLgEHD7FhS0T/M2iU2oxc/gv8Fb+3EInuUCgvLt
	8Q4921JbIvtQFXeaseMjrwDsOoSECU6ERsvIByeyrCFurtIi01StURmOZKUfLFiHxFcxA0Yt9N6
	jCNeWxJa1N5eYugZl302d1mQTlwetFIkBaI3D4S2HXHJQlgm4+4S5eztol47RcdRpy1XtM0Hz0T
	nMAiEF3VLBPtqfwwYJW8uzQD4us/j1EBQ4hGu5lfHSpT9SmEUCICjNnyD8uJQ2vhv88ePocpIAV
	g+lXdx5FKvoJkFeFbLoN6VfJbxAelXmqPsbd5xG2HtWM7sV0cG/E+fPVbxAt5HIHvfsSg55v1Hy
	rNX5IhwEMZLZ+zVtcHbM9EefvUkrw12lrzUj4=
X-Received: by 2002:a05:6102:290c:b0:5df:8f4:61e6 with SMTP id ada2fe7eead31-5ff32528fcamr2072306137.32.1772215904406;
        Fri, 27 Feb 2026 10:11:44 -0800 (PST)
Received: from nixos ([2804:1b1:b880:4e06:554b:5779:2074:421f])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a92049d05sm7452905e0c.12.2026.02.27.10.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 10:11:43 -0800 (PST)
From: Lucas Faria Mendes <lucas.fariamo08@gmail.com>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ovidiu.panait.oss@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Lucas Faria Mendes <lucas.fariamo08@gmail.com>
Subject: [PATCH v2 2/3] dt-bindings: misc: xlnx,axi-fifo-mm-s: convert to json-schema
Date: Fri, 27 Feb 2026 15:10:44 -0300
Message-ID: <20260227181051.36207-3-lucas.fariamo08@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227181051.36207-1-lucas.fariamo08@gmail.com>
References: <20260227-unboxed-customary-7ce6eda1858c@spud>
 <20260227181051.36207-1-lucas.fariamo08@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 .../bindings/misc/xlnx,axi-fifo-mm-s.yaml     | 91 ++++++++++++++++++
 drivers/staging/axis-fifo/axis-fifo.txt       | 96 -------------------
 2 files changed, 91 insertions(+), 96 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
 delete mode 100644 drivers/staging/axis-fifo/axis-fifo.txt

diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
new file mode 100644
index 000000000000..967d681f3980
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
@@ -0,0 +1,91 @@
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
+    description:
+      AXI-Stream RX data width in bits. Only 32-bit is supported.
+
+  xlnx,axi-str-txd-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
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
+
+additionalProperties: false
+
+examples:
+  - |
+    dma-controller@43c00000 {
+        compatible = "xlnx,axi-fifo-mm-s-4.1";
+        reg = <0x43c00000 0x10000>;
+        interrupt-names = "interrupt";
+        interrupt-parent = <&intc>;
+        interrupts = <0 29 4>;
+        xlnx,axi-str-rxd-tdata-width = <32>;
+        xlnx,axi-str-txd-tdata-width = <32>;
+        xlnx,rx-fifo-depth = <512>;
+        xlnx,tx-fifo-depth = <32768>;
+        xlnx,use-tx-data;
+    };
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

