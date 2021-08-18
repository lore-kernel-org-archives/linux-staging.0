Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EAF72
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 01:17:37 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id w22-20020a056830411600b0048bcf4c6bd9so776648ott.8
        for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 18:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eKtNQFzlTBGPaxfs2EmRb1riSIc24m2XgELeYM91Y4A=;
        b=pcYqvVvV3xFOnnur8VoM5f7VvlXNszYheSDRnoU788jErt5WWYTwH7pKTtPTxfKVKW
         3/4t9pwiiIkeNuzUXH0B4eJzdbj46/Y9QspS6qR5qR2kpEK5LJE9bG36BdqKfT0Uogiz
         rAo7y2FgMP0+sjm5ApjRJyFoKnfpLJLxvbbfJgRwuVG/oTUaDPkgZ9WcAAD0TIXny5bN
         NISyPDNtxXEdgyEKicBcwmI59Sk2lCZ5LgPfky5qW5GZrO+wK9Z70awR9ErGyJI0kaU9
         2pqFiwpw84Um0YqBOpGBEHggQ9CmKvT6ecGA7K5iJS1h3iBwBqAUggOae9TZJURNXAfE
         oPvQ==
X-Gm-Message-State: AOAM531CgbdBzRJpxvUGO+3e+i9XnP6CxDwbGW0SvA22qAWMPEny+Mua
	EMpyxM2dvRtFUL74LGyJQg==
X-Google-Smtp-Source: ABdhPJwU/r4DfRsxBODbwZOAT7Fuj3KBuNK588MGjUDZF59lolTrMg3kNGSScZqTWBSlXRqF+y+4aw==
X-Received: by 2002:a9d:a12:: with SMTP id 18mr4963065otg.252.1629249456779;
        Tue, 17 Aug 2021 18:17:36 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p26sm752775ota.71.2021.08.17.18.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 18:17:36 -0700 (PDT)
Received: (nullmailer pid 1178148 invoked by uid 1000);
	Wed, 18 Aug 2021 01:17:34 -0000
Date: Tue, 17 Aug 2021 20:17:34 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	Vignesh Raghavendra <vigneshr@ti.com>, Michael Turquette <mturquette@baylibre.com>, linux-spi@vger.kernel.org, 
	Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org, 
	Stefan Agner <stefan@agner.ch>, Nishanth Menon <nm@ti.com>, linux-staging@lists.linux.dev, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-usb@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, 
	linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-media@vger.kernel.org, Peter Chen <peter.chen@kernel.org>, 
	Lucas Stach <dev@lynxeye.de>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-pwm@vger.kernel.org, Richard Weinberger <richard@nod.at>, 
	Peter De Schrijver <pdeschrijver@nvidia.com>, Lee Jones <lee.jones@linaro.org>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Viresh Kumar <vireshk@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-pm@vger.kernel.org, 
	Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh+dt@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v8 24/34] media: dt: bindings: tegra-vde: Document OPP
 and power domain
Message-ID: <YRxfrvd2sR5ALeuX@robh.at.kernel.org>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-25-digetx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817012754.8710-25-digetx@gmail.com>

On Tue, 17 Aug 2021 04:27:44 +0300, Dmitry Osipenko wrote:
> Document new OPP table and power domain properties of the video decoder
> hardware.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../devicetree/bindings/media/nvidia,tegra-vde.yaml  | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
