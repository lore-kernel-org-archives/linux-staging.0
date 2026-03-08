Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A0827F73A;
	Sun,  8 Mar 2026 18:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772995516; cv=none; b=dP2OS+l3J5h/JiUtau2p+eW3568mrA+Kuu6vtCJxl0KaViDawNMMTGgXA/OW5vSnTlLqOVWFnUgNXh44XCHSTTpwzgRzWFt923NoQI7pCDYNTo4oTPD4UycgOxfgCNKwqF8QflJRQBX5pqqd/sjfCU8LaTv1/LJb3rfcI24+ci0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772995516; c=relaxed/simple;
	bh=zK8miggOkBwQHKjSQTUbtD1D5wrYBV5uJTJjl1ttJMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fucxaxuo7Bbevp/HVdG3DThYPe7c1KEd2zf0Du7FPn6grVpGC67eYhcaKerT/y7FRdOoG6OiqpLwB0K2Ww75Zl/Zr/3avZsFa/vF0wvQSlJ5gyyP/IVvockq2jL+3utiJd0+jbL2tYS0TaS/hRyikny73iyzcIM/q6STs3/H2lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LnA0dhFp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LnA0dhFp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B772FC116C6;
	Sun,  8 Mar 2026 18:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772995516;
	bh=zK8miggOkBwQHKjSQTUbtD1D5wrYBV5uJTJjl1ttJMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LnA0dhFpDR0odPp0NrZk9ONCOXmaW6xpb/Rp9KRrh+Z38T5jF7AncZ1sJb0keo6e8
	 f/fF8eEH9ACv+EGQgrYjspHf/ThH32xvKXHPpiDUB07QeROytIf/Fk7TQMJE52sP+i
	 HKU7Zxr+viPyuiwzNqfMPkVs7J8c8i6/FyRSxIF4=
Date: Sun, 8 Mar 2026 19:45:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mark Adamenko <marusik.adamenko@gmail.com>
Cc: linux-staging@lists.linux.dev, parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: dim2: replace BUG_ON() with error handling
Message-ID: <2026030857-lagging-emcee-95f9@gregkh>
References: <20260305020148.59842-1-marusik.adamenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305020148.59842-1-marusik.adamenko@gmail.com>

On Wed, Mar 04, 2026 at 06:01:48PM -0800, Mark Adamenko wrote:
> Replace BUG_ON() calls with error handling to avoid unnecessary kernel
> crashes.
> 
> Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
> ---
>  drivers/staging/most/dim2/dim2.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
> index 8d649d920433..cec9d19e1cde 100644
> --- a/drivers/staging/most/dim2/dim2.c
> +++ b/drivers/staging/most/dim2/dim2.c
> @@ -168,8 +168,10 @@ static int try_start_dim_transfer(struct hdm_channel *hdm_ch)
>  	unsigned long flags;
>  	struct dim_ch_state st;
>  
> -	BUG_ON(!hdm_ch);
> -	BUG_ON(!hdm_ch->is_initialized);
> +	if (!hdm_ch)
> +		return -EINVAL;

Can this ever happen?  If not, why is this even checked?  (hint, I do
not think it ever can)

> +	if (!hdm_ch->is_initialized)
> +		return -EINVAL;

Same here, are you sure this can happen?  And can the caller handle an
error?  At first glance, I do not think it can.  So be careful with
this.

You can't just blindly replace BUG_ON() with tests, please verify if
they are needed, and if so, how to handle the error correctly.

thanks,

greg k-h
