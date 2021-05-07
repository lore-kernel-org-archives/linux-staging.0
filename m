Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBA770
	for <linux-staging@lists.linux.dev>; Fri,  7 May 2021 22:12:02 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id p6-20020a4adc060000b02901f9a8fc324fso2279521oov.10
        for <linux-staging@lists.linux.dev>; Fri, 07 May 2021 15:12:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/rvNcQv5ALxrR0naTewdJhe0quQ9LN/bF0ysksseIEY=;
        b=KYWrUPpKDydYJdsWSoIGpSQ3RW6DpmFxQiK16DGJ5bRL+IWh65n94fAckwIEOmD3MB
         yws17zOHH3nbTxWHWz2ivW6FXp/7uNngsZjK6tf66JEVvyFlSl1n7CFQz6lj4sPetbSO
         EsLwlvwD1pDuU11v54YITT/o3aC89uiiEYXJgiLPhtHgP7qXuTfOjk/2FG7aAqIVkt0F
         PnW1tD7CqDlZeJTfjzyzFCWCQMAJce5OlgH88rAAxFBYwWsZ4/werjX2t+zmVRTQYPq0
         i64yyXKIJHUFnucOluk+JhCSjjkarj4D7PjkFFwJtCO5Y7tJCSSDF4iESZBbwvy/Gnos
         gYYw==
X-Gm-Message-State: AOAM531qL0iiLT4qItBVASJT1J+no84zpzd3FnUK+uuhnMvXt1DGvFop
	LSoAQAMp+eI94XvBvVjTbg==
X-Google-Smtp-Source: ABdhPJzvPtsvbac2Jn5WYp0UEmz6zR4DRNDm3TNvPg3pBSSYiFtETu2wQBHRtLL52BozFDBoXwU57A==
X-Received: by 2002:a4a:d98a:: with SMTP id k10mr9444899oou.51.1620425522176;
        Fri, 07 May 2021 15:12:02 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k8sm1212467oig.6.2021.05.07.15.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 15:12:01 -0700 (PDT)
Received: (nullmailer pid 2987891 invoked by uid 1000);
	Fri, 07 May 2021 22:12:00 -0000
Date: Fri, 7 May 2021 17:12:00 -0500
From: Rob Herring <robh@kernel.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: vkoul@kernel.org, linux-phy@lists.infradead.org, kishon@ti.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, gregkh@linuxfoundation.org, neil@brown.name, ilya.lipnitskiy@gmail.com
Subject: Re: [PATCH 2/5] dt-bindings: phy: mediatek,mt7621-pci-phy: add clock
 entries
Message-ID: <20210507221200.GA2984128@robh.at.kernel.org>
References: <20210506111531.21978-1-sergio.paracuellos@gmail.com>
 <20210506111531.21978-3-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506111531.21978-3-sergio.paracuellos@gmail.com>

On Thu, May 06, 2021 at 01:15:28PM +0200, Sergio Paracuellos wrote:
> MT7621 SoC clock driver has already mainlined in
> 'commit 48df7a26f470 ("clk: ralink: add clock driver for mt7621 SoC")'
> Hence update schema with the add of the entries related to
> clock.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  .../bindings/phy/mediatek,mt7621-pci-phy.yaml        | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,mt7621-pci-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,mt7621-pci-phy.yaml
> index 0ccaded3f245..d8614ef8995c 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,mt7621-pci-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,mt7621-pci-phy.yaml
> @@ -16,6 +16,14 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  clocks:
> +    maxItems: 1
> +    description:
> +      PHY reference clock. Must contain an entry in clock-names.
> +
> +  clock-names:
> +    const: sys_clk

You don't really need -names when there is only 1.

> +
>    "#phy-cells":
>      const: 1
>      description: selects if the phy is dual-ported
> @@ -23,6 +31,8 @@ properties:
>  required:
>    - compatible
>    - reg
> +  - clocks
> +  - clock-names

Technically, you can't add new properties and make them required as that 
breaks the ABI. If that's okay here, explain it in the commit message. 

>    - "#phy-cells"
>  
>  additionalProperties: false
> @@ -32,5 +42,7 @@ examples:
>      pcie0_phy: pcie-phy@1e149000 {
>        compatible = "mediatek,mt7621-pci-phy";
>        reg = <0x1e149000 0x0700>;
> +      clocks = <&sysc 0>;
> +      clock-names = "sys_clk";
>        #phy-cells = <1>;
>      };
> -- 
> 2.25.1
> 
