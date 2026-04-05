Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3934136CDE3;
	Sun,  5 Apr 2026 08:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775376177; cv=none; b=OC0+3tajoORzOM68VtcVGdS7ANAlgJQ4eqjQoWH3znQoHtb5wXv+EknHf5GMkzpO2+SDClDTtY0igU3CKskL1tqybH33OOqhDWrinnu+z1MNeT/OLhh7DusCB1RqdDkQeSZqueor1yQssAx1vyxoYiZLqHkmPzw02qpU/pXWKUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775376177; c=relaxed/simple;
	bh=Mjc+wod6i2unKRcvpb1ZfXf2gz3jymK5rHMoqMsdn9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RTBrFSgYWbi5j7Z0C/1bSk1Om8ofXgGLakYys6H1c2YVwfOojLZj2CjwfPGUvRQXiqsblrE4WNKdoyz3OSCFw6kaiq/ol8NRNdNDfvk4Bthld+Z+2m8aG0dcqy4he7ofBrS4VDwcDrWQqbkKfxZrhNmDxn3eCq88inX1vimTZyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Tuy4FvLS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Tuy4FvLS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B888C116C6;
	Sun,  5 Apr 2026 08:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775376176;
	bh=Mjc+wod6i2unKRcvpb1ZfXf2gz3jymK5rHMoqMsdn9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tuy4FvLS82hOG6c8RVsVnAS3+9eICCnu6FElW/5zHIy2/QhsORYNDuL8Qsu7Pf2Jt
	 fqyhXmtn34cxePJRNsFf1cqBzWwHwdKCa9okk5eJRWvznq4KVIuKvBABRlV/JO0JIb
	 ZWt1cB+PdaCL/S4pn4yH8IU5sg6KLi7fwpiVVJBw=
Date: Sun, 5 Apr 2026 10:02:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: octeon: ethernet-spi: replace pr_err
 with dev_err
Message-ID: <2026040531-reverence-caregiver-5581@gregkh>
References: <2026033119-endpoint-jimmy-6b83@gregkh>
 <20260331111757.110703-1-ayushmukkanwar@gmail.com>
 <20260331111757.110703-2-ayushmukkanwar@gmail.com>
 <2026040136-cruncher-massive-992f@gregkh>
 <CABJ81bhbWnH_BjCM4ABSv1aW=EtptxGbgZOGMTcan3=GO6mLCA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABJ81bhbWnH_BjCM4ABSv1aW=EtptxGbgZOGMTcan3=GO6mLCA@mail.gmail.com>

On Sat, Apr 04, 2026 at 02:50:56PM +0530, Ayush Mukkanwar wrote:
> On Wed, Apr 1, 2026 at 3:39 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Mar 31, 2026 at 04:47:56PM +0530, AyushMukkanwar wrote:
> > > Replace pr_err() calls with dev_err() to include device information
> > > in log messages. The device pointer is passed through the interrupt
> > > handler via dev_id, which is changed from &number_spi_ports to
> > > dev->dev.parent in request_irq and free_irq.
> > >
> > > Signed-off-by: AyushMukkanwar <ayushmukkanwar@gmail.com>
> > > ---
> > >  drivers/staging/octeon/ethernet-spi.c | 59 ++++++++++++++-------------
> > >  1 file changed, 30 insertions(+), 29 deletions(-)
> > >
> > > diff --git a/drivers/staging/octeon/ethernet-spi.c b/drivers/staging/octeon/ethernet-spi.c
> > > index 699c98c5ec13..8c02920c3cdc 100644
> > > --- a/drivers/staging/octeon/ethernet-spi.c
> > > +++ b/drivers/staging/octeon/ethernet-spi.c
> > > @@ -17,67 +17,67 @@
> > >  static int number_spi_ports;
> > >  static int need_retrain[2] = { 0, 0 };
> > >
> > > -static void cvm_oct_spxx_int_pr(union cvmx_spxx_int_reg spx_int_reg, int index)
> > > +static void cvm_oct_spxx_int_pr(union cvmx_spxx_int_reg spx_int_reg, int index, struct device *dev)
> >
> > This is ok, but this, but usually the pointer is the first argument.
> > And shouldn't this be a netdev (see below...)
> >
> > > @@ -107,14 +107,15 @@ static irqreturn_t cvm_oct_spi_rml_interrupt(int cpl, void *dev_id)
> > >  {
> > >       irqreturn_t return_status = IRQ_NONE;
> > >       union cvmx_npi_rsl_int_blocks rsl_int_blocks;
> > > +     struct device *dev = dev_id;
> >
> > This isn't ok, the function prototype should really be a pointer, not a
> > void thing.
> >
> > > @@ -196,7 +197,7 @@ int cvm_oct_spi_init(struct net_device *dev)
> > >
> > >       if (number_spi_ports == 0) {
> > >               r = request_irq(OCTEON_IRQ_RML, cvm_oct_spi_rml_interrupt,
> > > -                             IRQF_SHARED, "SPI", &number_spi_ports);
> > > +                             IRQF_SHARED, "SPI", dev->dev.parent);
> >
> > Wait, no, you can't do anything with the parent!
> >
> > This is a netdev, keep it a netdev.  Don't pass it "up" the device
> > heirchary to the device pointer, use the real netdev pointer instead.
> >
> > Also, it seems you didn't test build your changes, what happened?
> >
> > thanks,
> >
> > greg k-h
> 
> Hi Greg,
> 
> I'm preparing v4 of the octeon pr_*() conversion series, broken into
> smaller patches as you requested.
> 
> While converting ethernet-spi.c, I hit a complication with the IRQ
> handler. The SPI code registers a single shared IRQ across all SPI
> ports:
> if (number_spi_ports == 0)
>     request_irq(OCTEON_IRQ_RML, handler, IRQF_SHARED, "SPI", dev_id);
> number_spi_ports++;
> 
> The original code used &number_spi_ports (a static) as dev_id, so
> request_irq and free_irq always matched. But to convert the handler's
> pr_err() calls to netdev_err(), I need to pass a net_device * as
> dev_id.
> 
> The problem is: the first SPI port registers the IRQ, but the last
> port to uninit frees it with a different net_device *, causing a
> dev_id mismatch.
> 
> Additionally, all the error messages in the handler are SPI4 bus-level
> errors (DIP4, calendar parity, FIFO overflow, etc.), not specific to
> any individual port. Would using dev_err() with the platform device be
> acceptable here since the IRQ is registered once for the whole SPI
> subsystem? Or would you prefer a different approach?

Use your best judgement here, it sounds like this driver needs lots of
cleanups!

good luck,

greg k-h
