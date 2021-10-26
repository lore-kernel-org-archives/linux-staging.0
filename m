Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6632CA4
	for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 05:49:29 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id f24so7757377uav.12
        for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 22:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bt8gnFZ7zRXlSxTO50E3NK4ULqXSpvY8WAtWfScUzG0=;
        b=XvlFPA3yn+iFCXaotivzTIsO+qWlf16GeSElUXWhG3T3M9m/Cj9lW+Yis0yZVM7Cli
         vKCdl96OEhYMK1MTRZawjaTvU6V4HpDmET0j42lb6aoehCLXEEFXiZ2MeNJteE/GGM7o
         9mQsk2a1v+CRVPTfZblzsemULBqhRmIKc89xxSl9927Sg0jgb3sKpwM3FnEcPd/RJa7Z
         nV7eA2eiYNuGBo6WxrF0ARaFqnkRGFn/OQRspkOZO0TLHN3fOJkXFr0LNIgw3kN+i55d
         UIa5jCN2Xz0OQEeYBxiXb1zz2oYugJ41JVM93ww9jae/5a/JfwWAvARto7/adB/1YE9c
         +h1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bt8gnFZ7zRXlSxTO50E3NK4ULqXSpvY8WAtWfScUzG0=;
        b=cpQv9+XqrhApev+0YoZtCFJHjejTJGxwfIU0FiVhhB6fm6KAZH/75U+bqq6jvNsfio
         uB2DTS1cRsBttlioFp+rz81Upxg5b6bqSYYdRfXDXVzRM58eiSyhW6sFQDcT9FAeYjq2
         uWu7/6oxmK5Gt+pSLj1ji3Yn4AA2IYvn1tNSE1dKWlP1S7YWUA1295nDNfe91OWcPaD0
         AyhH6l2n9aWEYnUJ+ZRgmAZBCtFLOHRqZWP6UJsMs0mF38w0m5bGO6KWE6HyfBqpdMhF
         yuLVamCHn6cuCQYAncQ5zAZqjK7NAIUaWXwylrgseX33Z9cT42EsKFAbY0kfD6K+izuD
         kmjQ==
X-Gm-Message-State: AOAM531KkaqUM8XFYq2UWTF0vDYBNBxNfT1HlS7L6fWTt4HcYZaGYimX
	KUTNHxYJ5NF5phowDuRo9uJzXPyq3qqXwVZdPb/BricpN0o=
X-Google-Smtp-Source: ABdhPJwwQ1QduqebQ2QK3PagmHcpgq321TdFHCBaZL1Z8yoc0Ad/iVuajzcpNOgd85uNPT6zLUnZgT57V0K/7wzLMZM=
X-Received: by 2002:a9f:3523:: with SMTP id o32mr13839895uao.131.1635227368384;
 Mon, 25 Oct 2021 22:49:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMhs-H90rD8aHJ+txDzFZ62Ej9_TY=BZMT+1058d=Pm_LfYwPA@mail.gmail.com>
 <20211025211236.GA31293@bhelgaas>
In-Reply-To: <20211025211236.GA31293@bhelgaas>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 26 Oct 2021 07:49:16 +0200
Message-ID: <CAMhs-H_HL3OxfN7dCwbeqjwwufaNWEJJCfQeYk+42CVK8=69Ew@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] PCI: mt7621: Add MediaTek MT7621 PCIe host
 controller driver
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh+dt@kernel.org>, 
	linux-pci <linux-pci@vger.kernel.org>, "open list:MIPS" <linux-mips@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, John Crispin <john@phrozen.org>, 
	NeilBrown <neil@brown.name>, Greg KH <gregkh@linuxfoundation.org>, 
	linux-staging@lists.linux.dev, Matthias Brugger <matthias.bgg@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 25, 2021 at 11:12 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Fri, Oct 22, 2021 at 11:13:39AM +0200, Sergio Paracuellos wrote:
> > On Fri, Oct 22, 2021 at 10:35 AM Lorenzo Pieralisi
> > <lorenzo.pieralisi@arm.com> wrote:
> > >
> > > On Thu, Oct 21, 2021 at 09:23:35PM +0200, Sergio Paracuellos wrote:
> > > > On Thu, Oct 21, 2021 at 8:11 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > >
> > > > > On Thu, Oct 21, 2021 at 07:27:21PM +0200, Sergio Paracuellos wrote:
> > > > > > On Thu, Oct 21, 2021 at 5:52 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > > > > Since this is a PCIe (not conventional PCI) controller, I
> > > > > > > vote for renaming these from:
> > > > > > >
> > > > > > >   PCI_MT7621
> > > > > > >   Documentation/devicetree/bindings/pci/mediatek,mt7621-pci.yaml
> > > > > > >   drivers/pci/controller/pci-mt7621.c
> > > > > > >
> > > > > > > to:
> > > > > > >
> > > > > > >   PCIE_MT7621
> > > > > > >   Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
> > > > > > >   drivers/pci/controller/pcie-mt7621.c
> > > > > > >
> > > > > > > We have a mix of these, with many of the early PCIe
> > > > > > > drivers being named "pci", but I think that was my mistake
> > > > > > > and there's no reason to continue it.
> > > > > >
> > > > > > I see.
> > > > > >
> > > > > > > I can do this locally unless somebody objects.
> > > > > >
> > > > > > I have no problem at all. Only one question. Do you mean to
> > > > > > change compatible string also, or only the name of the file?
> > > > > > Let me know if I have to do anything.
> > > > >
> > > > > I didn't change the compatible string, to avoid a DT
> > > > > incompatibility.  But I *did* change the Kconfig symbol to
> > > > > PCIE_MT7621, which could require changes to out-of-tree
> > > > > .configs.  I'm open to suggestions either way for both things.
> > > >
> > > > IMHO, I do think we should not worry about out-of-tree stuff at
> > > > all.
> > >
> > > For Kconfig I tend to agree. For DT I see some "bindings" in the
> > > staging tree are being deleted and published as official DT
> > > bindings with this patchset but I believe we still have to keep
> > > the compatible string backward compatibility regardless because
> > > there may be firmware out there using it.
> >
> > The bindings txt file removed in staging with this patchset was also
> > added by me three years ago[0], and has been changing until the YAML
> > bindings are reviewed by Rob and driver updated accordly in this
> > patchset.
> >
> > OpenWRT maintains its own file[1] which I don't know is updated or
> > not according to the one in staging which I am pretending to
> > properly mainline for 5.17. But yes, I agree there might be firmware
> > out there using current compatible string.
> >
> > [0]: Commit 5451e22618b8 ("staging: mt7621-pci: dt-bindings: add dt
> > bindings for mt7621 pcie controller")
> > [1]: https://github.com/openwrt/openwrt/blob/master/target/linux/ramips/dts/mt7621.dtsi
>
> OK, for now I left my rework as-is:
>
>   - changed CONFIG_PCI_MT7621 to CONFIG_PCIE_MT7621
>   - renamed mediatek,mt7621-pci.yaml to mediatek,mt7621-pcie.yaml
>   - renamed pci-mt7621.c to pcie-mt7621.c
>   - kept DT compatible string "mediatek,mt7621-pci" in .yaml and .c
>
> I reason that the Kconfig and filename changes only affect people
> building kernels or DTs, but a compatible string change would force a
> DT update to be synchronized with a kernel update.

This is all ok for me, Bjorn. Thanks for doing this. I guess even if
we don't force people to a DT update to synchronize things, since
bindings have been changed until they have been approved, I guess most
people must upgrade from early not approved DT early versions in any
case. But in any case I guess that maintaining the compatible string
is the safest thing to do.

>
> Happy to change this if necessary.

Best regards,
    Sergio Paracuellos

>
> Bjorn
