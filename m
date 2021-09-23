Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C183072
	for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 13:26:51 +0000 (UTC)
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mwfj0-1mnhoZ2Y1a-00y8Qy for <linux-staging@lists.linux.dev>; Thu, 23 Sep
 2021 15:26:49 +0200
Received: by mail-wr1-f47.google.com with SMTP id w29so17140879wra.8
        for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 06:26:49 -0700 (PDT)
X-Gm-Message-State: AOAM5300KGOQzKun4Db9arTgdOGlycxIjUb9eXzh1AFmiPg7ObwSTwAt
	I2EHOQdWmSSD/vzGpxvXaLHhHFU9ClNo+qmYMXM=
X-Google-Smtp-Source: ABdhPJw4UBkTVB6mvmMc1RQ4ZclrJtxhHJpuF6D7fFM8+8KgqGaZ+oJj0Hxv0wUOvOTVJOoZ48OfTnkS7cg4jdQ6xS0=
X-Received: by 2002:a05:600c:896:: with SMTP id l22mr15859999wmp.173.1632403609085;
 Thu, 23 Sep 2021 06:26:49 -0700 (PDT)
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
 <CAK8P3a2WmNsV9fhSEjqwHZAGkwGc9HOurhQsza7JOM2Scts2XQ@mail.gmail.com> <CAMhs-H8fRnLavLfdw7jZO0tb8rWqdF81cGHhYT6gGp4UY1gChg@mail.gmail.com>
In-Reply-To: <CAMhs-H8fRnLavLfdw7jZO0tb8rWqdF81cGHhYT6gGp4UY1gChg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 23 Sep 2021 15:26:32 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2MJO--xmAZ_71h1QQ5_b8WXgyo-=LaT7r7yMMBUHoPfQ@mail.gmail.com>
Message-ID: <CAK8P3a2MJO--xmAZ_71h1QQ5_b8WXgyo-=LaT7r7yMMBUHoPfQ@mail.gmail.com>
Subject: Re: [PATCH v3] PCI: of: Avoid pci_remap_iospace() when PCI_IOBASE not defined
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-pci <linux-pci@vger.kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev, 
	gregkh <gregkh@linuxfoundation.org>, Liviu Dudau <Liviu.Dudau@arm.com>, 
	Rob Herring <robh@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:h3rVHeyq4tfFp/WPALizbok6CT2NWArMRLS5c/ic/ADjGunuR16
 xJon5ez1Z9oUyUwjTjrsW9zIXvzn0C7pYP3rBzv274+FTIiVo239OzGrbeYhCyV6pk0FF2J
 BTmY9A2vk8UvmzVERJ1OApWEBvO7Gg0ypbZ07hVfOPqYrho4GRHwMC2Wn2ieYwgfFjLd6jD
 EEtF1cgBiSrprF4rX5joQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lQowsdIXDhM=:WnuF+5VuNSv4sV7RP5e5JV
 DTh72OPW6SyF7cDk8TYAlP00XyLmCy2ufqllkPDSHMmj9A7Dro6sv4WSg91MRHaJ0MDG5UlK/
 zS9lRnE5ngNMLs1DsY7T78FWriLjkeBikb0/0RYir6N1uH09p3qURAraR2JvC0uCTVaMQYsrK
 GWG4+AZmtmstkW/Ibq4awaI6pl4BKZBq8l6g8TiaGuh6Atxe4mgeWzlXMmNw6X27oXK4W4VCF
 LS8eUYdNfPFDfOnWGVwcju+jlS01wm1YYgcsxujdBcqlERn/lU+KBTpDB0N126/omvfBdsIdJ
 Lwaih3KxsYCeTOj/i0sT3tzYvgJmYZnkTJ62kf+pYQ7R+7HiJ9OZcVJg8M+62v7BGySbEYM6r
 IvqMeE/8LXU3UNu74KuZYJ+whsk1wuhrmYjYCetyJ+gjEJjocfQvSizHMM0i2LOHkfkF5qDJK
 k83t6CoDndsdq1M9znbAPk0tEZDY+8kNC/lBR+VgoQ4VUZxqvWvaq0HWZZzKW8ChQX7ejmpyc
 9KRtrkj6x1ELeUU8boakinK5Tn+eZYJJ42/X4MXqOPK4FvEPMjK7KaXMNsTrGnkBI9oAhoR9h
 8Yen8+rcidxYcN/sbdvvuhaovsbJEuowJJszQ96bMyTVFQav/VHVI4OyAWdUXDUSbznktoqJU
 dFDAhow4QNaiAnBT3PWa7wd5vAGYAUTb6KGwEvLgwsd/NZMJsPV33FEsUgD/WZLUNpq+dQUlP
 QTCLo52xZQVc7DgZe6vZqGeHBROZNS1fP7Fqug==

 ==On Thu, Sep 23, 2021 at 1:09 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
> On Thu, Sep 23, 2021 at 11:07 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > ()On Thu, Sep 23, 2021 at 8:36 AM Sergio Paracuellos
> > <sergio.paracuellos@gmail.com> wrote:
> > > On Thu, Sep 23, 2021 at 7:51 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > > I am not really understanding this yet (I think I need a bit of sleep
> > > > > time :)), but I will test this tomorrow and come back to you again
> > > > > with results.
> > > >
> > > > Both would let devices access the registers, but they are different
> > > > regarding the bus translations you have to program into the
> > > > host bridge, and how to access the hardcoded port numbers.
> > >
> > > I have tested this and I get initial invalidid BAR value errors on pci
> > > bus I/O enumeration an also bad addresses in /proc/ioports in the same
> > > way I got defining PCI_IOBASE as _AC(0xa0000000, UL):
> > >
> > > root@gnubee:~# cat /proc/ioports
> > > 00000000-0000ffff : pcie@1e140000
> > >   00000000-00000fff : PCI Bus 0000:01
> > >     00000000-0000000f : 0000:01:00.0
> > >       00000000-0000000f : ahci
> > >     00000010-00000017 : 0000:01:00.0
> > >       00000010-00000017 : ahci
> > >     00000018-0000001f : 0000:01:00.0
> > >       00000018-0000001f : ahci
> >
> > Ok, These look good to me now.
>
> This is the behaviour we already had with spaces.h [0] without any
> other change. See also comments of Thomas [1] about this being wrong
> which at the end are the motivation for this patch series.
>
> > > mt7621-pci 1e140000.pcie:       IO 0x001e160000..0x001e16ffff -> 0x001e160000
> > > LOGIC PIO: PIO TO CPUADDR: ADDR: 0x1e160000 -  addr HW_START:
> > > 0x1e160000 + RANGE IO: 0x00000000
>
> Why is my RANGE IO start transformed here to 0x0? Should not be the
> one defined in dts 0x001e160000?

Can you show the exact property in your device tree? It sounds like the
problem is an incorrect entry in the ranges, unless the chip is hardwired
to the bus address in an unusual way.

> > I think you have to have another #ifdef around the declaration in
> > this case, or alternatively move the mips definition back to a .c
> > file and leave only the #define
>
> Ok, so the following changes:
>
> diff --git a/arch/mips/pci/pci-generic.c b/arch/mips/pci/pci-generic.c
> index 95b00017886c..ee0e0951b800 100644
> --- a/arch/mips/pci/pci-generic.c
> +++ b/arch/mips/pci/pci-generic.c
> @@ -46,3 +46,9 @@ void pcibios_fixup_bus(struct pci_bus *bus)
>  {
>         pci_read_bridge_bases(bus);
>  }
> +
> +int pci_remap_iospace(const struct resource *res, phys_addr_t phys_addr)
> +{
> +       mips_io_port_base = phys_addr;
> +       return 0;
> +}
...
> These changes got me to the same behaviour that this patch pretends
> without the ifdef on this patch. But, this behaviour is wrong
> according to your explanations since I got
>
> OF: IO START returned by pci_address_to_pio: 0x1e160000-0x1e16ffff
>
> and ioports using this range address and not lower 0x0-0xffff.
>
> So all of these changes seem to be invalid: this patch and the already
> added to staging-tree two ones: [2] and [3], right?

Right, there is probably yet another problem. Patch [2] should
be harmless here, but patch [3] is wrong as you should not override
the length of the I/O port window that is in the DT.

> Currently, no. But if they were ideally moved to work in the same way
> mt7621 would be the same case. Mt7621 is device tree based PCI host
> bridge driver that uses pci core apis but is still mips since it has
> to properly set IO coherency units which is a mips thing...

I don't know what those IO coherency units are, but I would think that
if you have to do some extra things on MIPS but not ARM, then those
should be done from the common PCI host bridge code and stubbed out
on architectures that don't need them.

> > I realize this is very confusing, but there are indeed at least three
> > address spaces that you must not confuse here:
> >
> > a) I/O port numbers as programmed into BAR registers and
> >     used in PCIe transactions, normally 0 through 0xffff on each
> >     bus.
> > b) Linux I/O port numbers as seen from user space, in the range
> >      from 0 to IO_SPACE_LIMIT, these correspond to the
> >      bus addresses from a) if io_offset is zero, but could be
> >      different with a non-zero value passed into
> >      pci_add_resource_offset() when the region is probed.
> >      The offset may be different on each pci host bridge.
>
> This "offset" is the pci address configured in device tree range,
> right? This seems the part is not doing properly in my case since all
> of these changes are needed to at the end got BAR's as
>
> pci 0000:02:00.0: BAR 4: assigned [io  0x1e161000-0x1e16100f]
> pci 0000:02:00.0: BAR 0: assigned [io  0x1e161010-0x1e161017]
> pci 0000:02:00.0: BAR 2: assigned [io  0x1e161018-0x1e16101f]
> pci 0000:02:00.0: BAR 1: assigned [io  0x1e161020-0x1e161023]
> pci 0000:02:00.0: BAR 3: assigned [io  0x1e161024-0x1e161027]
>
> which I understand is correct.

The "offset" is between two numbers that can normally both be
picked freely, so it could literally be anything, but in the most common
and ideal case, it is zero:

The Linux port number gets assigned when probing the host bridge,
this is purely a software construct and the first bridge should normally
get range 0-0xffff, the second bridge gets range 0x10000-0x1ffff
etc. The code assigning these numbers is rather confusing, and I
can't even find where it is now...

The port number on the bus is platform specific. In some cases
you can set it through a register in the pci host bridge, in other
cases it is fixed to starting at zero. If the address is programmable,
it can be either set by the firmware or bootloader and passed down
to the kernel through the DT ranges property, or the ranges can
contain a suggested value that then has to be programmed by
the host bridge driver.

If the value is not zero, you should try setting it to zero to get
an identity mapping against the Linux port numbers, to minimize
the confusion.

It is possible that the hardware (or bootloader) designers
misunderstood what the window is about, and hardcoded it so
that the port number on the bus is the same as the physical
address as seen from the CPU. If this is the case and you
can't change it to a sane value, you have to put the 1:1
translation into the DT and would actually get the strange
port numbers 0x1e161000-0x1e16100f from that nonzero offset.

This means you can only use PCI devices that can be
programmed with high port numbers, but not devices with
hardcoded legacy ports.

> > c) MMIO address used to access ports, offset by PCI_IOBASE
> >     from the Linux port numbers in b).
> >     No other registers should be visible between PCI_IOBASE
> >     and PCI_IOBASE+IO_SPACE_LIMIT
>
> mips_io_port_base + offset, right? KSEG1 addresses for mips by default.

no, not the offset. As long as mips_io_port_base==PCI_IOBASE,
the accessible ports will be between mips_io_port_base and
mips_io_port_base+0xffff.

         Arnd
