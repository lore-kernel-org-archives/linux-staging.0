Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06081286D53;
	Wed, 25 Feb 2026 14:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772031306; cv=none; b=bga/mYSOexlJ4/06ixnqdBPqOD3tjX/B16UA3NqpwblDy5bb2KIYZgmakRJQG4zGmqBCvgeWdR6PMla4dUwncO5qXD579w+fFoh2xL3btZ7B6U//dfUSldeqE4mF2EQ6tpLkPGETraFi4Jm9Iy9NYv9zLbg3DO9blKk6W3WQnLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772031306; c=relaxed/simple;
	bh=Iq+488sPXLtSEMOxN2vVRi729aaCiJlx8ka2qPo+XDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kM3lVcbG9jf1ydVqJB3GZjJbTkjJYx7em31LC75t9IYz6N/UfBskVTtQ7LFTc7OPc/lHPEDyIddkd5oB/tPSTzWpM+X8gSh6K49v1XxVsdcwD0ckpV9c/D0EcIzj0lsV0Fli8x09WioVNN5Uflc3ABq1Ivap5hLaw02Dp+O7/KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=e6NWsnXz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="e6NWsnXz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DCE3C116D0;
	Wed, 25 Feb 2026 14:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772031305;
	bh=Iq+488sPXLtSEMOxN2vVRi729aaCiJlx8ka2qPo+XDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e6NWsnXzF4MU57cFoGRsN9geVyXtJRF+Qx1TxNgO7NjZXsi2BSc5ezJwrlu7SiOZh
	 btINj8LzGJVPqqm07S0LvhCAfYS4/p+11lnLOB118SDcxAnU37LwH1PRdE+cnFLaLa
	 qGmKdlZkzUd/tbFzME9WqFxNE3RiK7/8iN88O0ng=
Date: Wed, 25 Feb 2026 06:54:57 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Matvey Oborotov <oborotovmatvey@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Use guard(mutex) in receive_data()
Message-ID: <2026022526-swimmer-gloomy-8f29@gregkh>
References: <20260225103006.295553-1-oborotovmatvey@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225103006.295553-1-oborotovmatvey@gmail.com>

On Wed, Feb 25, 2026 at 03:30:06PM +0500, Matvey Oborotov wrote:
> Replace manual mutex_lock/unlock with guard(mutex) in raw.c
> receive_data(). This automates lock release on function exit, ensures
> that lock is released on early returns, and makes the code cleaner.
> 
> Signed-off-by: Matvey Oborotov <oborotovmatvey@gmail.com>
> ---
>  drivers/staging/greybus/raw.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)

Please only use guard() logic with new code, or if you are fixing a bug.
Making changes like this to existing code is not needed at all, it just
causes unwanted churn for no good reason.

sorry,

greg k-h
