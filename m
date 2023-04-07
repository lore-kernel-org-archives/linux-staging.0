Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6DCC2C2
	for <linux-staging@lists.linux.dev>; Fri,  7 Apr 2023 08:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06349C433EF;
	Fri,  7 Apr 2023 08:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1680855651;
	bh=pY8rmujzO0oR+GeJw6G9ax311TBg3tU4PHy1rQ5PYJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u1CVJI7YOfl4GFnl4+SklGYzFM0onm33CO94lRNikJ2TzJgqNitXvRK8mmW9OyOcX
	 2ggOXqcoQI0C5BRMNBRLOJy6m41TQtY5Y3sOk2/xASC/FPGpmub+OL6Lvl7DQA5JdM
	 ocX4MZiG/FMTqnec3kpBZYJX1x7yMLiLPAaVWQbo=
Date: Fri, 7 Apr 2023 10:20:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] staging: rtl8192e: Remove unused local variable
 irq_line
Message-ID: <2023040709-activate-debtor-842a@gregkh>
References: <cover.1680729715.git.philipp.g.hortmann@gmail.com>
 <6ec702e12cb30501fc81693a71a96b238bf09ea0.1680729716.git.philipp.g.hortmann@gmail.com>
 <ZC8mR9OjVlEdDMV-@kroah.com>
 <7ce977bb-a5b9-080c-4c27-58c12899759e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ce977bb-a5b9-080c-4c27-58c12899759e@gmail.com>

On Fri, Apr 07, 2023 at 10:08:50AM +0200, Philipp Hortmann wrote:
> On 4/6/23 22:06, Greg Kroah-Hartman wrote:
> > On Wed, Apr 05, 2023 at 11:48:20PM +0200, Philipp Hortmann wrote:
> > > Remove unused local variable irq_line.
> > > 
> > > Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
> > > ---
> > >   drivers/staging/rtl8192e/rtl8192e/rtl_pci.c | 2 --
> > >   1 file changed, 2 deletions(-)
> > > 
> > > diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_pci.c b/drivers/staging/rtl8192e/rtl8192e/rtl_pci.c
> > > index 0bc3e013001e..1c3ccd2aabc3 100644
> > > --- a/drivers/staging/rtl8192e/rtl8192e/rtl_pci.c
> > > +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_pci.c
> > > @@ -33,11 +33,9 @@ bool rtl92e_check_adapter(struct pci_dev *pdev, struct net_device *dev)
> > >   	struct r8192_priv *priv = (struct r8192_priv *)rtllib_priv(dev);
> > >   	u16 device_id;
> > >   	u8  revision_id;
> > > -	u16 irq_line;
> > >   	device_id = pdev->device;
> > >   	revision_id = pdev->revision;
> > > -	pci_read_config_word(pdev, 0x3C, &irq_line);
> > 
> > As was pointed out, that might not be "unused".
> > 
> > When doing a PCI write, the only way to know it has completed is to
> > issue a read.  Are you sure this isn't a read that is flushing out a
> > pending write?  Look at who calls this function and verify that this
> > read really is safe to remove and then document that really really well
> > in the changelog text when doing so.
> > 
> > Be careful about removing seemingly-unused PCI read/writes, they often
> > times are actually needed.
> > 
> > thanks,
> > 
> > greg k-h
> 
> Hi,
> 
> The first function that is called of the driver is: _rtl92e_pci_probe().
> 66 Lines later the function rtl92e_check_adapter() is called. The line
> pci_read_config_word() is the 10th line of this function.
> 
> No other pci function before in function rtl92e_check_adapter().
> 
> The following functions are used in the probe function before the
> rtl92e_check_adapter():
> 
> pci_enable_device()		Does not require a pci read.
> pci_set_master()		Does not require a pci read.
> dma_set_mask()			Does not require a pci read.
> alloc_rtllib()			Does not require a pci read.
> pci_set_drvdata()		Does not require a pci read.
> SET_NETDEV_DEV()		Does not require a pci read.
> rtllib_priv()			Does not require a pci read.
> pci_resource_start()		Does not require a pci read.
> pci_resource_len()		Does not require a pci read.
> pci_resource_flags()		Does not require a pci read.
> request_mem_region()		Does not require a pci read.
> ioremap()			Does not require a pci read.
> pci_resource_len()		Does not require a pci read.
> pci_read_config_byte()		Which is deleted in this
> 				patch series. So Gregs hint is
>  				applicable for this patch as well.
> 
> I am going to issue a v2.

How do you know that this device does not require that register to be
read from in order to work properly?  Remember, reads can change
device's state as well as writes.

thanks,

greg k-h
