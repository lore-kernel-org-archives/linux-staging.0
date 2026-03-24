Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A232C3FD158;
	Tue, 24 Mar 2026 14:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774362527; cv=none; b=knl1mweTpv6Pb5LOzANYdxz2L+yGDOWNcNLcijKH7bLgekdShbcEe+D2bO1xRMbJJFaxit5J51wZzER3NUWX4wZefJcBICwT0xhAqN5fS0/oj7xRBN+2zsMR8dvq7/0a+lSZMPSZobKi5K8apOlJ8vMO50VImO5rl50H/n7jU+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774362527; c=relaxed/simple;
	bh=dvJo9VPs0lMhv/AxAnX0s0xxzEkL66fWJyY54fYaam8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQtz9psl7wWQwm0OQdMV17cj2rQni6CTjRnLTMKt+S8jspNAH4wnz5/h3sKAr+Iz6KfH/QAdbpYxu1taJiTwuHbD3cxKO/5nJ0Eo+aZSdILJkTof4mqk1T2aJ2O0wIw+xEQuVRn+gFodf/MMLCHPAerTrh6S5PeS6MLAMfb1IzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OJH1qQUD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OJH1qQUD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84726C19424;
	Tue, 24 Mar 2026 14:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774362526;
	bh=dvJo9VPs0lMhv/AxAnX0s0xxzEkL66fWJyY54fYaam8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OJH1qQUDub7Y4tem7wHRfoDMf3m1+qFet7FhjiZ0cxSAxEi0j2g5GeC2rQCCEz6Tu
	 EDmx4KekUvoudKrmISyR9o8FU9GAkgIOUrpDQresKu6/Q5NsEByM4rJFQOJSZTV9wK
	 b6Q/Ichq1YtuFBhaMUqf15rn8D3d47R3tli7Gdro=
Date: Tue, 24 Mar 2026 15:28:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: AyushMukkanwar <ayushmukkanwar@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] staging: octeon: ethernet: add pr_fmt macro
Message-ID: <2026032445-squad-breeching-23ed@gregkh>
References: <20260324133029.82764-1-ayushmukkanwar@gmail.com>
 <20260324133029.82764-4-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324133029.82764-4-ayushmukkanwar@gmail.com>

On Tue, Mar 24, 2026 at 07:00:29PM +0530, AyushMukkanwar wrote:
> Add pr_fmt macro to prefix log messages with the module
> name for easier debugging.
> 
> Signed-off-by: AyushMukkanwar <ayushmukkanwar@gmail.com>
> ---
>  drivers/staging/octeon/ethernet.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
> index eadb74fc14c8..5bb8c303f88b 100644
> --- a/drivers/staging/octeon/ethernet.c
> +++ b/drivers/staging/octeon/ethernet.c
> @@ -5,6 +5,7 @@
>   * Copyright (c) 2003-2007 Cavium Networks
>   */
>  
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  #include <linux/platform_device.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -- 
> 2.53.0
> 

How about working to remove the existing pr_*() calls with the proper
dev_*() and netdev_*() calls instead, so that pr_fmt() is not needed at
all?  That is the more "correct" solution here.

thanks,

greg k-h
