Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152262CA6
	for <linux-staging@lists.linux.dev>; Tue,  7 Dec 2021 01:55:04 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id z18so15213106iof.5
        for <linux-staging@lists.linux.dev>; Mon, 06 Dec 2021 17:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OBZjeCPmHnZFjVhdtwcLx3XOD2NbI/pF57Ruee40Yio=;
        b=KLQ5aMmOC+9unBsOBKjjCzsUNrpplZqFcgJUvm18x87kewfp00c8AgqzDKMkzrt49D
         0V1M90b1iNqn+zWrMlxJemyvDGbPRTm909quzmWz4Hu8dx0uF9HaKIp2TVxtAdj1bbKW
         j/RMW7zBrpuxwsEg79xOm38ty8Sq84tPV/ZjqcEoh54KXN/17PlbLbVrr1ly1zaVxxFg
         9dd6A3dby4Z3Nc6I4rY7sJxUZ6Jjy/DK2GGA+NG2BuF4+nH5aZsKyTYNjWLlSpNzteug
         nqI6+yeV+2elvO7RlEdcp8bixcrjQaPGyTzpjg/bhqeMrtNt2HiDOpAWP0s8WTUG/7cm
         mwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OBZjeCPmHnZFjVhdtwcLx3XOD2NbI/pF57Ruee40Yio=;
        b=NwSKzBzeBbBtN7CwdFLJwxIgtGD/mgkle/ucb9SRMGxvsfPTAi0B1JvbbzhCMhNuit
         DTrhbXDcyFRtB0uCX4rqfKTUwH2iTnkz3GVR9uhJivFt+3nMwY+mNkR/+CStG3yzP2CX
         yY5ynVLRG2+Vxbs2HHQJs6jgLU4YASOCQlMFl4iP/xSmaBTTX5KVjU0WioYQ8sVLGFLk
         DGX8hI3vsKv/1ssINrJWlRgL7BRKuhlf3TFnqXWbdlIC3zEuL2MwMMWkq6dfOxJ6PpxB
         fi4ceLoHhaIalrLzmQXVsLGpGrNeklaltMt0AeW0qUeTR2S0k94VmPKLLJZjEUTxGyrK
         R7kQ==
X-Gm-Message-State: AOAM5315+T91E3f/GvvaqH6FMkU5mfE7rUAAa/mpeOn29lSB1Urs7ZTL
	he7dkug61ajdLl8kBStLYbL5Cl1qBS3fAgzz
X-Google-Smtp-Source: ABdhPJz94A+DkmEaZKf1jTIXk5p+7S34tRMHbkRy5CAfMQZcvauDQP51/GSAL/IJ6SRq4IIH6mt6Vg==
X-Received: by 2002:a05:6602:2d8c:: with SMTP id k12mr37987393iow.49.1638842103118;
        Mon, 06 Dec 2021 17:55:03 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:6db8:c9e4:6f6d:f38e])
        by smtp.gmail.com with ESMTPSA id j21sm8623639ila.6.2021.12.06.17.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 17:55:02 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: cphealy@gmail.com,
	benjamin.gaignard@collabora.com,
	hverkuil@xs4all.nl,
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
Subject: [RFC V2 2/6] dt-bindings: soc: add binding for i.MX8MQ VPU blk-ctrl
Date: Mon,  6 Dec 2021 19:54:41 -0600
Message-Id: <20211207015446.1250854-3-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211207015446.1250854-1-aford173@gmail.com>
References: <20211207015446.1250854-1-aford173@gmail.com>
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

