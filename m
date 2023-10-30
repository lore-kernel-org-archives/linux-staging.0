Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97731EEDB
	for <linux-staging@lists.linux.dev>; Mon, 30 Oct 2023 11:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JBpwDEGC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 776A6C433C7;
	Mon, 30 Oct 2023 11:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698665789;
	bh=7yAK+rwOQzdw+geXNCqMzFJ2HV/iis97LNlXDCHcsWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JBpwDEGCa3CXCS4/IW5kQwAJezPYnonLXEUYoLtH8BNXqPSm+/PJ4wVgVfDFT8IHU
	 OfW1k2xvT3btHzQsswaRNQttDTvF5+Y7TR/Gq/X7iUhepa1ivMfcEhgSqeG18FQDo9
	 cV/LueHaq1K31Vo79oO2KoOPdL1slPGhXu1eICaY=
Date: Mon, 30 Oct 2023 12:36:25 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Oliver Crumrine <ozlinux@hotmail.com>, colin.i.king@gmail.com,
	sumitraartsy@gmail.com, u.kleine-koenig@pengutronix.de,
	geert@linux-m68k.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v5 2/6] staging: octeon: remove typedef in enum
 cvmx_helper_interface_mode_t
Message-ID: <2023103003-federal-harvest-c1ae@gregkh>
References: <cover.1693236450.git.ozlinux@hotmail.com>
 <PH7PR11MB7643DEB4401AA83A0578087CBCE0A@PH7PR11MB7643.namprd11.prod.outlook.com>
 <32e9ad3c-191e-4dd1-b1cc-07f7b93c3f28@roeck-us.net>
 <2023103049-daybed-abstain-bad9@gregkh>
 <50cb7891-44ed-4229-b0df-088a701beef5@kadam.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50cb7891-44ed-4229-b0df-088a701beef5@kadam.mountain>

On Mon, Oct 30, 2023 at 02:02:34PM +0300, Dan Carpenter wrote:
> On Mon, Oct 30, 2023 at 07:24:37AM +0100, Greg KH wrote:
> > On Sun, Oct 29, 2023 at 10:17:21AM -0700, Guenter Roeck wrote:
> > > On Mon, Aug 28, 2023 at 11:39:07AM -0400, Oliver Crumrine wrote:
> > > > Remove typedef in enum cvmx_helper_interface_mode_t, and rename all instances
> > > > to cvmx_helper_interface_mode
> > > > 
> > > > Signed-off-by: Oliver Crumrine <ozlinux@hotmail.com>
> > > 
> > > In linux-next:
> > > 
> > > Building mips:cavium_octeon_defconfig ... failed
> > > --------------
> > > Error log:
> > > drivers/staging/octeon/ethernet.c: In function 'cvm_oct_common_get_stats':
> > > drivers/staging/octeon/ethernet.c:204:37: error: storage size of 'rx_status' isn't known
> > >   204 |         struct cvmx_pip_port_status rx_status;
> > >       |                                     ^~~~~~~~~
> > > drivers/staging/octeon/ethernet.c:205:37: error: storage size of 'tx_status' isn't known
> > >   205 |         struct cvmx_pko_port_status tx_status;
> > >       |                                     ^~~~~~~~~
> > > drivers/staging/octeon/ethernet.c:205:37: warning: unused variable 'tx_status' [-Wunused-variable]
> > > drivers/staging/octeon/ethernet.c:204:37: warning: unused variable 'rx_status' [-Wunused-variable]
> > >   204 |         struct cvmx_pip_port_status rx_status;
> > >       |                                     ^~~~~~~~~
> > > drivers/staging/octeon/ethernet.c: In function 'cvm_oct_probe':
> > > drivers/staging/octeon/ethernet.c:801:22: error: variable 'imode' has initializer but incomplete type
> > >   801 |                 enum cvmx_helper_interface_mode imode =
> > >       |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > > drivers/staging/octeon/ethernet.c:801:49: error: storage size of 'imode' isn't known
> > >   801 |                 enum cvmx_helper_interface_mode imode =
> > >       |                                                 ^~~~~
> > > drivers/staging/octeon/ethernet.c:801:49: warning: unused variable 'imode' [-Wunused-variable]
> > > 
> > > Bisect points to this patch. Bisect log attached.
> > > 
> > > As usual, my apologies for the noise if this has already been reported
> > > and/or fixed.
> > 
> > It has not been reported, thanks for it, I'll go revert the offending
> > commits.  And I need to figure out how to build this driver better, I
> > get no build-failures from anyone for it when stuff like this happens,
> > odd...
> 
> We did report it.
> 
> https://lore.kernel.org/all/CA+G9fYvVETLEtiZ=MFRrxgXpmgirVHz-tDOxhU=7_9dtmx7o5g@mail.gmail.com/

Ick, missed that, sorry.

> It only fails for Octeon def_configs.  Just cross compiling on ARM
> isn't enough.  All the stub code is just for compile testing and doesn't
> work...

Ah, that makes more sense.  Sorry for missing this previously.

greg k-h
