Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D906329CA
	for <linux-staging@lists.linux.dev>; Wed, 15 Dec 2021 16:53:21 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id x43-20020a056830246b00b00570d09d34ebso25670224otr.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Dec 2021 08:53:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xm9gpKkVx8JRZ7dzKc9hCU1OHkufwqdeq6wW80KqSwA=;
        b=Xp375RP+F6ySePmSk90c8uBtJhKF8/bnE/qQkkKKSQ7oTsj+HuK5uvpHlSU4hWlKy6
         L67J1vETa5Yq5qgSahXhYZOZfEWZ25Mwwqm1u9W1muVc1PoO0dojyC5lC7hMBXIvrR8g
         zY5NaIV5ceeSygCPx3XxhqTjtn9ndha/xP5ccpJzONbqi6KXUdS/SPaVuXcuhahNXE1x
         RZL1w5eYMKWDtzUVHvSv9nlqntmBu8gQAvR9xhrEjOf7cAj1CzIOSDQdN2XR4QNG5x9a
         vXMKBzP4mT9q9445yqsVNnQIa+f0JBwFBMmqEXsNUMruJm9qTdjMB+hH/22pVNEbDowL
         Kesg==
X-Gm-Message-State: AOAM531QnGQWq+0X49hHyVsB6UUyK/ugptnDsOE1Q3dYP72IaViRp7gS
	tk1GOCLfXas2acPmBvpByQ==
X-Google-Smtp-Source: ABdhPJyKtoicFALG4i4urGSzoDXuoc7COnK+VLsgjbQi7WLCicmQaJorWgLOrIAOsd0okSfXK3zfnw==
X-Received: by 2002:a05:6830:4d6:: with SMTP id s22mr9720535otd.270.1639587201035;
        Wed, 15 Dec 2021 08:53:21 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bc7sm578949oob.35.2021.12.15.08.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 08:53:20 -0800 (PST)
Received: (nullmailer pid 1462226 invoked by uid 1000);
	Wed, 15 Dec 2021 16:53:18 -0000
Date: Wed, 15 Dec 2021 10:53:18 -0600
From: Rob Herring <robh@kernel.org>
To: Adam Ford <aford173@gmail.com>
Cc: linux-media@vger.kernel.org, benjamin.gaignard@collabora.com, cphealy@gmail.com, aford@beaconembedded.com, nicolas@ndufresne.ca, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lucas Stach <l.stach@pengutronix.de>, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 08/10] dt-bindings: media: nxp,imx8mq-vpu: Enable support
 for i.MX8M Mini
Message-ID: <Ybodfln1RtezsARN@robh.at.kernel.org>
References: <20211208225030.2018923-1-aford173@gmail.com>
 <20211208225030.2018923-9-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208225030.2018923-9-aford173@gmail.com>

On Wed, Dec 08, 2021 at 04:50:27PM -0600, Adam Ford wrote:
> The i.MX8M mini appears to have a similar G1 and G2 decoder but the
> post-procesing isn't present.  Add compatible flags to support
> G1 and G2 without post-processing.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
>  Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> index eeb7bd6281f9..fb6c2ab1b2dc 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> @@ -20,6 +20,8 @@ properties:
>          deprecated: true
>        - const: nxp,imx8mq-vpu-g1
>        - const: nxp,imx8mq-vpu-g2
> +      - const: nxp, imx8mm-vpu-g1
> +      - const: nxp, imx8mm-vpu-g2

space                 ^

>  
>    reg:
>      minItems: 1
> -- 
> 2.32.0
> 
> 
