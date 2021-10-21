Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B412C81
	for <linux-staging@lists.linux.dev>; Thu, 21 Oct 2021 17:27:33 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id u5so2569222uao.13
        for <linux-staging@lists.linux.dev>; Thu, 21 Oct 2021 10:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n3KAUH5tf43FPgeIldLgrHI6MLHGHRqbeDSFqA/wj6k=;
        b=UktcyfAWEPQILj2/NzzmvMAzdpAfMV4q5eRVROBynRVdLNYRD8/2gc+znAsZnXnhVm
         EHDpxnJll2/m+IuTvzo6nn/r+gUDbq+dvYHJXt2/MaBGXse9LLIqMA+nzFhO5ortgguY
         QkgfawKKXp9966CULV4EKTpPSMomVEmfU/DxuwznaFrwAH+Qdb+OgndgB1XrvTBt4G0c
         UdK6XeBpXM3GgG6+TtADSFokXF4axnBNObXiJ77jl2UUlGfn4O4HbpZ4mCT59XAsEh2t
         Ttb/6FgV/1PKqzze94P+8N4weGR1/O9wIOUbIFXAgl0nHlXPMqeND/GHcYY4CKBIiPTi
         jsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n3KAUH5tf43FPgeIldLgrHI6MLHGHRqbeDSFqA/wj6k=;
        b=xh4ULF0tTLECN3ppOH0akqShnC9oUoVLXa6GiuYFr6tTwycShuyGp5DOq4WEoKOLAy
         /5DlVvQhr32VvBtdkKIxV/cFHnU+ZU73J6Dd2x4uLSJYBOSTMEeBkk6c2nOsm1cgLDMn
         E8h87yEJou+7lnuJ+qUpmKNmzHx7KcFUM7WzYEBldcqmkFyiKbEhlHpl17GE8UvaaGul
         K5ahKoOB7NTfRcVKk53jCEMHW6E/Wh/avJZG0G7JykzLep1a6Cge8SMlItYPv8tLd9Bi
         UY7eHyrB4iwV0VJcOoREL8q5692ytURRgXwztJmdNelK+HdtIC3W9j2k0LJSDRbCso3L
         nR0g==
X-Gm-Message-State: AOAM5318TQEGF4EZJOjixl/01Dg20d53VetGWZ7BSM+ORR56kJCY7yHG
	OZZIXDMLD6gFtflSvvtwbBJ/zcIx+88obT0HQp8=
X-Google-Smtp-Source: ABdhPJy9D+3cDlBwjEWxaq8dqkdQpLoO3j0avxBUK363K6hl97hfPjuGhjnr8pAKXA2wvwWYSysjy/d2TVvGs/4/j74=
X-Received: by 2002:a67:d78c:: with SMTP id q12mr8220476vsj.28.1634837252362;
 Thu, 21 Oct 2021 10:27:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <163473978253.23166.3894301849923362863.b4-ty@arm.com> <20211021155256.GA2689055@bhelgaas>
In-Reply-To: <20211021155256.GA2689055@bhelgaas>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 21 Oct 2021 19:27:21 +0200
Message-ID: <CAMhs-H-BA+KzEwuDPzcmrDPdgJBFA2XdYTBvT4R4MEOUB=WQ1g@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] PCI: mt7621: Add MediaTek MT7621 PCIe host
 controller driver
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci <linux-pci@vger.kernel.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	John Crispin <john@phrozen.org>, NeilBrown <neil@brown.name>, Greg KH <gregkh@linuxfoundation.org>, 
	linux-staging@lists.linux.dev, Matthias Brugger <matthias.bgg@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Bjorn,

On Thu, Oct 21, 2021 at 5:52 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Wed, Oct 20, 2021 at 03:23:45PM +0100, Lorenzo Pieralisi wrote:
> > On Wed, 22 Sep 2021 07:00:32 +0200, Sergio Paracuellos wrote:
> > > MediaTek MT7621 PCIe subsys supports single Root complex (RC)
> > > with 3 Root Ports. Each Root Ports supports a Gen1 1-lane Link.
> > > Topology is as follows:
> > >
> > >
> > >                           MT7621 PCIe HOST Topology
> > >
> > > [...]
> >
> > Applied to pci/mt7621, thanks!
> >
> > [1/3] dt-bindings: mt7621-pci: PCIe binding documentation for MT7621 SoCs
> >       https://git.kernel.org/lpieralisi/pci/c/e5bc5605e7
> > [2/3] PCI: mt7621: Add MediaTek MT7621 PCIe host controller driver
> >       https://git.kernel.org/lpieralisi/pci/c/5797a2b2bc
> > [3/3] MAINTAINERS: add myself as maintainer of the MT7621 PCI controller driver
> >       https://git.kernel.org/lpieralisi/pci/c/eb1d7d438c
>
> Since this is a PCIe (not conventional PCI) controller, I vote for
> renaming these from:
>
>   PCI_MT7621
>   Documentation/devicetree/bindings/pci/mediatek,mt7621-pci.yaml
>   drivers/pci/controller/pci-mt7621.c
>
> to:
>
>   PCIE_MT7621
>   Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
>   drivers/pci/controller/pcie-mt7621.c
>
> We have a mix of these, with many of the early PCIe drivers being
> named "pci", but I think that was my mistake and there's no reason to
> continue it.

I see.

>
> I can do this locally unless somebody objects.

I have no problem at all. Only one question. Do you mean to change
compatible string also, or only the name of the file? Let me know if I
have to do anything.

Thanks,
    Sergio Paracuellos
