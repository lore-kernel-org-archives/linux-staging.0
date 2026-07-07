Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BA036165E;
	Tue,  7 Jul 2026 09:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416126; cv=none; b=djppQnrqCkf2gXIqipugvg8O3pEkdId+Z0sqrK0GN0ojWVlRFkE1bFg/bcSiq8BSgP8srugGXnEBVwKHeNJ1hoeWe12R1JgjgYynHKC6zlED6/w1mRh4fg9QsWnSHcp5uyKMX/bLh6VGbqMDHmS8QXZo7hpBg/iUNSRG1VDeOHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416126; c=relaxed/simple;
	bh=/aNuFGz0dnec1AxcN601eUnpdGA4U/E9bWbTv3t9mKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WEPohnnLFBRFwM4dqvvBATodN9THte4jFMm6s0Aa+DifBWkDbEHW+Rpp2qRRyOSmSZglh/+jnGes/5HC3q0QULigg8g4lhFWHFRwdKbgTCKJQppKjvis2VI152TrZqt8/VKo4kc2yeEnmCdq/wm/fh/2CMSQb0GC32Lf7M7/G2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Zu7370Ha; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Zu7370Ha"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427AE1F000E9;
	Tue,  7 Jul 2026 09:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783416124;
	bh=d0tdFDNQaSAQCNO9sLBayuwU1W/+ANnelEyKT9/lukE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zu7370HaV9xbSoLHZSOryn/D6vAvPuSTAGZx+6OdFuPCflc97nrYhcI1W9wQMp/uo
	 iSkbw/GuTQbzWsj45wrH4UY6a4KG8e8xqW8M5v0MoAFiDn0IlQDI7WrcW18Ob7bfV9
	 75UmwKTXzACHIoJ38n4Sp2tERROB+h2fw8jHQdsQ=
Date: Tue, 7 Jul 2026 11:22:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ruziev Miraly <miraly.dev@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fbtft-bus: remove trailing space in
 macro calls
Message-ID: <2026070745-scallop-counting-b368@gregkh>
References: <20260701104205.41222-1-miraly.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701104205.41222-1-miraly.dev@gmail.com>

On Wed, Jul 01, 2026 at 03:42:05PM +0500, Ruziev Miraly wrote:
> Remove prohibited trailing spaces before closing parentheses in
> define_fbtft_write_reg() macro invocations to fix checkpatch errors.
> 
> Signed-off-by: Ruziev Miraly <miraly.dev@gmail.com>
> ---
>  drivers/staging/fbtft/fbtft-bus.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
> index 30e436ff1..409770891 100644
> --- a/drivers/staging/fbtft/fbtft-bus.c
> +++ b/drivers/staging/fbtft/fbtft-bus.c
> @@ -62,9 +62,9 @@ out:									      \
>  }                                                                             \
>  EXPORT_SYMBOL(func);
>  
> -define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
> +define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
>  define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
> -define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
> +define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
>  
>  void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
>  {
> -- 
> 2.54.0
> 

This is not correct, the original code is correct.

thanks,

greg k-h
