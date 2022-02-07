Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5142F24;
	Mon,  7 Feb 2022 16:04:55 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E872340;
	Mon,  7 Feb 2022 17:04:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1644249893;
	bh=EBS3kkJ8BCBs5yuj170BnDdZuFVfeUksdyi/hOkIA0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MvyY9OKI0dHBs/LuDngKy5LRwVmt4U8MI1JrSmzwEUbroZ1j66FdAKeufPHPc7msD
	 NxjUI4SKDw4w34fThGl88PBkP2eV0Y/iGXexOPDFBST9fnesGw30bWNPIqTqgpShzO
	 4YXjESc+sTvUEu1GGJ+aQxB0h7K4mhQSax2L7XJE=
Date: Mon, 7 Feb 2022 18:04:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev,
	Yong Deng <yong.deng@magewell.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hans.verkuil@cisco.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helen Koike <helen.koike@collabora.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 62/66] dt-bindings: media: sun6i-a31-csi: Add ISP
 output port
Message-ID: <YgFDI17Q3AlZxaOi@pendragon.ideasonboard.com>
References: <20220205185429.2278860-1-paul.kocialkowski@bootlin.com>
 <20220205185429.2278860-63-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220205185429.2278860-63-paul.kocialkowski@bootlin.com>

On Sat, Feb 05, 2022 at 07:54:25PM +0100, Paul Kocialkowski wrote:
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
> ---
>  .../bindings/media/allwinner,sun6i-a31-csi.yaml    | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
> index 3cc61866ea89..7952413f98d8 100644
> --- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
> @@ -83,6 +83,20 @@ properties:
>  
>          additionalProperties: false
>  
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description: ISP output port
> +
> +        properties:
> +          reg:
> +            const: 2
> +
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false

This could be

            $ref: video-interfaces.yaml#
            remote-endpoint: true
            additionalProperties: false

to reject other properties.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +        additionalProperties: false
> +
>      anyOf:
>        - required:
>          - port@0

-- 
Regards,

Laurent Pinchart
