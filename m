Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FDA6E
	for <linux-staging@lists.linux.dev>; Tue, 23 Mar 2021 07:15:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BFE7A61994;
	Tue, 23 Mar 2021 07:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1616483738;
	bh=0i7TqhkHF4mlHlf0SjNTiB3Qm2dBoZPoY4C2x1Yq7K0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l6KRwHPZV8p2PWFo7E/dh0qZ+7qzCy6L7HQSOnIoARvbFZ4A3kcrEZCUAg26EyXTC
	 yrDbS44kNSjNa9uJVVrBkX4f+7lg6iadz9VdtK2+HO6OKBK4oJROQcZDkUVVp2JiJd
	 29pQ6bPCx6twnodQ7+JUUTbZcD9AJn1TSQGACToA=
Date: Tue, 23 Mar 2021 08:15:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc: Marco Cesati <marcocesati@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Ross Schmidt <ross.schm.dev@gmail.com>, fabioaiuto83@gmail.com,
	linux-staging@lists.linux.dev
Subject: Re: Question about rtl8723bs
Message-ID: <YFmVlyhaO46b4a07@kroah.com>
References: <CAOc6etYY0yhsdQv+nM3aPxs9ahaEDd=h+vXAesdi65=SiQZ3eA@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOc6etYY0yhsdQv+nM3aPxs9ahaEDd=h+vXAesdi65=SiQZ3eA@mail.gmail.com>

On Mon, Mar 22, 2021 at 08:40:11PM -0600, Edmundo Carmona Antoranz wrote:
> Hi!
> 
> I was just trying to correct some compiler warnings coming up when
> building this driver. The one problem that took me into kind of a
> rabbit whole was about having K (in rtw_security.h) set as static. So,
> every time it is included somewhere _and_ K is not being used, the
> compiler is nagging about it. Ok.... easy fix, let's remove the static
> keyword and we should be fine. Then I took a look at _where_ it was
> being used.... well, nowhere.... so, ok, let's get rid of it.... oh,
> here are these macros... are they in use? Actually _they are not_....
> let's remove them also.... (I don't know if you are noticing a pattern
> here) then I noticed that _a lot_ of code has been removed recently
> and so I pulled the big guns and cleaned up the file and started to
> add things back as they were being used in the build process.... in
> the end, around 80 lines are gone (give or take) if working on top of
> next, at least.
> 
> Is it a good idea to send a patch with all of these things removed or
> they might be coming back later and so they should be kept?

No need to keep anything that is not being used.

If it is needed, it can always be brought back at a later time.

thanks,

greg k-h
