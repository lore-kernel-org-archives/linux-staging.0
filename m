Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0A3168
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 22:30:15 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id y4so2970697ilp.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 15:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Gjde37mHvPFkc/qpMmJUHdjtpOgHuL9GsR9sK9BVW8M=;
        b=iUC1jXb/+VX7/SY2WcEGxvYPTdllrck3ZZF90d8vaBCPErRDMEIpuxNNnrLggszyHF
         y5rxB+GHw9lxv2gPMj9yur96WkCA2Jx3V+3PvS4TW2oDbvCRiZmRCAiWDWQY+xLUUayT
         4EHmYWX4nNun3Sy1I7KJ2ulw0A2/uyuNcgbFWX3bGs6+Ptr01PrJMI8I75S+rtVnURhd
         j/+oKezXkGawFwLYb1ePCG1exkn8GiqB8gVHWj4BsHErTg8Nitj4AvuoJg3ptI9wtAgu
         qM8NhyovioI9HayNbUlcU6tI1ovSUoQ0zD9oSxHpxfJm2Mp+MkL1J4hcD7RSU0SDWhJF
         GVRw==
X-Gm-Message-State: AOAM530Ab4w6LaATaHPrtCSzel8TEyR13jvZDNc1G+znnBN2hQEV02KG
	QERFAyAWf/rzObDKEuvwVQ==
X-Google-Smtp-Source: ABdhPJy9TT6Z8iQ7uNouDvtXvNQjJhoeQtmZEmTGKfasYTb84bgdG+2OHXWAogSOXP6rAUT7DemLNQ==
X-Received: by 2002:a92:d9c6:: with SMTP id n6mr4923942ilq.142.1627079414849;
        Fri, 23 Jul 2021 15:30:14 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b15sm387349ilq.85.2021.07.23.15.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 15:30:14 -0700 (PDT)
Received: (nullmailer pid 2718115 invoked by uid 1000);
	Fri, 23 Jul 2021 22:30:11 -0000
Date: Fri, 23 Jul 2021 16:30:11 -0600
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxarm@huawei.com, mauro.chehab@huawei.com, Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v15 1/3] mfd: hi6421-spmi-pmic: move driver from staging
Message-ID: <20210723223011.GA2709437@robh.at.kernel.org>
References: <cover.1627025657.git.mchehab+huawei@kernel.org>
 <dd150f3ffa19c2dda0171f7dbe1dd63cce2a7af5.1627025657.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd150f3ffa19c2dda0171f7dbe1dd63cce2a7af5.1627025657.git.mchehab+huawei@kernel.org>

On Fri, Jul 23, 2021 at 09:40:06AM +0200, Mauro Carvalho Chehab wrote:
> This driver is ready for mainstream. So, move it out of staging.
> 
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../mfd/hisilicon,hi6421-spmi-pmic.yaml       | 136 ++++++++++++++++++
>  MAINTAINERS                                   |   7 +
>  drivers/mfd/Kconfig                           |  16 +++
>  drivers/mfd/Makefile                          |   1 +
>  drivers/mfd/hi6421-spmi-pmic.c                |  72 ++++++++++
>  drivers/staging/Kconfig                       |   2 -
>  drivers/staging/Makefile                      |   1 -
>  drivers/staging/hikey9xx/Kconfig              |  19 ---
>  drivers/staging/hikey9xx/Makefile             |   3 -
>  drivers/staging/hikey9xx/TODO                 |   5 -
>  drivers/staging/hikey9xx/hi6421-spmi-pmic.c   |  72 ----------
>  .../hikey9xx/hisilicon,hi6421-spmi-pmic.yaml  | 136 ------------------
>  12 files changed, 232 insertions(+), 238 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
>  create mode 100644 drivers/mfd/hi6421-spmi-pmic.c
>  delete mode 100644 drivers/staging/hikey9xx/Kconfig
>  delete mode 100644 drivers/staging/hikey9xx/Makefile
>  delete mode 100644 drivers/staging/hikey9xx/TODO
>  delete mode 100644 drivers/staging/hikey9xx/hi6421-spmi-pmic.c
>  delete mode 100644 drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
> new file mode 100644
> index 000000000000..cedf9d99a34b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
> @@ -0,0 +1,136 @@
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
> +  Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
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
> +  interrupt-controller: true
> +
> +  interrupts: true

Need to define how many:

maxItems: 1

> +
> +  regulators:
> +    type: object
> +
> +    additionalProperties: false
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      '^(ldo|LDO)[0-9]+$':

Please decide between 'ldo' and 'LDO'. lowercase is preferred generally 
for node names, but whatever is easier. Labels are a don't care.

With those,

Reviewed-by: Rob Herring <robh@kernel.org> # DT binding


> +        type: object
> +
> +        $ref: "/schemas/regulator/regulator.yaml#"
> +
> +        unevaluatedProperties: false
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
> +
> +    pmic: pmic@0 {
> +      compatible = "hisilicon,hi6421v600-spmi";
> +      reg = <0 0>;
> +
> +      #interrupt-cells = <2>;
> +      interrupt-controller;
> +      interrupt-parent = <&gpio28>;
> +      interrupts = <0 0>;
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
