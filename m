Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA53F71
	for <linux-staging@lists.linux.dev>; Tue, 20 Apr 2021 09:11:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3CB2C613B0
	for <linux-staging@lists.linux.dev>; Tue, 20 Apr 2021 09:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618909869;
	bh=DeGQ9vUDRCVhA8t5Ph+0N53DtPOXi7alQM8lRrwQwKo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p0qaMXJByFvnmnNzygjG+wVqrEysTLgHvDiIGpK52K9aQUKK6M3BGjSLyePqEb3Qf
	 oR3oMBtOgJOCh7RcSvkCcBVicfY9CiiXQqSuj3vuq6dpjOGhCmYNVuVfPR+/WjSa8y
	 OjKCkD+Jeiy0rF7z8u1J4LpfnlrCGE/G9N0ySag4aO+wDqsFogGqXT9eHwLSIlfmwd
	 swm8rATrWZ8IwfA14qwCGkgWO/i7lHh6bqTFbABgi05Ale1G4PAajc6jL8bk5XXXNG
	 JygWwRlWhDmLm13ceBOy+pmk9GoTtnNMy2CUIErVU0FqckDVw6S1F+GjMgloAzJarS
	 aElCDGbhH7RTw==
Received: by mail-ej1-f46.google.com with SMTP id w23so41347444ejb.9
        for <linux-staging@lists.linux.dev>; Tue, 20 Apr 2021 02:11:09 -0700 (PDT)
X-Gm-Message-State: AOAM533gDu969Ute4FSWkzVCVaLiGxfvf9WGnq4ild/yYsTTZg9p1fsO
	8OtvfKEFqLyisJXIXZQvMXFLIHHdIHu5z4V+K7k=
X-Google-Smtp-Source: ABdhPJyHjUN6C0/sUkUlP+4nedtBBPWCDMG4VnGKqPhVa1uJB5nLQGViYOHp7TNdMb76BpIs8GkQPbFl+yNnVewK4NU=
X-Received: by 2002:a5d:6dc4:: with SMTP id d4mr20219548wrz.105.1618909856639;
 Tue, 20 Apr 2021 02:10:56 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210419042722.27554-1-alice.guo@oss.nxp.com> <20210419042722.27554-4-alice.guo@oss.nxp.com>
 <YH0O907dfGY9jQRZ@atmark-techno.com> <CAMuHMdVY1SLZ0K30T2pimyrR6Mm=VoSTO=L-xxCy2Bj7_kostw@mail.gmail.com>
 <YH1OeFy+SepIYYG0@atmark-techno.com> <CAK8P3a1Mu2F0irDDCL-50HiHth29iYFL5b7WHZ=UX6W7zzoxAg@mail.gmail.com>
 <YH4VdPNO9cdzc5MD@atmark-techno.com>
In-Reply-To: <YH4VdPNO9cdzc5MD@atmark-techno.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 20 Apr 2021 11:10:40 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1tPQm1Qj2KZu2jOM=TUP0dJgP4G9eKkWfv-PZEAWEhyA@mail.gmail.com>
Message-ID: <CAK8P3a1tPQm1Qj2KZu2jOM=TUP0dJgP4G9eKkWfv-PZEAWEhyA@mail.gmail.com>
Subject: Re: [RFC v1 PATCH 3/3] driver: update all the code that use soc_device_match
To: Dominique MARTINET <dominique.martinet@atmark-techno.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "Alice Guo (OSS)" <alice.guo@oss.nxp.com>, 
	gregkh <gregkh@linuxfoundation.org>, Rafael Wysocki <rafael@kernel.org>, 
	=?UTF-8?Q?Horia_Geant=C4=83?= <horia.geanta@nxp.com>, aymen.sghaier@nxp.com, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Miller <davem@davemloft.net>, 
	Tony Lindgren <tony@atomide.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, peter.ujfalusi@gmail.com, 
	Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Robert Foss <robert.foss@linaro.org>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, tomba@kernel.org, 
	jyri.sarha@iki.fi, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kishon <kishon@ti.com>, 
	Jakub Kicinski <kuba@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Roy Pledge <Roy.Pledge@nxp.com>, Leo Li <leoyang.li@nxp.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, Felipe Balbi <balbi@kernel.org>, 
	Tony Prisk <linux@prisktech.co.nz>, Alan Stern <stern@rowland.harvard.edu>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, linux-omap <linux-omap@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	dmaengine@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, 
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>, 
	Networking <netdev@vger.kernel.org>, linux-phy@lists.infradead.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-staging@lists.linux.dev, 
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
	Linux PM list <linux-pm@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>, 
	LINUXWATCHDOG <linux-watchdog@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 20, 2021 at 1:44 AM Dominique MARTINET
<dominique.martinet@atmark-techno.com> wrote:
> Arnd Bergmann wrote on Mon, Apr 19, 2021 at 02:16:36PM +0200:
> > For built-in drivers, load order depends on the initcall level and
> > link order (how things are lined listed in the Makefile hierarchy).
> >
> > For loadable modules, this is up to user space in the end.
> >
> > Which of the drivers in this scenario are loadable modules?
>
> All the drivers involved in my case are built-in (nvmem, soc and final
> soc_device_match consumer e.g. caam_jr that crashes the kernel if soc is
> not identified properly).

Ok, in that case you may have a chance to just adapt the initcall
levels. This is somewhat fragile if someone else already relies
on a particular order, but it's an easy one-line change to change
a driver e.g. from module_init() or device_initcall() to arch_initcall().

> I frankly don't like the idea of moving nvmem/ above soc/ in
> drivers/Makefile as a "solution" to this (especially as there is one
> that seems to care about what soc they run on...), so I'll have a look
> at links first, hopefully that will work out.

Right, that would be way more fragile.

I think the main problem in this case is the caam driver that really
should not look into the particular SoC type or even machine
compatible string. This is something we can do as a last resort
for compatibility with busted devicetree files, but it appears that
this driver does it as the primary method for identifying different
hardware revisions. I would suggest fixing the binding so that
each SoC that includes one of these devices has a soc specific
compatible string associated with the device that the driver can
use as the primary way of identifying the device.

We probably need to keep the old logic around for old dtb files,
but there can at least be a comment next to that table that
discourages people from adding more entries there.

      Arnd
