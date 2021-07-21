Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8934072
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 13:41:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 83D5761009;
	Wed, 21 Jul 2021 13:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1626874897;
	bh=ZGoMxe1/VcyNXlGvcY4bmbDC8HJPb6UK19kcCoN8BDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XSl058OctuCwDRDENsFafDMlZnQ6s1YC0H8RKdktRsWke634V3m92EEzWObP0X16a
	 cOdbiDSVbVBsgKv3UFLiH2qVa+iZ2Qtqz4lF+++/eh9GezFosIQMWa7G7wiGx+Lmh8
	 tejBpkC5QT6iyQdiMd6d5oKTXcEpqzRU64AGvzNE=
Date: Wed, 21 Jul 2021 15:41:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8188eu: core: Remove set but unused variable
Message-ID: <YPgkDnqSKGUaej5i@kroah.com>
References: <20210701154647.18975-1-fmdefrancesco@gmail.com>
 <YPfYWk5afrgGecDR@kroah.com>
 <2206478.VjXv8tfObp@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2206478.VjXv8tfObp@localhost.localdomain>

On Wed, Jul 21, 2021 at 03:35:18PM +0200, Fabio M. De Francesco wrote:
> On Wednesday, July 21, 2021 10:18:34 AM CEST Greg Kroah-Hartman wrote:
> > On Thu, Jul 01, 2021 at 05:46:47PM +0200, Fabio M. De Francesco wrote:
> > > Remove variable sec_idx because is set but unused. Issue detected by
> > > GCC with -Wunused-variable.
> > > 
> > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > ---
> > > 
> > >  drivers/staging/rtl8188eu/core/rtw_ieee80211.c | 4 +---
> > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > Does not apply to my tree :(
> >
> Your tree changed while my patch was expecting your review. This happened 
> because someone else worked on the same code while 
> "the development tree you have sent a patch for is "closed"
> due to the timing of the merge window".
> 
> Unfortunately,  I was unaware of a similar patch in your queue because I 
> didn't notice that it was sent to the linux-staging list a few days before 
> mine.
> 
> This is not the first time that something like this happens, so I think it's 
> better to not work and send patches while you keep the development tree 
> closed.

The only time it is "closed" is during the merge window.  No need to
stop doing work during then, it's easy to rebase and resend if there are
ever problems.

thanks,

greg k-h
