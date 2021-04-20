Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C71771
	for <linux-staging@lists.linux.dev>; Tue, 20 Apr 2021 09:07:44 +0000 (UTC)
Received: from mail-ed1-f49.google.com ([209.85.208.49]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MBlpC-1lMi4h1Pmm-00C8aR for <linux-staging@lists.linux.dev>; Tue, 20 Apr
 2021 11:07:43 +0200
Received: by mail-ed1-f49.google.com with SMTP id d21so24031326edv.9
        for <linux-staging@lists.linux.dev>; Tue, 20 Apr 2021 02:07:43 -0700 (PDT)
X-Gm-Message-State: AOAM533s1tNgP4zlcdNuwmKdKII2xlsgnxYu4Yw6hl13oaaxqYodRqzl
	3TOO19Uj1b1Er0KLjJOR5o4ztRbbbORSIrqfiek=
X-Google-Smtp-Source: ABdhPJwSiNwlZ27l6d0oeVOJMjBIBpaEf6fV+Kr02yQOCGa6DdHdokE+eIs4+TiyDD+ybgS8jO4hGYikHl0QAhmuRDs=
X-Received: by 2002:adf:db4f:: with SMTP id f15mr19571156wrj.99.1618909652608;
 Tue, 20 Apr 2021 02:07:32 -0700 (PDT)
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
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 20 Apr 2021 11:07:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1GjeHyMCworQYVtp5U0uu2B9VBHmf9y0hGn-o8aKSJZw@mail.gmail.com>
Message-ID: <CAK8P3a1GjeHyMCworQYVtp5U0uu2B9VBHmf9y0hGn-o8aKSJZw@mail.gmail.com>
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
X-Provags-ID: V03:K1:SAlJE9KoS//h67ozN5m2eNFs/Sp7dBtfdXI0WUJuOOeBcs5H9c3
 jvciUP+jjeP+eA3hHT2jMKcbjACBKquuHmogZ4r3HouVk07Vc9BAb+l/MENBLZi/4Z5D6AD
 +1P/iDsiROPis0GGHd6iPuEuONXjLGEte2r6yN0T5WKqAr8NcxjAXaEVUH9o2mgLSYjiHI9
 2b0ktEqLhXW4h6EPRATtQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ic9zOYm76io=:oMsXvk+nxVT0IeGEgwF4m1
 MA1EyE1uCEQCz5B4WcvVgedF/ypHnc9cxWywItai9M2uvdkGqSif0gkqk3YyMsYbOXd0CkWJG
 Ipxb6I613j37FOsD7RSir5j8pG9MSb8VMFKOGvo0IBs3QDtTLDiwXnCLT9uCxpLppH4ZowOgI
 gZfjX8qRq5W0mDamweZ5UOCIf/M5GfKLeNw33zBgONaJjn24bpsJ7+9RfzVREAIqBS/FI7VQ+
 zku2HwNy0rE0YW2Nm9EL1TG70IgcXGUBozJIinSlxOBcSR4gmpKQ/InZAQJWuhRas5d8IfSLV
 1UWBD00euEyhE88XDOcAAhEQkJpRZalIqOrXndbiAB2Bk5Yd1PbVYyP8WnCZBlvTQV10Mk9U1
 LyeSftvIXmjkhUvm+5G1Y7seUSwUvL2RivaTwv5cg0M5c/sExz4dAKvQyUFzPRe8N7Sz6/HFd
 l+BOhNTXfUrV8qb68y93kTNW6NUy7LWgVt6y/MVeDlC/6M67YecOHWrqmvlbHVKmN4YV6nMKY
 KPOb24+pvNhtls1IK4otHP7rLqQG8nlmNMf5lL2rekkNoBsvw2u6gLW8L1TC8mOi4r379pFi4
 ZXliW1nlJm1tQ8hilHSQd1nk5+ZtyVtf64Z8tIXOPg4PtLyEKk/9ryCoiPDdnr4oHNW8dcrKP
 Nk0U=

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
