Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DA32CBD
	for <linux-staging@lists.linux.dev>; Wed,  8 Dec 2021 22:50:43 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id c3so4599811iob.6
        for <linux-staging@lists.linux.dev>; Wed, 08 Dec 2021 14:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KH5Jne9WcYen8VLv63slDNPB/A+EenVaY1NFcEd7AL0=;
        b=L/0F/biiGi3tDtP9CI9j6864dUmuoHZqb5Q/X+GvYmx3Mm4HEg/p+c1Czc7Da9LgCJ
         UdWNefGwzk2WM3YfKmKSx6UqxjG7dDFvD9B9OTTcsRJZhQOnncisacdL8YqrNSg47xgD
         rQu2I+AaqWvqmWpKxrnpSn19UHABu0IYr4OEyxgaqWZEfbmhsu8TTIGd6UavLZfh6gmd
         +Xy69KNHKLECsBts3AJOTyR6p1u4SZEFJtKw13Nzcd2BVcUJU8mTMHx7t9KLoKT5E0KX
         +a5UArm9mpUYNwbK8NUrrre05LuU9GHXmYgFgcND4O9A9/pKvuYXyppMP0TLqs6d2IwD
         xncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KH5Jne9WcYen8VLv63slDNPB/A+EenVaY1NFcEd7AL0=;
        b=S2Tsuff0E6IoFE9ArFHJ+KVswJXLUxN52D3faYd565iHDZCPz7hnXRSfBT+t0R9q9N
         aJ/Pt/FYf/RnvbpsxHXZ2s6Bi6wjQL01J9TtlKKABmEpHi77tEaNw2ag5k9kIsqT5X/W
         +14+phk2PlB142V+PjPNsi5hNF+QnO6CNeqq8VGUzYtyu8/Qu4TlwMX+lKhq+olSFt3V
         LpSOCJC5jfNPHiCjembMUQWFM+eRxH6emLdtU6PwmrcgUzBhtwTLCyeY6XC+b3UpLcji
         LAzQxJW2Jm3hdohXfEesZRXjTvK1I2CYRyUfdAdSEPv79cowcxEUvAJbm4XDEHotzZ6r
         Aymw==
X-Gm-Message-State: AOAM5324pDzCf5uvFSZhNHAGs2KzF7XBrm4KUy9kkAwvFzDjH15BnaXX
	GLCz33AzbH7Yr4PWQpIR2eU=
X-Google-Smtp-Source: ABdhPJycuHd5Hezj4qLt3M/C9skFUUVnANcKtzFop7/ugQMyK2ceqeFxYBtgBpPkudeWLp6OnqmLcg==
X-Received: by 2002:a05:6638:140c:: with SMTP id k12mr3463194jad.89.1639003842466;
        Wed, 08 Dec 2021 14:50:42 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:269a:1aa2:f1d9:8dbb])
        by smtp.gmail.com with ESMTPSA id t6sm2378751ioi.51.2021.12.08.14.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:50:42 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: benjamin.gaignard@collabora.com,
	cphealy@gmail.com,
	aford@beaconembedded.com,
	nicolas@ndufresne.ca,
	Lucas Stach <l.stach@pengutronix.de>,
	Adam Ford <aford173@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 02/10] dt-bindings: soc: add binding for i.MX8MQ VPU blk-ctrl
Date: Wed,  8 Dec 2021 16:50:21 -0600
Message-Id: <20211208225030.2018923-3-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211208225030.2018923-1-aford173@gmail.com>
References: <20211208225030.2018923-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lucas Stach <l.stach@pengutronix.de>

This adds the DT binding for the i.MX8MQ VPU blk-ctrl.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 .../soc/imx/fsl,imx8mq-vpu-blk-ctrl.yaml      | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/imx/fsl,imx8mq-vpu-blk-ctrl.yaml

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx8mq-vpu-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx8mq-vpu-blk-ctrl.yaml
new file mode 100644
index 000000000000..7263ebedf09f
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx8mq-vpu-blk-ctrl.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/imx/fsl,imx8mq-vpu-blk-ctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX8MQ VPU blk-ctrl
+
+maintainers:
+  - Lucas Stach <l.stach@pengutronix.de>
+
+description:
+  The i.MX8MQ VPU blk-ctrl is a top-level peripheral providing access to
+  the NoC and ensuring proper power sequencing of the VPU peripherals
+  located in the VPU domain of the SoC.
+
+properties:
+  compatible:
+    items:
+      - const: fsl,imx8mq-vpu-blk-ctrl
+
+  reg:
+    maxItems: 1
+
+  '#power-domain-cells':
+    const: 1
+
+  power-domains:
+    minItems: 3
+    maxItems: 3
+
+  power-domain-names:
+    items:
+      - const: bus
+      - const: g1
+      - const: g2
+
+  clocks:
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: g1
+      - const: g2
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - power-domain-names
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/power/imx8mq-power.h>
+
+    vpu_blk_ctrl: blk-ctrl@38320000 {
+      compatible = "fsl,imx8mq-vpu-blk-ctrl";
+      reg = <0x38320000 0x100>;
+      power-domains = <&pgc_vpu>, <&pgc_vpu>, <&pgc_vpu>;
+      power-domain-names = "bus", "g1", "g2";
+      clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
+               <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
+      clock-names = "g1", "g2";
+      #power-domain-cells = <1>;
+    };
-- 
2.32.0

