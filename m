Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5055E5F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 11:14:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1131461962;
	Wed, 31 Mar 2021 11:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617189261;
	bh=k0yZWqJT03zeDjcD/5nMojYNQZ82/JV3oLUhtiReryQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KM4P8eU3blcP7lf8z4TwhFLzpoOySAqOM/7J3m9CSsXz1Z4zUBmEdUbNGBcbTdYTH
	 p5fDfpRr/bWkuKfLaRuQWn4nX7N4Yn2iIDpxV9eNQVb/4Ybf3sDEwZjqMPDLMfBu0m
	 KBExnA/zODf/4cgTNF0+X919ktsUHjMKJoNilb8Y=
Date: Wed, 31 Mar 2021 13:14:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: dan.carpenter@oracle.com, joe@perches.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/40] staging: rtl8723bs: replace RT_TRACE with public
 printk wrappers in core/rtw_eeprom.c
Message-ID: <YGRZilreNqCdsLCE@kroah.com>
References: <cover.1617183374.git.fabioaiuto83@gmail.com>
 <39c2cd878bc914a00e71ea988c3cacb651670822.1617183374.git.fabioaiuto83@gmail.com>
 <YGROiD19tgF8XnK6@kroah.com>
 <20210331105551.GB1450@agape.jhs>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210331105551.GB1450@agape.jhs>

On Wed, Mar 31, 2021 at 12:55:51PM +0200, Fabio Aiuto wrote:
> On Wed, Mar 31, 2021 at 12:27:20PM +0200, Greg KH wrote:
> > On Wed, Mar 31, 2021 at 11:39:31AM +0200, Fabio Aiuto wrote:
> > > replace private macro RT_TRACE for tracing with in-kernel
> > > pr_* printk wrappers
> > > 
> > > Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> > > ---
> > >  drivers/staging/rtl8723bs/core/rtw_eeprom.c | 26 ++++++++++-----------
> > >  1 file changed, 13 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/drivers/staging/rtl8723bs/core/rtw_eeprom.c b/drivers/staging/rtl8723bs/core/rtw_eeprom.c
> > > index 3cbd65dee741..6176d741d60e 100644
> > > --- a/drivers/staging/rtl8723bs/core/rtw_eeprom.c
> > > +++ b/drivers/staging/rtl8723bs/core/rtw_eeprom.c
> > > @@ -36,7 +36,7 @@ void shift_out_bits(_adapter *padapter, u16 data, u16 count)
> > >  _func_enter_;
> > >  
> > >  	if (padapter->bSurpriseRemoved == true) {
> > > -		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
> > > +		pr_err("%s padapter->bSurpriseRemoved==true", DRIVER_PREFIX);
> > 
> > As Dan said, this is not the same thing.  You are now always printing
> > out this mess, when before you were not unless you explicitly enabled
> > "tracing".
> 
> RT_TRACE is enabled if is defined the symbol DEBUG_RTL871X. It doesn't seem to be related 
> to tracing. DEBUG_RTL871X is never declared, is commented out in rtl8723bs/include/autoconf.h

That's a good sign this is never used and should just all be removed.

> that's why RT_TRACE is never printed. If we try to uncomment the symbol definition we have some
> comiling errors..

What errors do you get?

> > And you are sending it to the error log?
> > 
> > And finally, drivers should never be using pr_*() for messages, they
> > should be using dev_*() instead as they are a driver and have access to
> > a device pointer.
> > 
> > thanks,
> > 
> > greg k-h
> 
> I still wonder what's best...

Just delete them all please, they are obviously not used as no one
rebuilds the source just for this type of thing.

thanks,

greg k-h
