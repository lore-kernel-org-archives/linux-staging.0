Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFB970
	for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 18:00:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F5FE6100A;
	Thu, 20 May 2021 18:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1621533649;
	bh=mVnDGgo84rltStTe6qWC9wFPh9rBe38XIaiFuc6M2tI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rH7GYEQdN0UV4tCNEGk5ci1eVo67dyHvWSMkwWhu6em0+V4qfutC8HBoAuKmnbWIO
	 vHodrxI13FvfkvlSbPf1c/gXS/zpaJsWyVi2DEIQbhlE+Q0/I19GtxSx3iVLievN6l
	 hV27vpxI2JvPHVT2LtFqtxwDZ6R9e8chTwC16+ks=
Date: Thu, 20 May 2021 20:00:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hriday Hegde <hridayhegde1999@gmail.com>
Cc: Alex Dewar <alex.dewar90@gmail.com>, Sean Behan <codebam@riseup.net>,
	Colin Ian King <colin.king@canonical.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: emxx_udc: Fixed coding style in places where
 lines should not end in '('
Message-ID: <YKajzaK98SvKfbkm@kroah.com>
References: <20210520174701.8370-1-hridayhegde1999@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210520174701.8370-1-hridayhegde1999@gmail.com>

On Thu, May 20, 2021 at 10:46:57AM -0700, Hriday Hegde wrote:
> The fixes were for the following checkpatch outputs:
> 
> CHECK: Lines should not end with a '('
> 1076: FILE: drivers/staging/emxx_udc/emxx_udc.c:1076:
> +				_nbu2ss_writel(
> 
> CHECK: Lines should not end with a '('
> 1228: FILE: drivers/staging/emxx_udc/emxx_udc.c:1228:
> +		length = _nbu2ss_readl(
> 
> CHECK: Lines should not end with a '('
> 1465: FILE: drivers/staging/emxx_udc/emxx_udc.c:1465:
> +			regdata = _nbu2ss_readl(
> 
> Signed-off-by: Hriday Hegde <hridayhegde1999@gmail.com>
> ---
>  drivers/staging/emxx_udc/emxx_udc.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/emxx_udc/emxx_udc.c b/drivers/staging/emxx_udc/emxx_udc.c
> index 741147a4f0fe..8364316c1d25 100644
> --- a/drivers/staging/emxx_udc/emxx_udc.c
> +++ b/drivers/staging/emxx_udc/emxx_udc.c
> @@ -1073,8 +1073,8 @@ static int _nbu2ss_epn_in_pio(struct nbu2ss_udc *udc, struct nbu2ss_ep *ep,
>  		i_word_length = length / sizeof(u32);
>  		if (i_word_length > 0) {
>  			for (i = 0; i < i_word_length; i++) {
> -				_nbu2ss_writel(
> -					&preg->EP_REGS[ep->epnum - 1].EP_WRITE,
> +				_nbu2ss_writel(&preg->EP_REGS[ep->epnum - 1]
> +					.EP_WRITE,

Please don't break the line at ".", that makes this really hard to
follow.

thanks,

greg k-h
