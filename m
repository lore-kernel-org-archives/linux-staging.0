Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE094375AC6
	for <linux-staging@lists.linux.dev>; Sat, 19 Sep 2026 02:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789786749; cv=none; b=gvpW/lGCWy+uH7GgzUT6d1vPnKG5AQ2h3uODEPIodH6uSH5lSPW5a01Ioj51AElXudDXHm+5tgYAUI6HOJYH3iZHQVgCq93f3JWhdR99qS41p3vhQLynXx4+OK/U1gu2Ad1xtstgDD9JRgZaZIeNzoE7Ss1/NNCavm743P3mEj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789786749; c=relaxed/simple;
	bh=7SO7huozNpC8xsd0EcEChJm70n1+Di7oMJy3Qo+WZec=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aeEnVmTMA/uGaQrc7zgdObn8+73Wk8FTkXw3DaO9yiO+1+PYRMFsofQ7zKrccrN3B6jsOPJuZpX8WokOcpW1TddeBvfs6z5dHTXGii4oENRxB7hbst/jMhtj/cwK08KI3y6xZZFkxdFS4Z8210Bn8OOm7KEvwg7jvm27Mmj21Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABErGaSO; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABErGaSO"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-4693691fde7so984906fac.3
        for <linux-staging@lists.linux.dev>; Fri, 18 Sep 2026 19:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789786746; x=1790391546; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oWNlP+9LIuJK/Y0IQA0euuofWcsmhE5Bep7bJpGdEx0=;
        b=ABErGaSOvSo1PupDt2nUK+o2uLGLUTEBVlhT68oHkMpcniFvPfb1cXC25j+J6cOtmu
         yLonTfAM2zhk2rlHyLEyQGmTZ2VUfXOxdsP+GvI3lNDJRbSSgYbVL8hw300xzdOaGWPj
         MpX626nhRnan5zUDr7InTS+YM+x3E4REs3aaGrpjQfas2+HT/aqQi0Sz514djXQAyu59
         JICxNqOMTfLJYLpaZQV5o4MYNJjIsxIvFffOGwenO9qQnrrgY8aes6wXeXjGVUNkbJEZ
         7IglTZHNFiOAWle1DrCvrOFE6GNItrQHQuUk6VHnFZf35H90ppwzQ5CZHxlj5I+wMcRB
         LxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789786746; x=1790391546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oWNlP+9LIuJK/Y0IQA0euuofWcsmhE5Bep7bJpGdEx0=;
        b=C81Wf5jEU3wt/jGN30OVcs/whaLluSeWuUTwVyOMKwWnzL0GEyIlJ2xnH3YqOYM0Xu
         nUrbKd5yUrACBpl4UaObeQOLNC/yAx7jVJRvLIIBb29DHtIZgmL89hqDbAkOogzUSDbh
         rplAL/D8YU9fiVOMnYbPBb0JrBiZVXRDCfyKyIrLF7GyL1WfcoNx3GPsGzhEm8DDT1Ps
         Mb7YxxZ4ELB+mQ/hHUww7/aSrpWtw5fObn7oetcvQbscXQ/+WsjYNX4s91uzl72RJm/z
         nzUN8StIAmfQ70PqfhaDt55dzRe92huZTM7x6Ml12AUQJL82sV98DlKYmx8FUDDK9uJ0
         VoaA==
X-Forwarded-Encrypted: i=1; AKwUvBwUsKt+xIUyggjLpM6X/jI68n8WqxzTtJQtk1U1f1DdS0khewx6qVlc58fqX37Uam+wyz6oaLUcDDxIuSg/@lists.linux.dev
X-Gm-Message-State: AFuF++m4Rfwm9+0A/Hy6JNtAygiHcsUJgFzpMAWefJbucQy+0IomIAd5
	QhlS/6or7RaxmIffKjruWsnJwrb5J2aP8Ulhdpysu/IKcxkIqI2sP3tC
X-Gm-Gg: AYBFou0J9w+bLmC6Go/X4KQTUWSsjY66CiNpEkYILK/GzVsb/8OKFki3sMPpESA6GVM
	Fe5kUAohXWRsePq2EwRwN3TiA1GKxSefTxylrdln0Qu9tOChSHvZdB2aq0G+8+bJ4FsodFEN8Ez
	/0iquubuysOy3dsxhtxywORDinPBYDto5bIomgd66fJiArTfgbzQjNdtMBUyoxIPUhSqPZvyc4e
	dA1PIw2ASVQqh5w2sDcsKqUudOZipeUa/LqdWcO0GaLfSpcESWbpW/JjvviVAV0S/KSBa1WyT7x
	PlfTwSrCoX4Lu8I5qqVYIgeHwA7CCVVuWeBtEoEJitueck8jcUiM2gawXYBP0+3HXj/nvIL3XQk
	Pzxmk8clSDk12BRaNNUerMMPfJO4eU50KnluK6zK61k0GMm/vHMDQVOwuPI3YZXh+37djYhaSU+
	GZBQodaTAw7HZT/tWQc8aZvGMAKfztEbO6cjcNppMnhLfkmqAF7gDxQqEQZiF6rBtTlW5j1GZLx
	wcMIg09L/+gfBZ/OAAuDR/vJXpM1wozv/OmHXzbKnMVTeo+RM18mbzrEp0dF1NLVO3hPTiUgQ==
X-Received: by 2002:a05:6820:3393:10b0:6cd:3fec:de81 with SMTP id 006d021491bc7-6cd3fecf3ffmr1084365eaf.87.1789786746555;
        Fri, 18 Sep 2026 19:59:06 -0700 (PDT)
Received: from DESKTOP-FG7FD3B.localdomain (fixed-187-189-149-136.totalplay.net. [187.189.149.136])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6cd2ea874c3sm1904355eaf.0.2026.09.18.19.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 19:59:05 -0700 (PDT)
From: Daniel28972897 <danyboy28sep@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Daniel28972897 <danyboy28sep@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: misc: convert axis-fifo binding to YAML
Date: Fri, 18 Sep 2026 20:58:59 -0600
Message-Id: <20260919025900.169703-2-danyboy28sep@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260919025900.169703-1-danyboy28sep@gmail.com>
References: <20260919011417.156828-1-danyboy28sep@gmail.com>
 <20260919025900.169703-1-danyboy28sep@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert drivers/staging/axis-fifo/axis-fifo.txt to a YAML schema
under Documentation/devicetree/bindings/misc/, so it is checked by
dtbs_check and by checkpatch.pl's undocumented-compatible warning.

The FIFO depth properties are documented as being in 32-bit words,
matching the original text binding and the driver's own arithmetic
in axis_fifo_write(), not bytes as an earlier draft of this schema
incorrectly stated.

All properties from the original text binding are preserved,
including ones the driver itself ignores, since they are generated
unconditionally by the Xilinx IP integrator and may be present in
real-world devicetree sources.

Signed-off-by: Daniel28972897 <danyboy28sep@gmail.com>
---
 .../bindings/misc/xlnx,axi-fifo-mm-s.yaml     | 150 ++++++++++++++++++
 1 file changed, 150 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml

diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
new file mode 100644
index 000000000000..fffd69b12811
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
@@ -0,0 +1,150 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/xlnx,axi-fifo-mm-s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx AXI4-Stream FIFO MM S IP core
+
+maintainers:
+  - Daniel <danyboy28sep@gmail.com>
+
+description:
+  The Xilinx AXI4-Stream FIFO MM S IP core has read and write AXI-Stream
+  FIFOs, the contents of which can be accessed from the AXI4 memory-mapped
+  interface. This is useful for transferring data from a processor into
+  the FPGA fabric. See Xilinx PG080 for details.
+
+  Currently the Linux driver supports only store-forward mode with a
+  32-bit AXI4-Lite interface, and does not support cut-through mode or
+  full (non-lite) AXI4.
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
+    const: interrupt
+
+  xlnx,axi-str-rxd-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 32
+    description:
+      Width, in bits, of the AXI4-Stream receive data interface. Only 32
+      is currently supported by the driver.
+
+  xlnx,axi-str-txd-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 32
+    description:
+      Width, in bits, of the AXI4-Stream transmit data interface. Only 32
+      is currently supported by the driver.
+
+  xlnx,rx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Depth, in 32-bit words, of the receive FIFO.
+
+  xlnx,tx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Depth, in 32-bit words, of the transmit FIFO.
+
+  xlnx,use-rx-data:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description:
+      Whether the receive data path is present in this IP core instance.
+
+  xlnx,use-tx-data:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description:
+      Whether the transmit data path is present in this IP core instance.
+
+  # The following properties are generated by the Xilinx IP integrator
+  # for this core and may be present in real-world devicetrees, but are
+  # not currently read by the Linux driver.
+  xlnx,axi-str-rxd-protocol: true
+  xlnx,axi-str-txc-protocol: true
+  xlnx,axi-str-txc-tdata-width: true
+  xlnx,axi-str-txd-protocol: true
+  xlnx,axis-tdest-width: true
+  xlnx,axis-tid-width: true
+  xlnx,axis-tuser-width: true
+  xlnx,data-interface-type: true
+  xlnx,has-axis-tdest: true
+  xlnx,has-axis-tid: true
+  xlnx,has-axis-tkeep: true
+  xlnx,has-axis-tstrb: true
+  xlnx,has-axis-tuser: true
+  xlnx,rx-fifo-pe-threshold: true
+  xlnx,rx-fifo-pf-threshold: true
+  xlnx,s-axi-id-width: true
+  xlnx,s-axi4-data-width: true
+  xlnx,select-xpm: true
+  xlnx,tx-fifo-pe-threshold: true
+  xlnx,tx-fifo-pf-threshold: true
+  xlnx,use-rx-cut-through: true
+  xlnx,use-tx-ctrl: true
+  xlnx,use-tx-cut-through: true
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
+    fifo@43c00000 {
+        compatible = "xlnx,axi-fifo-mm-s-4.1";
+        reg = <0x43c00000 0x10000>;
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
+        xlnx,rx-fifo-depth = <512>;
+        xlnx,rx-fifo-pe-threshold = <2>;
+        xlnx,rx-fifo-pf-threshold = <507>;
+        xlnx,s-axi-id-width = <4>;
+        xlnx,s-axi4-data-width = <32>;
+        xlnx,select-xpm = <0>;
+        xlnx,tx-fifo-depth = <32768>;
+        xlnx,tx-fifo-pe-threshold = <512>;
+        xlnx,tx-fifo-pf-threshold = <32763>;
+        xlnx,use-rx-cut-through = <0>;
+        xlnx,use-rx-data = <0>;
+        xlnx,use-tx-ctrl = <0>;
+        xlnx,use-tx-cut-through = <0>;
+        xlnx,use-tx-data = <1>;
+    };
-- 
2.34.1

