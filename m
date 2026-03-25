Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5A23563FB;
	Wed, 25 Mar 2026 09:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429904; cv=none; b=RjofhbCj8SNhbqOgOJN8q9DWeAknuDevfchKWdPAac5YaDItANOyAWLuPpK40oa4+I6g3bGxvswzxPC0U+ZaO2xnIg4+Va0D7o+sXTGGVE8F6YGz1vLReYd/f2UcEcCso9QsBX9EW3+SnukUsFzVvJ9DlzATMhRP9A3U8PkRsE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429904; c=relaxed/simple;
	bh=KRo/hifixlOjYYOcMGXspFc7KnmeMcbnP7utPNyHiQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GgWokszQPmZRhavU0IzTm4FZbZBIouLEKuIsVn/bprXFDB+Zd3/k7BRyQpCd+aSlahkuEzUban3UtU8sk1k3BJU1ejfAmWHJUMXDmhq4lgDh0i9GNny8lxFn0N/Pu059tbie6H9cRYrtoyblWa/v+hedm1T6+gi2IWeV+ZuuaRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aLMvV3C0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aLMvV3C0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B71C2BCB5;
	Wed, 25 Mar 2026 09:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774429904;
	bh=KRo/hifixlOjYYOcMGXspFc7KnmeMcbnP7utPNyHiQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aLMvV3C02LUs+2K5vq7SkwPaFoRlhSwYyUfEnBuSynsvwTmfmhc4qzTcEx0ZzL6H9
	 kWvnDxdrnG+07wxoIgDGbho/fLqG9atX1iSYnwC4iwlq1T9VTBgU7UED8riOnhL1uW
	 Rkq3A4+hwjFlZ8Mxf3WoF8M9/07KCxisj61vGBLo=
Date: Wed, 25 Mar 2026 10:11:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] staging: octeon: ethernet: add pr_fmt macro
Message-ID: <2026032510-shudder-unseated-28b7@gregkh>
References: <20260324133029.82764-1-ayushmukkanwar@gmail.com>
 <20260324133029.82764-4-ayushmukkanwar@gmail.com>
 <2026032445-squad-breeching-23ed@gregkh>
 <CABJ81bhLibj0_VzShMp_n7DCh+zhyHPAn=SV=9Oo8uy_+Kt-EQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABJ81bhLibj0_VzShMp_n7DCh+zhyHPAn=SV=9Oo8uy_+Kt-EQ@mail.gmail.com>

On Wed, Mar 25, 2026 at 02:33:00PM +0530, Ayush Mukkanwar wrote:
> On Tue, Mar 24, 2026 at 7:58 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Mar 24, 2026 at 07:00:29PM +0530, AyushMukkanwar wrote:
> > > Add pr_fmt macro to prefix log messages with the module
> > > name for easier debugging.
> > >
> > > Signed-off-by: AyushMukkanwar <ayushmukkanwar@gmail.com>
> > > ---
> > >  drivers/staging/octeon/ethernet.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
> > > index eadb74fc14c8..5bb8c303f88b 100644
> > > --- a/drivers/staging/octeon/ethernet.c
> > > +++ b/drivers/staging/octeon/ethernet.c
> > > @@ -5,6 +5,7 @@
> > >   * Copyright (c) 2003-2007 Cavium Networks
> > >   */
> > >
> > > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > >  #include <linux/platform_device.h>
> > >  #include <linux/kernel.h>
> > >  #include <linux/module.h>
> > > --
> > > 2.53.0
> > >
> >
> > How about working to remove the existing pr_*() calls with the proper
> > dev_*() and netdev_*() calls instead, so that pr_fmt() is not needed at
> > all?  That is the more "correct" solution here.
> >
> > thanks,
> >
> > greg k-h
> 
> Hi Greg,
> 
> After investigating, the pr_*() calls in ethernet-mem.c and
> ethernet-spi.c are inside functions that only receive hardware pool
> indices or register structs with no net_device or device pointer
> available, so dev_*() and netdev_*() replacements are not possible
> there.
> 
> For ethernet.c, device pointers are available at most call sites and I
> can replace those with dev_err() and netdev_err()/netdev_info()
> appropriately. The two calls where no device pointer is available
> would keep pr_err() as is.

That's a good start, but for the others, work back up the call chain to
properly pass in a device pointer so that these warning/error messages
can get printed out properly.  Drivers should not have any "generic"
messages like that, as it does not show what device actually created the
message.

thanks,

greg k-h
