Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB543290A1;
	Mon, 30 Mar 2026 15:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886199; cv=none; b=BPXru58k6aB2gzvMsnBfrDipYDn4MFbGOPpDDb/gWnuyR/FI62ZDVkvHC7hzZnFQ9Lfi2z3RF8almluKLjdrJf53KEJI3hMqAiSKUEvYNb+V+tWZDgxRrBpXYwu5kk+ZcwWL1EVQWygqeT2/woxp2S2krpk/2yXj20/wGq0IjHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886199; c=relaxed/simple;
	bh=WHKVN/d8yWuteMuufnf0mno3DR1PETWdTmsCz38pTwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEuByGvTNbpT/SFthUJAerERQxtMgzQnIjnsm9JnEEVhLeHnMBPanzW2PMP3wc2LHEKxk77Zh3mikzBjPTY1OOEXtpxjf6o310eJNBTZdpX8SVkxlu7sd43aNRmx+N0b1swQNa4QIUPJRi6k3cyKLN7Ihn/DSvap0nxFv+c8MMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QOi+jTVp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QOi+jTVp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD42C19423;
	Mon, 30 Mar 2026 15:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774886199;
	bh=WHKVN/d8yWuteMuufnf0mno3DR1PETWdTmsCz38pTwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QOi+jTVpDW+TKwBKic3eWh6KiWNWqIDKAOKcgbRYfuLO7Lx8HTiFOUmOWDqxZ/IjE
	 fVfhdQMA/z/HwNJs5ScHO2lC7rMUus7NUYfzQSnOsPAeffo5h9hEq71pOxrgMPLn1L
	 Fa7wxc+TlX9Pq/TSrZcUxLm24u2G+3pNRaRD3lLY=
Date: Mon, 30 Mar 2026 17:56:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] staging: octeon: ethernet: add pr_fmt macro
Message-ID: <2026033001-doorframe-reforest-d967@gregkh>
References: <20260324133029.82764-1-ayushmukkanwar@gmail.com>
 <20260324133029.82764-4-ayushmukkanwar@gmail.com>
 <2026032445-squad-breeching-23ed@gregkh>
 <CABJ81bhLibj0_VzShMp_n7DCh+zhyHPAn=SV=9Oo8uy_+Kt-EQ@mail.gmail.com>
 <2026032510-shudder-unseated-28b7@gregkh>
 <CABJ81biO14i_FCxeMCTZkXGofxN+Lvw8H7UmG5v_qLi2CJovGQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABJ81biO14i_FCxeMCTZkXGofxN+Lvw8H7UmG5v_qLi2CJovGQ@mail.gmail.com>

On Thu, Mar 26, 2026 at 12:42:27AM +0530, Ayush Mukkanwar wrote:
> On Wed, Mar 25, 2026 at 2:41 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Mar 25, 2026 at 02:33:00PM +0530, Ayush Mukkanwar wrote:
> > > On Tue, Mar 24, 2026 at 7:58 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Tue, Mar 24, 2026 at 07:00:29PM +0530, AyushMukkanwar wrote:
> > > > > Add pr_fmt macro to prefix log messages with the module
> > > > > name for easier debugging.
> > > > >
> > > > > Signed-off-by: AyushMukkanwar <ayushmukkanwar@gmail.com>
> > > > > ---
> > > > >  drivers/staging/octeon/ethernet.c | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > >
> > > > > diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
> > > > > index eadb74fc14c8..5bb8c303f88b 100644
> > > > > --- a/drivers/staging/octeon/ethernet.c
> > > > > +++ b/drivers/staging/octeon/ethernet.c
> > > > > @@ -5,6 +5,7 @@
> > > > >   * Copyright (c) 2003-2007 Cavium Networks
> > > > >   */
> > > > >
> > > > > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > > > >  #include <linux/platform_device.h>
> > > > >  #include <linux/kernel.h>
> > > > >  #include <linux/module.h>
> > > > > --
> > > > > 2.53.0
> > > > >
> > > >
> > > > How about working to remove the existing pr_*() calls with the proper
> > > > dev_*() and netdev_*() calls instead, so that pr_fmt() is not needed at
> > > > all?  That is the more "correct" solution here.
> > > >
> > > > thanks,
> > > >
> > > > greg k-h
> > >
> > > Hi Greg,
> > >
> > > After investigating, the pr_*() calls in ethernet-mem.c and
> > > ethernet-spi.c are inside functions that only receive hardware pool
> > > indices or register structs with no net_device or device pointer
> > > available, so dev_*() and netdev_*() replacements are not possible
> > > there.
> > >
> > > For ethernet.c, device pointers are available at most call sites and I
> > > can replace those with dev_err() and netdev_err()/netdev_info()
> > > appropriately. The two calls where no device pointer is available
> > > would keep pr_err() as is.
> >
> > That's a good start, but for the others, work back up the call chain to
> > properly pass in a device pointer so that these warning/error messages
> > can get printed out properly.  Drivers should not have any "generic"
> > messages like that, as it does not show what device actually created the
> > message.
> >
> > thanks,
> >
> > greg k-h
> 
> Hi Greg,
> 
> After tracing the call chains, the pr_warn() calls are inside
> ethernet-mem.c. cvm_oct_mem_fill_fpa() which eventually reaches them
> is called from two places:
> 
> 1. ethernet.c via cvm_oct_configure_common_hw(), which is called from
> cvm_oct_probe() - pdev is available here.
> 2. cvm_oct_rx_refill_pool() in ethernet-rx.h, which is called from
> cvm_oct_poll() in ethernet-rx.c - no device pointer is available there
> as it is called by the NAPI subsystem and oct_rx_group has no device
> pointer either.
> 
> Since both call sites share cvm_oct_mem_fill_fpa(), adding a struct
> device * parameter would break the second call site. The FPA pool is
> shared hardware owned by the platform device, so storing &pdev->dev in
> a static global during probe and using that in the mem functions in
> ethernet-mem.c seems like the right approach. This avoids changing any
> function parameters. The same global could also be used for the
> pr_err() calls in ethernet-spi.c, where the interrupt handler has no
> device pointer available either. Would that be acceptable, or is there
> a preferred way to handle this?

Drivers should NEVER have "shared hardware pools", they are always
device specific, so passing in the proper device everywhere is the
correct thing to be doing here.

thanks,

greg k-h
