Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CC02CAB
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 02:31:41 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id y84so1387715iof.0
        for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 18:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y0qZ67tpkeFBSJ9t9tgLEVEiGlxTQ2nB9WsG2l3ZlOQ=;
        b=iPkHd1C+doSlRjE1qZo0dWd1BGCsSIHtFUaBZIBi7SqZq7NqZGzwBjHvdVfg8vxnIn
         eAjMINqwCOZ7m8Ch0qlMjNZgeYNY/7o1OSASx7/9KM5DOEWZnd2fT5pXNknOJeykpzp+
         eiu6N+ZvJw72629YDAIxO6MxbVgg7XrYMHucYz0LIOQGA3qb8tNo8RZn0MYm/FfRtbMz
         VYlk/0KG+akLKMQ1DqK36AQLdGmariBzaAJdc9xBsetmr5ZWIBLYGZeHBhIytBcvDUw6
         BWCeJoQZHffkw8xDiz3tIRG2ZoSnwPt/aYZ1zZSkN5ICmeqInnckYT7dMBWLXWinENdh
         RMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y0qZ67tpkeFBSJ9t9tgLEVEiGlxTQ2nB9WsG2l3ZlOQ=;
        b=p4ypK2coPhaK6ZWZ7/mqFEl0WXncB3dPVf0DibjO6896AMY0+Zr1u6On1lCHGu+e76
         a1z5kTVgv0oBs273Ry390cmbCyyIpT/jlcvmT2yFynZdIwVy/tfw7yLjnNiyIchYaVh3
         q/dBUjj08GUYAf0ZJgDpNvc4R70BJLGHchVlw0mt0pBeDG+4O/HbWBuIpEMEORIp1dz6
         +fE1E1XMoEZlSHEKYXzZ2aX8Dei7C9H/A4WQ/HpkQ52EgMmRT1+2l12/dCRvXFJu+px4
         mor6CYWdnKve9hz3NObn2zW/IzXWblazmwpcbIj6AKzdckA10n5z5mcpxrPMjTSD/OB5
         z+4w==
X-Gm-Message-State: AOAM532F2brXZVma8cYILcOkM7gslyQkW/f93Q4uj1aWk7IfwTkR0pRe
	fFYjlgeXUrBcj2Lp0d33rUA=
X-Google-Smtp-Source: ABdhPJwTWD0sqVlemPzHrR/znGRysXOUccdjrkZ5rHuwWsFHTrINqiYX6kZ0bp26wW9rT6w8CY4f1g==
X-Received: by 2002:a6b:f104:: with SMTP id e4mr799402iog.49.1642991500812;
        Sun, 23 Jan 2022 18:31:40 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:582d:ad0e:e5a6:94b6])
        by smtp.gmail.com with ESMTPSA id w4sm6625633ilq.56.2022.01.23.18.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 18:31:40 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	shawnguo@kernel.org,
	aford@beaconembedded.com,
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
	Lucas Stach <l.stach@pengutronix.de>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH V3 04/10] dt-bindings: media: nxp, imx8mq-vpu: Split G1 and G2 nodes
Date: Sun, 23 Jan 2022 20:31:18 -0600
Message-Id: <20220124023125.414794-5-aford173@gmail.com>
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

The G1 and G2 are independent and separate decoder blocks
that are enabled by the vpu-blk-ctrl power-domain controller,
which now has a proper driver.

Because these blocks only share the power-domain, and can be
independently fused out, update the bindings to support separate
nodes for the G1 and G2 decoders with vpu-blk-ctrl power-domain
support.

The new DT + old kernel isn't a supported configuration.

Signed-off-by: Adam Ford <aford173@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
index 762be3f96ce9..9c28d562112b 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
@@ -15,33 +15,20 @@ description:
 
 properties:
   compatible:
-    const: nxp,imx8mq-vpu
+    oneOf:
+      - const: nxp,imx8mq-vpu
+        deprecated: true
+      - const: nxp,imx8mq-vpu-g1
+      - const: nxp,imx8mq-vpu-g2
 
   reg:
-    maxItems: 3
-
-  reg-names:
-    items:
-      - const: g1
-      - const: g2
-      - const: ctrl
+    maxItems: 1
 
   interrupts:
-    maxItems: 2
-
-  interrupt-names:
-    items:
-      - const: g1
-      - const: g2
+    maxItems: 1
 
   clocks:
-    maxItems: 3
-
-  clock-names:
-    items:
-      - const: g1
-      - const: g2
-      - const: bus
+    maxItems: 1
 
   power-domains:
     maxItems: 1
@@ -49,31 +36,33 @@ properties:
 required:
   - compatible
   - reg
-  - reg-names
   - interrupts
-  - interrupt-names
   - clocks
-  - clock-names
 
 additionalProperties: false
 
 examples:
   - |
         #include <dt-bindings/clock/imx8mq-clock.h>
+        #include <dt-bindings/power/imx8mq-power.h>
+        #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+        vpu_g1: video-codec@38300000 {
+                compatible = "nxp,imx8mq-vpu-g1";
+                reg = <0x38300000 0x10000>;
+                interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+                clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>;
+                power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G1>;
+        };
+  - |
+        #include <dt-bindings/clock/imx8mq-clock.h>
+        #include <dt-bindings/power/imx8mq-power.h>
         #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-        vpu: video-codec@38300000 {
-                compatible = "nxp,imx8mq-vpu";
-                reg = <0x38300000 0x10000>,
-                      <0x38310000 0x10000>,
-                      <0x38320000 0x10000>;
-                reg-names = "g1", "g2", "ctrl";
-                interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
-                             <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
-                interrupt-names = "g1", "g2";
-                clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
-                         <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
-                         <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
-                clock-names = "g1", "g2", "bus";
-                power-domains = <&pgc_vpu>;
+        vpu_g2: video-codec@38300000 {
+                compatible = "nxp,imx8mq-vpu-g2";
+                reg = <0x38310000 0x10000>;
+                interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+                clocks = <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
+                power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G2>;
         };
-- 
2.32.0

