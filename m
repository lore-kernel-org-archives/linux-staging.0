Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F69C1D6A7
	for <linux-staging@lists.linux.dev>; Wed, 11 Oct 2023 15:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xb6qwA4C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B52FC433C9;
	Wed, 11 Oct 2023 15:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697036996;
	bh=NK7/zcAL72Zfq6YQF/vUxdXthgBdgQPxmKzGhiyQLLU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Xb6qwA4CNigU6EZ/vw5T4xI8CNKktxyPfYHFobP8vYN2PS2b1eMTa9KzZKmWYJkoe
	 pxLr/TfiXbtGtSv4Ny3qNUk0mGT1kUDVTUtoM3aAUACYa8LrGH2Wh9gRXuPsfdyMzu
	 wdGvEANVijWWQy5xhw0vLEI84yrhOKDgZZbu6yvhb6C+GHmDJDZ+3J+YB5MF+JqQvV
	 wdVpy4pJU+N6cQUD6oyaWVmu2nSS7rcfV6qSIHvCQZn3s5SPTNwTl2W4zvbZC+DJnc
	 HPe03ERpdteJ8l7louBWQScthVQJhkzQxtKNd9oPhGB/7XODTLKlchESt+mK7MRLhO
	 Llduy5PyXKIMA==
Date: Wed, 11 Oct 2023 08:09:55 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann
 <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Pavel Machek <pavel@ucw.cz>, "David S. Miller" <davem@davemloft.net>, Larry
 Finger <Larry.Finger@lwfinger.net>, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH] [RFC] wireless: move obsolete drivers to staging
Message-ID: <20231011080955.1beeb010@kernel.org>
In-Reply-To: <87r0m1fwg9.fsf@kernel.org>
References: <20231010155444.858483-1-arnd@kernel.org>
	<2023101051-unmasked-cleaver-79b3@gregkh>
	<87y1g94szz.fsf@kernel.org>
	<2023101139-pyromania-game-2237@gregkh>
	<87r0m1fwg9.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Oct 2023 10:29:58 +0300 Kalle Valo wrote:
> > No matter what the time frame is, it's never going to line up with all
> > distros, or catch everyone properly.  
> 
> Yeah, that's true.
> 
> > I recommend, just delete all the ones you feel are not being used, in a
> > patch that removes them one-by-one, so that it is trivial to revert if
> > someone shows up and says "hey, my device stopped working!" a few years
> > in the future.  
> 
> I'm starting to lean towards this as well. We have talked about this for
> so long now but no practical solution ever found so maybe just bite the
> bullet finally. What do others think?

FWIW in Ethernet we do what Greg says. Delete it, if someone complains
we revert back in. The revert did actually happen once, it was pretty
painless (Greg even took it into stable tree, IIRC).
