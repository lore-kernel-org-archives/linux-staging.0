Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C1E2F83
	for <linux-staging@lists.linux.dev>; Tue, 20 Apr 2021 19:37:48 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id u80so6517720oia.0
        for <linux-staging@lists.linux.dev>; Tue, 20 Apr 2021 12:37:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Y2BpotxAReH+14W0XNHlls+cgG6EVIk6Cecdi206lYo=;
        b=JEtb0oHfcI1YURmNpXbFahY2ylOGQbda7Y0ZiSygyoVbwcr161iKGihl1vB8KpyqUD
         FaqFl8YIjJPLVOcODMUEFKrLNj40GgZfiErp8SbHpyh3J+8Uem2nQaohwyT4e4UW6VRf
         iokW37EIq/2hFjwvVq0lkzeQUwnspuilMIiw1F+bSQdQykQTUPJDofgcMDSI7y4kFQbE
         9tZ8kOkxtSqF2lxejHHXHsGsmDJmi96cl/ioyrBL2KC/4ZlGhpsi1I/e/nbTAbVaAJWR
         1waYBMiJkYPeUe3RCmTrgqOoW4XXpIDZtNIgyMTxmdxds+xP3mJrGEKmBYiBqVhhONOw
         sWDg==
X-Gm-Message-State: AOAM530ABdDrC0r1ed7F90p33yQN7h2DlHL6SlnCBo++VVDWwzONPAMg
	jj6HVsNniTa3aUgX2FTCVA==
X-Google-Smtp-Source: ABdhPJyYaKWvPGHWzWpZ5aOhL3B5gXbb40vd1L0fhx2/v9KRHo1ivKyL7LrVtMqs09gmFu4rhzZoSw==
X-Received: by 2002:aca:d513:: with SMTP id m19mr4115453oig.111.1618947467961;
        Tue, 20 Apr 2021 12:37:47 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r14sm3741562oth.3.2021.04.20.12.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 12:37:47 -0700 (PDT)
Received: (nullmailer pid 3686765 invoked by uid 1000);
	Tue, 20 Apr 2021 19:37:46 -0000
Date: Tue, 20 Apr 2021 14:37:46 -0500
From: Rob Herring <robh@kernel.org>
To: Lucas Stankus <lucas.p.stankus@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, gregkh@linuxfoundation.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: staging: iio: cdc: ad7746: add
 binding documentation for AD7746
Message-ID: <20210420193746.GA3632576@robh.at.kernel.org>
References: <cover.1618785336.git.lucas.p.stankus@gmail.com>
 <54a9eaeaa42d47037b2a07bd933e6dfade745d02.1618785336.git.lucas.p.stankus@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54a9eaeaa42d47037b2a07bd933e6dfade745d02.1618785336.git.lucas.p.stankus@gmail.com>

On Sun, Apr 18, 2021 at 07:49:51PM -0300, Lucas Stankus wrote:
> Add device tree binding documentation for AD7746 cdc in YAML format.
> 
> Signed-off-by: Lucas Stankus <lucas.p.stankus@gmail.com>
> ---
> 
> A minor note about the adi,excitation-vdd-permille property. Jonathan
> suggested the name to be adi,excitation-vdd-milicent, but I was unsure of
> the milicent naming. With a quick search I found out that the common way to
> call a thousandth is 'per mille'[1], but I didn't find any use of it in the
> kernel documentation. Any thoughts about it?

Seems okay to me.

> [1] https://en.wikipedia.org/wiki/Per_mille
> 
>  .../bindings/iio/cdc/adi,ad7746.yaml          | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/cdc/adi,ad7746.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/cdc/adi,ad7746.yaml b/Documentation/devicetree/bindings/iio/cdc/adi,ad7746.yaml
> new file mode 100644
> index 000000000000..a2a7eee674ba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/cdc/adi,ad7746.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/cdc/adi,ad7746.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AD7746 24-Bit Capacitance-to-Digital Converter with Temperature Sensor
> +
> +maintainers:
> +  - Michael Hennerich <michael.hennerich@analog.com>
> +
> +description: |
> +  AD7746 24-Bit Capacitance-to-Digital Converter with Temperature Sensor
> +
> +  Specifications about the part can be found at:
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/ad7291.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ad7745
> +      - adi,ad7746
> +      - adi,ad7747
> +
> +  reg:
> +    maxItems: 1
> +
> +  adi,excitation-vdd-permille:
> +    description: |
> +      Set VDD per mille to be used as the excitation voltage.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [125, 250, 375, 500]
> +
> +  adi,exca-output-en:
> +    description: Enables the EXCA pin as the excitation output.
> +    type: boolean
> +
> +  adi,exca-output-invert:
> +    description: Inverts the excitation output in the EXCA pin.
> +    type: boolean

'invert' assumes I know what the non-inverted signal is. Sometimes that 
makes sense, but if you can define in terms of the inverse that would be 
better. For example, for a normally active low signal, name the property 
'foo-active-high'.

> +
> +  adi,excb-output-en:
> +    description: Enables the EXCB pin as the excitation output.
> +    type: boolean
> +
> +  adi,excb-output-invert:
> +    description: Inverts the excitation output in the EXCB pin.
> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      ad7746: cdc@48 {
> +        compatible = "adi,ad7746";
> +        reg = <0x48>;
> +        adi,excitation-vdd-permille = <125>;
> +
> +        adi,exca-output-en;
> +        adi,exca-output-invert;
> +        adi,excb-output-en;
> +        adi,excb-output-invert;
> +      };
> +    };
> +...
> -- 
> 2.31.1
> 
