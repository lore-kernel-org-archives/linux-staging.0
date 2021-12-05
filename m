Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562F02C9E
	for <linux-staging@lists.linux.dev>; Sun,  5 Dec 2021 18:16:40 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id p23so10344314iod.7
        for <linux-staging@lists.linux.dev>; Sun, 05 Dec 2021 10:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tWudG/7p9Ihv/RchD2aqdeBvOMPxR3CBPXRYkrOCQIc=;
        b=Rta/hbYaQyn4KIRTC5NZcb5EmJDBuP6DlcpgmudYGUBaIaREtTQBqKrTNTn9EdCscp
         RfL3YWIiXlrjpuXAUBtJ8we2gJw3n++XYvGM5hTmZNX0svu1uFiz0aWSSOM/MdiYja4U
         nnMXsutHRNwAmklhoAjvPca1pY/f0crCHzG11+d8nVKy8yJFwczULj3qVVsmm143wxyb
         mIoXFuWvHVfVcXERBth0LxuPg+Skx0Oz2GIpNIBrHyaxIjK0LIvdRbvaeh+i7P1nzF0x
         xXRjG6mLrwk+nZUH3jVP8uwqCWDPSVDumz5a8LSdUQBPmZkvbfMwKQIBWOVzfKBuvfcB
         fIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tWudG/7p9Ihv/RchD2aqdeBvOMPxR3CBPXRYkrOCQIc=;
        b=jg4PvzKosz4Qa60n5Sahj0XXubqdV5AY4N7WVgeDanmPTbLopwwKjS1nBt6wimsUQX
         vGHjvf9n+vlamFIrL6cV84F6vqAUGj1EaGGtMgePafyA6Beq3Wof5PpqFGxmXdcYwqo8
         Dd5fz/0QMp6KoEz7usUu4fnnuOfnr9z9z7xe8shLjgNaPtWwbWi1scR7TTeiU5nKsIit
         JmY/0n9MDcdQj3ctPt34smS2XO9XtmAP5WxZg/zxVnR2lfGtPXrTAolPNV+sKqXz4Mfq
         E/vdvNzLiPSiyOpvJWFx9LKIbqMf7nYaCdNur4IsZw68keuqryAdY+iVOa+6lAAudQoN
         26mQ==
X-Gm-Message-State: AOAM532Nhi4qGMlJeK65LLjMDsoO7uAJCHvj3CSyq+tVIl6GAiawjRWA
	4ktUVHdLrKYL+UTpieY4r2OGeHRTrOepfQ==
X-Google-Smtp-Source: ABdhPJz76yYAqHOJ31ePlq8l+eSKZz2b7PQOgx+R+/rE+pERvqgyrdRgmvhM0sqqeHT5SBKrzvSo3A==
X-Received: by 2002:a05:6638:2bb:: with SMTP id d27mr39777646jaq.66.1638728199307;
        Sun, 05 Dec 2021 10:16:39 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:9ea0:bb99:b16a:6159])
        by smtp.gmail.com with ESMTPSA id z12sm5808164ilu.27.2021.12.05.10.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 10:16:38 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: benjamin.gaignard@collabora.com,
	cphealy@gmail.com,
	nicolas@ndufresne.ca,
	Lucas Stach <l.stach@pengutronix.de>,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: [RFC 2/5] dt-bindings: soc: add binding for i.MX8MQ VPU blk-ctrl
Date: Sun,  5 Dec 2021 12:16:15 -0600
Message-Id: <20211205181618.1041699-3-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211205181618.1041699-1-aford173@gmail.com>
References: <20211205181618.1041699-1-aford173@gmail.com>
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
index 000000000000..b8cfad0d7a1e
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
+      compatible = "fsl,imx8mq-vpu-blk-ctrl", "syscon";
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

