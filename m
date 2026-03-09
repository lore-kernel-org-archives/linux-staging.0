Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD483E9585;
	Mon,  9 Mar 2026 16:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773073782; cv=none; b=dvmYDfCHnDwIXWtHN8h2DnxxmVt5bkO2KFJOZ5jRi6sp2VDS5cijNEPJRwgFyiz9FfznGVdBNgbN1+mZlUHx04pgKqXlOkM3Qlp404d1n1Blmgz6jyKeOtUdTznLe9XZZO64IcTT3WfhZ0p/3bZYldEKtKs5Kj0Vkxm5I8pWjqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773073782; c=relaxed/simple;
	bh=is2a1aFG/QgVcGILiKCsuAQiRhzGaaSknqpF+6kY784=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XObkG5BdWJ1S6jUugkPRM5aUPj+S7izBtCz97U6SU96uKRRBDI8U19vfymfLNbtVwsLTuIhtTQDTawhFpX4qd/0veNqlPhEsSLiLiZNIcy7cEOb/q4hVIFjViZV52awHmceFEGGnBfkoedpxl3bB49QEigIqBh/wfaowcWY8ujA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=V76cXByc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="V76cXByc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12893C4CEF7;
	Mon,  9 Mar 2026 16:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773073782;
	bh=is2a1aFG/QgVcGILiKCsuAQiRhzGaaSknqpF+6kY784=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V76cXBycmUmQuW2h6iyUYjMr6cl7ZXo7VewVMXc02h6N3Hxv+hh/xbTogtA+RdpTd
	 AIitJp1VVkDEd4fIBQ5RY7SnhqJlDW2f42VeWM0uC5WbkV3yayES/y37aAmH0bF5uR
	 Y7GToqvxLFrpePe1b2oK2SCX1Kkh5iNAuLr4LCAk=
Date: Mon, 9 Mar 2026 17:29:39 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Add myself as reviewer
Message-ID: <2026030916-debtor-math-44c6@gregkh>
References: <20260304003014.2558653-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304003014.2558653-1-ethantidmore06@gmail.com>

On Tue, Mar 03, 2026 at 06:30:14PM -0600, Ethan Tidmore wrote:
> Create rtl8723bs entry in MAINTAINERS and add myself as the reviewer.
> 
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
> ---
> I've been active reviewing patches in rtl8723bs and would like to become
> the official dedicated reviewer. I've noticed (and Greg mentioned it
> himself) just how many patches have been coming into this driver so
> would be very happy to help with the load.
> 
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 364f0bec8748..05145eb43e7a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25169,6 +25169,13 @@ L:	linux-tegra@vger.kernel.org
>  S:	Maintained
>  F:	drivers/staging/nvec/
>  
> +STAGING - REALTEK WIRELESS DRIVER (rtl8723bs)
> +M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>

I don't want to be a maintainer here :)

> +R:	Ethan Tidmore <ethantidmore06@gmail.com>

Do you have this device to test changes with?

thanks,

greg k-h
