Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E962C80
	for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 06:31:50 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id l68so7515949vkh.4
        for <linux-staging@lists.linux.dev>; Sun, 09 Jan 2022 22:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hZzd9srfJg0sRysUCYuH0L2R2O31L83ni9EMVLSvk6o=;
        b=CK57ykFCY0qvPnBtUyV62MrYaX3TXTcUB6bsUUIT4lIFv5DN2PGAZj4SupJUfjSq2s
         DRANo9MnDw3s4V7ic+SUCvFFg/EUri6QUIUC6KLVR7WWAic+hV5PwtSm5ixGQl2kHv0B
         q4ZpO/4DEruQAHdfnkg1pLi4EtnpPwnS2sQ03A8PEcu2FmX3lRvNctNxnJvdkYslp52I
         WtL9Ac9e4PC46vNQbWOTkZTrrMq6sWu85fhigyewQvl46qe8rjD7wYBFuK5wjXICk2nq
         Mw4DnTJT1anZ7aQMzgdl+yPGDKhb+op8PbrVCEmmvC0ZJWdAZA9QMZ36y4EDjm1JHM/m
         UB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hZzd9srfJg0sRysUCYuH0L2R2O31L83ni9EMVLSvk6o=;
        b=EJ2gCsCgBlvSlbmc6EfCakBSg9XxtXPikDtii81ZLXzhl5vquRwZALiya/WWuctDWp
         W+kw+2zB/+WMnLthlGS/6DL3JAWSYkGyMj35XhB86/DRvfKHQEE1T5xyj5o6Q2B/Z/NJ
         HKsg/lRuUzmkcdFWEv+eHgDW8V4xFEH6HLBmLQKEzHfuW3GdQdOlKEWHNjXzzE2duGkE
         Q3MX9dF0RzgeVcC+sgTyTInKMO/Uny2FVPmrhI4mncsbm05WDpmbMKZU77YN6T/Skw9u
         HBbgnek8q5DZzIuIpOtk/GFgI26CMefslp/xjsDQ70v7JrjSDv5wSHzCpixfxa8eb4k4
         VHjw==
X-Gm-Message-State: AOAM531xtvXVrJODRoLkjt0O3fQSpGQnkxB+O1/Znt88pkYAJhW7XYP6
	57whvQOmt8CyEhSIcZqDKKzhXe8VWFLa0rE9U6M=
X-Google-Smtp-Source: ABdhPJwIxdDHtNSAl0aUtbd6IW+MthJ3qEfuhE9cVqBxFzEgncOmC0MEsw2sNo4twwWvQ18b1lmDcuS5brOiTlyTRvI=
X-Received: by 2002:a05:6122:2009:: with SMTP id l9mr27528442vkd.4.1641796309392;
 Sun, 09 Jan 2022 22:31:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211107074200.18911-1-sergio.paracuellos@gmail.com>
 <CAMhs-H81xnaFqgTJT3jiNy_BBCuHhrA-t0A+0wMnp5Y0kFjGUQ@mail.gmail.com> <20220107021030.E932AC36AE3@smtp.kernel.org>
In-Reply-To: <20220107021030.E932AC36AE3@smtp.kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 10 Jan 2022 07:31:38 +0100
Message-ID: <CAMhs-H9SHk8aMm2RX0sA9zC3ktHQSmCtNbKe2ERg0Fg7-Tdk3Q@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] clk: ralink: make system controller a reset provider
To: Stephen Boyd <sboyd@kernel.org>
Cc: COMMON CLK FRAMEWORK <linux-clk@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	John Crispin <john@phrozen.org>, linux-staging@lists.linux.dev, 
	Greg KH <gregkh@linuxfoundation.org>, NeilBrown <neil@brown.name>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi Stephen,

On Fri, Jan 7, 2022 at 3:10 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Sergio Paracuellos (2021-12-13 04:00:17)
> > Hi Stephen,
> >
> > On Sun, Nov 7, 2021 at 8:42 AM Sergio Paracuellos
> > <sergio.paracuellos@gmail.com> wrote:
> > >
> > > Hi all,
> > >
> > > This patch series add minimal change to provide mt7621 resets properly
> > > defining them in the 'mediatek,mt7621-sysc' node which is the system
> > > controller of the SoC and is already providing clocks to the rest of
> > > the world.
> > >
> > > There is shared architecture code for all ralink platforms in 'reset.c'
> > > file located in 'arch/mips/ralink' but the correct thing to do to align
> > > hardware with software seems to define and add related reset code to the
> > > already mainlined clock driver.
> > >
> > > After this changes, we can get rid of the useless reset controller node
> > > in the device tree and use system controller node instead where the property
> > > '#reset-cells' has been added. Binding documentation for this nodeq has
> > > been updated with the new property accordly.
> > >
> > > This series also provide a bindings include header where all related
> > > reset bits for the MT7621 SoC are defined.
> > >
> > > Also, please take a look to this review [0] to understand better motivation
>
> Is [0] a link?

Yes, sorry it was not included:

[0]: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210926145931.14603-3-sergio.paracuellos@gmail.com/

>
> > > for this series.
> > >
> > > Regarding the way of merging this:
> > >  - I'd like patches 1 and 4 which are related going through staging tree.
> > >  - The other two (patches 2 and 3) can perfectly go through the clock tree.
> > >
> > > Thanks in advance for your feedback.
> > >
> > > Changes in v5:
> > >  - Move platform driver init process into 'arch_initcall' to be sure the
> > >    rest of the world can get the resets available when needed (since PCIe
> > >    controller driver has been moved from staging into 'drivers/pci/controller'
> > >    is probed earlier and reset was not available so it was returning
> > >    -EPROBE_DEFER on firt try. Moving into 'arch_initcall' avoids the 'a bit
> > >    anoying' PCI first failed log trace.
> >
> > Gentle ping on this series.
> >
>
> It looks to largely be a reset controller patch series. Can you get
> review from the reset maintainer?
>
> RESET CONTROLLER FRAMEWORK
> M:      Philipp Zabel <p.zabel@pengutronix.de>
> S:      Maintained

Ok, I'll rebase and resend the series including Philipp Zabel for
reviewing this.

Thanks,
    Sergio Paracuellos
