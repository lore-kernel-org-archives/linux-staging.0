Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8412F23;
	Fri, 11 Feb 2022 15:13:36 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id x193so9932319oix.0;
        Fri, 11 Feb 2022 07:13:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nAFVbtRVtzhYKIqkkFFxa3DynoLvmGUt99SFwmIUitE=;
        b=CJ9puKJThl6gSZVbgRSoIOBGAQtg4hY0vR0mgQD+VTbNXTSP9jTpILSPw3N17ly72B
         3QWqjsVjmUBYr7y5IJ85/Bj/E2sCL7JTR8RdU/+D4+LZMTXhsvzEr4Ho1SdLdt6rLbU0
         28PWu7ftcl3LYN3vnV3dBgsEo2WaZaaxPM0jTHfpD6L7Ab5mBk+XlxcNnGpFaYUdo+wa
         LEuUn/c8PvzZnEBEJ9HJZlqWajbHLAcU7UTTEtBWsnu9TJkmH8E8z16jux/qPS7+2Lqk
         K0mUoqMDcMUROcx+je2bPuZJsegq5xXrNi6j26GYMEh1r9ZdVHPWxW+TX/jlFrJwnD11
         fHbg==
X-Gm-Message-State: AOAM5313qpv537SB8l+QFF/dIZhYGwi4QUdn3wgfjzVleWWn4XLwT9jJ
	ZLSMLJ/+01HlJZUEKEHIzw==
X-Google-Smtp-Source: ABdhPJwaPHuiQHGSQ6kUYYw0O9nkOWW7a1boAaJFBE38Tc1cgFspZLWYz6Pn0l3DnSsVViQOAEGGUg==
X-Received: by 2002:aca:aa96:: with SMTP id t144mr415668oie.132.1644592415173;
        Fri, 11 Feb 2022 07:13:35 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:20d7:a802:e6b0:6d9c:32f7:4bd9])
        by smtp.gmail.com with ESMTPSA id j3sm9649552oig.37.2022.02.11.07.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 07:13:34 -0800 (PST)
Received: (nullmailer pid 378308 invoked by uid 1000);
	Fri, 11 Feb 2022 15:13:31 -0000
Date: Fri, 11 Feb 2022 09:13:30 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, linux-staging@lists.linux.dev, Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hans.verkuil@cisco.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helen Koike <helen.koike@collabora.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 61/66] dt-bindings: media: Add Allwinner A31 ISP
 bindings documentation
Message-ID: <YgZ9GjgasiPljg9X@robh.at.kernel.org>
References: <20220205185429.2278860-1-paul.kocialkowski@bootlin.com>
 <20220205185429.2278860-62-paul.kocialkowski@bootlin.com>
 <YgE/+UmP4nJVxtRT@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgE/+UmP4nJVxtRT@pendragon.ideasonboard.com>

On Mon, Feb 07, 2022 at 05:51:21PM +0200, Laurent Pinchart wrote:
> Hi Paul,
> 
> Thank you for the patch.
> 
> On Sat, Feb 05, 2022 at 07:54:24PM +0100, Paul Kocialkowski wrote:
> > This introduces YAML bindings documentation for the Allwinner A31 Image
> > Signal Processor (ISP).
> > 
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  .../media/allwinner,sun6i-a31-isp.yaml        | 117 ++++++++++++++++++
> >  1 file changed, 117 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml
> > new file mode 100644
> > index 000000000000..2d87022c43ce
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml
> > @@ -0,0 +1,117 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/allwinner,sun6i-a31-isp.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner A31 Image Signal Processor Driver (ISP) Device Tree Bindings
> > +
> > +maintainers:
> > +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - allwinner,sun6i-a31-isp
> > +      - allwinner,sun8i-v3s-isp
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Bus Clock
> > +      - description: Module Clock
> > +      - description: DRAM Clock
> 
> That's interesting, does the ISP have a dedicated DRAM ?
> 
> > +
> > +  clock-names:
> > +    items:
> > +      - const: bus
> > +      - const: mod
> > +      - const: ram
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        description: CSI0 input port
> > +
> > +        properties:
> > +          reg:
> > +            const: 0
> > +
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> 
> If no other property than remote-endpoint are allowed, I'd write
> 
>           endpoint:
>             $ref: video-interfaces.yaml#
> 	    remote-endpoint: true

You just mixed a node and a property...

'remote-endpoint' is always allowed, so need to put it here and every 
other user. So 'unevaluatedProperties' is correct. But it would be good 
to define what properties from video-interfaces.yaml are used here.

Rob
