Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE69872
	for <linux-staging@lists.linux.dev>; Thu,  2 Sep 2021 09:32:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF3C460BD3;
	Thu,  2 Sep 2021 09:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1630575130;
	bh=NHsA+Vy/oUU+BihgEqjE5BmsIRdVjcq6VeyhVk9uTog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kLfZfiH9UxhV2d+y3g+uBHNO1tr7S5P9eNEXKgm4b6zJSlfhcoNJO16Kbv0xzkLzq
	 Mi6ht5i+8rlgapQXFchRLtoFHx1oC5RtQZoP8TCaVY+yGfdDBz/+skmw3ZaVyS/K+7
	 Cz1u+upLcPcMpH4glPLPlk9m9XuSh7dTYrOW2X54=
Date: Thu, 2 Sep 2021 11:32:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Martin Kaiser <martin@kaiser.cx>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Aakash Hemadri <aakashhemadri123@gmail.com>
Subject: Re: [PATCH v5] staging: r8188eu: Remove _enter/_exit_critical_mutex()
Message-ID: <YTCaF5Ure2tjfbZB@kroah.com>
References: <20210828113656.6963-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210828113656.6963-1-fmdefrancesco@gmail.com>

On Sat, Aug 28, 2021 at 01:36:56PM +0200, Fabio M. De Francesco wrote:
> Remove _enter_critical_mutex() and _exit_critical_mutex(). They are
> unnecessary wrappers, respectively to mutex_lock_interruptible() and
> to mutex_unlock(). They also have an odd interface that takes an unused
> argument named pirqL of type unsigned long.
> The original code enters the critical section if the mutex API is
> interrupted while waiting to acquire the lock; therefore it could lead
> to a race condition. Use mutex_lock() because it is uninterruptible and
> so avoid that above-mentioned potential race condition.
> 
> Tested-by: Pavel Skripkin <paskripkin@gmail.com>
> Reviewed-by: Pavel Skripkin <paskripkin@gmail.com>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
> 
> v5: Fix a typo in the subject line. Reported by Aakash Hemadri.
> 
> v4: Tested and reviewed by Pavel Skripkin. No changes to the code.
> 
> v3: Assume that the original authors don't expect that
> mutex_lock_interruptible() can be really interrupted and then lead to 
> a potential race condition. Furthermore, Greg Kroah-Hartman makes me
> notice that "[] one almost never needs interruptable locks in a driver".
> Therefore, replace the calls to mutex_lock_interruptible() with calls to
> mutex_lock() since the latter is uninterruptible and avoid race
> conditions without the necessity to handle -EINTR errors.

Based on a recent conversation on the linux-usb mailing list, perhaps I
was wrong:
	https://lore.kernel.org/r/20210829015825.GA297712@rowland.harvard.edu

Can you check what happens with your change when you disconnect the
device and these code paths are being called?  That is when you do want
the lock interrupted.

Yes, the logic still seems wrong, but I don't want to see the code now
just lock up entirely with this change as it is a change in how things
work from today.

thanks,

greg k-h
