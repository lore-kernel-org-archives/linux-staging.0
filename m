Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5C22F80
	for <linux-staging@lists.linux.dev>; Mon, 26 Apr 2021 15:11:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2DA86127A;
	Mon, 26 Apr 2021 15:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1619449894;
	bh=mKNVRThB4TR6cTVKU1O3OLaFcmlBF2z0v5DlzX94AGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hYzD/DCgSUokuruvcCebS+W/pAShhtvrukY0mhG+4lNm6BqyK2ITPFyMVWo7zU8bu
	 fglanqjg6kObAKbToMewzwJ/z15pOiD7GD6UKh6e6U+OfbRxe2455d8hxwumcZmXEo
	 XU9plv5OLFTKD4ltO7Qw7dKyc9oRJXE5UmL5qB4A=
Date: Mon, 26 Apr 2021 17:11:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Stephen Rothwell <sfr@rothwell.id.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	devel@linuxdriverproject.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
	ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] Staging/IIO driver updates for 5.13-rc1
Message-ID: <YIbYI2825E4Z2b/3@kroah.com>
References: <YIa2ErYuJyCfSkS+@kroah.com>
 <20210427002648.22459fa7@elm.ozlabs.ibm.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210427002648.22459fa7@elm.ozlabs.ibm.com>

On Tue, Apr 27, 2021 at 12:26:48AM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Mon, 26 Apr 2021 14:46:10 +0200 Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > All of these have been in linux-next for a while with no reported
> > issues.
> 
> There was just these:
> 
> https://lore.kernel.org/linux-next/20210329165525.32d51a3a@canb.auug.org.au/
> 
> https://lore.kernel.org/linux-next/20210331175151.67fcfe4d@canb.auug.org.au/
> 
> (the scmi tree commit mentioned in the latter is now in the arm-soc tree)
> 
> Not issues as such, but worth mentioning the conflicts and resolutions.

Yeah, merge issues with other trees are hard to resolve in the single
tree here, not much I can just yet, have to wait for them to hit Linus's
tree.

thanks,

greg k-h
