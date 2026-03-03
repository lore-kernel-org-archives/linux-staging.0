Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90782386C05
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 09:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772529878; cv=none; b=E2c+77s2U4RydAmxKXBD6Dl3+n0sAVGVF/dZhI0lsHveiUDShmUPoj5ZbjistjZYshQjxhVi7r3pwjqDWXuyZk0wI+d8ywY6IPPI0CEew5OzQecfj025JG7oD06Ke8g6g4QIjqw2k55brrdpsl5a12AQmIffCMNYYsUDUz79JSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772529878; c=relaxed/simple;
	bh=LQGmXL6SkIYV8Czardbmc4n330ePOOwThjdn0pjw080=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rR4IAZdrHNF4eogSRrZ+k63o7jzWLG0+Uqh7CiowJe5Vk4f8bkyYLAtwRfyhiHBu75X1jUhFGtAMB2AjUPqVajrtEovtFcFL3ccp4vgQeMd2FPqVuDGWwgCSGGtMdMuNkU99qrQgaKuotk7ZZi/eQ7ybKHuMydkkWjNOSN1wuNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=r0o/5IE2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r0o/5IE2"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:320d:fec:f64:f37:a9c9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 24593460;
	Tue,  3 Mar 2026 10:23:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772529813;
	bh=LQGmXL6SkIYV8Czardbmc4n330ePOOwThjdn0pjw080=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=r0o/5IE2TvNb49gmbjWqZQy1jfaMDaabPOnhXuu02Vt6K0we3PmJ2LIOzoLSoUgkv
	 RrR0Upw8yd/fUJGfn0S9cTuNsQake4bV3w+8h4kVKYRtd4ILnYAbXehepiWaPrPPm1
	 xgNNQUhS3LGUmIKquQRjnHV3EDqXPoZk/apyg3hM=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 03 Mar 2026 14:54:07 +0530
Subject: [PATCH v3 2/2] media: dt-bindings: Drop starfive,jh7110-camss from
 staging
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-drop-starfive-camss-v3-2-8f44c07fb137@ideasonboard.com>
References: <20260303-drop-starfive-camss-v3-0-8f44c07fb137@ideasonboard.com>
In-Reply-To: <20260303-drop-starfive-camss-v3-0-8f44c07fb137@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5589;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=LQGmXL6SkIYV8Czardbmc4n330ePOOwThjdn0pjw080=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBppqjBS+T3AMEoLust6FP3/KrTWKi6KUdFC1gNW
 dYGdLQo3aKJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaaaowQAKCRBD3pH5JJpx
 RTU4D/9He9gNbX1mqQuRn7R0Fyp7V2kAncw1SSWSR26V2U6T5XfbQVDTYOI3p4uoimJ0c29BNyH
 /h8nnG8z76CtC8bmKmLTvDIurMfeE3kJcZk7LtA7JOgCM/ywt5b9eRgNvS19JaBdrsR1WF615z7
 8jCmd6V0Gu5969ABrSXd1h7Qh7qInRjaRWip298fhi49yy8kgtE9VWDaj4Vo72L0lu4/DMNfRp8
 /3KLmCqPqkyy5ggH7OcWNzXeMlLNdNL67DbAaJZFMpvMJ1zilbeHcGd751qV39E7FmzEyQ+2y2Q
 ppQZlpHajCK91mjgJGG2dfRM9B7u15jTVvAqm5ZuDF0gVWKe6J6WXuq1eLMrtLbYWfn1Gm2lZ98
 f7X7olsdP7koxjbhhl05Ee5P97foysIdRiSCkfKvcDSR3q9Tand+dFUuGv9WVXTsq89bPnAyEF4
 jFfJ63xe8Lr0RbusMqxwWmOf1GGD8O+s6g2KhhidTJU+ZRod+IXusyH2HwjWq2wvYcjsj/uOru6
 aHIGBeU3WtkGVEN80Y4uEuZG+GdeZHCX+C2M/BNHmpF+yHa8KIjIL5RB99TbcGiik5m2K1qp5oq
 atDURxr+8XVJ4b6/L5WZDTzJEYPC7uhMbGgWHB0encxb2/nVuG5WXYvRXdSeaGPce+ESq/t3/QO
 v1bDfKAsIwtrlYA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The starfive-camss driver is no longer being worked upon for destaging,
and will be dropped in a subsequent commit, so drop the DT bindings.

Link: https://lore.kernel.org/all/ZQ0PR01MB13024A92926C415C187D2C18F29F2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn/
Acked-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 .../bindings/media/starfive,jh7110-camss.yaml      | 180 ---------------------
 1 file changed, 180 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml b/Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
deleted file mode 100644
index c66586d90fa2b4199da758d9dd4ae470e24fda91..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
+++ /dev/null
@@ -1,180 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/media/starfive,jh7110-camss.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Starfive SoC CAMSS ISP
-
-maintainers:
-  - Jack Zhu <jack.zhu@starfivetech.com>
-  - Changhuang Liang <changhuang.liang@starfivetech.com>
-
-description:
-  The Starfive CAMSS ISP is a Camera interface for Starfive JH7110 SoC. It
-  consists of a VIN controller (Video In Controller, a top-level control unit)
-  and an ISP.
-
-properties:
-  compatible:
-    const: starfive,jh7110-camss
-
-  reg:
-    maxItems: 2
-
-  reg-names:
-    items:
-      - const: syscon
-      - const: isp
-
-  clocks:
-    maxItems: 7
-
-  clock-names:
-    items:
-      - const: apb_func
-      - const: wrapper_clk_c
-      - const: dvp_inv
-      - const: axiwr
-      - const: mipi_rx0_pxl
-      - const: ispcore_2x
-      - const: isp_axi
-
-  resets:
-    maxItems: 6
-
-  reset-names:
-    items:
-      - const: wrapper_p
-      - const: wrapper_c
-      - const: axird
-      - const: axiwr
-      - const: isp_top_n
-      - const: isp_top_axi
-
-  power-domains:
-    items:
-      - description: JH7110 ISP Power Domain Switch Controller.
-
-  interrupts:
-    maxItems: 4
-
-  ports:
-    $ref: /schemas/graph.yaml#/properties/ports
-
-    properties:
-      port@0:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
-        description: Input port for receiving DVP data.
-
-        properties:
-          endpoint:
-            $ref: video-interfaces.yaml#
-            unevaluatedProperties: false
-
-            properties:
-              bus-type:
-                enum: [5, 6]
-
-              bus-width:
-                enum: [8, 10, 12]
-
-              data-shift:
-                enum: [0, 2]
-                default: 0
-
-              hsync-active:
-                enum: [0, 1]
-                default: 1
-
-              vsync-active:
-                enum: [0, 1]
-                default: 1
-
-            required:
-              - bus-type
-              - bus-width
-
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: Input port for receiving CSI data.
-
-    required:
-      - port@0
-      - port@1
-
-required:
-  - compatible
-  - reg
-  - reg-names
-  - clocks
-  - clock-names
-  - resets
-  - reset-names
-  - power-domains
-  - interrupts
-  - ports
-
-additionalProperties: false
-
-examples:
-  - |
-    isp@19840000 {
-        compatible = "starfive,jh7110-camss";
-        reg = <0x19840000 0x10000>,
-              <0x19870000 0x30000>;
-        reg-names = "syscon", "isp";
-        clocks = <&ispcrg 0>,
-                 <&ispcrg 13>,
-                 <&ispcrg 2>,
-                 <&ispcrg 12>,
-                 <&ispcrg 1>,
-                 <&syscrg 51>,
-                 <&syscrg 52>;
-        clock-names = "apb_func",
-                      "wrapper_clk_c",
-                      "dvp_inv",
-                      "axiwr",
-                      "mipi_rx0_pxl",
-                      "ispcore_2x",
-                      "isp_axi";
-        resets = <&ispcrg 0>,
-                 <&ispcrg 1>,
-                 <&ispcrg 10>,
-                 <&ispcrg 11>,
-                 <&syscrg 41>,
-                 <&syscrg 42>;
-        reset-names = "wrapper_p",
-                      "wrapper_c",
-                      "axird",
-                      "axiwr",
-                      "isp_top_n",
-                      "isp_top_axi";
-        power-domains = <&pwrc 5>;
-        interrupts = <92>, <87>, <88>, <90>;
-
-        ports {
-            #address-cells = <1>;
-            #size-cells = <0>;
-            port@0 {
-                reg = <0>;
-                vin_from_sc2235: endpoint {
-                    remote-endpoint = <&sc2235_to_vin>;
-                    bus-type = <5>;
-                    bus-width = <8>;
-                    data-shift = <2>;
-                    hsync-active = <1>;
-                    vsync-active = <0>;
-                    pclk-sample = <1>;
-                };
-            };
-
-            port@1 {
-                reg = <1>;
-                vin_from_csi2rx: endpoint {
-                    remote-endpoint = <&csi2rx_to_vin>;
-                };
-            };
-        };
-    };

-- 
2.53.0

