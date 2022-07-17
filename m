Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141D180F;
	Sun, 17 Jul 2022 11:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658057832; x=1689593832;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X6aY0q+5aDpSXPBzmndb3qPcsEz32yV4MXOhg75mJSM=;
  b=Fw2UrD+/3u8XtuE3ge1PRaXeZiKN2ZQaoRyCqdYdrtYo3EJgW8DEQTGY
   kcOILwiUi4f1SNcYvFEd/v4vmha4/SBBBtOlYaz9n3OgtSfHwZY2Wv6DD
   mtSRz9tBzP0fJYlgXcUWz0kpMNchKs7fCYQLjg87C1scnMl7zs9ZD5dMT
   q5XgsJfWpD7AdCxDiCYRwGlV/OOJZROoRH9yBzMqTqX0ANVRO/zqwQA8k
   tldVg3IsxDby/6o1ZVI6uXm60gnibmar2nCwb2BEX5fySIw4CJGrbwP+F
   AFswGWVcmC+YnMgAjeksymv4VcdIcBhByKKbFYmU58TYLgPZS0xQ2ZNOg
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10410"; a="283617026"
X-IronPort-AV: E=Sophos;i="5.92,279,1650956400"; 
   d="scan'208";a="283617026"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2022 04:37:11 -0700
X-IronPort-AV: E=Sophos;i="5.92,279,1650956400"; 
   d="scan'208";a="739155206"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2022 04:37:07 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 16DCD20521;
	Sun, 17 Jul 2022 14:37:05 +0300 (EEST)
Date: Sun, 17 Jul 2022 11:37:05 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/6] dt-bindings: media: Add Allwinner A31 ISP
 bindings documentation
Message-ID: <YtP0YfPteyzsBWn3@paasikivi.fi.intel.com>
References: <20220704173523.76729-1-paul.kocialkowski@bootlin.com>
 <20220704173523.76729-2-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220704173523.76729-2-paul.kocialkowski@bootlin.com>

Hi Paul,

On Mon, Jul 04, 2022 at 07:35:18PM +0200, Paul Kocialkowski wrote:
> This introduces YAML bindings documentation for the Allwinner A31 Image
> Signal Processor (ISP).
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../media/allwinner,sun6i-a31-isp.yaml        | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml
> new file mode 100644
> index 000000000000..2fda6e05e16c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/allwinner,sun6i-a31-isp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner A31 Image Signal Processor Driver (ISP) Device Tree Bindings
> +
> +maintainers:
> +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - allwinner,sun6i-a31-isp
> +      - allwinner,sun8i-v3s-isp
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Bus Clock
> +      - description: Module Clock
> +      - description: DRAM Clock
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: mod
> +      - const: ram
> +
> +  resets:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: CSI0 input port
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: CSI1 input port

Do both support a single PHY with a single data only? If multiple data lanes
are supported, please require data-lanes property (on endpoint).

> +
> +    anyOf:
> +      - required:
> +          - port@0
> +      - required:
> +          - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/sun8i-v3s-ccu.h>
> +    #include <dt-bindings/reset/sun8i-v3s-ccu.h>
> +
> +    isp: isp@1cb8000 {
> +        compatible = "allwinner,sun8i-v3s-isp";
> +        reg = <0x01cb8000 0x1000>;
> +        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&ccu CLK_BUS_CSI>,
> +             <&ccu CLK_CSI1_SCLK>,
> +             <&ccu CLK_DRAM_CSI>;
> +        clock-names = "bus", "mod", "ram";
> +        resets = <&ccu RST_BUS_CSI>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                isp_in_csi0: endpoint {
> +                    remote-endpoint = <&csi0_out_isp>;
> +                };
> +            };
> +        };
> +    };
> +
> +...

-- 
Sakari Ailus
