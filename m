Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DB02CA6
	for <linux-staging@lists.linux.dev>; Tue,  7 Dec 2021 01:55:06 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id c3so15244941iob.6
        for <linux-staging@lists.linux.dev>; Mon, 06 Dec 2021 17:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v92hmZhCqOeQNRoL1iE4lgtGbhoSwewU6XylFnXIQ3Y=;
        b=bpVO1R65BVgiXde5x1dOBiFaWy1doBQ7duXiRmqXmSf+AUgE06EkCG1FrYQi0HMXUg
         m5LMuQhL7a3hK4yVeAi6zbo/ACVQ72RxTzf++sQrNji9XFvwxjMFBGc0A/jz2bFkauSU
         wGGful+ftKAxK/f63rRaDazBtTEtIhHbqBGVLv3Ilin2+JOpSYzsXjus4JGYu5DGWnlq
         7ohWfKLO2v1Z7+HTXQG0Y0quVcw1PuM+Ee9ulBIKGRnV/XrZ4BbEjtp43dnbBxSgSnx+
         bkux5F+jJaNW1AbJpiKcSyRei2wrjw+QPHFnd1ZnLqrCO2gFnGhnb1WKpLyTuaaAYaI+
         AY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v92hmZhCqOeQNRoL1iE4lgtGbhoSwewU6XylFnXIQ3Y=;
        b=on+NVlpz9X016eihVN0RLprf4uQNc7GLtVa/R8Bc/yU4qftB9ZPxg/dREHcDAqKVe1
         /hGPq7Ja+clXn8ZYL+Ngom9rW/p6lukMTm44Ss9O2HmaBacyWQp/N9gt8gDwAMBRu3F8
         o2JLyoqBAmxFQfNavVrpprIaU1m1QjAwuWYvMKpdrnJ/05bJ5obzG+8IO+FCr+hIFP5K
         Lb3McYiwozX1jdAULHfepCYCKo4IBls1lIE8D8oh52Bx71bTmleverLDfov1UuoR3ZLK
         rwlZhkz0TgKtd1gXn+Ot+bGpZddLJo2lIeq8m1kr2JIv6GPN6LorgIGz2qYxf73JNHoO
         U8gg==
X-Gm-Message-State: AOAM533ce6G09HW8Yfos2veYq9QkIq5P74SHfbPOUwKIOESG3Ii+hsDv
	B4A9TqQbMNLfKuWb1059hyw=
X-Google-Smtp-Source: ABdhPJwEakC2/INc2whzZH6HJ4Tjw21HR8r0Qv/gYqURv8Z1rGX738AJkQMMi/8EKYV2cRCqqQhVog==
X-Received: by 2002:a05:6602:8ce:: with SMTP id h14mr34936559ioz.177.1638842105473;
        Mon, 06 Dec 2021 17:55:05 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:6db8:c9e4:6f6d:f38e])
        by smtp.gmail.com with ESMTPSA id j21sm8623639ila.6.2021.12.06.17.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 17:55:04 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: cphealy@gmail.com,
	benjamin.gaignard@collabora.com,
	hverkuil@xs4all.nl,
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
	Lucas Stach <l.stach@pengutronix.de>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [RFC V2 3/6] dt-bindings: media: nxp,imx8mq-vpu: Update the bindings for G2 support
Date: Mon,  6 Dec 2021 19:54:42 -0600
Message-Id: <20211207015446.1250854-4-aford173@gmail.com>
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

From: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Introducing the G2 hevc video decoder requires modifications of the bindings to allow
one node per VPU.

VPUs share one hardware control block which is provided as a phandle on
a syscon.
Each node has now one reg and one interrupt.
Add a compatible for G2 hardware block: nxp,imx8mq-vpu-g2.

To be compatible with older DT the driver is still capable to use the 'ctrl'
reg-name even if it is deprecated now.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
index 762be3f96ce9..eaeba4ce262a 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
@@ -15,37 +15,36 @@ description:
 
 properties:
   compatible:
-    const: nxp,imx8mq-vpu
+    oneOf:
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
+    maxItems: 1
 
   interrupt-names:
-    items:
+    oneOf:
       - const: g1
       - const: g2
 
   clocks:
-    maxItems: 3
+    maxItems: 1
 
   clock-names:
-    items:
+    oneOf:
       - const: g1
       - const: g2
-      - const: bus
 
   power-domains:
     maxItems: 1
 
+  nxp,imx8m-vpu-ctrl:
+    description: Specifies a phandle to syscon VPU hardware control block
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
 required:
   - compatible
   - reg
@@ -60,20 +59,27 @@ additionalProperties: false
 examples:
   - |
         #include <dt-bindings/clock/imx8mq-clock.h>
+        #include <dt-bindings/power/imx8mq-power.h>
         #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-        vpu: video-codec@38300000 {
+        vpu_g1: video-codec@38300000 {
                 compatible = "nxp,imx8mq-vpu";
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
+                reg = <0x38300000 0x10000>;
+                reg-names "g1";
+                interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+                interrupt-names = "g1";
+                clocks = <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
+                clock-names = "g1";
+                power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G1>;
+        };
+
+        vpu_g2: video-codec@38310000 {
+                compatible = "nxp,imx8mq-vpu-g2";
+                reg = <0x38300000 0x10000>;
+                reg-names "g2";
+                interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+                interrupt-names = "g2";
+                clocks = <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
+                clock-names = "g2";
+                power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G2>;
         };
-- 
2.32.0

