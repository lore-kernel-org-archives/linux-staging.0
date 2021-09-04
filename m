Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A823FC7
	for <linux-staging@lists.linux.dev>; Sat,  4 Sep 2021 06:02:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 914CF60F56;
	Sat,  4 Sep 2021 06:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1630735364;
	bh=B/aAmr7i9D9d5d0flJDn0QxL+DhwEsQ+gPIxl3nLzEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fVRSE4cBj8ErDEndaloJnsH71s5MYGAbL1MbANVyHXjvn2pLBVm+bZoM7Jjk/ORCZ
	 waexWS3LtjLs2dxcNhjkqnWEkRSGkSF9lSn4DFnbcJoaJQuZf/1zEKEYB9ux549/Xf
	 HyVRsWisg5+MrkuhvbfCuNV1u38YdwfQbZKLav3s=
Date: Sat, 4 Sep 2021 08:02:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Krish Jain <krishjain02939@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] Fix formatting for file "hsdma-mt7621.c"
Message-ID: <YTMMAS+veKFAwRi7@kroah.com>
References: <20210902111339.GA577108@panther>
 <YTCU3SpFgyFbxXs3@kroah.com>
 <CAPGkw+xhPfD0acY1GcwPpHg=kHw7o2+y94-r3AxfzsfyqG4bDw@mail.gmail.com>
 <YTJXOFlkLTBTg9rl@kroah.com>
 <CAPGkw+yKQx+O3yfxxMgv9oyH2-pun5-g=+mFWQ_YwbfXp1Y6cA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPGkw+yKQx+O3yfxxMgv9oyH2-pun5-g=+mFWQ_YwbfXp1Y6cA@mail.gmail.com>

On Fri, Sep 03, 2021 at 08:54:33PM +0200, Krish Jain wrote:
> On Fri, Sep 3, 2021 at 7:11 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Sep 03, 2021 at 05:49:46PM +0200, Krish Jain wrote:
> > > On Thu, Sep 2, 2021 at 11:09 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Thu, Sep 02, 2021 at 01:13:39PM +0200, Krish Jain wrote:
> > > > > This patch fixes the format of the code. It properly formats lines that should not end with a '(' as suggested by checkpath.pl.
> > > >
> > > > Please properly line-wrap your changelog text like your editor asked you
> > > > to.
> > > >
> > > > Also, your subject line needs work, look at other commits for this
> > > > driver with:
> > > >         git log --oneline drivers/staging/mt7621-dma/
> > > > and notice how they say the driver name and the subsystem.
> > > >
> > > > Please fix up and resend a v2.
> > > >
> > > > thanks,
> > > >
> > > > greg k-h
> > >
> > > Do you mean I should line-wrap (at 72 columns) the entire thing or
> > > only that line?
> >
> > Your whole changelog text needs to be wrapped at 72 columns.
> >
> > Look at the 'git log' in the kernel tree for hundreds of thousands of
> > examples :)
> >
> > thanks,
> >
> > greg k-h
> 
> Hi, so you mean only the change-log text (as in the text telling what
> changes have been made) needs to be wrapped at 72 columns but the code
> itself (the git diff) doesn't, right ?

Yes, just the text that you add to the commit message.

