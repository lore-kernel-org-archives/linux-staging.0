Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6F03FC2
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 10:35:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB9DE61058;
	Thu, 26 Aug 2021 10:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1629974117;
	bh=QaM6O1Y7m4Zhb5o0MZ7+t2h1kPiV9Wz2NzgnOqwG4Q0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wIY9LwK/dFc/gNWnp1ZPngN0x3nzPeLMxser5uFGnSduiSvYkbjZ2agRjNMIW16pU
	 gQ1MMYqazaUbUxgHTSEvKhdNko3QMDY/Di3Oe9odzN1sN9+2WiaOLYZrnqsQvLvFhy
	 oxbndY4vyW0L1R5uHMeHf+IHhxtcP3MkH7eplmoA=
Date: Thu, 26 Aug 2021 12:34:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Saurav Girepunje <saurav.girepunje@gmail.com>,
	Phillip Potter <phil@philpotter.co.uk>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	saurav.girepunje@hotmail.com
Subject: Re: [PATCH] staging: r8188eu: core: remove condition with no effect
Message-ID: <YSduG401BA80Xnsb@kroah.com>
References: <YSFgrLUfXzgcT6k4@user>
 <CAA=Fs0kByg1NztU+Nf__RUzTHuVh_q2hvcyh+3JqXiVgn+_VeQ@mail.gmail.com>
 <1821445.fzUCeO1EU3@localhost.localdomain>
 <YSJEu3sbnR6uIach@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSJEu3sbnR6uIach@kroah.com>

On Sun, Aug 22, 2021 at 02:36:11PM +0200, Greg KH wrote:
> On Sun, Aug 22, 2021 at 01:06:09PM +0200, Fabio M. De Francesco wrote:
> > On Sunday, August 22, 2021 1:58:10 AM CEST Phillip Potter wrote:
> > > On Sat, 21 Aug 2021 at 21:23, Saurav Girepunje
> > > 
> > > <saurav.girepunje@gmail.com> wrote:
> > > > Remove the condition with no effect (if == else) in rtw_led.c
> > > > file.
> > > > 
> > > > Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> > > > ---
> > > > 
> > > >  drivers/staging/r8188eu/core/rtw_led.c | 5 +----
> > > >  1 file changed, 1 insertion(+), 4 deletions(-)
> > > 
> > > Thanks for this, looks good.
> > > 
> > > Acked-by: Phillip Potter <phil@philpotter.co.uk>
> > > 
> > > Regards,
> > > Phil
> > 
> > Dear Philip,
> > 
> > Before acking, please check at least if it applies to the current version of 
> > the tree and check if it compiles without adding warnings and / or errors. :-)
> 
> That is not necessary or needed here, I can do that when I apply the
> patch.

As proof of that, this patch applied just fine to my tree right now...

thanks,

greg k-h
