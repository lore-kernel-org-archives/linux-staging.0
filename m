Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06E070
	for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 11:37:34 +0000 (UTC)
Received: from uucp (helo=alpha)
	by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
	id 1lk2Jr-000130-00; Fri, 21 May 2021 12:23:51 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 58C96C101E; Fri, 21 May 2021 12:23:38 +0200 (CEST)
Date: Fri, 21 May 2021 12:23:38 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	lorenzo.pieralisi@arm.com
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	"open list:MIPS" <linux-mips@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	John Crispin <john@phrozen.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rob Herring <robh+dt@kernel.org>, linux-staging@lists.linux.dev,
	Greg KH <gregkh@linuxfoundation.org>, NeilBrown <neil@brown.name>,
	Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH 0/4] MIPS: ralink: pci: driver for Pcie controller in
 MT7621 SoCs
Message-ID: <20210521102338.GA6989@alpha.franken.de>
References: <20210515124055.22225-1-sergio.paracuellos@gmail.com>
 <20210519203628.GA254894@bjorn-Precision-5520>
 <CAMhs-H-7Ocjp6JLKcS9_hMn77H=st8JBdLXgxc+yYiypFTjrvQ@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMhs-H-7Ocjp6JLKcS9_hMn77H=st8JBdLXgxc+yYiypFTjrvQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, May 19, 2021 at 11:18:36PM +0200, Sergio Paracuellos wrote:
> On Wed, May 19, 2021 at 10:36 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > But most of the similar drivers are in drivers/pci/controller/, where
> > I think it's easier to keep them up to date with changes in the PCI
> > core.  Have you considered putting this one there?
> 
> Most pci drivers in 'arch/mips/pci' are still using PCI_LEGACY stuff.
> In contrast mt7621-pci is using current pci generic apis but even most
> of the code is generic enough, there is one remaining thing which
> depends on mips architecture which is the iocu region configuration
> which must be done in the driver itself. This is the only reason to
> move this driver into 'arch/mips/pci' instead of
> 'drivers/pci/controller/'. So... I am all ears to listen to
> suggestions for the proper place for this driver. Thomas, do you have
> any thoughts on this?

I tried to put a pci-xtalk driver into drivers/pci/controller, but
Lorenzo didn't want it there for being MIPS and not DT based. So this
one is DT based, but still MIPS. I'm perfectly fine putting this
driver into drivers/pci/controller/

Lorenzo, what's your opinion ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
