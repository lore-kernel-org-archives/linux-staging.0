Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC057A;
	Tue, 19 Apr 2022 13:08:30 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id b188so17982991oia.13;
        Tue, 19 Apr 2022 06:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kuw11tGbCexpzngTq2n6w2uUJ2OJTLDgpBrRZMyM3vc=;
        b=ANRptqgIoL2SwS304T7jCs2cr/xGg3I/ZqIiJXlVMMh0l24YaUq9WLw75IQp/NLovR
         56GjWR+grg8R+If0nomIbwnfhUzDgmxGdT3dSvWL7kIXxu8LQMvVDBBXBfre8Pnd79TD
         oWOPCYub6xf4V/TEpqkmvctjqDEhYdnBd8SUT+xuOtug4yDNNppo/vR54iJhuX4jOOje
         IkBH+zNMRb6tp3zUgxvpOFyP7FgXNQX5NE7sUlBrdve+cR2J8cH2LBP4t+dtfMadWCAS
         qOT1YGJCLKfij2lzf6ENLDkKoCf9LEZ+c/xr8vbMDItoJ0FDRpoiYQTmSQRE7wygQ2kz
         mIXA==
X-Gm-Message-State: AOAM5312Lz2m0QlJ/WrJO36gTL29IwvxESgqRqvqI3rlF28gCHhwprgR
	BX3piQVe6csOrA1wNnQ2Hg==
X-Google-Smtp-Source: ABdhPJzKxCN4i5eFMnIKtOQ8QW2GVwLNNO3fUffnNK/ceEOGTPpqRQ66KT732cWRNDIJThK8kAbbKw==
X-Received: by 2002:a54:439a:0:b0:2ef:9bf6:e702 with SMTP id u26-20020a54439a000000b002ef9bf6e702mr9631818oiv.105.1650373710086;
        Tue, 19 Apr 2022 06:08:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 64-20020aca0643000000b002f9b8a6ca98sm5117722oig.4.2022.04.19.06.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 06:08:29 -0700 (PDT)
Received: (nullmailer pid 2258727 invoked by uid 1000);
	Tue, 19 Apr 2022 13:08:28 -0000
Date: Tue, 19 Apr 2022 08:08:28 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: media: sun6i-a31-csi: Add ISP output
 port
Message-ID: <Yl60TLYX+Cgkvb00@robh.at.kernel.org>
References: <20220415153708.637804-1-paul.kocialkowski@bootlin.com>
 <20220415153708.637804-3-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220415153708.637804-3-paul.kocialkowski@bootlin.com>

On Fri, Apr 15, 2022 at 05:37:06PM +0200, Paul Kocialkowski wrote:
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
> index 53aa6dbe8e2c..1b41a6008195 100644
> --- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
> @@ -87,6 +87,20 @@ properties:
>  
>          additionalProperties: false
>  
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base

If there are not any custom properties, then use 
'/schemas/graph.yaml#/properties/port' and drop the 'properties' below.

> +        description: ISP output port
> +
> +        properties:
> +          reg:
> +            const: 2
> +
> +          endpoint:
> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +            unevaluatedProperties: false
> +
> +        additionalProperties: false
> +
>      anyOf:
>        - required:
>            - port@0
> -- 
> 2.35.2
> 
> 
