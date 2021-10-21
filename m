Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89E52C81
	for <linux-staging@lists.linux.dev>; Thu, 21 Oct 2021 18:11:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 384C061B02;
	Thu, 21 Oct 2021 18:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634839907;
	bh=psJZ49rG48h3c6QTK1w3TtTm4kFWl0poF+dfxOe50cE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ferkLuH49uqEMwhLAJ+/DXSseXl8DJpim0d/mwNnAVxAk4sBgNqI+S9b7Y+LxoeTw
	 Yu3v6JSGC/QsiOEvSvpH+riPpL9cfuueFQZxfk2aRN3YGJ2afQ28wurIeaZAWLJJdT
	 v404Gjggnp26Sv/AAmsDo1xeSNLpJf4rEtVDK31vCv0QA6RsWruo479d0TOmGuX+YE
	 0OAbZr++Zrh4A26DjyWzEfjoTS+jt+VCo9WxXHI7+DAmHdBsuw5ISERN8VI4feZu0h
	 mkS2ubIY3gb5oSJbFieJtjLPXrxKW3FLLRPK50aIEESkxf145izTK4gE/Ffvm6GkGH
	 67b//q8p0RqtA==
Date: Thu, 21 Oct 2021 13:11:45 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	linux-pci <linux-pci@vger.kernel.org>,
	"open list:MIPS" <linux-mips@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	John Crispin <john@phrozen.org>, NeilBrown <neil@brown.name>,
	Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v3 0/3] PCI: mt7621: Add MediaTek MT7621 PCIe host
 controller driver
Message-ID: <20211021181145.GA2708516@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMhs-H-BA+KzEwuDPzcmrDPdgJBFA2XdYTBvT4R4MEOUB=WQ1g@mail.gmail.com>

On Thu, Oct 21, 2021 at 07:27:21PM +0200, Sergio Paracuellos wrote:
> On Thu, Oct 21, 2021 at 5:52 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > Since this is a PCIe (not conventional PCI) controller, I vote for
> > renaming these from:
> >
> >   PCI_MT7621
> >   Documentation/devicetree/bindings/pci/mediatek,mt7621-pci.yaml
> >   drivers/pci/controller/pci-mt7621.c
> >
> > to:
> >
> >   PCIE_MT7621
> >   Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
> >   drivers/pci/controller/pcie-mt7621.c
> >
> > We have a mix of these, with many of the early PCIe drivers being
> > named "pci", but I think that was my mistake and there's no reason to
> > continue it.
> 
> I see.
> 
> >
> > I can do this locally unless somebody objects.
> 
> I have no problem at all. Only one question. Do you mean to change
> compatible string also, or only the name of the file? Let me know if I
> have to do anything.

I didn't change the compatible string, to avoid a DT incompatibility.
But I *did* change the Kconfig symbol to PCIE_MT7621, which could
require changes to out-of-tree .configs.  I'm open to suggestions
either way for both things.
