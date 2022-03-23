Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FA266C5
	for <linux-staging@lists.linux.dev>; Wed, 23 Mar 2022 18:44:48 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id q129so2563664oif.4
        for <linux-staging@lists.linux.dev>; Wed, 23 Mar 2022 11:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UhAIis1sOQRNVOvuZb/HadToEgbIlD8Ne2xz3MzwvhE=;
        b=zmzJidMri/Q6E2Nr3Fd2qJNhbBcxW1Hj0847qOoyXtU9rBTqurTErErGHTyhcvT9hZ
         /C1AwXeYoERLPy3b9inwO6t6ezVaSLxD1zKV0zcku+mNssCvukZYAuiW7mVadUjnxahK
         5dys/IS61H83mrb/53svil0FSgdbnvq+P/4PoX5IFvH8YaWCO/X9nwVPQLztOP14H1Pv
         PfYV9hLCf4PuESVdZ+Iv1LAw9NmMBmoFmYw0hPielZ9uVhivxKH4fxiS1NzFOghZwrG/
         dEKFdGioKzVSH8m02/Oujx8a/ZfkPYV5jPptlkSvBRpUuaEiq/9wQCcVTx58zD5nu+pM
         uX4A==
X-Gm-Message-State: AOAM531A8PyorPgprgVa5Y0iSvwRNw+VEqxGWJzluIhpXHT6gb8UWFgU
	F0peLeSpRIbE38zYoO216A==
X-Google-Smtp-Source: ABdhPJwgXCtwH1bJb5phSOJ/PNftPX3MRNt1PhAGu5iAKeTjH+CgiYzDdRdv3pDRcsD1OLWbbclljw==
X-Received: by 2002:aca:59d5:0:b0:2ef:2125:ec15 with SMTP id n204-20020aca59d5000000b002ef2125ec15mr864310oib.4.1648061088200;
        Wed, 23 Mar 2022 11:44:48 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r21-20020a05683002f500b005b249ffa43fsm350713ote.22.2022.03.23.11.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 11:44:47 -0700 (PDT)
Received: (nullmailer pid 237514 invoked by uid 1000);
	Wed, 23 Mar 2022 18:44:46 -0000
Date: Wed, 23 Mar 2022 13:44:46 -0500
From: Rob Herring <robh@kernel.org>
To: Adrien Thierry <athierry@redhat.com>
Cc: linux-kernel@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gaston Gonzalez <gascoar@gmail.com>, Ojaswin Mujoo <ojaswin98@gmail.com>, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: soc: bcm: bcm2835-vchiq: Add support
 for bcm2711
Message-ID: <YjtqnktIHajn8skP@robh.at.kernel.org>
References: <20220315200929.74952-1-athierry@redhat.com>
 <20220315200929.74952-2-athierry@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220315200929.74952-2-athierry@redhat.com>

On Tue, Mar 15, 2022 at 04:09:28PM -0400, Adrien Thierry wrote:
> Add a new compatible string for BCM2711. This is the chip used on the
> Raspberry Pi 4.
> 
> Signed-off-by: Adrien Thierry <athierry@redhat.com>
> ---
>  .../devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml
> index e04439b3355b..599bd283df1b 100644
> --- a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml
> +++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml
> @@ -27,6 +27,12 @@ properties:
>                - brcm,bcm2836-vchiq
>            - const: brcm,bcm2835-vchiq
>  
> +      - description: BCM2711 based boards
> +        items:
> +          - enum:
> +              - brcm,bcm2711-vchiq
> +          - const: brcm,bcm2711-vchiq

Why do you have the same compatible twice?

> +
>    reg:
>      description: Physical base address and length of the doorbell register pair
>      minItems: 1
> -- 
> 2.35.1
> 
> 
