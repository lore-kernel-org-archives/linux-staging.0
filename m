Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F62C6D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 15:30:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28ED061284;
	Wed,  7 Apr 2021 15:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617809436;
	bh=qA1K7GXPgJggIo7yDSDd0shoNwNJAxbUw0JD2TvPcag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UfyzGWNsF1bmdjTOmt5+jEypgyfgMvhFIkBUPZVuqaSPuLIKJIqK6Owskw2/nQYud
	 jDZ9O4GG3VMLuz98vXGXANX7n3EkLxgaTACr/lXmk3CWecq0wlYB0lCEac2tnGAVbf
	 9GSywokjiNUpEh5Nfz7rwuDxndPapF0uPk3upcOg=
Date: Wed, 7 Apr 2021 17:30:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/19] drivers: rtl8723bs: rewrite comparison to null
Message-ID: <YG3QGq0T/cO2kdFN@kroah.com>
References: <cover.1617802415.git.fabioaiuto83@gmail.com>
 <0c6d53c851d1b07eb0183108e0bad7b4f273f04b.1617802415.git.fabioaiuto83@gmail.com>
 <YG3MOCQHu3o/qHTg@kroah.com>
 <20210407152533.GA1590@agape.jhs>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407152533.GA1590@agape.jhs>

On Wed, Apr 07, 2021 at 05:25:34PM +0200, Fabio Aiuto wrote:
> On Wed, Apr 07, 2021 at 05:14:00PM +0200, Greg KH wrote:
> > On Wed, Apr 07, 2021 at 03:49:31PM +0200, Fabio Aiuto wrote:
> > > fix following post-commit hook checkpatch warnings:
> > > 
> > > CHECK: Comparison to NULL could be written "!psta"
> > > 97: FILE: drivers/staging/rtl8723bs/core/rtw_ap.c:2115:
> > > +		if (psta == NULL)
> > > 
> > > Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> > > ---
> > >  drivers/staging/rtl8723bs/core/rtw_ap.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > Nit, your subject line has "drivers:" not "staging:" here.  Be a bit
> > more careful next time please.
> > 
> > thanks,
> > 
> > greg k-h
> 
> sorry, you can drop them off the staging-testing branch and I will resend you all if you want,

Nah, it's not worth it, I'll keep them for now :)
