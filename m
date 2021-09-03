Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E666672
	for <linux-staging@lists.linux.dev>; Fri,  3 Sep 2021 17:11:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0FA8060F3A;
	Fri,  3 Sep 2021 17:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1630689083;
	bh=rcdZIR1F5GTC+dEhx46SBgFcH8TKU9foH8PLC7wQ+gA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YcOsLXaIZ9lPN5sxAbGqhvIKZU7YuPxu+PsEbz1IBOwbi6PnyKqJUGrM5ae0IHy32
	 Q1gqqon68tR2P5caQlBbevDqPwyN9OHUB8LWTigdB3QT0wvX3hlFxiLM0gcf/UL0HU
	 r7oU+wMucolTm54r3NYRnH9EjOlPapTi2aqufGEU=
Date: Fri, 3 Sep 2021 19:11:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Krish Jain <krishjain02939@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] Fix formatting for file "hsdma-mt7621.c"
Message-ID: <YTJXOFlkLTBTg9rl@kroah.com>
References: <20210902111339.GA577108@panther>
 <YTCU3SpFgyFbxXs3@kroah.com>
 <CAPGkw+xhPfD0acY1GcwPpHg=kHw7o2+y94-r3AxfzsfyqG4bDw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPGkw+xhPfD0acY1GcwPpHg=kHw7o2+y94-r3AxfzsfyqG4bDw@mail.gmail.com>

On Fri, Sep 03, 2021 at 05:49:46PM +0200, Krish Jain wrote:
> On Thu, Sep 2, 2021 at 11:09 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Sep 02, 2021 at 01:13:39PM +0200, Krish Jain wrote:
> > > This patch fixes the format of the code. It properly formats lines that should not end with a '(' as suggested by checkpath.pl.
> >
> > Please properly line-wrap your changelog text like your editor asked you
> > to.
> >
> > Also, your subject line needs work, look at other commits for this
> > driver with:
> >         git log --oneline drivers/staging/mt7621-dma/
> > and notice how they say the driver name and the subsystem.
> >
> > Please fix up and resend a v2.
> >
> > thanks,
> >
> > greg k-h
> 
> Do you mean I should line-wrap (at 72 columns) the entire thing or
> only that line?

Your whole changelog text needs to be wrapped at 72 columns.

Look at the 'git log' in the kernel tree for hundreds of thousands of
examples :)

thanks,

greg k-h
