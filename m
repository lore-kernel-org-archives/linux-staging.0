Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CC437A49C
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 15:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770045362; cv=none; b=Se6MiC2vVJCjThu04Nkno/+WAo/DTJLu6JO69wiOQcD/CrsTa6nWFA4kuDdfBLHjOWhQS66GlTLoesjjgWw3nM0bm1nF83ocvZfjOyGyBdVp37MGiWFYrimd+ltgwwYYxhonS/3CQRUAPBeRk2/AnURwUFk8Mso32nnrqWhycAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770045362; c=relaxed/simple;
	bh=0C7YXUmFLO4jUnfUB6PvUlfMYDCIAsCzsPf0qKWlbNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pBLh3iZOdPJBBqEv7iGW8tSrpL2m+l0MLJRjz3ChOe6NSdl8YFc6j5yZ03vINKgtqH7dK9w5GoF0sfFGEkp1MNT9tkOACD9B0v1DD0NaGZxZEh6s/LMM0+aIhZl+mHa4dQTBhifcVFZ1yDfpAYKJdaiyoOfjOPHgPagCxkBQZYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8c7g6dC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8c7g6dC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0FAC2BCB1
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 15:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770045361;
	bh=0C7YXUmFLO4jUnfUB6PvUlfMYDCIAsCzsPf0qKWlbNU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=H8c7g6dCF6g/GAD/DYW6DgVtUzt7sOeWAUuePm6ySBAD83Z8pryrsDJB7gKTWv8/9
	 TQl+qxRLcsJu98gSIoUn3+ZqjF+5RKur627d9Px6yNcHkN6HTmFSQQilmDuW1dU0T2
	 p/De90NpUEzlRjPDJbzvHZ5s1NJDbaHSSKvbzm5hVuYausjCjxzlPzmkOf/oToG1bd
	 QJrO6cE15gMlF+KuKg6vAePjIKfigDWyFrsMmcflWnyi1Co5xLyjhhZY6KcI43A3IR
	 4XyNLGu55q4aGSi/fZSoXWx5cXSLydlOMQTl1kxUOt0wwakgcZZ3VLuZ0AuEgeNNQp
	 CCRSCMjizzTDA==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b8863db032dso767137666b.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 07:16:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVlgcIAHzy3PMNJBVSk3AG35F7wR5S4yfyjhU/J2m+9DYr6bX8pAGuEmK0JibD44T8a1/kw9CESUh5XPf8A@lists.linux.dev
X-Gm-Message-State: AOJu0YwngPNZHyqkm016u7dSU7PIFQg7P7s7K2KQ06FGzU8oVVi21P74
	lr2lOZnPLDKWWwiCOcmgjK9hW9PZo7yQXvOC5qdnBnDVXzTpP4SswAxjAKfqweLgNaCAOL9xMX1
	w4ZFDsZ7R+6J3q1iw9kh6/jIpGQpBPA==
X-Received: by 2002:a17:907:7f94:b0:b8a:fd04:c789 with SMTP id
 a640c23a62f3a-b8dff5ff196mr667062766b.22.1770045360128; Mon, 02 Feb 2026
 07:16:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260130141442.139640-1-harshdaniel66356@gmail.com>
In-Reply-To: <20260130141442.139640-1-harshdaniel66356@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 2 Feb 2026 09:15:47 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+podtc-O5uDJ16uOUDmqxKiBXH8RdTYJs3Xv-+O2U1ng@mail.gmail.com>
X-Gm-Features: AZwV_QgVDYsVQbzvlBnrSRy7fDxc72QlOmIH1Br8rsKg-QqYADC1j7Ds9HtwhmQ
Message-ID: <CAL_Jsq+podtc-O5uDJ16uOUDmqxKiBXH8RdTYJs3Xv-+O2U1ng@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: media: Add bindings for dim2 compatible strings.
To: harshdaniel66356@gmail.com
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com, 
	gregkh@linuxfoundation.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-staging@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 8:15=E2=80=AFAM <harshdaniel66356@gmail.com> wrote:
>
> From: Harsh Daniel <harshdaniel66356@gmail.com>
>
> Add device tree bindings for the compatible strings used in the
> staging/most/dim2 driver to resolve checkpatch warnings:
> - fsl,imx6q-mlb150
> - renesas,mlp and renesas,rcar-gen3-mlp
> - xlnx,axi4-os62420_3pin-1.00.a and xlnx,axi4-os62420_6pin-1.00.a
>
> These bindings document the MediaLB DIM2 module found in Freescale
> i.MX6Q, Renesas R-Car, and Xilinx FPGA platforms.
>
> Signed-off-by: Harsh Daniel <harshdaniel66356@gmail.com>
> ---
>  .../bindings/media/fsl,imx6q-mlb150.yaml      | 73 +++++++++++++++++++
>  .../bindings/media/renesas,mlp.yaml           | 65 +++++++++++++++++
>  .../media/xilinx/xlnx,axi4-os62420.yaml       | 60 +++++++++++++++

These all look pretty similar and it's the same h/w block, so they
should be 1 binding doc.

>  MAINTAINERS                                   |  3 +
>  4 files changed, 201 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6q-mlb=
150.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,mlp.y=
aml
>  create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,a=
xi4-os62420.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/fsl,imx6q-mlb150.yam=
l b/Documentation/devicetree/bindings/media/fsl,imx6q-mlb150.yaml
> new file mode 100644
> index 000000000000..2d0aab3d2286
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/fsl,imx6q-mlb150.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/fsl,imx6q-mlb150.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX6Q MediaLB DIM2 Controller
> +
> +maintainers:
> +  - Andrey Shvetsov <andrey.shvetsov@k2l.de>
> +
> +description: |

Don't need '|'.

> +  MediaLB DIM2 module found in Freescale i.MX6Q SoCs.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx6q-mlb150
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
> +    maxItems: 2
> +    items:
> +      - const: mlb
> +      - const: pll8_mlb

Drop block name 'mlb'. Use 'core' or something related to the function.

> +
> +  microchip,clock-speed:

Use standard "clock-frequency".

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
> +    description: DIM2 clock speed.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - microchip,clock-speed
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    mlb@218e000 {
> +        compatible =3D "fsl,imx6q-mlb150";
> +        reg =3D <0x0218e000 0x4000>;
> +        interrupts =3D <0 150 IRQ_TYPE_LEVEL_HIGH>,
> +                     <0 151 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&clks 1>, <&clks 2>;
> +        clock-names =3D "mlb", "pll8_mlb";
> +        microchip,clock-speed =3D "2048fs";
> +    };
> diff --git a/Documentation/devicetree/bindings/media/renesas,mlp.yaml b/D=
ocumentation/devicetree/bindings/media/renesas,mlp.yaml
> new file mode 100644
> index 000000000000..dfd9045d87f2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,mlp.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/renesas,mlp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas MediaLB DIM2 Controller
> +
> +maintainers:
> +  - Andrey Shvetsov <andrey.shvetsov@k2l.de>
> +
> +description: |
> +  MediaLB DIM2 module found in Renesas R-Car Gen2 and Gen3 SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,mlp

Drop. Too generic. You need SoC specific compatibles.

> +      - renesas,rcar-gen3-mlp
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
> +    maxItems: 1
> +
> +  microchip,clock-speed:
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
> +    description: DIM2 clock speed.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - microchip,clock-speed
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    mlp@e6050000 {
> +        compatible =3D "renesas,mlp";
> +        reg =3D <0xe6050000 0x1000>;
> +        interrupts =3D <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&cpg 123>;
> +        microchip,clock-speed =3D "2048fs";
> +    };
> diff --git a/Documentation/devicetree/bindings/media/xilinx/xlnx,axi4-os6=
2420.yaml b/Documentation/devicetree/bindings/media/xilinx/xlnx,axi4-os6242=
0.yaml
> new file mode 100644
> index 000000000000..dd4ac5c6ccf3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,axi4-os62420.ya=
ml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/xilinx/xlnx,axi4-os62420.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xilinx MediaLB DIM2 Controller
> +
> +maintainers:
> +  - Andrey Shvetsov <andrey.shvetsov@k2l.de>
> +
> +description: |
> +  MediaLB DIM2 module found in Xilinx FPGAs.
> +
> +properties:
> +  compatible:
> +    enum:
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
> +  microchip,clock-speed:
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
> +    description: DIM2 clock speed.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - microchip,clock-speed
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    dim2@e6050000 {
> +        compatible =3D "xlnx,axi4-os62420_3pin-1.00.a";
> +        reg =3D <0x43c00000 0x10000>;
> +        interrupts =3D <0 144 IRQ_TYPE_LEVEL_HIGH>,
> +                     <0 145 IRQ_TYPE_LEVEL_HIGH>;
> +        microchip,clock-speed =3D "2048fs";
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b11839cba9d..914693621b3b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17650,6 +17650,9 @@ M:      Christian Gromm <christian.gromm@microchi=
p.com>
>  S:     Maintained
>  F:     Documentation/ABI/testing/configfs-most
>  F:     Documentation/ABI/testing/sysfs-bus-most
> +F:     Documentation/devicetree/bindings/media/fsl,imx6q-mlb150.yaml
> +F:     Documentation/devicetree/bindings/media/renesas,mlp.yaml
> +F:     Documentation/devicetree/bindings/media/xilinx/xlnx,axi4-os62420.=
yaml
>  F:     drivers/most/
>  F:     drivers/staging/most/
>  F:     include/linux/most.h
> --
> 2.52.0
>
>
