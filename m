Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A8972
	for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 21:09:37 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id u22so11580889oie.5
        for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 14:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ECAcJQ5j3b9V37w+5AU1dCjJzeuc06UOkYf0x/TJhHI=;
        b=pnx068x7ie2eBHJzGo9KZ88EkrqAlgpautZL8dO8+pLjlR7EwuOXHxP5EunSc6wVGm
         enCjtdAmZ51oV0j0CLOjwPTQgmbnGJH/LNTWKArYq+/2H3gJdw25UUlb2GnmVKwZ6as2
         EJJXw2aM1IDQnkHyyPEPc7NmPkuRkWWb8aAJ3y2vRTCOu0IHiH8VqW+SYl5smJHBUP9d
         xpb7cV0BiOIHHu/Yl3ro7XH0nw6KrrnV4geN2FhK9BhycHY3LsWTYn0+8q/Qjjy0svKn
         QK06U+BNoa2nOZf6THGfVix+G9yzlVICCqwkQGtmMUtoid+43tFDgUb5wnppZBpvcdlS
         ZJGg==
X-Gm-Message-State: AOAM531HGhfTS3ZSibFRdVxHFcSd9m9u/kmFKry7gTPb5fVYHCkoBj/P
	rJF3UvuUViY2PH/sm4iolA==
X-Google-Smtp-Source: ABdhPJxgGB/F5m/HUdgfquhEQY/6qPe41K4exPARMH+1jXMEbOmyXEtt37OEluaLbFS8sOex0LCyaQ==
X-Received: by 2002:aca:645:: with SMTP id 66mr5369149oig.145.1632431377021;
        Thu, 23 Sep 2021 14:09:37 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id d10sm1701331ooj.24.2021.09.23.14.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 14:09:36 -0700 (PDT)
Received: (nullmailer pid 3527425 invoked by uid 1000);
	Thu, 23 Sep 2021 21:09:34 -0000
Date: Thu, 23 Sep 2021 16:09:34 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-mmc@vger.kernel.org, 
	Lucas Stach <dev@lynxeye.de>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, linux-kernel@vger.kernel.org, 
	Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	David Heidelberg <david@ixit.cz>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, linux-tegra@vger.kernel.org, 
	Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-usb@vger.kernel.org, 
	linux-clk@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>, linux-pwm@vger.kernel.org, 
	linux-staging@lists.linux.dev, Stefan Agner <stefan@agner.ch>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Viresh Kumar <vireshk@kernel.org>, dri-devel@lists.freedesktop.org, 
	Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, 
	devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, 
	Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH v12 05/35] dt-bindings: clock: tegra-car: Document new
 clock sub-nodes
Message-ID: <YUztDv/KbKVAY7cB@robh.at.kernel.org>
References: <20210920181145.19543-1-digetx@gmail.com>
 <20210920181145.19543-6-digetx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210920181145.19543-6-digetx@gmail.com>

On Mon, 20 Sep 2021 21:11:15 +0300, Dmitry Osipenko wrote:
> Document sub-nodes which describe Tegra SoC clocks that require a higher
> voltage of the core power domain in order to operate properly on a higher
> clock rates.  Each node contains a phandle to OPP table and power domain.
> 
> The root PLLs and system clocks don't have any specific device dedicated
> to them, clock controller is in charge of managing power for them.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/clock/nvidia,tegra20-car.yaml    | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
