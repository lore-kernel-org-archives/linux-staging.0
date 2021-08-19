Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF8C2FAD
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 13:07:47 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id f13so3952745vsl.13
        for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 06:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1GCKu9c84zINYtTdflsWXKCWXkOZdKhJUWmHuvrkY+4=;
        b=f+4CRpBzlKKi/DOaSNA/G+hiFrodgB7WwtvP6lDjHBbwMct5xJEnNRIBbwWd50HxVl
         4zhiGfKdAN1zaQTNFhB6Vi8xqc4j40IY1vsyJhWmkAu9OGW99mwK9tXMUYa730kFsYI4
         idKdGIien3FkWDSAe9a9bUwucupyJle2LRixnAHVpFbbr4u728pooiABojadky5czPhQ
         T05rm31+E59u8E8W6WOHoHOIbfDCZtTsEcAVQYXP/NQkrFth/PCbSSe6c7z8JAzoaO1+
         46BAA+NxWAouT+Gc5X4wCTy1dHtG/pP9SH4vbLZ8x03CSox6/vBN4JfPUqmpPE9U44nl
         Iiow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1GCKu9c84zINYtTdflsWXKCWXkOZdKhJUWmHuvrkY+4=;
        b=BhwmTh90scZyOmt0oLUznkBxDP2wJVkWthsP7DAGZx+Bewo7o8T4k82q5ECiZrknod
         s1rrPoLXez0kvJCtSXps1COpOQczntzIjbe6Bju2eMCo/GgN/SUctmXF/gB9GQS1193K
         soi83bGI6Oe1lZPBTczP5OOGkJVCXmbVIKE0DkDmnYvjGYm1NdIUl8jyrBiLIvE9cchS
         URdHwIORR1jeJ9TSQEGsfaA6ah9rrS7fPG3tEYjJwC3GWWpA2vbQLfjT5W4dgtzu7rnB
         EVjIJ3J2o49RxiOWDTw/udjAh6p1p42F5Qk0aypAugMS4PhnzWpFklBObI53sP0WvRJn
         qugQ==
X-Gm-Message-State: AOAM531yp8CrrCtxCzzc6jOhUqeY6F6WCCGZ4wL8iFU6QWyi9fPnqTIH
	n3TIJwQHpLouK3ckYKmgOaZOqRifAsC92TMN82jVBQ==
X-Google-Smtp-Source: ABdhPJyJROokpzMBNet191tDOwD7eE8PakuStZsC4TgI99eWakoC4SNznlH+uH6MVn3jKPVb3Va23L7NrWpzQmbz4ck=
X-Received: by 2002:a67:3212:: with SMTP id y18mr12074668vsy.19.1629378466059;
 Thu, 19 Aug 2021 06:07:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210818043131.7klajx6drvvkftoc@vireshk-i7> <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7> <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7> <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
 <20210818062723.dqamssfkf7lf7cf7@vireshk-i7> <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7> <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
 <20210818095044.e2ntsm45h5cddk7s@vireshk-i7> <CAPDyKFrFF00xGDWPCQnPwF0_QkG4TB2UqggpuBpp8LY_CMKP-A@mail.gmail.com>
 <0354acbe-d856-4040-f453-8e8164102045@gmail.com>
In-Reply-To: <0354acbe-d856-4040-f453-8e8164102045@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Aug 2021 15:07:09 +0200
Message-ID: <CAPDyKFoQdn1rm91iFNJwZwpSYcKJBjDLqtJB4KZAkhgY1Grm-Q@mail.gmail.com>
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
To: Dmitry Osipenko <digetx@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
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
Content-Transfer-Encoding: quoted-printable

On Wed, 18 Aug 2021 at 17:43, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 18.08.2021 13:08, Ulf Hansson =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, 18 Aug 2021 at 11:50, Viresh Kumar <viresh.kumar@linaro.org> wr=
ote:
> >>
> >> On 18-08-21, 11:41, Ulf Hansson wrote:
> >>> On Wed, 18 Aug 2021 at 11:14, Viresh Kumar <viresh.kumar@linaro.org> =
wrote:
> >>>> What we need here is just configure. So something like this then:
> >>>>
> >>>> - genpd->get_performance_state()
> >>>>   -> dev_pm_opp_get_current_opp() //New API
> >>>>   -> dev_pm_genpd_set_performance_state(dev, current_opp->pstate);
> >>>>
> >>>> This can be done just once from probe() then.
> >>>
> >>> How would dev_pm_opp_get_current_opp() work? Do you have a suggestion=
?
> >>
> >> The opp core already has a way of finding current OPP, that's what
> >> Dmitry is trying to use here. It finds it using clk_get_rate(), if
> >> that is zero, it picks the lowest freq possible.
> >>
> >>> I am sure I understand the problem. When a device is getting probed,
> >>> it needs to consume power, how else can the corresponding driver
> >>> successfully probe it?
> >>
> >> Dmitry can answer that better, but a device doesn't necessarily need
> >> to consume energy in probe. It can consume bus clock, like APB we
> >> have, but the more energy consuming stuff can be left disabled until
> >> the time a user comes up. Probe will just end up registering the
> >> driver and initializing it.
> >
> > That's perfectly fine, as then it's likely that it won't vote for an
> > OPP, but can postpone that as well.
> >
> > Perhaps the problem is rather that the HW may already carry a non-zero
> > vote made from a bootloader. If the consumer driver tries to clear
> > that vote (calling dev_pm_opp_set_rate(dev, 0), for example), it would
> > still not lead to any updates of the performance state in genpd,
> > because genpd internally has initialized the performance-state to
> > zero.
>
> We don't need to discover internal SoC devices because we use
> device-tree on ARM. For most devices power isn't required at a probe
> time because probe function doesn't touch h/w at all, thus devices are
> left in suspended state after probe.
>
> We have three components comprising PM on Tegra:
>
> 1. Power gate
> 2. Clock state
> 3. Voltage state
>
> GENPD on/off represents the 'power gate'.
>
> Clock and reset are controlled by device drivers using clk and rst APIs.
>
> Voltage state is represented by GENPD's performance level.
>
> GENPD core assumes that at a first rpm-resume of a consumer device, its
> genpd_performance=3D0. Not true for Tegra because h/w of the device is
> preconfigured to a non-zero perf level initially, h/w may not support
> zero level at all.

I think you may be misunderstanding genpd's behaviour around this, but
let me elaborate.

In genpd_runtime_resume(), we try to restore the performance state for
the device that genpd_runtime_suspend() *may* have dropped earlier.
That means, if genpd_runtime_resume() is called prior
genpd_runtime_suspend() for the first time, it means that
genpd_runtime_resume() will *not* restore a performance state, but
instead just leave the performance state as is for the device (see
genpd_restore_performance_state()).

In other words, a consumer driver may use the following sequence to
set an initial performance state for the device during ->probe():

...
rate =3D clk_get_rate()
dev_pm_opp_set_rate(rate)

pm_runtime_enable()
pm_runtime_resume_and_get()
...

Note that, it's the consumer driver's responsibility to manage device
specific resources, in its ->runtime_suspend|resume() callbacks.
Typically that means dealing with clock gating/ungating, for example.

In the other scenario where a consumer driver prefers to *not* call
pm_runtime_resume_and_get() in its ->probe(), because it doesn't need
to power on the device to complete probing, then we don't want to vote
for an OPP at all - and we also want the performance state for the
device in genpd to be set to zero. Correct?

Is this the main problem you are trying to solve, because I think this
doesn't work out of the box as of today?

There is another concern though, but perhaps it's not a problem after
all. Viresh told us that dev_pm_opp_set_rate() may turn on resources
like clock/regulators. That could certainly be problematic, in
particular if the device and its genpd have OPP tables associated with
it and the consumer driver wants to follow the above sequence in
probe.

Viresh, can you please chime in here and elaborate on some of the
magic happening behind dev_pm_opp_set_rate() API - is there a problem
here or not?

>
> GENPD core assumes that consumer devices can work at any performance
> level. Not true for Tegra because voltage needs to be set in accordance
> to the clock rate before clock is enabled, otherwise h/w won't work
> properly, perhaps clock may be unstable or h/w won't be latching.

Correct. Genpd relies on the callers to use the OPP framework if there
are constraints like you describe above.

That said, it's not forbidden for a consumer driver to call
dev_pm_genpd_set_performance_state() directly, but then it better
knows exactly what it's doing.

>
> Performance level should be set to 0 while device is suspended.

Do you mean system suspend or runtime suspend? Or both?

> Performance level needs to be bumped on rpm-resume of a device in
> accordance to h/w state before hardware is enabled.

Assuming there was a performance state set for the device when
genpd_runtime_suspend() was called, genpd_runtime_resume() will
restore that state according to the sequence you described.

Kind regards
Uffe
