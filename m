Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0C96D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 15:15:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E26E61262;
	Wed,  7 Apr 2021 15:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617808544;
	bh=ILkNXIt2AR6usEDfkpNuhK5euzJc8sahoo/4wGXrSms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C4rEWM3O4lEYD1k+pCLeFgfyhxQAYTvXhL9GK20RG4dj8i+xd5ErvuFhtjhad30yW
	 sBr2T5Yc86BEpPFAS043MyCqHejacdzQ3rG7F6XI65qr+x1JhjYnyRx4JPmfvUuChb
	 GWf7sZ0LnElI0yXBHztvixlHhcIh3SOYeOGCrZc4=
Date: Wed, 7 Apr 2021 17:15:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Barney Goette <barneygoette@gmail.com>
Cc: "arve@android.com" <arve@android.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Subject: Re: [PATCH] Staging: android: ashmem: Fixed a const coding styleissue
Message-ID: <YG3MnqfgDutxAF6p@kroah.com>
References: <20210407143502.3414-1-barneygoette@gmail.com>
 <YG3GLQA1O3b0w0RY@kroah.com>
 <606dcaee.1c69fb81.df22.7ca0@mx.google.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <606dcaee.1c69fb81.df22.7ca0@mx.google.com>

On Wed, Apr 07, 2021 at 10:08:31AM -0500, Barney Goette wrote:
> Sorry. 
> 
> I was following the Kernel First Patch tutorial and I didn’t quite
> understand how to build a driver that was for Android while on a
> desktop.

Where you build the kernel does not matter, how do you think Android
kernels get built?  Not on the device itself :)

Please be more careful, you can not break the build for obvious reasons.

thanks,

greg k-h
