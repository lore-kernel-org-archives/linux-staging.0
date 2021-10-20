Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867A02C80
	for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 14:56:15 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id j8so7102937uak.9
        for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 07:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LVRZfCbUcEWqq8bS7PaOVjbhTh/WMCv3Aoqx5RAxI1Y=;
        b=M3jZcojyY6KwbydrAH9WjnewEr0XFq3PdzkMUEsUbrFx8wTTQXqGLT5+Sec2jPy3AG
         hfumzblW+g6VWHX9JfOrVqa9RC5FGzhf9e1eCBzSw9wTccgog9GsS+iwwm9kpsRxXWLA
         alXC1g16Bh5LGu8GLxP4Qm3zXCb6UcwtoIcOPjbOcujtgx3+z3Z4euOFsOTaRKAAr92d
         ZzErZg9YruuNDYylZZ74fJyWY3jjwNCRojRreE/zm6npnzfFsRBGaxPxpeUWUOJbTxmo
         r4rq+9Na4it873j4LlwH8wPWhf9nzKrExExfZhfV3xqFedVVG7dUy5Ho/YiO3mcJyuyK
         +qJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LVRZfCbUcEWqq8bS7PaOVjbhTh/WMCv3Aoqx5RAxI1Y=;
        b=qODMyD4mXGhdam6OjtgMJ+ybj863mWOuqtm1VjgycjkS2tPwx8hDGMreQ1YY7/pLp7
         d0Cd/WLWCRJjSYYC9K+O7RQJGBfmoNopLuMg6xoohuxGTMmI0knmVREcmuUBj0qO+9P5
         qH9JFhge0TMdJoC5XsZbsZd4i0YWXD+98wcnBbg/0NyLIxqXvarx2JcLmqJoX+z2Be7Q
         ZkFLNxM8KlbZrt435fTvGlJa4419oIHiwYznrT2cIoGNHnS5Ag7IGUeCi3X0Xonwp46G
         oHxVWZ/zGm3y+JAmCUsYndvLkuqBwr3pEPc+BNtTi1TOZU5u2nCLQtLuf2rkJkY7Q628
         0NAw==
X-Gm-Message-State: AOAM532KFNhjn39tkT+AgegQBaopm098voqtKcD8t83/0wtMxlTfu1te
	OXbJ5qyD/4uIB5F8+SP/O3eGRSx+5HxnsQZPv8E=
X-Google-Smtp-Source: ABdhPJy/0HLpH4lEXBGS1niveWyVKjjV+ypKgVhS4pvrspXd+LAcOALfGNoz8yvyLuDFEkbc7WSHTclIrYcmad0Hvdg=
X-Received: by 2002:a67:42c2:: with SMTP id p185mr641748vsa.41.1634741774522;
 Wed, 20 Oct 2021 07:56:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210922050035.18162-1-sergio.paracuellos@gmail.com> <163473978253.23166.3894301849923362863.b4-ty@arm.com>
In-Reply-To: <163473978253.23166.3894301849923362863.b4-ty@arm.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Wed, 20 Oct 2021 16:56:03 +0200
Message-ID: <CAMhs-H99H_Ojtdwyj3_9K6FdZfNgD42cHfjrVJ-+6_RiU4OG7g@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] PCI: mt7621: Add MediaTek MT7621 PCIe host
 controller driver
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: linux-pci <linux-pci@vger.kernel.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	John Crispin <john@phrozen.org>, NeilBrown <neil@brown.name>, Greg KH <gregkh@linuxfoundation.org>, 
	linux-staging@lists.linux.dev, Matthias Brugger <matthias.bgg@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 20, 2021 at 4:23 PM Lorenzo Pieralisi
<lorenzo.pieralisi@arm.com> wrote:
>
> On Wed, 22 Sep 2021 07:00:32 +0200, Sergio Paracuellos wrote:
> > MediaTek MT7621 PCIe subsys supports single Root complex (RC)
> > with 3 Root Ports. Each Root Ports supports a Gen1 1-lane Link.
> > Topology is as follows:
> >
> >
> >                           MT7621 PCIe HOST Topology
> >
> > [...]
>
> Applied to pci/mt7621, thanks!
>
> [1/3] dt-bindings: mt7621-pci: PCIe binding documentation for MT7621 SoCs
>       https://git.kernel.org/lpieralisi/pci/c/e5bc5605e7
> [2/3] PCI: mt7621: Add MediaTek MT7621 PCIe host controller driver
>       https://git.kernel.org/lpieralisi/pci/c/5797a2b2bc
> [3/3] MAINTAINERS: add myself as maintainer of the MT7621 PCI controller driver
>       https://git.kernel.org/lpieralisi/pci/c/eb1d7d438c
>
> Thanks,
> Lorenzo

Thanks, Lorenzo.

Best regards,
     Sergio Paracuellos
