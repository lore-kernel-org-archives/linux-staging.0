Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0AF2CB3
	for <linux-staging@lists.linux.dev>; Wed,  8 Dec 2021 22:50:48 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id j21so3654847ila.5
        for <linux-staging@lists.linux.dev>; Wed, 08 Dec 2021 14:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4RYsS2ws//9JixbB5269IuLK7Et+ZSSQi85S6tUP01M=;
        b=Vg1Sn9LkR4IoTFrQyG5LUpKQuQHI7KMW6eMepj+uU/cR4BJiiZww70Z7Mr9bQawo+K
         9/Cu/Zr+7WDfZNSZ1p529O1Xg2JfpuGoRPg0stPrKhKlYbnDqYD9sCCs1C9P+GmJVMYl
         wHkZ/uhXf8Wt2nwgazyyz8szAof4C9FxPM4xs2PQPLHRIsOyHR7ToHbCH8Q4TGwFz2Ml
         bMwhftbRusEYyIRQroiLejFMCFl0RGS/3icVvIGebdTxzsBkKboBtTNiqARJ406tTGAN
         Y8+PzREANBO4DY5MwdMLd8IgUG68A9eYu9bhCyZdCRkjWJoXCxYhzPbjAmjdzOhzEWXI
         9vJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4RYsS2ws//9JixbB5269IuLK7Et+ZSSQi85S6tUP01M=;
        b=AQ9bbf9PJv6kcGqFo6iwJbTA/Yh8Y997nvx8yn2BgXxrORyvH+iksCWHz3JUC9if5k
         sufNH+1b+FzrqMWSd1aL6ltg6JC6Nrby+gIgVmMWxBcW/0pCixIxahoF75hWRLOBKDGO
         WWhdW+IGOtTAc6Lguif3vGauCb4zfhjat+OYU+dCgXYJ/OVHAcW59Qg1dnMojuk6MOPv
         OIh1PdDGlJKOLXxMi1P4t586PzcLa/ZoJzDMpX/+Yr0ejPMLC+kpZq/msZFitJgahQFD
         YDfzB+Zgcumscv22kK4PyqFIvRMYn5gmulCpaoZppBvJWhw/EVOF5fMfl1tcc7mMTlzu
         aPsg==
X-Gm-Message-State: AOAM531Prs+ec6kpVar/uk0f9Eg/AFkitL9aLWWE16gY8yzTJq9VEbOU
	Buotn8G6bvwHs85v6dg4l1Y=
X-Google-Smtp-Source: ABdhPJyNG222gEHjYDSsfxa6dwVVg8X2yniI6WpukjYpE2fAejJxnf4ebLM/m02jvkj8bqN3rk5zMw==
X-Received: by 2002:a05:6e02:1a88:: with SMTP id k8mr9816941ilv.127.1639003847161;
        Wed, 08 Dec 2021 14:50:47 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:269a:1aa2:f1d9:8dbb])
        by smtp.gmail.com with ESMTPSA id t6sm2378751ioi.51.2021.12.08.14.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:50:46 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: benjamin.gaignard@collabora.com,
	cphealy@gmail.com,
	aford@beaconembedded.com,
	nicolas@ndufresne.ca,
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
Subject: [PATCH 04/10] dt-bindings: media: nxp,imx8mq-vpu: Support split G1 and G2 nodes with vpu-blk-ctrl
Date: Wed,  8 Dec 2021 16:50:23 -0600
Message-Id: <20211208225030.2018923-5-aford173@gmail.com>
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

The G1 and G2 are separate decoder blocks that are enabled by the
vpu-blk-ctrl power-domain controller, which now has a proper driver.
Update the bindings to support separate nodes for the G1 and G2
decoders using the proper driver or the older unified node with
the legacy controls.

To be compatible with older DT the driver, mark certain items as
deprecated and retain the backwards compatible example.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 .../bindings/media/nxp,imx8mq-vpu.yaml        | 83 ++++++++++++++-----
 1 file changed, 64 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
index 762be3f96ce9..eeb7bd6281f9 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
@@ -15,29 +15,39 @@ description:
 
 properties:
   compatible:
-    const: nxp,imx8mq-vpu
+    oneOf:
+      - const: nxp,imx8mq-vpu
+        deprecated: true
+      - const: nxp,imx8mq-vpu-g1
+      - const: nxp,imx8mq-vpu-g2
 
   reg:
+    minItems: 1
     maxItems: 3
 
   reg-names:
+    minItems: 1
     items:
       - const: g1
       - const: g2
       - const: ctrl
 
   interrupts:
+    minItems: 1
     maxItems: 2
 
   interrupt-names:
+    minItems: 1
     items:
       - const: g1
       - const: g2
 
   clocks:
+    minItems: 1
     maxItems: 3
 
   clock-names:
+    minItems: 1
     items:
       - const: g1
       - const: g2
@@ -58,22 +68,57 @@ required:
 additionalProperties: false
 
 examples:
+  # Device node example backwards compatibility
   - |
-        #include <dt-bindings/clock/imx8mq-clock.h>
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-
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
-        };
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    vpu: video-codec@38300000 {
+        compatible = "nxp,imx8mq-vpu";
+        reg = <0x38300000 0x10000>,
+              <0x38310000 0x10000>,
+              <0x38320000 0x10000>;
+        reg-names = "g1", "g2", "ctrl";
+        interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "g1", "g2";
+        clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
+                 <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
+                 <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
+        clock-names = "g1", "g2", "bus";
+        power-domains = <&pgc_vpu>;
+    };
+
+  # VPU G1 with vpu-blk-ctrl
+  - |
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/power/imx8mq-power.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    vpu_g1: video-codec@38300000 {
+        compatible = "nxp,imx8mq-vpu-g1";
+        reg = <0x38300000 0x10000>;
+        reg-names "g1";
+        interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "g1";
+        clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>;
+        clock-names = "g1";
+        power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G1>;
+    };
+
+  # VPU G2 with vpu-blk-ctrl
+  - |
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/power/imx8mq-power.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    vpu_g2: video-codec@38310000 {
+        compatible = "nxp,imx8mq-vpu-g2";
+        reg = <0x38310000 0x10000>;
+        reg-names "g2";
+        interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "g2";
+        clocks = <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
+        clock-names = "g2";
+        power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G2>;
+    };
-- 
2.32.0

