Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9B472
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 01:16:12 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id 61-20020a9d0d430000b02903eabfc221a9so850529oti.0
        for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 18:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pZhI8s0bq6Q/ufRFM0cKz5GDmu8z9ddT9tyGnPEkEkA=;
        b=TaGb/qmuQ2TLj/x7hfVh0Gm00mqxpKM5oE7bEdLVITLTfQcudeJBsJ+5XZV9NJYQqJ
         J6lGUVeRDbDkvI+qGw+21tzVuuGe8ur7nwE9mjd2xxLcyr6GNNQdjxf8L6mdBxymXNhi
         DFiQAR7WOWka5ldmTDI8L3pxkDuJaNoQl3LZUL6rRaORH3WqAlx9O7KMfaRgsHd8c0dv
         ojFC1K6TqdA5gF+XnKB9MTUhnKQs6plXRQ9sRk/6g4trvlHG99tvSqVoHycIvBqMvrzs
         SVVslbZ7Si6lYjthC68Swb+Q78gm26ZnvR6AVg2TvZ/IVPbkluAkflkXVU3ytHWb3J4j
         x/ig==
X-Gm-Message-State: AOAM531EKER9KmaKM1DKayqnb7oyfwgDNMu2KHm+YSqueEMUPuwYG4Yl
	ATZ5dKt8N3kVa/6AiYTTqQ==
X-Google-Smtp-Source: ABdhPJygYnXFnxnEh28gqMyYF6NthIHBysWjBhU7p2cYyKWsqAlZXR7MMNfgasUuDyAVpFFwk0mEQg==
X-Received: by 2002:a9d:ecc:: with SMTP id 70mr4970700otj.96.1629249371372;
        Tue, 17 Aug 2021 18:16:11 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l7sm747356ooq.28.2021.08.17.18.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 18:16:10 -0700 (PDT)
Received: (nullmailer pid 1176067 invoked by uid 1000);
	Wed, 18 Aug 2021 01:16:08 -0000
Date: Tue, 17 Aug 2021 20:16:08 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Peter Chen <peter.chen@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>, 
	Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-spi@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-mmc@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 09/34] dt-bindings: host1x: Document Memory Client
 resets of Host1x, GR2D and GR3D
Message-ID: <YRxfWJJ6+1GgVs33@robh.at.kernel.org>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-10-digetx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817012754.8710-10-digetx@gmail.com>

On Tue, Aug 17, 2021 at 04:27:29AM +0300, Dmitry Osipenko wrote:
> Memory Client should be blocked before hardware reset is asserted in order
> to prevent memory corruption and hanging of memory controller.
> 
> Document Memory Client resets of Host1x, GR2D and GR3D hardware units.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/display/tegra/nvidia,tegra20-host1x.txt          | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> index 62861a8fb5c6..07a08653798b 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> @@ -18,6 +18,7 @@ Required properties:
>  - resets: Must contain an entry for each entry in reset-names.
>    See ../reset/reset.txt for details.
>  - reset-names: Must include the following entries:
> +  - mc
>    - host1x

New entries should be at the end. Order matters.

>  
>  Optional properties:
> @@ -197,6 +198,7 @@ of the following host1x client modules:
>    - resets: Must contain an entry for each entry in reset-names.
>      See ../reset/reset.txt for details.
>    - reset-names: Must include the following entries:
> +    - mc
>      - 2d
>  
>    Optional properties:
> @@ -222,6 +224,8 @@ of the following host1x client modules:
>    - resets: Must contain an entry for each entry in reset-names.
>      See ../reset/reset.txt for details.
>    - reset-names: Must include the following entries:
> +    - mc
> +    - mc2 (Only required on SoCs with two 3D clocks)
>      - 3d
>      - 3d2 (Only required on SoCs with two 3D clocks)
>  
> -- 
> 2.32.0
> 
> 
