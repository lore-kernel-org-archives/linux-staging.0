Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F71E3FC9
	for <linux-staging@lists.linux.dev>; Mon,  4 Oct 2021 18:06:47 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id s69so22687167oie.13
        for <linux-staging@lists.linux.dev>; Mon, 04 Oct 2021 11:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0nglCwSmLkqWcDDYbgeQI0Rj6hImnZUh6ykmGdkaXq8=;
        b=lIBN24BrsidQLQZez2jCpc1gQ0/ZJM1F/rpBZly5NOxNk56SgHrs8aXFEzsqiUyEO0
         NNvS0pweV0uTJYA2j8KwiT7NezDGuZutFbnyFQc7vkLL/lnZKuxXaDNTUQi05LUJIR+S
         hj2zWJwwlZZ5OGYzU3lAtZ00rZnxwMhjUghLVoPU+NGAMB2UKG+S2JXluelufdfWLkNt
         0lsLnSLQCGi3ww1faKAMy2A82qAZbDrXDBL0NDV3GnXT08166Xk/gxaZqu2hw2nkGXbW
         BFrGuBf8PEGjC0L3auMJI/5okbAqQNFq/Hzem4wMJ2FUH8ry6pDwF6G9gngAqrq3awnR
         zn+g==
X-Gm-Message-State: AOAM531m4AQHSFxR5kcNUUJtmSzvSjXEikBQVddEnDsNlstepVmxOVwi
	GnTv0gh7NoAT8eXyElpK0w==
X-Google-Smtp-Source: ABdhPJzc6i6SjUk6crMunB3I6rcO8tJCZQ3N0J3WDSTRxPs5tV4XPfPSZZeDN54KEpyM2WQoVndhDw==
X-Received: by 2002:aca:e143:: with SMTP id y64mr14547898oig.21.1633370806633;
        Mon, 04 Oct 2021 11:06:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id w14sm3032395oth.5.2021.10.04.11.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 11:06:46 -0700 (PDT)
Received: (nullmailer pid 1577410 invoked by uid 1000);
	Mon, 04 Oct 2021 18:06:44 -0000
Date: Mon, 4 Oct 2021 13:06:44 -0500
From: Rob Herring <robh@kernel.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-staging@lists.linux.dev, john@phrozen.org, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, neil@brown.name, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt: bindings: add ralink RT2880 resets device tree
 binding documentation
Message-ID: <YVtCtGcLjNcO2NJ0@robh.at.kernel.org>
References: <20210926145931.14603-1-sergio.paracuellos@gmail.com>
 <20210926145931.14603-3-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210926145931.14603-3-sergio.paracuellos@gmail.com>

On Sun, Sep 26, 2021 at 04:59:30PM +0200, Sergio Paracuellos wrote:
> Adds device tree binding documentation for resets in the ralink RT2880 SoCs.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  .../bindings/reset/ralink,rt2880-reset.yaml   | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/ralink,rt2880-reset.yaml
> 
> diff --git a/Documentation/devicetree/bindings/reset/ralink,rt2880-reset.yaml b/Documentation/devicetree/bindings/reset/ralink,rt2880-reset.yaml
> new file mode 100644
> index 000000000000..88eddeb4ee45
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/ralink,rt2880-reset.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/ralink,rt2880-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ralink RT2880 Reset Controller Device Tree Bindings
> +
> +maintainers:
> +  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
> +
> +description: |
> +  Ralink RT2880 reset controller driver which supports the SoC
> +  system controller supplied reset registers for the various peripherals
> +  of the SoC.
> +
> +  See also:
> +  - dt-bindings/reset/ralink-rt2880.h
> +
> +properties:
> +  compatible:
> +    const: ralink,rt2880-reset
> +
> +  '#reset-cells':
> +    const: 1
> +
> +required:
> +  - '#reset-cells'
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/reset/ralink-rt2880.h>
> +    rstctrl: reset-controller {
> +      compatible = "ralink,rt2880-reset";
> +      #reset-cells = <1>;

How is this h/w controlled? If this is part of a system controller, then 
it needs to be documented as such. IOW, you need to document the binding 
for the whole block.

Do you really need a child node here? All you need to make a system 
controller a reset provider is add '#reset-cells' to it.

Rob
