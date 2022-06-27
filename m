Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9429A4C89
	for <linux-staging@lists.linux.dev>; Mon, 27 Jun 2022 22:25:25 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id k7so6982912ils.8
        for <linux-staging@lists.linux.dev>; Mon, 27 Jun 2022 15:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xPl5d+aNcqE9cDBG3G/otoyoA/ZIfmiAIqcA/be9AUQ=;
        b=cPUGl9qsPUt+C3qNaoyKs3chvRNQ/2uiqjwWw9/NpyHI8faYp/+051PGalRG5sd9QO
         am2UREIOX+swKkEruStc9vJU+R9nUIrvODxwhGWXwVFjOZXQGBmWi218V56JItvIg3sR
         gxxKmTvrVgV0RuxAsLwtz1AAyHDiZAein0TAjsBPlUoLQILqHFGiW8MkiywsK537UeIX
         dzXhaEgfuUG7jd9Kng5AgdHa/Ue5DWzaJSLYP27J33NK6rGcaDY9DGIQ5AZyGD/y8L4Z
         Mghvz6wUyP0cyUwDRYjkm5U2t7tw5N3Hil9Cajh5Hkga2Gj5a+lnBoEIipT86oN2n9/Q
         k6Og==
X-Gm-Message-State: AJIora8YxtRhkLsEXSpZr6fjtFfUSpDtEgaRuLzjoc9XiMAFzO4PMWb1
	ygdgpBxYrHL2/0VbQSJcXg==
X-Google-Smtp-Source: AGRyM1s2YGaEBy6p5QS578o6Kmq3oHW6dPUUNTJsordKAInVNfZbRNjeBeQ//9YN/X5RgBK3WMJqzA==
X-Received: by 2002:a05:6e02:1bc4:b0:2da:7a81:1c9a with SMTP id x4-20020a056e021bc400b002da7a811c9amr7050769ilv.213.1656368724623;
        Mon, 27 Jun 2022 15:25:24 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id k3-20020a6bef03000000b0067511446707sm4858733ioh.21.2022.06.27.15.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 15:25:24 -0700 (PDT)
Received: (nullmailer pid 3076525 invoked by uid 1000);
	Mon, 27 Jun 2022 22:25:22 -0000
Date: Mon, 27 Jun 2022 16:25:22 -0600
From: Rob Herring <robh@kernel.org>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrea Merello <andrea.merello@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, Jacopo Mondi <jacopo@jmondi.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: staging: iio: imu: Document CEVA BNO08x
Message-ID: <20220627222522.GA3067718-robh@kernel.org>
References: <20220616100006.22045-1-jacopo+renesas@jmondi.org>
 <20220616100006.22045-2-jacopo+renesas@jmondi.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616100006.22045-2-jacopo+renesas@jmondi.org>

On Thu, Jun 16, 2022 at 12:00:05PM +0200, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo@jmondi.org>
> 
> Document CEVA BNO08x (080, 085 and 086) Sensor Hub.
> 
> The BNO08X family (BNO080/85/86) is a System in Package (SiP) that
> integrates a triaxial accelerometer, triaxial gyroscope, magnetometer
> and a 32-bit ARM Cortex-M0+ microcontroller running CEVA's SH-2
> firmware.
> 
> Datasheet:
> https://www.ceva-dsp.com/wp-content/uploads/2019/10/BNO080_085-Datasheet.pdf
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../bindings/staging/iio/imu/ceva,bno08x.yaml | 63 +++++++++++++++++++

You expect this binding to change? If so, then why define the ABI. If 
not, then why is it in staging? IOW, I don't really want additions to 
bindings/staging/.

If this isn't in a .dts file and the driver isn't stable yet, then just 
don't document it until it is.

>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/staging/iio/imu/ceva,bno08x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/staging/iio/imu/ceva,bno08x.yaml b/Documentation/devicetree/bindings/staging/iio/imu/ceva,bno08x.yaml
> new file mode 100644
> index 000000000000..f7d6ea6d9147
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/staging/iio/imu/ceva,bno08x.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/staging/iio/imu/ceva,bno08x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CEVA BNO080/85/86
> +
> +maintainers:
> +  - Jacopo Mondi <jacopo@jmondi.org>
> +
> +description: |
> +  CEVA BNO08x is a System in Package (SiP) that integrates a triaxial
> +  accelerometer, triaxial gyroscope, magnetometer and a 32-bit ARM Cortex-M0+
> +  microcontroller running CEVA's SH-2 firmware.
> +
> +  The BNO08x family is documented at
> +  https://www.ceva-dsp.com/product/bno080-085/
> +  https://www.ceva-dsp.com/wp-content/uploads/2019/10/BNO080_085-Datasheet.pdf
> +
> +  The SH-2 firmware reference is available at
> +  https://cdn.sparkfun.com/assets/4/d/9/3/8/SH-2-Reference-Manual-v1.2.pdf
> +  https://cdn.sparkfun.com/assets/7/6/9/3/c/Sensor-Hub-Transport-Protocol-v1.7.pdf
> +
> +properties:
> +  compatible:
> +    const: ceva,bno08x

Don't use wildcards in compatibles.

> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      Phandle to the GPIO connected to the chip H_INTN (Host Interrupt) pin.
> +      The interrupt type shall be IRQ_TYPE_EDGE_FALLING.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        bno080: imu@4b {
> +            compatible = "ceva,bno08x";
> +            interrupt-parent = <&gpio5>;
> +            interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
> +            reg = <0x4b>;
> +        };
> +    };
> +
> --
> 2.35.1
> 
> 
