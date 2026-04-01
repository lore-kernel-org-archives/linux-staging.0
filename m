Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCE53E0253;
	Wed,  1 Apr 2026 10:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775038153; cv=none; b=czaVQAofL44iAYn76f9zET4f+ZcnldfL3KtgTdQTk/OuJC11A+2HGySWUv2azGDhHdZxeXSFGx596MKE8DwkAER5wFbWw7ntrXnZYevn3Jt0dxQcBxaPCBpLBWfbcjTZH93QWpaRWd5V6QIboHqwpjMkgqa2iHEFyUHx125NlLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775038153; c=relaxed/simple;
	bh=0Ya3E1B0yy1Zj0IB+c2hqFnKPX4ewrhreF9+QBp2beU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K3QxYgCsiVgRwlbepgnsokLgmnnT3TD0Bp7LBMLv346S9YyxLsqyhbKDrJgS5A9Yh0H/Q7zDCGBTpkCyW6kBz6OkXctdcaeoaiO8x35E/uuG+Vpp/q4F40TRDq+Go04YDhQmvTNJDKK05g4DriNXArz464ruP76Z/KKf6B2mL9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WPigaSn0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WPigaSn0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D35FC4CEF7;
	Wed,  1 Apr 2026 10:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775038151;
	bh=0Ya3E1B0yy1Zj0IB+c2hqFnKPX4ewrhreF9+QBp2beU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WPigaSn0fgdEomxkXzqxI94J+DEfzb5tTgG7Fi+uv7afNMuNuwt9/eBNXur/ivsWC
	 LRiAran2Y8yowj9Q2avDsN6H8lmz/Cc4kL5vNmkOjQMBETDtE/NJNI4ujbFGGrVt58
	 ZO1fxZzYboolQu7/IbKnCQMmwHejeoE5e9vtefEQ=
Date: Wed, 1 Apr 2026 12:09:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: AyushMukkanwar <ayushmukkanwar@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: octeon: ethernet-spi: replace pr_err
 with dev_err
Message-ID: <2026040136-cruncher-massive-992f@gregkh>
References: <2026033119-endpoint-jimmy-6b83@gregkh>
 <20260331111757.110703-1-ayushmukkanwar@gmail.com>
 <20260331111757.110703-2-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331111757.110703-2-ayushmukkanwar@gmail.com>

On Tue, Mar 31, 2026 at 04:47:56PM +0530, AyushMukkanwar wrote:
> Replace pr_err() calls with dev_err() to include device information
> in log messages. The device pointer is passed through the interrupt
> handler via dev_id, which is changed from &number_spi_ports to
> dev->dev.parent in request_irq and free_irq.
> 
> Signed-off-by: AyushMukkanwar <ayushmukkanwar@gmail.com>
> ---
>  drivers/staging/octeon/ethernet-spi.c | 59 ++++++++++++++-------------
>  1 file changed, 30 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/staging/octeon/ethernet-spi.c b/drivers/staging/octeon/ethernet-spi.c
> index 699c98c5ec13..8c02920c3cdc 100644
> --- a/drivers/staging/octeon/ethernet-spi.c
> +++ b/drivers/staging/octeon/ethernet-spi.c
> @@ -17,67 +17,67 @@
>  static int number_spi_ports;
>  static int need_retrain[2] = { 0, 0 };
>  
> -static void cvm_oct_spxx_int_pr(union cvmx_spxx_int_reg spx_int_reg, int index)
> +static void cvm_oct_spxx_int_pr(union cvmx_spxx_int_reg spx_int_reg, int index, struct device *dev)

This is ok, but this, but usually the pointer is the first argument.
And shouldn't this be a netdev (see below...)

> @@ -107,14 +107,15 @@ static irqreturn_t cvm_oct_spi_rml_interrupt(int cpl, void *dev_id)
>  {
>  	irqreturn_t return_status = IRQ_NONE;
>  	union cvmx_npi_rsl_int_blocks rsl_int_blocks;
> +	struct device *dev = dev_id;

This isn't ok, the function prototype should really be a pointer, not a
void thing.

> @@ -196,7 +197,7 @@ int cvm_oct_spi_init(struct net_device *dev)
>  
>  	if (number_spi_ports == 0) {
>  		r = request_irq(OCTEON_IRQ_RML, cvm_oct_spi_rml_interrupt,
> -				IRQF_SHARED, "SPI", &number_spi_ports);
> +				IRQF_SHARED, "SPI", dev->dev.parent);

Wait, no, you can't do anything with the parent!

This is a netdev, keep it a netdev.  Don't pass it "up" the device
heirchary to the device pointer, use the real netdev pointer instead.

Also, it seems you didn't test build your changes, what happened?

thanks,

greg k-h
