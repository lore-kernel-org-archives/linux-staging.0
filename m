Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252352F82
	for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 14:03:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 063CD61001;
	Tue, 27 Apr 2021 14:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1619532187;
	bh=/oRC6bU/WlpKeL0v44CHbiXsIRtQhAw5FoWqv7sbxi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=y0whrowBP4F3bTfk9npzU6Qub6BIsl7Y0U3P8/e4EjxyHrUqoYVyrbrCFXdEbyaLS
	 7e6o58/riAmhZkpGSKxvwo2FsImDCNEBJw9NrVrHdpOi3QrPrMbC42czl1l/XPjZYe
	 S8IF09ipjqT1Igu3cBUjPS85xBFgdmP2w9NnOXwg=
Date: Tue, 27 Apr 2021 16:03:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: joe@perches.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 50/50] staging: rtl8723bs: macro DRIVER_PREFIX expands
 to lowercase driver name
Message-ID: <YIgZmPf9JckEyEpI@kroah.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
 <c986e9a3c9b2f73cb784bd5dc7c877eb9a669c89.1619254603.git.fabioaiuto83@gmail.com>
 <YIfvqU2bEpDSj/hK@kroah.com>
 <20210427124134.GA1399@agape.jhs>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210427124134.GA1399@agape.jhs>

On Tue, Apr 27, 2021 at 02:41:35PM +0200, Fabio Aiuto wrote:
> On Tue, Apr 27, 2021 at 01:04:09PM +0200, Greg KH wrote:
> > On Sat, Apr 24, 2021 at 11:02:33AM +0200, Fabio Aiuto wrote:
> > > macro DRIVER_PREFIX expands to lowercase driver name.
> > > 
> > > Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> > > ---
> > >  drivers/staging/rtl8723bs/include/rtw_debug.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
> > > index 189f02a8300a..3a5b083e95a1 100644
> > > --- a/drivers/staging/rtl8723bs/include/rtw_debug.h
> > > +++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
> > > @@ -7,7 +7,7 @@
> > >  #ifndef __RTW_DEBUG_H__
> > >  #define __RTW_DEBUG_H__
> > >  
> > > -#define DRIVER_PREFIX "RTL8723BS: "
> > > +#define DRIVER_PREFIX "rtl8723bs: "
> > 
> > KBUILD_MODNAME should be used here, in the future.
> 
> ok, got it
> 
> > 
> > But really, this shouldn't be needed at all, it's kind of pointless (if
> > it is being used, then odds are the places it is being used is wrong...)
> > 
> > thanks,
> > 
> > greg k-h
> 
> fabio@agape:~/src/git/kernels/staging$ grep -r DRIVER_PREFIX drivers/staging/rtl8723bs/
> drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c:	print_hex_dump_debug(DRIVER_PREFIX ": u1H2CRsvdPageParm:", DUMP_PREFIX_NONE,
> drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c:	print_hex_dump_debug(DRIVER_PREFIX ": u1H2CMediaStatusRptParm:", DUMP_PREFIX_NONE,
> drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c:	print_hex_dump_debug(DRIVER_PREFIX ": u1H2CMacIdConfigParm:", DUMP_PREFIX_NONE,
> drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c:	print_hex_dump_debug(DRIVER_PREFIX ": u1H2CRssiSettingParm:", DUMP_PREFIX_NONE,
> drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c:	print_hex_dump_debug(DRIVER_PREFIX ": u1H2CPwrModeParm:", DUMP_PREFIX_NONE,
> drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c:	print_hex_dump_debug(DRIVER_PREFIX ": u1H2CPsTuneParm:", DUMP_PREFIX_NONE,
> drivers/staging/rtl8723bs/hal/hal_com.c:	print_hex_dump_debug(DRIVER_PREFIX ": c2h_evt_read(): ", DUMP_PREFIX_NONE,
> drivers/staging/rtl8723bs/hal/hal_com.c:	print_hex_dump_debug(DRIVER_PREFIX ": c2h_evt_read(): Command Content:\n",
> drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:	print_hex_dump_debug(DRIVER_PREFIX ": C2HPacketHandler_8723B(): Command Content:\n",

Drivers should not be dumping hex data like this to the kernel log, I
bet they can all be removed :)

thanks,

greg k-h
