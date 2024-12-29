Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1970BAD5E;
	Sun, 29 Dec 2024 10:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735467643; cv=none; b=Tnp52pJ72qkh7Ivv97jEpmeQpowjK0Q0FG1pSbNkjU7+v1os8hzKnOy/OdgnWb0ZSn1G7vy5qWWT5Xm/XO+jfIcifOYzFnXhDfbJ7xoJ1bAwM0xvTNLhwtDSAzrLQw1ZlUWQKLGYIdL0yW2e+XvETofxNicjbXqm2gqGCutD8+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735467643; c=relaxed/simple;
	bh=GgARDfEWVShxoHm2ukGgWpWd2WGh79IIzGMKY37Fgm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iSZyEwIM87/THzVXnEHkYUhVgTAcb4/GTo3yctD9Ta4tsOl9/11nABeHdlyViPO/PSi4dVYRvSyLk8SVSGl2ZYfyqdglIMqUpyAQBPzH7l7KefpPKTw/9E+nuLg/Hrra3pqyIDkycDm3GdPu9hQDyvbCggujkWCDijL1vS+6wFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RwY5z9m4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RwY5z9m4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0591EC4CED1;
	Sun, 29 Dec 2024 10:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735467642;
	bh=GgARDfEWVShxoHm2ukGgWpWd2WGh79IIzGMKY37Fgm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RwY5z9m4VDwsNNAWJWLniH8Zjg3iYLgFSjlSb61bgjvlzqvTpHO8JBOtSL5l4qMz0
	 8aHmC61VxYp9wcrWn4qRf3ea0E5t7YftNFJE+l3sKgctLwcLCkEiyNhxDEwU2mvzOT
	 PrB++XNuhOybk4CJNQiJUrPx0sSgBHPGD8QPg2DU=
Date: Sun, 29 Dec 2024 11:19:55 +0100
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Steven Davis <goldside000@outlook.com>
Cc: "johan@kernel.org" <johan@kernel.org>,
	"elder@kernel.org" <elder@kernel.org>,
	"greybus-dev@lists.linaro.dev" <greybus-dev@lists.linaro.dev>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: greybus: Log driver_register() failure
Message-ID: <2024122946-footer-neatness-aeb9@gregkh>
References: <20241228165720.16552-1-goldside000@outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241228165720.16552-1-goldside000@outlook.com>

On Sat, Dec 28, 2024 at 04:57:44PM +0000, Steven Davis wrote:
> Currently, if driver_register() fails, it just returns retval
> and fails silently. This behavior may make the error more difficult
> to debug, as the error is not logged.
> 
> Adding pr_err() here will log the error descriptively, along with
> driver name and the value that retval returned. That way, the error
> is not silent and the user can see what happened.
> 
> Signed-off-by: Steven Davis <goldside000@outlook.com>
> ---
>  drivers/staging/greybus/gbphy.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
> index 6adcad286..c6d1030b7 100644
> --- a/drivers/staging/greybus/gbphy.c
> +++ b/drivers/staging/greybus/gbphy.c
> @@ -204,8 +204,10 @@ int gb_gbphy_register_driver(struct gbphy_driver *driver,
>  	driver->driver.mod_name = mod_name;
>  
>  	retval = driver_register(&driver->driver);
> -	if (retval)
> +	if (retval) {
> +		pr_err("failed to register driver %s: %d\n", driver->name, retval);

Is this really an issue in real-world situations?  Have you run across
this where this failed and knowing the return value of driver_register()
helped out?

And if you are using this driver, great!  Let's get it cleaned up and
out of drivers/staging/ please!  Otherwise we really should just remove
them :(

thanks,

greg k-h
