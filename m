Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB957A;
	Tue, 19 Apr 2022 13:48:31 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id r85so12954187oie.7;
        Tue, 19 Apr 2022 06:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nsUApVIo+2QUrjaVycUT3ee7pF9FJXtnBR7YLOJOzQ0=;
        b=obG9ie0+68wAe9LqIDmv63LbGF2QxiUr1kWdHrsxkCYzUYRYZUWj0C7fDW+Jl9stVv
         r9VNne12gsvG2pgdDLW2WH4fd0/uFWqOFiFs0zK/7PdUbrC6upvjp8O3M7cpMjiXl9+c
         WF/9ho5iUyWaYUcOcwKvyA4L1g1RdZSMTDWTTfInHIhqZqTXtyx1ePim8eK9U2qG+yRM
         sBbJbCs2TgDDkuek3N0BFqbmDBO35n/C4A/8O8Xz3m5+m3TqRbi8Q1r6U9qjx2wAtAg9
         FU3tOxtdhC5wb/rr1hHxdzvLJCKJl5n4GsjbNyV7dfgFtcJ/Cvsi+XlTyvU38V5462Y1
         TFOA==
X-Gm-Message-State: AOAM533NQp32TB+r6QCBT+iiEFp0ajnoGnpGLMkzU88gQ7VJQc3lxPPv
	xcHgL27sJrZxF8GYRMtYeg==
X-Google-Smtp-Source: ABdhPJwAGdbwdONC730t1SrxFQ9322c21cU+FAlo9bI1B0TpQpxVtg6Tt3SHk1LjWJNA3b+E3DTVOQ==
X-Received: by 2002:a05:6808:9ae:b0:2d9:a01a:4bf4 with SMTP id e14-20020a05680809ae00b002d9a01a4bf4mr7418713oig.283.1650376110729;
        Tue, 19 Apr 2022 06:48:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q1-20020a056820028100b00335f00b5b9bsm5315376ood.15.2022.04.19.06.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 06:48:30 -0700 (PDT)
Received: (nullmailer pid 2438759 invoked by uid 1000);
	Tue, 19 Apr 2022 13:48:29 -0000
Date: Tue, 19 Apr 2022 08:48:29 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Samuel Holland <samuel@sholland.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: media: Add Allwinner A31 ISP
 bindings documentation
Message-ID: <Yl69rY2/Fwfhc520@robh.at.kernel.org>
References: <20220415153708.637804-1-paul.kocialkowski@bootlin.com>
 <20220415153708.637804-2-paul.kocialkowski@bootlin.com>
 <19aa74b7-0096-87c5-ef2c-9a135ad5505a@sholland.org>
 <Yl6Ezm6D7KKbE1Oa@aptenodytes>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yl6Ezm6D7KKbE1Oa@aptenodytes>

On Tue, Apr 19, 2022 at 11:45:50AM +0200, Paul Kocialkowski wrote:
> Hi Samuel,
> 
> On Fri 15 Apr 22, 20:59, Samuel Holland wrote:
> > On 4/15/22 10:37 AM, Paul Kocialkowski wrote:
> > > This introduces YAML bindings documentation for the Allwinner A31 Image
> > > Signal Processor (ISP).
> > > 
> > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > ---
> > >  .../media/allwinner,sun6i-a31-isp.yaml        | 117 ++++++++++++++++++
> > >  1 file changed, 117 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml
> > > new file mode 100644
> > > index 000000000000..ffca216b841f
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml
> > > @@ -0,0 +1,117 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/allwinner,sun6i-a31-isp.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Allwinner A31 Image Signal Processor Driver (ISP) Device Tree Bindings
> > > +
> > > +maintainers:
> > > +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - allwinner,sun6i-a31-isp
> > > +      - allwinner,sun8i-v3s-isp
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: Bus Clock
> > > +      - description: Module Clock
> > > +      - description: DRAM Clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: bus
> > > +      - const: mod
> > > +      - const: ram
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        description: CSI0 input port
> > > +
> > > +        properties:
> > > +          reg:
> > > +            const: 0
> > > +
> > > +          endpoint:
> > > +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > > +            unevaluatedProperties: false
> > > +
> > > +        additionalProperties: false
> > > +
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        description: CSI1 input port
> > > +
> > > +        properties:
> > > +          reg:
> > > +            const: 0
> > 
> > Should be "const: 1".
> > 
> > Otherwise,
> > Reviewed-by: Samuel Holland <samuel@sholland.org>
> 
> Good catch and thanks for the review!

Yes, but you should use '/schemas/graph.yaml#/properties/port' ref 
instead and drop 'properties'.

Rob
