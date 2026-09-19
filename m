Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31A73B8D79
	for <linux-staging@lists.linux.dev>; Sat, 19 Sep 2026 01:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789780485; cv=none; b=M5NnbycJKY8WzrvNBTDQD8Oj3sr5spzBg2DpHDA2vq15A5/c5NvaQI1J+jnLztJ/NJVWtBt3X2/xY5k+JDpN9yd99jA6a17fDHxgCIBTrY+niDyeyrf0rhOjcZ1cyaF3TNYGLFumt5Z3kTtdcXXKLWYTpl2GEdtWtTE3re/MG/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789780485; c=relaxed/simple;
	bh=zqQ2Gc3YrVtSTqVH9pz+HHauXgCJZooWRhN+Ev9jLqY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QHLDuL8XMGmkzCLhnsWQEE0od+4g6vNu9wkBSpd3NxosRtbdZps0cXjcnmBfkK2T840OWh02iK5P0hoJOxNLqC5OTk1vtq6eEavC95TV+nudx8AMiF022JVKPZS+TxP7H5+At/nMQct1JMeNvWy0NhhU3QOWqhUedOGMMJHjCME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ss3fSC4C; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ss3fSC4C"
Received: by mail-oi2-f12.google.com with SMTP id 46e09a7af769-805c194bc92so1347411a34.1
        for <linux-staging@lists.linux.dev>; Fri, 18 Sep 2026 18:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789780462; x=1790385262; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pxKrnFCKVv+A/s21AGnSTz11SqzSXxKNsYK80fhyo7I=;
        b=ss3fSC4CFBjtJRfFQ9+vWIPPxpjhVWZiBc46kbjFNoHfbgwgIWqUs/denX2JurYw3x
         M2d1UEJiAzb6HQHrtvjbTrD48v6Kq93vqjaPkmMwPKtG0fK1IYT6a11dBjRhujXvBpDO
         GA2bja66SHShDcl/geoKDm9azjniggmgaW/43AuyvYzXAYNUAaNCPSMtGbYmpWPdJhRY
         I5LRAyV2dj+B4Z9KQfJAmKRKfASq2+MhhvX96BnoTnHb8kwdmhZXxlOekr8T16nYr6by
         cxmjk91K7jlda2/MPBw5nws1lMTkqv+IDyW+qAN33ITL579J7y2SgaYgshrdCAcWDjDL
         SoLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789780462; x=1790385262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxKrnFCKVv+A/s21AGnSTz11SqzSXxKNsYK80fhyo7I=;
        b=wG787DA4PdYrzf8B08SBEpVcemwxkuDMoRviyka51FCwEcWaxn4ueva5fpWuzOwHX7
         GX6iMJkv3Op5Qy/LQyrFM/5rpgpnq4oUUaOL/gfH2zONa5wlK6GLTpPu+x4D/Uq3MmGt
         2GvNcB3fYtaS6EU1FB5K/oVIl3YLCsE+G+gaSamXQ3ILk3AL+/YDCunml9vqatnNzMDf
         m/j4KXc3HETKSN5ODSEPYnE/JaNWeEZcAnIbf4PsPyU0ox08Uf0mqphZHW33wiQxIZle
         cLdMoB7ydBNDpWsPJt1W2m0RN/nNn1PCaMqTTYWlhLZJFH27en2XtEXb4LxfQ1VyDanT
         D/ZA==
X-Forwarded-Encrypted: i=1; AKwUvByQwbZQy0M5U3NJt9JXc2hirKV6VRZtD/aqx9OmO+2IKK4EJx7Q3WxFyjNogj673pQpntDfsn5eityMqYi1@lists.linux.dev
X-Gm-Message-State: AFuF++kbfFG6Gs3bo64ap0jnhml/fTs8CVyIrp49wGlZdWv5po/lxEji
	PfJtykx8k6/afL4ceRaC0OuDzXlI423baLMJ6uCJkKlmSCe876ttN1zW
X-Gm-Gg: AYBFou3ohie+5wV1/xbEDB5fsAvLlPCyTvnyBrH9Myv+4n8ftD1sv6eBNBBBszVtWXL
	Sl8TYZme13mv04mMABDrQIuYZZepPYbPzYGcp7UYU2k5ylCTa65nrwSYc1Fd0jgHKKuvOpq5i6E
	rlSK4FI5Xgb7/KpRsgxx9qsG30nHbulz0jbffLIfiUohvxc+3cwzg5t3Z8nMCAVsplbBi8TEQQ1
	IIEWIs3+r6NeWbB3hGujyHwJRF3gpFxeUS/67lELs4pQzfWEq64CztRokQNL9IdmzC3DDYjHWCQ
	udUFHzwEzNCQQrLRQVGNG8N/RRATnEjUJiv8/nRerGY7xHIwvS80CGnwARqW/yEdMdgePbBebO9
	HEsLK8waebBdwNmpOvBi2Ui+SEpWexLagCE3OHht42eW+0reg+HLztvTz4idkQhkrWFDLwlDOvb
	NdexxlbbZpwy4xMyJKKWK1mbiBkuNsvKTG45UMQOnr/9gfWlTEPB3tNaiAx895PXaE6l7PQmA3v
	E5JwYQ1/aXT+2sCIYdRBCZX2qevlEv2hdCCAlLpKgVTPcOyFcNBZWMtxxtUWdQM
X-Received: by 2002:a05:6830:3886:b0:80c:d30f:97d with SMTP id 46e09a7af769-80de33eccf5mr4941299a34.30.1789780462100;
        Fri, 18 Sep 2026 18:14:22 -0700 (PDT)
Received: from DESKTOP-FG7FD3B.localdomain (fixed-187-189-149-136.totalplay.net. [187.189.149.136])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8107eea55c8sm1317188a34.26.2026.09.18.18.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 18:14:21 -0700 (PDT)
From: Daniel28972897 <danyboy28sep@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Daniel28972897 <danyboy28sep@gmail.com>
Subject: [PATCH] dt-bindings: misc: add binding for Xilinx AXI4-Stream FIFO MM S
Date: Fri, 18 Sep 2026 19:14:17 -0600
Message-Id: <20260919011417.156828-1-danyboy28sep@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The axis-fifo driver (drivers/staging/axis-fifo/axis-fifo.c) has
supported the "xlnx,axi-fifo-mm-s-4.1", "xlnx,axi-fifo-mm-s-4.2" and
"xlnx,axi-fifo-mm-s-4.3" compatible strings since it was added, but no
devicetree binding schema exists for them, which checkpatch.pl flags:

  WARNING: DT compatible string "xlnx,axi-fifo-mm-s-4.1" appears
  un-documented -- check ./Documentation/devicetree/bindings/

Add a schema documenting the compatible strings and the six
xlnx,*-prefixed properties the driver reads in
axis_fifo_parse_dt(), all of which are currently required by the
driver's own error handling.

Validated with:
  make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml

Signed-off-by: Daniel28972897 <danyboy28sep@gmail.com>
---
 .../bindings/misc/xlnx,axi-fifo-mm-s.yaml     | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml

diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
new file mode 100644
index 000000000000..56d58b37b71e
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
@@ -0,0 +1,91 @@
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
+  The Xilinx AXI4-Stream FIFO MM S IP core provides a simple interface
+  to move data between the AXI4-Stream and AXI4 memory-mapped domains.
+  See Xilinx PG080 for details.
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
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 32
+    description:
+      Width, in bits, of the AXI4-Stream receive data interface.
+      Only 32 is currently supported by the driver.
+
+  xlnx,axi-str-txd-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 32
+    description:
+      Width, in bits, of the AXI4-Stream transmit data interface.
+      Only 32 is currently supported by the driver.
+
+  xlnx,rx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Depth, in bytes, of the receive FIFO.
+
+  xlnx,tx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Depth, in bytes, of the transmit FIFO.
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
+    fifo@40000000 {
+        compatible = "xlnx,axi-fifo-mm-s-4.1";
+        reg = <0x40000000 0x10000>;
+        interrupts = <0 29 4>;
+        xlnx,axi-str-rxd-tdata-width = <32>;
+        xlnx,axi-str-txd-tdata-width = <32>;
+        xlnx,rx-fifo-depth = <2048>;
+        xlnx,tx-fifo-depth = <2048>;
+        xlnx,use-rx-data = <1>;
+        xlnx,use-tx-data = <1>;
+    };
-- 
2.34.1

