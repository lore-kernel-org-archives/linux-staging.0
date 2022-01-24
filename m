Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CE42CAB
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 02:31:36 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id a18so12640720ilq.6
        for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 18:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kTohMKJe6b+aS5nC8tVrcxj3aKt5LtNCUkDL666J3iI=;
        b=DWdz2Gmn/OxlLt+ZL3Oi79/aoh+vlkt8+Jy/lctVQYoiWxNUZVZgRQ1MzfGAwHR01d
         1vTFgTpTD5R0T5DwAZCKE1mqsqt75iKULaU8zzqEkFHVWLtebsS7aen2+BnIb17JAe98
         4Nn2m8HAs5Wwe4YoxBbl7XRkR4tPeMVziMTFjrU34ltHkEWbtxG3jtRki+FV/K/b+q1A
         v5RhWOHB3HWHQHl25g/+C8kjNeE8500H8facI6VdLXbhz1KK1qkKZrVCDm/BHGjnWgsq
         /Hb0+f7xh5L06bhlsUdxSGlxmHRnVlEN9PSgz5Xo8IsbxEwa7bsguC9O9rfGhgxrBo6W
         xhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kTohMKJe6b+aS5nC8tVrcxj3aKt5LtNCUkDL666J3iI=;
        b=rF+KbWuNaveeuLa4UweMBPviaKaj0WqlSCabMIZWR0bTbaF043FATqBWfFHaPoApuh
         mC06VsXiHZtQNgWx46qDvOLEnvLTX/XOkKy/siLKPPk7yjDXqUsOLJRnVTq37TLQLfcV
         BUjl0/XYeLAAu1aiK0yOzQfMXUx0qhpz7BWRwwIDnfUNpdv8262ahXdRqUBFY8pD7e0L
         lE0xzw4H6i6k/gnjm5WGg3QIu2zuo2eX76FWS2pNOfdfzhKZ6Y5XrJrghdr1IiEnb911
         Xsfc2XCflqAYA0fMqYN7Hx/b0xNCmmJkfD2zwO7UyzIawxY9oGA+fE2cpQ3Cj6v6fAVk
         pnng==
X-Gm-Message-State: AOAM5316UKtrc/6DqFvjveNiJKuohDMN0CnnqS30cCLqdg4GdgEtzaMC
	AkYb3rDzErBoY4xO24wqPEw=
X-Google-Smtp-Source: ABdhPJzPT49xUHz+xvWATznYNwatDlpwDx1OQe+zH/Ir71zoyVxxIeEn1SMa80s7DZKRrXLs4pI2Qg==
X-Received: by 2002:a92:cda7:: with SMTP id g7mr7475640ild.53.1642991495924;
        Sun, 23 Jan 2022 18:31:35 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:582d:ad0e:e5a6:94b6])
        by smtp.gmail.com with ESMTPSA id w4sm6625633ilq.56.2022.01.23.18.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 18:31:35 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	shawnguo@kernel.org,
	aford@beaconembedded.com,
	Lucas Stach <l.stach@pengutronix.de>,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH V3 02/10] dt-bindings: soc: add binding for i.MX8MQ VPU blk-ctrl
Date: Sun, 23 Jan 2022 20:31:16 -0600
Message-Id: <20220124023125.414794-3-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124023125.414794-1-aford173@gmail.com>
References: <20220124023125.414794-1-aford173@gmail.com>
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
Reviewed-by: Rob Herring <robh@kernel.org>

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

