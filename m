Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0B02C87
	for <linux-staging@lists.linux.dev>; Wed,  6 Oct 2021 12:44:19 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id j5so9903700lfg.8
        for <linux-staging@lists.linux.dev>; Wed, 06 Oct 2021 05:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZKqaWxUs3sgD4tdQBsKfjQHFZ50A1AY57zWO3HzEaz0=;
        b=p7O7r3g85OL9vVkRCa3Pfl3C5X1Jfj9eXjPMKWVLsEhkWogxYEcClklxYGVWQq8A2P
         lEHLpYxRHgQW4uXVDoPHoUArsfuteRAt1b6CIA3FJ+EjNOe5zUT+AAgMFYGSzljSZ6TO
         KoFs69gM6EHycwixuzD1lK9+dV8Me5UuqmZ9rtY57gAwYRrE057gkoCf0Uoi9LCBgyR9
         7atsGho2QXhE+dDu8BmXr5Ur/SWTeiQD4sTYuNaaOKKOVXapsZOBOVO1z6VNsE4WUUbL
         lGzoNXh0xJAquXu3k8a0vYJYpOb6yc9cyGw4+SDPKUnM/cHV804+EyEdWXyu6r4B41NO
         0G0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZKqaWxUs3sgD4tdQBsKfjQHFZ50A1AY57zWO3HzEaz0=;
        b=q8PxXMR18f8kDdWQzr+waLZPze1H5wwa9ENOa3UV0paYK3R9LGD2jIC0k4u2GMlC2l
         GPd0VDzUAz43N/kn3Z81+Tj8vpm0B21g0EGxB2OxsE++fH15DicdvOb5cD3qxCAlS5Sm
         E0zoggT7k4s6VEwo19asUvVZBRWTfHX+6NKJHMX5IYM3y9hTM3GYpbCgUzuYMDXcIQkU
         Ri+5n7AU6DP8b50e6c129n+6IUHbs47L/zoBmqLkmLE6PVHLPrgjf3SG4oxDKT490jcK
         32SaL2o82GYj8qkW7m3ForC8jjhNarSlJdVawEVxlXnykOLiw6EJicQKhFkvezBH+gUc
         lmfQ==
X-Gm-Message-State: AOAM530dwvXAyk14+yOh/HaSGNzSc0cCDZz5yETs1aFFh0KgZrfRL45a
	kXQpslLz4HVglLXPIINZtKHPjgIGxucTyrA6aTZUnQ==
X-Google-Smtp-Source: ABdhPJyXxeHpfLtxmaaabzboN40a7mbS25hsa4pgTQ9RD1C7UcaYr5BpIOQmIiI1EQ4OQX0iO/sLUK+eeOQGXFL/ZtE=
X-Received: by 2002:ac2:4157:: with SMTP id c23mr9458293lfi.184.1633524257867;
 Wed, 06 Oct 2021 05:44:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210926224058.1252-1-digetx@gmail.com> <20210926224058.1252-7-digetx@gmail.com>
 <CAPDyKFq+LS4Jr1GyC-a-tGWPzGH0JxfJ9wKY=uQEBGYm952azw@mail.gmail.com>
 <24101cd6-d3f5-1e74-db39-145ecd30418b@gmail.com> <CAPDyKFreK7976PJL-1zySoza_yXM7rMQ64aODWUZ+U3L-uCa0w@mail.gmail.com>
 <4bdba8a2-4b9b-ed7d-e6ca-9218d8200a85@gmail.com> <74a47158-e2e4-5fd0-3f37-0b50d4ead4d9@gmail.com>
In-Reply-To: <74a47158-e2e4-5fd0-3f37-0b50d4ead4d9@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 6 Oct 2021 14:43:41 +0200
Message-ID: <CAPDyKFr2-f1wM+6jF9vWJ-Nq80Zg1Z3qFP6saULOrBi1270HGw@mail.gmail.com>
Subject: Re: [PATCH v13 06/35] clk: tegra: Support runtime PM and power domain
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Peter De Schrijver <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Michael Turquette <mturquette@baylibre.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>, 
	Linux PM <linux-pm@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>, 
	linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org, 
	linux-mmc <linux-mmc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>, 
	Stefan Agner <stefan@agner.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>, David Heidelberg <david@ixit.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 6 Oct 2021 at 00:43, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 06.10.2021 01:19, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> > I reproduced the OFF problem by removing the clk prepare/unprepare from
> > the suspend/resume of the clk driver and making some extra changes to
> > clock tree topology and etc to trigger the problem on Nexus 7.
> >
> > tegra-pmc 7000e400.pmc: failed to turn off PM domain heg: -13
> >
> > It happens from genpd_suspend_noirq() -> tegra_genpd_power_off() -> clk
> > -> GENPD -> I2C -> runtime-pm.
> >
> > -13 is EACCES, it comes from the runtime PM of I2C device. RPM is
> > prohibited/disabled during late (NOIRQ) suspend by the drivers core.
>
> My bad, I double-checked and it's not I2C RPM that is failing now, but
> the clock's RPM [1], which is also unavailable during NOIRQ.

Yes, that sounds reasonable.

You would then need a similar patch for the tegra clock driver as I
suggested for tegra I2C driver. That should solve the problem, I
think.

>
> [1]
> https://elixir.free-electrons.com/linux/v5.15-rc4/source/drivers/clk/clk.=
c#L116
>
> Previously it was I2C RPM that was failing in a similar way, but code
> changed a tad since that time.

Alright. In any case, as long as the devices gets suspended in the
correct order, I think it should be fine to cook a patch along the
lines of what I suggest for the I2C driver as well.

It should work, I think. Although, maybe you want to avoid runtime
resuming the I2C device, unless it's the device belonging to the PMIC
interface, if there is a way to distinguish that for the driver.

Kind regards
Uffe
