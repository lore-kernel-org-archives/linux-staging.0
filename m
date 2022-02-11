Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0692A7D;
	Fri, 11 Feb 2022 20:52:46 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF32193;
	Fri, 11 Feb 2022 21:52:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1644612765;
	bh=BxJYx5WpikkOQaDeCfmlOlhvMtdE0xfPSmYxMTypAWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jBbmZdgID2SC/tIzQ7lced2q3lS1rkOJNcm/wmIViBeKep1eX+3/1fe4wrI5EbFIf
	 Mf2koqJBYEAK6bow/JAnKYAYD6BGSwMP3pmJM6ZxBSgPFdhiMrUF9IkMufVaBSQlol
	 oPee4dnpMaBJvUiKUaATdVfp+Dzly6eOgFBb9jBc=
Date: Fri, 11 Feb 2022 22:52:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev,
	Yong Deng <yong.deng@magewell.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hans.verkuil@cisco.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helen Koike <helen.koike@collabora.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 61/66] dt-bindings: media: Add Allwinner A31 ISP
 bindings documentation
Message-ID: <YgbMmLht/AXb5R1y@pendragon.ideasonboard.com>
References: <20220205185429.2278860-1-paul.kocialkowski@bootlin.com>
 <20220205185429.2278860-62-paul.kocialkowski@bootlin.com>
 <YgE/+UmP4nJVxtRT@pendragon.ideasonboard.com>
 <YgZ9GjgasiPljg9X@robh.at.kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YgZ9GjgasiPljg9X@robh.at.kernel.org>

Hi Rob,

On Fri, Feb 11, 2022 at 09:13:30AM -0600, Rob Herring wrote:
> On Mon, Feb 07, 2022 at 05:51:21PM +0200, Laurent Pinchart wrote:
> > On Sat, Feb 05, 2022 at 07:54:24PM +0100, Paul Kocialkowski wrote:
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
> > > index 000000000000..2d87022c43ce
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
> > 
> > That's interesting, does the ISP have a dedicated DRAM ?
> > 
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
> > > +            $ref: video-interfaces.yaml#
> > > +            unevaluatedProperties: false
> > 
> > If no other property than remote-endpoint are allowed, I'd write
> > 
> >           endpoint:
> >             $ref: video-interfaces.yaml#
> > 	    remote-endpoint: true
> 
> You just mixed a node and a property...

Yes, I meant

           endpoint:
             $ref: video-interfaces.yaml#
             properties:
               remote-endpoint: true

and actually add

             additionalProperties: false

> 'remote-endpoint' is always allowed, so need to put it here and every 
> other user. So 'unevaluatedProperties' is correct. But it would be good 
> to define what properties from video-interfaces.yaml are used here.

I've been looking at this recently. The usual pattern is to write

    endpoint:
      $ref: video-interfaces.yaml#
      unevaluatedProperties: false
      properties:
        hsync-polarity: true
        vsync-polarity: true

to express that the hsync-polarity and vsync-polarity properties are
used. However, this will still validate fine if, for instance,
data-lanes was specified in the device tree. Shouldn't we use
additionalProperties instead of unevaluatedProperties here ? If so,
specifying remote-endpoint: true seems needed.

-- 
Regards,

Laurent Pinchart
