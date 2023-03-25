Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FD81FA4;
	Sat, 25 Mar 2023 08:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E933AC433D2;
	Sat, 25 Mar 2023 08:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679734548;
	bh=7u5dawj2c2fO53iR4hy3wYysiDixPMrt/zLjhNT/b28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JdeBzSAmWOb5OtTKlnceOFbh0Y7xF0HS24UVpYblMZH5+h8P/7T1Tb0Oy2T3cN6NE
	 aIzasQ07PK0xoGUTeC1zCJ3ZIJbrykefNg8PDiszW07VZo9GxZJ2jnMD0HnCVGEvUk
	 mKZ/4yIoECOSSTRYLMiCSjgaQHrBt93SNO+OFYp8=
Date: Sat, 25 Mar 2023 09:55:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sumitra Sharma <sumitraartsy@gmail.com>
Cc: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] staging: greybus: Inline pwm_chip_to_gb_pwm_chip()
Message-ID: <ZB63EVLK6/29UUi0@kroah.com>
References: <cover.1679732179.git.sumitraartsy@gmail.com>
 <f1ef1b643840e74f211264dda0c590f8458618f6.1679732179.git.sumitraartsy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1ef1b643840e74f211264dda0c590f8458618f6.1679732179.git.sumitraartsy@gmail.com>

On Sat, Mar 25, 2023 at 01:31:10AM -0700, Sumitra Sharma wrote:
> Convert 'pwm_chip_to_gb_pwm_chip' from a macro to a static
> inline function, to make the relevant types apparent in the
> definition and to benefit from the type checking performed by
> the compiler at call sites.
> 
> Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> ---
>  drivers/staging/greybus/pwm.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
> index 3fda172239d2..88da1d796f13 100644
> --- a/drivers/staging/greybus/pwm.c
> +++ b/drivers/staging/greybus/pwm.c
> @@ -21,9 +21,11 @@ struct gb_pwm_chip {
>  	struct pwm_chip		chip;
>  	struct pwm_chip		*pwm;
>  };
> -#define pwm_chip_to_gb_pwm_chip(chip) \
> -	container_of(chip, struct gb_pwm_chip, chip)
>  
> +static inline struct gb_pwm_chip *pwm_chip_to_gb_pwm_chip(struct pwm_chip *chip)
> +{
> +	return container_of(chip, struct gb_pwm_chip, chip);
> +}
>  
>  static int gb_pwm_count_operation(struct gb_pwm_chip *pwmc)
>  {
> -- 
> 2.25.1
> 
> 

This patch didn't apply due to changes made in my tree by a patch from
someone else before yours.  Can you rebase it and resend?

thanks,

greg k-h
