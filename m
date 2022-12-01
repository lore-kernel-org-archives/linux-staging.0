Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94496107A0
	for <linux-staging@lists.linux.dev>; Thu,  1 Dec 2022 23:19:38 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id q186so3673009oia.9
        for <linux-staging@lists.linux.dev>; Thu, 01 Dec 2022 15:19:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GnbnfIwAM1UBElWd+eLU8pdL/dphftoMctGcclLKzw=;
        b=g3Vq7ofrZUi6h2I2M6B3OX4dNQq2nLXejE9pGC04L7HdZJkCGPP7pvXAaRvkQcU4/5
         Gel2acwgDJxUGLhhj+FcPw5zKotAEtcYpUGK8nSVZF4RiT2be5/ETOt1r3HGKg4RAZAh
         X5ZsT6eLdVIhV+6lAlWRG+G7lRAWTUqOwo0kGX+j5nhMGaBdegxnweUV+B7yNtdwncyt
         nggdlREGzlx7vLVXnI83/fapMH6ZVCygpGTbxfhe3P+PY8wo2UWpRA0C7caJnaqxhZyz
         ZI/9gy1np027T+xRmZmWlC5VwwA1Y61AFBp7MeTkeA4LJ5djraXqZjBRMNIMqgS5PNtO
         gaog==
X-Gm-Message-State: ANoB5pmlE132nfBp6AH42oC9CNrmMQvzH1l0Z4kWZRyZbw67H7DjzZ5D
	dzRhPpD518UA8S6kNkTXnA==
X-Google-Smtp-Source: AA0mqf6LUacexCNxfUGxQ17BkFB08L9QiNMNHe0Eg9i7cd8dUW4mlTa6hPo0iYXWKDpyFut5cKRJHA==
X-Received: by 2002:a05:6808:2188:b0:35b:d987:bcf5 with SMTP id be8-20020a056808218800b0035bd987bcf5mr4203652oib.101.1669936777539;
        Thu, 01 Dec 2022 15:19:37 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 124-20020a4a0d82000000b0049fcedf1899sm2296342oob.3.2022.12.01.15.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 15:19:36 -0800 (PST)
Received: (nullmailer pid 1667342 invoked by uid 1000);
	Thu, 01 Dec 2022 23:19:36 -0000
Date: Thu, 1 Dec 2022 17:19:36 -0600
From: Rob Herring <robh@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Osipenko <digetx@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Richard Leitner <richard.leitner@skidata.com>
Subject: Re: [PATCH v2 01/21] dt-bindings: display: tegra: add Tegra20 VIP
Message-ID: <20221201231936.GB1660613-robh@kernel.org>
References: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
 <20221128152336.133953-2-luca.ceresoli@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128152336.133953-2-luca.ceresoli@bootlin.com>

On Mon, Nov 28, 2022 at 04:23:16PM +0100, Luca Ceresoli wrote:
> VIP is the parallel video capture component within the video input
> subsystem of Tegra20 (and other Tegra chips, apparently).
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changed in v2 (suggested by Krzysztof Kozlowski):
> - remove redundant "bindings" from subject line
> - remove $nodename
> - add channel@0 description
> - add reg: const: 0
> ---
>  .../display/tegra/nvidia,tegra20-vip.yaml     | 63 +++++++++++++++++++
>  MAINTAINERS                                   |  7 +++
>  2 files changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
> new file mode 100644
> index 000000000000..44be2e16c9b4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vip.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra VIP (parallel video capture) controller
> +
> +maintainers:
> +  - Luca Ceresoli <luca.ceresoli@bootlin.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nvidia,tegra20-vip
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  channel@0:

Kind of odd there is only 1 channel with a unit-address. Are more 
channels coming? Please make the binding as complete as possible even if 
no driver support yet.


> +    description: parallel video capture interface for the VI
> +    type: object
> +
> +    properties:
> +      reg:
> +        const: 0
> +
> +      ports:
> +        $ref: /schemas/graph.yaml#/properties/ports
> +
> +        properties:
> +          port@0:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description:
> +              Port receiving the video stream from the sensor
> +
> +          port@1:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description:
> +              Port sending the video stream to the VI
> +
> +        required:
> +          - port@0
> +          - port@1
> +
> +    additionalProperties: false

A bit easier to read the indented cases if this is above 'properties'.

> +
> +    required:
> +      - reg
> +      - ports
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +  - channel@0
> +
> +# see nvidia,tegra20-vi.yaml for an example
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 69565ac0c224..92c762f85f17 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20315,6 +20315,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
>  F:	drivers/staging/media/tegra-video/
>  
> +TEGRA VIDEO DRIVER FOR TEGRA20 VIP (PARALLEL VIDEO CAPTURE)
> +M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
> +L:	linux-media@vger.kernel.org
> +L:	linux-tegra@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
> +
>  TEGRA XUSB PADCTL DRIVER
>  M:	JC Kuo <jckuo@nvidia.com>
>  S:	Supported
> -- 
> 2.34.1
> 
> 
