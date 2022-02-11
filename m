Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B01C2F23;
	Fri, 11 Feb 2022 15:16:49 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id k13-20020a4a948d000000b003172f2f6bdfso10658503ooi.1;
        Fri, 11 Feb 2022 07:16:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1P3H5utZhmDvFsnAtwZyeK8JRztag6WByXWcE5q2Zyc=;
        b=PZ9C3MDSQmVvXlnLCIENEpAsWBGtqqRfwFPNARWXRZT45vcF0mL9JmoWwuj7ZL2cvq
         4zRW2bkzVc1pwkOpOqfP5OW0bFIjXrSHAtdK3lQIlRbx3hx2SeJIzN7c0B+YlBBM+oE5
         Bi4EVMavsulDi4umv74sl7OGVJbLbKcdpxriFUxxCU+ZGz+b6uQFxKsh7qPCu0/2yUJR
         0V2OowsFlBajwi3M85Rd14zO/oP+Uj+ZgfHAcXv5e1v023QRC/xjJKhbgGouP7v1QpAc
         ApEMmYyg4tlTCFGDFuW86bh+7fLGPhuLTlSJYQd5C/6orzCOKfMyrvKQ+7ve2u9rOxz6
         DmvQ==
X-Gm-Message-State: AOAM5335RbSJ/r9Qhe8Kdypb7vZVMkU3JB5Cy5RC1ozHM3zxTvEbilqm
	y0TgM5+ToP4PzLAVMAB+bw==
X-Google-Smtp-Source: ABdhPJyjj0qRfHV+X2Or/x7i2b6yIL+QqHCBBRDSOpVutl1Fb19j9aZR3y+aSd0eIuMcJSEYP3cxig==
X-Received: by 2002:a05:6870:87c2:: with SMTP id s2mr283788oam.123.1644592608577;
        Fri, 11 Feb 2022 07:16:48 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:20db:bd0f:3516:878e:18c1:cd1e])
        by smtp.gmail.com with ESMTPSA id eh38sm5186127oab.36.2022.02.11.07.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 07:16:47 -0800 (PST)
Received: (nullmailer pid 382654 invoked by uid 1000);
	Fri, 11 Feb 2022 15:16:44 -0000
Date: Fri, 11 Feb 2022 09:16:44 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, linux-staging@lists.linux.dev, Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hans.verkuil@cisco.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helen Koike <helen.koike@collabora.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 62/66] dt-bindings: media: sun6i-a31-csi: Add ISP
 output port
Message-ID: <YgZ93JcVaeU6VUBq@robh.at.kernel.org>
References: <20220205185429.2278860-1-paul.kocialkowski@bootlin.com>
 <20220205185429.2278860-63-paul.kocialkowski@bootlin.com>
 <YgFDI17Q3AlZxaOi@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgFDI17Q3AlZxaOi@pendragon.ideasonboard.com>

On Mon, Feb 07, 2022 at 06:04:51PM +0200, Laurent Pinchart wrote:
> On Sat, Feb 05, 2022 at 07:54:25PM +0100, Paul Kocialkowski wrote:
> > Some Allwinner devices come with an Image Signal Processor (ISP) that
> > allows processing camera data to produce good-looking images,
> > especially from raw bayer representations.
> > 
> > The ISP does not have a dedicated capture path: it is fed directly by
> > one of the CSI controllers, which can be selected at run-time.
> > 
> > Represent this possibility as a graph connection between the CSI
> > controller and the ISP in the device-tree bindings.
> > 
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  .../bindings/media/allwinner,sun6i-a31-csi.yaml    | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
> > index 3cc61866ea89..7952413f98d8 100644
> > --- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
> > +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
> > @@ -83,6 +83,20 @@ properties:
> >  
> >          additionalProperties: false
> >  
> > +      port@2:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        description: ISP output port
> > +
> > +        properties:
> > +          reg:
> > +            const: 2
> > +
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> 
> This could be
> 
>             $ref: video-interfaces.yaml#
>             remote-endpoint: true
>             additionalProperties: false
> 
> to reject other properties.

If that's what is desired, then video-interfaces.yaml shouldn't be 
referenced and up above should be /properties/port.

Rob
