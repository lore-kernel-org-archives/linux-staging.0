Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB09B2C80
	for <linux-staging@lists.linux.dev>; Mon, 29 Nov 2021 01:12:22 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id v19-20020a4a2453000000b002bb88bfb594so5208643oov.4
        for <linux-staging@lists.linux.dev>; Sun, 28 Nov 2021 17:12:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=03605aa61GPqAkMuEDxiULscPlb4IrQgvCCxdTvrYo0=;
        b=UfEfLl29Uds9ak7UIX3AlYqV+7rZ+ejmn3UwmGdo+HRfmXF8oPDNc/eCkrxMdC7P0d
         hK2frqEf3CJI1xO1Ty0ZaiwK2lQQgLxfhHfgevw5QB+IRsbt66BwK7t4OHV2zizxrYhn
         U7fohE3jmjA4nmrfHEnbimNIKQNMjn9vbp7vVHET7LU94AZ0Hx8vELJogXUnhmyM0n+G
         rfyrzX73UijqNAQPHXbFpd/zIj1Eh/QEF6XvHhqlw2w/V4Hnzt2r2y/8GAsKoTTLlOJN
         KkIgB8M2n+2KP8Tacr2b2Jf8NTeg1a1o3eEP/wxiGsAzJEuib/HEKpV3r5gbjjmFLUWF
         zmBQ==
X-Gm-Message-State: AOAM532htJh7J5CAwtIkgas3tZaeGsos+L2JvZ6UP6nKi3AH4A6p2TRf
	CRqTb9pAuqHISzSNNO+Wuw==
X-Google-Smtp-Source: ABdhPJxzhvSxTOGoyPf+w1ZfNACC6PBC3QI/jrnXNUoX8D33yr4OrKGRKxpW1BPnSOUOB2tdNfo6Ww==
X-Received: by 2002:a4a:9406:: with SMTP id h6mr29823072ooi.80.1638148341725;
        Sun, 28 Nov 2021 17:12:21 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.99.229])
        by smtp.gmail.com with ESMTPSA id 111sm2390830otu.55.2021.11.28.17.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 17:12:21 -0800 (PST)
Received: (nullmailer pid 2952305 invoked by uid 1000);
	Mon, 29 Nov 2021 01:12:19 -0000
Date: Sun, 28 Nov 2021 19:12:19 -0600
From: Rob Herring <robh@kernel.org>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 2/3] dt-bindings: staging: Add the binding
 documentation for ZHOUYI AI accelerator
Message-ID: <YaQo81xyEkZpqXnc@robh.at.kernel.org>
References: <20211126021904.32325-1-caihuoqing@baidu.com>
 <20211126021904.32325-3-caihuoqing@baidu.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126021904.32325-3-caihuoqing@baidu.com>

On Fri, Nov 26, 2021 at 10:19:00AM +0800, Cai Huoqing wrote:
> ZHOUYI NPU is an AI accelerator chip which is integrated into ARM SOC,
> such as Allwinner R329 SOC.
> Add the binding documentation for ZHOUYI AI accelerator.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
> v2->v3:
>         *Fix unit_address_format, avoid leading 0s.
> 
>  .../bindings/staging/arm,zynpu.yaml           | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/staging/arm,zynpu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/staging/arm,zynpu.yaml b/Documentation/devicetree/bindings/staging/arm,zynpu.yaml
> new file mode 100644
> index 000000000000..d452c08ab4a3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/staging/arm,zynpu.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/staging/arm,zynpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM ZHOUYI AI accelerator bindings
> +
> +maintainers:
> +  - Cai Huoqing <caihuoqing@baidu.com>
> +
> +description:
> +  Supports ZHOUYI AI accelerator in ARM SOC.
> +
> +properties:
> +  compatible:
> +    const: armchina,zhouyi-v1
> +
> +  reg:
> +    maxItems: 1
> +
> +  device_type:

device_type is deprecated except for a couple of uses.

> +    const: zynpu
> +
> +  cma-reserved-bytes:
> +    default: 0

Use 'memory-region' and your own carve out if you need this, but do you 
really need this in DT? Is this fixed for a given board/platform rather 
than something a user would want to tune?


> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 3

You must define what each clock is and the order.

> +
> +required:
> +  - compatible
> +  - reg
> +  - device_type
> +  - cma-reserved-bytes
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        zynpu@3050000 {
> +            compatible = "armchina,zhouyi-v1";
> +            reg = <0x0 0x3050000 0x0 0x1000>;
> +            device_type = "zynpu";
> +            cma-reserved-bytes = <0x2600000>;
> +            interrupts = <GIC_SPI 64 IRQ_TYPE_EDGE_RISING>;
> +            clocks = <&clk_zynpu>,
> +                     <&clk_pll_zynpu>,
> +                     <&clk_zynpu_slv>;
> +        };
> +    };
> +...
> -- 
> 2.25.1
> 
> 
