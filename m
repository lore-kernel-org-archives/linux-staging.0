Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0704F473A
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 09:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790846392; cv=none; b=iSLDe4faO7OgldIodLfB3TTRmH5MGJPFo8u1DpgPFrTthYey53UbREvgBhzlR688vxBl/wWWVRL1Ps4RsMex020nFx5ZI5oO/hJYjQBOqCLvR95rEPLZXoAgTG9IU5dtuLaxhfXKasG8Ox+op0GhJEq6talMfA544TNGhzdUMIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790846392; c=relaxed/simple;
	bh=am6KVHeUXu27/oaA8MiPFu1mTY1R0QjGIi5ebQdj/WM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLw0RjJASP7x0NOqddhBQDzcQkXVa11ke+miGVEtZEWP0wlHDfkB38+fV/rJHq111GyIJsvCEQ0wRzHYmTYg7jjDOF/dJ3HgqPqJi8LtWSB+h0lVwdjz16dz9bQeYQN7faypfLgARVAO/lV7pAOA+SYDX22hSaqNqXEqypOQ45I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xxhwpJFO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xxhwpJFO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2906D1F000FF;
	Thu,  1 Oct 2026 09:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790846390;
	bh=t/u4ezamwsp6AskizgcClkPG6spQruG1cfmxIff3zLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=xxhwpJFOAgBN9zP41so5a76lJH2a92Yz27h8kv29NHK+e1JaXXtGLfgO65IhYNjMz
	 o9PQvTmRtWovnJR/pvCW1hUvcBUs5wsuZgBtXv3xejDF5hsNxOSXRk9Eohczt0zyY0
	 YIzYe9cxXo/0fw/4G2LKdA3I/29yetWqZCtTeFzI=
Date: Thu, 1 Oct 2026 11:19:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Namjae Jeon <linkinjeon@kernel.org>,
	Hisam Mehboob <hisamshar@gmail.com>,
	Martin =?utf-8?Q?Kepplinger-Novakovi=C4=87?= <martink@posteo.de>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	Agatha Isabelle Moreira <code@agatha.dev>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>
Subject: Re: [PATCH v2] staging: greybus: remove driver depending on
 nonexistent config option
Message-ID: <2026100125-puppy-pacific-52c6@gregkh>
References: <20260915020308.83636-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915020308.83636-1-enelsonmoore@gmail.com>

On Mon, Sep 14, 2026 at 07:02:59PM -0700, Ethan Nelson-Moore wrote:
> The Greybus Arche Platform driver depends on the config options
> USB_HSIC_USB3613 or COMPILE_TEST. USB_HSIC_USB3613 has never existed in
> mainline Linux, and COMPILE_TEST is intended to enable the compilation
> of drivers on platforms that can't support them to improve code
> coverage and ease testing of trivial or tree-wide changes. Therefore,
> it is impossible for anyone to be using this driver with unmodified
> mainline kernels. Remove it and move the former maintainer to the
> CREDITS file.
> 
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
> Changes in v2: Clarify commit message - mention COMPILE_TEST
> 
>  CREDITS                                  |   4 +
>  MAINTAINERS                              |   7 -
>  drivers/staging/greybus/Kconfig          |   9 -
>  drivers/staging/greybus/Makefile         |   6 -
>  drivers/staging/greybus/arche-apb-ctrl.c | 490 -----------------
>  drivers/staging/greybus/arche-platform.c | 653 -----------------------
>  drivers/staging/greybus/arche_platform.h |  28 -
>  7 files changed, 4 insertions(+), 1193 deletions(-)
>  delete mode 100644 drivers/staging/greybus/arche-apb-ctrl.c
>  delete mode 100644 drivers/staging/greybus/arche-platform.c
>  delete mode 100644 drivers/staging/greybus/arche_platform.h

Yeah, it's time to finally drop this.  If it's needed in the future, it
can come back with a simple revert.

thanks,

greg k-h
