Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336727A;
	Thu, 21 Apr 2022 06:07:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80AC8C385A1;
	Thu, 21 Apr 2022 06:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1650521246;
	bh=tJutOd3GoiHApO8x8cRPu2cmW09w1QwvO/Abq1COO+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ogeLoKrBGY5L/ck0iWpcANy9i1We9gG89FtUIdKH6rzaaNFDheCi6DGhU3ZVGrL17
	 vo7HWgrjbh73xbJSdPh5ACxJBTmmh74IUODEsyRVky5omqEE5rlMkYfhqiA4luA7dD
	 UvJWJntkjc7Cl/SLPctM7wL3bKaN20QUwQ47TGQE=
Date: Thu, 21 Apr 2022 08:07:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bruno Moreira-Guedes <codeagain@codeagain.dev>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Bruno's Patch Watchbox <patch-reply@codeagain.dev>
Subject: Re: [PATCH v2 2/3] staging: vme: Add VME_BUS dependency to Kconfig
Message-ID: <YmD0mx+nMsFk4Ohr@kroah.com>
References: <cover.1650321310.git.codeagain@codeagain.dev>
 <00de5644d7c2f8c8878eccf86b761e0602732080.1650321310.git.codeagain@codeagain.dev>
 <20220418233929.zz32dil4u6hbwtqv@AN5Bruno>
 <YmA4ILK5Gv/Gdaso@kroah.com>
 <20220420211258.j23biocryjkuz3qo@AN5Bruno>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420211258.j23biocryjkuz3qo@AN5Bruno>

On Wed, Apr 20, 2022 at 06:12:58PM -0300, Bruno Moreira-Guedes wrote:
> On Wed, Apr 20, 2022 at 06:43:12PM +0200, Greg Kroah-Hartman wrote:
> > On Mon, Apr 18, 2022 at 08:39:29PM -0300, Bruno Moreira-Guedes wrote:
> > > Please, disregard the following message as there's a typo in the prefix.
> > > 
> > > On Mon, Apr 18, 2022 at 08:31:09PM -0300, Bruno Moreira-Guedes wrote:
> > > > The KConfig file for VME_USER ('drivers/staging/vme/devices/Kconfig')
> > > > sourced at "drivers/vme/boards/KConfig" misses a `depends on` line for
> > > > VME_BUS, which is unnoticeable for menuconfig users who aren't be able
> > > > to select it through this interface without setting the CONFIG_VME_BUS
> > > > option because it's nested on VME_BUS menu entry.
> > > ...
> > > >  	  VME windows in a manner at least semi-compatible with the interface
> > > > -- 
> > > > 2.35.3
> > > > 
> > > 
> > > It's already sent a new copy with the proper version number. Nothing's
> > > changed except for the message ID and the v2 typo.
> > 
> > I can't handle 2 v2 of this same commit, our tools get very confused (as
> > do people.)  Would you be able to unwind this if you were in my
> > position?
> I really apologize for this confusion, I really did some mistakes on my
> local branch and had to edit the patches manually to reapply them. While
> working on that I accidentally missed to change the 'v2' to 'v3'. My
> mistake.
> 
> Though, there's no 2 v2s, the new one I sent is a v3 as is the rest of
> this thread. So, would it be necessary to unwind anything anyway? 

Yes, as I don't see a v3 here.  All I see is a mess of commits in a
thread and not a way to easily determine which ones to, and not to,
apply/ignore.

Make it blindingly obvious for me (and everyone else) which is your
latest patch series and which to apply/review.

Remember, some of us get thousands of emails a day to deal with, and
right now I have over 2000 in my review queue to get through.  Making my
life simpler is the best thing if you want your patch to be accepted.

thanks,

greg k-h
