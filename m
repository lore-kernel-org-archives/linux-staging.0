Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7AB173
	for <linux-staging@lists.linux.dev>; Mon, 31 May 2021 13:40:07 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id 69-20020a9d0a4b0000b02902ed42f141e1so11129088otg.2
        for <linux-staging@lists.linux.dev>; Mon, 31 May 2021 06:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ozF7Nw0gMrrvzPjGZChhJPIjE3+nOGNmHfCPhJPHLRQ=;
        b=AnpSaFAXu0Lf0o787EGCw9Q4WRtBu2uEFo9T3b5CSo+FlZFV4Z7ooh8U9B81yPaMhl
         1rF05/vSgb0CmLrTmbUykug3Sa7TTVmyYOGQeax7aDnUQ6fBkqFGViKZwAWeOmqzXspv
         6/HfRqagSQ2G0ZYzATf1HPcZikDpx5IUy9u7vpMq9GmuLToyRSR4Rade8EwrJvfbkaJJ
         Q7ejJYb76pKVePyQF17TG7i/+k0QHdn2fH2Ifhg3/jPzrSFYGZ4a8a/W37MpeAXEfcLF
         H3e6fmXYaHs1MnDiMWx/hLvg7LUQvePyZJKCaP2K7+zpVOWJLsfsdjV3hwhEl6hHPDfg
         GyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ozF7Nw0gMrrvzPjGZChhJPIjE3+nOGNmHfCPhJPHLRQ=;
        b=OmQngYoLTkuqr7mN2sntrIFIKtQiup2gKSD8JoL5QHzea+BlRZ5LHhGb8V0NmNdPzL
         az8mwWo3MyLgnGwxIGBzhUqTRH31rr8T7m74H53k2MlsHVVVInpWJ4xwUFSDBxYm4UPw
         MKFPpqhc49WgrMagoaHcDpbOLqJzJL7z9FGuNKEVMyn+D2XL3MtW/7Hyqdm869B9UBUR
         35IK70Ae6aM4Y7w2cJhyYx24WIzS9iepRnYfBA6ekNGKokfAul4AS2W/ldGLGEIl8AAZ
         eT1s9rxSsnfcqlin5bnmmvS7y/nA7PWxrXKmkLGA471UBr4ZLY44gnnMkrhmffERIp5Y
         N4Tw==
X-Gm-Message-State: AOAM531wtl9n2OZ29VJdELu7DqKe6jWRyaBjGKlAHafSyWoxiysov0Hm
	QjTKl8nbzLivFm7LXubrn04u5n6g63Esa+QuppY=
X-Google-Smtp-Source: ABdhPJzqgggxS8X7nyAo0DAvgmmlEzBHLmjc2yp0dBZreoZQ8hJGpTy1Bhx84M9jYQwuR3EsrX0b409L5yEU267ChAs=
X-Received: by 2002:a9d:4592:: with SMTP id x18mr7969267ote.74.1622468406360;
 Mon, 31 May 2021 06:40:06 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210515124055.22225-1-sergio.paracuellos@gmail.com>
 <20210515124055.22225-3-sergio.paracuellos@gmail.com> <20210531131431.bzsvmefqdyawmeo2@pali>
In-Reply-To: <20210531131431.bzsvmefqdyawmeo2@pali>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 31 May 2021 15:39:55 +0200
Message-ID: <CAMhs-H80=7jctPT70rOmcwcqPw+9iUF84_ZCgGr-TKwJ4eB2Lg@mail.gmail.com>
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

Thanks for your comments.

On Mon, May 31, 2021 at 3:14 PM Pali Roh=C3=A1r <pali@kernel.org> wrote:
>
> On Saturday 15 May 2021 14:40:53 Sergio Paracuellos wrote:
> > This patch adds a driver for the PCIe controller of MT7621 SoC.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  arch/mips/pci/Makefile     |   1 +
> >  arch/mips/pci/pci-mt7621.c | 624 +++++++++++++++++++++++++++++++++++++
> >  arch/mips/ralink/Kconfig   |   9 +-
> >  3 files changed, 633 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/mips/pci/pci-mt7621.c
> >
> > diff --git a/arch/mips/pci/Makefile b/arch/mips/pci/Makefile
> > index f3eecc065e5c..178c550739c4 100644
> > --- a/arch/mips/pci/Makefile
> > +++ b/arch/mips/pci/Makefile
> > @@ -24,6 +24,7 @@ obj-$(CONFIG_PCI_AR2315)    +=3D pci-ar2315.o
> >  obj-$(CONFIG_SOC_AR71XX)     +=3D pci-ar71xx.o
> >  obj-$(CONFIG_PCI_AR724X)     +=3D pci-ar724x.o
> >  obj-$(CONFIG_PCI_XTALK_BRIDGE)       +=3D pci-xtalk-bridge.o
> > +obj-$(CONFIG_PCI_MT7621)     +=3D pci-mt7621.o
> >  #
> >  # These are still pretty much in the old state, watch, go blind.
> >  #
> > diff --git a/arch/mips/pci/pci-mt7621.c b/arch/mips/pci/pci-mt7621.c
> > new file mode 100644
> > index 000000000000..fe1945819d25
> > --- /dev/null
> > +++ b/arch/mips/pci/pci-mt7621.c
> ...
> > +static int mt7621_pcie_enable_ports(struct mt7621_pcie *pcie)
> > +{
> > +     struct device *dev =3D pcie->dev;
> > +     struct mt7621_pcie_port *port;
> > +     u8 num_slots_enabled =3D 0;
> > +     u32 slot;
> > +     u32 val;
> > +     int err;
> > +
> > +     /* Setup MEMWIN and IOWIN */
> > +     pcie_write(pcie, 0xffffffff, RALINK_PCI_MEMBASE);
> > +     pcie_write(pcie, pcie->io.start, RALINK_PCI_IOBASE);
> > +
> > +     list_for_each_entry(port, &pcie->ports, list) {
> > +             if (port->enabled) {
> > +                     err =3D clk_prepare_enable(port->clk);
> > +                     if (err) {
> > +                             dev_err(dev, "enabling clk pcie%d\n", slo=
t);
> > +                             return err;
> > +                     }
> > +
> > +                     mt7621_pcie_enable_port(port);
> > +                     dev_info(dev, "PCIE%d enabled\n", port->slot);
> > +                     num_slots_enabled++;
> > +             }
> > +     }
> > +
> > +     for (slot =3D 0; slot < num_slots_enabled; slot++) {
> > +             val =3D read_config(pcie, slot, PCI_COMMAND);
> > +             val |=3D PCI_COMMAND_MASTER;
> > +             write_config(pcie, slot, PCI_COMMAND, val);
>
> Hello! Is this part of code correct? Because it looks strange if PCIe
> controller driver automatically enables PCI bus mastering, prior device
> driver initialize itself.
>
> Moreover kernel has already function pci_set_master() for this purpose
> which is used by device drivers.
>
> So I think this code can confuse some device drivers...

I agree that we have pci_set_master() to be used in pci device driver
code. Original controller driver set this bit for enabled slots. Since
there is no documentation at all for the PCI in this SoC I have
maintained the setting in the driver in a cleaner way. See original
driver code and the setting here [0]. There is no other reason than
that. I am ok with removing this from here and testing with my two
devices that everything is still ok if having this setting in the pci
controller driver is a real problem.

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/tre=
e/drivers/staging/mt7621-pci/pci-mt7621.c?h=3Dv4.18#n676

Best regards,
    Sergio Paracuellos
>
> > +             /* configure RC FTS number to 250 when it leaves L0s */
> > +             val =3D read_config(pcie, slot, PCIE_FTS_NUM);
> > +             val &=3D ~PCIE_FTS_NUM_MASK;
> > +             val |=3D PCIE_FTS_NUM_L0(0x50);
> > +             write_config(pcie, slot, PCIE_FTS_NUM, val);
> > +     }
> > +
> > +     return 0;
> > +}
