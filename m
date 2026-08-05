Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653E842CB02;
	Wed,  5 Aug 2026 11:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785929346; cv=none; b=QtVaMou0pFWMHNV/hAufvcXORhmSBQduppGMDuVbFw4FrPZtHNyNurCk3vRl0v9ykJj26T74XRL4C3be9Wy/ldYp65t0ZV62XS7E6L4j9WgxxNA5OLTEis6uxZERd0w9gt11YJWGRoZpU1twHDD1QTpMw9eFWoev48ovS5kKAPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785929346; c=relaxed/simple;
	bh=BpYl2LsQfl35GIpXb/F5bEnzvZTI6o+0PlDT1hymsnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9QMCYWpPM30sTfASIg7MgwPylxZe/Ffe60iC5tTr7/ON9N3d9iYe5LD38F7JeXxgN+ZfxqQqTneDQHtxln/cTRHTA6SVpH9hfYXe5AazKBxXQmKdDyBGpkxYQWg9DgKUF9czi8mfWWUq1bF53Vfsx7Pr25p/6emn9ZespANQoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uwWIZ3Wi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uwWIZ3Wi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 668881F000E9;
	Wed,  5 Aug 2026 11:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785929344;
	bh=3D65rZ06Pplk65ytzA202meJfE9P54rfwrmkgPwXI84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=uwWIZ3Wi5BXU7txy67Q14hTxpNLURUI+5XTPWbX5ABaTfQQ1+e3pg2+vOnwMwZfoM
	 5XKY23OdnY5MFOkJmJy/l5d7BU8yfjmA2EogwIv+8Y+MdRobKo/78P/r8C236mC/mf
	 oyiNG4J5ynLyoV933ziNOcVtOUwi5SrgFFUoEtqQ=
Date: Wed, 5 Aug 2026 13:28:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: singh.supreet14@gmail.com
Cc: Viresh Kumar <vireshk@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: spilib: Handle SPI device types with a
 switch statement
Message-ID: <2026080508-stifle-qualm-3dd7@gregkh>
References: <20260805111958.114209-1-singh.supreet14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805111958.114209-1-singh.supreet14@gmail.com>

On Wed, Aug 05, 2026 at 04:49:57PM +0530, singh.supreet14@gmail.com wrote:
> From: Supreet <singh.supreet14@gmail.com>

We need a full name please.


> 
> Replaced the if/else chain with switch statement. makes it easier to
> extend support for additional device types.
> 
> Remove the temporary spidev variable since it is only used to test the
> return value of spi_new_device(). Call spi_new_device() directly in
> the conditional instead.
> 
> checkpatch was run, had no warnings and errors.
> 
> Signed-off-by: Supreet <singh.supreet14@gmail.com>
> ---
>  drivers/staging/greybus/spilib.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
> index e4d1ae8308aa..53fc0c124754 100644
> --- a/drivers/staging/greybus/spilib.c
> +++ b/drivers/staging/greybus/spilib.c
> @@ -444,7 +444,6 @@ static int gb_spi_setup_device(struct gb_spilib *spi, u8 cs)
>  	struct gb_spi_device_config_request request;
>  	struct gb_spi_device_config_response response;
>  	struct spi_board_info spi_board = { {0} };
> -	struct spi_device *spidev;
>  	int ret;
>  	u8 dev_type;
>  
> @@ -458,25 +457,29 @@ static int gb_spi_setup_device(struct gb_spilib *spi, u8 cs)
>  
>  	dev_type = response.device_type;
>  
> -	if (dev_type == GB_SPI_SPI_DEV)
> +	switch (dev_type) {
> +	case GB_SPI_SPI_DEV:
>  		strscpy(spi_board.modalias, "spidev",
>  			sizeof(spi_board.modalias));
> -	else if (dev_type == GB_SPI_SPI_NOR)
> +		break;
> +	case GB_SPI_SPI_NOR:
>  		strscpy(spi_board.modalias, "spi-nor",
>  			sizeof(spi_board.modalias));
> -	else if (dev_type == GB_SPI_SPI_MODALIAS)
> +		break;
> +	case GB_SPI_SPI_MODALIAS:
>  		memcpy(spi_board.modalias, response.name,
> -		       sizeof(spi_board.modalias));
> -	else
> +		sizeof(spi_board.modalias));
> +		break;
> +	default:
>  		return -EINVAL;
> +	}
>  
>  	spi_board.mode		= le16_to_cpu(response.mode);
>  	spi_board.bus_num	= ctlr->bus_num;
>  	spi_board.chip_select	= cs;
>  	spi_board.max_speed_hz	= le32_to_cpu(response.max_speed_hz);
>  
> -	spidev = spi_new_device(ctlr, &spi_board);
> -	if (!spidev)
> +	if (!spi_new_device(ctlr, &spi_board))

Why was this change made?  It's a different one than the switch
statement, right?

thanks,

greg k-h
