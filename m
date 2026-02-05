Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAB63A9DA5;
	Thu,  5 Feb 2026 11:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770289852; cv=none; b=soAYMUX1bwzQZBp2MqBJe2eUR8jYqm8WXpkQl22eS2tBkBTpJhTZ0WriVxPOjhzm9/Lor7CVNBrmt895H81gXOdXkGM4YEWEOGMspjhlTzntbloXbOWILYrdqPAxUZRRBeKaD7l3kW7P2aLVl7RPCTgPb0W6lCRAhMhrJZYA9Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770289852; c=relaxed/simple;
	bh=ef82lnxssjXnKtmnb01zXLH2Zv2OZW5yPB6rQ58LDPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CcD0Jbow8LbtABVj5cMXAi9yPDqBjrQAiQubiLiH8B2yUxwYY2jX77kmWOOnSWx5OVebb7DycEYp0kpploItSpRP9ahMpiUGGDCtbhYoIr8ZxjR3weqyIvRodkAuFXGNqRZEOU7qD51A1+ySg4Yk7WxABPFGaY4AziAYoh5w6U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=COXRrSWQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="COXRrSWQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53370C16AAE;
	Thu,  5 Feb 2026 11:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770289851;
	bh=ef82lnxssjXnKtmnb01zXLH2Zv2OZW5yPB6rQ58LDPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=COXRrSWQPWUh2pRoITtas7mgFGneYmTEm7q1CfKnBJBtuGx28L2vVXSyHbVKfjfZT
	 UN0zzUxk2khhmfEsO0pbDNThU+Bhu1XbTIW+DG4W7OzunkqFTv4Gqvr9VWTfBvYjaC
	 Dqe9vrgkVrA6BBy4j0iv0cLwrSlxf1K/T2VVLrsvYWsT8j6N1RawEBCtlRO0XvXeq0
	 3UL03Xngqt3OA2vCnmdUDhqkuYTU5yFsScbKP7HtzrOsFSsr1WzIMml24/gcqa4gFs
	 dW/1HvIFobOuUNOO8efrAESGIpJvgOqsnbG8dL/waUpJ2pYGuaAKXyH7Pvh5MiWpsT
	 8lkhVl/uf2POQ==
Date: Thu, 5 Feb 2026 12:10:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: harshdaniel66356@gmail.com
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com, 
	gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-staging@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: dt-bindings: media: microchip,dim2: Add
 MediaLB DIM2 binding
Message-ID: <20260205-yellow-lion-of-satiation-ffccc9@quoll>
References: <20260203041325.12419-1-harshdaniel66356@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260203041325.12419-1-harshdaniel66356@gmail.com>

On Tue, Feb 03, 2026 at 09:43:25AM +0530, harshdaniel66356@gmail.com wrote:
> From: Harsh Daniel <harshdaniel66356@gmail.com>
> 
> Add device tree binding documentation for the MediaLB DIM2 module found in
> Microchip (formerly SMSC/K2L) IP, used in Freescale i.MX6Q, Renesas
> R-Car Gen2/Gen3 SoCs, and Xilinx FPGAs.

Why? Thre is no user of this... or is there? Then commit msg should
explain that.

 
> This consolidates the previously proposed separate bindings into a single
> document as they share the same hardware block.

How is this relevant to git history? What are you referring to?

> 
> Signed-off-by: Harsh Daniel <harshdaniel66356@gmail.com>
> ---

This is v3, so where is the changelog? See submitting patches or just
use b4...

>  .../bindings/media/microchip,dim2.yaml        | 136 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 137 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/microchip,dim2.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/microchip,dim2.yaml b/Documentation/devicetree/bindings/media/microchip,dim2.yaml
> new file mode 100644
> index 000000000000..c8cbee47ab1e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/microchip,dim2.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/microchip,dim2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip MediaLB DIM2 Controller
> +
> +maintainers:
> +  - Andrey Shvetsov <andrey.shvetsov@k2l.de>
> +
> +description:
> +  MediaLB DIM2 module found in Freescale i.MX6Q, Renesas R-Car Gen2 and
> +  Gen3 SoCs, and Xilinx FPGAs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx6q-mlb150
> +      - renesas,rcar-gen3-mlp
> +      - xlnx,axi4-os62420_3pin-1.00.a
> +      - xlnx,axi4-os62420_6pin-1.00.a
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: MediaLB Interrupt
> +      - description: AHB0 Interrupt
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: core
> +      - const: pll8_mlb
> +
> +  microchip,clock-frequency:

No, that's not string but -hz... or some other number if justified
correctly.

Anyway, setting clock frequency as astatic is deprecated - it is not
suitable for DT. Use Common Clock Framework to get your clock frequency.

Maybe I miss the context here, but nothing in commit msg explained me
that. You also CANNOT use existing drivers as reason to document poor
API.


> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum:
> +      - 256fs
> +      - 512fs
> +      - 1024fs
> +      - 2048fs
> +      - 3072fs
> +      - 4096fs
> +      - 6144fs
> +      - 8192fs
> +    description:
> +      DIM2 clock speed as a multiple of the frame sync frequency.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - microchip,clock-frequency
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx6q-mlb150
> +    then:
> +      required:
> +        - clocks
> +        - clock-names
> +      properties:
> +        clocks:
> +          minItems: 2
> +        clock-names:
> +          minItems: 2
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,rcar-gen3-mlp
> +    then:
> +      required:
> +        - clocks
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - xlnx,axi4-os62420_3pin-1.00.a
> +              - xlnx,axi4-os62420_6pin-1.00.a
> +    then:
> +      properties:
> +        clocks: false
> +        clock-names: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    mlb@218e000 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

> +        compatible = "fsl,imx6q-mlb150";
> +        reg = <0x0218e000 0x4000>;
> +        interrupts = <0 150 IRQ_TYPE_LEVEL_HIGH>,
> +                     <0 151 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clks 1>, <&clks 2>;
> +        clock-names = "core", "pll8_mlb";
> +        microchip,clock-frequency = "2048fs";
> +    };
> +  - |
> +    /* Renesas example */

Drop comment.

> +    mlp@e6050000 {
> +        compatible = "renesas,rcar-gen3-mlp";
> +        reg = <0xe6050000 0x1000>;
> +        interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&cpg 123>;
> +        microchip,clock-frequency = "2048fs";

One or two examples are enough.

> +    };
> +  - |
> +    /* Xilinx example */
> +    dim2@43c00000 {
> +        compatible = "xlnx,axi4-os62420_3pin-1.00.a";
> +        reg = <0x43c00000 0x10000>;
> +        interrupts = <0 144 IRQ_TYPE_LEVEL_HIGH>,
> +                     <0 145 IRQ_TYPE_LEVEL_HIGH>;
> +        microchip,clock-frequency = "2048fs";
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b11839cba9d..f002a1117ef8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17650,6 +17650,7 @@ M:	Christian Gromm <christian.gromm@microchip.com>
>  S:	Maintained
>  F:	Documentation/ABI/testing/configfs-most
>  F:	Documentation/ABI/testing/sysfs-bus-most
> +F:	Documentation/devicetree/bindings/media/microchip,dim2.yaml

So now I learn that you do it for some existing driver? Why nothing in
commit msg explains that?

Best regards,
Krzysztof

