Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B1E2F23;
	Fri, 11 Feb 2022 15:03:11 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id b5so9217593qtq.11;
        Fri, 11 Feb 2022 07:03:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/ku3rnuhABpjmC2Eeug92tBeXyU5N8pEMH3pcJ24UQk=;
        b=7VyMiPEbpAM2zLPDwcdfB+Va15vsQ2Ws1M6pfEyzLR1tMWHZET79R19yPbUc7Ui+it
         V3h8Pb4UyA8Ozid6z4cvBL4l3XeJwsxYsQCpgGMVvZMb/eqm+AUy/vXz73kv27noF1I2
         VncWerYNgrwGQUawflyC2dT6TB5qbUnzr3ORByWGhKi5IG17n7tp3vA1Oe2ZAUL5EbDx
         zCYjU/9TVOFBDPYQmgTlsdoaaFyysduJJZOElrqGsbMBgRS+6WW2TWSwb3kntOzDzIro
         y3oMudN5INywg64wYdq0mMuZJlcPyFDycpbihF9txBATSQ+CMtrwOZJX5MXo+RpkI7xc
         aP3w==
X-Gm-Message-State: AOAM530ww3FHKCqenGn4ORrhGdF49GzcUnz3PuEdAvHdpL9FXViG2oiI
	7zdWkPPNrCmxv1WPCPcb5g==
X-Google-Smtp-Source: ABdhPJxaSWsNdORxuo8Y8BQZfEAbE5cAgspJtSvjyPmVmHhgld8W3y5Q7hYinuqmx2N65aqAF01blQ==
X-Received: by 2002:a05:622a:1006:: with SMTP id d6mr1373542qte.575.1644591790918;
        Fri, 11 Feb 2022 07:03:10 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:20d7:a802:e6b0:6d9c:32f7:4bd9])
        by smtp.gmail.com with ESMTPSA id u17sm11056272qkj.44.2022.02.11.07.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 07:03:09 -0800 (PST)
Received: (nullmailer pid 363394 invoked by uid 1000);
	Fri, 11 Feb 2022 15:03:06 -0000
Date: Fri, 11 Feb 2022 09:03:06 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, linux-staging@lists.linux.dev, Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hans.verkuil@cisco.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helen Koike <helen.koike@collabora.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 05/66] dt-bindings: sun6i-a31-mipi-dphy: Add optional
 direction property
Message-ID: <YgZ6qsdO+SfTemPZ@robh.at.kernel.org>
References: <20220205185429.2278860-1-paul.kocialkowski@bootlin.com>
 <20220205185429.2278860-6-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220205185429.2278860-6-paul.kocialkowski@bootlin.com>

On Sat, Feb 05, 2022 at 07:53:28PM +0100, Paul Kocialkowski wrote:
> The Allwinner A31 MIPI D-PHY block supports both tx and rx directions,
> although each instance of the block is meant to be used in one
> direction only. There will typically be one instance for MIPI DSI and
> one for MIPI CSI-2 (it seems unlikely to ever see a shared instance).
> 
> Describe the direction with a new allwinner,direction property.
> For backwards compatibility, the property is optional and tx mode
> should be assumed by default.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml  | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
> index d0b541a461f3..22636c9fdab8 100644
> --- a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
> @@ -37,6 +37,18 @@ properties:
>    resets:
>      maxItems: 1
>  
> +  allwinner,direction:
> +    $ref: '/schemas/types.yaml#/definitions/string'
> +    description: |
> +      Direction of the D-PHY:
> +      - "rx" for receiving (e.g. when used with MIPI CSI-2);
> +      - "tx" for transmitting (e.g. when used with MIPI DSI).
> +
> +    enum:
> +      - tx
> +      - rx
> +    default: tx

Can you the phy mode to imply the direction?

Rob
