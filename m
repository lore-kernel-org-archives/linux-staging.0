Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A971F959
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 13:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Z0J5LgVg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F146C433C9;
	Fri,  6 Oct 2023 13:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696598408;
	bh=bkjpF90xs9W6T4GDw1pW54wVAZduRqdmSqenrnKSVcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z0J5LgVgp4BGBGj1lMOMt+xJoI2Ba4Z7PR4IPip5Yn70+NgGSi1U3CbVMzOICe3C6
	 OWTBOcaLvpI1LOPbT9SWpMjRCsNWYvhjbfpKKiNOdNJ/6UV1DvrAddOMfv3lL2N9/5
	 bs+bsMdo/P4OjncA4lCHgwmI8uZ8KKf2e7fx9B1o=
Date: Fri, 6 Oct 2023 15:20:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>
Subject: Re: [PATCH 1/3] staging: greybus: raw: make raw_class constant
Message-ID: <2023100649-oxymoron-entrap-b959@gregkh>
References: <2023100533-broadband-hunk-9e91@gregkh>
 <ZSAHoIN8p2ROXvh/@runicha.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSAHoIN8p2ROXvh/@runicha.com>

On Fri, Oct 06, 2023 at 06:42:00PM +0530, Deepak R Varma wrote:
> On Thu, Oct 05, 2023 at 03:58:34PM +0200, Greg Kroah-Hartman wrote:
> > Now that the driver core allows for struct class to be in read-only
> 
> Hello Greg,
> When you say "Now", has anything changed recently that facilitates this
> improvement?

Yes.  Well, it showed up in the 6.4 kernel, so not that long ago.

> Where can I read more about this change?

Running:
	git log --oneline --author=gregkh v6.3..v6.4 drivers/base/
will show you the some of work that happened here to make this possible.
There was work done to the driver core, and the kobject core in earlier
kernel releases that the changes in 6.4 built on top of.

thanks,

greg k-h
