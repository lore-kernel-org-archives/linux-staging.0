Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6203FC7
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 11:39:48 +0000 (UTC)
Received: from mail-wr1-f53.google.com ([209.85.221.53]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MuUza-1mlohd0ffm-00rbAR for <linux-staging@lists.linux.dev>; Fri, 24 Sep
 2021 13:39:47 +0200
Received: by mail-wr1-f53.google.com with SMTP id d6so26423089wrc.11
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 04:39:47 -0700 (PDT)
X-Gm-Message-State: AOAM531riHCVY4RfpcREuLOq3VsBXUxBiy+v4RqJx/hfxOubagTU+3FG
	/uvLbZFn+0RdxgK4fLLaj6Nghs7Kwf+8E+pbaUI=
X-Google-Smtp-Source: ABdhPJwvl91z0laNP1RhQFAizEUbWv4Kx2bjk2VWq4/WwaJVX/7uo96ECwgUa7bCRn0mlds8qzUkemNAuylKq0jULN0=
X-Received: by 2002:a05:600c:3209:: with SMTP id r9mr1585236wmp.35.1632483586533;
 Fri, 24 Sep 2021 04:39:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210922042041.16326-1-sergio.paracuellos@gmail.com>
 <CAK8P3a2WPOYS7ra_epyZ_bBBpPK8+AgEynK0pKOUZ6ajubcHew@mail.gmail.com>
 <CAMhs-H8EyBmahhLsx+a0aoy+znY=PCm4BT97UBg4xcAy3x2oXg@mail.gmail.com>
 <CAK8P3a0fQZvpNCKF7OUy_krC_YPyigtd5Ak_AMXXpx84HKMswA@mail.gmail.com>
 <CAMhs-H-OCm1p6mTTV6s=vPx7FV8+1UMzx0X00wvXkW=5OgFQBQ@mail.gmail.com>
 <CAK8P3a1iN76A5ahTTQ6rCS4LjKHz8grkNGHGehLJnd0xQSnHXA@mail.gmail.com>
 <CAMhs-H_hZk3hruCaWRjKjUSj6vhVE+JZfk9nT7v1=mcc-H9wnw@mail.gmail.com>
 <CAK8P3a3C0rG_JWWCU6T4B=+j2-+6S6Gq+aw_9e6XeVun9LoF0w@mail.gmail.com>
 <CAMhs-H8kH7CMXENqDW_6GLTjeMMyk+ynehMmyBr=kFZPFHpM0A@mail.gmail.com>
 <CAK8P3a2WmNsV9fhSEjqwHZAGkwGc9HOurhQsza7JOM2Scts2XQ@mail.gmail.com>
 <CAMhs-H8fRnLavLfdw7jZO0tb8rWqdF81cGHhYT6gGp4UY1gChg@mail.gmail.com>
 <CAK8P3a2MJO--xmAZ_71h1QQ5_b8WXgyo-=LaT7r7yMMBUHoPfQ@mail.gmail.com>
 <CAMhs-H_xdkpinyj-Y1u==ievpGWZ2Ze-_U7aCUcfu0=NKBq2xQ@mail.gmail.com>
 <CAK8P3a0OWyW9Wk0kHXsj_7qTd0fVXQnszzun+HacHeTKYETXhw@mail.gmail.com>
 <CAMhs-H9xrXgbuwYe2STzuq0aBwj0onJGc0Oka6+pzgoHb0j8rA@mail.gmail.com>
 <CAK8P3a1AwaSi_J9p4tKwNKxENHhwofDu=Ma=F29ajSmMXoC7RA@mail.gmail.com> <CAMhs-H_wxoJC7ZVnkhXNfAcP-P9BNN99ogszM_iJhErHLq8Rdg@mail.gmail.com>
In-Reply-To: <CAMhs-H_wxoJC7ZVnkhXNfAcP-P9BNN99ogszM_iJhErHLq8Rdg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 24 Sep 2021 13:39:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3dvhWT=Xq22xTNn_VbX29s3t9wrw1DbffPbWuHxtTTmg@mail.gmail.com>
Message-ID: <CAK8P3a3dvhWT=Xq22xTNn_VbX29s3t9wrw1DbffPbWuHxtTTmg@mail.gmail.com>
Subject: Re: [PATCH v3] PCI: of: Avoid pci_remap_iospace() when PCI_IOBASE not defined
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-pci <linux-pci@vger.kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev, 
	gregkh <gregkh@linuxfoundation.org>, Liviu Dudau <Liviu.Dudau@arm.com>, 
	Rob Herring <robh@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ztBvV1A5U2d4+cso6Fc2uB9cBzIcjmqj3P27A1Jw/xqgRmYTlhf
 KWfohAR6AszikOzig4nqSRCr/81l3GGgdN9QGjTxmxhy+RCw2Z4UycUATlFgz2cySb6cRpF
 IpkXuaFR9vLOc9Ifg2ngGhFZje4gIF50T5m+Y/FIZdDi+8zNfMkBGAxieGCtQbKMGLyfMaq
 ZP1Zt0r8aFvQkvXFrmzLw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iuz70UPtTbU=:NrI5Lb8iRnsVQt6RglyzPa
 FECTQWwtdy3yGCWyLFJZ6XyTYcDBxpegdCxHNs1Wp6PLNX+SIpCgCNxbbTP9JRn5Dkk5UQF0t
 ZV97JCxqE3xyHqq17GRYZlI5cfxj8cbC8dMHSAxzd6dA1KiqJ8P1CNywlMLMKnU/t2y1G6WiO
 I9BupeWomahkJx2kJqdwEQXY+VY4fi5yvqRf7/q3J4yaE24uNL3W6L/n2LsVYWlDOl/siDYA9
 noZlKfN0GLdBvrgtLghHJ0nWs+LTHvQTzalUn3cRG2iXze10foetz7qdi9jcH4EsADN8/2SuO
 pH1XHZeXbSMbQ3fB7GRD5a5Q7fCteO68Gh0L6yPwNZwBmx7ceYAWqFJ8sv43pSUdHu75ZxttI
 bpE7QhnTyCIOuwH2K81T2ZzQhDt7JatB0dBoxGTVPxBi12SWVg/FNVRfeMC5VDL75ZIO/MmqF
 k4R/unhLqvDv7S3Q3WNz2AgNl225OfU1IL+lqPfEACDfjkM0vdoN0a8iX7D74JQTMQxXPG2nH
 XUq5+YwtBqnsWZ8YIVabEdCoqsfUXJNM5DHRnM45pd/i6pjgc/AX2BvKO5XXtqHLPXc+v5mww
 9692HszzY5Fxc/m63eRNZlIKFpXoBliK49naFSu421+XVhc9BteKe2k6vhOkWw23qODTn3X4U
 YxepNUutcrKW1Oou5te3PUlznXEG/FVTA9mV/PxS3n9cPJoxtFnSWh/kRbnb/6xiNO6wqpEvP
 TbvHOYBm3IkkEnAmSIq1IQqxnAAoag44KEifGZsIpKPF89lPI+Nl6GmN+KhPwUxTi+0BfQK4J
 qqYYRipYwJt7NGtQ9KHUt9Ywmo2hMfkYybQsURRi7nYeDtu904AvDRfA01Ppglh2lGZieGZih
 tkX8pn+ykcB2Hnkrr2ww==

On Fri, Sep 24, 2021 at 12:15 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
> On Fri, Sep 24, 2021 at 10:53 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Thu, Sep 23, 2021 at 10:33 PM Sergio Paracuellos
> >
> > Oops, my mistake, I mixed up the CPU address and the PCI address.
> >
> > The correct notation should be
> >
> > <0x01000000 0 0  0 0x1e160000 0x00010000>;
> >
> > i.e. bus address 0 to cpu address 0x1e160000, rather than the other
> > way around as I wrote it.
>
> Mmmm... Do you mean <0x01000000 0 0  0x1e160000 0 0x00010000>; instead?

Yes, sorry for getting it wrong again.

> In any case both of them ends up in a similar trace (the one listed
> here is using your last range as it is):
>
> mt7621-pci 1e140000.pcie: host bridge /pcie@1e140000 ranges:
> mt7621-pci 1e140000.pcie:   No bus range found for /pcie@1e140000,
> using [bus 00-ff]
> mt7621-pci 1e140000.pcie:      MEM 0x0060000000..0x006fffffff -> 0x0060000000
> mt7621-pci 1e140000.pcie:       IO 0x0000000000..0x1e1600000000ffff ->
> 0x0000000000
>                                                    ^^^^
>                                                     This is the part
> that change between both traces (t7621-pci 1e140000.pcie:       IO
>
> 0x001e160000..0x001e16ffff -> 0x0000000000 in the one I have just put
> above)

Yes, the latter is the expected output.

> mt7621-pci 1e140000.pcie: Writing 0x0 in RALINK_PCI_IOBASE
>                                                   ^^^
>                                                      This is the
> current value written in bridge register as IOBASE for the window
> which is IORESOURCE_IO -> res.start address (in both traces).

The value is correct, but strictly speaking this must be the
raw value from DT, not the translated Linux port number.

As long as io_offset is zero, the two are the same, but if you were
to use multiple host bridge in the system, or pick a different bus
address in DT, you can have a nonzero io_offset. I think this means

   pcie_write(pcie, entry->res->start, RALINK_PCI_IOBASE);

should become

   pcie_write(pcie, entry->res->start + entry->offset, RALINK_PCI_IOBASE);

Try setting some other value as the bus address in DT and see if that
is what gets written to the register.
(I may have the polarity of offset wrong, so this may need to be '-' instead
of '+').

> Also, I noticed that all of these messages have disappeared from the trace:
>
> pci 0000:03:00.0: reg 0x20: initial BAR value 0x00000000 invalid
>
> and now the first tested value seems to be valid....

This just means that the power-on default value of '0' is now within
the configured range of 0...fffff. It's still slightly odd that it warns about
those in the first place if it is going to reassign everything, but that
should be harmless either way.

> > If my assumption is correct here, then you must write the value
> > that you have read from the DT property, which would be
> > 0x001e160000 or 0 in the two versions of the DT property we
> > have listed, but in theory any (properly aligned) number ought
> > to work here, as long as the BAR values, the RALINK_PCI_IOBASE
> > and the io_offset all agree what it is.
>
> RALINK_PCI_IOBASE in that line, is the bridge register you write with
> value from the IO resource created from DT property, yes. So I guess
> you meant PCI_IOBASE for ralink in this sentence, right?
>
> (Prototype of the function -> static inline void pcie_write(struct
> mt7621_pcie *pcie, u32 val, u32 reg))

I meant RALINK_PCI_IOBASE. We do need to write both, to clarify:

RALINK_PCI_IOBASE must be set to match the *bus* address in DT,
so ideally '0', but any value should work as long as these two match.

PCI_IOBASE/mips_io_port_base must be set to the *CPU* address
in DT, so that must be 0x1e160000, possibly converted from
physical to a virtual __iomem address (this is where my MIPS
knowledge ends).

> > pcie_write(pcie, 0xffffffff, RALINK_PCI_MEMBASE)
> >
> > Can you clarify what this does? I would have expected an
> > identity-map for the memory space, which would mean writing
> > the third cell from the ranges property (0x60000000)
> > into this. Is -1 a special value for identity mapping, or does
> > this register do something else?
>
> That was also my understanding at first when I took this code and
> started playing with it since the register is the base address for the
> memory space window. Setting the value you pointed out worked for me
> (and makes sense), but some people seem to have problems with some
> cards when accessing PCI memory resources. That's the only reason I
> have maintained the original value but I don't really understand what
> it means. The same value is used in mt7620 which has a pretty similar
> topology but with one only virtual bridge behind the host-bridge [0].
> However there is no documentation for mt7621 PCI subsystem and the one
> that exists for mt7620 PCI does not clarify much more [1].

Ok, fair enough.

          Arnd
