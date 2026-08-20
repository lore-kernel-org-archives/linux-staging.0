Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50CD415B91;
	Thu, 20 Aug 2026 10:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787222809; cv=none; b=Hwv4o7R7bBVJdL6wagX2tkool1Zpp/z9aS74vtp/q7jMjhkDLuXD0PQOzHRyZ7Co6Ne0hZErkZXNRMFDzlF0xZ2mHCQUi++cd5nnPfTOndF+uoT7L9FosnfyIG1mUc4fpYOrvfPlwAPUeVP6x5CQeqibiRGSGmrgaTGvhdRDHTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787222809; c=relaxed/simple;
	bh=6CB64ckNgFtehemLflii4gzY4l6ZvScvBiDrEcb8NSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n51TlAVmh9U/9auwRD0L8OZe5dFikouSxULe497R545YQJiveCZ/0RkBmMsOw03zPGtGYWU3nP/avEyj3542WP6dvrt0M4WTNNMcYgxucxGcuQGYJweqwrFJcXcdqzFkdJ0MtyDbipqm96pQwPl/+iz6S/aVctcf24IAsafzuhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KMVpRQm/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KMVpRQm/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CC681F00A3A;
	Thu, 20 Aug 2026 10:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787222808;
	bh=frWcDGqSKkA5FYVpXCZec+lmUCNNQ/Q9hyZHiUd1M7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KMVpRQm/+PRKPjejO3AomjIDXOgdJ1t4Pm55fpxi3k9P9ZexoiY7zS7gv0Ih6Jtrl
	 F6vcGEwvHNGOtehOHfpixj84SEoH+5E2RKb8170FFBsn7f5MhSP49adIXKoo4QyVuS
	 +JrZC6hx33NqguoD4N32iEGLXtG4MOiWsbRFzv75hqrj608MP2LfsEBI31GxRn1bR5
	 udv51W17biLkziOWFDpIs01Zk21Lgumbwl3CprXD4yFRKzqBxT6QjqpFbwMzyW3aCa
	 pKcwi0XLZBIxGyQwiKM6gb275vQCQ+MeTP3f4nuQJV49uwz7SoFX9ESKi8ICmaHzuA
	 7s0Qaud3aMeMg==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wx0II-00000001can-046U;
	Thu, 20 Aug 2026 12:46:46 +0200
Date: Thu, 20 Aug 2026 12:46:46 +0200
From: Johan Hovold <johan@kernel.org>
To: singh.supreet14@gmail.com
Cc: Viresh Kumar <vireshk@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: spilib: Remove the local unused
Message-ID: <aobbFqlA31y0ilcM@hovoldconsulting.com>
References: <20260820103235.12306-1-singh.supreet14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820103235.12306-1-singh.supreet14@gmail.com>

On Thu, Aug 20, 2026 at 04:02:35PM +0530, singh.supreet14@gmail.com wrote:
> From: Supreet Singh <singh.supreet14@gmail.com>
> 
> The return value of spi_new_device() is only used to check whether
> device creation succeeded. Remove the unnecessary local variable and
> check the return value directly.
> 
> Signed-off-by: Supreet Singh <singh.supreet14@gmail.com>
> ---
>  drivers/staging/greybus/spilib.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
> index 39d5bf234c61..0e8711fdc429 100644
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
> @@ -480,8 +479,7 @@ static int gb_spi_setup_device(struct gb_spilib *spi, u8 cs)
>  	spi_board.chip_select	= cs;
>  	spi_board.max_speed_hz	= le32_to_cpu(response.max_speed_hz);
>  
> -	spidev = spi_new_device(ctlr, &spi_board);
> -	if (!spidev)
> +	if (!spi_new_device(ctlr, &spi_board))
>  		return -EINVAL;

No, this change just makes the code harder to read.

Johan
