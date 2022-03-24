Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA4823A7
	for <linux-staging@lists.linux.dev>; Thu, 24 Mar 2022 18:49:34 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a8so10964181ejc.8
        for <linux-staging@lists.linux.dev>; Thu, 24 Mar 2022 11:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=aTjAKQGCfPlJln9zd/tK8o/KaPUGxIgYbJ689zU84Xk=;
        b=LZB0uo8yTcuSwKxDeaTRvmOHdaDjDG2q9dF6OGs/GuH9HiABhhB9xVQN/YLfqZGbDg
         oXoPoPh9aVXS/1N8w6dyAXV0aUS0Dmrh245/bA3Er752c1o44oLWtsxGBNBI8ElQnh8f
         RVyRsCZl43HAtzZIOrAQUWo/4oPReeZU8y5gMjLCbDqimbQ2zlNF8WEM3cyh07yBD0ri
         a7jW4rmMbHXx2DdbW/Db1LMym8PrHNO7FoqKc6NWAunYU0DF5YpEFh3KEXH+j5S5qb3H
         CHDyh2hMkF4mC2ddHV/h9CTXQO6B0OGZttZZLbTxfrIYskWiCWbhU3uJwfl1g8pptQIN
         2YPQ==
X-Gm-Message-State: AOAM532uhy5KO/kQF91GVT3nf+FGSuUxhCAkRCzfniZQuGjlXMfHVp31
	7lt4h/cAXG9lSOghj3slseA=
X-Google-Smtp-Source: ABdhPJx0yh4i61OuUX1h2uflP+3ycICGo/1ZDlu+iOzHHl7m9S9G/8D1Sb3SQLu3dYc1Ps79Pnn4Mg==
X-Received: by 2002:a17:907:d0d:b0:6df:e215:313d with SMTP id gn13-20020a1709070d0d00b006dfe215313dmr7206776ejc.309.1648147772500;
        Thu, 24 Mar 2022 11:49:32 -0700 (PDT)
Received: from [192.168.0.158] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.googlemail.com with ESMTPSA id k16-20020a17090646d000b006e093439cdfsm467351ejs.89.2022.03.24.11.49.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Mar 2022 11:49:31 -0700 (PDT)
Message-ID: <7d87aee4-1aa8-4e3a-4f67-9ae3981f261e@kernel.org>
Date: Thu, 24 Mar 2022 19:49:30 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] staging: vchiq_arm: Use bcm2711 compatible string
 for bcm2711-based RPi
Content-Language: en-US
To: Adrien Thierry <athierry@redhat.com>, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Stefan Wahren
 <stefan.wahren@i2se.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gaston Gonzalez <gascoar@gmail.com>, Ojaswin Mujoo <ojaswin98@gmail.com>,
 linux-staging@lists.linux.dev
References: <20220324172647.167617-1-athierry@redhat.com>
 <20220324172647.167617-3-athierry@redhat.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220324172647.167617-3-athierry@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/03/2022 18:26, Adrien Thierry wrote:
> Use bcm2711 compatible string in vchiq driver and device tree for
> bcm2711-based Raspberry Pi (Raspberry Pi 4). This is consistent with
> what the downstream device tree uses, and allows running the vchiq
> driver on the upstream kernel with the downstream device tree.
> 
> Signed-off-by: Adrien Thierry <athierry@redhat.com>
> ---
>  arch/arm/boot/dts/bcm2711-rpi.dtsi                           | 1 +

DTS is always separate, independent of device drivers. If you mix them,
it's usually a sign of ABI breakage or compatibility issues, so don't
mix them.

>  .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c    | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/bcm2711-rpi.dtsi b/arch/arm/boot/dts/bcm2711-rpi.dtsi
> index ca266c5d9f9b..c868d1dcaba7 100644
> --- a/arch/arm/boot/dts/bcm2711-rpi.dtsi
> +++ b/arch/arm/boot/dts/bcm2711-rpi.dtsi
> @@ -70,5 +70,6 @@ blconfig: nvram@0 {
>  };
>  
>  &vchiq {
> +	compatible = "brcm,bcm2711-vchiq";

This looks weird. Is BCM2711 on Raspberry Pi 4 different than other
BCM2711? Commit msg also does not explain this.


>  	interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
>  };
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 3a2e4582db8e..136c664132f4 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -81,6 +81,10 @@ static struct vchiq_drvdata bcm2836_drvdata = {
>  	.cache_line_size = 64,
>  };
>  
> +static struct vchiq_drvdata bcm2711_drvdata = {
> +	.cache_line_size = 64,
> +};
> +
>  struct vchiq_arm_state {
>  	/* Keepalive-related data */
>  	struct task_struct *ka_thread;
> @@ -1748,6 +1752,7 @@ void vchiq_platform_conn_state_changed(struct vchiq_state *state,
>  static const struct of_device_id vchiq_of_match[] = {
>  	{ .compatible = "brcm,bcm2835-vchiq", .data = &bcm2835_drvdata },
>  	{ .compatible = "brcm,bcm2836-vchiq", .data = &bcm2836_drvdata },
> +	{ .compatible = "brcm,bcm2711-vchiq", .data = &bcm2711_drvdata },

Just re-use bcm2836_drvdata instead of duplicating it.

>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, vchiq_of_match);


Best regards,
Krzysztof
