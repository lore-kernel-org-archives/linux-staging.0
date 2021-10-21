Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD5468
	for <linux-staging@lists.linux.dev>; Thu, 21 Oct 2021 15:52:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D28C61056;
	Thu, 21 Oct 2021 15:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634831578;
	bh=bT4Y6jm4eIIAGAvmhjb7MfpQRPLShEcQjaUMMUiTuf8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=aUbk1Gij1itRQH9rLJK4kyHFzM17SFGhAGV6izTPivsaOUWRzCJt4p5nhbJ1z50w3
	 D9ZtjjVHHGpKnXJJ6bwkt1/nHxnD3aMCs6NdFTUws5mxwTifJaQ1cAn5RHdBPYq7EI
	 RNh5/oIikuAwTvJ54laZ4fijzcxCFsSuDQsS1Z5laYiSOIvIXgW3MERENqt/dxjO46
	 StkYc+7JwVSqWWpAdXz/P5Rmlg1KuwKmvGwZMg3NkWruQ+cdGXjDwXjBH+uFWzXkvU
	 lpTlch8hLGv93VX90yl+9RgdxYzVst8Lpeb7RFzGUynOoH9rKHTDleHWBm13pF//rE
	 wncyqmFWICb2Q==
Date: Thu, 21 Oct 2021 10:52:56 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: linux-pci@vger.kernel.org,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	john@phrozen.org, neil@brown.name, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, matthias.bgg@gmail.com,
	tsbogend@alpha.franken.de, devicetree@vger.kernel.org,
	bhelgaas@google.com
Subject: Re: [PATCH v3 0/3] PCI: mt7621: Add MediaTek MT7621 PCIe host
 controller driver
Message-ID: <20211021155256.GA2689055@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163473978253.23166.3894301849923362863.b4-ty@arm.com>

On Wed, Oct 20, 2021 at 03:23:45PM +0100, Lorenzo Pieralisi wrote:
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

Since this is a PCIe (not conventional PCI) controller, I vote for
renaming these from:

  PCI_MT7621
  Documentation/devicetree/bindings/pci/mediatek,mt7621-pci.yaml
  drivers/pci/controller/pci-mt7621.c

to:

  PCIE_MT7621
  Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
  drivers/pci/controller/pcie-mt7621.c

We have a mix of these, with many of the early PCIe drivers being
named "pci", but I think that was my mistake and there's no reason to
continue it.

I can do this locally unless somebody objects.
