Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296671DD54C
	for <linux-staging@lists.linux.dev>; Thu,  7 Nov 2024 08:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730968486; cv=none; b=tkdfXJmTm+fCP+F2szoPKRUTBgbPtkvpDgJTPWF0zd5++oDn0f6IQuxuvp7K3Q4h35TBcHgYFdkrKpoI7aG49nYQno/EY3Th4FXY/AJHVCO+llTpefL1UF6u/ggzRR03yGGd2nylqREhVFsVSt7WLlNNtxWg9v1KGA9+s/IhmtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730968486; c=relaxed/simple;
	bh=rvzkUyfc0varfrtBfivBiKwL4mkG9raDr6bgG2zY/8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BUJWWrnSbzH+7DS3b3muiwgvuYu5Zpx8Q0QW02XUwRbI8tJMPuQhk0/ixFcufylpdU0R7m+ZbtRvYll2Y7cDgjCxFbGQHIG6PUcGR0MaQQn06FJG0d2Re3ZAjnEgmwLQw3+vUZhco3J5VpYDSYuA1l7BonOUjLBiAwxi0oxUZqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UHtPVJ6x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UHtPVJ6x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A1A8C4CED3;
	Thu,  7 Nov 2024 08:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730968486;
	bh=rvzkUyfc0varfrtBfivBiKwL4mkG9raDr6bgG2zY/8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UHtPVJ6xKdQ7pLVC7ne+2gC5r3C4602T3zDXGNNUJCvkCWwG4yKziDjJsu4NEHWiv
	 edoGybYSfhH1aHuVpOS+5XcDEJCnGAHSdJP8u34zfGh9IFKsrJK810YzFUkLGPoP+P
	 9AkWHg6bEWS8uWZG7i2NdsMgXPV/iIFNXqtW054c=
Date: Thu, 7 Nov 2024 09:25:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Kees Bakker <kees@ijzerbout.nl>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Linux Staging <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v3] staging: gpib: Change return type of
 fluke_get_dma_residue
Message-ID: <2024110714-scanner-apple-0792@gregkh>
References: <20241104193347.A0B5A18DD37@bout3.ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104193347.A0B5A18DD37@bout3.ijzerbout.nl>

On Tue, Oct 15, 2024 at 10:33:30PM +0200, Kees Bakker wrote:
> The function fluke_get_dma_residue returns an error as a negative value.
> So the return type must not be unsigned.
> 
> This was detected by Coverity, CID 1600782
> 
> Signed-off-by: Kees Bakker <kees@ijzerbout.nl>
> ---
>  v1 -> v2: change type of `residue` var; add note about Coverity CID in commit message
>  v2 -> v3: add version in the subject (sorry Greg)
> 
>  drivers/staging/gpib/eastwood/fluke_gpib.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
> index f9f149db222d..3843e986f104 100644
> --- a/drivers/staging/gpib/eastwood/fluke_gpib.c
> +++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
> @@ -536,7 +536,7 @@ static int fluke_accel_write(gpib_board_t *board, uint8_t *buffer, size_t length
>  	return 0;
>  }
>  
> -static unsigned int fluke_get_dma_residue(struct dma_chan *chan, dma_cookie_t cookie)
> +static int fluke_get_dma_residue(struct dma_chan *chan, dma_cookie_t cookie)
>  {
>  	struct dma_tx_state state;
>  	int result;
> @@ -549,7 +549,7 @@ static unsigned int fluke_get_dma_residue(struct dma_chan *chan, dma_cookie_t co
>  	dmaengine_tx_status(chan, cookie, &state);
>  	// hardware doesn't support resume, so dont call this
>  	// method unless the dma transfer is done.
> -	return state.residue;
> +	return (int)state.residue;

Shouldn't you be checking the result of dmaengine_tx_status instead?
residue is a u32 and is NOT an error here so I think the unsigned value
here is correct as that's not going to give you what you expect it to
give you.

thanks,

greg k-h
