Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D16170
	for <linux-staging@lists.linux.dev>; Fri,  4 Jun 2021 21:37:29 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id j17-20020a0568200231b029024900620310so1317214oob.7
        for <linux-staging@lists.linux.dev>; Fri, 04 Jun 2021 14:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Utd5Q3vo5MjFZyun8vrWlVKBnn1w3zWcUu6IodeWHUU=;
        b=kQB/gsIGCB0hJN3yjwZaNls7I/dlHGagcBelxhYUPzh1wUspX/yrX6GTwz/YpoDLsI
         96w1Nj4f0paRgRSz4HNPB4VEasu5mktyfK5Zos5g/R9vcRdpjJKSMRgUeatdHG1FBBrt
         2FwTB2Cx84yCBgQ2LJNcT+QDyFH+AMtfx71yA2TlE+fycOepcE47aNoSJFmyC+oYS58V
         AexBpGfrjoM9jHo7UEtZHfoEbZUQiLk3l0yTe9/1PdP87ItsmDsnsotw+FzTiIIa4wPi
         UpG8wY6kqWgEom1o1o9BIQZE3VRwp1AFlmx68a0XnT0J9nz19G5raNV/BVU9940FCDAm
         2wcw==
X-Gm-Message-State: AOAM533SJYSkd1aogThVK2F0BYInZ5FDNLixrtB9LbAz9njj5u9dKw15
	Y/XNf51SE8biRq/FdPAiww==
X-Google-Smtp-Source: ABdhPJzvJgDQDeMiCoKjZthSNJrKCtqHQg3qyuYlPMBVAbp34R47bLfNiQpR/eAri9x8YIz3Ym8j4g==
X-Received: by 2002:a4a:d85:: with SMTP id 127mr5337961oob.26.1622842648813;
        Fri, 04 Jun 2021 14:37:28 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m1sm731257otq.12.2021.06.04.14.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 14:37:28 -0700 (PDT)
Received: (nullmailer pid 3965565 invoked by uid 1000);
	Fri, 04 Jun 2021 21:37:26 -0000
Date: Fri, 4 Jun 2021 16:37:26 -0500
From: Rob Herring <robh@kernel.org>
To: Martin Kepplinger <martin.kepplinger@puri.sm>
Cc: festevam@gmail.com, krzk@kernel.org, laurent.pinchart@ideasonboard.com, mchehab@kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, kernel@puri.sm, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, shawnguo@kernel.org, slongerbeam@gmail.com, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: media: document the
 nxp,imx8mq-mipi-csi2 receiver phy and controller
Message-ID: <20210604213726.GA3960263@robh.at.kernel.org>
References: <20210531112326.90094-1-martin.kepplinger@puri.sm>
 <20210531112326.90094-2-martin.kepplinger@puri.sm>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210531112326.90094-2-martin.kepplinger@puri.sm>

On Mon, May 31, 2021 at 01:23:24PM +0200, Martin Kepplinger wrote:
> The i.MX8MQ SoC integrates a different MIPI CSI receiver as the i.MX8MM so
> describe the DT bindings for it.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
>  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml  | 162 ++++++++++++++++++
>  1 file changed, 162 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> new file mode 100644
> index 000000000000..4e3b17c220fc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> @@ -0,0 +1,162 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/nxp,imx8mq-mipi-csi2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP and i.MX8MQ MIPI CSI-2 receiver
> +
> +maintainers:
> +  - Martin Kepplinger <martin.kepplinger@puri.sm>
> +
> +description: |-
> +  This binding covers the CSI-2 RX PHY and host controller included in the
> +  NXP i.MX8MQ SoC. It handles the sensor/image input and process for all the
> +  input imaging devices.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8mq-mipi-csi2
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 4
> +
> +  clock-names:
> +    minItems: 4
> +    items:
> +      - const: core
> +      - const: esc
> +      - const: pxl
> +      - const: clko2
> +
> +  assigned-clocks:
> +    maxItems: 3
> +
> +  assigned-clock-rates:
> +    maxItems: 3
> +
> +  assigned-clock-parents:
> +    maxItems: 3
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  phy-reset:
> +    description:
> +      The phandle to the imx8mq reset-controller.
> +    maxItems: 1

Sounds like this should use the reset binding.

> +
> +  phy-gpr:
> +    description:
> +      The phandle to the imx8mq syscon iomux-gpr.
> +    maxItems: 1

Should be using the phy binding?

> +
> +  interconnects:
> +    maxItems: 1
> +
> +  interconnect-names:
> +    const: dram
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port node, single endpoint describing the CSI-2 transmitter.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                items:
> +                  minItems: 1
> +                  maxItems: 4
> +                  items:
> +                    - const: 1
> +                    - const: 2
> +                    - const: 3
> +                    - const: 4
> +
> +            required:
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Output port node
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - assigned-clocks
> +  - assigned-clock-rates
> +  - assigned-clock-parents
> +  - power-domains
> +  - phy-reset
> +  - phy-gpr
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mq-clock.h>
> +    #include <dt-bindings/interconnect/imx8mq.h>
> +
> +    mipi_csi1@30a70000 {

csi@...

> +        compatible = "fsl,imx8mq-mipi-csi2";
> +        reg = <0x30a70000 0x1000>; /* MIPI CSI1 Controller base addr */
> +        clocks = <&clk IMX8MQ_CLK_CSI1_CORE>,
> +                 <&clk IMX8MQ_CLK_CSI1_ESC>,
> +                 <&clk IMX8MQ_CLK_CSI1_PHY_REF>,
> +                 <&clk IMX8MQ_CLK_CLKO2>;
> +        clock-names = "core", "esc", "pxl", "clko2";
> +        assigned-clocks = <&clk IMX8MQ_CLK_CSI1_CORE>,
> +                          <&clk IMX8MQ_CLK_CSI1_PHY_REF>,
> +                          <&clk IMX8MQ_CLK_CSI1_ESC>;
> +        assigned-clock-rates = <266000000>, <200000000>, <66000000>;
> +        assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_266M>,
> +                                 <&clk IMX8MQ_SYS2_PLL_1000M>,
> +                                 <&clk IMX8MQ_SYS1_PLL_800M>;
> +        power-domains = <&pgc_mipi_csi1>;
> +        phy-reset = <&src>;
> +        phy-gpr = <&iomuxc_gpr>;
> +        interconnects = <&noc IMX8MQ_ICM_CSI1 &noc IMX8MQ_ICS_DRAM>;
> +        interconnect-names = "dram";
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                imx8mm_mipi_csi_in: endpoint {
> +                    remote-endpoint = <&imx477_out>;
> +                    data-lanes = <1 2 3 4>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                imx8mm_mipi_csi_out: endpoint {
> +                    remote-endpoint = <&csi_in>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.30.2
