Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DF1173
	for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 17:29:15 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id s139so37348952oie.13
        for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 09:29:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BGDKRwosuspfYWxZApqXKSNZ+F/8DLGm7NO/ffPXmr0=;
        b=5ReYsoISfZR02vWIn7OOQS5S6LI5crdiETKsrB28MYCOIZsd5oouQ+m7FgBxQP3Ddu
         sMRivyq1c4kHtdfRA7w6OdTnV5FeGh3bhdHvfE1yUX6L+7h3XQ1aJin/DFSOZbYPzFUc
         4yJxfXm1xGTunOubL1AW97ZW+YmtRnn4g+gkn9lTfAFDU+7CyTjuzZUERJLu9oIoKNYz
         KGGtH9XiakfTUnnsgVU6P764r70rxQnC7IHVAAlC0xBZVBZ6/E2FLsNFlZGuwNlMp6FM
         oYlCqv/AAdoqzxA6CYxuypsWuWvo+d6/TU+vpadF1OhzuP8pQinRLdsNSfAZ0aDDmkKi
         GIIw==
X-Gm-Message-State: AOAM533hzOetYDdhfkz8nva3vVqYLRKa/zmNSt7b0jKSfoBRfxq9tdXl
	CPPWwZR+ytGwGXma3DXriw==
X-Google-Smtp-Source: ABdhPJzpIdbfDFxlf+VQ8oNO/3zvGLjwEQsh7u9aVYPQ0hfaH6c6G98GZZ3yZtc9iElIOJF/los3iw==
X-Received: by 2002:a05:6808:1a02:: with SMTP id bk2mr4936718oib.52.1639675754325;
        Thu, 16 Dec 2021 09:29:14 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e26sm1102831oog.46.2021.12.16.09.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 09:29:13 -0800 (PST)
Received: (nullmailer pid 430626 invoked by uid 1000);
	Thu, 16 Dec 2021 17:29:12 -0000
Date: Thu, 16 Dec 2021 11:29:12 -0600
From: Rob Herring <robh@kernel.org>
To: Adam Ford <aford173@gmail.com>
Cc: linux-media@vger.kernel.org, abel.vesa@nxp.com, aford@beaconembedded.com, benjamin.gaignard@collabora.com, hverkuil-cisco@xs4all.nl, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lucas Stach <l.stach@pengutronix.de>, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH V2 04/10] dt-bindings: media: nxp,imx8mq-vpu: Split G1
 and G2 nodes
Message-ID: <Ybt3aHfscuKMM0ie@robh.at.kernel.org>
References: <20211216111256.2362683-1-aford173@gmail.com>
 <20211216111256.2362683-5-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211216111256.2362683-5-aford173@gmail.com>

On Thu, Dec 16, 2021 at 05:12:49AM -0600, Adam Ford wrote:
> The G1 and G2 are separate decoder blocks that are enabled by the
> vpu-blk-ctrl power-domain controller, which now has a proper driver.
> Update the bindings to support separate nodes for the G1 and G2
> decoders with vpu-blk-ctrl power-domain support.

You could expand this a bit more with Lucas' explanation and being 
explicit on the compatibility implications.

Otherwise, with that and indentation fixed:

Reviewed-by: Rob Herring <robh@kernel.org>

> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> index 762be3f96ce9..c1e157251de7 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> @@ -15,33 +15,20 @@ description:
>  
>  properties:
>    compatible:
> -    const: nxp,imx8mq-vpu
> +     oneOf:
> +      - const: nxp,imx8mq-vpu
> +        deprecated: true
> +      - const: nxp,imx8mq-vpu-g1
> +      - const: nxp,imx8mq-vpu-g2
>  
>    reg:
> -    maxItems: 3
> -
> -  reg-names:
> -    items:
> -      - const: g1
> -      - const: g2
> -      - const: ctrl
> +    maxItems: 1
>  
>    interrupts:
> -    maxItems: 2
> -
> -  interrupt-names:
> -    items:
> -      - const: g1
> -      - const: g2
> +    maxItems: 1
>  
>    clocks:
> -    maxItems: 3
> -
> -  clock-names:
> -    items:
> -      - const: g1
> -      - const: g2
> -      - const: bus
> +    maxItems: 1
>  
>    power-domains:
>      maxItems: 1
> @@ -49,31 +36,33 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - reg-names
>    - interrupts
> -  - interrupt-names
>    - clocks
> -  - clock-names
>  
>  additionalProperties: false
>  
>  examples:
>    - |
>          #include <dt-bindings/clock/imx8mq-clock.h>
> +        #include <dt-bindings/power/imx8mq-power.h>
> +        #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +        vpu_g1: video-codec@38300000 {
> +                compatible = "nxp,imx8mq-vpu-g1";
> +                reg = <0x38300000 0x10000>;
> +                interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +                clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>;
> +                power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G1>;
> +        };
> +  - |
> +        #include <dt-bindings/clock/imx8mq-clock.h>
> +        #include <dt-bindings/power/imx8mq-power.h>
>          #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
> -        vpu: video-codec@38300000 {
> -                compatible = "nxp,imx8mq-vpu";
> -                reg = <0x38300000 0x10000>,
> -                      <0x38310000 0x10000>,
> -                      <0x38320000 0x10000>;
> -                reg-names = "g1", "g2", "ctrl";
> -                interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> -                             <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> -                interrupt-names = "g1", "g2";
> -                clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
> -                         <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
> -                         <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
> -                clock-names = "g1", "g2", "bus";
> -                power-domains = <&pgc_vpu>;
> +        vpu_g2: video-codec@38300000 {
> +                compatible = "nxp,imx8mq-vpu-g2";
> +                reg = <0x38310000 0x10000>;
> +                interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +                clocks = <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
> +                power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G2>;
>          };
> -- 
> 2.32.0
> 
> 
