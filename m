Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AC8281503;
	Mon, 23 Feb 2026 14:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771855984; cv=none; b=daQrzJsZ7qjwn9Wcu4zXBNz0jefFH0KiapAOtTBzMXRUTscL7PLJIQLk2UVeey8wHHuJDlPJSabZCVAohkmusmD/O/l/Rp/dteCfnGYgHgTp5brPxUUfqRE1u7Z8TSSTr6eroTjk3sWg2Q/xQ+DWbFGMycuKYfqoQ/JP1Z5vGXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771855984; c=relaxed/simple;
	bh=Cd2b+yIMRAaY0Y1yjsjKjDkGs2urcMIrXlDyVWzht1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jnc4ua1I3wFvzYNVZ47w2LL5jKmh/dGIHWkTqmgPeCstlXmg4ZD98Uo3OpDb8EOLL9UNXkiz0YaYolbp4V3DSNxX59YOgXEcw+gCRrtrBghs0rxeekYSbqqilTwT85RQFRFSPp0dU33U6vI/sPF5p8ZRpczQtDwJ7jhZC7al2cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=f0Y6BqR6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="f0Y6BqR6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 618C9C19423;
	Mon, 23 Feb 2026 14:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771855983;
	bh=Cd2b+yIMRAaY0Y1yjsjKjDkGs2urcMIrXlDyVWzht1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f0Y6BqR6luCh3qBLXCRPmnmo1epUwmYdwVxn7G6wSZ9llVcUz8CIqYmv2qM+FuQjc
	 6zc9+MxQo6146I2ORPfVUWvdLWxrmjIk3/mEwTxYQzSPYq5C9i8ATneuQ1TJRj8mes
	 c7HnksAoB+mgBm9SA6genLWTOAtQM6zXhz8bB6ZA=
Date: Mon, 23 Feb 2026 15:12:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging : sm750fb : Fix typo in comment
Message-ID: <2026022335-flyable-slam-50de@gregkh>
References: <20260218085302.105282-2-giorgitchankvetadze1997@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218085302.105282-2-giorgitchankvetadze1997@gmail.com>

On Wed, Feb 18, 2026 at 12:53:03PM +0400, Giorgi Tchankvetadze wrote:
> Changed "programed" to "programmed"
> 
> Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
> ---
>  drivers/staging/sm750fb/ddk750_mode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
> index 3b25892af713..255cbfce847c 100644
> --- a/drivers/staging/sm750fb/ddk750_mode.c
> +++ b/drivers/staging/sm750fb/ddk750_mode.c
> @@ -74,7 +74,7 @@ display_control_adjust_SM750LE(struct mode_parameter *mode_param,
>  	return disp_control;
>  }
>  
> -/* only timing related registers will be  programed */
> +/* only timing related registers will be  programmed */

Why leave the two spaces here?

Also, you do not need the extra ' ' before the ':' in your subject line.

thanks,

greg k-h
