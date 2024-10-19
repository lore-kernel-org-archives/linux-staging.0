Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DFE1D1E89
	for <linux-staging@lists.linux.dev>; Sat, 19 Oct 2024 08:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729325109; cv=none; b=QuvaRqbokzi3jiZZzedAD8KW/4TqVgGka4Ez3iy6jxPonQMEDH19bvamhxQTxCYUn1P7NyrM+5n/N8ok/WH7xC+48usffhYpJ2m7Nne4pFCsEPErr4lPR8fcsyMk373vy1QxERvtQxVATo2fmfGvk5YBaxNYx47QSRgAZ8/c2IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729325109; c=relaxed/simple;
	bh=xvCZVsng+Rp6/XbjVKB49XgpG0iiDNl+KvgEBcirv18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qE9vvM6/K1wrclzMsoQ7iTNDoiCOK2vThCMsRGHUOaqJ21zChz56M8htQ7Ym3S/38NTMPYGiPWt0rJsJPxv04aCk39lMw/vtSC4pWzM1UHs8WTyUi18Iob8RyIl81E1ZK4B+m6BA7coZ/MM38GA3iY6ZocOblgfOMGebFy3w4lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AgsShzxs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AgsShzxs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDBB5C4CEC5;
	Sat, 19 Oct 2024 08:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729325109;
	bh=xvCZVsng+Rp6/XbjVKB49XgpG0iiDNl+KvgEBcirv18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AgsShzxsQVo+bKToMhxeY+Slf9pO6wl90WY3KjKitwUXcxx/rZ60FJpZLLu6ruH2Z
	 n+Q1m58t/J68GaOeu8KpMcWN1lBqtcdEEXDNJovbCtLUqZ6M6oNOZIxMYUrADdnb9F
	 QVcRsAgnXqMsdXpCJlhqgyK83bKsoedgPOcUPEXg=
Date: Sat, 19 Oct 2024 09:59:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kees Bakker <kees@ijzerbout.nl>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Linux Staging <linux-staging@lists.linux.dev>
Subject: Re: [PATCH] staging: gpib: Change return type of
 fluke_get_dma_residue
Message-ID: <2024101940-elective-aviator-baf6@gregkh>
References: <20241017181504.1346F18DAF2@bout3.ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017181504.1346F18DAF2@bout3.ijzerbout.nl>

On Tue, Oct 15, 2024 at 10:33:30PM +0200, Kees Bakker wrote:
> The function fluke_get_dma_residue returns an error as a negative value.
> So the return type must not be unsigned.
> 
> Signed-off-by: Kees Bakker <kees@ijzerbout.nl>
> ---
>  drivers/staging/gpib/eastwood/fluke_gpib.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
> index f9f149db222d..77bbe2b587b1 100644
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

Then why isn't residue an int?  Shouldn't that be also changed?

thanks,

greg k-h
