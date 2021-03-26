Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF8470
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 21:17:26 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id k25so6811504iob.6
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 14:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IV3b7vhYuwtS05r2NRQRDhOfyZGYCKToQH4+CvwJ9dM=;
        b=HSzzfd/Vai7Ks+tr2zKX/4lXA1pXyMx+Wm5NBFR9st0MCKht/ylCvHvMkkT08jgFn+
         EuFf1KVR3r++tdamDdP2fcY0tSSE97/bKkljvdvyYRgOGaZc00kK7vY1d4k5EiKJAn3o
         7yAcFPYcADq7L71yODWGw9oenNJ/rLiKFHAXSm9hexUNJsMi1IqLo9CJi9M8UfoXHJOb
         1GppyJqPw4vGdGgRBsOCpKJ+5pSM7FD8jVI7YgeFD5k8FWl9gFSydvZhj477uJvFg0LR
         1kwTz9yRQRNgmPMi1TCmgor6cfdnsR1BKyqG1YaT9rzud5txnmnYOIpfPpckDjT1GDD5
         9HiQ==
X-Gm-Message-State: AOAM533tVofGapvV16JiAhq1Mc2LlkBlOlhjX1dA1Nx0Y3SYCFJqJ9AE
	8PFDJuUxEVMkaV8GfI0dkA==
X-Google-Smtp-Source: ABdhPJw9dLx299YuPw0ZfWiYKtkorUQsV1RINcxeejPobNPJo0B5D1FGs8LOlL/k5NFPG6CJGAegvQ==
X-Received: by 2002:a6b:5811:: with SMTP id m17mr11428969iob.102.1616793445984;
        Fri, 26 Mar 2021 14:17:25 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id q207sm5117196iod.6.2021.03.26.14.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 14:17:25 -0700 (PDT)
Received: (nullmailer pid 3875509 invoked by uid 1000);
	Fri, 26 Mar 2021 21:17:23 -0000
Date: Fri, 26 Mar 2021 15:17:23 -0600
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5 (RESEND) 4/7] mfd: hi6421-spmi-pmic: move driver from
 staging
Message-ID: <20210326211723.GB3867921@robh.at.kernel.org>
References: <cover.1616695231.git.mchehab+huawei@kernel.org>
 <de3603a366c172923771d3f01aa83b70cbba2199.1616695231.git.mchehab+huawei@kernel.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de3603a366c172923771d3f01aa83b70cbba2199.1616695231.git.mchehab+huawei@kernel.org>

On Thu, Mar 25, 2021 at 07:05:36PM +0100, Mauro Carvalho Chehab wrote:
> This driver is ready for mainstream. So, move it out of staging.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../mfd/hisilicon,hi6421-spmi-pmic.yaml       | 135 ++++++++
>  MAINTAINERS                                   |   7 +
>  drivers/mfd/Kconfig                           |  16 +
>  drivers/mfd/Makefile                          |   1 +
>  drivers/mfd/hi6421-spmi-pmic.c                | 297 ++++++++++++++++++
>  drivers/staging/hikey9xx/Kconfig              |  18 --
>  drivers/staging/hikey9xx/Makefile             |   1 -
>  drivers/staging/hikey9xx/hi6421-spmi-pmic.c   | 297 ------------------
>  .../hikey9xx/hisilicon,hi6421-spmi-pmic.yaml  | 135 --------
>  9 files changed, 456 insertions(+), 451 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
>  create mode 100644 drivers/mfd/hi6421-spmi-pmic.c
>  delete mode 100644 drivers/staging/hikey9xx/hi6421-spmi-pmic.c
>  delete mode 100644 drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
> new file mode 100644
> index 000000000000..3b23ad56b31a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
> @@ -0,0 +1,135 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/hisilicon,hi6421-spmi-pmic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: HiSilicon 6421v600 SPMI PMIC
> +
> +maintainers:
> +  - Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> +
> +description: |
> +  HiSilicon 6421v600 should be connected inside a MIPI System Power Management
> +  (SPMI) bus. It provides interrupts and power supply.
> +
> +  The GPIO and interrupt settings are represented as part of the top-level PMIC
> +  node.
> +
> +  The SPMI controller part is provided by
> +  drivers/staging/hikey9xx/hisilicon,hisi-spmi-controller.yaml.

Needs updating.

> +
> +properties:
> +  $nodename:
> +    pattern: "pmic@[0-9a-f]"
> +
> +  compatible:
> +    const: hisilicon,hi6421v600-spmi
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  interrupt-controller:
> +    description:
> +      Identify that the PMIC is capable of behaving as an interrupt controller.

Don't need generic descriptions of common properties. Just:

interrupt-controller: true

> +
> +  gpios:

A named gpio is preferred (foo-gpios).

What is this gpio for?

> +    maxItems: 1
> +
> +  regulators:
> +    type: object
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      '^ldo[0-9]+@[0-9a-f]$':
> +        type: object
> +
> +        $ref: "/schemas/regulator/regulator.yaml#"
> +
> +required:
> +  - compatible
> +  - reg
> +  - regulators
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    /* pmic properties */
> +
> +    pmic: pmic@0 {
> +      compatible = "hisilicon,hi6421-spmi";
> +      reg = <0 0>;
> +
> +      #interrupt-cells = <2>;
> +      interrupt-controller;
> +      gpios = <&gpio28 0 0>;
> +
> +      regulators {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ldo3: LDO3 {
> +          regulator-name = "ldo3";
> +          regulator-min-microvolt = <1500000>;
> +          regulator-max-microvolt = <2000000>;
> +          regulator-boot-on;
> +        };
> +
> +        ldo4: LDO4 {
> +          regulator-name = "ldo4";
> +          regulator-min-microvolt = <1725000>;
> +          regulator-max-microvolt = <1900000>;
> +          regulator-boot-on;
> +        };
> +
> +        ldo9: LDO9 {
> +          regulator-name = "ldo9";
> +          regulator-min-microvolt = <1750000>;
> +          regulator-max-microvolt = <3300000>;
> +          regulator-boot-on;
> +        };
> +
> +        ldo15: LDO15 {
> +          regulator-name = "ldo15";
> +          regulator-min-microvolt = <1800000>;
> +          regulator-max-microvolt = <3000000>;
> +          regulator-always-on;
> +        };
> +
> +        ldo16: LDO16 {
> +          regulator-name = "ldo16";
> +          regulator-min-microvolt = <1800000>;
> +          regulator-max-microvolt = <3000000>;
> +          regulator-boot-on;
> +        };
> +
> +        ldo17: LDO17 {
> +          regulator-name = "ldo17";
> +          regulator-min-microvolt = <2500000>;
> +          regulator-max-microvolt = <3300000>;
> +        };
> +
> +        ldo33: LDO33 {
> +          regulator-name = "ldo33";
> +          regulator-min-microvolt = <2500000>;
> +          regulator-max-microvolt = <3300000>;
> +          regulator-boot-on;
> +        };
> +
> +        ldo34: LDO34 {
> +          regulator-name = "ldo34";
> +          regulator-min-microvolt = <2600000>;
> +          regulator-max-microvolt = <3300000>;
> +        };
> +      };
> +    };
