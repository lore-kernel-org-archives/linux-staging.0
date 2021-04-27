Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6430A72
	for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 11:07:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14609613BF;
	Tue, 27 Apr 2021 11:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1619521642;
	bh=BRo/eDbvQlGm4UOtynp97IJmtV6Q9jckxoge1aD3P8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jh9JnGp093zCnvaYasdWoryRUgj3/L5MRDmtQuQg+BjWAOQ5OEKlzlzlPzObTz7JH
	 VbDJ1wAQrKlzmrXhiU8SgoM45udYfooPBeyhxbiU1X+pP71xcuOFSxzRHtud+Rj1Yz
	 hgjA3Lg0mDE/PVEvfTG0zXZmwOvFuEt3V2SijFM0=
Date: Tue, 27 Apr 2021 13:07:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] fbtft: Replace custom ->reset() with generic one
Message-ID: <YIfwZ/oPVB9splQq@kroah.com>
References: <20210416142044.17766-1-andriy.shevchenko@linux.intel.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416142044.17766-1-andriy.shevchenko@linux.intel.com>

On Fri, Apr 16, 2021 at 05:20:41PM +0300, Andy Shevchenko wrote:
> The custom ->reset() repeats the generic one, replace it.
> 
> Note, in newer kernels the context of the function is a sleeping one,
> it's fine to switch over to the sleeping functions. Keeping the reset
> line asserted longer than 20 microseconds is also okay, it's an idling
> state of the hardware.
> 
> Fixes: b2ebd4be6fa1 ("staging: fbtft: add fb_agm1264k-fl driver")

What does this "fix"?  A bug or just a "it shouldn't have been done this
way"?

And as others pointed out, if you could put "staging: fbtft:" as a
prefix here, that would be much better.

thanks,

greg k-h
