Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB23929CA
	for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 13:08:47 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id x6so589748uai.11
        for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 06:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1jeLsd0F5nu8VxBSxWPjs9ij/vCzMSfR5Tmv5iuwd6s=;
        b=WC/dbJiZXZbYao7JhIntQY4TZ71VEiAo3x28NE7fEM5kyH3E5QMkrYaKxo+tOHuBq2
         4fOoN/8kF20QYOvTlDeczofK7BcIqjasNY7CBq53XfqL9k8ztpMQHfVcSzVO71rO64Zq
         McT44tin8yfog5Tj3F9uEcMm8s9RXuEY0am/zJIYxZIPBOSKQ0gPSUGTqV2fLnNdUMyA
         Udra5icYrRXmu3Bub8tb1oL++vAVtV4op8H5c4RaKOsboeh/aX+gQt/xKF7m6+TffsNV
         KpFsGCqib0Qpb9uD4iaINA3IeiJAs50v1pCyq6JF3tpma3/8Ou1apbdGh5FgySUdxEte
         6zRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1jeLsd0F5nu8VxBSxWPjs9ij/vCzMSfR5Tmv5iuwd6s=;
        b=LGqpLkmRA/x3NoORBytsdvc975vqGzWGlETNR7OAwL3dD0IMy5yOu293vVZV/aWTOT
         /5b4No1AKZLW1fXjQvw/8RRBoOdeIZyWOR6fgt2JCvvmL5CfcAZeyA5D+zHbByIs938n
         OLUw4z0cSI8aV1y5CFWiOJX8SOpBOX8g8PZ1sbLZQcBIfsIYRCaNGk/RbO+apxRZ089b
         59gzjU1qw7G2oA4SX+oTsK5qHwUg5zxFYJx+PEU4KKzGfT8D+k7NkNWrimVkINGlFhuh
         LxKAvAHkBgI9Kl0yLc8nwbrTuIyn77FeULVYynX03V6baU8O2UkQ0162dSguS9y678mf
         Ouhw==
X-Gm-Message-State: AOAM532YMnRPblCB+/Qyivh6cdTIdL5Yc1z4pRWTrGChVm5BBxgXCDSE
	5aQEyOgMxiIOYye7YJoQHUyCPfUsIwmjsAojP2WKwQ==
X-Google-Smtp-Source: ABdhPJyudXWst0uOFOvLTh4dvpAObwIHCZFQbOR7Ax2SinJKzLNlpYWdAnSEO7YQ/BLnbTZWMq48nnebeaOpVOjUigE=
X-Received: by 2002:ab0:60a9:: with SMTP id f9mr15039087uam.19.1629464926939;
 Fri, 20 Aug 2021 06:08:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210817012754.8710-1-digetx@gmail.com> <20210817012754.8710-8-digetx@gmail.com>
 <YR0UBi/ejy+oF4Hm@orome.fritz.box> <da7356cb-05ee-ba84-8a7c-6e69d853a805@gmail.com>
 <YR04YHGEluqLIZeo@orome.fritz.box> <ad99db08-4696-1636-5829-5260f93dc681@gmail.com>
 <YR6Mvips3HAntDy0@orome.fritz.box> <e17bbe8d-7c0f-fc3d-03c7-d75c54c24a43@gmail.com>
 <YR+VDZzTihmpENp6@orome.fritz.box>
In-Reply-To: <YR+VDZzTihmpENp6@orome.fritz.box>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 20 Aug 2021 15:08:10 +0200
Message-ID: <CAPDyKFpJ+TK0w1GZEA7G=rtAjq5ipmVR4P0wy7uHiEGVWRk5yA@mail.gmail.com>
Subject: Re: [PATCH v8 07/34] clk: tegra: Support runtime PM and power domain
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Peter De Schrijver <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Lee Jones <lee.jones@linaro.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>, 
	Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>, 
	Linux PM <linux-pm@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>, 
	linux-staging@lists.linux.dev, linux-spi@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-mmc <linux-mmc@vger.kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

[...]

> >
> > I'm creating platform device for the clocks that require DVFS. These
> > clocks don't use regulator, they are attached to the CORE domain.
> > GENPD framework manages the performance state, aggregating perf votes
> > from each device, i.e. from each clock individually.
> >
> > You want to reinvent another layer of aggregation on top of GENPD.
> > This doesn't worth the effort, we won't get anything from it, it
> > should be a lot of extra complexity for nothing. We will also lose
> > from it because pm_genpd_summary won't show you a per-device info.
> >
> > domain                          status          children                           performance
> >     /device                                             runtime status
> > ----------------------------------------------------------------------------------------------
> > heg                             on                                                 1000000
> >     /devices/soc0/50000000.host1x                       active                     1000000
> >     /devices/soc0/50000000.host1x/54140000.gr2d         suspended                  0
> > mpe                             off-0                                              0
> > vdec                            off-0                                              0
> >     /devices/soc0/6001a000.vde                          suspended                  0
> > venc                            off-0                                              0
> > 3d1                             off-0                                              0
> >     /devices/genpd:1:54180000.gr3d                      suspended                  0
> > 3d0                             off-0                                              0
> >     /devices/genpd:0:54180000.gr3d                      suspended                  0
> > core-domain                     on                                                 1000000
> >                                                 3d0, 3d1, venc, vdec, mpe, heg
> >     /devices/soc0/7d000000.usb                          active                     1000000
> >     /devices/soc0/78000400.mmc                          active                     950000
> >     /devices/soc0/7000f400.memory-controller            unsupported                1000000
> >     /devices/soc0/7000a000.pwm                          active                     1000000
> >     /devices/soc0/60006000.clock/tegra_clk_pll_c        active                     1000000
> >     /devices/soc0/60006000.clock/tegra_clk_pll_e        suspended                  0
> >     /devices/soc0/60006000.clock/tegra_clk_pll_m        active                     1000000
> >     /devices/soc0/60006000.clock/tegra_clk_sclk         active                     1000000
> >
>
> I suppose if there's really no good way of doing this other than
> providing a struct device, then so be it. I think the cleaned up sysfs
> shown in the summary above looks much better than what the original
> would've looked like.
>
> Perhaps an additional tweak to that would be to not create platform
> devices. Instead, just create struct device. Those really have
> everything you need (.of_node, and can be used with RPM and GENPD). As I
> mentioned earlier, platform device implies a CPU-memory-mapped bus,
> which this clearly isn't. It's kind of a separate "bus" if you want, so
> just using struct device directly seems more appropriate.

Just a heads up. If you don't use a platform device or have a driver
associated with it for probing, you need to manage the attachment to
genpd yourself. That means calling one of the dev_pm_domain_attach*()
APIs, but that's perfectly fine, ofcourse.

>
> We did something similar for XUSB pads, see drivers/phy/tegra/xusb.[ch]
> for an example of how that was done. I think you can do something
> similar here.
>
> Thierry

Kind regards
Uffe
