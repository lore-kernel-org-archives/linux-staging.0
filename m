Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235441F190E;
	Tue,  7 Jan 2025 14:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736259989; cv=none; b=t2YkYh1EeQVBJbmS/yo+EFjoJU4sD0tDl7iivEPWYpewXU3p1+l1hPHnLP6RXR3ICQUaaamStE+vA1Hbzat+d0kFgp5ttgs9/dezkwTZ/qvn5axQWp4/l+DsdbmXTLwtIS3rk8eLFPQX1tqRn2Vy1Y7n2Z+IDSUtDn7Rtogbqxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736259989; c=relaxed/simple;
	bh=Qy0ug6f7SrZBtWMo1MrgBULpSDx0qZp95ipdghxX5kQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjuXAxnnaRYG8G2X5LE2ag7bj7CEQA97/aJeI5uLHJpLsLPrAy/oOPRNZxsEOUuG3VzVE6dzWa7n2P0ETqpSogQuIibnT9jWHsYmOhad8fSjhGmYkANQ1McqqpajP789n40wMWnXdCcNavwDBqMsc13IsuECprt3aobFC6P8D9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2Xi1HnFi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2Xi1HnFi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1994CC4CEDD;
	Tue,  7 Jan 2025 14:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736259988;
	bh=Qy0ug6f7SrZBtWMo1MrgBULpSDx0qZp95ipdghxX5kQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2Xi1HnFiqEo3iMoQI0l58LobNPqXuN/Q/2rNSTLkKhQ88b2ADJSSpvdDnG4uoQPgm
	 KMauV+sVzt1RfebD9Opq+AYsaxLgfzCIPY39U7pLYTKAbZZcuKMpbXEqjE3jtkJ460
	 GQ76qOUbd3AkcUGxd+4Gk9l2Bl3fwqB7m80IkyBo=
Date: Tue, 7 Jan 2025 15:26:25 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sandeep Salwan <salwansandeep5@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: Remove unnecessary parentheses in
 fbtft-core.c
Message-ID: <2025010738-gong-rewind-2583@gregkh>
References: <20250105174937.71423-1-salwansandeep5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250105174937.71423-1-salwansandeep5@gmail.com>

On Sun, Jan 05, 2025 at 12:49:37PM -0500, Sandeep Salwan wrote:
> This patch removes unnecessary parentheses around the conditional checks (!txbuflen) and (bpp > 8) in fbtft-core.c. According to the kernel coding style, reducing superfluous parentheses makes the code more readable and straightforward. There are no functional changes; it’s purely a cleanup to align the code with kernel style guidelines.

Please wrap your changelog at 72 columns like your editor asked you to.

> 
> Signed-off-by: Sandeep Salwan <salwansandeep5@gmail.com>
> ---
>  drivers/staging/fbtft/fbtft-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
> index 4cfa494243b9..b4e9d6000b9a 100644
> --- a/drivers/staging/fbtft/fbtft-core.c
> +++ b/drivers/staging/fbtft/fbtft-core.c
> @@ -664,7 +664,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
>  		txbuflen = 0;
>  
>  #ifdef __LITTLE_ENDIAN
> -	if ((!txbuflen) && (bpp > 8))
> +	if (!txbuflen && bpp > 8)

No, please see the zillions of times I have rejected changes like this
in the past on the mailing list.  checkpatch.pl is wrong here.

We write code for people first, compilers second.  With your change, now
you need to look up the order of operations (quick, which is comes first
in order, '&&' or '!' or '>')?

With the () there, you know what the intent is, and what the order is,
without having to always know what comes before what.

thanks,

greg k-h
