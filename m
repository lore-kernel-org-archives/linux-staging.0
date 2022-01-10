Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379BC168
	for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 10:59:35 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id c36so22507901uae.13
        for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 02:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Pyr2Zb4j02PsgvvNoNyOvWlod9U9+4JSnC74+5rak8Q=;
        b=YyQ506hwqXXe8clqnSFa983M9zu/XTmA4qYrFQNJpM+4qoeJFvFIvdzPLl4VJVyctv
         QqAXW2hrYyksTQGMFAXkpU91IH/VLZihHw79TpCMMAMgMJco1v9puEJXk7+lhemAKas1
         V+NeVQ0iZyy7rRoR/Zu8CKDxjLP64FPfc8jbDNYsSqLD9XsXEEPtkOjoSyuGM9fkiS6u
         Cy0LEZSSUmzaABRV0HfjrGMB30xYKwUSiksibyHJ29eQpavDM7+do/jySLVE5MIjOkDf
         FowiZnoXk6zgwYHZvit5AxB0G83ZXFa3rmK5VmxrpfBGz+QK5Ol9Q7XUHMcfIl4kHSgH
         jKIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pyr2Zb4j02PsgvvNoNyOvWlod9U9+4JSnC74+5rak8Q=;
        b=bxZOTAc/DgNIin1AGqxbA3QSe6tqIaoyiwhyznF+nSro6x0Vp0b2DVCBEeKVlmJwuE
         1nDehZ/TEOAh+d785Ll/9z1X/ew2T4+U4tR1sdcwwVFl34kQs3/KvlZ+HHxbodggHjiD
         O5LxQz55pD4X22UxJSBB2NYixSIPfCJ5OB9P+aDsJDCRIcFntpWuxQxY6ifAnsLzypw9
         scIRgssI4RWqvimnngx8J0QUx2WunimPvoSju2ZAxxUwZr+s7+0VlNEDUCPPRPZjhso3
         OjYvxUpZmUfj7tCF/Pcx8BQGryc8fzGj4wyMYrwELdCkAwJvnLa832r/jM8XZBxvQNeP
         8XNA==
X-Gm-Message-State: AOAM532JvBty4MHbeSM9BdCRjFj1cF1OvdXLLY6SI9tedSaTZBVHnCdj
	SlHcjYOeGyrIHoXsQN6GR3EVQBR5pq+Mg7wnNTE=
X-Google-Smtp-Source: ABdhPJzNC5Xto+6tTHLSaWjQV0UE4a2ufJIsEM38VWdwK4FT0ZrmU5mE9sbtMvpdllGygej3DVycShZmNO0+zFIeetc=
X-Received: by 2002:a05:6102:dc9:: with SMTP id e9mr24288454vst.17.1641812374133;
 Mon, 10 Jan 2022 02:59:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220110083910.1351020-1-sergio.paracuellos@gmail.com>
 <20220110083910.1351020-4-sergio.paracuellos@gmail.com> <5368e89c391e1329ed2be6496655f1bb50acfd19.camel@pengutronix.de>
 <CAMhs-H_gjW_6p6yBWf+k2PBym4N+k+rBEXR9S8c13NU-UWD4VQ@mail.gmail.com> <12b7e367e8323f6da7bb548dbbae0d342608e52b.camel@pengutronix.de>
In-Reply-To: <12b7e367e8323f6da7bb548dbbae0d342608e52b.camel@pengutronix.de>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 10 Jan 2022 11:59:22 +0100
Message-ID: <CAMhs-H_cCFsMs5VTrrNROBpfnwsXNLGGCFHSu2sJ8N-cxYV8aA@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] clk: ralink: make system controller node a reset provider
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, John Crispin <john@phrozen.org>, 
	linux-staging@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>, 
	NeilBrown <neil@brown.name>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 10, 2022 at 11:23 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> On Mon, 2022-01-10 at 10:39 +0100, Sergio Paracuellos wrote:
> [...]
> > > Is this known to work for all possible users, without delay between
> > > assert and deassert?
> >
> > It seems it is. This is based on the original reset implementation for
> > ralink. See:
> >
> > https://elixir.bootlin.com/linux/v5.16/source/arch/mips/ralink/reset.c#L55
> >
> > > Are there any users of the reset_control_reset() API at all? This API
> > > was added for self-clearing reset bits, so if there are no users that
> > > need to pretend this is a reset pulse at the hardware level (there may
> > > be), I'd prefer if this was just left out.
> >
> > I am not following you here. What do you mean?
>
> Looking at drivers/staging/mt7621-dts/mt7621.dtsi, it appears the
> current reset users are:
>   mediatek,mt7621-i2c
>   ralink,mt7621-spi
>   ralink,rt3883-gdma
>   mediatek,mt7621-hsdma
>   mediatek,mt7621-eth
>   mediatek,mt7621
>   mediatek,mt7621-pci
>
> Many of the corresponding drivers use device_reset(), which is a
> shorthand for requesting a reset control and calling
> reset_control_reset() on it. That will call mt7621_reset_device, so it
> is indeed used.
>

Ok, pretty clear now, thanks for clarification :).

> regards
> Philipp

Best regards,
    Sergio Paracuellos
