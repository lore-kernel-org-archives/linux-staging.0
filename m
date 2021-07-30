Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E61D70
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 09:41:42 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id v3so3747851uau.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 02:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k1LiHMccWU3CFS90ABp7VFo/U1i2mCLKiQBjAQcFNBI=;
        b=UuEe8gH/CL6m7fO5L+wZVLZquku8/H5SScQlIq2SuNi2SuqtcBh81cdmOet2CbboSh
         2t61QX1GWfoAbFAxmpqf+HPY+yWh2MqNX0kWt9px7hjsQz7YQhQBVDnH0fpIZyB4eF0B
         Vr5nFybp4J/ndAUw38lyXhpVZcTrjsEwvQM3A/tLu0od0pF0LmmjpA9J6QPr/lO0c2tf
         hFwJvh5lCdEO2bXrBX1SW1fh8p/J7mTUHfRi0e3TtJ6ytbVp9Pi/mmdCLDlWdVCW81RI
         amkeSf7f2YsQDTFU0H9JUzLAh/1kob8BXkbbAWTz1NyjJLoGB6LrGKNmAM54zvRoGAHb
         /vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k1LiHMccWU3CFS90ABp7VFo/U1i2mCLKiQBjAQcFNBI=;
        b=pQsOlHN5wOypKk/596EOrveiX0FKymXezI3tw/fnHb+rP6hAuXAuBMJmtnDp62mtiu
         zGj/z0sGIXAG7tLJf6urQCoDluClofT9ceWl4XnfCaSl1aR/EcarT/JdHBakrx41XZCL
         T0YgPRLijps0z+sURcyq5/imDSQx7zXPswXauSrBld0oaBb3orX2I0pA7pwn2vPBFBC5
         1/n0aEr6pIQf6XB4HElfiPf2YE8XNNVkCFssMW1LgZppTY6hYeXM+9bkwsuj9waZ8hUn
         2SUli8twNsFuGcf4K82P5eXYLHqOf59/Ty5I9MaflEWH32KQ8LUDargObqI0azD94mD8
         J4ig==
X-Gm-Message-State: AOAM531tGCORMmizHg6pufcDMdMgzb41yK7jlLnALimTplOhv/z3Lt5B
	aw7V0iRtknwu/csjCe7EXWEoWXjJV3LIM+geKZM=
X-Google-Smtp-Source: ABdhPJxK/OssVuNJ1ZfYu6/HZ7EDppG4U3Swi6HDXRLuq/EoQ28MVf59oAs9LmWei2OMswJjEyI4NsViICqYOzVzMzs=
X-Received: by 2002:ab0:2b17:: with SMTP id e23mr840916uar.98.1627638101356;
 Fri, 30 Jul 2021 02:41:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210614100617.28753-1-sergio.paracuellos@gmail.com>
 <20210614100617.28753-2-sergio.paracuellos@gmail.com> <20210729100146.GA8648@alpha.franken.de>
 <CAMhs-H-9=H2cTMtQxE_DUMraJ1KVNjOX2J-nO_RSdsyUUkSAMA@mail.gmail.com> <20210730083007.GA5072@alpha.franken.de>
In-Reply-To: <20210730083007.GA5072@alpha.franken.de>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 30 Jul 2021 11:41:29 +0200
Message-ID: <CAMhs-H9cULy1A0mHv3LrkshKdppQzkDuLJf81usqxbDtFn_U9A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] MIPS: ralink: Define PCI_IOBASE
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-staging@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>, 
	NeilBrown <neil@brown.name>, "open list:MIPS" <linux-mips@vger.kernel.org>, 
	Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, John Crispin <john@phrozen.org>, 
	Bjorn Helgaas <helgaas@kernel.org>, lorenzo.pieralisi@arm.com
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

Thanks for the explanation.

On Fri, Jul 30, 2021 at 10:30 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Thu, Jul 29, 2021 at 01:21:45PM +0200, Sergio Paracuellos wrote:
> > Hi Thomas,
> >
> > On Thu, Jul 29, 2021 at 12:02 PM Thomas Bogendoerfer
> > <tsbogend@alpha.franken.de> wrote:
> > >
> > > On Mon, Jun 14, 2021 at 12:06:15PM +0200, Sergio Paracuellos wrote:
> > > > PCI_IOBASE is used to create VM maps for PCI I/O ports, it is
> > > > required by generic PCI drivers to make memory mapped I/O range
> > > > work. Hence define it for ralink architectures to be able to
> > > > avoid parsing manually IO ranges in PCI generic driver code.
> > > > Function 'plat_mem_setup' for ralink is using 'set_io_port_base'
> > > > call using '0xa0000000' as address, so use the same address in
> > > > the definition to align things.
> > > >
> > > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > > ---
> > > >  arch/mips/include/asm/mach-ralink/spaces.h | 10 ++++++++++
> > > >  1 file changed, 10 insertions(+)
> > > >  create mode 100644 arch/mips/include/asm/mach-ralink/spaces.h
> > > >
> > > > diff --git a/arch/mips/include/asm/mach-ralink/spaces.h b/arch/mips/include/asm/mach-ralink/spaces.h
> > > > new file mode 100644
> > > > index 000000000000..87d085c9ad61
> > > > --- /dev/null
> > > > +++ b/arch/mips/include/asm/mach-ralink/spaces.h
> > > > @@ -0,0 +1,10 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > +#ifndef __ASM_MACH_RALINK_SPACES_H_
> > > > +#define __ASM_MACH_RALINK_SPACES_H_
> > > > +
> > > > +#define PCI_IOBASE   _AC(0xa0000000, UL)
> > > > +#define PCI_IOSIZE   SZ_16M
> > > > +#define IO_SPACE_LIMIT       (PCI_IOSIZE - 1)
> > > > +
> > > > +#include <asm/mach-generic/spaces.h>
> > > > +#endif
> > >
> > > does this really work for you ? I tried the same trick for RB532
> > > and the generated IO addresses are wrong...
> >
> > I got pci io resources assigned without complaints from the pci core
> > code. I don't have real pci card that uses I/O bars but this is what I
> > see in the boot (I added some traces when I was testing this):
>
> resource handling works, but the addresses generated for IO access
> are wrong, because the iomap tries to ioremap it to a fixed
> virtual address (PCI_IOBASE), which can't work for KSEG1 addresses.

What I don't understand is why the kernel is not complaining about
remapping this if "devm_pci_remap_iospace" can't work. I cannot see
any complaints in my dmesg log.

>
> > Is this wrong?
>
> to get it working this way, we would need to put PCI_IOBASE somewhere
> into KSEG2, which I don't like since it will create TLB entries for IO
> addresses, which most of the time isn't needed on MIPS because of
> access via KSEG1.

If I am understanding you correctly, you mean to change PCI_IOBASE
location to be somewhere in KSEG2 and set up the new io base address
through "set_io_port_base", right?
TLB entries should be out of this. Yes, I don't like this either.

> I'd much prefer to make the devm_pci_remap_iospace() in drivers/pci/of.c
> optional. Something like this
>
> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> index a143b02b2dcd..657aef39bf63 100644
> --- a/drivers/pci/of.c
> +++ b/drivers/pci/of.c
> @@ -564,12 +564,14 @@ static int pci_parse_request_of_pci_ranges(struct device *dev,
>
>                 switch (resource_type(res)) {
>                 case IORESOURCE_IO:
> +#ifdef PCI_IOBASE
>                         err = devm_pci_remap_iospace(dev, res, iobase);
>                         if (err) {
>                                 dev_warn(dev, "error %d: failed to map resource %pR\n",
>                                          err, res);
>                                 resource_list_destroy_entry(win);
>                         }
> +#endif
>                         break;
>                 case IORESOURCE_MEM:
>                         res_valid |= !(res->flags & IORESOURCE_PREFETCH);
>

I don't know which architectures are not currently defining PCI_IOBASE
and might need this to be called (or if this is also not possible at
all scenario), honestly.

>
> This together with an increased IO space via
>
> #define IO_SPACE_LIMIT 0x1fffffff

I guess we can also redefine the weak "pci_address_to_pio" symbol for
mips to avoid this change, but only to do a "return (unsigned long)
address;" it might make no sense also :).

>
> gives me a working PCI bus on the RB532.
>
> No idea, if the patch would be accepted by the PCI maintainers.
>

Let's ask about this, just to be sure...

+cc Bjorn Helgaas and Lorenzo Pieralisi.

Bjorn, Lorenzo. Sorry to bother you. What do you think about this?
What should be the correct approach to handle this? Does the
"pci_parse_request_of_pci_ranges" change sound reasonable for you?

Thanks in advance for your time and clarification.

Best regards,
    Sergio Paracuellos

> Thomas.

>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
