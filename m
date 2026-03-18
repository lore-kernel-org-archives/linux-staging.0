Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667E83E0C61;
	Wed, 18 Mar 2026 14:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773845470; cv=none; b=EfXsbNzX8p0zjaBN2wQnk5SIXfAgLoC92bVip7VPVoncVdrd9LQrwEqck9Q8wo/4OzKph6qNgTZ1SHj8nGcZvRpfXdGqluZ6QIbMtpEswSKkvrvHy4qsokIoQ95pecxP1EmMslTYa5vLFUdt6qTTPI15P+Ed5SjsOEBZM1q1JLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773845470; c=relaxed/simple;
	bh=YCN8CV2t13vEoHcUdsKcPlTMk3s7yZo+GE/k+hkw9sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfnPiraRoEIdxwkg45j4hwftNyOTzBOw9ZkgqP2cCFp6U94N3jC7rDVv4ZxdcUYzAvbUGJDCUZNZY64QicgWX1B6BpUd2OISLD0R+1RdL9uMqsuk4OhYQeVXwcebhOEHfd3Xs7/Vnt30mhkMnGPqBPkWojS30nZqR/qbsbpynIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UHtwKSf8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UHtwKSf8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E251C19421;
	Wed, 18 Mar 2026 14:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773845469;
	bh=YCN8CV2t13vEoHcUdsKcPlTMk3s7yZo+GE/k+hkw9sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UHtwKSf8iMC0I8lG8ISM1v+z3cl4V+ZmzCgJeAhnirZukxABJq1Y2p/hPVCxp/QpC
	 oJIIKnQHCTSUsfe3O1nU8ufELjM8wcAKUV+o1hrcDy0FN3ThNa/xtFr3GkvkzmNIVh
	 AcQcLjKlqLY4btEnO2sJmNe6BcQH403x7SvR6gaw=
Date: Wed, 18 Mar 2026 15:51:06 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: Oskar Ray-Frayssinet <rayfraytech@gmail.com>, dtwlin@gmail.com,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: replace DEFINE_IDR with
 DEFINE_XARRAY_ALLOC in uart.c
Message-ID: <2026031843-decent-harness-bb3d@gregkh>
References: <20260317211651.8098-1-rayfraytech@gmail.com>
 <2026031859-nest-booted-56ec@gregkh>
 <abq4U39uvJYSfdv7@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abq4U39uvJYSfdv7@hovoldconsulting.com>

On Wed, Mar 18, 2026 at 03:36:03PM +0100, Johan Hovold wrote:
> On Wed, Mar 18, 2026 at 03:20:20PM +0100, Greg Kroah-Hartman wrote:
> > On Tue, Mar 17, 2026 at 10:16:51PM +0100, Oskar Ray-Frayssinet wrote:
> > > Replace deprecated DEFINE_IDR and idr_* functions with the modern
> > > DEFINE_XARRAY_ALLOC and xa_* equivalents in the greybus uart driver.
> > 
> > What tool is causing people to want to do this change that I keep
> > rejecting?  Can you please go and fix it?
> 
> It's checkpatch:
> 
> 	WARNING: Deprecated use of 'DEFINE_IDR', prefer 'DEFINE_XARRAY' instead
> 	#70: FILE: drivers/staging/greybus/uart.c:70:
> 	+static DEFINE_IDR(tty_minors);

Ugh, that should be changed to only trigger that warning on a patch, not
on an existing file.

thanks,

greg k-h
