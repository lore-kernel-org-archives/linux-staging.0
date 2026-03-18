Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857D12D5C6C;
	Wed, 18 Mar 2026 15:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773847846; cv=none; b=k1JEncLKXiGYAbOjUkd7L3Ya2irmP9gVRpL7KyIxseE5GRSDX6J1p45E71J04O6KEPwGR6q+I1uyyrkPBjoJF69sXmIiB6UCiFwgkhwdhTGTjibzheFVO3uoDDDV93hSaevSKL+GsJ7bYtcnKR8E+3bzbnXutMXNLYExUuhbYi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773847846; c=relaxed/simple;
	bh=9zJlw4kpiIxtWq81fKqJ3Q0XaQlUBR8C97QCmbBYBb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K60i7HXEJI37rJVSc/XJ2FyFIpEr3EZN2qL38/i1MVVb4OcO1G8DivAfJSI4OvP+BA6qRJkeog+eQc4ijxIfK3p8R5Jf9souURFsZvUqcy2ybrza6K6akICyfYEbcv+Oh1ld+hPfrICUrih5gs5I2RUwW9siDULOi7cuSy1Opms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=H+3Anku+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="H+3Anku+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD66BC19421;
	Wed, 18 Mar 2026 15:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773847846;
	bh=9zJlw4kpiIxtWq81fKqJ3Q0XaQlUBR8C97QCmbBYBb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H+3Anku+i6N8mgnK/6X5nPhWDLtTP6emUkH+/HoatmUlfy5SLMqWOnrS1pS1YtYS0
	 BkASBaAF/NX+b1FL7NiQe3k+qAreS4uOZ414ViJ4pUTb+JiOvnECdk25O3m/6eFi4S
	 xCDIcvduCAwe94hfjRpFfnJQ8FzKVCeEujUGyUuc=
Date: Wed, 18 Mar 2026 16:30:41 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Rahul Joshi <rj5547884@gmail.com>
Cc: rmfrfs@gmail.com, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: gpio: add comment to mutex definition
Message-ID: <2026031856-dormitory-chamber-91d5@gregkh>
References: <20260311175334.464391-1-rj5547884@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311175334.464391-1-rj5547884@gmail.com>

On Wed, Mar 11, 2026 at 11:23:34PM +0530, Rahul Joshi wrote:
> The irq_lock mutex is missing a comment describing what it protects,
> which is required by kernel coding style. Add a comment clarifying
> that it serializes IRQ bus lock/unlock operations used to defer and
> sync pending IRQ type and mask changes to hardware.
> 
> Signed-off-by: Rahul Joshi <rj5547884@gmail.com>
> ---
>  drivers/staging/greybus/gpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
> index 12185f7a982c..89c15b804b2a 100644
> --- a/drivers/staging/greybus/gpio.c
> +++ b/drivers/staging/greybus/gpio.c
> @@ -39,7 +39,7 @@ struct gb_gpio_controller {
>  
>  	struct gpio_chip	chip;
>  	struct irq_chip		irqc;
> -	struct mutex		irq_lock;
> +	struct mutex		irq_lock;	/* protects irq bus operations */

What is a "irq bus"?  This comment feels odd to me :(

thanks,

greg k-h
