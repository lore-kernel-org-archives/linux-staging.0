Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C762F82
	for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 06:22:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0536A610FB;
	Tue, 27 Apr 2021 06:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1619504530;
	bh=gyRZOb++YF8JYaY69vWwYHNhGdItpAOrKimCZDl4mes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qZdLuYmn9kiKr7NHOGuUopAOCVVH3RCLBD08HrgyPV6fYI2eERpGcheCgXGOnZUJq
	 B0iUJDofrajN2dY9TlIfn+BQtd7sNqOaCA5ZB0dyY1hZe/mwdy3zToPnJF6qlUwt0S
	 YrFecd+c+P9tf0qvzfawuyyLxAVcUoMNG8obDn+E=
Date: Tue, 27 Apr 2021 08:22:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Rothwell <sfr@rothwell.id.au>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	devel@linuxdriverproject.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-staging@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
	ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] Staging/IIO driver updates for 5.13-rc1
Message-ID: <YIetjCa11gzUPos7@kroah.com>
References: <YIa2ErYuJyCfSkS+@kroah.com>
 <20210427002648.22459fa7@elm.ozlabs.ibm.com>
 <YIbYI2825E4Z2b/3@kroah.com>
 <CAHk-=wgWLrNQeV20DiCnJVQpfKFkbtC+8=rAqt-wyBFMrHToEw@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgWLrNQeV20DiCnJVQpfKFkbtC+8=rAqt-wyBFMrHToEw@mail.gmail.com>

On Mon, Apr 26, 2021 at 11:18:49AM -0700, Linus Torvalds wrote:
> On Mon, Apr 26, 2021 at 8:11 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > Yeah, merge issues with other trees are hard to resolve in the single
> > tree here, not much I can just yet, have to wait for them to hit Linus's
> > tree.
> 
> It's generally a good idea to mention these things if you know about
> them, just in case the other tree had come in in the meantime and I
> had merged it first.
> 
> That didn't happen this time, and I do generally catch these things
> anyway as long as they at least trigger problems for my usual x86-64
> allmodconfig builds (but not everything does trigger that).

Sorry, will mention it next time when I know it's going to happen with
another tree like this.

Thanks for pulling,

greg k-h
