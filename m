Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C372CAB
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 17:12:35 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id e8so17395557ilm.13
        for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 09:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VL1oLU+nTr4269UjGhYalkPJi4/LnnBSABpNJRBabCw=;
        b=l7oWtOC2lQsxWZwdPi/4kZhtW16WW+MYL52LOVnu74eC+oLmszWAuu5Z4ZWtc8mcE4
         D3MILqd0539d+Kjl4cxirXE0soN4zpDWIft/CvC6D2xKXBq5g288rGu42kVAPGt5TLMa
         IlOJPkzX3vJLUGDFH+AXploZjDxqTzS0d52op0UYBMq3SCnhksXlemBAPunDeDfeWGcA
         t2l3cxzd1GOrE/848+seR4NfiKSzzGML0sAgjWcK7LACOEpoXHjpBvFYMYaVglPDvuVJ
         rqWCiSboSi9wE+DizWq9T/615aQKclgSR//3VdtA6hL4J/ahElSDU+BtiU+XZQG0Vlxq
         gVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VL1oLU+nTr4269UjGhYalkPJi4/LnnBSABpNJRBabCw=;
        b=MzfXCZP8FcSdnS1tTW7jA+Co6Jeg/CDSWt4JfwdMhZosbp7zpPoYc+tHb/iqAyzKQZ
         oVGD3RNHWh/kmjf9F0xew6vTXQ/dVCsH05Ea8Z+F58PyhxzjAb2P9SfgpSeoWA4nu6DN
         X22CeRrcHxYd0+VC0zOitVDQvpwORA6DTDetPbZKwRHHd4ZREgb2mAMak5wJSLuagsiS
         PiFKCTLTdQ6K+8Pg5bE/OmmWyKeXxsLeFux5YDjprOPUj2dCev01RJrsx8S8i3H5AogE
         ojUhg9KGUmVklLgyJxcbtk9M+Ze1c7y0/0HoJlwhHlT+zML8yfEQapXFWIgneBdy5/KV
         BTRg==
X-Gm-Message-State: AOAM531S1naBaOZjLLEtr3LJJOuAX7Jq6diVUqkFM8CMLQmEBO6fBDK/
	yurOVYsQteSLwaKcjItcpoU=
X-Google-Smtp-Source: ABdhPJwvKjLEZ3f3m020/quWIOzkOb5VdaNjmq4smclCObm5iKxqt7CFSc6MAD+iFzhuKSDCck+XXw==
X-Received: by 2002:a05:6e02:148d:: with SMTP id n13mr12269749ilk.16.1643130754734;
        Tue, 25 Jan 2022 09:12:34 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:6592:b6fe:71b1:9f4c])
        by smtp.gmail.com with ESMTPSA id m14sm8090291iov.0.2022.01.25.09.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 09:12:34 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: aford@beaconembedded.com,
	cphealy@gmail.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
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
	Lucas Stach <l.stach@pengutronix.de>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH V4 05/11] dt-bindings: media: nxp, imx8mq-vpu: Split G1 and G2 nodes
Date: Tue, 25 Jan 2022 11:11:22 -0600
Message-Id: <20220125171129.472775-6-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220125171129.472775-1-aford173@gmail.com>
References: <20220125171129.472775-1-aford173@gmail.com>
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
Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

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

