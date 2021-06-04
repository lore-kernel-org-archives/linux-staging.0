Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B5170
	for <linux-staging@lists.linux.dev>; Fri,  4 Jun 2021 21:16:08 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id w23-20020a9d5a970000b02903d0ef989477so5998720oth.9
        for <linux-staging@lists.linux.dev>; Fri, 04 Jun 2021 14:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VrpYDmA2bDYdBnxEAitWI5SHLDNVcxWIKBXiEWgGkbU=;
        b=IcUmRhKY7t0zANMd2hJSQLTmxlFqI7OPYK/zlewwUe4OGJw2WLFtW5/qsEPJ7Gf7+g
         N6Yg+qmvGCZvkmTIpbjNBNotYoBFgCncc41y09eyWSUzWQNwjwrxqVVH6O9OgTUcZdSy
         urRm3Oo02YlEBSIGGbrYrAPoETwaTaUevVN4NgovB8C0IKTEmItc+5MtLEJUY049ZKW0
         B33LRqreS28QR6TGLh5yrGkqIpKXYmwjoE4WPLPP3GaLfLWMYRgVfGfEkURjnfd88iQg
         zgDvsqKH1q8L22RctnYj+IjPMpIeCqeaoKZbeTzlnnmRwB7T7cyspJdNmzvVuJid7ws2
         FtYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VrpYDmA2bDYdBnxEAitWI5SHLDNVcxWIKBXiEWgGkbU=;
        b=g/8TwS6sE9QXk7MvJxwmO0VfiMB/QycARgi+vpHs2Qqhs0B7PAguqRrVyYhfDIV2nM
         SkwkuSPG8Mc9A5g/4vPlGhhbbJQvqLc6MYKyalVUKpxbJnZmt30Z2bsSApv+3dZuZw4Y
         9/X+o3sshyMGxB5AFY3QyOTbu++Ha/gfBTG+ku5QN/tCfCS2+KKvY12pXv2BCsRz5YsI
         WEJshuXiDCF4lYuokkr+oW8nZ5wN9zw7/gPPOg8YkiZh/W1ddsqHsOyj2IGXzV5TGht1
         UghIOz8lD2fRSNLPou16DjYHCrM6sMpjblb5Rpgh8B+ZPAVOzuZL71OyondnnNC8IdYy
         ddFw==
X-Gm-Message-State: AOAM532UmsppXceb88tnqGnodDj6sCKBwP7IQO+es5GAw8WxMp+F3yXT
	OXTKd/+taoBtlYDYt+ndN26EKOid3g8Q0Kf7Dos=
X-Google-Smtp-Source: ABdhPJz5dL97b+GG9y2RUOQR0MN8RqtrqhZBj75z8mptERR5tBk4fyi+plmEfG1J4qn2/c6C/3Aa1ZdJS6n+5j2hD1w=
X-Received: by 2002:a9d:4f19:: with SMTP id d25mr5336285otl.72.1622841368139;
 Fri, 04 Jun 2021 14:16:08 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210531131845.ookvz7njj6yrkaeh@pali> <20210604194328.GA2230062@bjorn-Precision-5520>
In-Reply-To: <20210604194328.GA2230062@bjorn-Precision-5520>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 4 Jun 2021 23:15:56 +0200
Message-ID: <CAMhs-H98efm9bCL4ff85mcbKReBVyGsVmMw-YXRL_FXzPTyw4Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] MIPS: ralink: pci: driver for Pcie controller in
 MT7621 SoCs
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, lorenzo.pieralisi@arm.com, 
	"open list:MIPS" <linux-mips@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	John Crispin <john@phrozen.org>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, 
	linux-staging@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>, 
	NeilBrown <neil@brown.name>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bjorn,

On Fri, Jun 4, 2021 at 9:43 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Mon, May 31, 2021 at 03:18:45PM +0200, Pali Roh=C3=A1r wrote:
> > On Friday 21 May 2021 12:23:38 Thomas Bogendoerfer wrote:
> > > On Wed, May 19, 2021 at 11:18:36PM +0200, Sergio Paracuellos wrote:
> > > > On Wed, May 19, 2021 at 10:36 PM Bjorn Helgaas <helgaas@kernel.org>=
 wrote:
> > > > > But most of the similar drivers are in drivers/pci/controller/, w=
here
> > > > > I think it's easier to keep them up to date with changes in the P=
CI
> > > > > core.  Have you considered putting this one there?
> > > >
> > > > Most pci drivers in 'arch/mips/pci' are still using PCI_LEGACY stuf=
f.
> > > > In contrast mt7621-pci is using current pci generic apis but even m=
ost
> > > > of the code is generic enough, there is one remaining thing which
> > > > depends on mips architecture which is the iocu region configuration
> > > > which must be done in the driver itself. This is the only reason to
> > > > move this driver into 'arch/mips/pci' instead of
> > > > 'drivers/pci/controller/'. So... I am all ears to listen to
> > > > suggestions for the proper place for this driver. Thomas, do you ha=
ve
> > > > any thoughts on this?
> > >
> > > I tried to put a pci-xtalk driver into drivers/pci/controller, but
> > > Lorenzo didn't want it there for being MIPS and not DT based. So this
> > > one is DT based, but still MIPS. I'm perfectly fine putting this
> > > driver into drivers/pci/controller/
> >
> > In my personal opinion this driver could go into drivers/pci/controller=
/
>
> I'm not sure exactly what "PCI_LEGACY" above refers to.

I meant most of the drivers there are not using current generic pci
apis but still using pci legacy ones.

>
> I don't see any direct #includes of arch/mips in the driver.  I do see
> that it uses mips_cps_numiocu(), which is certainly MIPS-specific.

Yes, mips_cps_numiocu is the only stuff needed and arch specific used
by this driver.

>
> But we do have some things in drivers/pci/controller/ that only build
> on certain arches, enforced mostly by Kconfig rules, so I think you
> could do that.  We try to make so things can at least be *compiled* on
> any arch, but I know that's not always possible.
>
> So I think it would be useful to put this in drivers/pci/controller/
> somewhere because it will make it easier to see common patterns and
> refactoring opportunities.

Ok, so I will move the driver into 'drivers/pci/controller/' in v2.

Thanks,
    Sergio Paracuellos
>
> Bjorn
