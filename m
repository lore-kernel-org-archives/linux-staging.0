Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D85E367F4C;
	Mon,  2 Feb 2026 13:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770039406; cv=none; b=ihfyq3ChBwRLCgF0QcCnIvCiRF0GdhbnToiCLAdTRdFX9fTR0DSOq23mVNUmILyxJoXSsLe4jhZ7fvn9UiJ/5speA5FeojrEL0wxGVsNF+qElaSwmKruDnF9zAiupNsrwq7Iq2I+nN4z+p9w2FRyGhrPIga60m6bxmq0svK9gMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770039406; c=relaxed/simple;
	bh=sy9PfxwNWKTVFif477+U4zwsYpPza4N9CdgbsSZOSqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u9mTN1qCBllTD3N6BzcUOUesF1utxcP7RcBzQaaN+foWhPjZmZfqA56a+fBvriFA0sjKGCBJuNuPxY1zjmh+SCg4sIfuDh8KmPX00CrulDMmU47szgSofrDI7z0+eAmg9B4cEUfKZxP+rQ3MEPPB0mFA9KziGoTPgIPPNXgeyaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WiPVz1aF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WiPVz1aF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 623A5C2BC9E;
	Mon,  2 Feb 2026 13:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770039405;
	bh=sy9PfxwNWKTVFif477+U4zwsYpPza4N9CdgbsSZOSqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WiPVz1aFTBcuFgWdeQd4oh6mjpYIrK0WBL+fIsW/a5db8dLDRmbT2fI6XDlfi5qlL
	 Qm5hAFNXfWdxA2azI/vVyujkN3QmgH8+3Tdm8ebDlATvbzayhBBMA/9wgluRRsjnUB
	 uHNSVUHlMYzqp+VLYnNFUt8FfuIGO6WK3rv1n95w=
Date: Mon, 2 Feb 2026 14:36:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Cc: dan.carpenter@linaro.org, ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] staging: axis-fifo: refactor device tree parsing
Message-ID: <2026020220-attitude-unnerve-21ff@gregkh>
References: <20260202122317.13821-1-gustavopiazdasilva2102@gmail.com>
 <20260202122317.13821-3-gustavopiazdasilva2102@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202122317.13821-3-gustavopiazdasilva2102@gmail.com>

On Mon, Feb 02, 2026 at 09:23:17AM -0300, Gustavo Piaz da Silva wrote:
> Refactor the device tree parsing logic in axis_fifo_probe() to reduce
> code duplication and improve readability.
> 
> Create a helper function axis_fifo_get_u32() to handle property reading
> and error checking, replacing repetitive of_property_read_u32() calls.
> 
> This eliminates the goto logic for error handling in the probe path and
> consolidates error logging.
> 
> Signed-off-by: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
> 
> Changes in v4:
>  - Removed extra blank lines in the commit message.
>  - Added "rx" and "tx" prefixes to error messages to distinguish between read and write width failures.
> 
> Changes in v3:
>  - Split the original v2 patch into two separate patches.
>  drivers/staging/axis-fifo/axis-fifo.c | 77 +++++++++------------------
>  1 file changed, 25 insertions(+), 52 deletions(-)

You are missing a --- line after the signed-off-by :(

> +static int axis_fifo_parse_dt(struct axis_fifo *fifo)
> +{
> +	u32 width;
>  
> -	ret = of_property_read_u32(node, "xlnx,rx-fifo-depth",
> -				   &fifo->rx_fifo_depth);
> -	if (ret) {
> -		dev_err(fifo->dt_device, "missing xlnx,rx-fifo-depth property\n");
> -		ret = -EIO;
> -		goto end;
> +	if (axis_fifo_get_u32(fifo, "xlnx,axi-str-rxd-tdata-width", &width) || width != 32) {
> +		dev_err(fifo->dt_device, "rx tdata-width only supports 32 bits\n");
> +		return -EIO;
>  	}
> -
> -	ret = of_property_read_u32(node, "xlnx,tx-fifo-depth",
> -				   &fifo->tx_fifo_depth);
> -	if (ret) {
> -		dev_err(fifo->dt_device, "missing xlnx,tx-fifo-depth property\n");
> -		ret = -EIO;
> -		goto end;
> +	if (axis_fifo_get_u32(fifo, "xlnx,axi-str-txd-tdata-width", &width) || width != 32) {
> +		dev_err(fifo->dt_device, "tx tdata-width only supports 32 bits\n");

Now you have 2 errors printed out?

And really, the helper function isn't needed, just get rid of the
dev_err() lines, why would they be needed anymore?  No other driver uses
this type of error reporting that I have noticed.

Also, do you have this hardware to test this with?

thanks,

greg k-h
