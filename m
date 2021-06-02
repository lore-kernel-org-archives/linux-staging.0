Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A1470
	for <linux-staging@lists.linux.dev>; Wed,  2 Jun 2021 18:01:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F036560FF3;
	Wed,  2 Jun 2021 18:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1622656901;
	bh=SKuMrIYNE1VEZvOpdodYaPRNRoFOigHauVhNGxi/FAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MkhCEoxk2oQcOG+JoOnIUKuAgxKTULnaYc6+Hu0x2hmH64I5gd0I46LpRqeV2KC1N
	 3tJaNBK8UJqQXlf+tzU2Zwb2bC50hoFXaeiU8fJ6I3hiOZfnijrgOv/a6VPrLjsByo
	 E380m7DiGo2rkZiL1Q3pT24oY1d+Ym2h5l2LSABI=
Date: Wed, 2 Jun 2021 20:01:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Manikishan Ghantasala <manikishanghantasala@gmail.com>
Cc: Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192u: fix coding-style issues in r8192U_hw.h
Message-ID: <YLfHgqPYKc/6YtCo@kroah.com>
References: <20210602160333.62163-1-manikishanghantasala@gmail.com>
 <YLe8psfQLCb5bn2W@kroah.com>
 <CAKzJ-FNm-uYoSFvMmNjAtsXmOQ-_P=o3JhpZhzk0tuuNRDTB9Q@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKzJ-FNm-uYoSFvMmNjAtsXmOQ-_P=o3JhpZhzk0tuuNRDTB9Q@mail.gmail.com>

On Wed, Jun 02, 2021 at 11:04:53PM +0530, Manikishan Ghantasala wrote:
> On Wed, 2 Jun 2021 at 22:45, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Jun 02, 2021 at 09:33:31PM +0530, Manikishan Ghantasala wrote:
> > > staging: rtl8192u: r8192U_hw.h: Clear the coding-style issue
> >
> > Why is this line here?
> >
> Added it as description and I put a break due to char limit.

Is that what existing patches for this driver looks like?

> > >
> > > "Macros with complex values should be enclosed in parentheses"
> > > by enclosing values in parantheses.
> >
> > I can not understand this sentence, can you please reword it?
> >
> I meant, I cleared(fixed) the error in quotes by enclosing them in parentheses.

Please describe this better in the changelog text.

> > > Modified spacing around "|" and removed a space before tab.
> >
> > This is not related to the first thing, please break this up into
> > multiple patches like the bot asked...
> >
> Okay, will do. Do I have to make one for the 'space before tab' too?
> or can I ignore it?

One patch per logical type of change.

thanks,

greg k-h
