Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B702CA2
	for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 11:13:19 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id c3so34691398iob.6
        for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 03:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OBZjeCPmHnZFjVhdtwcLx3XOD2NbI/pF57Ruee40Yio=;
        b=jpubRIei533qi1bG5g2e+TA27Ch+HggU3c7HH8qd+qRcNjvc81BndoRRaTbKhzXs2H
         3IJu3D6x/bQ4pbY6NF3RSGC6V1mix9bqGMjZ8YHsvWFTDumDVWxc3lmpLJ6+DziiU498
         ZG8UgRikzS6df/qYaOhVx7YB+R+h58ECqO2Gj8EK+Rl42h+HeID+1jPfc9svStzBzmB2
         80e1tkNd8zNkEUzcVnOZ8sB7FWAIVraH2DM472FnMLiyzuz3IC+rqszktQSi5+9LXIVH
         lJKW5tVrC8VSBYiRq5GcMRiyk9GmPZfTonlpIp+/+HkPByww+xCIoN3UiiqkjEelppB0
         5oCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OBZjeCPmHnZFjVhdtwcLx3XOD2NbI/pF57Ruee40Yio=;
        b=N1Q5j5NF2W16eGIlRy/QhGgMlUU6Px4zQ0Pv0o0XhXXPoOenFhBqs0Akoe6wJShYGw
         GkUOO8YbTi3m55GuDO+A5G2bEvPGlixyptPYYe4M6pVKJR4bj6XNpMdYaVhVwsKjkB7v
         ekURIcbOm6R0lkJ9Nv0xPoDGG9JqpzEPJgJ1jjSFqknPZ7XcTTkIqdgL8GOt3mlhUzC+
         sUXr15LuVttNxhaQwXcPA54hem8AOgkSCi5TBsMPcUPIVPPaKaYldEcFDC/ad9UpmdpI
         cY0RbD1EZNWiM/7mYGGNDwWYpnSdJHXnLmgzKcwHFNr2jE0htj94xNDMbe01V1isAYIk
         1+YQ==
X-Gm-Message-State: AOAM530BREbPLzFcfxO1fixVUUU1MyQhn2JxXEOgKhR7peHgGLciOVqE
	4SYwTzG7dWdZCoqi0Enc+bc=
X-Google-Smtp-Source: ABdhPJwG3RjzIgyAH51KSKIWg4qsgdyIxuRhaKeR9db6RyIEG/6N0qrxBROgwed2usJt5U7DhzTIqg==
X-Received: by 2002:a05:6638:2191:: with SMTP id s17mr8985470jaj.67.1639653198144;
        Thu, 16 Dec 2021 03:13:18 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:fe22:1652:55f7:5197])
        by smtp.gmail.com with ESMTPSA id h1sm3090946iow.31.2021.12.16.03.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 03:13:17 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: abel.vesa@nxp.com,
	aford@beaconembedded.com,
	benjamin.gaignard@collabora.com,
	hverkuil-cisco@xs4all.nl,
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
Subject: [PATCH V2 02/10] dt-bindings: soc: add binding for i.MX8MQ VPU blk-ctrl
Date: Thu, 16 Dec 2021 05:12:47 -0600
Message-Id: <20211216111256.2362683-3-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211216111256.2362683-1-aford173@gmail.com>
References: <20211216111256.2362683-1-aford173@gmail.com>
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

