Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA9070
	for <linux-staging@lists.linux.dev>; Fri,  4 Jun 2021 19:35:09 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id q9-20020a9d66490000b02903c741e5b703so9034308otm.0
        for <linux-staging@lists.linux.dev>; Fri, 04 Jun 2021 12:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O/pbbPX1lqUgytKlvUljHlFJ1H7nYUFeTkZMRTwo+lk=;
        b=f+pr+qydYD7r7aG/hqCdA9xaB2lfcRoB6QsXJFAhgF6A+R9NJwL2nhdlL1rk33gRrE
         J1xGVynEplhm2gWnY3mwSVlQyoxVdGhWdk9WWdsEz48mNm/CXa3wevusauHLHdIXE66D
         KKxM6RBTdRFCsFoGsISa8uJDFslYijOUQmTAO6q22GLzBBDLjhGrvH6ZTO06IsT4fNsh
         BO6DvyxH0UoxGVn1Wb28D1LY9CzdIGH1rAz4NdEMIdZ17BNumwWYHbZ4kQ4Q+snpFdaN
         7mOffhfZqZvEXmupPDN5Ex6a/82aMB7KfMiyqqeztTmh/bsjB6/63GEpk1vUOmavxftG
         O9aw==
X-Gm-Message-State: AOAM533ycydqPujN/60S2eeDDA1WErDgFRM1nvxWQYgzt0CWzJ3rEBU+
	GIpi7Qa6rAyhIBs22DVFgA==
X-Google-Smtp-Source: ABdhPJxag1L5t/y/4IQF7KfiZOuA5PYdISL/+mwb6P72qkuiXFgDDAjaf/5Z/1XMxfwfju/JjjXL2A==
X-Received: by 2002:a05:6830:4006:: with SMTP id h6mr5104644ots.348.1622835308724;
        Fri, 04 Jun 2021 12:35:08 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i19sm303182otp.81.2021.06.04.12.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 12:35:08 -0700 (PDT)
Received: (nullmailer pid 3775738 invoked by uid 1000);
	Fri, 04 Jun 2021 19:35:06 -0000
Date: Fri, 4 Jun 2021 14:35:06 -0500
From: Rob Herring <robh@kernel.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-mips@vger.kernel.org, tsbogend@alpha.franken.de, devicetree@vger.kernel.org, matthias.bgg@gmail.com, john@phrozen.org, bhelgaas@google.com, linux-staging@lists.linux.dev, gregkh@linuxfoundation.org, neil@brown.name, ilya.lipnitskiy@gmail.com, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mt7621-pci: PCIe binding documentation
 for MT7621 SoCs
Message-ID: <20210604193506.GC3695694@robh.at.kernel.org>
References: <20210515124055.22225-1-sergio.paracuellos@gmail.com>
 <20210515124055.22225-2-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210515124055.22225-2-sergio.paracuellos@gmail.com>

On Sat, May 15, 2021 at 02:40:52PM +0200, Sergio Paracuellos wrote:
> Add device tree binding documentation for PCIe in MT7621 SoCs.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  .../bindings/pci/mediatek,mt7621-pci.yaml     | 149 ++++++++++++++++++
>  1 file changed, 149 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/mediatek,mt7621-pci.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pci.yaml b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pci.yaml
> new file mode 100644
> index 000000000000..7f5f9d583032
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pci.yaml
> @@ -0,0 +1,149 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/mediatek,mt7621-pci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT7621 PCIe controller
> +
> +maintainers:
> +  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
> +
> +description: |+
> +  MediaTek MT7621 PCIe subsys supports single Root complex (RC)
> +  with 3 Root Ports. Each Root Ports supports a Gen1 1-lane Link
> +
> +allOf:
> +  - $ref: /schemas/pci/pci-bus.yaml#
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt7621-pci
> +
> +  reg:
> +    items:
> +      - description: host-pci bridge registers
> +      - description: pcie port 0 RC control registers
> +      - description: pcie port 1 RC control registers
> +      - description: pcie port 2 RC control registers
> +
> +  ranges:
> +    maxItems: 2
> +
> +  resets:
> +    items:
> +      - description: pcie port 0 reset.
> +      - description: pcie port 1 reset.
> +      - description: pcie port 2 reset.
> +
> +  reset-names:
> +    items:
> +      - const: pcie0
> +      - const: pcie1
> +      - const: pcie2
> +
> +  clocks:
> +    items:
> +      - description: pcie port 0 clock.
> +      - description: pcie port 1 clock.
> +      - description: pcie port 2 clock.
> +
> +  clock-names:
> +    items:
> +      - const: pcie0
> +      - const: pcie1
> +      - const: pcie2
> +
> +  phys:
> +    items:
> +      - description: Dual-ported phy for pcie port 0 and 1.
> +      - description: Phy for pcie port 2.
> +
> +  phy-names:
> +    items:
> +      - const: pcie-phy0
> +      - const: pcie-phy2

If you're going to keep the ports (and I think that's right because 
there's only a single PCI address space AFAICT), then I think you should 
move resets, clocks, and phys into each port node.

So you'll need to define 'pcie@[0-2],0' node with those properties under 
it.

> +
> +required:
> +  - compatible
> +  - reg
> +  - ranges
> +  - "#interrupt-cells"
> +  - interrupt-map-mask
> +  - interrupt-map
> +  - resets
> +  - reset-names
> +  - clocks
> +  - clock-names
> +  - phys
> +  - phy-names
> +  - reset-gpios
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/mips-gic.h>
> +
> +    pcie: pcie@1e140000 {
> +        compatible = "mediatek,mt7621-pci";
> +        reg = <0x1e140000 0x100>,
> +              <0x1e142000 0x100>,
> +              <0x1e143000 0x100>,
> +              <0x1e144000 0x100>;
> +
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pcie_pins>;
> +        device_type = "pci";
> +        ranges = <0x02000000 0 0x00000000 0x60000000 0 0x10000000>,  /* pci memory */
> +                 <0x01000000 0 0x00000000 0x1e160000 0 0x00010000>;  /* io space */
> +        #interrupt-cells = <1>;
> +        interrupt-map-mask = <0xF800 0 0 0>;
> +        interrupt-map = <0x0000 0 0 0 &gic GIC_SHARED 4 IRQ_TYPE_LEVEL_HIGH>,
> +                        <0x0800 0 0 0 &gic GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>,
> +                        <0x1000 0 0 0 &gic GIC_SHARED 25 IRQ_TYPE_LEVEL_HIGH>;
> +        resets = <&rstctrl 24>, <&rstctrl 25>, <&rstctrl 26>;
> +        reset-names = "pcie0", "pcie1", "pcie2";
> +        clocks = <&clkctrl 24>, <&clkctrl 25>, <&clkctrl 26>;
> +        clock-names = "pcie0", "pcie1", "pcie2";
> +        phys = <&pcie0_phy 1>, <&pcie2_phy 0>;
> +        phy-names = "pcie-phy0", "pcie-phy2";
> +        reset-gpios = <&gpio 19 GPIO_ACTIVE_LOW>;
> +
> +        pcie@0,0 {
> +            reg = <0x0000 0 0 0 0>;
> +            #address-cells = <3>;
> +            #size-cells = <2>;
> +            device_type = "pci";
> +            #interrupt-cells = <1>;
> +            interrupt-map-mask = <0 0 0 0>;
> +            interrupt-map = <0 0 0 0 &gic GIC_SHARED 4 IRQ_TYPE_LEVEL_HIGH>;
> +            ranges;
> +        };
> +
> +        pcie@1,0 {
> +            reg = <0x0800 0 0 0 0>;
> +            #address-cells = <3>;
> +            #size-cells = <2>;
> +            device_type = "pci";
> +            #interrupt-cells = <1>;
> +            interrupt-map-mask = <0 0 0 0>;
> +            interrupt-map = <0 0 0 0 &gic GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>;
> +            ranges;
> +        };
> +
> +        pcie@2,0 {
> +            reg = <0x1000 0 0 0 0>;
> +            #address-cells = <3>;
> +            #size-cells = <2>;
> +            device_type = "pci";
> +            #interrupt-cells = <1>;
> +            interrupt-map-mask = <0 0 0 0>;
> +            interrupt-map = <0 0 0 0 &gic GIC_SHARED 25 IRQ_TYPE_LEVEL_HIGH>;
> +            ranges;
> +        };
> +    };
> +...
> -- 
> 2.25.1
