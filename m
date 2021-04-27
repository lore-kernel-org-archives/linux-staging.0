Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7784371
	for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 18:09:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D4E760FDC;
	Tue, 27 Apr 2021 18:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1619546986;
	bh=A2/WCFmcB4YcVkQg4351PRfU64Y/d3EZ0rzxaDaOmVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g1kyynzTD4aEdm5ElfOvPoljDveCa8L1RwNsZrCaxZZoRPnZDfm1nzuLAmg48B7Sa
	 b8LE1n4QgiEa8A5R/O/nr6d8fN4jMPcTDpqFfqfio64TthpbT99chvKYSoMyWGpmuE
	 DvqEGHNIguGE98rDbL/Abc822aF6wyGmJ303c4FA=
Date: Tue, 27 Apr 2021 20:09:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Iain Craig <coldcity@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: mt7621-pci: fix a multiple assignment code
 style issue
Message-ID: <YIhTZ2lezb485iFp@kroah.com>
References: <20210427174719.GA14124@ubuntu>
 <CAMhs-H_jfdTV4JYD+_Xy+1w452AjjAut-jjFhEt+GmLjTw8+8A@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMhs-H_jfdTV4JYD+_Xy+1w452AjjAut-jjFhEt+GmLjTw8+8A@mail.gmail.com>

On Tue, Apr 27, 2021 at 07:55:30PM +0200, Sergio Paracuellos wrote:
> Hi Iain.
> 
> On Tue, Apr 27, 2021 at 7:47 PM Iain Craig <coldcity@gmail.com> wrote:
> >
> > avoid multiple assignments while setting pcie->io members to NULL.
> >
> > Signed-off-by: Iain Craig <coldcity@gmail.com>
> > ---
> >  drivers/staging/mt7621-pci/pci-mt7621.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
> > index 115250115f10..f3b5b8ac03b5 100644
> > --- a/drivers/staging/mt7621-pci/pci-mt7621.c
> > +++ b/drivers/staging/mt7621-pci/pci-mt7621.c
> > @@ -306,7 +306,9 @@ static int mt7621_pci_parse_request_of_pci_ranges(struct pci_host_bridge *host)
> >          * resource manually instead.
> >          */
> >         pcie->io.name = node->full_name;
> > -       pcie->io.parent = pcie->io.child = pcie->io.sibling = NULL;
> > +       pcie->io.parent = NULL;
> > +       pcie->io.child = NULL;
> > +       pcie->io.sibling = NULL;
> 
> In this particular case I think the original code is correct as it is.
> Also this is the style used around different kernel places to assign
> these fields.

THe original is fine.

thanks,

greg k-h
