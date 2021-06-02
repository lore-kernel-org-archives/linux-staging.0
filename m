Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F9070
	for <linux-staging@lists.linux.dev>; Wed,  2 Jun 2021 12:16:38 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id e27-20020a056820061bb029020da48eed5cso493258oow.10
        for <linux-staging@lists.linux.dev>; Wed, 02 Jun 2021 05:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9cyiA6wKj6aYc3HuGyRHU8Zz2WjjnKWj3tYvNZGV3VE=;
        b=ePV4XQUAxLeH7pjN+qIAE7LMDSzgL9xInfD4aD18C1jpHlFc0zL8ZFTdZWkkXF4bb4
         0x28JANxGg5QHhzsOw2JOSB9z+1RFxpSUVYgazqBQJBC86oz2QiiOCK7l24aG95y8bWK
         +Kaghnq/hWFNVmPjppffyBrM+cFkz+YDbRVO78kbNnmTcAvCPpc+3sgr84TYhoJH1pBd
         QKilN7lIwDJHdIKgivwL4ThGCzTDd0OGwiYIWLAV8LCHnzgp/lZIhV9A+CpYpf84iokD
         SNCuzCFLQypszmMQOY5xKgzVlD1bvTB381fiASOLfb+uadfVWVxvf1jUq9lIpVKz6Jxa
         F5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9cyiA6wKj6aYc3HuGyRHU8Zz2WjjnKWj3tYvNZGV3VE=;
        b=G072o2E3pTDn6R195Thh7xL4a44w73NULvVZXNG/mniY7HfawbHe638YSJhKntsCJ8
         7S0ji3yo+vtwaWD39JHrzOQ2fphtjXZiTA8MhtupluQZzkqcIwZv4XB/gzozZ/u/AJZm
         T/aMO5PNFcbCyRs+yUEYuYm8xzC01DOEmwLdMlT6ohBEIducJMV7WnmVBhrSZJscBk1H
         u0sOaQ+t6FgDc6QuRli7zvOK0NY7h1+X2Z/9uas6LQ+HlwrXw8x3nAIJAdHUFDTqLoz4
         Jfcmg98wqZFoIBW1szdoZfSInVtobs06SWyMS5/ghQnULkXDEnc74vjIBcFtLQVNH5Yo
         OGoQ==
X-Gm-Message-State: AOAM533IPGyQSCB23Z6inqQmV1Qo+XiHYRPDg7EdaA8327cAZiBcdYKM
	YSTNitninQ8Oo6W0vRNvZUU0vkYRw5j8bFrCyYo=
X-Google-Smtp-Source: ABdhPJwp9HmT51Y/FoZx4UCv7YAz4y8OSSWO0aA59p1yqoD6CosC0wGNI5oxSR44LWQv6OrMas5DMQlXX5Qwh6+3nTs=
X-Received: by 2002:a4a:d247:: with SMTP id e7mr9500271oos.77.1622636197909;
 Wed, 02 Jun 2021 05:16:37 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210515124055.22225-1-sergio.paracuellos@gmail.com>
 <20210515124055.22225-3-sergio.paracuellos@gmail.com> <20210531131431.bzsvmefqdyawmeo2@pali>
 <CAMhs-H80=7jctPT70rOmcwcqPw+9iUF84_ZCgGr-TKwJ4eB2Lg@mail.gmail.com>
 <20210531135041.42ovpmbwuc3yfkaw@pali> <CAMhs-H_fR5aXJ=diTm-2yhgjjv9S6N6jA-DOZ0K_BnQ4UHHh3Q@mail.gmail.com>
In-Reply-To: <CAMhs-H_fR5aXJ=diTm-2yhgjjv9S6N6jA-DOZ0K_BnQ4UHHh3Q@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Wed, 2 Jun 2021 14:16:26 +0200
Message-ID: <CAMhs-H8EwQDvZtzpPn2u_WOWt1wcixOvz5nVZP2miM6j0+P7EA@mail.gmail.com>
Subject: Re: [PATCH 2/4] MIPS: pci: Add driver for MT7621 PCIe controller
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: "open list:MIPS" <linux-mips@vger.kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	John Crispin <john@phrozen.org>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, 
	linux-staging@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>, 
	NeilBrown <neil@brown.name>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pali,

On Mon, May 31, 2021 at 4:19 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> On Mon, May 31, 2021 at 3:50 PM Pali Roh=C3=A1r <pali@kernel.org> wrote:
> >
> > On Monday 31 May 2021 15:39:55 Sergio Paracuellos wrote:
> > > Hi Pali,
> > >
> > > Thanks for your comments.
> > >
> > > On Mon, May 31, 2021 at 3:14 PM Pali Roh=C3=A1r <pali@kernel.org> wro=
te:
> > > >
> > > > On Saturday 15 May 2021 14:40:53 Sergio Paracuellos wrote:
> > > > > This patch adds a driver for the PCIe controller of MT7621 SoC.
> > > > >
> > > > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > > > ---
> > > > >  arch/mips/pci/Makefile     |   1 +
> > > > >  arch/mips/pci/pci-mt7621.c | 624 +++++++++++++++++++++++++++++++=
++++++
> > > > >  arch/mips/ralink/Kconfig   |   9 +-
> > > > >  3 files changed, 633 insertions(+), 1 deletion(-)
> > > > >  create mode 100644 arch/mips/pci/pci-mt7621.c
> > > > >
> > > > > diff --git a/arch/mips/pci/Makefile b/arch/mips/pci/Makefile
> > > > > index f3eecc065e5c..178c550739c4 100644
> > > > > --- a/arch/mips/pci/Makefile
> > > > > +++ b/arch/mips/pci/Makefile
> > > > > @@ -24,6 +24,7 @@ obj-$(CONFIG_PCI_AR2315)    +=3D pci-ar2315.o
> > > > >  obj-$(CONFIG_SOC_AR71XX)     +=3D pci-ar71xx.o
> > > > >  obj-$(CONFIG_PCI_AR724X)     +=3D pci-ar724x.o
> > > > >  obj-$(CONFIG_PCI_XTALK_BRIDGE)       +=3D pci-xtalk-bridge.o
> > > > > +obj-$(CONFIG_PCI_MT7621)     +=3D pci-mt7621.o
> > > > >  #
> > > > >  # These are still pretty much in the old state, watch, go blind.
> > > > >  #
> > > > > diff --git a/arch/mips/pci/pci-mt7621.c b/arch/mips/pci/pci-mt762=
1.c
> > > > > new file mode 100644
> > > > > index 000000000000..fe1945819d25
> > > > > --- /dev/null
> > > > > +++ b/arch/mips/pci/pci-mt7621.c
> > > > ...
> > > > > +static int mt7621_pcie_enable_ports(struct mt7621_pcie *pcie)
> > > > > +{
> > > > > +     struct device *dev =3D pcie->dev;
> > > > > +     struct mt7621_pcie_port *port;
> > > > > +     u8 num_slots_enabled =3D 0;
> > > > > +     u32 slot;
> > > > > +     u32 val;
> > > > > +     int err;
> > > > > +
> > > > > +     /* Setup MEMWIN and IOWIN */
> > > > > +     pcie_write(pcie, 0xffffffff, RALINK_PCI_MEMBASE);
> > > > > +     pcie_write(pcie, pcie->io.start, RALINK_PCI_IOBASE);
> > > > > +
> > > > > +     list_for_each_entry(port, &pcie->ports, list) {
> > > > > +             if (port->enabled) {
> > > > > +                     err =3D clk_prepare_enable(port->clk);
> > > > > +                     if (err) {
> > > > > +                             dev_err(dev, "enabling clk pcie%d\n=
", slot);
> > > > > +                             return err;
> > > > > +                     }
> > > > > +
> > > > > +                     mt7621_pcie_enable_port(port);
> > > > > +                     dev_info(dev, "PCIE%d enabled\n", port->slo=
t);
> > > > > +                     num_slots_enabled++;
> > > > > +             }
> > > > > +     }
> > > > > +
> > > > > +     for (slot =3D 0; slot < num_slots_enabled; slot++) {
> > > > > +             val =3D read_config(pcie, slot, PCI_COMMAND);
> > > > > +             val |=3D PCI_COMMAND_MASTER;
> > > > > +             write_config(pcie, slot, PCI_COMMAND, val);
> > > >
> > > > Hello! Is this part of code correct? Because it looks strange if PC=
Ie
> > > > controller driver automatically enables PCI bus mastering, prior de=
vice
> > > > driver initialize itself.
> > > >
> > > > Moreover kernel has already function pci_set_master() for this purp=
ose
> > > > which is used by device drivers.
> > > >
> > > > So I think this code can confuse some device drivers...
> > >
> > > I agree that we have pci_set_master() to be used in pci device driver
> > > code. Original controller driver set this bit for enabled slots. Sinc=
e
> > > there is no documentation at all for the PCI in this SoC
> >
> > I see... this is really a big problem to do any driver development...
>
> For sure it is :(.
>
> >
> > > I have
> > > maintained the setting in the driver in a cleaner way. See original
> > > driver code and the setting here [0]. There is no other reason than
> > > that. I am ok with removing this from here and testing with my two
> > > devices that everything is still ok if having this setting in the pci
> > > controller driver is a real problem.
> >
> > You can run lspci -nnvv with and without PCI_COMMAND_MASTER code and
> > then compare outputs.
> >
> > Device drivers for sure enable PCI_COMMAND_MASTER at the time when it i=
s
> > needed, so it is possible that there would be no difference in lspci
> > output.
>
> Thanks. I will take this into account when v2 is submitted after more
> review comments come :).

I have tested to remove this and check lspci -nnvv output with and
without PCI_COMMAND_MASTER code and, as you pointed out, there is no
difference between them. Also, both boards are working without
regressions at all. So I will remove this code for next version.

Thanks,
    Sergio Paracuellos
>
> >
> > > [0]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.g=
it/tree/drivers/staging/mt7621-pci/pci-mt7621.c?h=3Dv4.18#n676
> > >
> > > Best regards,
> > >     Sergio Paracuellos
> > > >
> > > > > +             /* configure RC FTS number to 250 when it leaves L0=
s */
> > > > > +             val =3D read_config(pcie, slot, PCIE_FTS_NUM);
> > > > > +             val &=3D ~PCIE_FTS_NUM_MASK;
> > > > > +             val |=3D PCIE_FTS_NUM_L0(0x50);
> > > > > +             write_config(pcie, slot, PCIE_FTS_NUM, val);
> > > > > +     }
> > > > > +
> > > > > +     return 0;
> > > > > +}
