Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6E05381;
	Fri, 26 Aug 2022 22:29:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9226930B;
	Sat, 27 Aug 2022 00:29:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1661552950;
	bh=WSO4BBqN3kAWRsPaZun6o5Wyzwiloi0fiRjTiQQBlps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZJ/MZVSjHVesGFLeABJ156fSAsMDk2Gn7VYBrjHsJdNC1biGU22sCrNqX3H/EXQgU
	 83xshZaVXR+NhZBHx9vOdxNY4MD+VvtaI9puOcnP2JorV8Ue/IRvzXuZUsqRpsOfmD
	 vooI9CLbNB83gCAH3wclj8tqanWGKIz+mxyv11Jc=
Date: Sat, 27 Aug 2022 01:29:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 2/6] dt-bindings: media: sun6i-a31-csi: Add ISP output
 port
Message-ID: <YwlJL3umZrVC4FLc@pendragon.ideasonboard.com>
References: <20220826184144.605605-1-paul.kocialkowski@bootlin.com>
 <20220826184144.605605-3-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220826184144.605605-3-paul.kocialkowski@bootlin.com>

Hi Paul,

Thank you for the patch.

On Fri, Aug 26, 2022 at 08:41:40PM +0200, Paul Kocialkowski wrote:
> Some Allwinner devices come with an Image Signal Processor (ISP) that
> allows processing camera data to produce good-looking images,
> especially from raw bayer representations.
> 
> The ISP does not have a dedicated capture path: it is fed directly by
> one of the CSI controllers, which can be selected at run-time.
> 
> Represent this possibility as a graph connection between the CSI
> controller and the ISP in the device-tree bindings.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml    | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
> index 8551c4a711dc..54eb80e517e3 100644
> --- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
> @@ -73,6 +73,10 @@ properties:
>          $ref: /schemas/graph.yaml#/properties/port
>          description: MIPI CSI-2 bridge input port
>  
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: ISP output port
> +

I'd write "Output port to the ISP" to make it clearer.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>      anyOf:
>        - required:
>            - port@0

-- 
Regards,

Laurent Pinchart
