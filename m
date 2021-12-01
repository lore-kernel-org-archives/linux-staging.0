Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0792C80
	for <linux-staging@lists.linux.dev>; Wed,  1 Dec 2021 22:08:36 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id s139so51493423oie.13
        for <linux-staging@lists.linux.dev>; Wed, 01 Dec 2021 14:08:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=61rAikMT2xFefgUe5g0NFULS9kpnMPEF5LrvcuuTYAU=;
        b=46nYs/vwLn8Q4vZVJlEYzj+H/JAPMb9ND/HUY4yZaAF2kxO0TI9zoLpc5U7Qy0U0at
         hFBVudxJ5Zwmji9BQQLoRFAVK9dqHSexsN//owaYXiMi9K/xDv8ekPDpAOy3KmnbQpt/
         /pfGjTyJosqISEGwzI1q43ujaYMA0mXk8QdQ+XVxRNG7Kb1TX9vtzDYbzG8woxSxgK3h
         HwGHJhr1xtO1dIJu5IIX3+tFNy40GAC1AB5VNfhQ99w0J5IriAv1sKE9ZoVh1n1ajRBw
         KssguDh8LgbCQQHveIuweJiaFhtyZ0kUpHosIqt28XtMYLqkWwTaeOkPSvjWQOX82BZh
         qpaA==
X-Gm-Message-State: AOAM530Y7PPj4rpccpLHsjUko5kon4nXVQhJA5M5c2k6E5ld4DtQY5ab
	VZ7Ewu5NozGDEPHecqNKGw==
X-Google-Smtp-Source: ABdhPJxtSafNCNJSoXOFWLNnynN6wCIJQOugyj5c5EA3SsbJixIS28ajEXBr/1ehe/2yFDSR2rhwDg==
X-Received: by 2002:a05:6808:14e:: with SMTP id h14mr1048175oie.28.1638396516123;
        Wed, 01 Dec 2021 14:08:36 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id a3sm632937oil.32.2021.12.01.14.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 14:08:35 -0800 (PST)
Received: (nullmailer pid 2780052 invoked by uid 1000);
	Wed, 01 Dec 2021 22:08:34 -0000
Date: Wed, 1 Dec 2021 16:08:34 -0600
From: Rob Herring <robh@kernel.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc: david@lechnology.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, dave.stevenson@raspberrypi.com, maxime@cerno.tech
Subject: Re: [PATCH 4/6] dt-bindings: display: sitronix,st7735r: Add
 initialization properties
Message-ID: <YafyYgrwga0Tf/EB@robh.at.kernel.org>
References: <20211124150757.17929-1-noralf@tronnes.org>
 <20211124150757.17929-5-noralf@tronnes.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211124150757.17929-5-noralf@tronnes.org>

On Wed, Nov 24, 2021 at 04:07:55PM +0100, Noralf Trønnes wrote:
> Add initialization properties that are commonly used to initialize the
> controller for a specific display panel. It is common for displays to have
> a datasheet listing the necessary controller settings or some example code
> doing the same. These settings can be matched directly to the DT
> properties.
> 
> The commands FRMCTR2, FRMCTR3, PWCTR4 and PWCTR5 are usually part of the
> setup examples but they are skipped here since they deal with partial and
> idle mode which are powersaving modes for very special use cases.
> 
> dc-gpios is made optional because its absence indicates 3-line mode.
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  .../bindings/display/sitronix,st7735r.yaml    | 118 +++++++++++++++++-
>  1 file changed, 116 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
> index 157b1a7b18f9..2db1cfe6ae30 100644
> --- a/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
> +++ b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
> @@ -19,6 +19,10 @@ allOf:
>  properties:
>    compatible:
>      oneOf:
> +      - description:
> +          Sitronix ST7735R 262K Color Single-Chip TFT Controller/Driver
> +        items:
> +          - const: sitronix,st7735r
>        - description:
>            Adafruit 1.8" 160x128 Color TFT LCD (Product ID 358 or 618)
>          items:
> @@ -32,20 +36,99 @@ properties:
>                - okaya,rh128128t
>            - const: sitronix,st7715r
>  
> +  width:
> +    description:
> +      Width of display panel in pixels
> +
> +  height:
> +    description:
> +      Height of display panel in pixels


We already have width-mm and height-mm for physical size so this might 
be a bit confusing. There's also panel-timing 'vactive' and 'hactive' 
which is effectively the same thing you are defining.

> +
> +  frmctr1:

Are all these standardized by MIPI or otherwise common? If not, they 
need vendor prefixes.

> +    $ref: /schemas/types.yaml#definitions/uint8-array
> +    description:
> +      Frame Rate Control (In normal mode/Full colors) (B1h)
> +    minItems: 3
> +    maxItems: 3
> +
> +  invctr:
> +    $ref: /schemas/types.yaml#definitions/uint8-array
> +    description:
> +      Display Inversion Control (B4h)
> +    minItems: 1
> +    maxItems: 1
> +
> +  pwctr1:
> +    $ref: /schemas/types.yaml#definitions/uint8-array
> +    description:
> +      Power Control 1 (C0h)
> +    minItems: 3
> +    maxItems: 3
> +
> +  pwctr2:
> +    $ref: /schemas/types.yaml#definitions/uint8-array
> +    description:
> +      Power Control 2 (C1h)
> +    minItems: 1
> +    maxItems: 1
> +
> +  pwctr3:
> +    $ref: /schemas/types.yaml#definitions/uint8-array
> +    description:
> +      Power Control 3 (in Normal mode/Full colors) (C2h)
> +    minItems: 2
> +    maxItems: 2
> +
> +  vmctr1:
> +    $ref: /schemas/types.yaml#definitions/uint8-array
> +    description:
> +      VCOM Control 1 (C5h)
> +    minItems: 1
> +    maxItems: 1
> +
> +  madctl:
> +    $ref: /schemas/types.yaml#definitions/uint8-array
> +    description:
> +      Memory Data Access Control (36h)
> +    minItems: 1
> +    maxItems: 1
> +
> +  gamctrp1:
> +    $ref: /schemas/types.yaml#definitions/uint8-array
> +    description:
> +      Gamma Positive Polarity Correction Characteristics Setting (E0h)
> +    minItems: 16
> +    maxItems: 16
> +
> +  gamctrn1:
> +    $ref: /schemas/types.yaml#definitions/uint8-array
> +    description:
> +      Gamma Negative Polarity Correction Characteristics Setting (E1h)
> +    minItems: 16
> +    maxItems: 16
> +
> +  write-only:
> +    type: boolean
> +    description:
> +      Controller is not readable (ie. MISO is not wired up).
> +
>    dc-gpios:
>      maxItems: 1
> -    description: Display data/command selection (D/CX)
> +    description: |
> +      Controller data/command selection (D/CX) in 4-line SPI mode.
> +      If not set, the controller is in 3-line SPI mode.
>  
>    backlight: true
>    reg: true
>    spi-max-frequency: true
>    reset-gpios: true
>    rotation: true
> +  width-mm: true
> +  height-mm: true
>  
>  required:
>    - compatible
>    - reg
> -  - dc-gpios
>  
>  additionalProperties: false
>  
> @@ -72,5 +155,36 @@ examples:
>                      backlight = <&backlight>;
>              };
>      };
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    spi {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            sainsmart18@0{
> +                    compatible = "sitronix,st7735r";
> +                    reg = <0>;
> +                    spi-max-frequency = <40000000>;
> +
> +                    width = <160>;
> +                    height = <128>;
> +
> +                    frmctr1 = [ 01 2C 2D ];
> +                    invctr = [ 07 ];
> +                    pwctr1 = [ A2 02 84 ];
> +                    pwctr2 = [ C5 ];
> +                    pwctr3 = [ 0A 00 ];
> +                    vmctr1 = [ 0E ];
> +                    madctl = [ 60 ];
> +                    gamctrp1 = [ 0F 1A 0F 18 2F 28 20 22 1F 1B 23 37 00 07 02 10 ];
> +                    gamctrn1 = [ 0F 1B 0F 17 33 2C 29 2E 30 30 39 3F 00 07 03 10 ];
> +
> +                    dc-gpios = <&gpio 43 GPIO_ACTIVE_HIGH>;
> +                    reset-gpios = <&gpio 80 GPIO_ACTIVE_HIGH>;
> +                    write-only;
> +            };
> +    };
> +
>  
>  ...
> -- 
> 2.33.0
> 
> 
