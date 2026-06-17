Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9DD2C0299;
	Wed, 17 Jun 2026 01:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781659677; cv=none; b=t/aeV9gAkT6uq6TF9rXaE44T5vHyUTfIISqDtvKOGK5oXtnyQq52+snk0SbaRNdHV1k90me/Z0E4w96r1MkSCFQI0sEnqDVAiyA7IZD1NaBc+VgNAAHzN/oLHbCAXvnET+b8yvnSIWU3Whw9RD00T29z8LqVKHgTEXot4MUcWpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781659677; c=relaxed/simple;
	bh=KsNwGT7+8Ngg+uR5N67NRAfoLFqcp70cfb3dvcLGmAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4/QIZEeIYZ8SLv09hfH/OdjZ4nVQO8r8hRXD/YNiJI9nUoaukAoXGI5Duh15wn62yDuvewlNdD5rCXhqUbn3PjLi8b4tpN0Sd1A3y/K846MDe4C2H9B+j/XnnVtJlGX+MVIW/txMFnvlSlXVRJRmdLe9DS5DjFbCm2qIzjqFSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Zycvf357; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Zycvf357"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0D681F000E9;
	Wed, 17 Jun 2026 01:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781659676;
	bh=uzOLb8RKpex4dQcL1+BJaR9ajS8Wk/Ivc2Y0VyVC+zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zycvf357VLvJH0B4zmCtiLK9FjzSmKZ20UkJyLnTs+TEaCm5BTAqwfEFA40YRTw+u
	 02Y6UkMPT0zXjvaGU56oepeY4Gzrcg8v6EhUcRU5odrnh7vEG+PEJmcr6pWC/WI9vO
	 Au+9g5fgSiuMZo2opJ7CPUYCETr3Bm0kIMgZllco=
Date: Wed, 17 Jun 2026 06:56:50 +0530
From: Greg KH <gregkh@linuxfoundation.org>
To: Jack Lee <skunkolee@gmail.com>
Cc: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: uart: replace IDR with XArray
Message-ID: <2026061712-sampling-next-7e5b@gregkh>
References: <20260616190703.28411-1-skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616190703.28411-1-skunkolee@gmail.com>

On Tue, Jun 16, 2026 at 12:07:03PM -0700, Jack Lee wrote:
> DEFINE_IDR is deprecated in favor of XArray. Convert tty_minors
> from IDR to XArray, replacing idr_alloc, idr_find, idr_remove and
> idr_destroy with their xa_alloc, xa_load, xa_erase and xa_destroy
> equivalents.
> 
> Signed-off-by: Jack Lee <skunkolee@gmail.com>
> ---
>  drivers/staging/greybus/uart.c | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
> 

This "cleanup" has come up in the past, and shot down each time as it's
not really needed or necessary.  idr is just fine to use here and xarray
is overkill.

thanks,

greg k-h
