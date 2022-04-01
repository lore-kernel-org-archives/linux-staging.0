Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09073EBF;
	Fri,  1 Apr 2022 06:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB3AC340EE;
	Fri,  1 Apr 2022 06:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1648793421;
	bh=rozckvYCH6DkysLLr4xlH/qYY4wlewysqNuUHaglUy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TvE+JXsjadyuO6RU/3z5Q/sYwPrHJ7r4p17AoSkNq2lryy4xj0H0uB8gqD4ZRiSBa
	 eb/i7wtl0mm4nnNuTEovIUQADYiGJo+Ormixd7fmpgCcU214wZ56Y+PW3CWJ6AGnTP
	 y+7F27D+Y6DjsqKx1TzeqmghNRazUs4v3X3vaN5c=
Date: Fri, 1 Apr 2022 08:10:14 +0200
From: reg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bruno Moreira-Guedes <codeagain@codeagain.dev>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: vme: Adjusted VME_USER in Kconfig
Message-ID: <YkaXRpIElW1BwKGb@kroah.com>
References: <20220401050045.3686663-1-codeagain@codeagain.dev>
 <YkaW0ThT8Ah3z0wW@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkaW0ThT8Ah3z0wW@kroah.com>

On Fri, Apr 01, 2022 at 08:08:17AM +0200, reg Kroah-Hartman wrote:
> On Fri, Apr 01, 2022 at 02:00:45AM -0300, Bruno Moreira-Guedes wrote:
> > Currently, the VME_USER driver is in the staging tree Kconfig, unlike
> > other VME drivers already moved to the main portions of the kernel tree.
> > Its configuration is, however, nested into the VME_BUS config option,
> > which might be misleading.
> > 
> > Since the staging tree "[...] is used to hold stand-alone[1] drivers and
> > filesystem that are not ready to be merged into the main portion of the
> > Linux kernel tree [...]"[1], IMHO all staging drivers should appear
> > nested into the Main Menu -> Device Drivers -> Staging Drivers to make
> > sure the user don't pick it without being fully aware of its staging
> > status as it could be the case in Menu -> Device Drivers -> VME bridge
> > support (the current location).
> > 
> > With this change menuconfig users will clearly know this is not a driver
> > in the main portion of the kernel tree and decide whether to build it or
> > not with that clearly in mind.
> > 
> > This change goes into the same direction of commit 4b4cdf3979c3
> > ("STAGING: Move staging drivers back to staging-specific menu")
> > 
> > [1] https://lkml.org/lkml/2009/3/18/314
> > 
> > Signed-off-by: Bruno Moreira-Guedes <codeagain@codeagain.dev>
> > ---
> >  drivers/staging/Kconfig | 2 ++
> >  drivers/vme/Kconfig     | 2 --
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
> > index 932acb4e8cbc..0545850eb2ff 100644
> > --- a/drivers/staging/Kconfig
> > +++ b/drivers/staging/Kconfig
> > @@ -88,4 +88,6 @@ source "drivers/staging/qlge/Kconfig"
> >  
> >  source "drivers/staging/wfx/Kconfig"
> >  
> > +source "drivers/staging/vme/devices/Kconfig"
> > +
> >  endif # STAGING
> > diff --git a/drivers/vme/Kconfig b/drivers/vme/Kconfig
> > index 936392ca3c8c..c13dd9d2a604 100644
> > --- a/drivers/vme/Kconfig
> > +++ b/drivers/vme/Kconfig
> > @@ -15,6 +15,4 @@ source "drivers/vme/bridges/Kconfig"
> >  
> >  source "drivers/vme/boards/Kconfig"
> >  
> > -source "drivers/staging/vme/devices/Kconfig"
> > -
> >  endif # VME
> > -- 
> > 2.35.1
> > 
> > 
> 
> The problem with this change is that you just changed the initialization
> order of the drivers if they are built into the kernel.  Are you sure
> that you can initialize a vme device driver before the vme bridge and
> bus code is run?  I don't know if that will work properly, which is why
> the Kconfig entries are in the order they currently are in (we preserved
> the link order.)
> 
> It's not an obvious thing at all, sorry, but build order defines link
> order, which defines the order in which things are initialized in the
> kernel.
> 
> So I can't take this change unless you are able to prove that it still
> works properly on the hardware that these drivers control.  Do you have
> this hardware to test this change with?

Oh wait, it's the Makefile order that controls this, not the Kconfig
order.  Sorry for the noise here, it's still early...

So this change _should_ be fine, but it would be good if you could prove
it still works with some build tests.  How did you test this change?

thanks,

greg k-h
