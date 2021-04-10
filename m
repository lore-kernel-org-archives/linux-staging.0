Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E710671
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 08:31:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7CCB610C8;
	Sat, 10 Apr 2021 08:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618043503;
	bh=TLe3b6eYl5WXk+SrGIqyCYCg/bSYEiSQG3SxWxQ8LvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XOWTgARkjElBB5yfl2YiPxa34rMrEFaaSfFy4aj8LQhv51SAGx8kkJnE8Zsw5OIMQ
	 GtjRRgNIG6KKlmq6Xw56aJN5xl+ZAKr1CHYAP1/AqawFIMr+nwsXnozcD5oHroHaEU
	 4FBOy9Ackv95/ZB573PW3fxr9HnEq++B1TyNRpGY=
Date: Sat, 10 Apr 2021 10:31:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mitali Borkar <mitaliborkar810@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [PATCH 0/6] staging: rtl8192e: cleanup patchset for style issues
Message-ID: <YHFibAvRrun6Jk6T@kroah.com>
References: <YHEAnyO11wgp5PNZ@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHEAnyO11wgp5PNZ@kali>

On Sat, Apr 10, 2021 at 07:04:23AM +0530, Mitali Borkar wrote:
> This patches fix the cleanup style issues.
> 
> Mitali Borkar (6):
>   staging: rtl8192e: add spaces around binary operators
>   staging: rtl8192e: remove unnecessary blank line before brace
>   staging: rtl8192e: remove unncessary blank line after brace
>   staging: rtl8192e: matched alignment with open parenthesis
>   staging: rtl8192e: removed multiple blank lines
>   staging: rtl8192e: align statements properly
> 
>  drivers/staging/rtl8192e/rtl819x_HTProc.c | 43 +++++++++--------------
>  drivers/staging/rtl8192e/rtl819x_TSProc.c | 28 +++++++--------
>  2 files changed, 29 insertions(+), 42 deletions(-)

You emails are not threaded properly at all :(

Look at how this showed up on lore.kernel.org:
	https://lore.kernel.org/linux-staging/YHEAnyO11wgp5PNZ@kali/

See, only the first email shows there.

But here is a properly threaded series of patches:
	https://lore.kernel.org/r/161793058309.10062.17056551235139961080.stgit@mickey.themaw.net

Look down at the bottom of the page to see all patches, and the
responses, linked together.

Please use 'git send-email' to send your patches out as it will
correctly thread things if you do not know how to do this "by hand".
And note, "by hand" is hard to do...

I have now dropped all pending patches from you from my queue, please
fix up your two patch series and resend.

thanks,

greg k-h
