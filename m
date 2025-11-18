Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3B935CB74
	for <linux-staging@lists.linux.dev>; Tue, 18 Nov 2025 15:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763481476; cv=none; b=b9pBLMXotcqoy4QKY4kpz5/gDe4xHGtUMZrgT6erqZ6YhuOhtbZn2ZQOBaOG6LyfEcfz45qJdXkLgMYgRdcMV8aXsXDQ+vnWt4Lxotr6hr/42hxJknRku5QgIhL4Ujq7GzCDHd/zffHYdWJ5E9TwWmV17gX4Uda4CoHyeEoWy48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763481476; c=relaxed/simple;
	bh=qsav7wQkapHfmZMjbDRPiYo993pEkEK2fWdFmwx4orc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pl/wCNVg1a7HDLb8GvGeJ60kII+af8KhKHSTFctwBfwSyPBhZfSy+augOS4SMxKwn9AekI5pK7f0TSbzSFlXOhrwaBOS4TdEliyVWk1jZvmE/PBw3ARFNessx/AyD2hEw0nwARB6ZzJIfsnP+wQ1RAlWPvv51vNfK6lbxdmkjiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z3jh9I/U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z3jh9I/U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE6DC2BCB4;
	Tue, 18 Nov 2025 15:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763481475;
	bh=qsav7wQkapHfmZMjbDRPiYo993pEkEK2fWdFmwx4orc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z3jh9I/U/hl0xU/MKejd/jCV6WVm/ssnhFbgkaG3iHMwoeIzQT22IemFKFuZk4rbY
	 6HzTHGwOUuL4Y/zqLwF6DLJKsL7aUlKnEbs435UX4YLmYqPrsOoGee+7Z9q8fRzGNy
	 lYYgDSw3Nn3yMYiRCOCtFyP+vuPT1tQ2WAOnuZeuG5IjMlujaAW3lGj0lRcbyEvkcM
	 2F1TK4rlNj84uXWWasjks0gh/8789iOQMFDqZN4NI5ezxCBjWmus1nmd4IZqgaB+92
	 efoikWQbjWe2Mnl0IR0yQHJDa49Dy2pMROmeknCWbDa4D0ATGaHFz43399mK2gFMPZ
	 jxOGahXGudTnQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vLO5Z-0000000036L-3lS5;
	Tue, 18 Nov 2025 16:57:53 +0100
Date: Tue, 18 Nov 2025 16:57:53 +0100
From: Johan Hovold <johan@kernel.org>
To: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Cc: gregkh@linuxfoundation.org, elder@kernel.org,
	linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org
Subject: Re: [PATCH 11/13] staging: greybus: uart: clear unsupported termios
 bits
Message-ID: <aRyXgd_8T3nndXl7@hovoldconsulting.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
 <20251117181818.118139-12-ayaanmirzabaig85@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117181818.118139-12-ayaanmirzabaig85@gmail.com>

On Mon, Nov 17, 2025 at 11:48:16PM +0530, Ayaan Mirza Baig wrote:
> The Greybus UART protocol supports only 8 data bits, no parity, one stop
> bit, and no hardware flow control.

Where did you get that from? Did you even look at the code you are
changing?

> Mask out unsupported termios flags
> before applying settings and force the supported configuration. This
> removes the old FIXME and aligns the driver with TTY subsystem
> expectations.

Please just leave the FIXMEs in place since you clearly do no understand
what you are doing.

> Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
> ---
>  drivers/staging/greybus/uart.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> index 10df5c37c83e..cc7337bf5088 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -495,8 +495,14 @@ static void gb_tty_set_termios(struct tty_struct *tty,
>  
>  	newline.data_bits = tty_get_char_size(termios->c_cflag);
>  
> -	/* FIXME: needs to clear unsupported bits in the termios */
> -	gb_tty->clocal = ((termios->c_cflag & CLOCAL) != 0);
> +	/* Mask out unsupported termios flags for Greybus UART */
> +	termios->c_cflag &= ~(CSIZE | CSTOPB | PARENB | PARODD |
> +				CRTSCTS | CMSPAR | CBAUD | CBAUDEX);
> +	termios->c_cflag |= CS8;	/* Force 8 data bits */
> +	termios->c_cflag &= ~PARENB;	/* No parity */
> +	termios->c_cflag &= ~CSTOPB;	/* One stop bit */
> +
> +	gb_tty->clocal = (termios->c_cflag & CLOCAL);

Johan
